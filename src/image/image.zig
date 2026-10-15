//! Image codecs over borrowed encoded bytes.
//!
//! Every codec sits behind a `load_<format>` function that takes the encoded
//! bytes, a `std.mem.Allocator` and one `Options` value; `.{}` decodes an
//! ordinary image exactly as its format defines it. `decode` sniffs the
//! container first, and `probe` reads headers without touching pixels.
//!
//! Decoded images own their pixels (`Image.deinit`) and are always a
//! `surface.Surface`, so any surface operation works on one. File I/O belongs
//! to the caller: this module never opens a path.
//!
//! ```zig
//! const bytes = try file.readToEndAlloc(allocator, io, limit);
//! var image = try zdl.image.load_webp(allocator, bytes, .{
//!     .resize = .{ .max_dimension = 512 },
//!     .output = .rgba8,
//! });
//! defer image.deinit();
//! ```
//!
//! What the facade deliberately does not do: apply ICC color management, read
//! EXIF beyond the orientation transform, or convert between color spaces
//! beyond what a codec needs internally (AV1 CICP, JPEG XL XYB). Those are
//! explicit, sometimes lossy choices and belong to the caller.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");
const bmp_module = @import("../video/bmp.zig");

pub const options = @import("options.zig");
pub const limits = @import("limits.zig");
pub const format = @import("format.zig");
pub const probe_module = @import("probe.zig");
pub const animation = @import("animation.zig");
pub const resample = @import("resample.zig");
pub const transform = @import("transform.zig");

// Codec modules, exposed so callers can reach a bitstream API directly.
pub const jpeg = @import("jpeg.zig");
pub const png = @import("png.zig");
pub const raster = @import("raster.zig");
pub const webp = @import("webp.zig");
pub const bmp = bmp_module;
pub const mjpg = @import("mjpg.zig");

pub const Format = format.Format;
pub const Options = options.Options;
pub const Limits = limits.Limits;
pub const Output = options.Output;
pub const Filter = options.Filter;
pub const Resize = options.Resize;
pub const Orientation = transform.Orientation;
pub const Animation = animation.Animation;
pub const Frame = animation.Frame;
pub const Info = probe_module.Info;

/// Decoded image with any palette it borrows; released by `deinit`.
pub const Image = struct {
    allocator: std.mem.Allocator,
    surface: surface.Surface,
    /// Storage behind an indexed surface's palette, when there is one.
    palette: ?[]pixels.Color,
    /// Color-key or blend hint for palette images, mirroring SDL's rule: one
    /// fully transparent entry becomes a color key, partial opacity or several
    /// transparent entries select blending.
    transparency: Transparency = .none,
    /// Container metadata found while decoding. Byte slices inside it borrow
    /// from the encoded input and are invalid once that input is released.
    info: ?Info = null,

    pub fn deinit(self: *Image) void {
        self.surface.deinit();
        if (self.palette) |colors| self.allocator.free(colors);
        self.* = undefined;
    }

    pub fn width(self: Image) u31 {
        return self.surface.view.width;
    }

    pub fn height(self: Image) u31 {
        return self.surface.view.height;
    }

    /// True when the decoded pixels carry partial or fully transparent alpha.
    pub fn hasTransparency(self: Image) bool {
        return switch (self.transparency) {
            .none => false,
            else => true,
        };
    }

    /// Straight-alpha RGBA8 copy, converting when needed. Convenient for
    /// callers that just want to hand pixels to a texture upload.
    pub fn toRgba8(self: Image) Error!surface.Surface {
        if (std.meta.eql(self.surface.view.format, .rgba8)) return surface.Surface.copy(self.allocator, self.surface.view);
        return surface.Surface.convert(self.allocator, self.surface.view, .rgba8, null);
    }

    /// Encodes the image as PNG; the caller frees the bytes.
    pub fn encodePng(self: Image, encode_options: png.EncodeOptions) Error![]u8 {
        return png.encode_with_options(self.allocator, self.surface.view, encode_options);
    }

    /// Encodes the image as QOI; the caller frees the bytes.
    pub fn encodeQoi(self: Image) Error![]u8 {
        return raster.encode_qoi(self.allocator, self.surface.view);
    }
};

/// Color-key or blend information for a palette image, as SDL reports it.
pub const Transparency = union(enum) {
    none,
    /// Palette index whose entry is fully transparent.
    color_key: u8,
    /// At least one entry has partial opacity, or several are transparent.
    blend,
};

/// Failures reported by the facade, the codecs and surface storage.
pub const Error = raster.Error || png.Error || jpeg.Error || webp.Error ||
    bmp_module.Error || transform.Error ||
    error{
        UnknownFormat,
        UnsupportedFormat,
        DecodeLimitExceeded,
        InvalidCrop,
        FrameNotFound,
        NotJpeg,
        NotPng,
        NotWebp,
        InvalidContainer,
        TruncatedData,
        UnsupportedAnimation,
    };

/// Signature-based format detection. TGA has no reliable magic and must be
/// requested through `decode_as`.
pub const detect = format.detect;

/// Header metadata with no pixel decoding and no pixel allocation.
pub const probe = probe_module.probe;

/// True when a decoder is registered for the format.
pub fn isDecodable(value: Format) bool {
    return switch (value) {
        .png, .jpeg, .bmp, .qoi, .gif, .pnm, .tga, .webp => true,
        else => false,
    };
}

/// Detects the format and decodes it.
pub fn decode(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    try checkInput(bytes, decode_options);
    return decodeAs(allocator, bytes, detect(bytes) orelse return error.UnknownFormat, decode_options);
}

/// Explicit format selection, for containers without a usable signature such
/// as TGA, or to reject a mislabeled file instead of trusting its magic.
pub fn decodeAs(allocator: std.mem.Allocator, bytes: []const u8, value: Format, decode_options: Options) Error!Image {
    return switch (value) {
        .png => load_png(allocator, bytes, decode_options),
        .jpeg => load_jpeg(allocator, bytes, decode_options),
        .bmp => load_bmp(allocator, bytes, decode_options),
        .qoi => load_qoi(allocator, bytes, decode_options),
        .gif => load_gif(allocator, bytes, decode_options),
        .pnm => load_pnm(allocator, bytes, decode_options),
        .tga => load_tga(allocator, bytes, decode_options),
        .webp => load_webp(allocator, bytes, decode_options),
        else => error.UnsupportedFormat,
    };
}

// ----------------------------------------------------------------------------
// Decoders

/// PNG into an owned surface. Indexed images keep their indices and palette,
/// greyscale keeps a grey ramp, as `SDL_LoadPNG` does.
pub fn load_png(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    try checkInput(bytes, decode_options);
    if (!png.is_png(bytes)) return error.NotPng;
    const info = try probed(bytes, .png);
    try checkSize(info.width, info.height, decode_options);
    var decoded = try png.decode_with_options(allocator, bytes, .{
        .max_width = decode_options.limits.max_width,
        .max_height = decode_options.limits.max_height,
        .max_decoded_bytes = decode_options.limits.max_output_bytes,
        .max_compressed_bytes = decode_options.limits.max_input_bytes,
        .verify_checksums = decode_options.codec.png.verify_checksums,
    });
    defer decoded.deinit();
    const result = try adopt(allocator, decoded.width, decoded.height, decoded.channels, decoded.data, decoded.palette);
    // adopt took the pixels and palette; only the empty decoder shell is left.
    if (decoded.channels != 2) decoded.data = &.{};
    decoded.palette = null;
    return finish(result, info, decode_options);
}

/// Baseline, extended and progressive eight-bit JPEG. EXIF orientation is
/// applied when `Options.pixel.apply_orientation` is set.
pub fn load_jpeg(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    try checkInput(bytes, decode_options);
    const info = probed(bytes, .jpeg) catch return error.NotJpeg;
    try checkSize(info.width, info.height, decode_options);
    var decoded = try jpeg.decode(allocator, bytes, decode_options.codec.jpeg.channels);
    defer decoded.deinit();
    if (decoded.channels == 2) {
        // Grey with alpha must be expanded, so the decoder keeps its storage.
        const expanded = try adopt(allocator, decoded.width, decoded.height, 2, decoded.data, null);
        return finish(expanded, info, decode_options);
    }
    const result = try adopt(allocator, decoded.width, decoded.height, decoded.channels, decoded.data, null);
    decoded.data = &.{};
    return finish(result, info, decode_options);
}

/// Abbreviated spelling of `load_jpeg`, matching the file extension.
pub const load_jpg = load_jpeg;

/// BMP with configurable handling of ambiguous legacy alpha bytes.
pub fn load_bmp(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    try checkInput(bytes, decode_options);
    if (!bmp_module.is_bmp(bytes)) return error.InvalidContainer;
    const info = probed(bytes, .bmp) catch return error.InvalidContainer;
    try checkSize(info.width, info.height, decode_options);
    const decoded = try bmp_module.decode(allocator, bytes, decode_options.codec.bmp);
    return finish(.{
        .allocator = allocator,
        .surface = decoded.surface,
        .palette = decoded.palette,
    }, info, decode_options);
}

/// QOI, the "quite OK image" lossless RGB/RGBA format.
pub fn load_qoi(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    return loadRaster(allocator, bytes, decode_options, .qoi);
}

/// First GIF frame composited onto the logical screen. Use `load_gif_animation`
/// for every frame.
pub fn load_gif(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    if (!decode_options.codec.gif.allow_interlaced and (try probed(bytes, .gif)).interlaced) return error.UnsupportedImage;
    return loadRaster(allocator, bytes, decode_options, .gif);
}

/// Portable anymap family: PBM, PGM and PPM, raw or ASCII.
pub fn load_pnm(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    return loadRaster(allocator, bytes, decode_options, .pnm);
}

/// Truevision TGA: true-color, greyscale and color-mapped, with RLE and both
/// row orders. TGA has no signature, so `decode` will not find it; call this
/// function or `decodeAs` with `.tga`.
pub fn load_tga(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    return loadRaster(allocator, bytes, decode_options, .tga);
}

/// WebP: VP8L lossless, VP8 lossy, ALPH alpha planes, and the first animation
/// frame composited onto a transparent canvas.
pub fn load_webp(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Image {
    try checkInput(bytes, decode_options);
    if (!webp.is_webp(bytes)) return error.NotWebp;
    return loadRaster(allocator, bytes, decode_options, .webp);
}

/// Returns a one-frame animation for a still GIF. Multi-frame compositing is
/// not implemented by the integrated codec yet and returns UnsupportedAnimation;
/// it never silently substitutes the first frame for a requested animation.
pub fn load_gif_animation(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Animation {
    return loadStillAnimation(allocator, bytes, decode_options, .gif);
}

/// Returns a one-frame animation for still WebP. Animated WebP is currently
/// rejected with UnsupportedAnimation rather than losing frame/disposal data.
pub fn load_webp_animation(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Animation {
    return loadStillAnimation(allocator, bytes, decode_options, .webp);
}

/// Returns a one-frame animation for still PNG. APNG compositing is not yet
/// implemented; acTL containers return UnsupportedAnimation.
pub fn load_apng_animation(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options) Error!Animation {
    return loadStillAnimation(allocator, bytes, decode_options, .png);
}

fn loadStillAnimation(allocator: std.mem.Allocator, bytes: []const u8, decode_options: Options, value: Format) Error!Animation {
    try checkInput(bytes, decode_options);
    const info = try probed(bytes, value);
    if (info.animated or info.frames != 1) return error.UnsupportedAnimation;
    var image = try decodeAs(allocator, bytes, value, decode_options);
    defer image.deinit();
    var rgba = try image.toRgba8();
    errdefer rgba.deinit();
    const frames = try allocator.alloc(Frame, 1);
    frames[0] = .{ .surface = rgba, .duration_ms = 0, .index = 0 };
    return .{ .allocator = allocator, .frames = frames, .width = rgba.view.width, .height = rgba.view.height };
}

/// Encodes a surface as PNG. The caller frees the returned bytes.
pub const encode_png = png.encode_with_options;
/// Encodes a surface as lossless QOI. The caller frees the returned bytes.
pub const encode_qoi = raster.encode_qoi;

// ----------------------------------------------------------------------------
// Decoded-image plumbing

fn loadRaster(
    allocator: std.mem.Allocator,
    bytes: []const u8,
    decode_options: Options,
    comptime value: Format,
) Error!Image {
    try checkInput(bytes, decode_options);
    var decoded = try switch (value) {
        .qoi => raster.decode_qoi(allocator, bytes, rasterLimits(decode_options)),
        .gif => raster.decode_gif(allocator, bytes, rasterLimits(decode_options)),
        .pnm => raster.decode_pnm(allocator, bytes, rasterLimits(decode_options)),
        .tga => raster.decode_tga(allocator, bytes, rasterLimits(decode_options)),
        .webp => webp.decode(allocator, bytes, rasterLimits(decode_options)),
        else => return error.UnsupportedFormat,
    };
    defer decoded.deinit();
    try checkSize(decoded.width, decoded.height, decode_options);
    const result = try adoptRgba(allocator, decoded.data, decoded.width, decoded.height);
    decoded.data = &.{};
    const info: Info = probed(bytes, value) catch .{
        .format = value,
        .width = decoded.width,
        .height = decoded.height,
    };
    return finish(result, info, decode_options);
}

/// Takes over a decoder's tightly packed RGBA8 buffer without copying it.
fn adoptRgba(allocator: std.mem.Allocator, data: []u8, width: u31, height: u31) Error!Image {
    const view = try surface.View.init(data, width, height, @as(usize, width) * 4, .rgba8, null);
    return .{ .allocator = allocator, .surface = .{ .allocator = allocator, .view = view }, .palette = null };
}

/// Wraps tightly packed decoder samples in a surface without a second buffer.
/// Grey with alpha needs expansion, so its input stays with the decoder.
fn adopt(
    allocator: std.mem.Allocator,
    width: u31,
    height: u31,
    channels: u8,
    data: []u8,
    palette: ?[]pixels.Color,
) Error!Image {
    if (channels == 2) {
        var result = try surface.Surface.init(allocator, width, height, .rgba8, null);
        errdefer result.deinit();
        for (0..height) |y| {
            const row = try result.view.row(y);
            for (0..width) |x| {
                const offset = (y * @as(usize, width) + x) * 2;
                @memset(row[x * 4 ..][0..3], data[offset]);
                row[x * 4 + 3] = data[offset + 1];
            }
        }
        return .{ .allocator = allocator, .surface = result, .palette = null };
    }
    const pixel_format: pixels.Format = switch (channels) {
        1 => .{ .indexed = .{ .bits = 8 } },
        3 => .rgb8,
        4 => .rgba8,
        else => return error.UnsupportedPng,
    };
    const colors = if (channels == 1) palette orelse try greyPalette(allocator) else null;
    errdefer if (palette == null) {
        if (colors) |owned| allocator.free(owned);
    };
    const view = try surface.View.init(data, width, height, @as(usize, width) * channels, pixel_format, colors);
    return .{
        .allocator = allocator,
        .surface = .{ .allocator = allocator, .view = view },
        .palette = colors,
        .transparency = if (palette) |p| paletteTransparency(p) else .none,
    };
}

/// A 256-entry grey ramp, the palette SDL gives grey images.
fn greyPalette(allocator: std.mem.Allocator) std.mem.Allocator.Error![]pixels.Color {
    const colors = try allocator.alloc(pixels.Color, 256);
    for (colors, 0..) |*color, i| {
        const value: u8 = @intCast(i);
        color.* = .{ .r = value, .g = value, .b = value, .a = 255 };
    }
    return colors;
}

/// SDL's palette rule: one fully transparent entry is a color key; partial
/// alpha or a second transparent entry selects blending instead.
fn paletteTransparency(colors: []const pixels.Color) Transparency {
    var has_colorkey = false;
    var colorkey_index: u8 = 0;
    var has_alpha = false;
    for (colors, 0..) |color, i| {
        if (color.a != 255) {
            if (color.a == 0 and !has_colorkey) {
                has_colorkey = true;
                colorkey_index = @intCast(i);
            } else {
                has_alpha = true;
            }
        }
    }
    if (has_alpha) return .blend;
    if (has_colorkey) return .{ .color_key = colorkey_index };
    return .none;
}

/// Applies the requested post-processing in a fixed order: orientation, crop,
/// resize, background, output format, premultiply, flip. Each step is skipped
/// entirely when it is not requested, so the default path adds nothing.
fn finish(input: Image, info: Info, decode_options: Options) Error!Image {
    var result = input;
    errdefer result.deinit();
    result.info = info;
    if (!decode_options.pixel.apply_orientation) return result;

    if (info.exif) |exif| {
        if (transform.exifOrientation(exif)) |orientation| {
            if (orientation != .upright) {
                _ = try ensureRgba8(&result);
                try replaceSurface(&result, try transform.orient(result.allocator, result.surface.view, orientation));
            }
        }
    }
    if (decode_options.crop) |region| {
        _ = try ensureRgba8(&result);
        try replaceSurface(&result, try transform.crop(result.allocator, result.surface.view, .{ .x = region.x, .y = region.y, .width = region.width, .height = region.height }));
    }
    if (resample.fitDimensions(result.width(), result.height(), decode_options.resize)) |size| {
        // Only a nearest-neighbour scale can keep palette indices meaningful;
        // every other filter needs real colors.
        const keep_indexed = decode_options.output == .natural and
            std.meta.eql(result.surface.view.format, .{ .indexed = .{ .bits = 8 } }) and
            decode_options.resize.filter == .nearest;
        const scaled = try resample.resizeFormat(
            result.allocator,
            result.surface.view,
            @intCast(size.width),
            @intCast(size.height),
            decode_options.resize.filter,
            if (keep_indexed) .{ .indexed = .{ .bits = 8 } } else .rgba8,
            if (keep_indexed) result.palette else null,
        );
        try replaceSurface(&result, scaled);
        result.transparency = .none;
    }
    if (decode_options.pixel.background) |background| {
        try replaceSurface(&result, try surface.Surface.copy(result.allocator, try ensureRgba8(&result)));
        try transform.compositeBackground(result.surface.view, background);
    }

    const wanted: ?pixels.Format = if (decode_options.pixel.premultiply_alpha or decode_options.pixel.background != null)
        .rgba8
    else switch (decode_options.output) {
        .natural => null,
        .rgb8 => .rgb8,
        .rgba8 => .rgba8,
    };
    if (wanted) |pixel_format| {
        if (!std.meta.eql(result.surface.view.format, pixel_format)) {
            try replaceSurface(&result, try surface.Surface.convert(result.allocator, result.surface.view, pixel_format, null));
        }
    }
    if (decode_options.pixel.premultiply_alpha) try transform.premultiply(try ensureRgba8(&result));
    if (decode_options.pixel.flip_y) try transform.flipRows(try ensureRgba8(&result));
    return result;
}

fn replaceSurface(result: *Image, replacement: surface.Surface) Error!void {
    result.surface.deinit();
    if (result.palette) |colors| {
        if (replacement.view.palette) |borrowed| {
            if (borrowed.ptr == colors.ptr) {
                result.surface = replacement;
                return;
            }
        }
        result.allocator.free(colors);
    }
    result.palette = null;
    result.transparency = .none;
    result.surface = replacement;
}

/// Returns the image's RGBA8 view, converting and storing it if necessary.
fn ensureRgba8(result: *Image) Error!surface.View {
    if (std.meta.eql(result.surface.view.format, .rgba8)) return result.surface.view;
    try replaceSurface(result, try surface.Surface.convert(result.allocator, result.surface.view, .rgba8, null));
    return result.surface.view;
}

fn probed(bytes: []const u8, value: Format) Error!Info {
    return probe_module.probeAs(bytes, value) catch switch (value) {
        .png => error.CorruptPng,
        .jpeg => error.NotJpeg,
        else => error.TruncatedData,
    };
}

fn checkInput(bytes: []const u8, decode_options: Options) Error!void {
    if (bytes.len > decode_options.limits.max_input_bytes) return error.DecodeLimitExceeded;
}

fn rasterLimits(decode_options: Options) raster.Options {
    return .{
        .max_pixels = decode_options.limits.max_pixels,
        .max_output_bytes = decode_options.limits.max_output_bytes,
        .max_width = decode_options.limits.max_width,
        .max_height = decode_options.limits.max_height,
    };
}

fn checkSize(width: u32, height: u32, decode_options: Options) Error!void {
    if (width == 0 or height == 0) return error.InvalidSize;
    if (width > decode_options.limits.max_width or height > decode_options.limits.max_height) return error.DecodeLimitExceeded;
    const count = std.math.mul(usize, width, height) catch return error.DecodeLimitExceeded;
    // Reserve the worst-case eight-bit RGBA representation including any
    // transformation the caller asked for, so a hostile header cannot lead to a
    // larger allocation later.
    if (count > decode_options.limits.max_pixels or count > decode_options.limits.max_output_bytes / 4) return error.DecodeLimitExceeded;
}

test "detection, unknown formats and limits" {
    try std.testing.expectEqual(Format.webp, detect("RIFF\x00\x00\x00\x00WEBP"));
    try std.testing.expectEqual(@as(?Format, null), detect(""));
    try std.testing.expectError(
        error.DecodeLimitExceeded,
        decode(std.testing.allocator, "too long", .{ .limits = .{ .max_input_bytes = 1 } }),
    );
    try std.testing.expectError(error.UnknownFormat, decode(std.testing.allocator, "not an image", .{}));
    try std.testing.expectError(error.UnsupportedFormat, decodeAs(std.testing.allocator, "\xff\x0a", .jxl, .{}));
}

test "PNG and JPEG limits are enforced before pixel allocation" {
    const allocator = std.testing.allocator;
    const bytes = @embedFile("../testdata/jpeg/baseline.jpg");
    try std.testing.expectError(error.DecodeLimitExceeded, load_jpeg(allocator, bytes, .{ .limits = .{ .max_width = 1 } }));
    var image = try load_jpeg(allocator, bytes, .{ .output = .rgba8, .pixel = .{ .flip_y = true, .premultiply_alpha = true } });
    defer image.deinit();
    try std.testing.expect(std.meta.eql(image.surface.view.format, pixels.Format.rgba8));
    try std.testing.expect(image.info != null);
}

test "integrated image postprocessing retains ownership and rejects unsupported animation" {
    const a = std.testing.allocator;
    var input = try surface.Surface.init(a, 3, 2, .rgba8, null);
    defer input.deinit();
    try input.view.fill(.{ .r = 80, .g = 100, .b = 120, .a = 128 }, null);
    const encoded = try encode_png(a, input.view, .{});
    defer a.free(encoded);
    var image = try load_png(a, encoded, .{ .resize = .{ .width = 6, .filter = .bilinear }, .pixel = .{ .premultiply_alpha = true } });
    defer image.deinit();
    try std.testing.expectEqual(@as(u31, 6), image.width());
    try std.testing.expectEqual(@as(u31, 4), image.height());
    try std.testing.expectEqual(@as(u8, 40), (try image.surface.view.read(5, 3)).r);
    var still = try load_apng_animation(a, encoded, .{});
    defer still.deinit();
    try std.testing.expectEqual(@as(usize, 1), still.frames.len);
    try std.testing.expectError(error.UnsupportedAnimation, load_webp_animation(a, @embedFile("testdata/webp-animated.webp"), .{}));
}
