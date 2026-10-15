//! Descriptor set layouts, descriptor pools, uniform buffer pooling and the
//! per-command-buffer scratch that owns them until the GPU is done.
//!
//! Port of the fixed resource layout of SDL_gpu_vulkan.c
//! (VULKAN_INTERNAL_FetchGraphicsPipelineResourceLayout and
//! VULKAN_INTERNAL_FetchComputePipelineResourceLayout). Set indices are fixed:
//!
//! - graphics: set 0 vertex read resources, set 1 vertex uniform buffers,
//!   set 2 fragment read resources, set 3 fragment uniform buffers;
//! - compute: set 0 read-only resources, set 1 read-write storage resources,
//!   set 2 uniform buffers.
//!
//! Within a "read" set, bindings are ordered: combined image samplers, then
//! read-only storage textures (as sampled images), then read-only storage
//! buffers. A "write" set holds storage images then storage buffers. Uniform
//! sets hold one dynamic uniform buffer per slot, so each push only changes a
//! dynamic offset and the set itself is reused.
//!
//! Caching: as SDL's FetchDescriptorSetLayout, set layouts are kept in a device
//! hash table keyed by `SetSpec` and pipeline layouts in a second table keyed by the
//! whole resource layout. Both are reference counted by the pipelines using them.
//!
//! Pools: each command buffer draws descriptor sets from pools it owns. A pool
//! holds `descriptor_sets_per_pool` sets; a full pool is replaced by a new one
//! and all pools return to the device free list when the submission that used
//! them completes (they are reset, not destroyed).

const std = @import("std");
const vk = @import("binding.zig");
const device_mod = @import("device.zig");

const Device = device_mod.Device;
const Error = device_mod.Error;
const Ref = device_mod.Ref;

/// Per-stage resource limits, the same values as SDL_sysgpu.h.
pub const max_samplers = 16;
pub const max_storage_textures = 8;
pub const max_storage_buffers = 8;
pub const max_uniform_buffers = 4;
pub const max_compute_write_textures = 8;
pub const max_compute_write_buffers = 8;
/// Size of one pooled uniform buffer (SDL's UNIFORM_BUFFER_SIZE).
pub const uniform_buffer_size: u32 = 32768;
/// Sets per descriptor pool before a new pool is started.
pub const descriptor_sets_per_pool = 256;

const max_bindings_per_set = max_samplers + max_storage_textures + max_storage_buffers + max_uniform_buffers;
const max_compute_write_bindings = max_compute_write_textures + max_compute_write_buffers;

/// A persistently mapped host-visible uniform buffer. Owned by the pool or by
/// the command buffer that acquired it.
pub const UniformBuffer = struct {
    buffer: vk.Handle,
    memory: vk.Handle,
    allocation: device_mod.MemoryAllocation,
    mapped: [*]u8,
};

/// Descriptor pools and uniform buffers one command buffer uses. They move to
/// the device free lists when the submission completes, or are destroyed when
/// the command buffer is aborted.
pub const Scratch = struct {
    /// Pools handed to this command buffer; the last one is current.
    pools: std.ArrayList(vk.Handle) = .empty,
    /// Uniform buffers filled by this command buffer.
    uniforms: std.ArrayList(UniformBuffer) = .empty,
    /// Backings this command buffer uses, keyed by address so each one counts
    /// once. Each entry holds one reference (SDL's referenceCount) that is
    /// dropped on release or abort.
    tracked: std.AutoArrayHashMapUnmanaged(usize, Ref) = .empty,
    /// Submitted baseline and private recording state for each retained backing.
    layouts: std.ArrayList(TextureLayouts) = .empty,
    /// Single-subresource storage image views owned until completion or abort.
    views: std.ArrayList(vk.Handle) = .empty,

    pub const TextureLayouts = struct {
        backing: *device_mod.TextureBacking,
        initial: []i32,
        current: []i32,
        /// Preallocated swapchain snapshots are inactive until their image is acquired.
        used: bool = true,
    };

    fn clear_layouts_and_views(self: *Scratch, dev: *Device) void {
        for (self.views.items) |view| dev.fns.vkDestroyImageView(dev.device, view, null);
        self.views.clearRetainingCapacity();
        for (self.layouts.items) |entry| {
            dev.allocator.free(entry.initial);
            dev.allocator.free(entry.current);
        }
        self.layouts.clearRetainingCapacity();
    }

    /// Returns the pools and buffers to `dev`'s free lists after the GPU has
    /// finished with them. Lists that cannot grow destroy their entries instead.
    pub fn release(self: *Scratch, dev: *Device) void {
        self.clear_layouts_and_views(dev);
        for (self.tracked.values()) |ref| device_mod.unref(dev, ref);
        self.tracked.clearRetainingCapacity();
        for (self.pools.items) |pool| {
            _ = vk.check(dev.fns.vkResetDescriptorPool(dev.device, pool, 0)) catch {
                dev.fns.vkDestroyDescriptorPool(dev.device, pool, null);
                continue;
            };
            dev.descriptor_pools_free.append(dev.allocator, pool) catch {
                dev.fns.vkDestroyDescriptorPool(dev.device, pool, null);
            };
        }
        for (self.uniforms.items) |buffer| {
            dev.uniform_buffers_free.append(dev.allocator, buffer) catch destroy_uniform_buffer(dev, buffer);
        }
        self.pools.clearRetainingCapacity();
        self.uniforms.clearRetainingCapacity();
    }

    /// Destroys everything without reuse. Used when a command buffer is aborted
    /// or the device is torn down.
    pub fn destroy(self: *Scratch, dev: *Device) void {
        self.clear_layouts_and_views(dev);
        for (self.tracked.values()) |ref| device_mod.unref(dev, ref);
        self.tracked.clearRetainingCapacity();
        for (self.pools.items) |pool| dev.fns.vkDestroyDescriptorPool(dev.device, pool, null);
        for (self.uniforms.items) |buffer| destroy_uniform_buffer(dev, buffer);
        self.pools.clearRetainingCapacity();
        self.uniforms.clearRetainingCapacity();
    }

    /// Frees the list storage. Call after `release` or `destroy`.
    pub fn deinit(self: *Scratch, allocator: std.mem.Allocator) void {
        self.pools.deinit(allocator);
        self.uniforms.deinit(allocator);
        self.tracked.deinit(allocator);
        self.layouts.deinit(allocator);
        self.views.deinit(allocator);
        self.* = .{};
    }
};

/// The bindings one shader stage group declares. Counts are per resource kind.
pub const SetSpec = struct {
    stages: vk.Flags,
    samplers: u32 = 0,
    read_textures: u32 = 0,
    read_buffers: u32 = 0,
    write_textures: u32 = 0,
    write_buffers: u32 = 0,
    uniforms: u32 = 0,
};

/// Creates a descriptor set layout with the SDL binding order described above.
/// Returns a handle owned by the caller; destroy it with `destroy_set_layout`
/// or retire it through the device.
pub fn create_set_layout(dev: *Device, spec: SetSpec) Error!vk.Handle {
    var bindings: [max_bindings_per_set + max_compute_write_bindings]vk.DescriptorSetLayoutBinding = undefined;
    var count: u32 = 0;
    count = push_bindings(&bindings, count, spec.samplers, vk.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, spec.stages);
    count = push_bindings(&bindings, count, spec.read_textures, vk.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE, spec.stages);
    count = push_bindings(&bindings, count, spec.read_buffers, vk.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, spec.stages);
    count = push_bindings(&bindings, count, spec.write_textures, vk.VK_DESCRIPTOR_TYPE_STORAGE_IMAGE, spec.stages);
    count = push_bindings(&bindings, count, spec.write_buffers, vk.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, spec.stages);
    count = push_bindings(&bindings, count, spec.uniforms, vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC, spec.stages);

    var info = std.mem.zeroes(vk.DescriptorSetLayoutCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO;
    info.bindingCount = count;
    info.pBindings = if (count > 0) &bindings else null;
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateDescriptorSetLayout(dev.device, &info, null, &handle));
    return handle;
}

fn push_bindings(list: []vk.DescriptorSetLayoutBinding, start: u32, n: u32, descriptor_type: i32, stages: vk.Flags) u32 {
    var i: u32 = 0;
    while (i < n) : (i += 1) {
        list[start + i] = .{
            .binding = start + i,
            .descriptorType = descriptor_type,
            .descriptorCount = 1,
            .stageFlags = stages,
            .pImmutableSamplers = null,
        };
    }
    return start + n;
}

/// Creates a pipeline layout over the given set layouts (in set-index order).
pub fn create_pipeline_layout(dev: *Device, sets: []const vk.Handle) Error!vk.Handle {
    var info = std.mem.zeroes(vk.PipelineLayoutCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
    info.setLayoutCount = @intCast(sets.len);
    info.pSetLayouts = if (sets.len > 0) sets.ptr else null;
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreatePipelineLayout(dev.device, &info, null, &handle));
    return handle;
}

/// Takes a pool from the free list or creates one, and records it in `scratch`
/// as the current pool.
pub fn start_pool(dev: *Device, scratch: *Scratch) Error!vk.Handle {
    try scratch.pools.ensureUnusedCapacity(dev.allocator, 1);
    const pool = if (dev.descriptor_pools_free.pop()) |free| free else try create_pool(dev);
    scratch.pools.appendAssumeCapacity(pool);
    return pool;
}

fn create_pool(dev: *Device) Error!vk.Handle {
    const sizes = [_]vk.DescriptorPoolSize{
        .{ .descriptorType = vk.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, .descriptorCount = descriptor_sets_per_pool * max_samplers },
        .{ .descriptorType = vk.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE, .descriptorCount = descriptor_sets_per_pool * max_storage_textures },
        .{ .descriptorType = vk.VK_DESCRIPTOR_TYPE_STORAGE_IMAGE, .descriptorCount = descriptor_sets_per_pool * max_compute_write_textures },
        .{ .descriptorType = vk.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, .descriptorCount = descriptor_sets_per_pool * max_compute_write_buffers },
        .{ .descriptorType = vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC, .descriptorCount = descriptor_sets_per_pool * max_uniform_buffers },
    };
    var info = std.mem.zeroes(vk.DescriptorPoolCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO;
    info.maxSets = descriptor_sets_per_pool;
    info.poolSizeCount = sizes.len;
    info.pPoolSizes = &sizes;
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateDescriptorPool(dev.device, &info, null, &handle));
    return handle;
}

/// Allocates one descriptor set with `layout` from the command buffer's current
/// pool, starting a new pool when the current one is exhausted.
pub fn allocate_set(dev: *Device, scratch: *Scratch, layout: vk.Handle) Error!vk.Handle {
    if (scratch.pools.items.len == 0) _ = try start_pool(dev, scratch);
    var attempt: u32 = 0;
    while (true) : (attempt += 1) {
        var layouts = [_]vk.Handle{layout};
        var info = std.mem.zeroes(vk.DescriptorSetAllocateInfo);
        info.sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
        info.descriptorPool = scratch.pools.items[scratch.pools.items.len - 1];
        info.descriptorSetCount = 1;
        info.pSetLayouts = &layouts;
        var set: vk.Handle = 0;
        const result = dev.fns.vkAllocateDescriptorSets(dev.device, &info, @ptrCast(&set));
        if (result == vk.VK_SUCCESS) return set;
        const exhausted = result == vk.VK_ERROR_OUT_OF_POOL_MEMORY or result == vk.VK_ERROR_FRAGMENTED_POOL;
        if (!exhausted or attempt > 0) _ = try vk.check(result);
        _ = try start_pool(dev, scratch);
    }
}

/// Creates a persistently mapped uniform buffer of `uniform_buffer_size` bytes.
pub fn create_uniform_buffer(dev: *Device) Error!UniformBuffer {
    var info = std.mem.zeroes(vk.BufferCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    info.size = uniform_buffer_size;
    info.usage = vk.VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT;
    info.sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE;
    var buffer: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateBuffer(dev.device, &info, null, &buffer));
    var allocation: ?device_mod.MemoryAllocation = null;
    var mapped = false;
    errdefer {
        if (mapped) dev.fns.vkUnmapMemory(dev.device, allocation.?.memory());
        dev.fns.vkDestroyBuffer(dev.device, buffer, null);
        if (allocation) |value| dev.release_memory(value);
    }

    var requirements: vk.MemoryRequirements = undefined;
    dev.fns.vkGetBufferMemoryRequirements(dev.device, buffer, &requirements);
    allocation = try dev.allocate_memory(requirements, .uniform_buffer, .buffer);
    const memory_allocation = allocation.?;
    const memory = memory_allocation.memory();
    _ = try vk.check(dev.fns.vkBindBufferMemory(dev.device, buffer, memory, memory_allocation.offset));

    var ptr: ?*anyopaque = null;
    _ = try vk.check(dev.fns.vkMapMemory(dev.device, memory, memory_allocation.offset, memory_allocation.size, 0, &ptr));
    mapped = true;
    const bytes: [*]u8 = @ptrCast(ptr orelse return error.MemoryMapFailed);
    return .{ .buffer = buffer, .memory = memory, .allocation = memory_allocation, .mapped = bytes };
}

/// Destroys a uniform buffer and its memory. Only for buffers no submission uses.
pub fn destroy_uniform_buffer(dev: *Device, buffer: UniformBuffer) void {
    dev.fns.vkUnmapMemory(dev.device, buffer.memory);
    dev.fns.vkDestroyBuffer(dev.device, buffer.buffer, null);
    dev.release_memory(buffer.allocation);
}

/// Returns a uniform buffer for a command buffer, reusing a free one when possible.
pub fn acquire_uniform_buffer(dev: *Device, scratch: *Scratch) Error!UniformBuffer {
    try scratch.uniforms.ensureUnusedCapacity(dev.allocator, 1);
    const buffer = if (dev.uniform_buffers_free.pop()) |free| free else try create_uniform_buffer(dev);
    scratch.uniforms.appendAssumeCapacity(buffer);
    return buffer;
}

// ---------------------------------------------------------------------------
// Layout caches
// ---------------------------------------------------------------------------

/// A cached descriptor set layout and the number of pipeline layouts (or
/// pipelines) that use it.
pub const SetLayoutEntry = struct {
    handle: vk.Handle,
    refs: u32,
};

/// The resource layout of a pipeline: one `SetSpec` per set index, in order.
/// Pipelines with equal keys share one pipeline layout.
pub const ResourceLayoutKey = struct {
    count: u8,
    specs: [4]SetSpec,
};

/// A cached pipeline layout with the set layouts it was built from.
pub const ResourceLayoutEntry = struct {
    layout: vk.Handle,
    sets: [4]vk.Handle,
    refs: u32,
};

/// Handles borrowed from the device caches for one pipeline. They stay valid
/// until the matching `release_resource_layout`.
pub const ResourceLayout = struct {
    key: ResourceLayoutKey,
    layout: vk.Handle,
    sets: [4]vk.Handle,
};

/// Returns the descriptor set layout for `spec`, creating it on a miss, and
/// takes one reference. Matches SDL's FetchDescriptorSetLayout hash table.
pub fn acquire_set_layout(dev: *Device, spec: SetSpec) Error!vk.Handle {
    if (dev.set_layouts.getPtr(spec)) |entry| {
        entry.refs += 1;
        return entry.handle;
    }
    const handle = try create_set_layout(dev, spec);
    errdefer dev.fns.vkDestroyDescriptorSetLayout(dev.device, handle, null);
    try dev.set_layouts.put(dev.allocator, spec, .{ .handle = handle, .refs = 1 });
    return handle;
}

/// Drops one reference to the set layout for `spec`; the last one retires it.
pub fn release_set_layout(dev: *Device, spec: SetSpec) void {
    const entry = dev.set_layouts.getPtr(spec) orelse return;
    entry.refs -= 1;
    if (entry.refs > 0) return;
    dev.retire(.{ .descriptor_set_layout = entry.handle });
    _ = dev.set_layouts.remove(spec);
}

/// Returns the pipeline layout and set layouts for `specs` (at most four), taking
/// one reference on the pipeline-layout entry. Misses create the set layouts
/// through `acquire_set_layout`, so layouts are shared across pipelines.
pub fn acquire_resource_layout(dev: *Device, specs: []const SetSpec) Error!ResourceLayout {
    std.debug.assert(specs.len <= 4);
    var key = ResourceLayoutKey{ .count = @intCast(specs.len), .specs = std.mem.zeroes([4]SetSpec) };
    @memcpy(key.specs[0..specs.len], specs);
    if (dev.resource_layouts.getPtr(key)) |entry| {
        entry.refs += 1;
        return .{ .key = key, .layout = entry.layout, .sets = entry.sets };
    }

    var sets = [_]vk.Handle{ 0, 0, 0, 0 };
    var acquired: usize = 0;
    errdefer for (specs[0..acquired]) |spec| release_set_layout(dev, spec);
    for (specs, 0..) |spec, i| {
        sets[i] = try acquire_set_layout(dev, spec);
        acquired += 1;
    }
    const layout = try create_pipeline_layout(dev, sets[0..specs.len]);
    errdefer dev.fns.vkDestroyPipelineLayout(dev.device, layout, null);
    try dev.resource_layouts.put(dev.allocator, key, .{ .layout = layout, .sets = sets, .refs = 1 });
    return .{ .key = key, .layout = layout, .sets = sets };
}

/// Drops one reference to a resource layout. The last one retires the pipeline
/// layout and releases its set layouts.
pub fn release_resource_layout(dev: *Device, key: ResourceLayoutKey) void {
    const entry = dev.resource_layouts.getPtr(key) orelse return;
    entry.refs -= 1;
    if (entry.refs > 0) return;
    dev.retire(.{ .pipeline_layout = entry.layout });
    for (key.specs[0..key.count]) |spec| release_set_layout(dev, spec);
    _ = dev.resource_layouts.remove(key);
}
