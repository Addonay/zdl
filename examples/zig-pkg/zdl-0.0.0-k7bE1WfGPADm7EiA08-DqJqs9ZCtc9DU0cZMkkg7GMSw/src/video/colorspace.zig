//! Colorspace descriptions, transfer functions, primaries conversion, HDR
//! headroom rules and YCbCr-to-RGB coefficients.
//! Altered native port of SDL_pixels.c (colorspace defaults, matrices, PQ and
//! sRGB functions), SDL_surface.c (SDR white point and HDR headroom) and the
//! tonemap/primaries math of SDL_blit_slow.c. Values are the reference's
//! constants, so results match SDL's float path.
//!
//! Deliberate differences from SDL:
//! - `Colorspace` is a struct of typed fields. `bits`/`from_bits` convert to and
//!   from SDL's packed 32-bit encoding only where a caller needs interchange.
//! - BT.709/BT.601 and HLG transfer functions are implemented here. SDL leaves
//!   those transfers untouched in its blitters; `pixels_wide` applies them
//!   explicitly when a caller asks for them.
//! - Transfer functions are pure functions of the value and the SDR white point
//!   supplied by the caller, instead of reading surface properties.
const std = @import("std");

/// Colorspace type. RGB and YCbCr use the same packed bits but different matrix rules.
pub const ColorType = enum(u4) { unknown = 0, rgb = 1, ycbcr = 2 };
/// Numeric range of the encoded components.
pub const Range = enum(u4) { unknown = 0, limited = 1, full = 2 };
/// Chromaticity primaries (ITU-T H.273 numbering, as in SDL).
pub const Primaries = enum(u5) {
    unknown = 0,
    bt709 = 1,
    unspecified = 2,
    bt470m = 4,
    bt470bg = 5,
    bt601 = 6,
    smpte240 = 7,
    generic_film = 8,
    bt2020 = 9,
    xyz = 10,
    smpte431 = 11,
    smpte432 = 12,
    ebu3213 = 22,
    custom = 31,
};
/// Opto-electronic / electro-optical transfer characteristics.
pub const Transfer = enum(u5) {
    unknown = 0,
    bt709 = 1,
    unspecified = 2,
    gamma22 = 4,
    gamma28 = 5,
    bt601 = 6,
    smpte240 = 7,
    linear = 8,
    log100 = 9,
    log100_sqrt10 = 10,
    iec61966 = 11,
    bt1361 = 12,
    srgb = 13,
    bt2020_10bit = 14,
    bt2020_12bit = 15,
    pq = 16,
    smpte428 = 17,
    hlg = 18,
    custom = 31,
};
/// YCbCr-to-RGB matrix selection.
pub const Matrix = enum(u5) {
    identity = 0,
    bt709 = 1,
    unspecified = 2,
    fcc = 4,
    bt470bg = 5,
    bt601 = 6,
    smpte240 = 7,
    ycgco = 8,
    bt2020_ncl = 9,
    bt2020_cl = 10,
    smpte2085 = 11,
    chroma_derived_ncl = 12,
    chroma_derived_cl = 13,
    ictcp = 14,
    custom = 31,
};
/// Chroma sample siting for subsampled YCbCr.
pub const Chroma = enum(u4) { none = 0, left = 1, center = 2, topleft = 3 };

/// A complete colorspace descriptor. Compare with `==`; it is a plain value.
pub const Colorspace = struct {
    color_type: ColorType = .unknown,
    range: Range = .unknown,
    primaries: Primaries = .unknown,
    transfer: Transfer = .unknown,
    matrix: Matrix = .identity,
    chroma: Chroma = .none,

    /// SDL's packed interchange value (type<<28, range<<24, chroma<<20,
    /// primaries<<10, transfer<<5, matrix).
    pub fn bits(self: Colorspace) u32 {
        return (@as(u32, @backingInt(self.color_type)) << 28) |
            (@as(u32, @backingInt(self.range)) << 24) |
            (@as(u32, @backingInt(self.chroma)) << 20) |
            (@as(u32, @backingInt(self.primaries)) << 10) |
            (@as(u32, @backingInt(self.transfer)) << 5) |
            @as(u32, @backingInt(self.matrix));
    }

    /// Decodes a packed value. Unknown enumerants yield null rather than an
    /// invalid descriptor.
    pub fn from_bits(value: u32) ?Colorspace {
        return .{
            .color_type = std.enums.fromInt(ColorType, @as(u4, @truncate(value >> 28))) orelse return null,
            .range = std.enums.fromInt(Range, @as(u4, @truncate(value >> 24))) orelse return null,
            .chroma = std.enums.fromInt(Chroma, @as(u4, @truncate(value >> 20))) orelse return null,
            .primaries = std.enums.fromInt(Primaries, @as(u5, @truncate(value >> 10))) orelse return null,
            .transfer = std.enums.fromInt(Transfer, @as(u5, @truncate(value >> 5))) orelse return null,
            .matrix = std.enums.fromInt(Matrix, @as(u5, @truncate(value))) orelse return null,
        };
    }

    /// True for limited (studio) range; unknown range is treated as limited for YCbCr matrices.
    pub fn is_limited(self: Colorspace) bool {
        return self.range == .limited;
    }
    /// True for full-range components.
    pub fn is_full(self: Colorspace) bool {
        return self.range == .full;
    }
};

/// Predefined colorspaces. Names follow SDL_Colorspace.
pub const srgb: Colorspace = .{ .color_type = .rgb, .range = .full, .primaries = .bt709, .transfer = .srgb, .matrix = .identity, .chroma = .none };
pub const srgb_linear: Colorspace = .{ .color_type = .rgb, .range = .full, .primaries = .bt709, .transfer = .linear, .matrix = .identity, .chroma = .none };
pub const hdr10: Colorspace = .{ .color_type = .rgb, .range = .full, .primaries = .bt2020, .transfer = .pq, .matrix = .identity, .chroma = .none };
pub const jpeg: Colorspace = .{ .color_type = .ycbcr, .range = .full, .primaries = .bt709, .transfer = .bt601, .matrix = .bt601, .chroma = .none };
pub const bt601_limited: Colorspace = .{ .color_type = .ycbcr, .range = .limited, .primaries = .bt601, .transfer = .bt601, .matrix = .bt601, .chroma = .left };
pub const bt601_full: Colorspace = .{ .color_type = .ycbcr, .range = .full, .primaries = .bt601, .transfer = .bt601, .matrix = .bt601, .chroma = .left };
pub const bt709_limited: Colorspace = .{ .color_type = .ycbcr, .range = .limited, .primaries = .bt709, .transfer = .bt709, .matrix = .bt709, .chroma = .left };
pub const bt709_full: Colorspace = .{ .color_type = .ycbcr, .range = .full, .primaries = .bt709, .transfer = .bt709, .matrix = .bt709, .chroma = .left };
pub const bt2020_limited: Colorspace = .{ .color_type = .ycbcr, .range = .limited, .primaries = .bt2020, .transfer = .pq, .matrix = .bt2020_ncl, .chroma = .left };
pub const bt2020_full: Colorspace = .{ .color_type = .ycbcr, .range = .full, .primaries = .bt2020, .transfer = .pq, .matrix = .bt2020_ncl, .chroma = .left };

/// Broad storage class used to pick a default colorspace.
pub const FormatClass = enum { rgb8, rgb10, float_rgb, yuv8, hdr_yuv, mjpeg };

/// Default colorspace for a storage class, matching SDL_GetDefaultColorspaceForFormat.
/// Passing a YUV class yields the BT.601 limited default (SDL_COLORSPACE_YUV_DEFAULT).
pub fn default_for(class: FormatClass) Colorspace {
    return switch (class) {
        .rgb8, .mjpeg => srgb,
        .rgb10, .hdr_yuv => hdr10,
        .float_rgb => srgb_linear,
        .yuv8 => bt601_limited,
    };
}

// ---------------------------------------------------------------- transfers

/// sRGB (IEC 61966-2-1) electro-optical function; linear branch below 0.04045.
pub fn srgb_to_linear(value: f32) f32 {
    if (value <= 0.04045) return value / 12.92;
    return std.math.pow(f32, (value + 0.055) / 1.055, 2.4);
}

/// Inverse of `srgb_to_linear` (opto-electronic sRGB encoding).
pub fn srgb_from_linear(value: f32) f32 {
    if (value <= 0.0031308) return value * 12.92;
    return std.math.pow(f32, value, 1.0 / 2.4) * 1.055 - 0.055;
}

/// SMPTE ST 2084 (PQ) decoding of a normalized code value into nits.
/// Constants and evaluation order match SDL_PQtoNits.
pub fn pq_to_nits(value: f32) f32 {
    const c1: f32 = 0.8359375;
    const c2: f32 = 18.8515625;
    const c3: f32 = 18.6875;
    const oo_m1: f32 = 1.0 / 0.1593017578125;
    const oo_m2: f32 = 1.0 / 78.84375;

    const num = @max(std.math.pow(f32, value, oo_m2) - c1, 0.0);
    const den = c2 - c3 * std.math.pow(f32, value, oo_m2);
    return 10000.0 * std.math.pow(f32, num / den, oo_m1);
}

/// PQ encoding of an absolute luminance in nits (clamped to 0..10000).
/// Matches SDL_PQfromNits.
pub fn pq_from_nits(nits: f32) f32 {
    const c1: f32 = 0.8359375;
    const c2: f32 = 18.8515625;
    const c3: f32 = 18.6875;
    const m1: f32 = 0.1593017578125;
    const m2: f32 = 78.84375;

    const y = std.math.clamp(nits / 10000.0, 0.0, 1.0);
    const num = c1 + c2 * std.math.pow(f32, y, m1);
    const den = 1.0 + c3 * std.math.pow(f32, y, m1);
    return std.math.pow(f32, num / den, m2);
}

/// ITU-R BT.709 / BT.601 opto-electronic inverse (display linear, reference white 1.0).
pub fn bt709_to_linear(value: f32) f32 {
    if (value < 0.081) return value / 4.5;
    return std.math.pow(f32, (value + 0.099) / 1.099, 1.0 / 0.45);
}

/// Inverse of `bt709_to_linear`.
pub fn bt709_from_linear(value: f32) f32 {
    if (value < 0.018) return value * 4.5;
    return 1.099 * std.math.pow(f32, value, 0.45) - 0.099;
}

/// ARIB STD-B67 (HLG) inverse OETF with unit nominal peak, OOTF omitted.
pub fn hlg_to_linear(value: f32) f32 {
    const a: f32 = 0.17883277;
    const b: f32 = 1.0 - 4.0 * a;
    const c: f32 = 0.5 - a * @log(4.0 * a);
    if (value <= 0.5) return (value * value) / 3.0;
    return (@exp((value - c) / a) + b) / 12.0;
}

/// Forward HLG OETF for a relative linear value in [0,1].
pub fn hlg_from_linear(value: f32) f32 {
    const a: f32 = 0.17883277;
    const b: f32 = 1.0 - 4.0 * a;
    const c: f32 = 0.5 - a * @log(4.0 * a);
    if (value <= 1.0 / 12.0) return @sqrt(3.0 * @max(value, 0.0));
    return a * @log(12.0 * value - b) + c;
}

/// Decodes one normalized code value to linear light using SDL's convention:
/// PQ and linear inputs are divided by the SDR white point (1.0 is SDR white),
/// sRGB, BT.709/601 and HLG are relative to their reference white. Unknown or
/// custom transfers are returned unchanged.
pub fn decode(transfer: Transfer, value: f32, sdr_white: f32) f32 {
    return switch (transfer) {
        .srgb => srgb_to_linear(value),
        .pq => pq_to_nits(value) / sdr_white,
        .linear => value / sdr_white,
        .bt709, .bt601 => bt709_to_linear(value),
        .hlg => hlg_to_linear(value),
        else => value,
    };
}

/// Inverse of `decode`.
pub fn encode(transfer: Transfer, value: f32, sdr_white: f32) f32 {
    return switch (transfer) {
        .srgb => srgb_from_linear(value),
        .pq => pq_from_nits(value * sdr_white),
        .linear => value * sdr_white,
        .bt709, .bt601 => bt709_from_linear(value),
        .hlg => hlg_from_linear(value),
        else => value,
    };
}

// ---------------------------------------------------------------- white and headroom

/// SDR white point in nits-normalized units: 1.0 for non-HDR transfers,
/// otherwise the caller's override or SDL's default (203 nits for PQ, 1.0 for linear).
/// Matches SDL_GetSurfaceSDRWhitePoint with a null surface property.
pub fn sdr_white_point(colorspace: Colorspace, override: ?f32) f32 {
    if (colorspace.transfer != .linear and colorspace.transfer != .pq) return 1.0;
    const default: f32 = if (colorspace.transfer == .pq) 203.0 else 1.0;
    return override orelse default;
}

/// HDR headroom: 0 when unset for linear/PQ, 1.0 for other transfers.
/// Matches SDL_GetSurfaceHDRHeadroom.
pub fn hdr_headroom(colorspace: Colorspace, override: ?f32) f32 {
    if (colorspace.transfer != .linear and colorspace.transfer != .pq) return 1.0;
    return override orelse 0.0;
}

// ---------------------------------------------------------------- primaries

/// Row-major 3x3 primaries conversion matrix, applied as `out = M * in`.
pub const Matrix3 = [9]f32;

const mat601to709: Matrix3 = .{ 0.939542, 0.050181, 0.010277, 0.017772, 0.965793, 0.016435, -0.001622, -0.004370, 1.005991 };
const mat601to2020: Matrix3 = .{ 0.595254, 0.349314, 0.055432, 0.081244, 0.891503, 0.027253, 0.015512, 0.081912, 0.902576 };
const mat709to601: Matrix3 = .{ 1.065379, -0.055401, -0.009978, -0.019633, 1.036363, -0.016731, 0.001632, 0.004412, 0.993956 };
const mat709to2020: Matrix3 = .{ 0.627404, 0.329283, 0.043313, 0.069097, 0.919541, 0.011362, 0.016391, 0.088013, 0.895595 };
const mat2020to601: Matrix3 = .{ 1.776133, -0.687820, -0.088313, -0.161376, 1.187315, -0.025940, -0.015881, -0.095931, 1.111812 };
const mat2020to709: Matrix3 = .{ 1.660496, -0.587656, -0.072840, -0.124547, 1.132895, -0.008348, -0.018154, -0.100597, 1.118751 };
const matsmpte431to709: Matrix3 = .{ 1.120713, -0.234649, 0.0, -0.038478, 1.087034, 0.0, -0.017967, -0.082030, 0.954576 };
const matsmpte431to2020: Matrix3 = .{ 0.689691, 0.207169, 0.041346, 0.041852, 0.982426, 0.010846, -0.001107, 0.018362, 0.854914 };
const matsmpte432to709: Matrix3 = .{ 1.224940, -0.224940, -0.0, -0.042057, 1.042057, 0.0, -0.019638, -0.078636, 1.098273 };
const matsmpte432to2020: Matrix3 = .{ 0.753833, 0.198597, 0.047570, 0.045744, 0.941777, 0.012479, -0.001210, 0.017602, 0.983609 };

/// Primaries conversion matrix as SDL_GetColorPrimariesConversionMatrix
/// computes it (precomputed from H.273 chromaticities). Returns null for pairs
/// SDL does not tabulate, including identical primaries.
pub fn primaries_matrix(src: Primaries, dst: Primaries) ?Matrix3 {
    return switch (dst) {
        .bt601, .smpte240 => switch (src) {
            .bt709 => mat709to601,
            .bt2020 => mat2020to601,
            else => null,
        },
        .bt709 => switch (src) {
            .bt601, .smpte240 => mat601to709,
            .bt2020 => mat2020to709,
            .smpte431 => matsmpte431to709,
            .smpte432 => matsmpte432to709,
            else => null,
        },
        .bt2020 => switch (src) {
            .bt601, .smpte240 => mat601to2020,
            .bt709 => mat709to2020,
            .smpte431 => matsmpte431to2020,
            .smpte432 => matsmpte432to2020,
            else => null,
        },
        else => null,
    };
}

/// Applies a primaries matrix to linear RGB. Matrix rows are multiplied
/// in the order SDL_ConvertColorPrimaries uses.
pub fn convert_primaries(rgb: [3]f32, m: Matrix3) [3]f32 {
    return .{
        m[0] * rgb[0] + m[1] * rgb[1] + m[2] * rgb[2],
        m[3] * rgb[0] + m[4] * rgb[1] + m[5] * rgb[2],
        m[6] * rgb[0] + m[7] * rgb[1] + m[8] * rgb[2],
    };
}

// ---------------------------------------------------------------- tone mapping

/// Tone mapping operator applied when source headroom exceeds destination headroom.
pub const Tonemap = union(enum) {
    none,
    /// Multiply all channels by a constant (SDL's "*=<scale>" operator).
    linear: f32,
    /// Google Chrome operator used by SDL by default.
    chrome,
};

/// Precomputed factors for the Chrome operator.
pub const Chrome = struct {
    a: f32,
    b: f32,

    /// tonemap_a = dst/(src*src), tonemap_b = 1/dst (SDL_blit_slow.c).
    pub fn init(src_headroom: f32, dst_headroom: f32) Chrome {
        return .{ .a = dst_headroom / (src_headroom * src_headroom), .b = 1.0 / dst_headroom };
    }

    /// Scales the color by the Chrome factor for its maximum component. Values
    /// with no positive component are unchanged.
    pub fn apply(self: Chrome, rgb: [3]f32) [3]f32 {
        const vmax = @max(rgb[0], @max(rgb[1], rgb[2]));
        if (!(vmax > 0.0)) return rgb;
        const scale = (1.0 + self.a * vmax) / (1.0 + self.b * vmax);
        return .{ rgb[0] * scale, rgb[1] * scale, rgb[2] * scale };
    }
};

// ---------------------------------------------------------------- YCbCr

/// YCbCr to RGB as `rgb[c] = sum_j m[c][j] * (ycc[j] + offset[j])`, where
/// `ycc` are normalized code values (code / full-scale). Offsets are added
/// before the matrix, as in SDL's 4-row tables.
pub const YcbcrToRgb = struct {
    offset: [3]f32,
    m: [3][3]f32,

    /// Applies the matrix to normalized (Y, Cb, Cr) and returns RGB (not clamped).
    pub fn apply(self: YcbcrToRgb, ycc: [3]f32) [3]f32 {
        const v = [3]f32{ ycc[0] + self.offset[0], ycc[1] + self.offset[1], ycc[2] + self.offset[2] };
        return .{
            self.m[0][0] * v[0] + self.m[0][1] * v[1] + self.m[0][2] * v[2],
            self.m[1][0] * v[0] + self.m[1][1] * v[1] + self.m[1][2] * v[2],
            self.m[2][0] * v[0] + self.m[2][1] * v[1] + self.m[2][2] * v[2],
        };
    }
};

// Tables transcribed from SDL_pixels.c. Rows of the reference are stored here as
// offset plus (R, G, B) coefficient rows over (Y, Cb, Cr).
const bt601_limited_8: YcbcrToRgb = .{ .offset = .{ -0.0627451017, -0.501960814, -0.501960814 }, .m = .{ .{ 1.1644, 0.0, 1.5960 }, .{ 1.1644, -0.3918, -0.8130 }, .{ 1.1644, 2.0172, 0.0 } } };
const bt601_full_8: YcbcrToRgb = .{ .offset = .{ 0.0, -0.501960814, -0.501960814 }, .m = .{ .{ 1.0, 0.0, 1.4075 }, .{ 1.0, -0.3455, -0.7169 }, .{ 1.0, 1.7790, 0.0 } } };
const bt709_limited_8: YcbcrToRgb = .{ .offset = .{ -0.0627451017, -0.501960814, -0.501960814 }, .m = .{ .{ 1.1644, 0.0, 1.7927 }, .{ 1.1644, -0.2132, -0.5329 }, .{ 1.1644, 2.1124, 0.0 } } };
const bt709_full_8: YcbcrToRgb = .{ .offset = .{ 0.0, -0.501960814, -0.501960814 }, .m = .{ .{ 1.0, 0.0, 1.5810 }, .{ 1.0, -0.1881, -0.4700 }, .{ 1.0, 1.8629, 0.0 } } };
const bt2020_limited_10: YcbcrToRgb = .{ .offset = .{ -0.062561095, -0.500488759, -0.500488759 }, .m = .{ .{ 1.1678, 0.0, 1.6836 }, .{ 1.1678, -0.1879, -0.6523 }, .{ 1.1678, 2.1481, 0.0 } } };
const bt2020_full_10: YcbcrToRgb = .{ .offset = .{ 0.0, -0.500488759, -0.500488759 }, .m = .{ .{ 1.0, 0.0, 1.4760 }, .{ 1.0, -0.1647, -0.5719 }, .{ 1.0, 1.8832, 0.0 } } };

/// SDL_YUV_SD_THRESHOLD: unspecified-matrix 8-bit content at or below this height is BT.601.
pub const yuv_sd_threshold: usize = 576;

/// YCbCr-to-RGB matrix for a colorspace, as SDL_GetYCbCRtoRGBConversionMatrix
/// selects it. `height` and `bits_per_pixel` (8, 10 or 16) only matter for an
/// unspecified matrix. Returns null for RGB or identity matrices and for
/// unsupported pairs. 16-bit content uses the 10-bit BT.2020 tables; callers
/// requantize (see `yuv_wide`). Limited range is used for an unknown range.
pub fn ycbcr_matrix(colorspace: Colorspace, height: usize, bits_per_pixel: u8) ?YcbcrToRgb {
    if (colorspace.color_type == .rgb) return null;
    const family: enum { bt601, bt709, bt2020 } = switch (colorspace.matrix) {
        .bt601, .bt470bg => .bt601,
        .bt709 => .bt709,
        .bt2020_ncl => .bt2020,
        .unspecified => switch (bits_per_pixel) {
            8 => if (height <= yuv_sd_threshold) .bt601 else .bt709,
            10, 16 => .bt2020,
            else => return null,
        },
        else => return null,
    };
    const full = colorspace.range == .full;
    return switch (family) {
        .bt601 => if (full) bt601_full_8 else bt601_limited_8,
        .bt709 => if (full) bt709_full_8 else bt709_limited_8,
        .bt2020 => if (full) bt2020_full_10 else bt2020_limited_10,
    };
}
