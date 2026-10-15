//! Format identification by signature.
//!
//! Detection is allocation-free and never parses a bitstream: it recognizes
//! containers, not codecs. Recognition does not promise that a decoder is
//! registered for the format; `decode` reports `UnsupportedFormat` in that case.
const std = @import("std");
const bmp = @import("../video/bmp.zig");

/// Every container this library knows about. TGA has no reliable signature and
/// must be requested explicitly through `decode_as`.
pub const Format = enum {
    png,
    jpeg,
    gif,
    bmp,
    qoi,
    tga,
    pnm,
    ico,
    pcx,
    xpm,
    psd,
    dds,
    tiff,
    hdr,
    exr,
    ktx2,
    webp,
    avif,
    heif,
    jxl,
    svg,
    avif_sequence,
};

/// Signature-based identification. SVG detection accepts an XML declaration and
/// leading whitespace; parsing that XML is the rasterizer's job.
pub fn detect(bytes: []const u8) ?Format {
    if (std.mem.startsWith(u8, bytes, "\x89PNG\r\n\x1a\n")) return .png;
    if (bytes.len >= 2 and std.mem.eql(u8, bytes[0..2], "\xff\xd8")) return .jpeg;
    if (bmp.is_bmp(bytes)) return .bmp;
    if (std.mem.startsWith(u8, bytes, "\x00\x00\x01\x00")) return .ico;
    if (std.mem.startsWith(u8, bytes, "qoif")) return .qoi;
    if (std.mem.startsWith(u8, bytes, "GIF87a") or std.mem.startsWith(u8, bytes, "GIF89a")) return .gif;
    if (bytes.len >= 3 and bytes[0] == 'P' and bytes[1] >= '1' and bytes[1] <= '6' and std.ascii.isWhitespace(bytes[2])) return .pnm;
    if (bytes.len >= 12 and std.mem.eql(u8, bytes[0..4], "RIFF")) {
        if (std.mem.eql(u8, bytes[8..12], "WEBP")) return .webp;
        if (std.mem.eql(u8, bytes[8..12], "WAVE")) return null;
    }
    if (bytes.len >= 2 and std.mem.eql(u8, bytes[0..2], "BM") and bytes.len >= 14) {
        // PCX is the one format whose two-byte magic collides with BMP; the
        // manufacturer field and the encoding byte tell them apart.
        if (bytes.len > 65 and bytes[0] == 0x0a and bytes[1] == 0x00 and bytes[2] == 0x01) return .pcx;
        return .bmp;
    }
    if (bytes.len >= 4 and std.mem.eql(u8, bytes[0..4], "8BPS")) return .psd;
    if (std.mem.startsWith(u8, bytes, "DDS ")) return .dds;
    if (bytes.len >= 4 and (std.mem.eql(u8, bytes[0..4], "II\x2a\x00") or std.mem.eql(u8, bytes[0..4], "MM\x00\x2a"))) return .tiff;
    if (bytes.len >= 4 and (std.mem.eql(u8, bytes[0..4], "II\x2b\x00") or std.mem.eql(u8, bytes[0..4], "MM\x00\x2b"))) return .tiff;
    if (std.mem.startsWith(u8, bytes, "#?RADIANCE") or std.mem.startsWith(u8, bytes, "#?RGBE")) return .hdr;
    if (std.mem.startsWith(u8, bytes, "\x76\x2f\x31\x01")) return .exr;
    if (std.mem.startsWith(u8, bytes, "\xabKTX 20\xbb\r\n\x1a\n")) return .ktx2;
    if (std.mem.startsWith(u8, bytes, "\xff\x0a") or std.mem.startsWith(u8, bytes, "\x00\x00\x00\x0cJXL \x0d\x0a\x87\x0a")) return .jxl;
    if (branded(bytes)) |found| switch (found) {
        .avif => return .avif,
        .avis => return .avif_sequence,
        .heic, .heix, .heim, .heis, .hevc, .hevx => return .heif,
        .mif1, .msf1 => return .heif,
        // Camera RAW uses the HEIF item layout; the decoder reports which
        // item types it cannot handle rather than guessing here.
        .crx => return .heif,
        else => {},
    };
    if (isXpm(bytes)) return .xpm;
    const prefix = std.mem.trimStart(u8, bytes[0..@min(bytes.len, 4096)], " \t\r\n\xef\xbb\xbf");
    if (std.mem.startsWith(u8, prefix, "<svg") or (std.mem.startsWith(u8, prefix, "<?xml") and std.mem.indexOf(u8, prefix, "<svg") != null)) return .svg;
    return null;
}

/// Major and compatible brands recognized inside an ISOBMFF `ftyp` box.
pub const Brand = enum {
    avif,
    avis,
    heic,
    heix,
    heim,
    heis,
    hevc,
    hevx,
    mif1,
    msf1,
    crx,
    jxlc,
    unknown,
};

/// Reads the `ftyp` box at the start of `bytes`, checking the major brand and
/// the compatible-brand list that follows it.
pub fn branded(bytes: []const u8) ?Brand {
    if (bytes.len < 16 or !std.mem.eql(u8, bytes[4..8], "ftyp")) return null;
    const box_size = std.mem.readInt(u32, bytes[0..4], .big);
    if (box_size < 16 or box_size > bytes.len) return null;
    var fallback = brand(bytes[8..12]);
    if (fallback == .avif or fallback == .avis) return fallback;
    var i: usize = 16;
    while (i + 4 <= box_size) : (i += 4) {
        if (brand(bytes[i..][0..4])) |found| {
            if (found == .avif or found == .avis) return found;
            if (fallback == null) fallback = found;
        }
    }
    return fallback;
}

/// The `brands` field of a `Meta` box, which AVIF uses for per-item brands.
fn brand(bytes: []const u8) ?Brand {
    const table = .{
        .{ "avif", Brand.avif },
        .{ "avis", Brand.avis },
        .{ "heic", Brand.heic },
        .{ "heix", Brand.heix },
        .{ "heim", Brand.heim },
        .{ "heis", Brand.heis },
        .{ "hevc", Brand.hevc },
        .{ "hevx", Brand.hevx },
        .{ "mif1", Brand.mif1 },
        .{ "msf1", Brand.msf1 },
        .{ "crx ", Brand.crx },
        .{ "jxl ", Brand.jxlc },
    };
    inline for (table) |entry| {
        if (std.mem.eql(u8, bytes, entry[0])) return entry[1];
    }
    return null;
}

/// XPM is C source: `/* XPM */` starts it. A magic-number heuristic is all a
/// magic-less text format allows, so callers may still force the format.
pub fn isXpm(bytes: []const u8) bool {
    const trimmed = std.mem.trimStart(u8, bytes, " \t\r\n");
    return std.mem.startsWith(u8, trimmed, "/* XPM */");
}

/// True for containers whose payload is a still image even though the same
/// container may also carry a sequence.
pub fn isStillFormat(format: Format) bool {
    return switch (format) {
        .avif_sequence => false,
        else => true,
    };
}

test "detection recognizes container signatures" {
    try std.testing.expectEqual(Format.png, detect("\x89PNG\r\n\x1a\n"));
    try std.testing.expectEqual(Format.jpeg, detect("\xff\xd8\xff\xe0rest"));
    try std.testing.expectEqual(Format.webp, detect("RIFF\x00\x00\x00\x00WEBP"));
    try std.testing.expectEqual(Format.svg, detect(" <?xml version=\"1.0\"?><svg/>"));
    try std.testing.expectEqual(Format.jxl, detect("\xff\x0a"));
    try std.testing.expectEqual(Format.tiff, detect("II\x2a\x00rest"));
    try std.testing.expectEqual(Format.ktx2, detect("\xabKTX 20\xbb\r\n\x1a\n"));
    try std.testing.expectEqual(@as(?Format, null), detect(""));
}

test "ISOBMFF brands cover the AVIF compatible list" {
    const bytes = "\x00\x00\x00\x18ftypmif1\x00\x00\x00\x00avifmiaf";
    try std.testing.expectEqual(Brand.avif, branded(bytes).?);
    try std.testing.expectEqual(Format.avif, detect(bytes).?);
    const heic = "\x00\x00\x00\x14ftypheic\x00\x00\x00\x00mif1";
    try std.testing.expectEqual(Format.heif, detect(heic).?);
}
