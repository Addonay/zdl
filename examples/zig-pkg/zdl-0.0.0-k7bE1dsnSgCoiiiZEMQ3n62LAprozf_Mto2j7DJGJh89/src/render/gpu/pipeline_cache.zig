//! Graphics pipeline cache for the GPU render backend, ported from
//! SDL_pipeline_gpu.c.
//!
//! A pipeline is keyed by the parameters SDL keys on: blend mode, vertex and
//! fragment program, primitive type and the render target's texture format.
//! Pipelines are created on first use and kept until `Cache.deinit`. Each one is
//! heap-allocated so the address that a recorded render pass refers to stays
//! valid while the cache grows.
//!
//! Vertex layout (SDL's MakePipeline): attribute 0 is a float2 position at offset
//! 0, attribute 1 a float4 color, and attribute 2 a float2 texture coordinate for
//! the textured programs only. Points and lines therefore use a 24-byte stride and
//! triangles a 32-byte stride, both in one vertex buffer slot.
const std = @import("std");
const types = @import("../../gpu/types.zig");
const surface = @import("../../video/surface.zig");
const device = @import("../../gpu/vulkan/device.zig");
const pipeline = @import("../../gpu/vulkan/pipeline.zig");
const shaders = @import("shaders.zig");

/// Parameters that identify one graphics pipeline (SDL's `GPU_PipelineParameters`).
pub const Key = struct {
    blend: surface.Blend,
    vertex: shaders.VertexShader,
    fragment: shaders.FragmentShader,
    primitive: types.PrimitiveType,
    /// Format of the color attachment the pipeline renders into.
    format: types.TextureFormat,
};

/// Stride in bytes of a point or line vertex: position and color.
pub const line_vertex_stride: u32 = 24;
/// Stride in bytes of a triangle vertex: position, color and texture coordinate.
pub const triangle_vertex_stride: u32 = 32;

/// Stride of the vertices a primitive consumes.
pub fn vertex_stride(primitive: types.PrimitiveType) u32 {
    return if (primitive == .triangle_list or primitive == .triangle_strip) triangle_vertex_stride else line_vertex_stride;
}

/// Owns every pipeline the renderer has needed. Deinitialize with the device
/// that created them.
pub const Cache = struct {
    allocator: std.mem.Allocator,
    entries: std.AutoHashMapUnmanaged(Key, *pipeline.GraphicsPipeline) = .empty,

    /// An empty cache; pipelines are allocated with `allocator`.
    pub fn init(allocator: std.mem.Allocator) Cache {
        return .{ .allocator = allocator };
    }

    /// Releases every pipeline and the table. Call before the shaders are released.
    pub fn deinit(self: *Cache) void {
        var iterator = self.entries.valueIterator();
        while (iterator.next()) |entry| {
            entry.*.deinit();
            self.allocator.destroy(entry.*);
        }
        self.entries.deinit(self.allocator);
        self.* = undefined;
    }

    /// Returns the pipeline for `key`, creating and caching it on first use.
    /// The pointer stays valid until `deinit`.
    pub fn get(self: *Cache, dev: *device.Device, shader_set: *const shaders.Shaders, key: Key) device.Error!*const pipeline.GraphicsPipeline {
        if (self.entries.get(key)) |existing| return existing;
        const created = try self.allocator.create(pipeline.GraphicsPipeline);
        errdefer self.allocator.destroy(created);
        created.* = try make(dev, shader_set, key);
        errdefer created.deinit();
        try self.entries.put(self.allocator, key, created);
        return created;
    }
};

/// Creates one pipeline (SDL's `MakePipeline`): one color target with the blend
/// state, triangle or point/line topology, default rasterization with depth clip.
fn make(dev: *device.Device, shader_set: *const shaders.Shaders, key: Key) device.Error!pipeline.GraphicsPipeline {
    const has_uv = key.vertex != .linepoint;
    var attributes: [3]types.VertexAttribute = undefined;
    var count: usize = 0;
    var pitch: u32 = 0;

    attributes[count] = .{ .location = 0, .buffer_slot = 0, .format = .float2, .offset = pitch };
    count += 1;
    pitch += 2 * @sizeOf(f32);

    attributes[count] = .{ .location = 1, .buffer_slot = 0, .format = .float4, .offset = pitch };
    count += 1;
    pitch += 4 * @sizeOf(f32);

    if (has_uv) {
        attributes[count] = .{ .location = 2, .buffer_slot = 0, .format = .float2, .offset = pitch };
        count += 1;
        pitch += 2 * @sizeOf(f32);
    }

    const descriptions = [_]types.VertexBufferDescription{.{ .slot = 0, .pitch = pitch }};
    const color_targets = [_]types.ColorTargetDescription{.{ .format = key.format, .blend_state = blend_state(key.blend) }};
    return pipeline.create_graphics_pipeline(dev, .{
        .vertex_shader = shader_set.vertex_shader(key.vertex),
        .fragment_shader = shader_set.fragment_shader(key.fragment),
        .vertex_input_state = .{
            .vertex_buffer_descriptions = &descriptions,
            .vertex_attributes = attributes[0..count],
        },
        .primitive_type = key.primitive,
        .rasterizer_state = .{ .enable_depth_clip = true },
        .target_info = .{ .color_target_descriptions = &color_targets },
    });
}

/// Converts a blend equation pair to the color target state. A pair equal to
/// `Blend.REPLACE` disables blending, as SDL's `SDL_BLENDMODE_NONE` does.
pub fn blend_state(blend: surface.Blend) types.ColorTargetBlendState {
    return .{
        .enable_blend = !std.meta.eql(blend, surface.Blend.REPLACE),
        .src_color_blendfactor = blend_factor(blend.color.source),
        .dst_color_blendfactor = blend_factor(blend.color.destination),
        .color_blend_op = blend_operation(blend.color.operation),
        .src_alpha_blendfactor = blend_factor(blend.alpha.source),
        .dst_alpha_blendfactor = blend_factor(blend.alpha.destination),
        .alpha_blend_op = blend_operation(blend.alpha.operation),
        .color_write_mask = types.ColorComponents.all,
    };
}

/// Maps a blend factor to its GPU equivalent. The surface factors are the
/// normalized forms of the same weights, so the results match the CPU blend.
pub fn blend_factor(factor: surface.Factor) types.BlendFactor {
    return switch (factor) {
        .zero => .zero,
        .one => .one,
        .source_color => .src_color,
        .inverse_source_color => .one_minus_src_color,
        .source_alpha => .src_alpha,
        .inverse_source_alpha => .one_minus_src_alpha,
        .destination_color => .dst_color,
        .inverse_destination_color => .one_minus_dst_color,
        .destination_alpha => .dst_alpha,
        .inverse_destination_alpha => .one_minus_dst_alpha,
    };
}

/// Maps a blend operation to its GPU equivalent.
pub fn blend_operation(operation: surface.Operation) types.BlendOp {
    return switch (operation) {
        .add => .add,
        .subtract => .subtract,
        .reverse_subtract => .reverse_subtract,
        .minimum => .min,
        .maximum => .max,
    };
}
