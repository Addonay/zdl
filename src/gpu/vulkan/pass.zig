//! Render, compute and copy passes, resource and uniform binding, draws and
//! dispatches, blits and mipmap generation.
//!
//! Port of SDL_gpu_vulkan.c's VULKAN_BeginRenderPass / VULKAN_EndRenderPass,
//! the compute and copy pass entry points, VULKAN_BlitTexture,
//! VULKAN_GenerateMipmaps and the uniform-buffer and descriptor binding paths.
//!
//! Passes are objects borrowed from their command buffer: `begin_*` returns a
//! pass value, commands are methods on it, and `end` closes it. Only one pass
//! may be open per command buffer (`PassActive` otherwise). Copies may also be
//! recorded in a copy pass; blits and mipmap generation are outside passes.
//!
//! Render pass and framebuffer objects are cached on the device, keyed the way
//! SDL keys them (attachment formats, sample counts, load and store operations,
//! final layouts). Framebuffer views are created per attachment and freed when
//! their image is released (`evict_image`) or the device is destroyed.
//!
//! Descriptor sets are written lazily: a draw after any binding change allocates
//! new sets from the command buffer's pool and binds them with the dynamic
//! offsets of the uniform data. Textures rest in their default layout between
//! passes, and render passes move attachments into the attachment layout and
//! back to rest, so sampled textures never need barriers inside a pass.
//!
//! As SDL does, render passes initialize the viewport, scissor, blend constants
//! and stencil reference before the first draw. Multisampled pipelines are created
//! against a render pass with one resolve attachment per color target, so they
//! bind only in passes that resolve; single-sample pipelines bind only in passes
//! without resolves (`PipelineTargetMismatch` otherwise). SDL's transient pipeline
//! pass has no resolves, which the Vulkan compatibility rules do not allow with
//! resolving passes.

const std = @import("std");
const types = @import("../types.zig");
const vk = @import("binding.zig");
const tables = @import("tables.zig");
const descriptors = @import("descriptors.zig");
const pipeline = @import("pipeline.zig");
const device_mod = @import("device.zig");

const Device = device_mod.Device;
const Texture = device_mod.Texture;
const Buffer = device_mod.Buffer;
const TransferBuffer = device_mod.TransferBuffer;
const Sampler = device_mod.Sampler;
const CommandBuffer = device_mod.CommandBuffer;
const Error = device_mod.Error;

/// Attachments in one render pass: colors, one depth-stencil and their resolves.
pub const max_attachments = 2 * pipeline.max_color_targets + 1;

/// The shader stage a binding belongs to. Index into `State.stages`.
pub const Stage = enum(u8) { vertex = 0, fragment = 1, compute = 2 };

/// Which kind of pass a command buffer has open.
pub const PassKind = enum { none, render, compute, copy };

/// A texture and sampler pair bound to a sampler slot.
pub const SamplerBinding = struct {
    texture: *const Texture,
    sampler: *const Sampler,
};

/// A vertex or index buffer with a byte offset into it.
pub const BufferBinding = struct {
    buffer: *const Buffer,
    offset: u32 = 0,
};

/// A color attachment. A non-null `resolve` resolves multisampled rendering into
/// that texture at the end of the pass.
pub const ColorTarget = struct {
    texture: *Texture,
    mip_level: u32 = 0,
    layer: u32 = 0,
    clear_color: types.FColor = .{},
    load_op: types.LoadOp = .load,
    store_op: types.StoreOp = .store,
    resolve: ?Resolve = null,
    /// Cycles `texture` before the pass if a command still uses it and the load op is not
    /// load (SDL's `cycle`). The contents are discarded; with a load op of load,
    /// no cycling happens.
    cycle: bool = false,
    /// Cycles the resolve texture before the pass if a command still uses it (SDL's
    /// `cycle_resolve_texture`). Ignored without a resolve target.
    cycle_resolve_texture: bool = false,
};

pub const Resolve = struct {
    texture: *Texture,
    mip_level: u32 = 0,
    layer: u32 = 0,
};

/// The depth-stencil attachment of a render pass.
pub const DepthTarget = struct {
    texture: *Texture,
    mip_level: u32 = 0,
    layer: u32 = 0,
    clear_depth: f32 = 1,
    clear_stencil: u8 = 0,
    load_op: types.LoadOp = .load,
    store_op: types.StoreOp = .store,
    stencil_load_op: types.LoadOp = .load,
    stencil_store_op: types.StoreOp = .store,
    /// Cycles the texture before the pass if a command still uses it (SDL's `cycle`).
    cycle: bool = false,
};

/// A scissor rectangle in pixels.
pub const Scissor = struct {
    x: i32 = 0,
    y: i32 = 0,
    w: u32,
    h: u32,
};

/// Read-side bindings of one stage, plus the uniform slot offsets and ranges
/// that the uniform sets are written from.
pub const StageState = struct {
    samplers: [descriptors.max_samplers]SamplerSlot = std.mem.zeroes([descriptors.max_samplers]SamplerSlot),
    storage_textures: [descriptors.max_storage_textures]?*const Texture = std.mem.zeroes([descriptors.max_storage_textures]?*const Texture),
    storage_buffers: [descriptors.max_storage_buffers]?*const Buffer = std.mem.zeroes([descriptors.max_storage_buffers]?*const Buffer),
    uniform_offsets: [descriptors.max_uniform_buffers]u32 = std.mem.zeroes([descriptors.max_uniform_buffers]u32),
    uniform_ranges: [descriptors.max_uniform_buffers]u32 = std.mem.zeroes([descriptors.max_uniform_buffers]u32),
};

pub const SamplerSlot = struct {
    texture: ?*const Texture = null,
    sampler: ?*const Sampler = null,
};

/// One writable storage-image view; the mip and layer are fixed for the pass.
pub const WriteTextureSlot = struct {
    texture: *Texture,
    mip_level: u32,
    layer: u32,
    view: vk.Handle,
};

/// Binding and pass state of one command buffer. Descriptor sets are rebuilt
/// when `dirty_resources` is set, and only the dynamic offsets are rebound when
/// `dirty_offsets` is set.
pub const State = struct {
    pass: PassKind = .none,
    graphics: ?*const pipeline.GraphicsPipeline = null,
    compute: ?*const pipeline.ComputePipeline = null,
    stages: [3]StageState = std.mem.zeroes([3]StageState),
    /// Read-write storage bound to a compute pass.
    write_textures: [descriptors.max_compute_write_textures]?WriteTextureSlot = std.mem.zeroes([descriptors.max_compute_write_textures]?WriteTextureSlot),
    write_buffers: [descriptors.max_compute_write_buffers]?*const Buffer = std.mem.zeroes([descriptors.max_compute_write_buffers]?*const Buffer),
    /// Sets bound by the last descriptor update; sets 0 to 3 (compute uses 0 to 2).
    bound_sets: [4]vk.Handle = .{ 0, 0, 0, 0 },
    dirty_resources: bool = true,
    dirty_offsets: bool = false,
    /// Color target count of the open render pass, for pipeline checks.
    color_count: u32 = 0,
    /// Whether the open render pass has resolve attachments.
    resolve_attachments: bool = false,
    /// Index buffer of the pass; tracked by indexed draws, since binding returns no error.
    index_buffer: ?*const Buffer = null,
};

/// An open render pass. Commands are recorded into `command_buffer`.
pub const RenderPass = struct {
    command_buffer: *CommandBuffer,
    width: u32,
    height: u32,
    color_count: u32,
    /// Whether any color target has a resolve attachment.
    has_resolve: bool = false,
    /// Final layout of each attachment subresource, recorded after `end`.
    finals: [max_attachments]Final = undefined,
    final_count: u32 = 0,

    const Final = struct { texture: *Texture, mip: u32, layer: u32, layout: i32 };

    /// Closes the pass and records the final layouts of its attachment subresources.
    pub fn end(self: *RenderPass) void {
        const cb = self.command_buffer;
        cb.device.fns.vkCmdEndRenderPass(cb.handle);
        // Keep attachment layouts through vkCmdEndRenderPass, then explicitly make
        // writes visible to subsequent sampling, copying or attachment accesses.
        for (self.finals[0..self.final_count]) |f| cb.transition_subresources(f.texture, f.mip, 1, f.layer, 1, f.layout);
        cb.state.pass = .none;
        cb.state.graphics = null;
        cb.state.color_count = 0;
        cb.state.resolve_attachments = false;
        cb.state.index_buffer = null;
        cb.state.dirty_resources = true;
        cb.state.dirty_offsets = false;
        self.* = undefined;
    }

    /// Binds a graphics pipeline. Its color target count and resolve presence must
    /// match the pass, since Vulkan requires compatible render passes.
    pub fn bind_graphics_pipeline(self: *RenderPass, pipe: *const pipeline.GraphicsPipeline) Error!void {
        if (pipe.color_target_count != self.color_count or pipe.resolve_attachments != self.has_resolve) return error.PipelineTargetMismatch;
        const cb = self.command_buffer;
        try cb.track_graphics_pipeline(pipe);
        cb.device.fns.vkCmdBindPipeline(cb.handle, vk.VK_PIPELINE_BIND_POINT_GRAPHICS, pipe.handle);
        cb.state.graphics = pipe;
        cb.state.dirty_resources = true;
    }

    /// Binds vertex buffers starting at `first_slot`.
    pub fn bind_vertex_buffers(self: *RenderPass, first_slot: u32, bindings: []const BufferBinding) Error!void {
        if (bindings.len == 0) return;
        if (bindings.len > pipeline.max_vertex_buffers) return error.TooManyBindings;
        var handles: [pipeline.max_vertex_buffers]vk.Handle = undefined;
        var offsets: [pipeline.max_vertex_buffers]vk.DeviceSize = undefined;
        for (bindings, 0..) |b, i| {
            try self.command_buffer.track_buffer(b.buffer);
            handles[i] = b.buffer.active().handle;
            offsets[i] = b.offset;
        }
        const cb = self.command_buffer;
        cb.device.fns.vkCmdBindVertexBuffers(cb.handle, first_slot, @intCast(bindings.len), &handles, &offsets);
    }

    /// Binds an index buffer. `offset` is in bytes. The buffer is tracked by the
    /// indexed draws that use it.
    pub fn bind_index_buffer(self: *RenderPass, binding: BufferBinding, element: types.IndexElementSize) void {
        const cb = self.command_buffer;
        cb.state.index_buffer = binding.buffer;
        cb.device.fns.vkCmdBindIndexBuffer(cb.handle, binding.buffer.active().handle, binding.offset, tables.index_type[@backingInt(element)]);
    }

    pub fn bind_vertex_samplers(self: *RenderPass, first: u32, bindings: []const SamplerBinding) Error!void {
        try bind_samplers(self.command_buffer, .vertex, first, bindings);
    }

    pub fn bind_fragment_samplers(self: *RenderPass, first: u32, bindings: []const SamplerBinding) Error!void {
        try bind_samplers(self.command_buffer, .fragment, first, bindings);
    }

    pub fn bind_vertex_storage_textures(self: *RenderPass, first: u32, textures: []const *const Texture) Error!void {
        try bind_storage_textures(self.command_buffer, .vertex, first, textures);
    }

    pub fn bind_fragment_storage_textures(self: *RenderPass, first: u32, textures: []const *const Texture) Error!void {
        try bind_storage_textures(self.command_buffer, .fragment, first, textures);
    }

    pub fn bind_vertex_storage_buffers(self: *RenderPass, first: u32, buffers: []const *const Buffer) Error!void {
        try bind_storage_buffers(self.command_buffer, .vertex, first, buffers);
    }

    pub fn bind_fragment_storage_buffers(self: *RenderPass, first: u32, buffers: []const *const Buffer) Error!void {
        try bind_storage_buffers(self.command_buffer, .fragment, first, buffers);
    }

    /// Copies `data` into the uniform ring and binds it to uniform slot `slot`
    /// of the vertex stage for later draws. The data must be no larger than the
    /// uniform buffer.
    pub fn push_vertex_uniform_data(self: *RenderPass, slot: u32, data: []const u8) Error!void {
        try push_uniform_data(self.command_buffer, .vertex, slot, data);
    }

    pub fn push_fragment_uniform_data(self: *RenderPass, slot: u32, data: []const u8) Error!void {
        try push_uniform_data(self.command_buffer, .fragment, slot, data);
    }

    /// Uses SDL's top-left viewport convention, including Vulkan's vertical flip.
    pub fn set_viewport(self: *RenderPass, viewport: types.Viewport) void {
        const v = vk.Viewport{ .x = viewport.x, .y = viewport.y + viewport.h, .width = viewport.w, .height = -viewport.h, .minDepth = viewport.min_depth, .maxDepth = viewport.max_depth };
        const cb = self.command_buffer;
        cb.device.fns.vkCmdSetViewport(cb.handle, 0, 1, @ptrCast(&v));
    }

    pub fn set_scissor(self: *RenderPass, scissor: Scissor) void {
        const rect = vk.Rect2D{ .offset = .{ .x = scissor.x, .y = scissor.y }, .extent = .{ .width = scissor.w, .height = scissor.h } };
        const cb = self.command_buffer;
        cb.device.fns.vkCmdSetScissor(cb.handle, 0, 1, @ptrCast(&rect));
    }

    pub fn set_blend_constants(self: *RenderPass, color: types.FColor) void {
        const constants = [4]f32{ color.r, color.g, color.b, color.a };
        const cb = self.command_buffer;
        cb.device.fns.vkCmdSetBlendConstants(cb.handle, &constants);
    }

    pub fn set_stencil_reference(self: *RenderPass, reference: u8) void {
        const cb = self.command_buffer;
        cb.device.fns.vkCmdSetStencilReference(cb.handle, vk.VK_STENCIL_FACE_FRONT_AND_BACK, reference);
    }

    pub fn draw_primitives(self: *RenderPass, num_vertices: u32, num_instances: u32, first_vertex: u32, first_instance: u32) Error!void {
        const cb = self.command_buffer;
        try prepare_graphics(cb);
        cb.device.fns.vkCmdDraw(cb.handle, num_vertices, num_instances, first_vertex, first_instance);
    }

    pub fn draw_indexed_primitives(self: *RenderPass, num_indices: u32, num_instances: u32, first_index: u32, vertex_offset: i32, first_instance: u32) Error!void {
        const cb = self.command_buffer;
        try prepare_graphics(cb);
        if (cb.state.index_buffer) |ib| try cb.track_buffer(ib);
        cb.device.fns.vkCmdDrawIndexed(cb.handle, num_indices, num_instances, first_index, vertex_offset, first_instance);
    }

    /// Draws `draw_count` `IndirectDrawCommand` records from `buffer` at `offset`.
    pub fn draw_primitives_indirect(self: *RenderPass, buffer: *const Buffer, offset: u32, draw_count: u32) Error!void {
        if (!buffer.usage.indirect) return error.UnsupportedUsage;
        const cb = self.command_buffer;
        if (!cb.device.features.draw_indirect_first_instance or (draw_count > 1 and !cb.device.features.multi_draw_indirect)) return error.UnsupportedFeature;
        try prepare_graphics(cb);
        try cb.track_buffer(buffer);
        cb.device.fns.vkCmdDrawIndirect(cb.handle, buffer.active().handle, offset, draw_count, @sizeOf(types.IndirectDrawCommand));
    }

    /// Draws `draw_count` `IndexedIndirectDrawCommand` records from `buffer`.
    pub fn draw_indexed_primitives_indirect(self: *RenderPass, buffer: *const Buffer, offset: u32, draw_count: u32) Error!void {
        if (!buffer.usage.indirect) return error.UnsupportedUsage;
        const cb = self.command_buffer;
        if (!cb.device.features.draw_indirect_first_instance or (draw_count > 1 and !cb.device.features.multi_draw_indirect)) return error.UnsupportedFeature;
        try prepare_graphics(cb);
        if (cb.state.index_buffer) |ib| try cb.track_buffer(ib);
        try cb.track_buffer(buffer);
        cb.device.fns.vkCmdDrawIndexedIndirect(cb.handle, buffer.active().handle, offset, draw_count, @sizeOf(types.IndexedIndirectDrawCommand));
    }
};

/// An open compute pass. Read-write storage is fixed when the pass begins.
pub const ComputePass = struct {
    command_buffer: *CommandBuffer,

    /// Ends the pass with a memory barrier, so later commands see the writes.
    pub fn end(self: *ComputePass) void {
        const cb = self.command_buffer;
        var barrier = std.mem.zeroes(vk.MemoryBarrier);
        barrier.sType = vk.VK_STRUCTURE_TYPE_MEMORY_BARRIER;
        barrier.srcAccessMask = vk.VK_ACCESS_SHADER_WRITE_BIT;
        barrier.dstAccessMask = vk.VK_ACCESS_MEMORY_READ_BIT | vk.VK_ACCESS_MEMORY_WRITE_BIT;
        cb.device.fns.vkCmdPipelineBarrier(cb.handle, vk.VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT, vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT, 0, 1, @ptrCast(&barrier), 0, null, 0, null);
        for (cb.state.write_buffers) |maybe| {
            if (maybe) |buffer| cb.buffer_transition_to_default(buffer, .{ .compute_storage_read_write = true });
        }
        cb.state.pass = .none;
        cb.state.compute = null;
        cb.state.write_textures = std.mem.zeroes(@TypeOf(cb.state.write_textures));
        cb.state.write_buffers = std.mem.zeroes(@TypeOf(cb.state.write_buffers));
        cb.state.dirty_resources = true;
        cb.state.dirty_offsets = false;
        self.* = undefined;
    }

    pub fn bind_compute_pipeline(self: *ComputePass, pipe: *const pipeline.ComputePipeline) Error!void {
        const cb = self.command_buffer;
        try cb.track_compute_pipeline(pipe);
        cb.device.fns.vkCmdBindPipeline(cb.handle, vk.VK_PIPELINE_BIND_POINT_COMPUTE, pipe.handle);
        cb.state.compute = pipe;
        cb.state.dirty_resources = true;
    }

    pub fn bind_compute_samplers(self: *ComputePass, first: u32, bindings: []const SamplerBinding) Error!void {
        try bind_samplers(self.command_buffer, .compute, first, bindings);
    }

    /// Binds read-only storage textures (sampled in the shader).
    pub fn bind_compute_storage_textures(self: *ComputePass, first: u32, textures: []const *const Texture) Error!void {
        try bind_storage_textures(self.command_buffer, .compute, first, textures);
    }

    /// Binds read-only storage buffers.
    pub fn bind_compute_storage_buffers(self: *ComputePass, first: u32, buffers: []const *const Buffer) Error!void {
        try bind_storage_buffers(self.command_buffer, .compute, first, buffers);
    }

    pub fn push_compute_uniform_data(self: *ComputePass, slot: u32, data: []const u8) Error!void {
        try push_uniform_data(self.command_buffer, .compute, slot, data);
    }

    /// Dispatches `x` by `y` by `z` workgroups.
    pub fn dispatch(self: *ComputePass, x: u32, y: u32, z: u32) Error!void {
        const cb = self.command_buffer;
        try prepare_compute(cb);
        cb.device.fns.vkCmdDispatch(cb.handle, x, y, z);
    }

    /// Dispatches workgroups described by an `IndirectDispatchCommand` at `offset`.
    pub fn dispatch_indirect(self: *ComputePass, buffer: *const Buffer, offset: u32) Error!void {
        if (!buffer.usage.indirect) return error.UnsupportedUsage;
        const cb = self.command_buffer;
        try prepare_compute(cb);
        try cb.track_buffer(buffer);
        cb.device.fns.vkCmdDispatchIndirect(cb.handle, buffer.active().handle, offset);
    }
};

/// A transfer-buffer side of a copy: the buffer and the byte offset into it.
pub const TransferLocation = struct {
    transfer: *const TransferBuffer,
    offset: u32 = 0,
};

/// A GPU-buffer side of a copy: the buffer, a byte offset, and the byte size.
pub const BufferSpan = struct {
    buffer: *const Buffer,
    offset: u32 = 0,
    size: u32,
};

/// An open copy pass. Its commands are the explicit copy functions of
/// `CommandBuffer`, grouped as SDL requires. The `_cycled` variants take SDL's
/// `cycle` flag: the destination is replaced by an unused backing first when a
/// command still uses it.
pub const CopyPass = struct {
    command_buffer: *CommandBuffer,

    pub fn end(self: *CopyPass) void {
        self.command_buffer.state.pass = .none;
        self.* = undefined;
    }

    pub fn upload_to_texture(self: *CopyPass, source: *const TransferBuffer, transfer: types.TextureTransferInfo, dst: *Texture, region: types.TextureRegion) Error!void {
        try self.command_buffer.upload_texture(source, transfer, dst, region);
    }

    pub fn upload_to_texture_cycled(self: *CopyPass, source: *const TransferBuffer, transfer: types.TextureTransferInfo, dst: *Texture, region: types.TextureRegion, cycle: bool) Error!void {
        try self.command_buffer.upload_texture_cycled(source, transfer, dst, region, cycle);
    }

    pub fn download_from_texture(self: *CopyPass, src: *Texture, region: types.TextureRegion, dst: *const TransferBuffer, transfer: types.TextureTransferInfo) Error!void {
        try self.command_buffer.download_texture(src, region, dst, transfer);
    }

    /// Copies `destination.size` bytes from the transfer buffer at `source.offset` into
    /// the GPU buffer. A zero size records nothing; regions must lie inside their
    /// buffers (`OutOfRange`).
    pub fn upload_to_buffer(self: *CopyPass, source: TransferLocation, destination: BufferSpan, cycle: bool) Error!void {
        try self.command_buffer.copy_buffer_cycled(&source.transfer.buffer, source.offset, destination.buffer, destination.offset, destination.size, cycle);
    }

    /// Copies `source.size` bytes from the GPU buffer into the transfer buffer at
    /// `destination.offset`. The caller waits for the fence before mapping the transfer buffer.
    pub fn download_from_buffer(self: *CopyPass, source: BufferSpan, destination: TransferLocation) Error!void {
        try self.command_buffer.copy_buffer_cycled(source.buffer, source.offset, &destination.transfer.buffer, destination.offset, source.size, false);
    }

    pub fn copy_buffer_to_buffer(self: *CopyPass, src: *const Buffer, src_offset: u32, dst: *const Buffer, dst_offset: u32, size: u32) Error!void {
        try self.command_buffer.copy_buffer(src, src_offset, dst, dst_offset, size);
    }

    pub fn copy_buffer_to_buffer_cycled(self: *CopyPass, src: *const Buffer, src_offset: u32, dst: *const Buffer, dst_offset: u32, size: u32, cycle: bool) Error!void {
        try self.command_buffer.copy_buffer_cycled(src, src_offset, dst, dst_offset, size, cycle);
    }

    pub fn copy_texture_to_texture(self: *CopyPass, src: *Texture, src_location: types.TextureLocation, dst: *Texture, dst_location: types.TextureLocation, w: u32, h: u32, d: u32) Error!void {
        try copy_texture(self.command_buffer, src, src_location, dst, dst_location, w, h, d);
    }

    pub fn copy_texture_to_texture_cycled(self: *CopyPass, src: *Texture, src_location: types.TextureLocation, dst: *Texture, dst_location: types.TextureLocation, w: u32, h: u32, d: u32, cycle: bool) Error!void {
        try copy_texture_cycled(self.command_buffer, src, src_location, dst, dst_location, w, h, d, cycle);
    }
};

// ---------------------------------------------------------------------------
// Pass begin
// ---------------------------------------------------------------------------

/// Begins a render pass with the given targets. At least one target is required;
/// all targets must share one size at their mip levels. Each attachment is moved to
/// the attachment layout here (cycling first when requested) and recorded in its
/// final layout at `end`. Pipelines bound inside must match its resolve presence.
pub fn begin_render_pass(cb: *CommandBuffer, colors: []const ColorTarget, depth: ?DepthTarget) Error!RenderPass {
    if (cb.state.pass != .none) return error.PassActive;
    if (colors.len == 0 and depth == null) return error.NoTargets;
    if (colors.len > pipeline.max_color_targets) return error.TooManyColorTargets;

    const first_size = if (colors.len > 0)
        mip_size(colors[0].texture, colors[0].mip_level)
    else
        mip_size(depth.?.texture, depth.?.mip_level);
    const width = first_size.w;
    const height = first_size.h;

    var atts: [max_attachments]Attachment = undefined;
    var count: usize = 0;
    var samples: types.SampleCount = .@"1";
    for (colors, 0..) |c, i| {
        if (!c.texture.info.usage.color_target) return error.UnsupportedUsage;
        try check_subresource(c.texture, c.mip_level, c.layer);
        try check_size(c.texture, c.mip_level, width, height);
        if (i == 0) samples = c.texture.info.sample_count;
        if (c.texture.info.sample_count != samples) return error.UnsupportedSampleCount;
        atts[count] = .{
            .kind = .color,
            .target = @intCast(i),
            .texture = c.texture,
            .mip = c.mip_level,
            .layer = c.layer,
            .load = tables.load_op[@backingInt(c.load_op)],
            .store = tables.store_op[@backingInt(c.store_op)],
            .stencil_load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            .stencil_store = vk.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            .clear = clear_color(c.clear_color),
            // SDL cycles a color target only when its load op discards the contents.
            .cycle = c.cycle and c.load_op != .load,
        };
        count += 1;
    }
    if (depth) |d| {
        if (!d.texture.info.usage.depth_stencil_target) return error.UnsupportedUsage;
        try check_subresource(d.texture, d.mip_level, d.layer);
        try check_size(d.texture, d.mip_level, width, height);
        if (d.texture.info.sample_count != samples and colors.len > 0) return error.UnsupportedSampleCount;
        atts[count] = .{
            .kind = .depth,
            .target = 0,
            .texture = d.texture,
            .mip = d.mip_level,
            .layer = d.layer,
            .load = tables.load_op[@backingInt(d.load_op)],
            .store = tables.store_op[@backingInt(d.store_op)],
            .stencil_load = tables.load_op[@backingInt(d.stencil_load_op)],
            .stencil_store = tables.store_op[@backingInt(d.stencil_store_op)],
            .clear = depth_clear(d.clear_depth, d.clear_stencil),
            // SDL cycles a depth target when any of its load ops discards the contents.
            .cycle = d.cycle and (d.load_op != .load or d.stencil_load_op != .load),
        };
        count += 1;
    }
    var has_resolve = false;
    for (colors, 0..) |c, i| {
        const r = c.resolve orelse continue;
        if (r.texture.info.sample_count != .@"1") return error.UnsupportedSampleCount;
        try check_subresource(r.texture, r.mip_level, r.layer);
        try check_size(r.texture, r.mip_level, width, height);
        atts[count] = .{
            .kind = .resolve,
            .target = @intCast(i),
            .texture = r.texture,
            .mip = r.mip_level,
            .layer = r.layer,
            .load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            .store = vk.VK_ATTACHMENT_STORE_OP_STORE,
            .stencil_load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            .stencil_store = vk.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            .clear = .{ .words = .{ 0, 0, 0, 0 } },
            .cycle = c.cycle_resolve_texture,
        };
        count += 1;
        has_resolve = true;
    }

    // Prepare every attachment: cycle when requested, track, and move the
    // subresource into the layout the pass uses.
    for (atts[0..count]) |a| {
        const layout: i32 = if (a.kind == .depth) vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL else vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
        try cb.prepare_texture_range(a.texture, a.mip, 1, a.layer, 1, a.cycle, layout);
    }

    var key = RenderPassKey{ .count = @intCast(count) };
    for (atts[0..count], 0..) |a, i| {
        key.attachments[i] = a.key(if (a.kind == .depth) vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL else vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL);
    }
    const render_pass = try fetch_render_pass(cb.device, key);
    const framebuffer = try fetch_framebuffer(cb, render_pass, atts[0..count], width, height);

    var clears: [max_attachments]vk.ClearValue = undefined;
    for (atts[0..count], 0..) |a, i| clears[i] = a.clear;
    var begin = std.mem.zeroes(vk.RenderPassBeginInfo);
    begin.sType = vk.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    begin.renderPass = render_pass;
    begin.framebuffer = framebuffer;
    begin.renderArea = .{ .offset = .{ .x = 0, .y = 0 }, .extent = .{ .width = width, .height = height } };
    begin.clearValueCount = @intCast(count);
    begin.pClearValues = &clears;
    cb.device.fns.vkCmdBeginRenderPass(cb.handle, &begin, 0);

    var pass = RenderPass{
        .command_buffer = cb,
        .width = width,
        .height = height,
        .color_count = @intCast(colors.len),
        .has_resolve = has_resolve,
    };
    for (atts[0..count]) |a| {
        pass.finals[pass.final_count] = .{ .texture = a.texture, .mip = a.mip, .layer = a.layer, .layout = attachment_final_layout(a.texture) };
        pass.final_count += 1;
    }
    cb.state.pass = .render;
    cb.state.color_count = @intCast(colors.len);
    cb.state.resolve_attachments = has_resolve;
    cb.state.index_buffer = null;
    cb.state.graphics = null;
    cb.state.dirty_resources = true;
    cb.state.dirty_offsets = false;

    pass.set_viewport(.{ .x = 0, .y = 0, .w = @floatFromInt(width), .h = @floatFromInt(height) });
    pass.set_scissor(.{ .w = width, .h = height });
    pass.set_blend_constants(.{ .r = 1, .g = 1, .b = 1, .a = 1 });
    pass.set_stencil_reference(0);
    return pass;
}

/// A storage texture subresource a compute pass writes, with SDL's cycle flag.
/// A 3D mip exposes all its depth slices; `layer` is zero for 3D textures.
pub const WriteTexture = struct {
    texture: *Texture,
    mip_level: u32 = 0,
    layer: u32 = 0,
    cycle: bool = false,
};

/// A storage buffer a compute pass writes, with SDL's per-binding cycle flag.
pub const WriteBuffer = struct {
    buffer: *Buffer,
    cycle: bool = false,
};

/// Begins a compute pass. Read-write storage textures and buffers are bound for
/// the whole pass; textures move to the general layout.
pub fn begin_compute_pass(cb: *CommandBuffer, write_textures: []const *Texture, write_buffers: []const *Buffer) Error!ComputePass {
    var textures: [descriptors.max_compute_write_textures]WriteTexture = undefined;
    var buffers: [descriptors.max_compute_write_buffers]WriteBuffer = undefined;
    if (write_textures.len > textures.len or write_buffers.len > buffers.len) return error.TooManyBindings;
    for (write_textures, 0..) |t, i| textures[i] = .{ .texture = t };
    for (write_buffers, 0..) |b, i| buffers[i] = .{ .buffer = b };
    return begin_compute_pass_cycled(cb, textures[0..write_textures.len], buffers[0..write_buffers.len]);
}

/// Like `begin_compute_pass`, with mip/layer selection and a cycle flag for each
/// written texture. The compatibility entry point selects mip zero and layer zero.
pub fn begin_compute_pass_cycled(cb: *CommandBuffer, write_textures: []const WriteTexture, write_buffers: []const WriteBuffer) Error!ComputePass {
    if (cb.state.pass != .none) return error.PassActive;
    if (write_textures.len > descriptors.max_compute_write_textures or write_buffers.len > descriptors.max_compute_write_buffers) return error.TooManyBindings;
    // A failed begin must not leave bindings that a later `end` would act on.
    cb.state.write_textures = std.mem.zeroes(@TypeOf(cb.state.write_textures));
    cb.state.write_buffers = std.mem.zeroes(@TypeOf(cb.state.write_buffers));
    errdefer {
        cb.state.write_textures = std.mem.zeroes(@TypeOf(cb.state.write_textures));
        cb.state.write_buffers = std.mem.zeroes(@TypeOf(cb.state.write_buffers));
    }
    for (write_textures, 0..) |w, i| {
        if (!w.texture.info.usage.any_storage_write()) return error.UnsupportedUsage;
        try check_subresource(w.texture, w.mip_level, w.layer);
        try cb.prepare_texture_range(w.texture, w.mip_level, 1, w.layer, 1, w.cycle, vk.VK_IMAGE_LAYOUT_GENERAL);
        const view = try cb.storage_texture_view(w.texture, w.mip_level, w.layer);
        cb.state.write_textures[i] = .{ .texture = w.texture, .mip_level = w.mip_level, .layer = w.layer, .view = view };
    }
    for (write_buffers, 0..) |w, i| {
        if (!w.buffer.usage.compute_storage_write) return error.UnsupportedUsage;
        try cb.prepare_buffer_write(w.buffer, w.cycle);
        // SDL's PrepareBufferForWrite: leave the default usage for read-write
        // compute access; `end` returns every written buffer to its default.
        cb.buffer_transition_from_default(w.buffer, .{ .compute_storage_read_write = true });
        cb.state.write_buffers[i] = w.buffer;
    }
    cb.state.pass = .compute;
    cb.state.compute = null;
    cb.state.dirty_resources = true;
    cb.state.dirty_offsets = false;
    return .{ .command_buffer = cb };
}

/// Begins a copy pass. Copies outside a pass remain valid on `CommandBuffer`.
pub fn begin_copy_pass(cb: *CommandBuffer) Error!CopyPass {
    if (cb.state.pass != .none) return error.PassActive;
    cb.state.pass = .copy;
    return .{ .command_buffer = cb };
}

// ---------------------------------------------------------------------------
// Copies, blits and mipmaps (outside passes)
// ---------------------------------------------------------------------------

/// A blit between two textures. Regions are in texels; sizes may differ, in
/// which case `filter` scales the source region to the destination region.
pub const BlitInfo = struct {
    source: *Texture,
    source_region: types.TextureRegion,
    destination: *Texture,
    destination_region: types.TextureRegion,
    filter: types.Filter = .linear,
};

/// Copies a region between two textures of the same format, through transfer layouts.
pub fn copy_texture(cb: *CommandBuffer, src: *Texture, src_loc: types.TextureLocation, dst: *Texture, dst_loc: types.TextureLocation, w: u32, h: u32, d: u32) Error!void {
    return copy_texture_cycled(cb, src, src_loc, dst, dst_loc, w, h, d, false);
}

/// Like `copy_texture`; with `cycle` the destination is cycled first if a command
/// still uses it. The source is never cycled.
pub fn copy_texture_cycled(cb: *CommandBuffer, src: *Texture, src_loc: types.TextureLocation, dst: *Texture, dst_loc: types.TextureLocation, w: u32, h: u32, d: u32, cycle: bool) Error!void {
    if (cb.state.pass != .none and cb.state.pass != .copy) return error.PassActive;
    if (src.info.format != dst.info.format) return error.UnsupportedFormat;
    const src_w = mip_size(src, src_loc.mip_level);
    const dst_w = mip_size(dst, dst_loc.mip_level);
    if (@as(u64, src_loc.x) + w > src_w.w or @as(u64, src_loc.y) + h > src_w.h) return error.OutOfRange;
    if (@as(u64, dst_loc.x) + w > dst_w.w or @as(u64, dst_loc.y) + h > dst_w.h) return error.OutOfRange;
    try check_subresource(src, src_loc.mip_level, src_loc.layer);
    try check_subresource(dst, dst_loc.mip_level, dst_loc.layer);
    try cb.prepare_texture_range(dst, dst_loc.mip_level, 1, dst_loc.layer, 1, cycle, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL);
    try cb.prepare_texture_range(src, src_loc.mip_level, 1, src_loc.layer, 1, false, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL);
    const copy = vk.ImageCopy{
        .srcSubresource = .{ .aspectMask = src.aspect & ~vk.VK_IMAGE_ASPECT_STENCIL_BIT, .mipLevel = src_loc.mip_level, .baseArrayLayer = src_loc.layer, .layerCount = 1 },
        .srcOffset = .{ .x = @intCast(src_loc.x), .y = @intCast(src_loc.y), .z = @intCast(src_loc.z) },
        .dstSubresource = .{ .aspectMask = dst.aspect & ~vk.VK_IMAGE_ASPECT_STENCIL_BIT, .mipLevel = dst_loc.mip_level, .baseArrayLayer = dst_loc.layer, .layerCount = 1 },
        .dstOffset = .{ .x = @intCast(dst_loc.x), .y = @intCast(dst_loc.y), .z = @intCast(dst_loc.z) },
        .extent = .{ .width = w, .height = h, .depth = d },
    };
    cb.device.fns.vkCmdCopyImage(cb.handle, src.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, dst.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, @ptrCast(&copy));
    cb.transition_subresources(src, src_loc.mip_level, 1, src_loc.layer, 1, device_mod.default_layout(src.info));
    cb.transition_subresources(dst, dst_loc.mip_level, 1, dst_loc.layer, 1, device_mod.default_layout(dst.info));
    cb.after_transfer_barrier();
}

/// Blits between two textures with `vkCmdBlitImage`. Color formats only.
pub fn blit_texture(cb: *CommandBuffer, info: BlitInfo) Error!void {
    if (cb.state.pass != .none) return error.PassActive;
    if (types.is_depth_format(info.source.info.format) or types.is_depth_format(info.destination.info.format)) return error.UnsupportedFormat;
    try check_region(info.source, info.source_region);
    try check_region(info.destination, info.destination_region);
    const s = info.source_region;
    const d = info.destination_region;
    try cb.prepare_texture_range(info.source, s.mip_level, 1, s.layer, 1, false, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL);
    try cb.prepare_texture_range(info.destination, d.mip_level, 1, d.layer, 1, false, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL);
    const blit = vk.ImageBlit{
        .srcSubresource = .{ .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT, .mipLevel = s.mip_level, .baseArrayLayer = s.layer, .layerCount = 1 },
        .srcOffsets = .{
            .{ .x = @intCast(s.x), .y = @intCast(s.y), .z = @intCast(s.z) },
            .{ .x = @intCast(s.x + s.w), .y = @intCast(s.y + s.h), .z = @intCast(s.z + s.d) },
        },
        .dstSubresource = .{ .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT, .mipLevel = d.mip_level, .baseArrayLayer = d.layer, .layerCount = 1 },
        .dstOffsets = .{
            .{ .x = @intCast(d.x), .y = @intCast(d.y), .z = @intCast(d.z) },
            .{ .x = @intCast(d.x + d.w), .y = @intCast(d.y + d.h), .z = @intCast(d.z + d.d) },
        },
    };
    cb.device.fns.vkCmdBlitImage(cb.handle, info.source.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, info.destination.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, @ptrCast(&blit), tables.filter[@backingInt(info.filter)]);
    cb.transition_subresources(info.source, s.mip_level, 1, s.layer, 1, device_mod.default_layout(info.source.info));
    cb.transition_subresources(info.destination, d.mip_level, 1, d.layer, 1, device_mod.default_layout(info.destination.info));
}

/// Fills every mip level after level 0 by blitting each level from the one above
/// it. The texture must have more than one level and a color format.
pub fn generate_mipmaps(cb: *CommandBuffer, texture: *Texture) Error!void {
    if (cb.state.pass != .none) return error.PassActive;
    if (texture.info.num_levels <= 1) return;
    if (types.is_depth_format(texture.info.format)) return error.UnsupportedFormat;
    const levels = texture.info.num_levels;
    const is_3d = texture.info.texture_type == .@"3d";
    const depth = if (is_3d) texture.info.layer_count_or_depth else 1;

    // Every level starts in transfer-destination layout; each source level is
    // flipped to transfer-source just before it is read. At the end every level is
    // back in its default layout.
    try cb.prepare_texture_range(texture, 0, levels, 0, texture.layers, false, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL);
    var level: u32 = 1;
    while (level < levels) : (level += 1) {
        cb.transition_subresources(texture, level - 1, 1, 0, texture.layers, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL);
        const src_w = mip_dims(texture, level - 1, depth);
        const dst_w = mip_dims(texture, level, depth);
        const blit = vk.ImageBlit{
            .srcSubresource = .{ .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT, .mipLevel = level - 1, .baseArrayLayer = 0, .layerCount = texture.layers },
            .srcOffsets = .{ .{ .x = 0, .y = 0, .z = 0 }, .{ .x = @intCast(src_w.w), .y = @intCast(src_w.h), .z = @intCast(src_w.d) } },
            .dstSubresource = .{ .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT, .mipLevel = level, .baseArrayLayer = 0, .layerCount = texture.layers },
            .dstOffsets = .{ .{ .x = 0, .y = 0, .z = 0 }, .{ .x = @intCast(dst_w.w), .y = @intCast(dst_w.h), .z = @intCast(dst_w.d) } },
        };
        cb.device.fns.vkCmdBlitImage(cb.handle, texture.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, texture.active().image, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, @ptrCast(&blit), vk.VK_FILTER_LINEAR);
    }
    cb.transition(texture, device_mod.default_layout(texture.info));
}

// ---------------------------------------------------------------------------
// Descriptor and uniform state
// ---------------------------------------------------------------------------

fn bind_samplers(cb: *CommandBuffer, stage: Stage, first: u32, bindings: []const SamplerBinding) Error!void {
    if (cb.state.pass == .none) return error.NoActivePass;
    const limit = descriptors.max_samplers;
    if (first + bindings.len > limit) return error.TooManyBindings;
    const st = &cb.state.stages[@backingInt(stage)];
    for (bindings, 0..) |b, i| {
        if (!b.texture.info.usage.sampler) return error.UnsupportedUsage;
        try cb.track_texture(b.texture);
        try cb.track_sampler(b.sampler);
        st.samplers[first + i] = .{ .texture = b.texture, .sampler = b.sampler };
    }
    cb.state.dirty_resources = true;
}

fn bind_storage_textures(cb: *CommandBuffer, stage: Stage, first: u32, textures: []const *const Texture) Error!void {
    if (cb.state.pass == .none) return error.NoActivePass;
    if (first + textures.len > descriptors.max_storage_textures) return error.TooManyBindings;
    const st = &cb.state.stages[@backingInt(stage)];
    for (textures, 0..) |t, i| {
        if (!t.info.usage.graphics_storage_read and !t.info.usage.compute_storage_read) return error.UnsupportedUsage;
        try cb.track_texture(t);
        st.storage_textures[first + i] = t;
    }
    cb.state.dirty_resources = true;
}

fn bind_storage_buffers(cb: *CommandBuffer, stage: Stage, first: u32, buffers: []const *const Buffer) Error!void {
    if (cb.state.pass == .none) return error.NoActivePass;
    if (first + buffers.len > descriptors.max_storage_buffers) return error.TooManyBindings;
    const st = &cb.state.stages[@backingInt(stage)];
    for (buffers, 0..) |b, i| {
        if (!b.usage.graphics_storage_read and !b.usage.compute_storage_read) return error.UnsupportedUsage;
        try cb.track_buffer(b);
        st.storage_buffers[first + i] = b;
    }
    cb.state.dirty_resources = true;
}

/// Copies `data` into the current uniform buffer and records its offset for
/// `slot`. A change of range rewrites the descriptor; an unchanged range only
/// updates the dynamic offset.
fn push_uniform_data(cb: *CommandBuffer, stage: Stage, slot: u32, data: []const u8) Error!void {
    if (cb.state.pass == .none) return error.NoActivePass;
    if (slot >= descriptors.max_uniform_buffers) return error.InvalidSlot;
    if (data.len == 0 or data.len > descriptors.uniform_buffer_size) return error.InvalidSize;
    const len: u32 = @intCast(data.len);
    const offset = try reserve_uniform(cb, len);
    @memcpy(cb.uniform.?.mapped[offset .. offset + len], data);

    const st = &cb.state.stages[@backingInt(stage)];
    st.uniform_offsets[slot] = offset;
    if (st.uniform_ranges[slot] != len) {
        st.uniform_ranges[slot] = len;
        cb.state.dirty_resources = true;
    } else {
        cb.state.dirty_offsets = true;
    }
}

fn align_up(value: u32, alignment: u32) u32 {
    if (alignment <= 1) return value;
    return (value + alignment - 1) / alignment * alignment;
}

/// Reserves `len` bytes in the current uniform buffer, rolling to a new one when
/// the buffer is full. The aligned offset is returned.
fn reserve_uniform(cb: *CommandBuffer, len: u32) Error!u32 {
    const alignment: u32 = @intCast(cb.device.limits.minUniformBufferOffsetAlignment);
    const offset = align_up(cb.uniform_cursor, alignment);
    if (cb.uniform != null and offset + len <= descriptors.uniform_buffer_size) {
        cb.uniform_cursor = offset + len;
        return offset;
    }
    try roll_uniform_buffer(cb);
    const fresh = align_up(cb.uniform_cursor, alignment);
    if (fresh + len > descriptors.uniform_buffer_size) return error.InvalidSize;
    cb.uniform_cursor = fresh + len;
    return fresh;
}

/// Moves to a fresh uniform buffer. Slots that are still bound keep their data:
/// their bytes are copied into the new buffer and their offsets updated, so a
/// rollover never changes what a draw reads.
fn roll_uniform_buffer(cb: *CommandBuffer) Error!void {
    const dev = cb.device;
    const alignment: u32 = @intCast(dev.limits.minUniformBufferOffsetAlignment);
    const fresh = try descriptors.acquire_uniform_buffer(dev, &cb.scratch);
    var cursor: u32 = 0;
    for (&cb.state.stages) |*st| {
        for (0..descriptors.max_uniform_buffers) |slot| {
            const range = st.uniform_ranges[slot];
            if (range == 0) continue;
            const old = cb.uniform orelse break;
            const start = align_up(cursor, alignment);
            if (start + range > descriptors.uniform_buffer_size) return error.InvalidSize;
            const from = st.uniform_offsets[slot];
            @memcpy(fresh.mapped[start .. start + range], old.mapped[from .. from + range]);
            st.uniform_offsets[slot] = start;
            cursor = start + range;
        }
    }
    cb.uniform = fresh;
    cb.uniform_cursor = cursor;
    cb.state.dirty_resources = true;
}

fn write_read_set(cb: *CommandBuffer, layout: vk.Handle, stage: Stage, n_samplers: u32, n_textures: u32, n_buffers: u32) Error!vk.Handle {
    const dev = cb.device;
    const set = try descriptors.allocate_set(dev, &cb.scratch, layout);
    const st = &cb.state.stages[@backingInt(stage)];
    var images: [descriptors.max_samplers + descriptors.max_storage_textures]vk.DescriptorImageInfo = undefined;
    var buffers: [descriptors.max_storage_buffers]vk.DescriptorBufferInfo = undefined;
    var writes: [descriptors.max_samplers + descriptors.max_storage_textures + descriptors.max_storage_buffers]vk.WriteDescriptorSet = undefined;
    var count: usize = 0;
    var binding: u32 = 0;

    for (0..n_samplers) |i| {
        const slot = st.samplers[i];
        const tex = slot.texture orelse return error.MissingBinding;
        const smp = slot.sampler orelse return error.MissingBinding;
        const image_layout = cb.readable_texture_layout(tex) orelse return error.InvalidTextureLayout;
        images[i] = .{ .sampler = smp.handle, .imageView = tex.active().view, .imageLayout = image_layout };
        writes[count] = image_write(set, binding, vk.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, &images[i]);
        count += 1;
        binding += 1;
    }
    for (0..n_textures) |i| {
        const tex = st.storage_textures[i] orelse return error.MissingBinding;
        const image_layout = cb.readable_texture_layout(tex) orelse return error.InvalidTextureLayout;
        images[n_samplers + i] = .{ .sampler = 0, .imageView = tex.active().view, .imageLayout = image_layout };
        writes[count] = image_write(set, binding, vk.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE, &images[n_samplers + i]);
        count += 1;
        binding += 1;
    }
    for (0..n_buffers) |i| {
        const buf = st.storage_buffers[i] orelse return error.MissingBinding;
        buffers[i] = .{ .buffer = buf.active().handle, .offset = 0, .range = vk.VK_WHOLE_SIZE };
        writes[count] = buffer_write(set, binding, vk.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, &buffers[i]);
        count += 1;
        binding += 1;
    }
    if (count > 0) dev.fns.vkUpdateDescriptorSets(dev.device, @intCast(count), &writes, 0, null);
    return set;
}

fn write_write_set(cb: *CommandBuffer, layout: vk.Handle, n_textures: u32, n_buffers: u32) Error!vk.Handle {
    const dev = cb.device;
    const set = try descriptors.allocate_set(dev, &cb.scratch, layout);
    var images: [descriptors.max_compute_write_textures]vk.DescriptorImageInfo = undefined;
    var buffers: [descriptors.max_compute_write_buffers]vk.DescriptorBufferInfo = undefined;
    var writes: [descriptors.max_compute_write_textures + descriptors.max_compute_write_buffers]vk.WriteDescriptorSet = undefined;
    var count: usize = 0;
    for (0..n_textures) |i| {
        const slot = cb.state.write_textures[i] orelse return error.MissingBinding;
        if (cb.texture_subresource_layout(slot.texture, slot.mip_level, slot.layer) != vk.VK_IMAGE_LAYOUT_GENERAL) return error.InvalidTextureLayout;
        images[i] = .{ .sampler = 0, .imageView = slot.view, .imageLayout = vk.VK_IMAGE_LAYOUT_GENERAL };
        writes[count] = image_write(set, @intCast(i), vk.VK_DESCRIPTOR_TYPE_STORAGE_IMAGE, &images[i]);
        count += 1;
    }
    for (0..n_buffers) |i| {
        const buf = cb.state.write_buffers[i] orelse return error.MissingBinding;
        buffers[i] = .{ .buffer = buf.active().handle, .offset = 0, .range = vk.VK_WHOLE_SIZE };
        writes[count] = buffer_write(set, @intCast(n_textures + i), vk.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER, &buffers[i]);
        count += 1;
    }
    if (count > 0) dev.fns.vkUpdateDescriptorSets(dev.device, @intCast(count), &writes, 0, null);
    return set;
}

fn write_uniform_set(cb: *CommandBuffer, layout: vk.Handle, stage: Stage, n: u32) Error!vk.Handle {
    const dev = cb.device;
    const set = try descriptors.allocate_set(dev, &cb.scratch, layout);
    if (n == 0) return set;
    const buffer = cb.uniform orelse return error.MissingBinding;
    const st = &cb.state.stages[@backingInt(stage)];
    var infos: [descriptors.max_uniform_buffers]vk.DescriptorBufferInfo = undefined;
    var writes: [descriptors.max_uniform_buffers]vk.WriteDescriptorSet = undefined;
    for (0..n) |i| {
        const range = if (st.uniform_ranges[i] != 0) st.uniform_ranges[i] else descriptors.uniform_buffer_size;
        infos[i] = .{ .buffer = buffer.buffer, .offset = 0, .range = range };
        writes[i] = buffer_write(set, @intCast(i), vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC, &infos[i]);
    }
    dev.fns.vkUpdateDescriptorSets(dev.device, n, &writes, 0, null);
    return set;
}

fn image_write(set: vk.Handle, binding: u32, descriptor_type: i32, info: *const vk.DescriptorImageInfo) vk.WriteDescriptorSet {
    var write = std.mem.zeroes(vk.WriteDescriptorSet);
    write.sType = vk.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    write.dstSet = set;
    write.dstBinding = binding;
    write.descriptorCount = 1;
    write.descriptorType = descriptor_type;
    write.pImageInfo = @ptrCast(info);
    return write;
}

fn buffer_write(set: vk.Handle, binding: u32, descriptor_type: i32, info: *const vk.DescriptorBufferInfo) vk.WriteDescriptorSet {
    var write = std.mem.zeroes(vk.WriteDescriptorSet);
    write.sType = vk.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    write.dstSet = set;
    write.dstBinding = binding;
    write.descriptorCount = 1;
    write.descriptorType = descriptor_type;
    write.pBufferInfo = @ptrCast(info);
    return write;
}

/// Allocates and writes the four graphics sets when needed, then binds them with
/// the dynamic offsets of the uniform slots that the pipeline declares.
fn prepare_graphics(cb: *CommandBuffer) Error!void {
    const pipe = cb.state.graphics orelse return error.NoPipeline;
    if (cb.state.dirty_resources) {
        if (cb.uniform == null) try roll_uniform_buffer(cb);
        const vs = pipe.counts[0];
        const fs = pipe.counts[1];
        const sets = [4]vk.Handle{
            try write_read_set(cb, pipe.set_layouts[0], .vertex, vs.samplers, vs.storage_textures, vs.storage_buffers),
            try write_uniform_set(cb, pipe.set_layouts[1], .vertex, vs.uniform_buffers),
            try write_read_set(cb, pipe.set_layouts[2], .fragment, fs.samplers, fs.storage_textures, fs.storage_buffers),
            try write_uniform_set(cb, pipe.set_layouts[3], .fragment, fs.uniform_buffers),
        };
        cb.state.bound_sets = sets;
        cb.state.dirty_resources = false;
    } else if (!cb.state.dirty_offsets) {
        return;
    }
    cb.state.dirty_offsets = false;

    var offsets: [2 * descriptors.max_uniform_buffers]u32 = undefined;
    var n: usize = 0;
    const vs_count = pipe.counts[0].uniform_buffers;
    const fs_count = pipe.counts[1].uniform_buffers;
    for (cb.state.stages[@backingInt(Stage.vertex)].uniform_offsets[0..vs_count]) |o| {
        offsets[n] = o;
        n += 1;
    }
    for (cb.state.stages[@backingInt(Stage.fragment)].uniform_offsets[0..fs_count]) |o| {
        offsets[n] = o;
        n += 1;
    }
    cb.device.fns.vkCmdBindDescriptorSets(cb.handle, vk.VK_PIPELINE_BIND_POINT_GRAPHICS, pipe.layout, 0, 4, &cb.state.bound_sets, @intCast(n), if (n > 0) &offsets else null);
}

fn prepare_compute(cb: *CommandBuffer) Error!void {
    const pipe = cb.state.compute orelse return error.NoPipeline;
    if (cb.state.dirty_resources) {
        if (cb.uniform == null) try roll_uniform_buffer(cb);
        cb.state.bound_sets[0] = try write_read_set(cb, pipe.set_layouts[0], .compute, pipe.read_samplers, pipe.read_textures, pipe.read_buffers);
        cb.state.bound_sets[1] = try write_write_set(cb, pipe.set_layouts[1], pipe.write_textures, pipe.write_buffers);
        cb.state.bound_sets[2] = try write_uniform_set(cb, pipe.set_layouts[2], .compute, pipe.uniform_buffers);
        cb.state.dirty_resources = false;
    } else if (!cb.state.dirty_offsets) {
        return;
    }
    cb.state.dirty_offsets = false;

    var offsets: [descriptors.max_uniform_buffers]u32 = undefined;
    const n = pipe.uniform_buffers;
    for (cb.state.stages[@backingInt(Stage.compute)].uniform_offsets[0..n], 0..) |o, i| offsets[i] = o;
    cb.device.fns.vkCmdBindDescriptorSets(cb.handle, vk.VK_PIPELINE_BIND_POINT_COMPUTE, pipe.layout, 0, 3, &cb.state.bound_sets, n, if (n > 0) &offsets else null);
}

// ---------------------------------------------------------------------------
// Render pass and framebuffer caches
// ---------------------------------------------------------------------------

const AttachmentKind = enum(u8) { color, depth, resolve };

/// One attachment while a pass is being set up.
const Attachment = struct {
    kind: AttachmentKind,
    /// Color target index, shared by a color and its resolve.
    target: u8,
    texture: *Texture,
    mip: u32,
    layer: u32,
    load: i32,
    store: i32,
    stencil_load: i32,
    stencil_store: i32,
    clear: vk.ClearValue,
    /// Cycle the subresource's texture before the pass when it is still in use.
    cycle: bool,

    fn key(self: Attachment, final_layout: i32) AttachmentKey {
        return .{
            .kind = self.kind,
            .target = self.target,
            .format = tables.texture_format(self.texture.info.format),
            .samples = tables.sample_count_bits[@backingInt(self.texture.info.sample_count)],
            .load = self.load,
            .store = self.store,
            .stencil_load = self.stencil_load,
            .stencil_store = self.stencil_store,
            .final_layout = final_layout,
        };
    }
};

/// The identity of one attachment in a render pass object.
pub const AttachmentKey = struct {
    kind: AttachmentKind = .color,
    target: u8 = 0,
    format: vk.Format = 0,
    samples: vk.Flags = 0,
    load: i32 = 0,
    store: i32 = 0,
    stencil_load: i32 = 0,
    stencil_store: i32 = 0,
    final_layout: i32 = 0,
};

/// The identity of a render pass object: its attachments in order.
pub const RenderPassKey = struct {
    count: u8 = 0,
    attachments: [max_attachments]AttachmentKey = std.mem.zeroes([max_attachments]AttachmentKey),
};

pub const RenderPassEntry = struct {
    key: RenderPassKey,
    handle: vk.Handle,
};

/// A cached framebuffer and the views it owns.
pub const FramebufferEntry = struct {
    render_pass: vk.Handle,
    width: u32,
    height: u32,
    count: u8,
    images: [max_attachments]vk.Handle,
    mips: [max_attachments]u32,
    layers: [max_attachments]u32,
    views: [max_attachments]vk.Handle,
    handle: vk.Handle,
};

fn attachment_final_layout(texture: *const Texture) i32 {
    // Swapchain images are presented from color-attachment layout.
    if (!texture.active().owned) return vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    return device_mod.default_layout(texture.info);
}

/// Returns the cached render pass for `key`, creating it on a miss.
pub fn fetch_render_pass(dev: *Device, key: RenderPassKey) Error!vk.Handle {
    for (dev.render_pass_cache.items) |entry| {
        if (std.meta.eql(entry.key, key)) return entry.handle;
    }
    const handle = try create_render_pass(dev, key);
    errdefer dev.fns.vkDestroyRenderPass(dev.device, handle, null);
    try dev.render_pass_cache.append(dev.allocator, .{ .key = key, .handle = handle });
    return handle;
}

/// The render pass pipelines are created against, for multisampled pipelines the
/// resolving one: see `compatible_render_pass_resolving`. Single-sample pipelines
/// get no resolve attachment.
pub fn compatible_render_pass(dev: *Device, targets: []const types.ColorTargetDescription, depth: ?types.TextureFormat, samples: types.SampleCount) Error!vk.Handle {
    return compatible_render_pass_resolving(dev, targets, depth, samples, samples != .@"1");
}

/// The render pass pipelines are created against: formats and sample counts of the
/// targets with load and store operations. With `resolve`, each color target also
/// has a single-sample resolve attachment of its format, as passes that resolve have.
/// Vulkan treats a missing resolve reference as unused, so without this a pipeline is
/// incompatible with a resolving pass. SDL's transient pipeline pass omits resolves, and
/// this differs from it deliberately.
pub fn compatible_render_pass_resolving(dev: *Device, targets: []const types.ColorTargetDescription, depth: ?types.TextureFormat, samples: types.SampleCount, resolve: bool) Error!vk.Handle {
    var key = RenderPassKey{};
    for (targets, 0..) |t, i| {
        key.attachments[key.count] = .{
            .kind = .color,
            .target = @intCast(i),
            .format = tables.texture_format(t.format),
            .samples = tables.sample_count_bits[@backingInt(samples)],
            .load = vk.VK_ATTACHMENT_LOAD_OP_LOAD,
            .store = vk.VK_ATTACHMENT_STORE_OP_STORE,
            .stencil_load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            .stencil_store = vk.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            .final_layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        };
        key.count += 1;
    }
    if (depth) |format| {
        key.attachments[key.count] = .{
            .kind = .depth,
            .format = tables.texture_format(format),
            .samples = tables.sample_count_bits[@backingInt(samples)],
            .load = vk.VK_ATTACHMENT_LOAD_OP_LOAD,
            .store = vk.VK_ATTACHMENT_STORE_OP_STORE,
            .stencil_load = vk.VK_ATTACHMENT_LOAD_OP_LOAD,
            .stencil_store = vk.VK_ATTACHMENT_STORE_OP_STORE,
            .final_layout = vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
        };
        key.count += 1;
    }
    if (resolve) {
        for (targets, 0..) |t, i| {
            key.attachments[key.count] = .{
                .kind = .resolve,
                .target = @intCast(i),
                .format = tables.texture_format(t.format),
                .samples = vk.VK_SAMPLE_COUNT_1_BIT,
                .load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
                .store = vk.VK_ATTACHMENT_STORE_OP_STORE,
                .stencil_load = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
                .stencil_store = vk.VK_ATTACHMENT_STORE_OP_DONT_CARE,
                .final_layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
            };
            key.count += 1;
        }
    }
    return fetch_render_pass(dev, key);
}

fn create_render_pass(dev: *Device, key: RenderPassKey) Error!vk.Handle {
    var descs: [max_attachments]vk.AttachmentDescription = undefined;
    var color_refs: [pipeline.max_color_targets]vk.AttachmentReference = undefined;
    var resolve_refs: [pipeline.max_color_targets]vk.AttachmentReference = undefined;
    var depth_ref = vk.AttachmentReference{ .attachment = vk.VK_ATTACHMENT_UNUSED, .layout = 0 };
    var has_depth = false;
    var has_resolve = false;
    var color_count: u32 = 0;
    for (0..pipeline.max_color_targets) |i| resolve_refs[i] = .{ .attachment = vk.VK_ATTACHMENT_UNUSED, .layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL };

    for (key.attachments[0..key.count], 0..) |a, i| {
        const is_depth = a.kind == .depth;
        descs[i] = .{
            .flags = 0,
            .format = a.format,
            .samples = a.samples,
            .loadOp = a.load,
            .storeOp = a.store,
            .stencilLoadOp = a.stencil_load,
            .stencilStoreOp = a.stencil_store,
            .initialLayout = if (is_depth) vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL else vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
            .finalLayout = a.final_layout,
        };
        switch (a.kind) {
            .color => {
                color_refs[color_count] = .{ .attachment = @intCast(i), .layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL };
                color_count += 1;
            },
            .depth => {
                depth_ref = .{ .attachment = @intCast(i), .layout = vk.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL };
                has_depth = true;
            },
            .resolve => {
                resolve_refs[a.target] = .{ .attachment = @intCast(i), .layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL };
                has_resolve = true;
            },
        }
    }

    var subpass = std.mem.zeroes(vk.SubpassDescription);
    subpass.pipelineBindPoint = vk.VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.colorAttachmentCount = color_count;
    subpass.pColorAttachments = if (color_count > 0) &color_refs else null;
    subpass.pResolveAttachments = if (has_resolve) &resolve_refs else null;
    subpass.pDepthStencilAttachment = if (has_depth) &depth_ref else null;

    // Attachment transitions are recorded by the pass itself, but execution
    // must not overlap the previous work that touches the same images.
    var dependency = std.mem.zeroes(vk.SubpassDependency);
    dependency.srcSubpass = vk.VK_SUBPASS_EXTERNAL;
    dependency.dstSubpass = 0;
    dependency.srcStageMask = vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
    dependency.dstStageMask = vk.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
    dependency.srcAccessMask = vk.VK_ACCESS_MEMORY_READ_BIT | vk.VK_ACCESS_MEMORY_WRITE_BIT;
    dependency.dstAccessMask = vk.VK_ACCESS_MEMORY_READ_BIT | vk.VK_ACCESS_MEMORY_WRITE_BIT;

    var info = std.mem.zeroes(vk.RenderPassCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
    info.attachmentCount = key.count;
    info.pAttachments = &descs;
    info.subpassCount = 1;
    info.pSubpasses = @ptrCast(&subpass);
    info.dependencyCount = 1;
    info.pDependencies = @ptrCast(&dependency);
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateRenderPass(dev.device, &info, null, &handle));
    return handle;
}

/// Returns a framebuffer for `render_pass` over `atts`, creating it and its
/// views on a miss. The framebuffer stays cached until one of its images is
/// released.
fn fetch_framebuffer(cb: *CommandBuffer, render_pass: vk.Handle, atts: []const Attachment, width: u32, height: u32) Error!vk.Handle {
    const dev = cb.device;
    for (dev.framebuffer_cache.items) |entry| {
        if (entry.render_pass != render_pass or entry.width != width or entry.height != height or entry.count != atts.len) continue;
        var same = true;
        for (atts, 0..) |a, i| {
            if (entry.images[i] != a.texture.active().image or entry.mips[i] != a.mip or entry.layers[i] != a.layer) {
                same = false;
                break;
            }
        }
        if (same) return entry.handle;
    }

    var entry = FramebufferEntry{
        .render_pass = render_pass,
        .width = width,
        .height = height,
        .count = @intCast(atts.len),
        .images = std.mem.zeroes([max_attachments]vk.Handle),
        .mips = std.mem.zeroes([max_attachments]u32),
        .layers = std.mem.zeroes([max_attachments]u32),
        .views = std.mem.zeroes([max_attachments]vk.Handle),
        .handle = 0,
    };
    // Zero handles are null, which vkDestroyImageView ignores.
    errdefer for (entry.views) |view| dev.fns.vkDestroyImageView(dev.device, view, null);
    for (atts, 0..) |a, i| {
        entry.images[i] = a.texture.active().image;
        entry.mips[i] = a.mip;
        entry.layers[i] = a.layer;
        entry.views[i] = try create_view(dev, a.texture, a.mip, a.layer);
    }
    var create = std.mem.zeroes(vk.FramebufferCreateInfo);
    create.sType = vk.VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    create.renderPass = render_pass;
    create.attachmentCount = @intCast(atts.len);
    create.pAttachments = &entry.views;
    create.width = width;
    create.height = height;
    create.layers = 1;
    _ = try vk.check(dev.fns.vkCreateFramebuffer(dev.device, &create, null, &entry.handle));
    errdefer dev.fns.vkDestroyFramebuffer(dev.device, entry.handle, null);
    try dev.framebuffer_cache.append(dev.allocator, entry);
    return entry.handle;
}

/// A view of one mip and layer of `texture`, used as a framebuffer attachment.
fn create_view(dev: *Device, texture: *const Texture, mip: u32, layer: u32) Error!vk.Handle {
    var info = std.mem.zeroes(vk.ImageViewCreateInfo);
    info.sType = vk.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    info.image = texture.active().image;
    info.viewType = vk.VK_IMAGE_VIEW_TYPE_2D;
    info.format = tables.texture_format(texture.info.format);
    info.components = tables.identity_swizzle;
    info.subresourceRange = .{ .aspectMask = texture.aspect, .baseMipLevel = mip, .levelCount = 1, .baseArrayLayer = layer, .layerCount = 1 };
    var view: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateImageView(dev.device, &info, null, &view));
    return view;
}

/// Retires every cached framebuffer that uses `image`. Called when the image is
/// released or swapchain images are replaced.
pub fn evict_image(dev: *Device, image: vk.Handle) void {
    var i: usize = 0;
    while (i < dev.framebuffer_cache.items.len) {
        const entry = dev.framebuffer_cache.items[i];
        var uses = false;
        for (entry.images[0..entry.count]) |img| {
            if (img == image) uses = true;
        }
        if (!uses) {
            i += 1;
            continue;
        }
        dev.retire(.{ .framebuffer = entry.handle });
        for (entry.views[0..entry.count]) |view| dev.retire(.{ .image_view = view });
        _ = dev.framebuffer_cache.swapRemove(i);
    }
}

/// Destroys every cached render pass and framebuffer. Called by the device
/// after the GPU is idle.
pub fn destroy_caches(dev: *Device) void {
    for (dev.framebuffer_cache.items) |entry| {
        dev.fns.vkDestroyFramebuffer(dev.device, entry.handle, null);
        for (entry.views[0..entry.count]) |view| dev.fns.vkDestroyImageView(dev.device, view, null);
    }
    dev.framebuffer_cache.clearRetainingCapacity();
    for (dev.render_pass_cache.items) |entry| dev.fns.vkDestroyRenderPass(dev.device, entry.handle, null);
    dev.render_pass_cache.clearRetainingCapacity();
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

fn clear_color(c: types.FColor) vk.ClearValue {
    return .{ .words = .{ @bitCast(c.r), @bitCast(c.g), @bitCast(c.b), @bitCast(c.a) } };
}

fn depth_clear(depth: f32, stencil: u8) vk.ClearValue {
    return .{ .words = .{ @bitCast(depth), stencil, 0, 0 } };
}

const MipSize = struct { w: u32, h: u32, d: u32 };

fn mip_dims(texture: *const Texture, level: u32, depth: u32) MipSize {
    return .{
        .w = @max(texture.info.width >> @intCast(level), 1),
        .h = @max(texture.info.height >> @intCast(level), 1),
        .d = @max(depth >> @intCast(level), 1),
    };
}

fn mip_size(texture: *const Texture, level: u32) struct { w: u32, h: u32 } {
    const s = mip_dims(texture, level, 1);
    return .{ .w = s.w, .h = s.h };
}

fn check_size(texture: *const Texture, mip: u32, width: u32, height: u32) Error!void {
    const s = mip_size(texture, mip);
    if (s.w != width or s.h != height) return error.TargetSizeMismatch;
}

/// Rejects a mip or layer outside the texture (3D textures have one layer).
fn check_subresource(texture: *const Texture, mip: u32, layer: u32) Error!void {
    if (mip >= texture.info.num_levels) return error.OutOfRange;
    if (layer >= texture.layers) return error.OutOfRange;
}

fn check_region(texture: *const Texture, region: types.TextureRegion) Error!void {
    if (region.mip_level >= texture.info.num_levels) return error.OutOfRange;
    if (region.layer >= texture.layers) return error.OutOfRange;
    const s = mip_size(texture, region.mip_level);
    if (@as(u64, region.x) + region.w > s.w or @as(u64, region.y) + region.h > s.h) return error.OutOfRange;
}
