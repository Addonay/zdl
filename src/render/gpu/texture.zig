//! GPU texture for the render backend.
//!
//! A `Texture` pairs zdl.gpu device textures with the state SDL keeps on an
//! SDL_Texture: access mode, blend, color and alpha modulation, scale mode, the
//! texture colorspace and HDR content values, and for streaming textures a CPU
//! shadow of the pixels that `lock` edits.
//!
//! Layouts (SDL's `SDL_PIXELFORMAT_*` families):
//! - `pixels`: RGBA8 or BGRA8 (`gpu` holds the texels), or eight-bit palette
//!   indices (`gpu` holds R8 indices and `palette` a 256x1 RGBA8 lookup).
//! - `yuv`: IYUV/YV12 (`gpu` Y, `chroma_u` and `chroma_v` as R8 planes at half
//!   size), NV12/NV21 (`chroma_u` holds interleaved R8G8 at half size) and P010
//!   (16-bit R16 luma and R16G16 chroma, ten significant bits).
//!
//! Formats outside these layouts (RGB without alpha, packed 16-bit, float YUV)
//! are rejected with `UnsupportedFormat`.
//!
//! Ownership: textures are created and destroyed through `renderer.GpuRenderer`,
//! which heap-allocates them so the pointers recorded in pending draws stay
//! valid. Destroying a texture releases its device planes once the GPU is done
//! with them.
const std = @import("std");
const types = @import("../../gpu/types.zig");
const device = @import("../../gpu/vulkan/device.zig");
const pixels = @import("../../video/pixels.zig");
const surface = @import("../../video/surface.zig");
const geometry = @import("../../video/geometry.zig");
const color = @import("color.zig");

/// Texture errors specific to the GPU backend.
pub const Error = error{
    /// The pixel format has no GPU equivalent in this backend.
    UnsupportedFormat,
    /// The operation does not match the texture's access mode.
    WrongAccess,
    /// The operation does not match the texture's layout (for example `update` on a planar texture).
    WrongFormat,
    /// `lock` was called while a previous lock is still outstanding.
    AlreadyLocked,
    /// `unlock` was called without a matching `lock`.
    NotLocked,
    /// A region is empty or extends outside the texture.
    InvalidRect,
    /// A size or byte count does not fit the device limits.
    Overflow,
};

/// SDL_TextureAccess: `static` is written with `update`, `streaming` also
/// supports `lock`/`unlock`, and `target` can be drawn into.
pub const Access = @import("../texture.zig").Access;
/// Sampling policy (nearest, linear or pixel art, which samples linearly).
pub const ScaleMode = surface.ScaleMode;
/// Blend equations; `surface.Blend.ALPHA` is SDL's `SDL_BLENDMODE_BLEND`.
pub const Blend = surface.Blend;
/// Byte color with straight alpha.
pub const Color = pixels.Color;
/// Integer pixel rectangle (right and bottom edges excluded).
pub const IRect = geometry.Rect(i32);
/// Encoding of a texture's RGB samples; see `color.Input`.
pub const Colorspace = color.Input;
/// YCbCr colorspace of planar textures.
pub const YuvColorspace = color.YuvColorspace;

/// Bytes per texel of the eight-bit RGBA and BGRA layouts.
pub const bytes_per_texel = 4;

/// Entries of a palette texture (eight-bit indices).
pub const palette_entries = 256;

/// Planar and semi-planar YCbCr layouts.
pub const YuvLayout = enum {
    /// Three eight-bit planes: Y, then U, then V, each at its own pitch.
    iyuv,
    /// The same planes as `iyuv`; SDL swaps the chroma order only in packed uploads.
    yv12,
    /// Eight-bit luma and interleaved UV (U first).
    nv12,
    /// Eight-bit luma and interleaved UV (V first).
    nv21,
    /// Ten-bit values in 16-bit words: luma and interleaved UV (U first).
    p010,

    /// Whether chroma is a single interleaved plane.
    pub fn semi_planar(self: YuvLayout) bool {
        return switch (self) {
            .nv12, .nv21, .p010 => true,
            .iyuv, .yv12 => false,
        };
    }

    /// Bytes per luma sample.
    pub fn luma_bytes(self: YuvLayout) u32 {
        return if (self == .p010) 2 else 1;
    }

    /// Bytes per chroma sample of a planar U or V plane, or per UV pair of a semi-planar plane.
    pub fn chroma_bytes(self: YuvLayout) u32 {
        return switch (self) {
            .iyuv, .yv12 => 1,
            .nv12, .nv21 => 2,
            .p010 => 4,
        };
    }

    /// Bit depth SDL uses to choose the matrix for this layout.
    pub fn bits(self: YuvLayout) u8 {
        return if (self == .p010) 10 else 8;
    }
};

/// Layout of a texture: packed RGBA/BGRA or palette indices, or planar YCbCr.
pub const Format = union(enum) {
    /// RGBA8 or BGRA8 texels, or eight-bit indices into `Texture.palette`.
    pixels: pixels.Format,
    yuv: YuvLayout,
};

/// Texture class the advanced fragment program distinguishes (`TEXTURETYPE_*`).
/// The numbers match SDL's constants in SDL_render_gpu.c.
pub const Kind = enum(u8) {
    rgb = 1,
    rgb_pixel_art = 2,
    rgba = 3,
    rgba_pixel_art = 4,
    palette_nearest = 5,
    palette_linear = 6,
    palette_pixel_art = 7,
    nv12 = 8,
    nv21 = 9,
    yuv = 10,
};

/// Maps a renderer pixel format to the GPU texel format of its main plane.
pub fn gpu_format(format: pixels.Format, sample_srgb: bool) Error!types.TextureFormat {
    return switch (format) {
        .rgba8 => if (sample_srgb) .r8g8b8a8_unorm_srgb else .r8g8b8a8_unorm,
        .bgra8 => if (sample_srgb) .b8g8r8a8_unorm_srgb else .b8g8r8a8_unorm,
        .indexed => |indexed| if (indexed.bits == 8) .r8_unorm else error.UnsupportedFormat,
        else => error.UnsupportedFormat,
    };
}

/// GPU texel formats of a planar layout: luma, then chroma.
pub fn yuv_formats(layout: YuvLayout) [2]types.TextureFormat {
    return switch (layout) {
        .iyuv, .yv12 => .{ .r8_unorm, .r8_unorm },
        .nv12, .nv21 => .{ .r8_unorm, .r8g8_unorm },
        .p010 => .{ .r16_unorm, .r16g16_unorm },
    };
}

test "GPU renderer selects sRGB texel formats only for packed color" {
    try std.testing.expectEqual(types.TextureFormat.r8g8b8a8_unorm_srgb, try gpu_format(.rgba8, true));
    try std.testing.expectEqual(types.TextureFormat.b8g8r8a8_unorm_srgb, try gpu_format(.bgra8, true));
    try std.testing.expectEqual(types.TextureFormat.r8g8b8a8_unorm, try gpu_format(.rgba8, false));
    try std.testing.expectEqual(types.TextureFormat.r8_unorm, try gpu_format(.{ .indexed = .{ .bits = 8 } }, true));
}

/// A texture living on the GPU, with the state drawn with it.
pub const Texture = struct {
    /// Device storage of the RGBA/BGRA or indexed texels, or the luma plane.
    gpu: device.Texture,
    /// U plane (IYUV/YV12) or interleaved UV plane (semi-planar).
    chroma_u: ?device.Texture = null,
    /// V plane of IYUV/YV12; null otherwise.
    chroma_v: ?device.Texture = null,
    /// 256x1 RGBA8 lookup of an indexed texture, set by `set_palette`.
    palette: ?device.Texture = null,
    access: Access,
    format: Format,
    /// Vulkan's sRGB texel format performs the sRGB-to-linear conversion while
    /// sampling. The GPU renderer uses this for ordinary textures on linear output.
    hardware_srgb: bool = false,
    pixel_width: u31,
    pixel_height: u31,
    /// Bytes per texel of `gpu`; the row size of a CPU shadow and of `update`.
    texel_bytes: u32,
    /// YCbCr-to-RGB matrix of planar textures, copied to the shader constants.
    ycbcr: ?[16]f32 = null,
    /// Encoding of RGB samples. Planar and indexed textures keep the default.
    colorspace: Colorspace = .unspecified,
    /// SDR white level of this content, in multiples of SDR white (SDL default 1).
    sdr_white_point: f32 = 1.0,
    /// HDR headroom of this content (SDL default 0: none, so it is never tone mapped).
    hdr_headroom: f32 = 0.0,
    /// Blend used when this texture is drawn. Defaults to alpha blending, as SDL
    /// does for RGBA textures.
    blend: Blend = Blend.ALPHA,
    /// RGB modulation multiplied into sampled colors.
    color_mod: Color = .{ .r = 255, .g = 255, .b = 255 },
    /// Alpha modulation multiplied into sampled alpha.
    alpha_mod: u8 = 255,
    /// Sampling used when source and destination sizes differ.
    scale_mode: ScaleMode = .linear,
    /// CPU copy of the pixels of a streaming texture, `width * texel_bytes` per row.
    /// Owned by the texture; null for other access modes and planar textures.
    shadow: ?[]u8 = null,
    /// Region handed out by `lock` and not yet uploaded by `unlock`.
    locked: ?IRect = null,

    /// Texture width in pixels.
    pub fn width(self: *const Texture) u31 {
        return self.pixel_width;
    }

    /// Texture height in pixels.
    pub fn height(self: *const Texture) u31 {
        return self.pixel_height;
    }

    /// Whether the texture stores planar or semi-planar YCbCr.
    pub fn is_yuv(self: *const Texture) bool {
        return switch (self.format) {
            .yuv => true,
            .pixels => false,
        };
    }

    /// Whether the texture stores eight-bit palette indices.
    pub fn is_indexed(self: *const Texture) bool {
        return switch (self.format) {
            .pixels => |format| switch (format) {
                .indexed => true,
                else => false,
            },
            .yuv => false,
        };
    }

    /// Sets the blend used when drawing this texture.
    pub fn set_blend(self: *Texture, blend: Blend) void {
        self.blend = blend;
    }

    /// Sets the RGB modulation (alpha is unchanged).
    pub fn set_color_mod(self: *Texture, red: u8, green: u8, blue: u8) void {
        self.color_mod = .{ .r = red, .g = green, .b = blue };
    }

    /// Sets the alpha modulation.
    pub fn set_alpha_mod(self: *Texture, alpha: u8) void {
        self.alpha_mod = alpha;
    }

    /// Sets the sampling mode.
    pub fn set_scale_mode(self: *Texture, mode: ScaleMode) void {
        self.scale_mode = mode;
    }

    /// Sets the encoding of the RGB samples (SDL's texture colorspace).
    pub fn set_colorspace(self: *Texture, colorspace: Colorspace) void {
        self.colorspace = colorspace;
    }

    /// Sets the SDR white level and HDR headroom of the content (SDL's texture
    /// properties). Headroom above the output's headroom makes the shader tone map.
    pub fn set_hdr(self: *Texture, sdr_white_point: f32, hdr_headroom: f32) void {
        self.sdr_white_point = sdr_white_point;
        self.hdr_headroom = hdr_headroom;
    }

    /// Releases the palette, the chroma planes, the main plane and the shadow.
    /// Used by `GpuRenderer.destroy_texture`; device storage retires with the GPU.
    pub fn release(self: *Texture, allocator: std.mem.Allocator) void {
        if (self.shadow) |bytes| allocator.free(bytes);
        if (self.palette) |*palette| palette.deinit();
        if (self.chroma_v) |*plane| plane.deinit();
        if (self.chroma_u) |*plane| plane.deinit();
        self.gpu.deinit();
        self.* = undefined;
    }
};

/// Shadow-buffer byte count of a `width` by `height` streaming texture of `texel_bytes` texels.
pub fn shadow_size(width_pixels: u31, height_pixels: u31, texel_bytes: u32) error{Overflow}!usize {
    const row = std.math.mul(usize, width_pixels, texel_bytes) catch return error.Overflow;
    return std.math.mul(usize, row, height_pixels) catch error.Overflow;
}
