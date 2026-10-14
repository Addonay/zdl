//! Colorspace policy of the GPU render backend: YCbCr-to-RGB matrices, the
//! sRGB/BT.709-to-BT.2020 conversions used when the output is linear or HDR10,
//! and the swapchain composition each output colorspace selects.
//!
//! Ported from SDL_pixels.c (`SDL_GetYCbCRtoRGBConversionMatrix`, the
//! `mat_BT*_*_*bit` tables, `SDL_sRGBtoLinear`, `mat709to2020`), SDL_render.c
//! (`SDL_ConvertToLinear`) and SDL_render_gpu.c (`GPU_CreateRenderer`, the
//! composition switch). Matrices are stored row-major as the shader expects:
//! row 0 is the offset, rows 1..3 are the R, G and B coefficients (each row
//! four floats, the last one zero), matching SDL's `YCbCr_matrix`.
//!
//! Numeric convention: all values are f32 in the ranges SDL uses (encoded
//! components in [0, 1]); the offsets already fold in the limited-range
//! expansion for 8-bit or 10-bit input.
const std = @import("std");
const types = @import("../../gpu/types.zig");

/// Matrix coefficient family of a YCbCr texture (SDL's `SDL_MATRIX_COEFFICIENTS_*`).
pub const Matrix = enum {
    /// Chosen from the bit depth and the picture height, as SDL does for untagged content.
    unspecified,
    bt601,
    bt709,
    bt2020,
};

/// Quantization range of YCbCr samples.
pub const Range = enum {
    /// Video range: luma 16..235, chroma 16..240 for eight bits.
    limited,
    full,
};

/// A YCbCr colorspace. SDL's default for YUV textures is BT.601 limited.
pub const YuvColorspace = struct {
    matrix: Matrix = .bt601,
    range: Range = .limited,
};

/// Colorspace of the renderer output, as SDL_COLORSPACE_* selects it for the GPU renderer.
pub const Output = enum {
    /// Gamma-encoded sRGB on an SDR swapchain.
    srgb,
    /// Linear light on an extended-range swapchain (scRGB).
    srgb_linear,
    /// BT.2020 PQ on an HDR10 swapchain. Vertex colors are converted to linear BT.2020.
    hdr10,
};

/// How a texture's RGB samples are encoded, as the advanced fragment shader's
/// `input_type` expresses it (`INPUTTYPE_*`).
pub const Input = enum(u8) {
    /// Encoding unspecified; the sampler converts as the output requires.
    unspecified = 0,
    srgb = 1,
    scrgb = 2,
    hdr10 = 3,
};

/// Swapchain composition SDL selects for an output colorspace.
pub fn composition(output: Output) types.SwapchainComposition {
    return switch (output) {
        .srgb => .sdr,
        .srgb_linear => .hdr_extended_linear,
        .hdr10 => .hdr10_st2084,
    };
}

/// Output colorspace whose swapchain uses `composition`, for windows claimed
/// with an explicit composition.
pub fn output_for_composition(value: types.SwapchainComposition) Output {
    return switch (value) {
        .sdr, .sdr_linear => .srgb,
        .hdr_extended_linear => .srgb_linear,
        .hdr10_st2084 => .hdr10,
    };
}

/// Whether draws are computed in linear light (SDL's `SDL_RenderingLinearSpace`).
pub fn is_linear(output: Output) bool {
    return output != .srgb;
}

/// The 4x4 YCbCr-to-RGB matrix for `colorspace` at `bits_per_pixel` of input
/// (8, 10 or 16) and picture `height`, as SDL_GetYCbCRtoRGBConversionMatrix.
/// Untagged content uses BT.601 for SD-height eight-bit pictures (576 lines or
/// fewer), BT.709 otherwise, and BT.2020 for higher bit depths.
pub fn ycbcr_matrix(colorspace: YuvColorspace, height: u32, bits_per_pixel: u8) [16]f32 {
    const matrix: Matrix = switch (colorspace.matrix) {
        .unspecified => switch (bits_per_pixel) {
            8 => if (height <= sd_height_threshold) .bt601 else .bt709,
            else => .bt2020,
        },
        else => colorspace.matrix,
    };
    return switch (matrix) {
        .unspecified => unreachable,
        .bt601 => if (colorspace.range == .full) bt601_full_8bit else bt601_limited_8bit,
        .bt709 => if (colorspace.range == .full) bt709_full_8bit else bt709_limited_8bit,
        .bt2020 => if (colorspace.range == .full) bt2020_full_10bit else bt2020_limited_10bit,
    };
}

/// Picture heights up to this value count as SD for untagged eight-bit content (SDL's `YUV_SD_THRESHOLD`).
pub const sd_height_threshold = 576;

/// sRGB transfer function decode (SDL_sRGBtoLinear).
pub fn srgb_to_linear(value: f32) f32 {
    if (value <= 0.04045) return value / 12.92;
    return std.math.pow(f32, (value + 0.055) / 1.055, 2.4);
}

/// Converts a linear BT.709 color to linear BT.2020 (SDL_ConvertColor709to2020).
pub fn bt709_to_bt2020(rgb: [3]f32) [3]f32 {
    const m = mat709to2020;
    return .{
        m[0] * rgb[0] + m[1] * rgb[1] + m[2] * rgb[2],
        m[3] * rgb[0] + m[4] * rgb[1] + m[5] * rgb[2],
        m[6] * rgb[0] + m[7] * rgb[1] + m[8] * rgb[2],
    };
}

/// Linear BT.709 to BT.2020 primaries, row-major (SDL_pixels.c `mat709to2020`).
const mat709to2020 = [9]f32{
    0.627404, 0.329283, 0.043313,
    0.069097, 0.919541, 0.011362,
    0.016391, 0.088013, 0.895595,
};

// Matrices from SDL_pixels.c: "limited" folds the video-range offsets into the
// first row; coefficients are the usual BT.601/BT.709/BT.2020 ones.
const bt601_limited_8bit = [16]f32{
    -0.0627451017, -0.501960814, -0.501960814, 0.0,
    1.1644,        0.0000,       1.5960,       0.0,
    1.1644,        -0.3918,      -0.8130,      0.0,
    1.1644,        2.0172,       0.0000,       0.0,
};

const bt601_full_8bit = [16]f32{
    0.0,    -0.501960814, -0.501960814, 0.0,
    1.0000, 0.0000,       1.4075,       0.0,
    1.0000, -0.3455,      -0.7169,      0.0,
    1.0000, 1.7790,       0.0000,       0.0,
};

const bt709_limited_8bit = [16]f32{
    -0.0627451017, -0.501960814, -0.501960814, 0.0,
    1.1644,        0.0000,       1.7927,       0.0,
    1.1644,        -0.2132,      -0.5329,      0.0,
    1.1644,        2.1124,       0.0000,       0.0,
};

const bt709_full_8bit = [16]f32{
    0.0,    -0.501960814, -0.501960814, 0.0,
    1.0000, 0.0000,       1.5810,       0.0,
    1.0000, -0.1881,      -0.4700,      0.0,
    1.0000, 1.8629,       0.0000,       0.0,
};

const bt2020_limited_10bit = [16]f32{
    -0.062561095, -0.500488759, -0.500488759, 0.0,
    1.1678,       0.0000,       1.6836,       0.0,
    1.1678,       -0.1879,      -0.6523,      0.0,
    1.1678,       2.1481,       0.0000,       0.0,
};

const bt2020_full_10bit = [16]f32{
    0.0,    -0.500488759, -0.500488759, 0.0,
    1.0000, 0.0000,       1.4760,       0.0,
    1.0000, -0.1647,      -0.5719,      0.0,
    1.0000, 1.8832,       0.0000,       0.0,
};
