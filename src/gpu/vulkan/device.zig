//! Vulkan backend for the GPU API: device creation, memory, buffers, textures,
//! samplers, shaders, command submission with fences, and swapchains.
//!
//! Altered native port of SDL_gpu_vulkan.c foundations. The backend is built on
//! the private `binding.zig` loader (`libvulkan.so.1`, opened at runtime) and
//! exposes ordinary Zig values:
//!
//! - `Device.create` loads the loader, creates an instance, selects a physical
//!   device with SDL's ranking rules, creates the logical device and its queue,
//!   and returns a heap-allocated `*Device`. `Device.destroy` releases it.
//! - Resources (`Buffer`, `TransferBuffer`, `Texture`, `Sampler`, `Shader`,
//!   `Swapchain`) hold a `*Device` and are released with `deinit`. Releases are
//!   deferred until the GPU has finished every submission that could use them.
//! - `CommandBuffer` is a stack value: record, then `submit` or `submit_with_fence`.
//!   Submission presents the swapchain images acquired while recording, as SDL
//!   does at submit time.
//!
//! Threading: a `Device` and its command buffers are not thread-safe. SDL
//! serializes calls internally; zdl has no hidden threads or locks, so callers
//! that share a device must synchronize access themselves.
//!
//! Memory: each buffer, transfer buffer and texture backing receives a dedicated
//! `VkDeviceMemory`, chosen with SDL's four-tier property preference. SDL's
//! sub-allocator, defragmentation and free-region bookkeeping are not ported;
//! the trade-off is one driver allocation per resource (drivers cap these at
//! `maxMemoryAllocationCount`, commonly 4096).
//!
//! Cycling and lifetime: a `Buffer`, `TransferBuffer` or `Texture` is a handle to a
//! heap container holding one or more backings (SDL's VulkanBuffer and
//! VulkanTexture). Command buffers count the backings they use (`Ref`), and a
//! `cycle` write moves the container to an unreferenced backing or creates one.
//! Released backings wait until their last reference is dropped, so a handle
//! can be deinitialized while the GPU still reads its old contents. Textures track
//! the layout of every mip and layer (`TextureBacking.layouts`).
//!
//! Pipelines, passes, descriptors, uniform pools, blits, mipmaps, debug names
//! and window claiming live in sibling files (`pipeline.zig`, `pass.zig`,
//! `descriptors.zig`, `window.zig`, `debug.zig`) and are reached through the
//! aliases in `Device` and `CommandBuffer`. Not yet ported: XR sessions and
//! SDL's sub-allocator. Surface creation stays with the
//! platform window code; this file receives the raw `VkSurfaceKHR` handle as a
//! `u64`.

const std = @import("std");
const types = @import("../types.zig");
const vk = @import("binding.zig");
const tables = @import("tables.zig");
const descriptors = @import("descriptors.zig");
const pass = @import("pass.zig");
const pipeline = @import("pipeline.zig");
const window = @import("window.zig");
const debug = @import("debug.zig");
const memory_ranges = @import("memory.zig");

/// Failures from device, resource and swapchain operations. Validation errors
/// come from `types.validate_texture_create_info`; `vk.Error` covers loader and
/// driver failures.
pub const Error = vk.Error || std.mem.Allocator.Error || types.ValidationError || error{
    /// All acquire semaphores belong to command buffers still recording.
    AcquireSlotsBusy,
    /// Submit or abort another recording before recording this texture again.
    TextureLayoutConflict,
    /// No physical device has a graphics queue that can present (when probed),
    /// swapchain and maintenance1 extensions, and the required hardware.
    NoSuitableDevice,
    NoMemoryType,
    InvalidSize,
    UnsupportedFormat,
    UnsupportedSampleCount,
    UnsupportedFeature,
    UnsupportedShaderFormat,
    InvalidShaderBytecode,
    UnsupportedComposition,
    UnsupportedPresentMode,
    /// The queue family cannot present to the surface.
    NotPresentable,
    /// The surface reports a zero extent (typically a minimized window); retry later.
    ZeroExtent,
    /// `VK_ERROR_OUT_OF_DATE_KHR`: the swapchain must be recreated.
    SwapchainOutOfDate,
    /// The same swapchain was acquired twice in one command buffer.
    AlreadyAcquired,
    /// More swapchains acquired in one command buffer than `max_acquires`.
    TooManyAcquires,
    /// `abort` was called after a swapchain image was acquired; the image's
    /// semaphore must be submitted.
    AcquiredNotSubmitted,
    OutOfRange,
    /// Copy regions in one buffer overlap, which `vkCmdCopyBuffer` forbids.
    OverlappingRegions,
    AlreadyMapped,
    NotMapped,
    InvalidFence,
    /// A pipeline's shader is not a vertex or fragment shader as its slot requires.
    WrongShaderStage,
    TooManyVertexBuffers,
    TooManyVertexAttributes,
    TooManyColorTargets,
    TooManyBindings,
    InvalidSlot,
    InvalidEntrypoint,
    /// A draw or dispatch ran without a bound pipeline.
    NoPipeline,
    /// A pass command ran outside a pass.
    NoActivePass,
    /// A pass began while another pass was open on the command buffer.
    PassActive,
    /// A render pass began with no color or depth target.
    NoTargets,
    /// The resource lacks the usage flag the command requires.
    UnsupportedUsage,
    /// A descriptor slot the shader declares has no resource bound.
    MissingBinding,
    /// A storage texture is not in the layout its binding requires.
    InvalidTextureLayout,
    /// The pipeline's color target count differs from the render pass.
    PipelineTargetMismatch,
    /// Attachments of one render pass differ in size at their mip levels.
    TargetSizeMismatch,
    WindowAlreadyClaimed,
    WindowNotClaimed,
    MemoryMapFailed,
};

/// Device creation options. Defaults match SDL's Vulkan device properties.
pub const Options = struct {
    /// Enables `VK_LAYER_KHRONOS_validation` when installed and `VK_EXT_debug_utils`.
    debug_mode: bool = false,
    /// Ranks integrated GPUs above discrete ones and ignores VRAM size (SDL's low-power table).
    prefer_low_power: bool = false,
    /// Rejects CPU and "other" devices (SDL's `REQUIRE_HARDWARE_ACCELERATION`).
    require_hardware_acceleration: bool = false,
    /// Instance extensions the presentation path needs, such as `VK_KHR_surface`
    /// and one platform surface extension. Creation fails if one is missing.
    instance_extensions: []const [:0]const u8 = &.{},
    /// Handle of a `VkSurfaceKHR` on the target display, used to require that the
    /// selected queue family can present. Null skips the probe; the check then
    /// runs when a swapchain is created.
    probe_surface: ?u64 = null,
};

/// Device extensions this backend enables when the driver offers them.
/// `swapchain` and `maintenance1` are required for selection.
const DeviceExtensions = struct {
    swapchain: bool = false,
    maintenance1: bool = false,
    driver_properties: bool = false,
    portability_subset: bool = false,
    astc_hdr: bool = false,
};

/// Optional core features the backend enables when the device supports them.
const EnabledFeatures = struct {
    depth_clamp: bool = false,
    depth_bias_clamp: bool = false,
    independent_blend: bool = false,
    image_cube_array: bool = false,
    draw_indirect_first_instance: bool = false,
    sample_rate_shading: bool = false,
    shader_clip_distance: bool = false,
    fill_mode_non_solid: bool = false,
    multi_draw_indirect: bool = false,
    sampler_anisotropy: bool = false,
};

/// SDL's device-type priority tables (`GetDeviceRank`), indexed by
/// `VkPhysicalDeviceType`: other, integrated, discrete, virtual, CPU.
const priority_high_performance = [_]u8{ 0, 3, 4, 2, 1 };
const priority_low_power = [_]u8{ 0, 4, 3, 2, 1 };

/// Upper bound on swapchains acquired by one command buffer.
pub const max_acquires = 8;

/// Longest shader entry point name stored with a shader (SDL accepts any length;
/// Vulkan pipelines here store a fixed buffer).
pub const max_entrypoint_len = 63;

/// Work the GPU still owns, recorded for the fence that retires it.
const Submission = struct {
    seq: u64,
    fence: vk.Handle,
    command_buffer: vk.CommandBuffer,
    /// Descriptor pools and uniform buffers the submission reads; released when it completes.
    scratch: descriptors.Scratch = .{},
};

/// A resource whose release waits until the submission `seq` completes.
const Pending = struct {
    seq: u64,
    resource: Resource,
};

/// Vulkan objects destroyed by the deferred-release list.
pub const Resource = union(enum) {
    buffer: struct { handle: vk.Handle, allocation: MemoryAllocation },
    image: struct { handle: vk.Handle, view: vk.Handle, allocation: MemoryAllocation },
    image_view: vk.Handle,
    sampler: vk.Handle,
    shader: vk.Handle,
    framebuffer: vk.Handle,
    pipeline: vk.Handle,
    pipeline_layout: vk.Handle,
    descriptor_set_layout: vk.Handle,
};

/// Separates buffers from optimal-tiled images in a block so neighboring
/// bindings cannot violate `bufferImageGranularity` on devices that require it.
pub const MemoryKind = enum { buffer, image };

/// One Vulkan device-memory block and its currently free byte ranges.
pub const MemoryBlock = struct {
    memory: vk.Handle,
    size: u64,
    memory_type_index: u32,
    kind: MemoryKind,
    dedicated: bool,
    free: memory_ranges.FreeList,
};

/// A suballocation held by a Vulkan resource backing. The block pointer remains
/// stable until this allocation is released; resource release is deferred until
/// the last GPU submission that references it has completed.
pub const MemoryAllocation = struct {
    block: *MemoryBlock,
    offset: u64,
    size: u64,

    pub fn memory(self: MemoryAllocation) vk.Handle {
        return self.block.memory;
    }
};

const small_allocation_threshold: u64 = 2 * 1024 * 1024;
const small_block_size: u64 = 16 * 1024 * 1024;

/// Handle for a submitted command buffer. It is valid for waiting until the
/// device that produced it is destroyed.
pub const Fence = struct {
    seq: u64,
};

/// An open GPU device on the Vulkan backend. Allocate with `create`; the
/// pointer is stable for the device's lifetime, and resources keep it.
pub const Device = struct {
    allocator: std.mem.Allocator,
    library: vk.Library,
    instance: vk.Instance,
    instance_fns: vk.InstanceFns,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    fns: vk.DeviceFns,
    queue: vk.Queue,
    queue_family: u32,
    command_pool: vk.Handle,
    memory: vk.PhysicalDeviceMemoryProperties,
    /// Vulkan blocks, grouped by memory type and resource kind.
    memory_blocks: std.ArrayList(*MemoryBlock) = .empty,
    limits: vk.PhysicalDeviceLimits,
    name_buf: [256]u8,
    extensions: DeviceExtensions,
    features: EnabledFeatures,
    debug_mode: bool,
    prefer_low_power: bool,
    has_properties2: bool,

    /// Idle fences ready for the next submission.
    fences: std.ArrayList(vk.Handle) = .empty,
    /// Command buffers returned by completed submissions, ready to record.
    command_buffers: std.ArrayList(vk.CommandBuffer) = .empty,
    /// Submissions the GPU has not finished, oldest first.
    in_flight: std.ArrayList(Submission) = .empty,
    /// Released resources waiting for a submission to complete.
    pending: std.ArrayList(Pending) = .empty,
    /// Sequence number of the last submission, starting at 1 for the first one.
    submit_seq: u64 = 0,
    /// Every submission with `seq <= completed_seq` has finished on the GPU.
    completed_seq: u64 = 0,
    /// Descriptor pools whose sets are no longer in use, reset and ready to reuse.
    descriptor_pools_free: std.ArrayList(vk.Handle) = .empty,
    /// Uniform buffers no submission uses, ready for a command buffer.
    uniform_buffers_free: std.ArrayList(descriptors.UniformBuffer) = .empty,
    /// Render passes, keyed by attachment formats, samples and operations.
    render_pass_cache: std.ArrayList(pass.RenderPassEntry) = .empty,
    /// Framebuffers over attachment views, evicted when their images are released.
    framebuffer_cache: std.ArrayList(pass.FramebufferEntry) = .empty,
    /// Windows claimed by `claim_window`, each with its swapchain.
    claims: std.ArrayList(window.Claim) = .empty,
    /// Descriptor set layouts shared by every pipeline with the same binding counts,
    /// with the number of pipeline layouts that use each one (SDL's FetchDescriptorSetLayout).
    set_layouts: std.AutoHashMapUnmanaged(descriptors.SetSpec, descriptors.SetLayoutEntry) = .empty,
    /// Pipeline layouts shared by pipelines with the same resource layout.
    resource_layouts: std.AutoHashMapUnmanaged(descriptors.ResourceLayoutKey, descriptors.ResourceLayoutEntry) = .empty,

    /// Creates a graphics pipeline from typed shaders and state. See `pipeline.zig`.
    pub const create_graphics_pipeline = pipeline.create_graphics_pipeline;
    /// Creates a compute pipeline from SPIR-V. See `pipeline.zig`.
    pub const create_compute_pipeline = pipeline.create_compute_pipeline;
    /// Claims a presentation surface for swapchain rendering. See `window.zig`.
    pub const claim_window = window.claim_window;
    /// Releases a claimed surface's swapchain.
    pub const unclaim_window = window.unclaim_window;
    /// Format of a claimed surface's swapchain textures.
    pub const get_swapchain_texture_format = window.get_swapchain_texture_format;
    /// Attaches a debug name to a backend object through VK_EXT_debug_utils.
    pub const name_object = debug.name_object;

    /// Opens the loader, creates the instance and device, and returns a device
    /// allocated with `allocator`. Free it with `destroy`.
    pub fn create(allocator: std.mem.Allocator, options: Options) Error!*Device {
        var library = try vk.Library.open();
        errdefer library.close();

        var has_properties2 = false;
        const instance = try create_instance(allocator, &library, options, &has_properties2);
        const instance_fns = try library.load_instance(instance);
        errdefer instance_fns.vkDestroyInstance(instance, null);

        const selection = try select_physical_device(allocator, &instance_fns, instance, options, has_properties2);

        const enabled = try create_logical_device(&instance_fns, selection);
        const device_fns = try vk.Library.load_device(&instance_fns, enabled.device);
        errdefer device_fns.vkDestroyDevice(enabled.device, null);

        var queue: vk.Queue = null;
        device_fns.vkGetDeviceQueue(enabled.device, selection.queue_family, 0, &queue);

        var pool_info = std.mem.zeroes(vk.CommandPoolCreateInfo);
        pool_info.sType = vk.VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
        pool_info.flags = vk.VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
        pool_info.queueFamilyIndex = selection.queue_family;
        var command_pool: vk.Handle = 0;
        _ = try vk.check(device_fns.vkCreateCommandPool(enabled.device, &pool_info, null, &command_pool));
        errdefer device_fns.vkDestroyCommandPool(enabled.device, command_pool, null);

        var memory: vk.PhysicalDeviceMemoryProperties = undefined;
        instance_fns.vkGetPhysicalDeviceMemoryProperties(selection.physical_device, &memory);

        var props = std.mem.zeroes(vk.PhysicalDeviceProperties);
        instance_fns.vkGetPhysicalDeviceProperties(selection.physical_device, &props);

        const self = try allocator.create(Device);
        self.* = .{
            .allocator = allocator,
            .library = library,
            .instance = instance,
            .instance_fns = instance_fns,
            .physical_device = selection.physical_device,
            .device = enabled.device,
            .fns = device_fns,
            .queue = queue,
            .queue_family = selection.queue_family,
            .command_pool = command_pool,
            .memory = memory,
            .limits = props.limits,
            .name_buf = props.device_name,
            .extensions = selection.extensions,
            .features = enabled.features,
            .debug_mode = options.debug_mode,
            .prefer_low_power = options.prefer_low_power,
            .has_properties2 = has_properties2,
        };
        return self;
    }

    /// Waits for all submitted work, releases every pending resource, and frees
    /// the device, command pool, instance and loader.
    pub fn destroy(self: *Device) void {
        self.wait_idle() catch {};
        for (self.claims.items) |claim| {
            claim.swapchain.deinit();
            self.allocator.destroy(claim.swapchain);
        }
        self.claims.deinit(self.allocator);
        pass.destroy_caches(self);
        var layouts = self.resource_layouts.iterator();
        while (layouts.next()) |entry| self.fns.vkDestroyPipelineLayout(self.device, entry.value_ptr.layout, null);
        self.resource_layouts.deinit(self.allocator);
        var sets = self.set_layouts.iterator();
        while (sets.next()) |entry| self.fns.vkDestroyDescriptorSetLayout(self.device, entry.value_ptr.handle, null);
        self.set_layouts.deinit(self.allocator);
        self.framebuffer_cache.deinit(self.allocator);
        self.render_pass_cache.deinit(self.allocator);
        for (self.descriptor_pools_free.items) |pool| self.fns.vkDestroyDescriptorPool(self.device, pool, null);
        self.descriptor_pools_free.deinit(self.allocator);
        for (self.uniform_buffers_free.items) |buffer| descriptors.destroy_uniform_buffer(self, buffer);
        self.uniform_buffers_free.deinit(self.allocator);
        for (self.fences.items) |fence| self.fns.vkDestroyFence(self.device, fence, null);
        self.fences.deinit(self.allocator);
        self.command_buffers.deinit(self.allocator);
        self.in_flight.deinit(self.allocator);
        // The device is idle, so every deferred release is now safe.
        for (self.pending.items) |done| self.destroy_now(done.resource);
        self.pending.deinit(self.allocator);
        for (self.memory_blocks.items) |block| self.destroy_memory_block(block);
        self.memory_blocks.deinit(self.allocator);
        self.fns.vkDestroyCommandPool(self.device, self.command_pool, null);
        self.fns.vkDestroyDevice(self.device, null);
        self.instance_fns.vkDestroyInstance(self.instance, null);
        self.library.close();
        const allocator = self.allocator;
        allocator.destroy(self);
    }

    /// Driver name of the selected physical device, borrowed from the device.
    pub fn device_name(self: *const Device) []const u8 {
        return std.mem.sliceTo(&self.name_buf, 0);
    }

    /// Whether the device accepts `format` with `usage` for `texture_type`.
    /// Mirrors `SDL_GPUTextureSupportsFormat` with Vulkan's image format query
    /// (the compute-writable table is checked first, as SDL does).
    pub fn supports_texture_format(self: *Device, format: types.TextureFormat, texture_type: types.TextureType, usage: types.TextureUsage) bool {
        if (format == .invalid) return false;
        if (usage.any_storage_write() and !types.is_compute_writable(format)) return false;
        return self.image_format_supported(format, texture_type, usage);
    }

    /// Whether the color or depth framebuffer and image limits allow `count`
    /// samples for `format`, matching `SDL_GPUTextureSupportsSampleCount`.
    pub fn supports_sample_count(self: *const Device, format: types.TextureFormat, count: types.SampleCount) bool {
        const bits = if (types.is_depth_format(format))
            self.limits.framebufferDepthSampleCounts
        else
            self.limits.framebufferColorSampleCounts;
        return bits & tables.sample_count_bits[@backingInt(count)] != 0;
    }

    /// Whether `surface` supports `composition` with a preferred or fallback format.
    /// The surface must be on the device's display; this is a query only.
    pub fn supports_swapchain_composition(self: *Device, surface: u64, composition: types.SwapchainComposition) Error!bool {
        var support = try SurfaceSupport.query(self, surface);
        defer support.deinit(self.allocator);
        const index = @backingInt(composition);
        if (contains_format(support.formats, tables.composition_format[index], tables.composition_color_space[index])) return true;
        const fallback = tables.composition_fallback_format[index];
        return fallback != vk.VK_FORMAT_UNDEFINED and contains_format(support.formats, fallback, tables.composition_color_space[index]);
    }

    /// Whether `surface` supports `mode` (vsync, immediate or mailbox).
    pub fn supports_present_mode(self: *Device, surface: u64, mode: types.PresentMode) Error!bool {
        var support = try SurfaceSupport.query(self, surface);
        defer support.deinit(self.allocator);
        return std.mem.indexOfScalar(i32, support.present_modes, tables.present_mode[@backingInt(mode)]) != null;
    }

    /// Returns a command buffer in the recording state. Reuses a completed
    /// submission's buffer when one exists. Must be submitted or aborted.
    pub fn acquire_command_buffer(self: *Device) Error!CommandBuffer {
        try self.reap();
        // Reserve a recycle slot now so the error path above never grows the list.
        try self.command_buffers.ensureUnusedCapacity(self.allocator, 1);
        const handle = self.command_buffers.pop() orelse try self.allocate_command_buffer();
        var begin = std.mem.zeroes(vk.CommandBufferBeginInfo);
        begin.sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
        begin.flags = vk.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
        _ = vk.check(self.fns.vkBeginCommandBuffer(handle, &begin)) catch |err| {
            // The reserved slot below keeps the handle recyclable on this error path.
            self.command_buffers.appendAssumeCapacity(handle);
            return err;
        };
        return .{ .device = self, .handle = handle };
    }

    /// Blocks until every submission has finished, then releases pending resources.
    pub fn wait_idle(self: *Device) Error!void {
        _ = try vk.check(self.fns.vkDeviceWaitIdle(self.device));
        try self.reap();
    }

    /// Blocks until the submission behind `fence` finishes.
    pub fn wait_fence(self: *Device, fence: Fence) Error!void {
        if (fence.seq <= self.completed_seq) return;
        if (fence.seq > self.submit_seq) return error.InvalidFence;
        for (self.in_flight.items) |entry| {
            if (entry.seq != fence.seq) continue;
            var handles = [_]vk.Handle{entry.fence};
            _ = try vk.check(self.fns.vkWaitForFences(self.device, 1, &handles, vk.VK_TRUE, vk.VK_TIMEOUT_INFINITE));
            break;
        }
        try self.reap();
    }

    /// Whether the submission behind `fence` has finished, without blocking.
    pub fn is_fence_complete(self: *Device, fence: Fence) Error!bool {
        if (fence.seq > self.submit_seq) return error.InvalidFence;
        if (fence.seq > self.completed_seq) try self.reap();
        return fence.seq <= self.completed_seq;
    }

    // -----------------------------------------------------------------------
    // Buffers
    // -----------------------------------------------------------------------

    /// Creates a GPU-local buffer. Buffers always carry transfer usage so that the copy
    /// commands can read and write them.
    pub fn create_buffer(self: *Device, info: types.BufferCreateInfo) Error!Buffer {
        if (info.size == 0) return error.InvalidSize;
        const usage = buffer_usage_flags(info.usage);
        const backing = try create_buffer_backing(self, info.size, usage, .gpu_buffer);
        errdefer free_buffer_backing(self, backing);
        const container = try self.allocator.create(BufferContainer);
        errdefer self.allocator.destroy(container);
        container.* = .{ .size = info.size, .vk_usage = usage, .class = .gpu_buffer, .active = backing };
        try container.backings.append(self.allocator, backing);
        return .{ .device = self, .container = container, .size = info.size, .usage = info.usage };
    }

    /// Creates a host-visible staging buffer for uploads or downloads.
    pub fn create_transfer_buffer(self: *Device, info: types.TransferBufferCreateInfo) Error!TransferBuffer {
        if (info.size == 0) return error.InvalidSize;
        const transfer_usage: vk.Flags = vk.VK_BUFFER_USAGE_TRANSFER_SRC_BIT | vk.VK_BUFFER_USAGE_TRANSFER_DST_BIT;
        const backing = try create_buffer_backing(self, info.size, transfer_usage, .transfer_buffer);
        errdefer free_buffer_backing(self, backing);
        const container = try self.allocator.create(BufferContainer);
        errdefer self.allocator.destroy(container);
        container.* = .{ .size = info.size, .vk_usage = transfer_usage, .class = .transfer_buffer, .active = backing };
        try container.backings.append(self.allocator, backing);
        return .{
            .buffer = .{ .device = self, .container = container, .size = info.size, .usage = .none },
            .direction = info.usage,
        };
    }

    fn create_buffer_handle(self: *Device, size: u32, usage: vk.Flags) Error!vk.Handle {
        var info = std.mem.zeroes(vk.BufferCreateInfo);
        info.sType = vk.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
        info.size = size;
        info.usage = usage | vk.VK_BUFFER_USAGE_TRANSFER_SRC_BIT | vk.VK_BUFFER_USAGE_TRANSFER_DST_BIT;
        info.sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE;
        var handle: vk.Handle = 0;
        _ = try vk.check(self.fns.vkCreateBuffer(self.device, &info, null, &handle));
        return handle;
    }

    // -----------------------------------------------------------------------
    // Textures and samplers
    // -----------------------------------------------------------------------

    /// Creates a texture with a default view covering all mips and layers.
    /// Runs the structural checks of `SDL_CreateGPUTexture` and the device
    /// format and sample-count checks, then allocates device-local memory.
    /// Submits initialization of every subresource to its default layout, as SDL
    /// does, so even partially populated full-view sampled bindings are valid.
    pub fn create_texture(self: *Device, info: types.TextureCreateInfo) Error!Texture {
        if (info.texture_type == .cube_array and !self.features.image_cube_array) return error.UnsupportedFeature;
        try types.validate_texture_create_info(info);
        if (!self.supports_texture_format(info.format, info.texture_type, info.usage)) return error.UnsupportedFormat;
        if (!self.supports_sample_count(info.format, info.sample_count)) return error.UnsupportedSampleCount;

        const is_3d = info.texture_type == .@"3d";
        const layers: u32 = if (is_3d) 1 else info.layer_count_or_depth;
        const aspect = aspect_flags(info.format);
        const backing = try create_texture_backing(self, info, layers, aspect);
        errdefer release_texture_backing(self, backing);
        const container = try self.allocator.create(TextureContainer);
        errdefer self.allocator.destroy(container);
        container.* = .{ .info = info, .aspect = aspect, .layers = layers, .can_cycle = true, .active = backing };
        try container.backings.append(self.allocator, backing);
        errdefer container.backings.deinit(self.allocator);
        var texture = Texture{ .device = self, .container = container, .info = info, .aspect = aspect, .layers = layers };
        var initializer = try self.acquire_command_buffer();
        errdefer initializer.abort() catch {};
        try initializer.track_texture(&texture);
        initializer.transition(&texture, default_layout(info));
        try initializer.submit();
        return texture;
    }

    fn create_image_view(
        self: *Device,
        image: vk.Handle,
        texture_type: types.TextureType,
        vk_format: vk.Format,
        aspect: vk.Flags,
        levels: u32,
        layers: u32,
        swizzle: vk.ComponentMapping,
    ) Error!vk.Handle {
        var view_info = std.mem.zeroes(vk.ImageViewCreateInfo);
        view_info.sType = vk.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        view_info.image = image;
        view_info.viewType = switch (texture_type) {
            .@"2d" => vk.VK_IMAGE_VIEW_TYPE_2D,
            .@"2d_array" => vk.VK_IMAGE_VIEW_TYPE_2D_ARRAY,
            .@"3d" => vk.VK_IMAGE_VIEW_TYPE_3D,
            .cube => vk.VK_IMAGE_VIEW_TYPE_CUBE,
            .cube_array => vk.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY,
        };
        view_info.format = vk_format;
        view_info.components = swizzle;
        // Depth-stencil views sample only the depth aspect, as SDL does.
        view_info.subresourceRange = .{
            .aspectMask = aspect & ~vk.VK_IMAGE_ASPECT_STENCIL_BIT,
            .baseMipLevel = 0,
            .levelCount = levels,
            .baseArrayLayer = 0,
            .layerCount = layers,
        };
        var view: vk.Handle = 0;
        _ = try vk.check(self.fns.vkCreateImageView(self.device, &view_info, null, &view));
        return view;
    }

    /// Creates a sampler. Anisotropy requires the `samplerAnisotropy` feature,
    /// which this backend enables only when the device offers it.
    pub fn create_sampler(self: *Device, info: types.SamplerCreateInfo) Error!Sampler {
        if (info.enable_anisotropy and !self.features.sampler_anisotropy) return error.UnsupportedFeature;
        var sampler_info = std.mem.zeroes(vk.SamplerCreateInfo);
        sampler_info.sType = vk.VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO;
        sampler_info.magFilter = tables.filter[@backingInt(info.mag_filter)];
        sampler_info.minFilter = tables.filter[@backingInt(info.min_filter)];
        sampler_info.mipmapMode = tables.mipmap_mode[@backingInt(info.mipmap_mode)];
        sampler_info.addressModeU = tables.address_mode[@backingInt(info.address_mode_u)];
        sampler_info.addressModeV = tables.address_mode[@backingInt(info.address_mode_v)];
        sampler_info.addressModeW = tables.address_mode[@backingInt(info.address_mode_w)];
        sampler_info.mipLodBias = info.mip_lod_bias;
        sampler_info.anisotropyEnable = @intFromBool(info.enable_anisotropy);
        sampler_info.maxAnisotropy = info.max_anisotropy;
        sampler_info.compareEnable = @intFromBool(info.enable_compare);
        sampler_info.compareOp = tables.compare_op[@backingInt(info.compare_op)];
        sampler_info.minLod = info.min_lod;
        sampler_info.maxLod = info.max_lod;
        sampler_info.borderColor = vk.VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK;
        sampler_info.unnormalizedCoordinates = vk.VK_FALSE;
        var handle: vk.Handle = 0;
        _ = try vk.check(self.fns.vkCreateSampler(self.device, &sampler_info, null, &handle));
        errdefer self.fns.vkDestroySampler(self.device, handle, null);
        const backing = try self.create_object_backing(.{ .sampler = handle }, null);
        return .{ .device = self, .handle = handle, .backing = backing };
    }

    /// Owns a pipeline or sampler independently of its public value wrapper.
    pub fn create_object_backing(self: *Device, resource: Resource, layout: ?descriptors.ResourceLayoutKey) Error!*ObjectBacking {
        const backing = try self.allocator.create(ObjectBacking);
        backing.* = .{ .resource = resource, .layout = layout };
        return backing;
    }

    // -----------------------------------------------------------------------
    // Shaders
    // -----------------------------------------------------------------------

    /// Creates a shader module from SPIR-V bytes. The bytes are copied into a
    /// temporary word buffer, so `info.code` need not be 4-byte aligned. The
    /// SPIR-V magic word (0x07230203) is read as little-endian, the byte order
    /// of every host this backend targets.
    pub fn create_shader(self: *Device, info: types.ShaderCreateInfo) Error!Shader {
        if (!info.format.spirv) return error.UnsupportedShaderFormat;
        if (info.entrypoint.len == 0 or info.entrypoint.len > max_entrypoint_len) return error.InvalidEntrypoint;
        const handle = try create_module(self, info.code);
        var shader = Shader{
            .device = self,
            .handle = handle,
            .stage = info.stage,
            .entrypoint = std.mem.zeroes([max_entrypoint_len + 1:0]u8),
            .num_samplers = info.num_samplers,
            .num_storage_textures = info.num_storage_textures,
            .num_storage_buffers = info.num_storage_buffers,
            .num_uniform_buffers = info.num_uniform_buffers,
        };
        @memcpy(shader.entrypoint[0..info.entrypoint.len], info.entrypoint);
        return shader;
    }

    // -----------------------------------------------------------------------
    // Swapchain support queries
    // -----------------------------------------------------------------------

    fn image_format_supported(self: *Device, format: types.TextureFormat, texture_type: types.TextureType, usage: types.TextureUsage) bool {
        var vk_usage: vk.Flags = 0;
        if (usage.sampler) vk_usage |= vk.VK_IMAGE_USAGE_SAMPLED_BIT;
        if (usage.color_target) vk_usage |= vk.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
        if (usage.depth_stencil_target) vk_usage |= vk.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
        if (usage.graphics_storage_read or usage.compute_storage_read or usage.any_storage_write()) vk_usage |= vk.VK_IMAGE_USAGE_STORAGE_BIT;
        const cube = texture_type == .cube or texture_type == .cube_array;
        const create_flags: vk.Flags = if (cube) vk.VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT else 0;
        var properties: vk.ImageFormatProperties = undefined;
        const result = self.instance_fns.vkGetPhysicalDeviceImageFormatProperties(
            self.physical_device,
            tables.texture_format(format),
            if (texture_type == .@"3d") vk.VK_IMAGE_TYPE_3D else vk.VK_IMAGE_TYPE_2D,
            vk.VK_IMAGE_TILING_OPTIMAL,
            vk_usage,
            create_flags,
            &properties,
        );
        return result == vk.VK_SUCCESS;
    }

    fn allocate_command_buffer(self: *Device) Error!vk.CommandBuffer {
        var alloc_info = std.mem.zeroes(vk.CommandBufferAllocateInfo);
        alloc_info.sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
        alloc_info.commandPool = self.command_pool;
        alloc_info.level = vk.VK_COMMAND_BUFFER_LEVEL_PRIMARY;
        alloc_info.commandBufferCount = 1;
        var handles = [_]vk.CommandBuffer{null};
        _ = try vk.check(self.fns.vkAllocateCommandBuffers(self.device, &alloc_info, &handles));
        return handles[0];
    }

    /// Returns a fence in the unsignaled state, reusing an idle one when available.
    fn take_fence(self: *Device) Error!vk.Handle {
        if (self.fences.pop()) |fence| {
            var handles = [_]vk.Handle{fence};
            _ = try vk.check(self.fns.vkResetFences(self.device, 1, &handles));
            return fence;
        }
        var fence_info = std.mem.zeroes(vk.FenceCreateInfo);
        fence_info.sType = vk.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
        var handle: vk.Handle = 0;
        _ = try vk.check(self.fns.vkCreateFence(self.device, &fence_info, null, &handle));
        return handle;
    }

    // -----------------------------------------------------------------------
    // Memory selection and retirement
    // -----------------------------------------------------------------------

    /// Suballocates a Vulkan memory block using SDL's four-tier memory-type
    /// preference. Small resources share 16 MiB blocks; resources larger than
    /// SDL's 2 MiB small-allocation threshold receive their own allocation.
    /// Buffers and images use separate blocks to honor buffer-image granularity.
    pub fn allocate_memory(self: *Device, requirements: vk.MemoryRequirements, class: MemoryClass, kind: MemoryKind) Error!MemoryAllocation {
        const props = memory_properties(class);
        var candidates: [vk.VK_MAX_MEMORY_TYPES]u32 = undefined;
        const list = self.find_memory_types(requirements.memoryTypeBits, props, &candidates);
        if (list.len == 0) return error.NoMemoryType;
        const map_alignment: u64 = if (props.required & vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT != 0)
            @intCast(@max(self.limits.minMemoryMapAlignment, 1))
        else
            1;
        const alignment = @max(requirements.alignment, map_alignment);
        const dedicated = requirements.size > small_allocation_threshold;
        const block_size = if (dedicated) requirements.size else small_block_size;
        for (list) |index| {
            if (!dedicated) {
                for (self.memory_blocks.items) |block| {
                    if (block.dedicated or block.memory_type_index != index or block.kind != kind) continue;
                    const offset = try block.free.allocate(requirements.size, alignment) orelse continue;
                    return .{ .block = block, .offset = offset, .size = requirements.size };
                }
            }

            const block = self.create_memory_block(index, kind, block_size, dedicated) catch |err| switch (err) {
                error.OutOfDeviceMemory, error.OutOfHostMemory => continue,
                else => return err,
            };
            const offset = block.free.allocate(requirements.size, alignment) catch |err| {
                self.remove_memory_block(block);
                self.destroy_memory_block(block);
                return err;
            } orelse {
                self.remove_memory_block(block);
                self.destroy_memory_block(block);
                continue;
            };
            return .{ .block = block, .offset = offset, .size = requirements.size };
        }
        return error.OutOfDeviceMemory;
    }

    fn create_memory_block(self: *Device, memory_type_index: u32, kind: MemoryKind, size: u64, dedicated: bool) Error!*MemoryBlock {
        var info = std.mem.zeroes(vk.MemoryAllocateInfo);
        info.sType = vk.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
        info.allocationSize = size;
        info.memoryTypeIndex = memory_type_index;
        var handle: vk.Handle = 0;
        _ = try vk.check(self.fns.vkAllocateMemory(self.device, &info, null, &handle));
        errdefer self.fns.vkFreeMemory(self.device, handle, null);

        var free = try memory_ranges.FreeList.init(self.allocator, size);
        errdefer free.deinit();
        const block = try self.allocator.create(MemoryBlock);
        errdefer self.allocator.destroy(block);
        block.* = .{
            .memory = handle,
            .size = size,
            .memory_type_index = memory_type_index,
            .kind = kind,
            .dedicated = dedicated,
            .free = free,
        };
        try self.memory_blocks.append(self.allocator, block);
        return block;
    }

    /// Returns a resource range after its Vulkan object has been destroyed.
    /// An extra empty pooled block is released; one remains available for reuse.
    pub fn release_memory(self: *Device, allocation: MemoryAllocation) void {
        const block = allocation.block;
        block.free.release(allocation.offset, allocation.size);
        if (block.dedicated) {
            self.remove_memory_block(block);
            self.destroy_memory_block(block);
            return;
        }
        if (block.free.live_allocations != 0) return;
        for (self.memory_blocks.items) |other| {
            if (other == block or other.dedicated) continue;
            if (other.memory_type_index == block.memory_type_index and other.kind == block.kind and other.free.live_allocations == 0) {
                self.remove_memory_block(block);
                self.destroy_memory_block(block);
                return;
            }
        }
    }

    fn remove_memory_block(self: *Device, block: *MemoryBlock) void {
        for (self.memory_blocks.items, 0..) |candidate, index| {
            if (candidate == block) {
                _ = self.memory_blocks.swapRemove(index);
                return;
            }
        }
    }

    fn destroy_memory_block(self: *Device, block: *MemoryBlock) void {
        self.fns.vkFreeMemory(self.device, block.memory, null);
        block.free.deinit();
        self.allocator.destroy(block);
    }

    /// The four-pass SDL search: required+preferred+not-tolerable first, then
    /// required with no preference, then the tolerable variants. A type appears
    /// once, at its earliest tier. `typeFilter` is the requirement's bitmask.
    fn find_memory_types(self: *const Device, type_filter: u32, props: MemoryProps, out: *[vk.VK_MAX_MEMORY_TYPES]u32) []u32 {
        var count: usize = 0;
        const types_list = self.memory.memoryTypes[0..self.memory.memoryTypeCount];
        const tiers = [4]struct { preferred_all: bool, tolerable_none: bool }{
            .{ .preferred_all = true, .tolerable_none = true },
            .{ .preferred_all = false, .tolerable_none = true },
            .{ .preferred_all = true, .tolerable_none = false },
            .{ .preferred_all = false, .tolerable_none = false },
        };
        inline for (tiers) |tier| {
            for (types_list, 0..) |memory_type, i| {
                if (type_filter & (@as(u32, 1) << @intCast(i)) == 0) continue;
                const flags = memory_type.propertyFlags;
                if (flags & props.required != props.required) continue;
                const preferred_ok = if (tier.preferred_all)
                    flags & props.preferred == props.preferred
                else
                    flags & props.preferred == 0;
                if (!preferred_ok) continue;
                const tolerable_ok = if (tier.tolerable_none)
                    flags & props.tolerable == 0
                else
                    flags & props.tolerable == props.tolerable;
                if (!tolerable_ok) continue;
                const index: u32 = @intCast(i);
                if (std.mem.indexOfScalar(u32, out[0..count], index) != null) continue;
                out[count] = index;
                count += 1;
            }
        }
        return out[0..count];
    }

    /// Queues `resource` for destruction after the newest submission. Destroys
    /// it now when the GPU is already idle. If the pending list cannot grow, the
    /// device waits idle first, so release never fails.
    pub fn retire(self: *Device, resource: Resource) void {
        if (self.completed_seq >= self.submit_seq) {
            self.destroy_now(resource);
            return;
        }
        self.pending.append(self.allocator, .{ .seq = self.submit_seq, .resource = resource }) catch {
            self.wait_idle() catch {};
            self.destroy_now(resource);
        };
    }

    fn destroy_now(self: *Device, resource: Resource) void {
        switch (resource) {
            .buffer => |b| {
                self.fns.vkDestroyBuffer(self.device, b.handle, null);
                self.release_memory(b.allocation);
            },
            .image => |i| {
                if (i.view != 0) self.fns.vkDestroyImageView(self.device, i.view, null);
                self.fns.vkDestroyImage(self.device, i.handle, null);
                self.release_memory(i.allocation);
            },
            .image_view => |v| self.fns.vkDestroyImageView(self.device, v, null),
            .sampler => |s| self.fns.vkDestroySampler(self.device, s, null),
            .shader => |m| self.fns.vkDestroyShaderModule(self.device, m, null),
            .framebuffer => |f| self.fns.vkDestroyFramebuffer(self.device, f, null),
            .pipeline => |p| self.fns.vkDestroyPipeline(self.device, p, null),
            .pipeline_layout => |l| self.fns.vkDestroyPipelineLayout(self.device, l, null),
            .descriptor_set_layout => |l| self.fns.vkDestroyDescriptorSetLayout(self.device, l, null),
        }
    }

    /// Retires finished submissions in order, recycling their fences and
    /// command buffers, then destroys pending resources they were holding.
    fn reap(self: *Device) Error!void {
        while (self.in_flight.items.len > 0) {
            const entry = self.in_flight.items[0];
            const status = try vk.check(self.fns.vkGetFenceStatus(self.device, entry.fence));
            if (status != vk.VK_SUCCESS) break;
            try self.fences.ensureUnusedCapacity(self.allocator, 1);
            try self.command_buffers.ensureUnusedCapacity(self.allocator, 1);
            var finished = self.in_flight.orderedRemove(0);
            self.completed_seq = entry.seq;
            finished.scratch.release(self);
            finished.scratch.deinit(self.allocator);
            self.fences.appendAssumeCapacity(entry.fence);
            self.command_buffers.appendAssumeCapacity(entry.command_buffer);
        }
        var i: usize = 0;
        while (i < self.pending.items.len) {
            if (self.pending.items[i].seq <= self.completed_seq) {
                const done = self.pending.swapRemove(i);
                self.destroy_now(done.resource);
            } else {
                i += 1;
            }
        }
    }

    /// Blocks until `seq` completes. Submissions finish in order, so waiting on
    /// the matching fence is enough.
    fn wait_for_sequence(self: *Device, seq: u64) Error!void {
        if (seq <= self.completed_seq) return;
        try self.wait_fence(.{ .seq = seq });
    }
};

/// Creates a `VkShaderModule` from SPIR-V bytes. The bytes are copied into a
/// word-aligned buffer, so `code` need not be 4-byte aligned. The caller owns the
/// handle and destroys it with `vkDestroyShaderModule`.
pub fn create_module(dev: *Device, code: []const u8) Error!vk.Handle {
    if (code.len < 4 or code.len % 4 != 0) return error.InvalidShaderBytecode;
    if (std.mem.readInt(u32, code[0..4], .little) != 0x07230203) return error.InvalidShaderBytecode;
    const words = try dev.allocator.alloc(u32, code.len / 4);
    defer dev.allocator.free(words);
    @memcpy(std.mem.sliceAsBytes(words), code);

    var module_info = std.mem.zeroes(vk.ShaderModuleCreateInfo);
    module_info.sType = vk.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
    module_info.codeSize = code.len;
    module_info.pCode = words.ptr;
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateShaderModule(dev.device, &module_info, null, &handle));
    return handle;
}

/// Memory classes from SDL's `VULKAN_INTERNAL_BindMemoryForBuffer` and
/// `VULKAN_INTERNAL_BindMemoryForImage`: GPU-only buffers prefer device-local
/// memory; uniform buffers need host-visible memory and prefer device-local; transfer
/// buffers need host-visible coherent memory, prefer cached host memory, and tolerate
/// device-local memory on integrated GPUs; textures prefer device-local.
pub const MemoryClass = enum { gpu_buffer, uniform_buffer, transfer_buffer, texture };

const MemoryProps = struct { required: u32, preferred: u32, tolerable: u32 };

fn memory_properties(class: MemoryClass) MemoryProps {
    const host = vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT;
    return switch (class) {
        .gpu_buffer => .{ .required = 0, .preferred = vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, .tolerable = 0 },
        .uniform_buffer => .{ .required = host, .preferred = vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, .tolerable = 0 },
        .transfer_buffer => .{ .required = host, .preferred = vk.VK_MEMORY_PROPERTY_HOST_CACHED_BIT, .tolerable = vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT },
        .texture => .{ .required = 0, .preferred = vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, .tolerable = 0 },
    };
}

// ---------------------------------------------------------------------------
// Resources
// ---------------------------------------------------------------------------

/// Object that refers to a backing for reference counting. Command buffers hold
/// one count per backing they use (SDL's `referenceCount`).
pub const Ref = union(enum) {
    buffer: *BufferBacking,
    texture: *TextureBacking,
    object: *ObjectBacking,
};

/// Recording and submitted commands retain this allocation, including a pipeline
/// layout cache reference, after the caller releases its public wrapper.
pub const ObjectBacking = struct {
    resource: Resource,
    layout: ?descriptors.ResourceLayoutKey = null,
    refs: u32 = 0,
    orphaned: bool = false,
};

pub fn release_object(dev: *Device, backing: *ObjectBacking) void {
    backing.orphaned = true;
    if (backing.refs == 0) free_object(dev, backing);
}

fn free_object(dev: *Device, backing: *ObjectBacking) void {
    dev.retire(backing.resource);
    if (backing.layout) |key| descriptors.release_resource_layout(dev, key);
    dev.allocator.destroy(backing);
}

/// One `VkBuffer` and its memory: a backing that a `Buffer` switches between when
/// it is cycled. `refs` counts the command buffers, recording or in flight, that
/// use it. A backing with `refs > 0` is never written by a cycling write.
pub const BufferBacking = struct {
    handle: vk.Handle,
    allocation: MemoryAllocation,
    refs: u32 = 0,
    /// Set when the owning container was released while `refs` was positive;
    /// the last `unref` frees the backing.
    orphaned: bool = false,
};

/// Heap storage of a `Buffer` or `TransferBuffer`. The container owns every backing,
/// so the user's handle stays valid while cycling swaps the active backing.
pub const BufferContainer = struct {
    size: u32,
    /// Vulkan usage flags of every backing, before the transfer flags that
    /// `create_buffer_handle` adds.
    vk_usage: vk.Flags,
    class: MemoryClass,
    /// The backing that commands recorded now use.
    active: *BufferBacking,
    backings: std.ArrayList(*BufferBacking) = .empty,
};

/// A device buffer with dedicated memory per backing. Copies and bindings name the
/// buffer; a cycling write may move it onto a different backing.
pub const Buffer = struct {
    device: *Device,
    container: *BufferContainer,
    size: u32,
    usage: types.BufferUsage,

    /// The backing that commands recorded now will use.
    pub fn active(self: *const Buffer) *BufferBacking {
        return self.container.active;
    }

    /// Releases the buffer. Backings still used by command buffers are freed when
    /// their last reference goes away.
    pub fn deinit(self: *Buffer) void {
        release_buffer_container(self.device, self.container);
        self.* = undefined;
    }
};

/// A host-visible staging buffer. Map it for CPU access; the mapping is valid until
/// `unmap`. The caller must wait for the GPU before mapping data the GPU wrote.
pub const TransferBuffer = struct {
    buffer: Buffer,
    /// Upload buffers are written by the CPU and read by copies; download
    /// buffers receive copies and are read by the CPU.
    direction: types.TransferBufferUsage,
    mapped: bool = false,

    /// Maps the active backing. Same as `map_cycled(false)`.
    pub fn map(self: *TransferBuffer) Error![]u8 {
        return self.map_cycled(false);
    }

    /// Maps the transfer buffer. With `cycle`, a backing that recorded or in-flight
    /// commands still use is replaced by an unused one first, as
    /// `SDL_MapGPUTransferBuffer(cycle)` does. Fails with `AlreadyMapped` if mapped.
    pub fn map_cycled(self: *TransferBuffer, cycle: bool) Error![]u8 {
        if (self.mapped) return error.AlreadyMapped;
        const dev = self.buffer.device;
        if (cycle and self.buffer.active().refs > 0) try cycle_buffer(dev, self.buffer.container);
        var ptr: ?*anyopaque = null;
        const allocation = self.buffer.active().allocation;
        _ = try vk.check(dev.fns.vkMapMemory(dev.device, allocation.memory(), allocation.offset, allocation.size, 0, &ptr));
        self.mapped = true;
        const bytes: [*]u8 = @ptrCast(ptr orelse return error.MemoryMapFailed);
        return bytes[0..self.buffer.size];
    }

    pub fn unmap(self: *TransferBuffer) void {
        if (!self.mapped) return;
        self.buffer.device.fns.vkUnmapMemory(self.buffer.device.device, self.buffer.active().allocation.memory());
        self.mapped = false;
    }

    pub fn deinit(self: *TransferBuffer) void {
        self.unmap();
        self.buffer.deinit();
        self.* = undefined;
    }
};

/// One image with its default view. `layouts` holds the layout of every
/// subresource, so a copy to one mip leaves the others alone. Swapchain images
/// are non-owning backings whose image and memory belong to the swapchain.
pub const TextureBacking = struct {
    image: vk.Handle,
    view: vk.Handle,
    allocation: MemoryAllocation,
    /// Layout per subresource, indexed by `layer * num_levels + mip`.
    layouts: []i32,
    refs: u32 = 0,
    orphaned: bool = false,
    owned: bool,
};

/// Heap storage of a `Texture`: the active backing plus every backing created for it.
pub const TextureContainer = struct {
    info: types.TextureCreateInfo,
    aspect: vk.Flags,
    /// Array layers, or 1 for 3D textures.
    layers: u32,
    /// False for swapchain images, which are never cycled (SDL's `canBeCycled`).
    can_cycle: bool,
    active: *TextureBacking,
    backings: std.ArrayList(*TextureBacking) = .empty,
};

/// A device texture. Attachments and copies name it; a cycling write may move it
/// onto a different backing, with its contents discarded.
pub const Texture = struct {
    device: *Device,
    container: *TextureContainer,
    info: types.TextureCreateInfo,
    /// `VK_IMAGE_ASPECT_*` flags for copies and barriers.
    aspect: vk.Flags,
    /// Array layers, or 1 for 3D textures (their depth is in `info`).
    layers: u32,

    /// The backing that commands recorded now will use.
    pub fn active(self: *const Texture) *TextureBacking {
        return self.container.active;
    }

    pub fn width(self: *const Texture) u32 {
        return self.info.width;
    }

    pub fn height(self: *const Texture) u32 {
        return self.info.height;
    }

    /// The layout shared by every subresource, or null when they differ.
    /// Descriptor writes use this value; it is null if a subresource is mid-transition.
    pub fn uniform_layout(self: *const Texture) ?i32 {
        const layouts = self.active().layouts;
        const first = layouts[0];
        for (layouts[1..]) |layout| {
            if (layout != first) return null;
        }
        return first;
    }

    /// The layout read bindings use (SDL binds sampled and read-only storage
    /// textures in their default layout). Null when a subresource sits in a
    /// write-state or UNDEFINED layout. This describes submitted state only;
    /// recording code uses CommandBuffer.readable_texture_layout instead.
    pub fn readable_layout(self: *const Texture) ?i32 {
        const default = default_layout(self.info);
        for (self.active().layouts) |layout| {
            if (layout != default) return null;
        }
        return default;
    }

    /// Records the layout of one subresource after a pass or command moved it.
    pub fn set_subresource_layout(self: *const Texture, mip: u32, layer: u32, layout: i32) void {
        self.active().layouts[subresource_index(self.info.num_levels, layer, mip)] = layout;
    }

    /// Releases the texture once the GPU no longer uses any of its backings.
    pub fn deinit(self: *Texture) void {
        release_texture_container(self.device, self.container);
        self.* = undefined;
    }
};

fn subresource_index(levels: u32, layer: u32, mip: u32) usize {
    return @as(usize, layer) * levels + mip;
}

/// A sampler object.
pub const Sampler = struct {
    device: *Device,
    handle: vk.Handle,
    backing: *ObjectBacking,

    pub fn deinit(self: *Sampler) void {
        release_object(self.device, self.backing);
        self.* = undefined;
    }
};

/// A shader module built from SPIR-V. Graphics and compute pipelines reference it.
pub const Shader = struct {
    device: *Device,
    handle: vk.Handle,
    stage: types.ShaderStage,
    /// NUL-terminated entry point name, used as `pName` by pipelines.
    entrypoint: [max_entrypoint_len + 1:0]u8,
    num_samplers: u32,
    num_storage_textures: u32,
    num_storage_buffers: u32,
    num_uniform_buffers: u32,

    pub fn deinit(self: *Shader) void {
        self.device.retire(.{ .shader = self.handle });
        self.* = undefined;
    }
};

// ---------------------------------------------------------------------------
// Backing lifetime, reference counts and cycling
// ---------------------------------------------------------------------------

/// Drops one command-buffer reference to `ref`. A backing whose container is gone
/// and whose last reference this was gets freed.
pub fn unref(dev: *Device, ref: Ref) void {
    switch (ref) {
        .object => |o| {
            o.refs -= 1;
            if (o.refs == 0 and o.orphaned) free_object(dev, o);
        },
        .buffer => |b| {
            b.refs -= 1;
            if (b.refs == 0 and b.orphaned) free_buffer_backing(dev, b);
        },
        .texture => |t| {
            t.refs -= 1;
            if (t.refs == 0 and t.orphaned) free_texture_backing(dev, t);
        },
    }
}

fn create_buffer_backing(dev: *Device, size: u32, usage: vk.Flags, class: MemoryClass) Error!*BufferBacking {
    const handle = try dev.create_buffer_handle(size, usage);
    var allocation: ?MemoryAllocation = null;
    errdefer {
        dev.fns.vkDestroyBuffer(dev.device, handle, null);
        if (allocation) |value| dev.release_memory(value);
    }
    var requirements: vk.MemoryRequirements = undefined;
    dev.fns.vkGetBufferMemoryRequirements(dev.device, handle, &requirements);
    allocation = try dev.allocate_memory(requirements, class, .buffer);
    const memory = allocation.?;
    _ = try vk.check(dev.fns.vkBindBufferMemory(dev.device, handle, memory.memory(), memory.offset));
    const backing = try dev.allocator.create(BufferBacking);
    backing.* = .{ .handle = handle, .allocation = memory };
    return backing;
}

/// Frees a buffer backing that no container holds. Backings still used by command
/// buffers are kept until their last reference is dropped.
fn release_buffer_backing(dev: *Device, backing: *BufferBacking) void {
    if (backing.refs > 0) {
        backing.orphaned = true;
        return;
    }
    free_buffer_backing(dev, backing);
}

fn free_buffer_backing(dev: *Device, backing: *BufferBacking) void {
    dev.retire(.{ .buffer = .{ .handle = backing.handle, .allocation = backing.allocation } });
    dev.allocator.destroy(backing);
}

fn release_buffer_container(dev: *Device, container: *BufferContainer) void {
    for (container.backings.items) |backing| release_buffer_backing(dev, backing);
    container.backings.deinit(dev.allocator);
    dev.allocator.destroy(container);
}

/// SDL's VULKAN_INTERNAL_CycleActiveBuffer: makes an unreferenced backing active,
/// creating one when every backing is in use.
fn cycle_buffer(dev: *Device, container: *BufferContainer) Error!void {
    for (container.backings.items) |backing| {
        if (backing.refs == 0) {
            container.active = backing;
            return;
        }
    }
    const fresh = try create_buffer_backing(dev, container.size, container.vk_usage, container.class);
    errdefer free_buffer_backing(dev, fresh);
    try container.backings.append(dev.allocator, fresh);
    container.active = fresh;
}

fn create_texture_backing(dev: *Device, info: types.TextureCreateInfo, layers: u32, aspect: vk.Flags) Error!*TextureBacking {
    const is_3d = info.texture_type == .@"3d";
    const depth: u32 = if (is_3d) info.layer_count_or_depth else 1;

    var image_info = std.mem.zeroes(vk.ImageCreateInfo);
    image_info.sType = vk.VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    image_info.flags = switch (info.texture_type) {
        .cube, .cube_array => vk.VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT,
        .@"3d" => vk.VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT,
        else => 0,
    };
    image_info.imageType = if (is_3d) vk.VK_IMAGE_TYPE_3D else vk.VK_IMAGE_TYPE_2D;
    image_info.format = tables.texture_format(info.format);
    image_info.extent = .{ .width = info.width, .height = info.height, .depth = depth };
    image_info.mipLevels = info.num_levels;
    image_info.arrayLayers = layers;
    image_info.samples = tables.sample_count_bits[@backingInt(info.sample_count)];
    image_info.tiling = vk.VK_IMAGE_TILING_OPTIMAL;
    image_info.usage = image_usage_flags(info.usage);
    image_info.sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE;
    image_info.initialLayout = vk.VK_IMAGE_LAYOUT_UNDEFINED;

    var image: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateImage(dev.device, &image_info, null, &image));
    var allocation: ?MemoryAllocation = null;
    var view: ?vk.Handle = null;
    var layouts: ?[]i32 = null;
    errdefer {
        if (layouts) |values| dev.allocator.free(values);
        if (view) |handle| dev.fns.vkDestroyImageView(dev.device, handle, null);
        dev.fns.vkDestroyImage(dev.device, image, null);
        if (allocation) |value| dev.release_memory(value);
    }

    var requirements: vk.MemoryRequirements = undefined;
    dev.fns.vkGetImageMemoryRequirements(dev.device, image, &requirements);
    allocation = try dev.allocate_memory(requirements, .texture, .image);
    const memory = allocation.?;
    _ = try vk.check(dev.fns.vkBindImageMemory(dev.device, image, memory.memory(), memory.offset));

    view = try dev.create_image_view(image, info.texture_type, tables.texture_format(info.format), aspect, info.num_levels, layers, tables.format_swizzle(info.format));

    layouts = try dev.allocator.alloc(i32, @as(usize, info.num_levels) * layers);
    @memset(layouts.?, vk.VK_IMAGE_LAYOUT_UNDEFINED);

    const backing = try dev.allocator.create(TextureBacking);
    backing.* = .{ .image = image, .view = view.?, .allocation = memory, .layouts = layouts.?, .owned = true };
    return backing;
}

/// Frees a texture backing that no container holds, deferring until its
/// references are gone (see `release_buffer_backing`).
fn release_texture_backing(dev: *Device, backing: *TextureBacking) void {
    if (backing.refs > 0) {
        backing.orphaned = true;
        return;
    }
    free_texture_backing(dev, backing);
}

fn free_texture_backing(dev: *Device, backing: *TextureBacking) void {
    if (backing.owned) {
        pass.evict_image(dev, backing.image);
        dev.retire(.{ .image = .{ .handle = backing.image, .view = backing.view, .allocation = backing.allocation } });
    } else if (backing.view != 0) {
        dev.retire(.{ .image_view = backing.view });
    }
    dev.allocator.free(backing.layouts);
    dev.allocator.destroy(backing);
}

fn release_texture_container(dev: *Device, container: *TextureContainer) void {
    for (container.backings.items) |backing| release_texture_backing(dev, backing);
    container.backings.deinit(dev.allocator);
    dev.allocator.destroy(container);
}

/// Wraps a swapchain image in a non-owning texture. The image and view are
/// released by the swapchain's retirement, not by this texture's `deinit`
/// except for the view.
fn wrap_swapchain_image(dev: *Device, image: vk.Handle, view: vk.Handle, info: types.TextureCreateInfo) Error!Texture {
    const layouts = try dev.allocator.alloc(i32, 1);
    errdefer dev.allocator.free(layouts);
    layouts[0] = vk.VK_IMAGE_LAYOUT_UNDEFINED;
    const backing = try dev.allocator.create(TextureBacking);
    errdefer dev.allocator.destroy(backing);
    backing.* = .{ .image = image, .view = view, .allocation = undefined, .layouts = layouts, .owned = false };
    const container = try dev.allocator.create(TextureContainer);
    errdefer dev.allocator.destroy(container);
    container.* = .{ .info = info, .aspect = vk.VK_IMAGE_ASPECT_COLOR_BIT, .layers = 1, .can_cycle = false, .active = backing };
    try container.backings.append(dev.allocator, backing);
    return .{ .device = dev, .container = container, .info = info, .aspect = vk.VK_IMAGE_ASPECT_COLOR_BIT, .layers = 1 };
}

/// SDL's VULKAN_INTERNAL_CycleActiveTexture: switches the texture to an unreferenced
/// backing, creating one when all are in use, and moves every subresource of the
/// new backing to its default layout (SDL transitions fresh textures the same way).
fn cycle_texture(self: *CommandBuffer, texture: *Texture) Error!void {
    const dev = self.device;
    const container = texture.container;
    var chosen: ?*TextureBacking = null;
    for (container.backings.items) |backing| {
        if (backing.refs == 0) {
            chosen = backing;
            break;
        }
    }
    if (chosen) |backing| {
        container.active = backing;
    } else {
        const fresh = try create_texture_backing(dev, container.info, container.layers, container.aspect);
        errdefer free_texture_backing(dev, fresh);
        try container.backings.append(dev.allocator, fresh);
        container.active = fresh;
    }
    try self.track_texture(texture);
    self.transition_subresources(texture, 0, texture.info.num_levels, 0, texture.layers, default_layout(texture.info));
}

// ---------------------------------------------------------------------------
// Swapchains
// ---------------------------------------------------------------------------

pub const SwapchainOptions = struct {
    composition: types.SwapchainComposition = .sdr,
    present_mode: types.PresentMode = .vsync,
    /// Requested size in pixels. Zero uses the surface's current extent. The
    /// request is clamped to the surface's min and max extents, as SDL does.
    width: u32 = 0,
    height: u32 = 0,
    /// Images the swapchain asks for, clamped to the surface limits (SDL's
    /// default is two). Mailbox raises it to at least three.
    frames_in_flight: u32 = 2,
};

/// Swapchain for one surface. The caller owns the `VkSurfaceKHR` and destroys
/// it after `deinit`. The swapchain must not move after `create` because
/// command buffers refer to it while recording.
pub const Swapchain = struct {
    device: *Device,
    surface: u64,
    handle: vk.Handle,
    textures: []Texture,
    /// Acquire semaphores, used round-robin, one per image. A reserved slot
    /// belongs to a recording command buffer until successful submission.
    image_available: []vk.Handle,
    /// Sequence of the submission that last waited on each acquire semaphore.
    image_available_seq: []u64,
    image_available_reserved: []bool,
    /// Per-image semaphores signaled by submission and waited by present.
    render_finished: []vk.Handle,
    next_semaphore: u32 = 0,
    vk_format: vk.Format,
    width: u32,
    height: u32,
    format: types.TextureFormat,
    composition: types.SwapchainComposition,
    present_mode: types.PresentMode,
    options: SwapchainOptions,

    /// Creates a swapchain on `surface`, which must be presentable from the
    /// device's queue family. Returns `ZeroExtent` for a minimized surface.
    pub fn create(device: *Device, surface: u64, options: SwapchainOptions) Error!Swapchain {
        return build(device, surface, options, 0);
    }

    /// Replaces the swapchain after a resize or an `SwapchainOutOfDate` result.
    /// It waits for the GPU, since views and semaphores are recreated. The old
    /// swapchain is destroyed after the new one is created.
    pub fn recreate(self: *Swapchain, options: SwapchainOptions) Error!void {
        if (std.mem.indexOfScalar(bool, self.image_available_reserved, true) != null) return error.AcquiredNotSubmitted;
        const dev = self.device;
        try dev.wait_idle();
        for (self.textures) |t| pass.evict_image(dev, t.active().image);
        const old_handle = self.handle;
        const old_textures = self.textures;
        const old_available = self.image_available;
        const old_seqs = self.image_available_seq;
        const old_reserved = self.image_available_reserved;
        const old_render = self.render_finished;
        const next = try build(dev, self.surface, options, old_handle);
        // The new swapchain exists, so the old one and its images can go.
        dev.fns.vkDestroySwapchainKHR.?(dev.device, old_handle, null);
        for (old_textures) |*t| t.deinit();
        dev.allocator.free(old_textures);
        for (old_available) |sem| dev.fns.vkDestroySemaphore(dev.device, sem, null);
        for (old_render) |sem| dev.fns.vkDestroySemaphore(dev.device, sem, null);
        dev.allocator.free(old_available);
        dev.allocator.free(old_seqs);
        dev.allocator.free(old_reserved);
        dev.allocator.free(old_render);
        self.* = next;
    }

    /// All acquired recordings must be submitted before destruction.
    pub fn deinit(self: *Swapchain) void {
        std.debug.assert(std.mem.indexOfScalar(bool, self.image_available_reserved, true) == null);
        const dev = self.device;
        dev.wait_idle() catch {};
        for (self.textures) |t| pass.evict_image(dev, t.active().image);
        for (self.textures) |*t| t.deinit();
        dev.allocator.free(self.textures);
        for (self.image_available) |sem| dev.fns.vkDestroySemaphore(dev.device, sem, null);
        for (self.render_finished) |sem| dev.fns.vkDestroySemaphore(dev.device, sem, null);
        dev.allocator.free(self.image_available);
        dev.allocator.free(self.image_available_seq);
        dev.allocator.free(self.image_available_reserved);
        dev.allocator.free(self.render_finished);
        if (self.handle != 0) dev.fns.vkDestroySwapchainKHR.?(dev.device, self.handle, null);
        self.* = undefined;
    }
};

/// Builds a swapchain following `SDL_gpu_vulkan.c`'s `VULKAN_INTERNAL_CreateSwapchain`.
fn build(device: *Device, surface: u64, options: SwapchainOptions, old: vk.Handle) Error!Swapchain {
    const fns = &device.instance_fns;
    const dev_fns = &device.fns;
    var support = try SurfaceSupport.query(device, surface);
    defer support.deinit(device.allocator);

    // Presentation must be possible from the selected queue family.
    const can_present = fns.vkGetPhysicalDeviceSurfaceSupportKHR orelse return error.ExtensionNotPresent;
    var presentable: vk.Bool32 = 0;
    _ = try vk.check(can_present(device.physical_device, device.queue_family, surface, &presentable));
    if (presentable == 0) return error.NotPresentable;

    // Format and color space, with the fallback SDL uses for R8G8B8A8.
    const index = @backingInt(options.composition);
    const color_space = tables.composition_color_space[index];
    var vk_format = tables.composition_format[index];
    var fallback = false;
    if (!contains_format(support.formats, vk_format, color_space)) {
        vk_format = tables.composition_fallback_format[index];
        fallback = true;
        if (vk_format == vk.VK_FORMAT_UNDEFINED or !contains_format(support.formats, vk_format, color_space)) {
            return error.UnsupportedComposition;
        }
    }
    const vk_present = tables.present_mode[@backingInt(options.present_mode)];
    if (std.mem.indexOfScalar(i32, support.present_modes, vk_present) == null) return error.UnsupportedPresentMode;

    const caps = support.caps;
    if (caps.currentExtent.width == 0 or caps.currentExtent.height == 0) return error.ZeroExtent;
    const hint_w = if (options.width != 0) options.width else caps.currentExtent.width;
    const hint_h = if (options.height != 0) options.height else caps.currentExtent.height;
    const width = std.math.clamp(hint_w, caps.minImageExtent.width, caps.maxImageExtent.width);
    const height = std.math.clamp(hint_h, caps.minImageExtent.height, caps.maxImageExtent.height);

    var image_count = options.frames_in_flight;
    if (caps.maxImageCount > 0 and image_count > caps.maxImageCount) image_count = caps.maxImageCount;
    if (image_count < caps.minImageCount) image_count = caps.minImageCount;
    if (options.present_mode == .mailbox) {
        // SDL insists on triple buffering for mailbox; reject its unsupported
        // case explicitly instead of asking Vulkan for more than maxImageCount.
        if (caps.maxImageCount != 0 and caps.maxImageCount < 3) return error.UnsupportedPresentMode;
        image_count = @max(image_count, 3);
    }

    var composite: vk.Flags = 0;
    if (caps.supportedCompositeAlpha & vk.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR != 0) {
        composite = vk.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    } else if (caps.supportedCompositeAlpha & vk.VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR != 0) {
        composite = vk.VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR;
    } else {
        return error.UnsupportedFeature;
    }

    const create_fn = dev_fns.vkCreateSwapchainKHR orelse return error.ExtensionNotPresent;
    var info = std.mem.zeroes(vk.SwapchainCreateInfoKHR);
    info.sType = vk.VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    info.surface = surface;
    info.minImageCount = image_count;
    info.imageFormat = vk_format;
    info.imageColorSpace = color_space;
    info.imageExtent = .{ .width = width, .height = height };
    info.imageArrayLayers = 1;
    info.imageUsage = vk.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | vk.VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    info.imageSharingMode = vk.VK_SHARING_MODE_EXCLUSIVE;
    info.preTransform = @bitCast(caps.currentTransform);
    info.compositeAlpha = composite;
    info.presentMode = vk_present;
    info.clipped = vk.VK_TRUE;
    info.oldSwapchain = old;
    var handle: vk.Handle = 0;
    _ = try vk.check(create_fn(device.device, &info, null, &handle));
    errdefer dev_fns.vkDestroySwapchainKHR.?(device.device, handle, null);

    const format = tables.composition_texture_format(options.composition, fallback);
    const get_images = dev_fns.vkGetSwapchainImagesKHR orelse return error.ExtensionNotPresent;
    var count: u32 = 0;
    _ = try vk.check(get_images(device.device, handle, &count, null));
    const images = try device.allocator.alloc(vk.Handle, count);
    defer device.allocator.free(images);
    _ = try vk.check(get_images(device.device, handle, &count, images.ptr));

    const textures = try device.allocator.alloc(Texture, count);
    var created: usize = 0;
    errdefer {
        for (textures[0..created]) |*t| t.deinit();
        device.allocator.free(textures);
    }
    const swapchain_info: types.TextureCreateInfo = .{
        .format = format,
        .usage = .{ .color_target = true },
        .width = width,
        .height = height,
    };
    for (images, 0..) |image, i| {
        const view = try device.create_image_view(image, .@"2d", vk_format, vk.VK_IMAGE_ASPECT_COLOR_BIT, 1, 1, tables.identity_swizzle);
        errdefer device.fns.vkDestroyImageView(device.device, view, null);
        textures[i] = try wrap_swapchain_image(device, image, view, swapchain_info);
        created += 1;
    }

    const available = try device.allocator.alloc(vk.Handle, count);
    errdefer device.allocator.free(available);
    const available_seq = try device.allocator.alloc(u64, count);
    errdefer device.allocator.free(available_seq);
    const reserved = try device.allocator.alloc(bool, count);
    errdefer device.allocator.free(reserved);
    @memset(reserved, false);
    const render = try device.allocator.alloc(vk.Handle, count);
    errdefer device.allocator.free(render);
    var made_available: usize = 0;
    var made_render: usize = 0;
    errdefer for (available[0..made_available]) |sem| dev_fns.vkDestroySemaphore(device.device, sem, null);
    errdefer for (render[0..made_render]) |sem| dev_fns.vkDestroySemaphore(device.device, sem, null);
    var semaphore_info = std.mem.zeroes(vk.SemaphoreCreateInfo);
    semaphore_info.sType = vk.VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
    for (0..count) |i| {
        _ = try vk.check(dev_fns.vkCreateSemaphore(device.device, &semaphore_info, null, &available[i]));
        made_available += 1;
        _ = try vk.check(dev_fns.vkCreateSemaphore(device.device, &semaphore_info, null, &render[i]));
        made_render += 1;
        available_seq[i] = 0;
    }

    return .{
        .device = device,
        .surface = surface,
        .handle = handle,
        .textures = textures,
        .image_available = available,
        .image_available_seq = available_seq,
        .image_available_reserved = reserved,
        .render_finished = render,
        .vk_format = vk_format,
        .width = width,
        .height = height,
        .format = format,
        .composition = options.composition,
        .present_mode = options.present_mode,
        .options = options,
    };
}

/// Surface capabilities and format list for one surface. The slices are owned
/// by the caller and freed with `deinit`.
const SurfaceSupport = struct {
    caps: vk.SurfaceCapabilitiesKHR,
    formats: []vk.SurfaceFormatKHR,
    present_modes: []i32,
    /// Full allocations; `formats` and `present_modes` may be shorter when the
    /// driver reports fewer entries on the second call.
    format_storage: []vk.SurfaceFormatKHR,
    mode_storage: []i32,

    fn query(device: *Device, surface: u64) Error!SurfaceSupport {
        const fns = &device.instance_fns;
        const caps_fn = fns.vkGetPhysicalDeviceSurfaceCapabilitiesKHR orelse return error.ExtensionNotPresent;
        const formats_fn = fns.vkGetPhysicalDeviceSurfaceFormatsKHR orelse return error.ExtensionNotPresent;
        const modes_fn = fns.vkGetPhysicalDeviceSurfacePresentModesKHR orelse return error.ExtensionNotPresent;
        var caps: vk.SurfaceCapabilitiesKHR = undefined;
        _ = try vk.check(caps_fn(device.physical_device, surface, &caps));

        var format_count: u32 = 0;
        _ = try vk.check(formats_fn(device.physical_device, surface, &format_count, null));
        const formats = try device.allocator.alloc(vk.SurfaceFormatKHR, format_count);
        errdefer device.allocator.free(formats);
        _ = try vk.check(formats_fn(device.physical_device, surface, &format_count, formats.ptr));

        var mode_count: u32 = 0;
        _ = try vk.check(modes_fn(device.physical_device, surface, &mode_count, null));
        const modes = try device.allocator.alloc(i32, mode_count);
        errdefer device.allocator.free(modes);
        _ = try vk.check(modes_fn(device.physical_device, surface, &mode_count, modes.ptr));

        return .{
            .caps = caps,
            .formats = formats[0..format_count],
            .present_modes = modes[0..mode_count],
            .format_storage = formats,
            .mode_storage = modes,
        };
    }

    fn deinit(self: *SurfaceSupport, allocator: std.mem.Allocator) void {
        allocator.free(self.format_storage);
        allocator.free(self.mode_storage);
        self.* = undefined;
    }
};

fn contains_format(formats: []const vk.SurfaceFormatKHR, format: vk.Format, color_space: i32) bool {
    for (formats) |f| {
        if (f.format == format and f.colorSpace == color_space) return true;
    }
    return false;
}

/// Image aspect flags for a texture format.
fn aspect_flags(format: types.TextureFormat) vk.Flags {
    if (!types.is_depth_format(format)) return vk.VK_IMAGE_ASPECT_COLOR_BIT;
    if (types.is_stencil_format(format)) return vk.VK_IMAGE_ASPECT_DEPTH_BIT | vk.VK_IMAGE_ASPECT_STENCIL_BIT;
    return vk.VK_IMAGE_ASPECT_DEPTH_BIT;
}

fn buffer_usage_flags(usage: types.BufferUsage) vk.Flags {
    var flags: vk.Flags = 0;
    if (usage.vertex) flags |= vk.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;
    if (usage.index) flags |= vk.VK_BUFFER_USAGE_INDEX_BUFFER_BIT;
    if (usage.indirect) flags |= vk.VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT;
    if (usage.graphics_storage_read or usage.compute_storage_read or usage.compute_storage_write) {
        flags |= vk.VK_BUFFER_USAGE_STORAGE_BUFFER_BIT;
    }
    return flags;
}

fn image_usage_flags(usage: types.TextureUsage) vk.Flags {
    var flags: vk.Flags = vk.VK_IMAGE_USAGE_TRANSFER_SRC_BIT | vk.VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    if (usage.sampler or usage.graphics_storage_read or usage.compute_storage_read) flags |= vk.VK_IMAGE_USAGE_SAMPLED_BIT;
    if (usage.color_target) flags |= vk.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    if (usage.depth_stencil_target) flags |= vk.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
    if (usage.any_storage_write()) {
        flags |= vk.VK_IMAGE_USAGE_STORAGE_BIT;
    }
    return flags;
}

/// Pipeline stage and access masks for a layout, used by barriers. Source
/// uses the layout being left, destination the layout being entered.
pub const StageAccess = struct { stage: vk.Flags, access: vk.Flags };

/// SDL's VULKAN_BUFFER_USAGE_MODE_* flags: how a buffer is used by the commands
/// currently recording. Read modes combine; the transfer and read-write modes
/// are used alone (or, for a copy within one buffer, as source plus destination).
pub const BufferUsageMode = packed struct(u8) {
    copy_source: bool = false,
    copy_destination: bool = false,
    vertex_read: bool = false,
    index_read: bool = false,
    indirect: bool = false,
    graphics_storage_read: bool = false,
    compute_storage_read: bool = false,
    compute_storage_read_write: bool = false,

    fn is_empty(self: BufferUsageMode) bool {
        return @as(u8, @bitCast(self)) == 0;
    }
};

/// SDL's VULKAN_INTERNAL_DefaultBufferUsageMode: buffers rest in the union of
/// their declared read usages between passes, because barriers cannot be
/// recorded inside a render pass. A buffer with only compute-write usage rests
/// in read-write mode; one with no usage rests as a vertex buffer.
pub fn default_buffer_usage_mode(usage: types.BufferUsage) BufferUsageMode {
    var mode = BufferUsageMode{
        .vertex_read = usage.vertex,
        .index_read = usage.index,
        .indirect = usage.indirect,
        .graphics_storage_read = usage.graphics_storage_read,
        .compute_storage_read = usage.compute_storage_read,
    };
    if (mode.is_empty()) {
        if (usage.compute_storage_write) mode.compute_storage_read_write = true else mode.vertex_read = true;
    }
    return mode;
}

/// SDL's VULKAN_INTERNAL_SetMemoryBarrierFlags.
fn buffer_mode_stage_access(mode: BufferUsageMode) StageAccess {
    var result = StageAccess{ .stage = 0, .access = 0 };
    if (mode.vertex_read) {
        result.stage |= vk.VK_PIPELINE_STAGE_VERTEX_INPUT_BIT;
        result.access |= vk.VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT;
    }
    if (mode.index_read) {
        result.stage |= vk.VK_PIPELINE_STAGE_VERTEX_INPUT_BIT;
        result.access |= vk.VK_ACCESS_INDEX_READ_BIT;
    }
    if (mode.indirect) {
        result.stage |= vk.VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT;
        result.access |= vk.VK_ACCESS_INDIRECT_COMMAND_READ_BIT;
    }
    if (mode.graphics_storage_read) {
        result.stage |= vk.VK_PIPELINE_STAGE_VERTEX_SHADER_BIT | vk.VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT;
        result.access |= vk.VK_ACCESS_SHADER_READ_BIT;
    }
    if (mode.compute_storage_read) {
        result.stage |= vk.VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        result.access |= vk.VK_ACCESS_SHADER_READ_BIT;
    }
    if (mode.copy_source) {
        result.stage |= vk.VK_PIPELINE_STAGE_TRANSFER_BIT;
        result.access |= vk.VK_ACCESS_TRANSFER_READ_BIT;
    }
    if (mode.copy_destination) {
        result.stage |= vk.VK_PIPELINE_STAGE_TRANSFER_BIT;
        result.access |= vk.VK_ACCESS_TRANSFER_WRITE_BIT;
    }
    if (mode.compute_storage_read_write) {
        result.stage |= vk.VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT;
        result.access |= vk.VK_ACCESS_SHADER_READ_BIT | vk.VK_ACCESS_SHADER_WRITE_BIT;
    }
    return result;
}

pub fn layout_stage_access(layout: i32) StageAccess {
    const read_write_memory = vk.VK_ACCESS_MEMORY_READ_BIT | vk.VK_ACCESS_MEMORY_WRITE_BIT;
    return switch (layout) {
        vk.VK_IMAGE_LAYOUT_UNDEFINED => .{ .stage = vk.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, .access = 0 },
        vk.VK_IMAGE_LAYOUT_GENERAL => .{ .stage = vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT, .access = read_write_memory },
        vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL => .{
            .stage = vk.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
            .access = vk.VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | vk.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
        },
        vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL => .{
            .stage = vk.VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT | vk.VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT,
            .access = vk.VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT | vk.VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT,
        },
        vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL => .{
            .stage = vk.VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT | vk.VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT,
            .access = vk.VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT,
        },
        vk.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL => .{ .stage = vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT, .access = vk.VK_ACCESS_SHADER_READ_BIT },
        vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL => .{ .stage = vk.VK_PIPELINE_STAGE_TRANSFER_BIT, .access = vk.VK_ACCESS_TRANSFER_READ_BIT },
        vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL => .{ .stage = vk.VK_PIPELINE_STAGE_TRANSFER_BIT, .access = vk.VK_ACCESS_TRANSFER_WRITE_BIT },
        vk.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR => .{ .stage = vk.VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT, .access = 0 },
        else => .{ .stage = vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT, .access = read_write_memory },
    };
}

/// Layout a texture rests in after a copy, matching SDL's default usage: sampled
/// textures stay in shader-read layout, the rest in general layout.
pub fn default_layout(info: types.TextureCreateInfo) i32 {
    if (types.is_depth_format(info.format)) {
        return if (info.usage.sampler) vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL else vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL;
    }
    // Writable storage needs the general layout; read-only uses are shader-read.
    if (info.usage.any_storage_write()) return vk.VK_IMAGE_LAYOUT_GENERAL;
    if (info.usage.sampler or info.usage.graphics_storage_read or info.usage.compute_storage_read) {
        return vk.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
    }
    return vk.VK_IMAGE_LAYOUT_GENERAL;
}

// ---------------------------------------------------------------------------
// Device creation helpers
// ---------------------------------------------------------------------------

fn extension_present(props: []const vk.ExtensionProperties, name: []const u8) bool {
    for (props) |p| {
        if (std.mem.eql(u8, std.mem.sliceTo(&p.extensionName, 0), name)) return true;
    }
    return false;
}

/// Instance extension list. `storage` is the allocation to free; `items` are the
/// entries the driver reported on the second call (possibly fewer).
const ExtensionList = struct {
    storage: []vk.ExtensionProperties,
    items: []vk.ExtensionProperties,

    fn deinit(self: ExtensionList, allocator: std.mem.Allocator) void {
        allocator.free(self.storage);
    }
};

fn enumerate_instance_extensions(allocator: std.mem.Allocator, library: *const vk.Library) Error!ExtensionList {
    var count: u32 = 0;
    _ = try vk.check(library.global.vkEnumerateInstanceExtensionProperties(null, &count, null));
    const props = try allocator.alloc(vk.ExtensionProperties, count);
    errdefer allocator.free(props);
    _ = try vk.check(library.global.vkEnumerateInstanceExtensionProperties(null, &count, props.ptr));
    return .{ .storage = props, .items = props[0..@min(count, props.len)] };
}

/// Creates the instance. Required extensions from `options` must exist; the
/// properties2 query, color-space, debug and portability extensions are added
/// when present, as SDL does.
fn create_instance(allocator: std.mem.Allocator, library: *const vk.Library, options: Options, has_properties2: *bool) Error!vk.Instance {
    const list = try enumerate_instance_extensions(allocator, library);
    defer list.deinit(allocator);
    const available = list.items;

    var names: std.ArrayList([*:0]const u8) = .empty;
    defer names.deinit(allocator);
    for (options.instance_extensions) |name| {
        if (!extension_present(available, name)) return error.ExtensionNotPresent;
        try append_unique_name(allocator, &names, name.ptr);
    }
    const optional_extensions = [_][:0]const u8{
        vk.VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME,
        vk.VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME,
        vk.VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME,
    };
    var create_flags: vk.Flags = 0;
    for (optional_extensions) |name| {
        if (!extension_present(available, name)) continue;
        try append_unique_name(allocator, &names, name.ptr);
        if (std.mem.eql(u8, name, vk.VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME)) has_properties2.* = true;
        if (std.mem.eql(u8, name, vk.VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME)) {
            create_flags |= vk.VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR;
        }
    }
    if (options.debug_mode and extension_present(available, vk.VK_EXT_DEBUG_UTILS_EXTENSION_NAME)) {
        try append_unique_name(allocator, &names, vk.VK_EXT_DEBUG_UTILS_EXTENSION_NAME.ptr);
    }

    var layers: [1][*:0]const u8 = .{vk.VK_LAYER_KHRONOS_VALIDATION_NAME.ptr};
    var layer_count: u32 = 0;
    if (options.debug_mode) {
        var count: u32 = 0;
        _ = try vk.check(library.global.vkEnumerateInstanceLayerProperties(&count, null));
        const layer_props = try allocator.alloc(vk.LayerProperties, count);
        defer allocator.free(layer_props);
        _ = try vk.check(library.global.vkEnumerateInstanceLayerProperties(&count, layer_props.ptr));
        for (layer_props) |layer| {
            if (std.mem.eql(u8, std.mem.sliceTo(&layer.layerName, 0), vk.VK_LAYER_KHRONOS_VALIDATION_NAME)) {
                layer_count = 1;
                break;
            }
        }
    }

    var app = std.mem.zeroes(vk.ApplicationInfo);
    app.sType = vk.VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app.pEngineName = "zdl";
    app.apiVersion = vk.VK_API_VERSION_1_0;

    var info = std.mem.zeroes(vk.InstanceCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    info.flags = create_flags;
    info.pApplicationInfo = &app;
    info.enabledLayerCount = layer_count;
    info.ppEnabledLayerNames = if (layer_count > 0) &layers else null;
    info.enabledExtensionCount = @intCast(names.items.len);
    info.ppEnabledExtensionNames = if (names.items.len > 0) names.items.ptr else null;

    var instance: vk.Instance = null;
    _ = try vk.check(library.global.vkCreateInstance(&info, null, &instance));
    return instance;
}

fn append_unique_name(allocator: std.mem.Allocator, names: *std.ArrayList([*:0]const u8), name: [*:0]const u8) Error!void {
    const slice = std.mem.sliceTo(name, 0);
    for (names.items) |existing| {
        if (std.mem.eql(u8, std.mem.sliceTo(existing, 0), slice)) return;
    }
    try names.append(allocator, name);
}

/// Result of physical device selection.
const Selection = struct {
    physical_device: vk.PhysicalDevice,
    queue_family: u32,
    extensions: DeviceExtensions,
};

/// SDL's `VULKAN_INTERNAL_DeterminePhysicalDevice`. Every device that passes
/// the suitability checks is ranked; a device replaces the best so far only if
/// its rank is at least as high. The rank accumulates like SDL's, so the
/// VRAM tie-breaker applies to the first device of the best type.
fn select_physical_device(
    allocator: std.mem.Allocator,
    fns: *const vk.InstanceFns,
    instance: vk.Instance,
    options: Options,
    has_properties2: bool,
) Error!Selection {
    var count: u32 = 0;
    _ = try vk.check(fns.vkEnumeratePhysicalDevices(instance, &count, null));
    if (count == 0) return error.NoSuitableDevice;
    const devices = try allocator.alloc(vk.PhysicalDevice, count);
    defer allocator.free(devices);
    _ = try vk.check(fns.vkEnumeratePhysicalDevices(instance, &count, devices.ptr));

    var best: ?Selection = null;
    var highest_rank: u64 = 0;
    for (devices[0..count]) |pd| {
        const extensions = try device_extensions(allocator, fns, pd);
        if (!extensions.swapchain or !extensions.maintenance1) continue;
        const family = (try suitable_queue_family(allocator, fns, pd, options.probe_surface)) orelse continue;
        var rank = highest_rank;
        if (!try rank_device(fns, pd, extensions, has_properties2, options, &rank)) continue;
        best = .{ .physical_device = pd, .queue_family = family, .extensions = extensions };
        highest_rank = rank;
    }
    return best orelse error.NoSuitableDevice;
}

fn device_extensions(allocator: std.mem.Allocator, fns: *const vk.InstanceFns, pd: vk.PhysicalDevice) Error!DeviceExtensions {
    var count: u32 = 0;
    _ = try vk.check(fns.vkEnumerateDeviceExtensionProperties(pd, null, &count, null));
    const props = try allocator.alloc(vk.ExtensionProperties, count);
    defer allocator.free(props);
    _ = try vk.check(fns.vkEnumerateDeviceExtensionProperties(pd, null, &count, props.ptr));
    return .{
        .swapchain = extension_present(props[0..count], vk.VK_KHR_SWAPCHAIN_EXTENSION_NAME),
        .maintenance1 = extension_present(props[0..count], vk.VK_KHR_MAINTENANCE_1_EXTENSION_NAME),
        .driver_properties = extension_present(props[0..count], vk.VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME),
        .portability_subset = extension_present(props[0..count], vk.VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME),
        .astc_hdr = extension_present(props[0..count], vk.VK_EXT_TEXTURE_COMPRESSION_ASTC_HDR_EXTENSION_NAME),
    };
}

/// Picks the best graphics queue family that can present. Rank: graphics with
/// compute and transfer (3), graphics with compute (2), graphics only (1). The
/// first family wins a tie, as in SDL.
fn suitable_queue_family(
    allocator: std.mem.Allocator,
    fns: *const vk.InstanceFns,
    pd: vk.PhysicalDevice,
    probe_surface: ?u64,
) Error!?u32 {
    var count: u32 = 0;
    fns.vkGetPhysicalDeviceQueueFamilyProperties(pd, &count, null);
    const props = try allocator.alloc(vk.QueueFamilyProperties, count);
    defer allocator.free(props);
    fns.vkGetPhysicalDeviceQueueFamilyProperties(pd, &count, props.ptr);

    var best: ?u32 = null;
    var best_rank: u32 = 0;
    for (props[0..count], 0..) |family, i| {
        const index: u32 = @intCast(i);
        if (family.queueFlags & vk.VK_QUEUE_GRAPHICS_BIT == 0) continue;
        if (probe_surface) |surface| {
            const support = fns.vkGetPhysicalDeviceSurfaceSupportKHR orelse return error.ExtensionNotPresent;
            var presentable: vk.Bool32 = 0;
            _ = try vk.check(support(pd, index, surface, &presentable));
            if (presentable == 0) continue;
        }
        const rank: u32 = if (family.queueFlags & vk.VK_QUEUE_COMPUTE_BIT != 0)
            (if (family.queueFlags & vk.VK_QUEUE_TRANSFER_BIT != 0) 3 else 2)
        else
            1;
        if (rank > best_rank) {
            best = index;
            best_rank = rank;
        }
    }
    return best;
}

/// SDL's `VULKAN_INTERNAL_GetDeviceRank`. Returns false when the device is
/// rejected. `rank` is updated only as SDL does: a lower-priority device resets
/// it to zero, and a higher-priority one raises it to its class value.
fn rank_device(
    fns: *const vk.InstanceFns,
    pd: vk.PhysicalDevice,
    extensions: DeviceExtensions,
    has_properties2: bool,
    options: Options,
    rank: *u64,
) Error!bool {
    var device_type: i32 = vk.VK_PHYSICAL_DEVICE_TYPE_OTHER;
    var conformant = true;
    if (extensions.driver_properties and has_properties2) {
        if (fns.vkGetPhysicalDeviceProperties2KHR) |get_props2| {
            var driver = std.mem.zeroes(vk.PhysicalDeviceDriverProperties);
            driver.sType = vk.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES;
            var props2 = std.mem.zeroes(vk.PhysicalDeviceProperties2);
            props2.sType = vk.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
            props2.pNext = &driver;
            get_props2(pd, &props2);
            device_type = props2.properties.deviceType;
            conformant = driver.conformanceVersion.major >= 1;
        }
    } else {
        var props = std.mem.zeroes(vk.PhysicalDeviceProperties);
        fns.vkGetPhysicalDeviceProperties(pd, &props);
        device_type = props.deviceType;
    }

    if (options.require_hardware_acceleration) {
        switch (device_type) {
            vk.VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, vk.VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU, vk.VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU => {},
            else => return false,
        }
    }
    if (!conformant) return false;
    if (device_type < 0 or device_type > 4) return false;

    const table = if (options.prefer_low_power) priority_low_power else priority_high_performance;
    const priority_value: u64 = @as(u64, table[@intCast(device_type)]) * 1_000_000;
    if (rank.* < priority_value) {
        rank.* = priority_value;
    } else if (rank.* > priority_value) {
        rank.* = 0;
        return false;
    }

    if (!options.prefer_low_power) {
        var memory: vk.PhysicalDeviceMemoryProperties = undefined;
        fns.vkGetPhysicalDeviceMemoryProperties(pd, &memory);
        var vram: u64 = 0;
        for (memory.memoryHeaps[0..memory.memoryHeapCount]) |heap| {
            if (heap.flags & vk.VK_MEMORY_HEAP_DEVICE_LOCAL_BIT != 0) vram += heap.size;
        }
        rank.* += vram / (1024 * 1024);
    }
    return true;
}

const EnabledDevice = struct {
    device: vk.Device,
    features: EnabledFeatures,
};

/// Creates the logical device with one queue, the extensions the driver offers
/// among SDL's list, and the optional core features SDL enables when present.
fn create_logical_device(fns: *const vk.InstanceFns, selection: Selection) Error!EnabledDevice {
    var available: vk.PhysicalDeviceFeatures = undefined;
    fns.vkGetPhysicalDeviceFeatures(selection.physical_device, &available);

    var features: EnabledFeatures = .{};
    var enabled = std.mem.zeroes(vk.PhysicalDeviceFeatures);
    enabled.depthClamp = available.depthClamp;
    features.depth_clamp = available.depthClamp != 0;
    enabled.depthBiasClamp = available.depthBiasClamp;
    features.depth_bias_clamp = available.depthBiasClamp != 0;
    enabled.independentBlend = available.independentBlend;
    features.independent_blend = available.independentBlend != 0;
    enabled.imageCubeArray = available.imageCubeArray;
    features.image_cube_array = available.imageCubeArray != 0;
    enabled.drawIndirectFirstInstance = available.drawIndirectFirstInstance;
    features.draw_indirect_first_instance = available.drawIndirectFirstInstance != 0;
    enabled.sampleRateShading = available.sampleRateShading;
    features.sample_rate_shading = available.sampleRateShading != 0;
    enabled.shaderClipDistance = available.shaderClipDistance;
    features.shader_clip_distance = available.shaderClipDistance != 0;

    if (available.fillModeNonSolid != 0) {
        enabled.fillModeNonSolid = vk.VK_TRUE;
        features.fill_mode_non_solid = true;
    }
    if (available.multiDrawIndirect != 0) {
        enabled.multiDrawIndirect = vk.VK_TRUE;
        features.multi_draw_indirect = true;
    }
    if (available.samplerAnisotropy != 0) {
        enabled.samplerAnisotropy = vk.VK_TRUE;
        features.sampler_anisotropy = true;
    }

    var extension_names: [5][*:0]const u8 = undefined;
    var extension_count: u32 = 0;
    extension_names[extension_count] = vk.VK_KHR_SWAPCHAIN_EXTENSION_NAME.ptr;
    extension_count += 1;
    extension_names[extension_count] = vk.VK_KHR_MAINTENANCE_1_EXTENSION_NAME.ptr;
    extension_count += 1;
    if (selection.extensions.driver_properties) {
        extension_names[extension_count] = vk.VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME.ptr;
        extension_count += 1;
    }
    if (selection.extensions.portability_subset) {
        extension_names[extension_count] = vk.VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME.ptr;
        extension_count += 1;
    }
    if (selection.extensions.astc_hdr) {
        extension_names[extension_count] = vk.VK_EXT_TEXTURE_COMPRESSION_ASTC_HDR_EXTENSION_NAME.ptr;
        extension_count += 1;
    }

    var priorities = [_]f32{1.0};
    var queue_info = std.mem.zeroes(vk.DeviceQueueCreateInfo);
    queue_info.sType = vk.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queue_info.queueFamilyIndex = selection.queue_family;
    queue_info.queueCount = 1;
    queue_info.pQueuePriorities = &priorities;

    var info = std.mem.zeroes(vk.DeviceCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    info.queueCreateInfoCount = 1;
    info.pQueueCreateInfos = @ptrCast(&queue_info);
    info.enabledExtensionCount = extension_count;
    info.ppEnabledExtensionNames = &extension_names;
    info.pEnabledFeatures = &enabled;

    var device: vk.Device = null;
    _ = try vk.check(fns.vkCreateDevice(selection.physical_device, &info, null, &device));
    return .{ .device = device, .features = features };
}

// ---------------------------------------------------------------------------
// Command buffers
// ---------------------------------------------------------------------------

/// A command buffer in the recording state. It is a stack value: record,
/// then `submit` or `submit_with_fence`, which consumes it. Commands and barriers
/// go straight into the Vulkan command buffer.
///
/// Synchronization follows SDL's "default usage" invariant. Buffers rest in the
/// union of their declared read usages (`default_buffer_usage_mode`) and move to
/// a copy or read-write mode only around the command that needs it. Textures
/// rest in `default_layout`. Texture layout bookkeeping is transactional: each
/// command buffer works on a private copy of every backing's layouts
/// (`Scratch.layouts`), `submit` commits the copy to the shared state only after
/// vkQueueSubmit succeeds (and rejects it with `TextureLayoutConflict` if
/// another submission changed the layouts it was recorded against), and `abort`
/// drops it, so shared state never reflects unsubmitted transitions.
pub const CommandBuffer = struct {
    device: *Device,
    handle: vk.CommandBuffer,
    acquired: [max_acquires]Acquired = undefined,
    acquired_count: usize = 0,
    /// Descriptor pools and uniform buffers used by this recording; moved to the
    /// submission on `submit` and destroyed on `abort`.
    scratch: descriptors.Scratch = .{},
    /// The uniform buffer being filled and the next free byte in it.
    uniform: ?descriptors.UniformBuffer = null,
    uniform_cursor: u32 = 0,
    /// Open pass, bound pipeline, resources and descriptor state.
    state: pass.State = .{},
    /// Failures in the compatible void transition API are reported by submit.
    recording_error: ?Error = null,
    /// Queue-submit failures leave an executable command buffer, which can be
    /// retried or aborted without calling vkEndCommandBuffer a second time.
    ended: bool = false,

    /// Passes and copies. See `pass.zig`.
    pub const begin_render_pass = pass.begin_render_pass;
    pub const begin_compute_pass = pass.begin_compute_pass;
    pub const begin_compute_pass_cycled = pass.begin_compute_pass_cycled;
    pub const begin_copy_pass = pass.begin_copy_pass;
    pub const copy_texture = pass.copy_texture;
    pub const blit_texture = pass.blit_texture;
    pub const generate_mipmaps = pass.generate_mipmaps;
    /// Acquires the swapchain texture of a claimed window. See `window.zig`.
    pub const acquire_window_texture = window.acquire_window_texture;
    /// Opens a labeled debug region. Close it with `pop_debug_group`.
    pub const push_debug_group = debug.push_label;
    pub const pop_debug_group = debug.pop_label;
    /// Inserts a single debug label.
    pub const insert_debug_label = debug.insert_label;

    const Acquired = struct {
        swapchain: *Swapchain,
        image_index: u32,
        semaphore_index: u32,
    };

    /// Acquires the next image of `swapchain` for rendering. The image moves to
    /// color-attachment layout and is presented by `submit`. Returns null when
    /// the swapchain has a zero extent (minimized). Returns `SwapchainOutOfDate`
    /// when the caller must `recreate`; the command buffer then stays recording
    /// and must be aborted or submitted without the image.
    pub fn acquire_swapchain_texture(self: *CommandBuffer, swapchain: *Swapchain) Error!?*Texture {
        if (self.acquired_count == max_acquires) return error.TooManyAcquires;
        for (self.acquired[0..self.acquired_count]) |acq| {
            if (acq.swapchain == swapchain) return error.AlreadyAcquired;
        }
        if (swapchain.width == 0 or swapchain.height == 0) return null;

        const dev = self.device;
        var sem_index = swapchain.next_semaphore;
        var searched: usize = 0;
        while (swapchain.image_available_reserved[sem_index]) {
            searched += 1;
            if (searched == swapchain.image_available.len) return error.AcquireSlotsBusy;
            sem_index = @intCast((sem_index + 1) % swapchain.image_available.len);
        }
        try dev.wait_for_sequence(swapchain.image_available_seq[sem_index]);
        // Allocate tracking before acquisition: after it succeeds, its semaphore
        // must be consumed even if recording later runs out of memory.
        for (swapchain.textures) |*texture| {
            var known = false;
            for (self.scratch.layouts.items) |entry| {
                if (entry.backing == texture.active()) {
                    known = true;
                    break;
                }
            }
            if (!known) {
                try self.track_texture(texture);
                self.scratch.layouts.items[self.scratch.layouts.items.len - 1].used = false;
            }
        }

        const acquire_fn = dev.fns.vkAcquireNextImageKHR orelse return error.ExtensionNotPresent;
        var image_index: u32 = 0;
        const raw = acquire_fn(dev.device, swapchain.handle, vk.VK_TIMEOUT_INFINITE, swapchain.image_available[sem_index], 0, &image_index);
        if (raw == vk.VK_ERROR_OUT_OF_DATE_KHR) return error.SwapchainOutOfDate;
        _ = try vk.check(raw);

        swapchain.image_available_reserved[sem_index] = true;
        swapchain.next_semaphore = @intCast((sem_index + 1) % swapchain.image_available.len);
        self.acquired[self.acquired_count] = .{
            .swapchain = swapchain,
            .image_index = image_index,
            .semaphore_index = sem_index,
        };
        self.acquired_count += 1;

        const texture = &swapchain.textures[image_index];
        self.transition(texture, vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL);
        return texture;
    }

    /// Submits the recorded commands and presents every swapchain image acquired
    /// in this buffer. Consumes the command buffer.
    pub fn submit(self: *CommandBuffer) Error!void {
        _ = try self.submit_with_fence();
    }

    /// Like `submit`, and returns a fence for `Device.wait_fence`.
    pub fn submit_with_fence(self: *CommandBuffer) Error!Fence {
        if (self.state.pass != .none) return error.PassActive;
        const dev = self.device;
        if (self.recording_error) |err| return err;
        // Commands were recorded against submitted layouts. Independent recordings
        // may coexist, but stale oldLayout assumptions must never reach the GPU.
        for (self.scratch.layouts.items) |entry| {
            if (entry.used and !std.mem.eql(i32, entry.initial, entry.backing.layouts)) return error.TextureLayoutConflict;
        }
        if (!self.ended) {
            for (self.acquired[0..self.acquired_count]) |acq| {
                self.transition(&acq.swapchain.textures[acq.image_index], vk.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR);
            }
            _ = try vk.check(dev.fns.vkEndCommandBuffer(self.handle));
            self.ended = true;
        }

        try dev.in_flight.ensureUnusedCapacity(dev.allocator, 1);
        try dev.fences.ensureUnusedCapacity(dev.allocator, 1);
        const fence_handle = try dev.take_fence();
        const seq = dev.submit_seq + 1;

        var waits: [max_acquires]vk.Handle = undefined;
        var stages: [max_acquires]vk.Flags = undefined;
        var signals: [max_acquires]vk.Handle = undefined;
        for (self.acquired[0..self.acquired_count], 0..) |acq, i| {
            waits[i] = acq.swapchain.image_available[acq.semaphore_index];
            stages[i] = vk.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
            signals[i] = acq.swapchain.render_finished[acq.image_index];
        }
        var command_buffers = [_]vk.CommandBuffer{self.handle};
        var submit_info = std.mem.zeroes(vk.SubmitInfo);
        submit_info.sType = vk.VK_STRUCTURE_TYPE_SUBMIT_INFO;
        submit_info.waitSemaphoreCount = @intCast(self.acquired_count);
        submit_info.pWaitSemaphores = if (self.acquired_count > 0) &waits else null;
        submit_info.pWaitDstStageMask = if (self.acquired_count > 0) &stages else null;
        submit_info.commandBufferCount = 1;
        submit_info.pCommandBuffers = &command_buffers;
        submit_info.signalSemaphoreCount = @intCast(self.acquired_count);
        submit_info.pSignalSemaphores = if (self.acquired_count > 0) &signals else null;
        _ = vk.check(dev.fns.vkQueueSubmit(dev.queue, 1, @ptrCast(&submit_info), fence_handle)) catch |err| {
            dev.fences.appendAssumeCapacity(fence_handle);
            return err;
        };

        for (self.scratch.layouts.items) |entry| {
            if (entry.used) @memcpy(entry.backing.layouts, entry.current);
        }
        dev.submit_seq = seq;
        dev.in_flight.appendAssumeCapacity(.{ .seq = seq, .fence = fence_handle, .command_buffer = self.handle, .scratch = self.scratch });
        self.scratch = .{};
        self.uniform = null;
        self.uniform_cursor = 0;
        self.state = .{};
        for (self.acquired[0..self.acquired_count]) |acq| {
            acq.swapchain.image_available_seq[acq.semaphore_index] = seq;
            acq.swapchain.image_available_reserved[acq.semaphore_index] = false;
        }

        if (self.acquired_count > 0) try self.present();
        return .{ .seq = seq };
    }

    /// Ends the recording and returns the command buffer for reuse. Not allowed
    /// after a swapchain image was acquired: its semaphore must still be submitted.
    pub fn abort(self: *CommandBuffer) Error!void {
        if (self.acquired_count > 0) return error.AcquiredNotSubmitted;
        if (self.state.pass != .none) return error.PassActive;
        const dev = self.device;
        try dev.command_buffers.ensureUnusedCapacity(dev.allocator, 1);
        if (!self.ended) _ = try vk.check(dev.fns.vkEndCommandBuffer(self.handle));
        self.ended = true;
        self.scratch.destroy(dev);
        self.scratch.deinit(dev.allocator);
        self.uniform = null;
        self.uniform_cursor = 0;
        self.state = .{};
        dev.command_buffers.appendAssumeCapacity(self.handle);
    }

    fn present(self: *CommandBuffer) Error!void {
        const dev = self.device;
        var waits: [max_acquires]vk.Handle = undefined;
        var swapchains: [max_acquires]vk.Handle = undefined;
        var indices: [max_acquires]u32 = undefined;
        var results: [max_acquires]vk.Result = undefined;
        for (self.acquired[0..self.acquired_count], 0..) |acq, i| {
            waits[i] = acq.swapchain.render_finished[acq.image_index];
            swapchains[i] = acq.swapchain.handle;
            indices[i] = acq.image_index;
        }
        const present_fn = dev.fns.vkQueuePresentKHR orelse return error.ExtensionNotPresent;
        var info = std.mem.zeroes(vk.PresentInfoKHR);
        info.sType = vk.VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
        info.waitSemaphoreCount = @intCast(self.acquired_count);
        info.pWaitSemaphores = &waits;
        info.swapchainCount = @intCast(self.acquired_count);
        info.pSwapchains = &swapchains;
        info.pImageIndices = &indices;
        info.pResults = &results;
        const raw = present_fn(dev.queue, &info);
        for (results[0..self.acquired_count]) |r| {
            if (r == vk.VK_ERROR_OUT_OF_DATE_KHR) return error.SwapchainOutOfDate;
            _ = try vk.check(r);
        }
        _ = try vk.check(raw);
    }

    /// Records a layout transition for every subresource of `texture`, and updates
    /// the tracked layouts. Use `transition_subresources` for part of a texture.
    pub fn transition(self: *CommandBuffer, texture: *Texture, new_layout: i32) void {
        self.transition_subresources(texture, 0, texture.info.num_levels, 0, texture.layers, new_layout);
    }

    /// Moves the given mip and layer range into `new_layout`, recording barriers
    /// only for subresources whose tracked layout differs. Subresources with the
    /// same old layout share one barrier: a uniform range is one barrier over all its
    /// layers, otherwise one barrier per layer and run of mips (SDL uses one
    /// barrier per subresource).
    pub fn transition_subresources(self: *CommandBuffer, texture: *Texture, base_mip: u32, mip_count: u32, base_layer: u32, layer_count: u32, new_layout: i32) void {
        const levels = texture.info.num_levels;
        self.track_texture(texture) catch |err| {
            self.recording_error = err;
            return;
        };
        const layouts = self.texture_layouts(texture);
        const end_mip = base_mip + mip_count;
        const end_layer = base_layer + layer_count;

        const first_old = layouts[subresource_index(levels, base_layer, base_mip)];
        var uniform = true;
        var layer = base_layer;
        while (layer < end_layer) : (layer += 1) {
            var mip = base_mip;
            while (mip < end_mip) : (mip += 1) {
                if (layouts[subresource_index(levels, layer, mip)] != first_old) uniform = false;
            }
        }
        if (uniform) {
            if (first_old != new_layout) self.emit_layout_barrier(texture, first_old, new_layout, base_mip, mip_count, base_layer, layer_count);
        } else {
            layer = base_layer;
            while (layer < end_layer) : (layer += 1) {
                var mip = base_mip;
                while (mip < end_mip) {
                    const old = layouts[subresource_index(levels, layer, mip)];
                    var run_end = mip + 1;
                    while (run_end < end_mip and layouts[subresource_index(levels, layer, run_end)] == old) run_end += 1;
                    if (old != new_layout) self.emit_layout_barrier(texture, old, new_layout, mip, run_end - mip, layer, 1);
                    mip = run_end;
                }
            }
        }

        layer = base_layer;
        while (layer < end_layer) : (layer += 1) {
            var mip = base_mip;
            while (mip < end_mip) : (mip += 1) {
                layouts[subresource_index(levels, layer, mip)] = new_layout;
            }
        }
    }

    fn emit_layout_barrier(self: *CommandBuffer, texture: *const Texture, old_layout: i32, new_layout: i32, base_mip: u32, mip_count: u32, base_layer: u32, layer_count: u32) void {
        const old = layout_stage_access(old_layout);
        const new = layout_stage_access(new_layout);
        var barrier = std.mem.zeroes(vk.ImageMemoryBarrier);
        barrier.sType = vk.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
        barrier.srcAccessMask = old.access;
        barrier.dstAccessMask = new.access;
        barrier.oldLayout = old_layout;
        barrier.newLayout = new_layout;
        barrier.srcQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.dstQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.image = texture.active().image;
        barrier.subresourceRange = .{
            .aspectMask = texture.aspect,
            .baseMipLevel = base_mip,
            .levelCount = mip_count,
            .baseArrayLayer = base_layer,
            .layerCount = layer_count,
        };
        self.device.fns.vkCmdPipelineBarrier(self.handle, old.stage, new.stage, 0, 0, null, 0, null, 1, @ptrCast(&barrier));
    }

    /// Records that this command buffer uses `buffer`'s active backing. The
    /// reference is dropped when the submission completes or the buffer is aborted.
    pub fn track_buffer(self: *CommandBuffer, buffer: *const Buffer) Error!void {
        try self.track(.{ .buffer = buffer.active() });
    }

    /// Records that this command buffer uses `texture`'s active backing.
    pub fn track_texture(self: *CommandBuffer, texture: *const Texture) Error!void {
        const backing = texture.active();
        for (self.scratch.layouts.items) |*entry| {
            if (entry.backing == backing) {
                entry.used = true;
                return;
            }
        }
        const initial = try self.device.allocator.dupe(i32, backing.layouts);
        errdefer self.device.allocator.free(initial);
        const current = try self.device.allocator.dupe(i32, backing.layouts);
        errdefer self.device.allocator.free(current);
        try self.scratch.layouts.ensureUnusedCapacity(self.device.allocator, 1);
        try self.track(.{ .texture = backing });
        self.scratch.layouts.appendAssumeCapacity(.{ .backing = backing, .initial = initial, .current = current });
    }

    fn texture_layouts(self: *const CommandBuffer, texture: *const Texture) []i32 {
        for (self.scratch.layouts.items) |entry| if (entry.backing == texture.active()) return entry.current;
        return texture.active().layouts;
    }

    /// Layout visible to this recording, including transitions not yet submitted.
    pub fn texture_subresource_layout(self: *const CommandBuffer, texture: *const Texture, mip: u32, layer: u32) i32 {
        return self.texture_layouts(texture)[subresource_index(texture.info.num_levels, layer, mip)];
    }

    /// A full-view descriptor may only advertise a layout shared by every mip/layer.
    pub fn readable_texture_layout(self: *const CommandBuffer, texture: *const Texture) ?i32 {
        const expected = default_layout(texture.info);
        for (self.texture_layouts(texture)) |layout| if (layout != expected) return null;
        return expected;
    }

    pub fn track_graphics_pipeline(self: *CommandBuffer, object: *const pipeline.GraphicsPipeline) Error!void {
        try self.track(.{ .object = object.backing });
    }

    pub fn track_compute_pipeline(self: *CommandBuffer, object: *const pipeline.ComputePipeline) Error!void {
        try self.track(.{ .object = object.backing });
    }

    pub fn track_sampler(self: *CommandBuffer, object: *const Sampler) Error!void {
        try self.track(.{ .object = object.backing });
    }

    /// Storage descriptors expose one mip and one array layer (or a whole 3D mip).
    /// The command scratch owns the view until completion or abort.
    pub fn storage_texture_view(self: *CommandBuffer, texture: *const Texture, mip: u32, layer: u32) Error!vk.Handle {
        if (mip >= texture.info.num_levels or layer >= texture.layers) return error.OutOfRange;
        try self.track_texture(texture);
        try self.scratch.views.ensureUnusedCapacity(self.device.allocator, 1);
        var info = std.mem.zeroes(vk.ImageViewCreateInfo);
        info.sType = vk.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        info.image = texture.active().image;
        info.viewType = if (texture.info.texture_type == .@"3d") vk.VK_IMAGE_VIEW_TYPE_3D else vk.VK_IMAGE_VIEW_TYPE_2D;
        info.format = tables.texture_format(texture.info.format);
        info.components = tables.format_swizzle(texture.info.format);
        info.subresourceRange = .{ .aspectMask = texture.aspect, .baseMipLevel = mip, .levelCount = 1, .baseArrayLayer = layer, .layerCount = 1 };
        var view: vk.Handle = 0;
        _ = try vk.check(self.device.fns.vkCreateImageView(self.device.device, &info, null, &view));
        self.scratch.views.appendAssumeCapacity(view);
        return view;
    }

    fn track(self: *CommandBuffer, ref: Ref) Error!void {
        const key: usize = switch (ref) {
            .buffer => |b| @intFromPtr(b),
            .texture => |t| @intFromPtr(t),
            .object => |o| @intFromPtr(o),
        };
        const found = try self.scratch.tracked.getOrPut(self.device.allocator, key);
        if (found.found_existing) return;
        found.value_ptr.* = ref;
        switch (ref) {
            .buffer => |b| b.refs += 1,
            .texture => |t| t.refs += 1,
            .object => |o| o.refs += 1,
        }
    }

    /// Makes `buffer` writable for a command. With `cycle`, a backing that is still
    /// referenced is replaced first (SDL's VULKAN_INTERNAL_PrepareBufferForWrite).
    pub fn prepare_buffer_write(self: *CommandBuffer, buffer: *const Buffer, cycle: bool) Error!void {
        if (cycle and buffer.active().refs > 0) try cycle_buffer(self.device, buffer.container);
        try self.track_buffer(buffer);
    }

    /// Makes a mip and layer range of `texture` writable in `layout`. With `cycle`
    /// (and a texture that may be cycled) a referenced backing is replaced first.
    /// Cycling discards the old contents, as SDL does.
    pub fn prepare_texture_range(self: *CommandBuffer, texture: *Texture, base_mip: u32, mip_count: u32, base_layer: u32, layer_count: u32, cycle: bool, layout: i32) Error!void {
        if (cycle and texture.container.can_cycle and texture.active().refs > 0) try cycle_texture(self, texture);
        try self.track_texture(texture);
        // Initialize the complete view before a partial write. Later full-view
        // sampled descriptors must not include any UNDEFINED subresources.
        var layer: u32 = 0;
        while (layer < texture.layers) : (layer += 1) {
            var mip: u32 = 0;
            while (mip < texture.info.num_levels) : (mip += 1) {
                if (self.texture_subresource_layout(texture, mip, layer) == vk.VK_IMAGE_LAYOUT_UNDEFINED)
                    self.transition_subresources(texture, mip, 1, layer, 1, default_layout(texture.info));
            }
        }
        self.transition_subresources(texture, base_mip, mip_count, base_layer, layer_count, layout);
    }

    /// Copies `size` bytes between two buffers, with a memory barrier afterwards
    /// so later commands see the write. A zero size records nothing.
    pub fn copy_buffer(self: *CommandBuffer, src: *const Buffer, src_offset: u32, dst: *const Buffer, dst_offset: u32, size: u32) Error!void {
        try self.copy_buffer_cycled(src, src_offset, dst, dst_offset, size, false);
    }

    /// Like `copy_buffer`; with `cycle`, the destination is cycled first if a
    /// command still uses its active backing. Regions must lie inside their
    /// buffers (`OutOfRange`) and, when both name the same backing, must not overlap
    /// (`OverlappingRegions`, the rule `vkCmdCopyBuffer` imposes).
    pub fn copy_buffer_cycled(self: *CommandBuffer, src: *const Buffer, src_offset: u32, dst: *const Buffer, dst_offset: u32, size: u32, cycle: bool) Error!void {
        if (self.state.pass != .none and self.state.pass != .copy) return error.PassActive;
        if (size == 0) return;
        if (@as(u64, src_offset) + size > src.size or @as(u64, dst_offset) + size > dst.size) return error.OutOfRange;
        try self.prepare_buffer_write(dst, cycle);
        try self.track_buffer(src);
        const src_handle = src.active().handle;
        const dst_handle = dst.active().handle;
        if (src_handle == dst_handle) {
            const src_end = @as(u64, src_offset) + size;
            const dst_end = @as(u64, dst_offset) + size;
            if (src_offset < dst_end and dst_offset < src_end) return error.OverlappingRegions;
        }
        const region = vk.BufferCopy{ .srcOffset = src_offset, .dstOffset = dst_offset, .size = size };
        const dev = self.device;
        // A copy within one buffer moves it through both transfer modes at once.
        const same = src_handle == dst_handle;
        const src_mode = BufferUsageMode{ .copy_source = true, .copy_destination = same };
        const dst_mode = BufferUsageMode{ .copy_destination = true, .copy_source = same };
        self.buffer_transition_from_default(src, src_mode);
        if (!same) self.buffer_transition_from_default(dst, dst_mode);
        dev.fns.vkCmdCopyBuffer(self.handle, src_handle, dst_handle, 1, @ptrCast(&region));
        self.buffer_transition_to_default(src, src_mode);
        if (!same) self.buffer_transition_to_default(dst, dst_mode);
        if (dst.container.class == .transfer_buffer) self.host_read_barrier(dst);
    }

    /// Uploads a transfer buffer into a texture region. `offset` and the pixel
    /// pitches describe the source image in the transfer buffer (zero pitch means
    /// tightly packed). The texture leaves the call in its default layout.
    pub fn upload_texture(self: *CommandBuffer, source: *const TransferBuffer, transfer: types.TextureTransferInfo, dst: *Texture, region: types.TextureRegion) Error!void {
        try self.upload_texture_cycled(source, transfer, dst, region, false);
    }

    /// Like `upload_texture`; with `cycle` the destination is cycled first if bound.
    pub fn upload_texture_cycled(self: *CommandBuffer, source: *const TransferBuffer, transfer: types.TextureTransferInfo, dst: *Texture, region: types.TextureRegion, cycle: bool) Error!void {
        try self.check_region(dst, region);
        try self.track_buffer(&source.buffer);
        try self.prepare_texture_range(dst, region.mip_level, 1, region.layer, 1, cycle, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL);
        const copy = buffer_image_copy(dst, transfer, region);
        self.device.fns.vkCmdCopyBufferToImage(self.handle, source.buffer.active().handle, dst.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, @ptrCast(&copy));
        self.transition_subresources(dst, region.mip_level, 1, region.layer, 1, default_layout(dst.info));
    }

    /// Copies a texture region into a transfer buffer for CPU readback. The
    /// caller waits for the fence before mapping `dst`.
    pub fn download_texture(self: *CommandBuffer, src: *Texture, region: types.TextureRegion, dst: *const TransferBuffer, transfer: types.TextureTransferInfo) Error!void {
        try self.check_region(src, region);
        try self.track_buffer(&dst.buffer);
        try self.prepare_texture_range(src, region.mip_level, 1, region.layer, 1, false, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL);
        const copy = buffer_image_copy(src, transfer, region);
        self.device.fns.vkCmdCopyImageToBuffer(self.handle, src.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dst.buffer.active().handle, 1, @ptrCast(&copy));
        self.host_read_barrier(&dst.buffer);
        self.transition_subresources(src, region.mip_level, 1, region.layer, 1, default_layout(src.info));
        self.after_transfer_barrier();
    }

    /// SDL's VULKAN_INTERNAL_BufferMemoryBarrier: one buffer barrier from the
    /// stages and accesses of `from` to those of `to`. Staging buffers are not
    /// tracked (SDL does not barrier them): host writes before a submit are
    /// visible to it, and downloads use `host_read_barrier`.
    pub fn buffer_barrier(self: *CommandBuffer, buffer: *const Buffer, from: BufferUsageMode, to: BufferUsageMode) void {
        if (buffer.container.class == .transfer_buffer) return;
        const src = buffer_mode_stage_access(from);
        const dst = buffer_mode_stage_access(to);
        var barrier = std.mem.zeroes(vk.BufferMemoryBarrier);
        barrier.sType = vk.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER;
        barrier.srcAccessMask = src.access;
        barrier.dstAccessMask = dst.access;
        barrier.srcQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.dstQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.buffer = buffer.active().handle;
        barrier.size = vk.VK_WHOLE_SIZE;
        self.device.fns.vkCmdPipelineBarrier(self.handle, src.stage, dst.stage, 0, 0, null, 1, @ptrCast(&barrier), 0, null);
    }

    /// SDL's VULKAN_INTERNAL_BufferTransitionFromDefaultUsage.
    pub fn buffer_transition_from_default(self: *CommandBuffer, buffer: *const Buffer, to: BufferUsageMode) void {
        self.buffer_barrier(buffer, default_buffer_usage_mode(buffer.usage), to);
    }

    /// SDL's VULKAN_INTERNAL_BufferTransitionToDefaultUsage.
    pub fn buffer_transition_to_default(self: *CommandBuffer, buffer: *const Buffer, from: BufferUsageMode) void {
        self.buffer_barrier(buffer, from, default_buffer_usage_mode(buffer.usage));
    }

    /// Makes a transfer write visible to the host. Staging memory is host
    /// coherent where possible; this keeps readback correct otherwise.
    fn host_read_barrier(self: *CommandBuffer, buffer: *const Buffer) void {
        var barrier = std.mem.zeroes(vk.BufferMemoryBarrier);
        barrier.sType = vk.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER;
        barrier.srcAccessMask = vk.VK_ACCESS_TRANSFER_WRITE_BIT;
        barrier.dstAccessMask = vk.VK_ACCESS_HOST_READ_BIT;
        barrier.srcQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.dstQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED;
        barrier.buffer = buffer.active().handle;
        barrier.size = vk.VK_WHOLE_SIZE;
        self.device.fns.vkCmdPipelineBarrier(self.handle, vk.VK_PIPELINE_STAGE_TRANSFER_BIT, vk.VK_PIPELINE_STAGE_HOST_BIT, 0, 0, null, 1, @ptrCast(&barrier), 0, null);
    }

    pub fn after_transfer_barrier(self: *CommandBuffer) void {
        var barrier = std.mem.zeroes(vk.MemoryBarrier);
        barrier.sType = vk.VK_STRUCTURE_TYPE_MEMORY_BARRIER;
        barrier.srcAccessMask = vk.VK_ACCESS_TRANSFER_WRITE_BIT;
        barrier.dstAccessMask = vk.VK_ACCESS_MEMORY_READ_BIT | vk.VK_ACCESS_MEMORY_WRITE_BIT;
        self.device.fns.vkCmdPipelineBarrier(
            self.handle,
            vk.VK_PIPELINE_STAGE_TRANSFER_BIT,
            vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
            0,
            1,
            @ptrCast(&barrier),
            0,
            null,
            0,
            null,
        );
    }

    fn check_region(self: *CommandBuffer, texture: *const Texture, region: types.TextureRegion) Error!void {
        _ = self;
        const mip_w = @max(texture.info.width >> @intCast(region.mip_level), 1);
        const mip_h = @max(texture.info.height >> @intCast(region.mip_level), 1);
        if (region.mip_level >= texture.info.num_levels) return error.OutOfRange;
        if (region.layer >= texture.layers) return error.OutOfRange;
        if (@as(u64, region.x) + region.w > mip_w or @as(u64, region.y) + region.h > mip_h) return error.OutOfRange;
    }
};

fn buffer_image_copy(texture: *const Texture, transfer: types.TextureTransferInfo, region: types.TextureRegion) vk.BufferImageCopy {
    return .{
        .bufferOffset = transfer.offset,
        .bufferRowLength = transfer.pixels_per_row,
        .bufferImageHeight = transfer.rows_per_layer,
        .imageSubresource = .{
            .aspectMask = texture.aspect & ~vk.VK_IMAGE_ASPECT_STENCIL_BIT,
            .mipLevel = region.mip_level,
            .baseArrayLayer = region.layer,
            .layerCount = 1,
        },
        .imageOffset = .{ .x = @intCast(region.x), .y = @intCast(region.y), .z = @intCast(region.z) },
        .imageExtent = .{ .width = region.w, .height = region.h, .depth = region.d },
    };
}
