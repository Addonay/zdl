//! Dependency-free QOI, TGA, Netpbm and first-frame GIF codecs.
//! All decoders return owned, tightly packed, straight-alpha RGBA8 samples.
//! Color samples are preserved/scaled, with no implicit gamma conversion.
//! References: qoiformat.org specification v1; Netpbm PBM/PGM/PPM manuals;
//! Truevision TGA 2.0; W3C GIF89a specification and its LZW appendix.
const std = @import("std");
const surface = @import("../video/surface.zig");

pub const Error = error{ InvalidImage, UnsupportedImage, TruncatedImage, ImageTooLarge, OutOfMemory };
/// Limits are checked before allocating pixel storage; zero permits no pixels.
pub const Options = struct {
    max_pixels: usize = 64 * 1024 * 1024,
    max_output_bytes: usize = 256 * 1024 * 1024,
    max_width: u31 = 32768,
    max_height: u31 = 32768,
};
/// Caller owns `data` and releases it with `deinit`.
pub const Image = struct {
    allocator: std.mem.Allocator,
    width: u31,
    height: u31,
    data: []u8,
    pub fn deinit(self: *Image) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }
};
const Pixel = [4]u8;
/// Allocates an uninitialized RGBA8 image after checking dimensions and limits.
pub fn allocate(a: std.mem.Allocator, w: usize, h: usize, options: Options) Error!Image {
    if (w == 0 or h == 0 or w > std.math.maxInt(u31) or h > std.math.maxInt(u31)) return error.InvalidImage;
    if (w > options.max_width or h > options.max_height) return error.ImageTooLarge;
    const count = std.math.mul(usize, w, h) catch return error.ImageTooLarge;
    const size = std.math.mul(usize, count, 4) catch return error.ImageTooLarge;
    if (count > options.max_pixels or size > options.max_output_bytes) return error.ImageTooLarge;
    return .{ .allocator = a, .width = @intCast(w), .height = @intCast(h), .data = try a.alloc(u8, size) };
}
const Reader = struct {
    bytes: []const u8,
    pos: usize = 0,
    fn take(self: *Reader, n: usize) Error![]const u8 {
        if (n > self.bytes.len - self.pos) return error.TruncatedImage;
        const out = self.bytes[self.pos..][0..n];
        self.pos += n;
        return out;
    }
    fn byte(self: *Reader) Error!u8 {
        return (try self.take(1))[0];
    }
    fn le16(self: *Reader) Error!u16 {
        return std.mem.readInt(u16, (try self.take(2))[0..2], .little);
    }
};
fn put(out: []u8, i: usize, p: Pixel) void {
    out[i * 4 ..][0..4].* = p;
}
fn hash(p: Pixel) usize {
    return (@as(u16, p[0]) * 3 + @as(u16, p[1]) * 5 + @as(u16, p[2]) * 7 + @as(u16, p[3]) * 11) & 63;
}
const qoi_end = [_]u8{ 0, 0, 0, 0, 0, 0, 0, 1 };
/// Decodes QOI RGB/RGBA chunks, including wrapped deltas and indexed runs.
pub fn decode_qoi(a: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    var r: Reader = .{ .bytes = bytes };
    const header = try r.take(14);
    if (!std.mem.eql(u8, header[0..4], "qoif") or (header[12] != 3 and header[12] != 4) or header[13] > 1) return error.InvalidImage;
    var image = try allocate(a, std.mem.readInt(u32, header[4..8], .big), std.mem.readInt(u32, header[8..12], .big), options);
    errdefer image.deinit();
    var index: [64]Pixel = @splat(.{ 0, 0, 0, 0 });
    var p: Pixel = .{ 0, 0, 0, 255 };
    var i: usize = 0;
    const count = image.data.len / 4;
    while (i < count) {
        const tag = try r.byte();
        var run: usize = 1;
        if (tag == 0xfe) {
            @memcpy(p[0..3], try r.take(3));
        } else if (tag == 0xff) {
            p = (try r.take(4))[0..4].*;
        } else switch (tag >> 6) {
            0 => p = index[tag & 63],
            1 => {
                p[0] +%= ((tag >> 4) & 3) -% 2;
                p[1] +%= ((tag >> 2) & 3) -% 2;
                p[2] +%= (tag & 3) -% 2;
            },
            2 => {
                const second = try r.byte();
                const dg = (tag & 63) -% 32;
                p[0] +%= dg +% (second >> 4) -% 8;
                p[1] +%= dg;
                p[2] +%= dg +% (second & 15) -% 8;
            },
            3 => run = @as(usize, tag & 63) + 1,
            else => unreachable,
        }
        if (run > count - i) return error.InvalidImage;
        index[hash(p)] = p;
        for (i..i + run) |j| put(image.data, j, p);
        i += run;
    }
    if (!std.mem.eql(u8, try r.take(8), &qoi_end)) return error.InvalidImage;
    return image;
}
/// Encodes any readable surface into QOI, choosing run/index/diff/luma chunks.
/// Returns allocator-owned bytes. The encoded colorspace is sRGB/linear alpha.
pub fn encode_qoi(a: std.mem.Allocator, view: surface.View) (Error || surface.Error)![]u8 {
    if (view.width == 0 or view.height == 0) return error.InvalidImage;
    const count = std.math.mul(usize, view.width, view.height) catch return error.ImageTooLarge;
    const capacity = std.math.add(usize, std.math.mul(usize, count, 5) catch return error.ImageTooLarge, 22) catch return error.ImageTooLarge;
    var out: std.ArrayList(u8) = .empty;
    defer out.deinit(a);
    try out.ensureTotalCapacity(a, capacity);
    out.appendSliceAssumeCapacity("qoif");
    var dimensions: [8]u8 = undefined;
    std.mem.writeInt(u32, dimensions[0..4], view.width, .big);
    std.mem.writeInt(u32, dimensions[4..8], view.height, .big);
    out.appendSliceAssumeCapacity(&dimensions);
    out.appendSliceAssumeCapacity(&.{ 4, 0 });
    var index: [64]Pixel = @splat(.{ 0, 0, 0, 0 });
    var previous: Pixel = .{ 0, 0, 0, 255 };
    var run: u8 = 0;
    for (0..view.height) |y| for (0..view.width) |x| {
        const color = try view.read(x, y);
        const p: Pixel = .{ color.r, color.g, color.b, color.a };
        if (std.mem.eql(u8, &p, &previous)) {
            run += 1;
            if (run == 62 or y * @as(usize, view.width) + x + 1 == count) {
                out.appendAssumeCapacity(0xc0 | (run - 1));
                run = 0;
            }
            continue;
        }
        if (run != 0) {
            out.appendAssumeCapacity(0xc0 | (run - 1));
            run = 0;
        }
        const slot = hash(p);
        if (std.mem.eql(u8, &p, &index[slot])) {
            out.appendAssumeCapacity(@intCast(slot));
        } else {
            index[slot] = p;
            if (p[3] != previous[3]) {
                out.appendAssumeCapacity(0xff);
                out.appendSliceAssumeCapacity(&p);
            } else {
                const dr: i16 = @as(i8, @bitCast(p[0] -% previous[0]));
                const dg: i16 = @as(i8, @bitCast(p[1] -% previous[1]));
                const db: i16 = @as(i8, @bitCast(p[2] -% previous[2]));
                if (dr >= -2 and dr <= 1 and dg >= -2 and dg <= 1 and db >= -2 and db <= 1) {
                    out.appendAssumeCapacity(0x40 | (@as(u8, @intCast(dr + 2)) << 4) | (@as(u8, @intCast(dg + 2)) << 2) | @as(u8, @intCast(db + 2)));
                } else if (dg >= -32 and dg <= 31 and dr - dg >= -8 and dr - dg <= 7 and db - dg >= -8 and db - dg <= 7) {
                    out.appendAssumeCapacity(0x80 | @as(u8, @intCast(dg + 32)));
                    out.appendAssumeCapacity((@as(u8, @intCast(dr - dg + 8)) << 4) | @as(u8, @intCast(db - dg + 8)));
                } else {
                    out.appendAssumeCapacity(0xfe);
                    out.appendSliceAssumeCapacity(p[0..3]);
                }
            }
        }
        previous = p;
    };
    out.appendSliceAssumeCapacity(&qoi_end);
    return out.toOwnedSlice(a);
}

fn tga_pixel(r: *Reader, depth: u8, grey: bool, alpha: bool) Error!Pixel {
    if (grey) {
        const value = try r.byte();
        return .{ value, value, value, if (depth == 16) try r.byte() else 255 };
    }
    if (depth == 15 or depth == 16) {
        const v = try r.le16();
        const red: u8 = @intCast((v >> 10) & 31);
        const green: u8 = @intCast((v >> 5) & 31);
        const blue: u8 = @intCast(v & 31);
        return .{ (red << 3) | (red >> 2), (green << 3) | (green >> 2), (blue << 3) | (blue >> 2), if (alpha and (v & 0x8000) == 0) 0 else 255 };
    }
    const bgr = try r.take(if (depth == 32) 4 else 3);
    return .{ bgr[2], bgr[1], bgr[0], if (depth == 32 and alpha) bgr[3] else 255 };
}
/// Decodes uncompressed/RLE truecolor, grayscale and palette TGA images.
/// Honors both horizontal and vertical origins; rejects interleaved images.
pub fn decode_tga(a: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    var r: Reader = .{ .bytes = bytes };
    const h = try r.take(18);
    const kind = h[2] & ~@as(u8, 8);
    if ((kind != 1 and kind != 2 and kind != 3) or (h[2] != kind and h[2] != kind + 8) or h[1] > 1 or h[17] & 0xc0 != 0) return error.UnsupportedImage;
    const indexed = kind == 1;
    if (indexed != (h[1] == 1)) return error.InvalidImage;
    const depth = h[16];
    if ((indexed and depth != 8 and depth != 16) or (kind == 2 and depth != 15 and depth != 16 and depth != 24 and depth != 32) or (kind == 3 and depth != 8 and depth != 16)) return error.UnsupportedImage;
    const w = std.mem.readInt(u16, h[12..14], .little);
    const height = std.mem.readInt(u16, h[14..16], .little);
    var image = try allocate(a, w, height, options);
    errdefer image.deinit();
    _ = try r.take(h[0]);
    var palette: [65536]Pixel = undefined;
    const first: usize = std.mem.readInt(u16, h[3..5], .little);
    const length: usize = std.mem.readInt(u16, h[5..7], .little);
    if (indexed) {
        if (length == 0 or length > 65536 - first or (h[7] != 15 and h[7] != 16 and h[7] != 24 and h[7] != 32)) return error.InvalidImage;
        for (first..first + length) |i| palette[i] = try tga_pixel(&r, h[7], false, h[7] == 16 or h[7] == 32);
    }
    const count = image.data.len / 4;
    var i: usize = 0;
    while (i < count) {
        const packet = if (h[2] & 8 != 0) try r.byte() else 0;
        const run: usize = if (h[2] & 8 != 0) @as(usize, packet & 127) + 1 else 1;
        if (run > count - i) return error.InvalidImage;
        var p: Pixel = undefined;
        for (0..run) |j| {
            if (j == 0 or packet & 128 == 0) {
                if (indexed) {
                    const idx: usize = if (depth == 8) try r.byte() else try r.le16();
                    if (idx < first or idx >= first + length) return error.InvalidImage;
                    p = palette[idx];
                } else p = try tga_pixel(&r, depth, kind == 3, h[17] & 15 != 0);
            }
            const x = (i + j) % w;
            const y = (i + j) / w;
            const dx = if (h[17] & 16 == 0) x else w - 1 - x;
            const dy = if (h[17] & 32 != 0) y else height - 1 - y;
            put(image.data, dy * w + dx, p);
        }
        i += run;
    }
    return image;
}
fn skip_space(r: *Reader) void {
    while (r.pos < r.bytes.len) {
        if (std.ascii.isWhitespace(r.bytes[r.pos])) {
            r.pos += 1;
            continue;
        }
        if (r.bytes[r.pos] == '#') {
            while (r.pos < r.bytes.len and r.bytes[r.pos] != '\r' and r.bytes[r.pos] != '\n') r.pos += 1;
            continue;
        }
        break;
    }
}
fn number(r: *Reader) Error!u32 {
    skip_space(r);
    const start = r.pos;
    var value: u32 = 0;
    while (r.pos < r.bytes.len and std.ascii.isDigit(r.bytes[r.pos])) {
        value = std.math.mul(u32, value, 10) catch return error.InvalidImage;
        value = std.math.add(u32, value, r.bytes[r.pos] - '0') catch return error.InvalidImage;
        r.pos += 1;
    }
    if (start == r.pos) return if (r.pos == r.bytes.len) error.TruncatedImage else error.InvalidImage;
    if (r.pos < r.bytes.len and !std.ascii.isWhitespace(r.bytes[r.pos]) and r.bytes[r.pos] != '#') return error.InvalidImage;
    return value;
}
fn scale(value: u32, max: u32) Error!u8 {
    if (value > max) return error.InvalidImage;
    return @intCast((value * 255 + max / 2) / max);
}
/// Decodes P1-P6 Netpbm, including big-endian 16-bit samples and comments.
/// Returns only the first image of a concatenated Netpbm stream.
pub fn decode_pnm(a: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    var r: Reader = .{ .bytes = bytes };
    const magic = try r.take(2);
    if (magic[0] != 'P' or magic[1] < '1' or magic[1] > '6') return error.InvalidImage;
    const kind = magic[1] - '0';
    if (r.pos == bytes.len or !std.ascii.isWhitespace(bytes[r.pos])) return error.InvalidImage;
    const w = try number(&r);
    const h = try number(&r);
    const max = if (kind == 1 or kind == 4) 1 else try number(&r);
    if (max == 0 or max > 65535) return error.InvalidImage;
    if (kind >= 4) {
        // The delimiter is exactly one byte: binary data may itself be whitespace.
        if (r.pos == bytes.len or !std.ascii.isWhitespace(bytes[r.pos])) return error.InvalidImage;
        r.pos += 1;
    }
    var image = try allocate(a, w, h, options);
    errdefer image.deinit();
    const channels: usize = if (kind == 3 or kind == 6) 3 else 1;
    for (0..h) |y| {
        var bits: u8 = 0;
        for (0..w) |x| {
            var p: Pixel = .{ 0, 0, 0, 255 };
            for (0..channels) |c| {
                const value: u32 = if (kind == 1) blk: {
                    skip_space(&r);
                    const digit = try r.byte();
                    if (digit != '0' and digit != '1') return error.InvalidImage;
                    break :blk digit - '0';
                } else if (kind <= 3) try number(&r) else if (kind == 4) blk: {
                    if (x % 8 == 0) bits = try r.byte();
                    break :blk (bits >> @as(u3, @intCast(7 - x % 8))) & 1;
                } else if (max < 256) try r.byte() else std.mem.readInt(u16, (try r.take(2))[0..2], .big);
                p[c] = if (kind == 1 or kind == 4) 255 - try scale(value, 1) else try scale(value, max);
            }
            if (channels == 1) {
                p[1] = p[0];
                p[2] = p[0];
            }
            put(image.data, y * @as(usize, w) + x, p);
        }
    }
    return image;
}

fn gif_palette(r: *Reader, palette: *[256]Pixel, flags: u8) Error!usize {
    const count: usize = @as(usize, 2) << @as(u3, @intCast(flags & 7));
    for (0..count) |i| {
        const rgb = try r.take(3);
        palette[i] = .{ rgb[0], rgb[1], rgb[2], 255 };
    }
    return count;
}
fn gif_skip_blocks(r: *Reader) Error!void {
    while (true) {
        const count = try r.byte();
        if (count == 0) return;
        _ = try r.take(count);
    }
}
const GifBits = struct {
    reader: *Reader,
    remaining: usize = 0,
    bits: u32 = 0,
    count: u6 = 0,
    fn code(self: *GifBits, size: u5) Error!u16 {
        while (self.count < size) {
            if (self.remaining == 0) {
                self.remaining = try self.reader.byte();
                if (self.remaining == 0) return error.InvalidImage;
            }
            self.bits |= @as(u32, try self.reader.byte()) << @as(u5, @intCast(self.count));
            self.remaining -= 1;
            self.count += 8;
        }
        const result: u16 = @intCast(self.bits & ((@as(u32, 1) << size) - 1));
        self.bits >>= size;
        self.count -= size;
        return result;
    }
};
/// Decodes the first GIF87a/GIF89a image into its logical-screen canvas.
/// Supports local/global tables, interlacing, offsets, transparency and LZW.
/// Later animation frames, timing and disposal are intentionally not returned.
pub fn decode_gif(a: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    var r: Reader = .{ .bytes = bytes };
    const signature = try r.take(6);
    if (!std.mem.eql(u8, signature, "GIF87a") and !std.mem.eql(u8, signature, "GIF89a")) return error.InvalidImage;
    const width = try r.le16();
    const height = try r.le16();
    const flags = try r.byte();
    const bg = try r.byte();
    _ = try r.byte(); // Pixel aspect ratio is metadata, not a sample transform.
    var image = try allocate(a, width, height, options);
    errdefer image.deinit();
    var global: [256]Pixel = undefined;
    const global_count = if (flags & 128 != 0) try gif_palette(&r, &global, flags) else 0;
    var transparent: ?u8 = null;
    while (true) {
        switch (try r.byte()) {
            0x21 => {
                const label = try r.byte();
                if (label == 0xf9) {
                    if (try r.byte() != 4) return error.InvalidImage;
                    const control = try r.take(4);
                    if (try r.byte() != 0) return error.InvalidImage;
                    transparent = if (control[0] & 1 != 0) control[3] else null;
                } else {
                    try gif_skip_blocks(&r);
                    // A Graphic Control Extension applies to one graphic. A
                    // plain-text graphic consumes it even though we skip text.
                    if (label == 0x01) transparent = null;
                }
            },
            0x2c => break,
            0x3b => return error.InvalidImage,
            else => return error.InvalidImage,
        }
    }
    const left = try r.le16();
    const top = try r.le16();
    const frame_w = try r.le16();
    const frame_h = try r.le16();
    const frame_packed = try r.byte();
    if (frame_w == 0 or frame_h == 0 or @as(u32, left) + frame_w > width or @as(u32, top) + frame_h > height) return error.InvalidImage;
    var local: [256]Pixel = undefined;
    const local_count = if (frame_packed & 128 != 0) try gif_palette(&r, &local, frame_packed) else 0;
    const palette = if (local_count != 0) &local else &global;
    const colors = if (local_count != 0) local_count else global_count;
    if (colors == 0) return error.InvalidImage;
    const background: Pixel = if (global_count > bg and transparent != bg) global[bg] else .{ 0, 0, 0, 0 };
    for (0..image.data.len / 4) |i| put(image.data, i, background);
    const minimum = try r.byte();
    if (minimum < 2 or minimum > 8) return error.InvalidImage;
    const clear: u16 = @as(u16, 1) << @as(u4, @intCast(minimum));
    const end = clear + 1;
    var next: u16 = clear + 2;
    var size: u5 = @intCast(minimum + 1);
    var prefix: [4096]u16 = undefined;
    var suffix: [4096]u8 = undefined;
    var stack: [4096]u8 = undefined;
    var previous: ?u16 = null;
    var first: u8 = 0;
    var bits: GifBits = .{ .reader = &r };
    var written: usize = 0;
    var row: usize = 0;
    var pass: usize = 0;
    const starts = [_]usize{ 0, 4, 2, 1 };
    const steps = [_]usize{ 8, 8, 4, 2 };
    const count = @as(usize, frame_w) * frame_h;
    while (true) {
        const code = try bits.code(size);
        if (code == clear) {
            next = clear + 2;
            size = @intCast(minimum + 1);
            previous = null;
            continue;
        }
        if (code == end) {
            if (written != count) return error.InvalidImage;
            _ = try r.take(bits.remaining);
            try gif_skip_blocks(&r);
            return image;
        }
        if (code > next or (code == next and previous == null)) return error.InvalidImage;
        var current = code;
        var length: usize = 0;
        if (code == next) {
            stack[0] = first;
            length = 1;
            current = previous.?;
        }
        while (current >= clear) {
            if (current >= next or current < clear + 2 or length == stack.len) return error.InvalidImage;
            stack[length] = suffix[current];
            length += 1;
            current = prefix[current];
        }
        first = @intCast(current);
        if (length == stack.len) return error.InvalidImage;
        stack[length] = first;
        length += 1;
        if (length > count - written) return error.InvalidImage;
        var j = length;
        while (j != 0) {
            j -= 1;
            const idx = stack[j];
            if (idx >= colors) return error.InvalidImage;
            const x = written % frame_w;
            if (transparent != idx) put(image.data, (@as(usize, top) + row) * width + left + x, palette[idx]);
            written += 1;
            if (x + 1 == frame_w) {
                if (frame_packed & 64 == 0) row += 1 else {
                    row += steps[pass];
                    while (row >= frame_h and pass < 3) {
                        pass += 1;
                        row = starts[pass];
                    }
                }
            }
        }
        if (previous) |old| {
            if (next < 4096) {
                prefix[next] = old;
                suffix[next] = first;
                next += 1;
                if (next == (@as(u16, 1) << @as(u4, @intCast(size))) and size < 12) size += 1;
            }
        }
        previous = code;
    }
}

test "QOI roundtrip covers wrapped deltas, alpha, index and long runs" {
    const a = std.testing.allocator;
    var data: [300 * 4]u8 = undefined;
    for (0..300) |i| {
        const p: Pixel = switch (i % 7) {
            0 => .{ 255, 0, 255, 255 },
            1 => .{ 0, 1, 0, 255 },
            2 => .{ 20, 25, 24, 255 },
            3 => .{ 30, 30, 30, 90 },
            else => .{ 0, 0, 0, 255 },
        };
        put(&data, i, p);
    }
    @memset(data[120 * 4 ..], 0);
    const view = try surface.View.init(&data, 30, 10, 120, .rgba8, null);
    const encoded = try encode_qoi(a, view);
    defer a.free(encoded);
    var decoded = try decode_qoi(a, encoded, .{});
    defer decoded.deinit();
    try std.testing.expectEqualSlices(u8, &data, decoded.data);
    for (0..encoded.len) |n| {
        const result = decode_qoi(a, encoded[0..n], .{});
        if (result) |owned| {
            var unexpected = owned;
            unexpected.deinit();
            return error.TestUnexpectedResult;
        } else |_| {}
    }
    try std.testing.expectError(error.ImageTooLarge, decode_qoi(a, encoded, .{ .max_pixels = 299 }));
}

test "TGA RLE horizontal and vertical origins and palette offsets" {
    const a = std.testing.allocator;
    // Bottom-right origin: red is bottom-right, green bottom-left.
    const bytes = [_]u8{ 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 24, 16, 1, 0, 0, 255, 0, 255, 0 };
    var image = try decode_tga(a, &bytes, .{});
    defer image.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 0, 255, 0, 255, 255, 0, 0, 255 }, image.data);
    const pal = [_]u8{ 0, 1, 1, 5, 0, 1, 0, 24, 0, 0, 0, 0, 1, 0, 1, 0, 8, 32, 4, 3, 2, 5 };
    var indexed = try decode_tga(a, &pal, .{});
    defer indexed.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 2, 3, 4, 255 }, indexed.data);
    var corrupt = bytes;
    corrupt[18] = 0xff;
    try std.testing.expectError(error.InvalidImage, decode_tga(a, &corrupt, .{}));
}

test "Netpbm binary whitespace sample, bitmap padding and 16bit scaling" {
    const a = std.testing.allocator;
    var p6 = try decode_pnm(a, "P6\n# dimensions\n1 1\n255\n\x20\x0a\x23", .{});
    defer p6.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 32, 10, 35, 255 }, p6.data);
    var p5 = try decode_pnm(a, "P5 1 1 65535\n\x80\x00", .{});
    defer p5.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 128, 128, 128, 255 }, p5.data);
    var p4 = try decode_pnm(a, "P4 1 2\n\x80\x00", .{});
    defer p4.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 0, 0, 0, 255, 255, 255, 255, 255 }, p4.data);
    var p3 = try decode_pnm(a, "P3 1 1 10 # RGB\n10 5 0", .{});
    defer p3.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 255, 128, 0, 255 }, p3.data);
    try std.testing.expectError(error.InvalidImage, decode_pnm(a, "P2 1 1 3 4", .{}));
}

test "GIF transparent single pixel and offset canvas" {
    const a = std.testing.allocator;
    const bytes = "GIF89a\x02\x00\x02\x00\x80\x00\x00\xff\x00\x00\x00\xff\x00" ++
        "\x21\xf9\x04\x01\x00\x00\x00\x00" ++
        "\x2c\x01\x00\x01\x00\x01\x00\x01\x00\x00\x02\x02\x4c\x01\x00\x3b";
    var image = try decode_gif(a, bytes, .{});
    defer image.deinit();
    try std.testing.expectEqualSlices(u8, &.{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 255 }, image.data);
    // A valid first frame does not require subsequent animation data/trailer.
    for (0..bytes.len - 1) |n| {
        if (decode_gif(a, bytes[0..n], .{})) |owned| {
            var unexpected = owned;
            unexpected.deinit();
            return error.TestUnexpectedResult;
        } else |_| {}
    }
}

test "GIF independent interlaced corpus crosses all LZW code widths and resets" {
    // Deterministic Pillow-generated random indexed image. Expected sample hash
    // is independently decoded with Pillow 12.3.0, rather than our own encoder.
    var image = try decode_gif(std.testing.allocator, @embedFile("fixtures/raster_palette.gif"), .{});
    defer image.deinit();
    try std.testing.expectEqual(@as(u31, 127), image.width);
    try std.testing.expectEqual(@as(u31, 91), image.height);
    var actual: [32]u8 = undefined;
    std.crypto.hash.sha2.Sha256.hash(image.data, &actual, .{});
    const expected = [_]u8{ 0x95, 0xc3, 0x17, 0x30, 0x7e, 0xea, 0xb6, 0xf1, 0xc8, 0xa9, 0x3a, 0x54, 0x91, 0xe9, 0x1c, 0xe9, 0x89, 0x53, 0xbd, 0x2e, 0x6a, 0x37, 0xc9, 0x4e, 0x8f, 0x24, 0x1e, 0xf5, 0x6c, 0x3f, 0xc2, 0xc4 };
    try std.testing.expectEqualSlices(u8, &expected, &actual);
}

fn allocation_exercise(a: std.mem.Allocator) !void {
    var data = [_]u8{ 0, 0, 0, 255, 255, 12, 53, 90 };
    const view = try surface.View.init(&data, 2, 1, 8, .rgba8, null);
    const qoi = try encode_qoi(a, view);
    defer a.free(qoi);
    var image = try decode_qoi(a, qoi, .{});
    defer image.deinit();
    var pnm = try decode_pnm(a, "P1 2 1\n01", .{});
    defer pnm.deinit();
    var tga = try decode_tga(a, &.{ 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 24, 32, 0, 0, 255 }, .{});
    defer tga.deinit();
    var gif = try decode_gif(a, @embedFile("fixtures/raster_palette.gif"), .{});
    defer gif.deinit();
}
test "raster allocation failures release every owned buffer" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, allocation_exercise, .{});
}

test "raster deterministic corrupt and truncated inputs never leak or panic" {
    const a = std.testing.allocator;
    const gif = @embedFile("fixtures/raster_palette.gif");
    var random = std.Random.DefaultPrng.init(19);
    var buffer: [1024]u8 = undefined;
    for (0..128) |_| {
        random.random().bytes(&buffer);
        // Exercise format-recognized paths as well as random headers.
        @memcpy(buffer[0..6], "GIF89a");
        for ([_]*const fn (std.mem.Allocator, []const u8, Options) Error!Image{ decode_qoi, decode_tga, decode_pnm, decode_gif }) |decode| {
            if (decode(a, &buffer, .{ .max_pixels = 4096, .max_output_bytes = 16384 })) |owned| {
                var image = owned;
                image.deinit();
            } else |_| {}
        }
    }
    var n: usize = 0;
    while (n < gif.len - 1) : (n += 97) {
        try std.testing.expectError(error.TruncatedImage, decode_gif(a, gif[0..n], .{}));
    }
    try std.testing.expectError(error.ImageTooLarge, decode_pnm(a, "P6 2147483647 2147483647 255\n", .{}));
}
