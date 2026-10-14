//! Shader programs and their selection for the GPU render backend, ported from
//! SDL_shaders_gpu.c (the enums of SDL_shaders_gpu.h and the source table) and
//! the shader-choice and constants logic of SDL_render_gpu.c (`Draw`,
//! `CalculateAdvancedShaderConstants`).
//!
//! The SPIR-V modules come from `shader_blobs.zig`, generated from SDL's shipped
//! headers. This backend runs on zdl.gpu's Vulkan device, so only the SPIR-V
//! variants are used; SDL's DXIL, MSL and private blobs belong to other backends.
//! Shader creation order and sampler/uniform counts match SDL's source table.
//!
//! Uniform blocks are float arrays whose order follows the HLSL constant buffers
//! (`tri_texture.vert.hlsl`, `texture_advanced.frag.hlsl`), so they are pushed as
//! raw bytes with `std.mem.sliceAsBytes`. Matrices are row-major `[row*4 + col]`,
//! matching SDL's `Float4X4.m[row][col]`.
//!
//! The advanced fragment program covers every texture class that is not plain
//! RGB(A): palette, planar and semi-planar YCbCr, pixel-art sampling, linear or
//! HDR input and tone mapping. The simple programs handle plain RGBA textures.
const std = @import("std");
const types = @import("../../gpu/types.zig");
const device = @import("../../gpu/vulkan/device.zig");
const blobs = @import("shader_blobs.zig");
const texture_mod = @import("texture.zig");
const color = @import("color.zig");

/// Vertex programs (`SDL_GPU_VertexShaderID`).
pub const VertexShader = enum(u8) {
    /// Points and lines: position and color only, no texture coordinates.
    linepoint,
    /// Triangles with vertex colors (solid fills).
    tri_color,
    /// Triangles with vertex colors and texture coordinates.
    tri_texture,
};

/// Fragment programs (`SDL_GPU_FragmentShaderID`). The custom slot is not ported.
pub const FragmentShader = enum(u8) {
    /// Vertex color times the color scale (solid fills, points and lines).
    color,
    /// RGB texture sampling; ignores the stored alpha.
    texture_rgb,
    /// RGBA texture sampling multiplied by the vertex color.
    texture_rgba,
    /// Everything else: pixel-art sampling, YCbCr, palettes, HDR input and tone mapping.
    texture_advanced,
};

/// Texture class of a textured draw (`TEXTURETYPE_*`); see `texture.Kind`.
pub const TextureKind = texture_mod.Kind;

/// Number of floats in the advanced fragment constants block.
pub const advanced_uniform_count = 28;

/// Index of each float in the advanced constants block (SDL's
/// `GPU_AdvancedFragmentShaderUniformData` in declaration order, with the
/// 4x4 YCbCr matrix last).
const advanced_index = struct {
    const scrgb_output = 0;
    const texture_type = 1;
    const input_type = 2;
    const color_scale = 3;
    const texel_width = 4;
    const texel_height = 5;
    const texture_width = 6;
    const texture_height = 7;
    const tonemap_method = 8;
    const tonemap_factor1 = 9;
    const tonemap_factor2 = 10;
    const sdr_white_point = 11;
    const ycbcr_matrix = 12;
};

/// Tone mapping method the advanced program applies (`TONEMAP_*`).
const tonemap_none: f32 = 0;
const tonemap_chrome: f32 = 2;

/// Tone mapping of a texture whose headroom exceeds the output's (SDL's `CalculateAdvancedShaderConstants`).
pub const Tonemap = struct {
    factor1: f32,
    factor2: f32,
};

/// Shader program choice for one draw.
pub const Selection = struct {
    vertex: VertexShader,
    fragment: FragmentShader,
    /// Texture class for the advanced fragment program; null otherwise.
    texture_kind: ?TextureKind = null,
};

/// The texture side of a draw as the shader choice sees it.
pub const TextureChoice = struct {
    kind: TextureKind,
    /// Whether the advanced program is needed: a class other than plain RGB(A),
    /// a non-default input encoding, or tone mapping (SDL's `Draw` test).
    advanced: bool,
};

/// Everything the advanced fragment constants depend on (SDL's `CalculateAdvancedShaderConstants`).
pub const AdvancedParams = struct {
    kind: TextureKind,
    input: color.Input = .unspecified,
    /// Whether the output is linear (scRGB or HDR10), which the shader writes unclamped.
    linear_output: bool = false,
    /// Render color scale (`SDL_SetRenderColorScale` times the SDR white point).
    color_scale: f32 = 1.0,
    /// Texture size, used by the pixel-art and palette classes for texel sizes.
    texture_width: u32 = 0,
    texture_height: u32 = 0,
    sdr_white_point: f32 = 1.0,
    tonemap: ?Tonemap = null,
    /// YCbCr-to-RGB matrix of planar textures.
    ycbcr: ?[16]f32 = null,
};

/// SPIR-V module and resource counts of one stage (SDL's `GPU_ShaderSources`).
const Source = struct {
    code: []const u8,
    num_samplers: u32,
    num_uniform_buffers: u32 = 1,
};

const vertex_sources = [_]Source{
    .{ .code = blobs.linepoint_vert, .num_samplers = 0 },
    .{ .code = blobs.tri_color_vert, .num_samplers = 0 },
    .{ .code = blobs.tri_texture_vert, .num_samplers = 0 },
};

const fragment_sources = [_]Source{
    .{ .code = blobs.color_frag, .num_samplers = 0 },
    .{ .code = blobs.texture_rgb_frag, .num_samplers = 1 },
    .{ .code = blobs.texture_rgba_frag, .num_samplers = 1 },
    .{ .code = blobs.texture_advanced_frag, .num_samplers = 3 },
};

/// Every shader of the backend, created once per device.
pub const Shaders = struct {
    vertex: [vertex_sources.len]device.Shader,
    fragment: [fragment_sources.len]device.Shader,

    /// Creates all programs. On failure, programs already created are released.
    pub fn create(dev: *device.Device) device.Error!Shaders {
        var vertex: [vertex_sources.len]device.Shader = undefined;
        var fragment: [fragment_sources.len]device.Shader = undefined;
        var made_vertex: usize = 0;
        var made_fragment: usize = 0;
        errdefer {
            for (vertex[0..made_vertex]) |*shader| shader.deinit();
            for (fragment[0..made_fragment]) |*shader| shader.deinit();
        }
        for (vertex_sources, 0..) |source, index| {
            vertex[index] = try create_shader(dev, source, .vertex);
            made_vertex += 1;
        }
        for (fragment_sources, 0..) |source, index| {
            fragment[index] = try create_shader(dev, source, .fragment);
            made_fragment += 1;
        }
        return .{ .vertex = vertex, .fragment = fragment };
    }

    /// Releases every program. Pipelines that use them must already be released.
    pub fn deinit(self: *Shaders) void {
        for (&self.vertex) |*shader| shader.deinit();
        for (&self.fragment) |*shader| shader.deinit();
        self.* = undefined;
    }

    /// The vertex program with the given id.
    pub fn vertex_shader(self: *const Shaders, id: VertexShader) *const device.Shader {
        return &self.vertex[@backingInt(id)];
    }

    /// The fragment program with the given id.
    pub fn fragment_shader(self: *const Shaders, id: FragmentShader) *const device.Shader {
        return &self.fragment[@backingInt(id)];
    }
};

fn create_shader(dev: *device.Device, source: Source, stage: types.ShaderStage) device.Error!device.Shader {
    return dev.create_shader(.{
        .code = source.code,
        .entrypoint = "main",
        .format = .{ .spirv = true },
        .stage = stage,
        .num_samplers = source.num_samplers,
        .num_uniform_buffers = source.num_uniform_buffers,
    });
}

/// Whether a textured draw needs the advanced program (SDL's `Draw` test):
/// plain RGB(A) classes with default encoding and no tone mapping use the simple programs.
pub fn texture_choice(kind: TextureKind, input: color.Input, tonemap: bool) TextureChoice {
    const plain = kind == .rgb or kind == .rgba;
    return .{ .kind = kind, .advanced = !plain or input != .unspecified or tonemap };
}

/// Chooses the programs for a draw (SDL's `Draw`): triangles with a texture use
/// the textured vertex program; triangles without one use vertex colors; points
/// and lines use the line/point program. Textures that need the advanced program
/// use it; RGB and RGBA textures use the simple ones. `texture` is null for untextured draws.
pub fn select(primitive: types.PrimitiveType, texture: ?TextureChoice) Selection {
    if (primitive != .triangle_list) return .{ .vertex = .linepoint, .fragment = .color };
    const choice = texture orelse return .{ .vertex = .tri_color, .fragment = .color };
    if (choice.advanced) return .{ .vertex = .tri_texture, .fragment = .texture_advanced, .texture_kind = choice.kind };
    return .{
        .vertex = .tri_texture,
        .fragment = if (choice.kind == .rgb) .texture_rgb else .texture_rgba,
    };
}

/// Vertex constants `mvp` for a viewport of `width` by `height` pixels (SDL's
/// `PushVertexUniforms`). Maps viewport-local pixel coordinates to clip space,
/// with y pointing down.
pub fn vertex_uniforms(width: f32, height: f32) [16]f32 {
    var mvp = std.mem.zeroes([16]f32);
    mvp[0 * 4 + 0] = 2.0 / width;
    mvp[1 * 4 + 1] = -2.0 / height;
    mvp[2 * 4 + 2] = 1.0;
    mvp[3 * 4 + 0] = -1.0;
    mvp[3 * 4 + 1] = 1.0;
    mvp[3 * 4 + 3] = 1.0;
    return mvp;
}

/// Constants of the simple fragment programs: the color scale.
pub fn simple_uniforms(color_scale: f32) [1]f32 {
    return .{color_scale};
}

/// Constants of the advanced fragment program (SDL's `GPU_AdvancedFragmentShaderUniformData`).
/// Texel sizes are set only for the palette and pixel-art classes, as SDL does.
pub fn advanced_uniforms(params: AdvancedParams) [advanced_uniform_count]f32 {
    var constants = std.mem.zeroes([advanced_uniform_count]f32);
    constants[advanced_index.scrgb_output] = if (params.linear_output) 1 else 0;
    constants[advanced_index.texture_type] = @floatFromInt(@backingInt(params.kind));
    constants[advanced_index.input_type] = @floatFromInt(@backingInt(params.input));
    constants[advanced_index.color_scale] = params.color_scale;
    switch (params.kind) {
        .palette_linear, .palette_pixel_art, .rgb_pixel_art, .rgba_pixel_art => {
            constants[advanced_index.texture_width] = @floatFromInt(params.texture_width);
            constants[advanced_index.texture_height] = @floatFromInt(params.texture_height);
            constants[advanced_index.texel_width] = 1.0 / @as(f32, @floatFromInt(params.texture_width));
            constants[advanced_index.texel_height] = 1.0 / @as(f32, @floatFromInt(params.texture_height));
        },
        else => {},
    }
    constants[advanced_index.tonemap_method] = if (params.tonemap != null) tonemap_chrome else tonemap_none;
    if (params.tonemap) |tonemap| {
        constants[advanced_index.tonemap_factor1] = tonemap.factor1;
        constants[advanced_index.tonemap_factor2] = tonemap.factor2;
    }
    constants[advanced_index.sdr_white_point] = params.sdr_white_point;
    if (params.ycbcr) |matrix| {
        @memcpy(constants[advanced_index.ycbcr_matrix..][0..16], &matrix);
    }
    return constants;
}

/// Tone mapping for content with `content_headroom` shown on an output with
/// `output_headroom` (SDL's `CalculateAdvancedShaderConstants`). Null when the
/// content fits or the output has no headroom information.
pub fn tonemap_for(content_headroom: f32, output_headroom: f32) ?Tonemap {
    if (content_headroom > output_headroom and output_headroom > 0.0) {
        return .{
            .factor1 = output_headroom / (content_headroom * content_headroom),
            .factor2 = 1.0 / output_headroom,
        };
    }
    return null;
}
