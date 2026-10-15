//! Container facts available without decoding pixels.
//!
//! `probe` reads only headers, so listing a directory of images or rejecting a
//! hostile file's dimensions costs microseconds and no pixel allocation. The
//! returned metadata slices borrow from the caller's bytes and stay valid only
//! as long as they do.
const std = @import("std");
const png = @import("png.zig");
const jpeg = @import("jpeg.zig");
const webp = @import("webp.zig");
const raster = @import("raster.zig");
const bmp = @import("../video/bmp.zig");
const format_mod = @import("format.zig");

pub const Error = error{ UnknownFormat, UnsupportedFormat, TruncatedHeader, InvalidHeader };

/// Color description from ISOBMFF `colr` boxes, JPEG APP14/Adobe markers or
/// AV1 sequence headers, in the CICP numbering used by ISO/IEC 23091-2.
pub const ColorInfo = struct {
    matrix: enum(u8) { identity, bt709, unspecified, fcc, bt470bg, bt601, smpte240, ycgco, bt2020_ncl, bt2020_cl } = .unspecified,
    transfer: enum(u8) { bt709, unspecified, gamma22, gamma28, bt470m, bt470bg, smpte170m, smpte240, linear, log100, iec61966, bt1361, iec61966_2, bt2020_10bit, bt2020_12bit, srgb, bt2020_ncl_14bit } = .bt709,
    primaries: enum(u8) { bt709, unspecified, bt470m, bt470bg, smpte170m, smpte240, film, bt2020, smpte428, smpte431, smpte432 } = .bt709,
    full_range: bool = false,
    /// Human-readable chunk name when the container stored text instead of
    /// numeric fields, for example `"nclx"` or `"rICC"`.
    kind: []const u8 = "nclx",
};

/// What a container says about itself without decoding pixels.
pub const Info = struct {
    format: format_mod.Format,
    width: u32,
    height: u32,
    /// Frames the container holds; one for still images.
    frames: u32 = 1,
    loop_count: u16 = 0,
    animated: bool = false,
    /// Whether the container declares an alpha channel, even if fully opaque.
    has_alpha: bool = false,
    /// Samples per channel as stored, before any eight-bit conversion.
    bit_depth: u8 = 8,
    /// Color channels stored per pixel: 1 grey, 3 RGB, 4 RGBA.
    color_channels: u8 = 3,
    /// True when the pixel data is stored without lossy compression.
    lossless: bool = false,
    /// Interlaced or progressive layout that affects seeking and quality.
    interlaced: bool = false,
    progressive: bool = false,
    color: ?ColorInfo = null,
    /// Raw metadata blocks, still encoded as the container stores them.
    exif: ?[]const u8 = null,
    icc: ?[]const u8 = null,
    xmp: ?[]const u8 = null,
    /// Codec-specific text, for example the PNG or JPEG comment chunk.
    comment: ?[]const u8 = null,
};

/// Reads header metadata. Costs no pixel allocation; unknown magic is
/// `error.UnknownFormat` and a recognized but unimplemented format is
/// `error.UnsupportedFormat`.
pub fn probe(bytes: []const u8) Error!Info {
    return probeAs(bytes, format_mod.detect(bytes) orelse return error.UnknownFormat);
}

/// Probes with an explicit format, needed for magic-less containers such as TGA.
pub fn probeAs(bytes: []const u8, format: format_mod.Format) Error!Info {
    return switch (format) {
        .png => probePng(bytes),
        .jpeg => probeJpeg(bytes),
        .webp => probeWebp(bytes),
        .bmp => probeBmp(bytes),
        .gif => probeGif(bytes),
        .pnm => probePnm(bytes),
        .qoi => probeQoi(bytes),
        .tga => probeTga(bytes),
        .ico,
        .pcx,
        .xpm,
        .psd,
        .dds,
        .tiff,
        .hdr,
        .exr,
        .ktx2,
        .avif,
        .avif_sequence,
        .heif,
        .jxl,
        .svg,
        => error.UnsupportedFormat,
    };
}

fn probePng(bytes: []const u8) Error!Info {
    if (bytes.len < 8 + 25) return error.TruncatedHeader;
    const chunk_type = bytes[12..16];
    if (!std.mem.eql(u8, chunk_type, "IHDR")) return error.InvalidHeader;
    const depth = bytes[24];
    const color = bytes[25];
    const interlaced = bytes[28] == 1;
    var info: Info = .{
        .format = .png,
        .width = std.mem.readInt(u32, bytes[16..20], .big),
        .height = std.mem.readInt(u32, bytes[20..24], .big),
        .bit_depth = depth,
        .interlaced = interlaced,
        .lossless = true,
    };
    info.color_channels = switch (color) {
        0 => 1,
        2 => 3,
        3 => 1,
        4 => 2,
        6 => 4,
        else => return error.InvalidHeader,
    };
    info.has_alpha = color == 4 or color == 6;
    // acTL precedes IDAT for animated PNG; fdAT holds the extra frames.
    var i: usize = 8;
    while (i + 12 <= bytes.len) {
        const size = std.mem.readInt(u32, bytes[i..][0..4], .big);
        const start = i + 8;
        if (size > bytes.len - start - 4) return error.TruncatedHeader;
        const box_type = bytes[i + 4 ..][0..4];
        i += 12 + @as(usize, size);
        const data = bytes[start..][0..size];
        if (std.mem.eql(u8, box_type, "acTL")) {
            if (size < 8) return error.InvalidHeader;
            info.animated = true;
            info.frames = std.mem.readInt(u32, data[0..4], .big);
            info.loop_count = @intCast(@min(std.math.maxInt(u16), std.mem.readInt(u32, data[4..8], .big)));
        } else if (std.mem.eql(u8, box_type, "iCCP")) {
            info.icc = compressedProfile(data);
        } else if (std.mem.eql(u8, box_type, "eXIf")) {
            info.exif = data;
        } else if (std.mem.eql(u8, box_type, "iTXt") and size > 23 and std.mem.eql(u8, data[11..15], "XML:com.adobe.xmp")) {
            info.xmp = null; // XMP is a text chunk; the raw bytes are not UTF-8 clean to expose.
        } else if (std.mem.eql(u8, box_type, "tEXt") or std.mem.eql(u8, box_type, "zTXt")) {
            const text = textChunkValue(data) orelse continue;
            if (std.mem.startsWith(u8, text, "XML:com.adobe.xmp")) info.xmp = text else info.comment = text;
        } else if (std.mem.eql(u8, box_type, "IDAT")) {
            break; // Pixel data starts here; metadata chunks precede it.
        }
    }
    return info;
}

/// An iCCP chunk is `name\0 method compressed-profile`; the profile itself is
/// zlib compressed, so the compressed bytes are what a caller gets unless it
/// wants to inflate them.
fn compressedProfile(data: []const u8) ?[]const u8 {
    var i: usize = 0;
    while (i < data.len and data[i] != 0) : (i += 1) {}
    if (i + 2 >= data.len) return null;
    return data[i + 2 ..];
}

fn textChunkValue(data: []const u8) ?[]const u8 {
    var i: usize = 0;
    while (i < data.len and data[i] != 0) : (i += 1) {}
    if (i >= data.len) return null;
    const rest = data[i + 1 ..];
    if (rest.len == 0) return null;
    // zTXt carries a compression method byte and a zlib stream.
    return if (rest[0] == 0) rest[1..] else rest;
}

/// Start-of-frame markers: baseline, extended, progressive, lossless and the
/// arithmetic-coded variants. `jpeg.zig` decodes only the first three.
fn isFrameHeader(marker: u8) bool {
    return switch (marker) {
        0xc0, 0xc1, 0xc2, 0xc3, 0xc5, 0xc6, 0xc7, 0xc9, 0xca, 0xcb, 0xcd, 0xce, 0xcf => true,
        else => false,
    };
}

fn probeJpeg(bytes: []const u8) Error!Info {
    if (bytes.len < 4 or !jpeg.is_jpeg(bytes)) return error.InvalidHeader;
    var info: Info = .{ .format = .jpeg, .width = 0, .height = 0 };
    var i: usize = 2;
    var have_frame = false;
    while (i < bytes.len) {
        if (bytes[i] != 0xff) return error.InvalidHeader;
        while (i < bytes.len and bytes[i] == 0xff) : (i += 1) {}
        if (i == bytes.len) break;
        const marker = bytes[i];
        i += 1;
        if (marker == 0xd9 or marker == 0xda) break;
        if (marker == 1 or (marker >= 0xd0 and marker <= 0xd8)) continue;
        if (bytes.len - i < 2) return error.TruncatedHeader;
        const size = std.mem.readInt(u16, bytes[i..][0..2], .big);
        if (size < 2 or size > bytes.len - i) return error.TruncatedHeader;
        const segment = bytes[i + 2 ..][0 .. size - 2];
        if (isFrameHeader(marker)) {
            if (segment.len < 6) return error.InvalidHeader;
            info.bit_depth = segment[0];
            info.height = std.mem.readInt(u16, segment[1..3], .big);
            info.width = std.mem.readInt(u16, segment[3..5], .big);
            info.color_channels = segment[5];
            info.progressive = marker == 0xc2 or marker == 0xc6 or marker == 0xca;
            have_frame = true;
        } else switch (marker) {
            // APP1 carries either "Exif\x00\x00" plus a TIFF block, or an XMP
            // packet introduced by the Adobe namespace URI.
            0xe1 => {
                if (segment.len > 6 and std.mem.eql(u8, segment[0..6], "Exif\x00\x00")) {
                    info.exif = segment[6..];
                } else if (std.mem.startsWith(u8, segment, "http://ns.adobe.com/xap/1.0/\x00")) {
                    info.xmp = segment[29..];
                }
            },
            // APP2 "ICC_PROFILE\x00" followed by a sequence byte and chunk count.
            0xe2 => if (segment.len > 14 and std.mem.eql(u8, segment[0..12], "ICC_PROFILE\x00")) {
                info.icc = segment[14..];
            },
            // COM is a comment segment.
            0xfe => info.comment = segment,
            else => {},
        }
        i += size;
    }
    if (!have_frame) return error.TruncatedHeader;
    return info;
}

fn probeWebp(bytes: []const u8) Error!Info {
    const parsed = webp.info(bytes) catch return error.TruncatedHeader;
    return .{
        .format = .webp,
        .width = parsed.width,
        .height = parsed.height,
        .frames = parsed.frame_count,
        .loop_count = parsed.loop_count,
        .animated = parsed.animated,
        .has_alpha = parsed.has_alpha,
        .lossless = parsed.lossless,
    };
}

fn probeBmp(bytes: []const u8) Error!Info {
    if (!bmp.is_bmp(bytes)) return error.InvalidHeader;
    if (bytes.len < 26) return error.TruncatedHeader;
    const dib = std.mem.readInt(u32, bytes[14..18], .little);
    if (dib == 12) {
        return .{
            .format = .bmp,
            .width = std.mem.readInt(u16, bytes[18..20], .little),
            .height = std.mem.readInt(u16, bytes[20..22], .little),
            .color_channels = 3,
        };
    }
    if (dib < 40 or bytes.len < 30) return error.InvalidHeader;
    const w = std.mem.readInt(i32, bytes[18..22], .little);
    const h = std.mem.readInt(i32, bytes[22..26], .little);
    if (w <= 0 or h == std.math.minInt(i32)) return error.InvalidHeader;
    const bpp = std.mem.readInt(u16, bytes[28..30], .little);
    const compression = std.mem.readInt(u32, bytes[30..34], .little);
    return .{
        .format = .bmp,
        .width = @intCast(w),
        .height = @intCast(@abs(h)),
        .bit_depth = if (bpp >= 24) 8 else @intCast(bpp),
        .color_channels = if (bpp <= 8) 1 else 3,
        // 32-bit BI_RGB and BI_BITFIELDS with an alpha mask both carry alpha.
        .has_alpha = bpp == 32 or compression == 6,
        .lossless = true,
    };
}

fn probeGif(bytes: []const u8) Error!Info {
    if (bytes.len < 13) return error.TruncatedHeader;
    if (!std.mem.eql(u8, bytes[0..6], "GIF87a") and !std.mem.eql(u8, bytes[0..6], "GIF89a")) return error.InvalidHeader;
    var info: Info = .{ .format = .gif, .width = std.mem.readInt(u16, bytes[6..8], .little), .height = std.mem.readInt(u16, bytes[8..10], .little), .lossless = true };
    var i: usize = 13;
    if (bytes[10] & 0x80 != 0) i += @as(usize, 3) << @as(u6, @intCast((bytes[10] & 7) + 1));
    if (i > bytes.len) return error.TruncatedHeader;
    var frames: u32 = 0;
    while (i < bytes.len) {
        const tag = bytes[i];
        i += 1;
        switch (tag) {
            0x21 => {
                if (i >= bytes.len) return error.TruncatedHeader;
                const label = bytes[i];
                i += 1;
                if (label == 0xf9) {
                    if (bytes.len - i < 6 or bytes[i] != 4 or bytes[i + 5] != 0) return error.InvalidHeader;
                    info.has_alpha = info.has_alpha or (bytes[i + 1] & 1 != 0);
                }
                try skipGifBlocks(bytes, &i);
            },
            0x2c => {
                if (bytes.len - i < 9) return error.TruncatedHeader;
                const flags = bytes[i + 8];
                i += 9;
                info.interlaced = info.interlaced or flags & 0x40 != 0;
                if (flags & 0x80 != 0) i += @as(usize, 3) << @as(u6, @intCast((flags & 7) + 1));
                if (i >= bytes.len) return error.TruncatedHeader;
                i += 1; // LZW minimum code size.
                try skipGifBlocks(bytes, &i);
                frames += 1;
            },
            0x3b => {
                if (frames == 0) return error.InvalidHeader;
                info.frames = frames;
                info.animated = frames > 1;
                return info;
            },
            else => return error.InvalidHeader,
        }
    }
    return error.TruncatedHeader;
}

fn skipGifBlocks(bytes: []const u8, offset: *usize) Error!void {
    while (offset.* < bytes.len) {
        const count: usize = bytes[offset.*];
        offset.* += 1;
        if (count == 0) return;
        if (count > bytes.len - offset.*) return error.TruncatedHeader;
        offset.* += count;
    }
    return error.TruncatedHeader;
}

fn probePnm(bytes: []const u8) Error!Info {
    var tokens: PnmTokens = .{ .bytes = bytes };
    const magic = tokens.next() orelse return error.InvalidHeader;
    if (magic.len != 2 or magic[0] != 'P') return error.InvalidHeader;
    const kind = magic[1] - '0';
    if (kind < 1 or kind > 6) return error.InvalidHeader;
    const width = std.fmt.parseInt(u32, tokens.next() orelse return error.InvalidHeader, 10) catch return error.InvalidHeader;
    const height = std.fmt.parseInt(u32, tokens.next() orelse return error.InvalidHeader, 10) catch return error.InvalidHeader;
    // PBM is one bit per sample; every other kind states its maximum value.
    const depth: u8 = if (kind == 1 or kind == 4) 1 else blk: {
        const text = tokens.next() orelse return error.InvalidHeader;
        const value = std.fmt.parseInt(u32, text, 10) catch return error.InvalidHeader;
        break :blk std.math.log2_int(u32, @max(1, value)) + 1;
    };
    return .{
        .format = .pnm,
        .width = width,
        .height = height,
        .bit_depth = depth,
        .color_channels = if (kind == 3 or kind == 6) 3 else 1,
        .lossless = true,
    };
}

/// Whitespace-separated Netpbm header tokens, where `#` starts a comment that
/// runs to the end of the line.
const PnmTokens = struct {
    bytes: []const u8,
    pos: usize = 0,

    fn next(self: *PnmTokens) ?[]const u8 {
        while (self.pos < self.bytes.len) {
            const c = self.bytes[self.pos];
            if (c == '#') {
                while (self.pos < self.bytes.len and self.bytes[self.pos] != '\n') self.pos += 1;
            } else if (std.ascii.isWhitespace(c)) {
                self.pos += 1;
            } else break;
        }
        if (self.pos >= self.bytes.len) return null;
        // A single raster byte may follow the header directly, so a token ends
        // at whitespace but never starts with the byte that begins samples.
        const start = self.pos;
        while (self.pos < self.bytes.len and !std.ascii.isWhitespace(self.bytes[self.pos])) self.pos += 1;
        return self.bytes[start..self.pos];
    }
};

fn probeQoi(bytes: []const u8) Error!Info {
    if (bytes.len < 14) return error.TruncatedHeader;
    return .{
        .format = .qoi,
        .width = std.mem.readInt(u32, bytes[4..8], .big),
        .height = std.mem.readInt(u32, bytes[8..12], .big),
        .color_channels = bytes[12],
        .has_alpha = bytes[12] == 4,
        .lossless = true,
    };
}

fn probeTga(bytes: []const u8) Error!Info {
    if (bytes.len < 18) return error.TruncatedHeader;
    const color_map_type = bytes[1];
    const image_type = bytes[2];
    const depth = bytes[16];
    const descriptor = bytes[17];
    const color_map_start = std.mem.readInt(u16, bytes[3..5], .little);
    const color_map_length = std.mem.readInt(u16, bytes[5..7], .little);
    const color_map_depth = bytes[7];
    const width = std.mem.readInt(u16, bytes[12..14], .little);
    const height = std.mem.readInt(u16, bytes[14..16], .little);
    var palette_bits = depth;
    var channels: u8 = 3;
    if (color_map_type == 1 and color_map_length > 0) {
        palette_bits = color_map_depth;
        channels = switch (color_map_depth) {
            24, 32 => 3,
            16 => 3,
            else => 3,
        };
        _ = color_map_start;
    }
    return .{
        .format = .tga,
        .width = width,
        .height = height,
        .bit_depth = @max(palette_bits, depth),
        .color_channels = channels,
        .has_alpha = (image_type == 3 or image_type == 10) and depth == 32 or color_map_depth == 32,
        .lossless = image_type != 9 and image_type != 10 and image_type != 11,
        // Bit 5 of the descriptor selects a top-down row order.
        .interlaced = descriptor & 0x20 != 0,
    };
}
