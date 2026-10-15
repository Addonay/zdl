//! Dependency-free WebP decoding: the RIFF container (simple and VP8X extended
//! layouts), VP8L lossless bitstreams, VP8 lossy key frames with ALPH alpha
//! planes, and the first frame of animations composited onto a transparent canvas.
//!
//! Output is owned, tightly packed, straight-alpha RGBA8 (`raster.Image`).
//! Lossy frames use libwebp's fixed-point BT.601 conversion and its "fancy"
//! bilinear chroma upsampling, so results follow `dwebp` rather than a
//! nearest-neighbour reconstruction. ICC, EXIF and XMP chunks are skipped, and
//! no color management is applied. Later animation frames, durations, blending
//! of subsequent frames and disposal are not returned.
//!
//! References: RFC 9649 (WebP image format, including the lossless bitstream),
//! RFC 6386 (VP8 data format and decoding guide) and libwebp's decoder for the
//! behavior that the RFCs leave to implementations (YUV conversion, upsampling,
//! alpha unfiltering, truncated-partition handling).
const std = @import("std");
const raster = @import("raster.zig");
const tables = @import("webp_tables.zig");

pub const Error = raster.Error;
pub const Options = raster.Options;
pub const Image = raster.Image;

/// Container facts available without decoding pixels.
pub const Info = struct {
    /// Canvas size; equal to the frame size for still images.
    width: u31,
    height: u31,
    /// VP8X alpha flag, VP8L alpha hint, or the presence of an ALPH chunk.
    has_alpha: bool,
    /// Whether the first (or only) frame is a VP8L bitstream.
    lossless: bool,
    animated: bool,
    /// Number of ANMF frames; one for still images.
    frame_count: u32,
    /// Animation loop count; zero means infinite and is also reported for stills.
    loop_count: u16,
};

/// True for a RIFF/WEBP header. Does not validate the contained bitstream.
pub fn is_webp(bytes: []const u8) bool {
    return bytes.len >= 12 and std.mem.eql(u8, bytes[0..4], "RIFF") and std.mem.eql(u8, bytes[8..12], "WEBP");
}

/// Parses the container and frame headers without allocating.
pub fn info(bytes: []const u8) Error!Info {
    return (try parse(bytes)).info;
}

/// Decodes a still image, or the first animation frame placed on a transparent
/// canvas. Limits are checked before the output allocation.
pub fn decode(a: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    const parsed = try parse(bytes);
    var image = try raster.allocate(a, parsed.info.width, parsed.info.height, options);
    errdefer image.deinit();
    const frame = parsed.first;
    const stride = @as(usize, parsed.info.width) * 4;
    if (parsed.info.animated) @memset(image.data, 0);
    const offset = @as(usize, frame.y) * stride + @as(usize, frame.x) * 4;
    try decode_frame(a, frame, image.data[offset..], stride);
    return image;
}

// ----------------------------------------------------------------------------
// Container

const Bitstream = struct {
    lossless: bool,
    /// VP8 or VP8L chunk payload.
    data: []const u8,
    /// ALPH payload; only meaningful for lossy frames.
    alpha: ?[]const u8 = null,
};

const Frame = struct {
    x: u32 = 0,
    y: u32 = 0,
    width: u31,
    height: u31,
    bitstream: Bitstream,
};

const Parsed = struct { info: Info, first: Frame };

const Chunk = struct { id: [4]u8, data: []const u8 };

const Chunks = struct {
    bytes: []const u8,
    pos: usize = 0,

    fn next(self: *Chunks) Error!?Chunk {
        if (self.pos >= self.bytes.len) return null;
        if (self.bytes.len - self.pos < 8) return error.TruncatedImage;
        const id = self.bytes[self.pos..][0..4].*;
        const size = std.mem.readInt(u32, self.bytes[self.pos + 4 ..][0..4], .little);
        const start = self.pos + 8;
        if (size > self.bytes.len - start) return error.TruncatedImage;
        // Chunks are padded to even sizes; a missing final pad byte is tolerated.
        self.pos = start + size + (size & 1);
        return .{ .id = id, .data = self.bytes[start..][0..size] };
    }
};

fn le24(bytes: []const u8) u32 {
    return @as(u32, bytes[0]) | @as(u32, bytes[1]) << 8 | @as(u32, bytes[2]) << 16;
}

const Dimensions = struct { width: u31, height: u31, alpha: bool = false };

fn vp8_dimensions(data: []const u8) Error!Dimensions {
    if (data.len < 10) return error.TruncatedImage;
    const tag = le24(data);
    if (tag & 1 != 0) return error.UnsupportedImage; // interframes cannot start a WebP
    if ((tag >> 1) & 7 > 3) return error.InvalidImage;
    if ((tag >> 4) & 1 == 0) return error.InvalidImage; // frame not displayable
    if (!std.mem.eql(u8, data[3..6], "\x9d\x01\x2a")) return error.InvalidImage;
    const w = std.mem.readInt(u16, data[6..8], .little) & 0x3fff;
    const h = std.mem.readInt(u16, data[8..10], .little) & 0x3fff;
    if (w == 0 or h == 0) return error.InvalidImage;
    return .{ .width = w, .height = h };
}

fn vp8l_dimensions(data: []const u8) Error!Dimensions {
    if (data.len < 5) return error.TruncatedImage;
    if (data[0] != 0x2f) return error.InvalidImage;
    const bits = std.mem.readInt(u32, data[1..5], .little);
    if (bits >> 29 != 0) return error.InvalidImage; // version
    return .{
        .width = @intCast((bits & 0x3fff) + 1),
        .height = @intCast(((bits >> 14) & 0x3fff) + 1),
        .alpha = (bits >> 28) & 1 != 0,
    };
}

/// Finds the image bitstream (with optional preceding ALPH) among `chunks`.
fn frame_bitstream(chunks: *Chunks) Error!struct { Bitstream, Dimensions } {
    var alpha: ?[]const u8 = null;
    while (try chunks.next()) |chunk| {
        if (std.mem.eql(u8, &chunk.id, "ALPH")) {
            if (alpha == null) alpha = chunk.data;
        } else if (std.mem.eql(u8, &chunk.id, "VP8 ")) {
            return .{ .{ .lossless = false, .data = chunk.data, .alpha = alpha }, try vp8_dimensions(chunk.data) };
        } else if (std.mem.eql(u8, &chunk.id, "VP8L")) {
            return .{ .{ .lossless = true, .data = chunk.data }, try vp8l_dimensions(chunk.data) };
        }
        // Unknown and metadata chunks are skipped.
    }
    return error.InvalidImage;
}

fn parse(bytes: []const u8) Error!Parsed {
    if (!is_webp(bytes)) return error.InvalidImage;
    const riff_size = std.mem.readInt(u32, bytes[4..8], .little);
    if (riff_size < 12) return error.InvalidImage;
    if (riff_size > bytes.len - 8) return error.TruncatedImage;
    // Bytes after the RIFF payload are ignored, as libwebp does.
    var chunks: Chunks = .{ .bytes = bytes[12 .. 8 + @as(usize, riff_size)] };
    const first = try chunks.next() orelse return error.InvalidImage;
    const simple_lossy = std.mem.eql(u8, &first.id, "VP8 ");
    if (simple_lossy or std.mem.eql(u8, &first.id, "VP8L")) {
        const dims = if (simple_lossy) try vp8_dimensions(first.data) else try vp8l_dimensions(first.data);
        return .{
            .info = .{ .width = dims.width, .height = dims.height, .has_alpha = dims.alpha, .lossless = !simple_lossy, .animated = false, .frame_count = 1, .loop_count = 0 },
            .first = .{ .width = dims.width, .height = dims.height, .bitstream = .{ .lossless = !simple_lossy, .data = first.data } },
        };
    }
    if (!std.mem.eql(u8, &first.id, "VP8X")) return error.InvalidImage;
    if (first.data.len < 10) return error.TruncatedImage;
    const flags = first.data[0];
    const canvas_w = le24(first.data[4..7]) + 1;
    const canvas_h = le24(first.data[7..10]) + 1;
    if (canvas_w > std.math.maxInt(u31) or canvas_h > std.math.maxInt(u31)) return error.ImageTooLarge;
    if (@as(u64, canvas_w) * canvas_h >= 1 << 32) return error.ImageTooLarge;
    var result: Info = .{
        .width = @intCast(canvas_w),
        .height = @intCast(canvas_h),
        .has_alpha = flags & 0x10 != 0,
        .lossless = false,
        .animated = flags & 0x02 != 0,
        .frame_count = 0,
        .loop_count = 0,
    };
    if (!result.animated) {
        const bitstream, const dims = try frame_bitstream(&chunks);
        if (dims.width != canvas_w or dims.height != canvas_h) return error.InvalidImage;
        result.lossless = bitstream.lossless;
        result.frame_count = 1;
        result.has_alpha = result.has_alpha or dims.alpha or bitstream.alpha != null;
        return .{ .info = result, .first = .{ .width = dims.width, .height = dims.height, .bitstream = bitstream } };
    }
    var first_frame: ?Frame = null;
    while (try chunks.next()) |chunk| {
        if (std.mem.eql(u8, &chunk.id, "ANIM")) {
            if (chunk.data.len < 6) return error.TruncatedImage;
            result.loop_count = std.mem.readInt(u16, chunk.data[4..6], .little);
        } else if (std.mem.eql(u8, &chunk.id, "ANMF")) {
            if (chunk.data.len < 16) return error.TruncatedImage;
            result.frame_count += 1;
            if (first_frame != null) continue;
            const x = le24(chunk.data[0..3]) * 2;
            const y = le24(chunk.data[3..6]) * 2;
            const w = le24(chunk.data[6..9]) + 1;
            const h = le24(chunk.data[9..12]) + 1;
            if (x + w > canvas_w or y + h > canvas_h) return error.InvalidImage;
            var inner: Chunks = .{ .bytes = chunk.data[16..] };
            const bitstream, const dims = try frame_bitstream(&inner);
            if (dims.width != w or dims.height != h) return error.InvalidImage;
            result.lossless = bitstream.lossless;
            first_frame = .{ .x = x, .y = y, .width = dims.width, .height = dims.height, .bitstream = bitstream };
        }
    }
    return .{ .info = result, .first = first_frame orelse return error.InvalidImage };
}

/// Decodes one frame into `dst` rows of `stride` bytes (RGBA8).
fn decode_frame(a: std.mem.Allocator, frame: Frame, dst: []u8, stride: usize) Error!void {
    const w: usize = frame.width;
    const h: usize = frame.height;
    if (frame.bitstream.lossless) {
        const argb = try lossless_decode(a, frame.bitstream.data[5..], frame.width, frame.height);
        defer a.free(argb);
        for (0..h) |y| {
            const row = dst[y * stride ..][0 .. w * 4];
            for (argb[y * w ..][0..w], 0..) |p, x| row[x * 4 ..][0..4].* = .{ @truncate(p >> 16), @truncate(p >> 8), @truncate(p), @truncate(p >> 24) };
        }
        return;
    }
    var planes = try lossy_decode(a, frame.bitstream.data, frame.width, frame.height);
    defer planes.deinit(a);
    planes.to_rgba(dst, stride);
    if (frame.bitstream.alpha) |alpha| {
        const plane = try a.alloc(u8, w * h);
        defer a.free(plane);
        try decode_alpha(a, alpha, frame.width, frame.height, plane);
        for (0..h) |y| {
            const row = dst[y * stride ..][0 .. w * 4];
            for (plane[y * w ..][0..w], 0..) |value, x| row[x * 4 + 3] = value;
        }
    }
}

// ----------------------------------------------------------------------------
// VP8L lossless (RFC 9649 section 3)

const BitReader = struct {
    data: []const u8,
    pos: usize = 0,
    /// LSB-first bit buffer; bits above `count` are zero or later stream bits.
    buf: u64 = 0,
    count: u7 = 0,

    /// Called only with fewer than 32 buffered bits.
    fn fill(r: *BitReader) void {
        if (r.data.len - r.pos >= 8) {
            r.buf |= std.mem.readInt(u64, r.data[r.pos..][0..8], .little) << @intCast(r.count);
            const n = (63 - @as(usize, r.count)) / 8;
            r.pos += n;
            r.count += @intCast(n * 8);
        } else while (r.count <= 56 and r.pos < r.data.len) : (r.pos += 1) {
            r.buf |= @as(u64, r.data[r.pos]) << @intCast(r.count);
            r.count += 8;
        }
    }

    fn read(r: *BitReader, n: u5) Error!u32 {
        if (r.count < n) {
            r.fill();
            if (r.count < n) return error.TruncatedImage;
        }
        const value: u32 = @truncate(r.buf & ((@as(u64, 1) << n) - 1));
        r.buf >>= n;
        r.count -= n;
        return value;
    }

    fn consume(r: *BitReader, n: u8) Error!void {
        if (n > r.count) return error.TruncatedImage;
        r.buf >>= @intCast(n);
        r.count -= @intCast(n);
    }

    /// Decodes one prefix-coded symbol from a two-level table.
    fn symbol(r: *BitReader, table: []const HuffmanEntry) Error!u16 {
        if (r.count < 15) r.fill();
        var entry = table[@as(u8, @truncate(r.buf))];
        if (entry.bits > root_bits) {
            try r.consume(root_bits);
            const extra: u4 = @intCast(entry.bits - root_bits);
            entry = table[entry.value + (@as(usize, @truncate(r.buf)) & ((@as(usize, 1) << extra) - 1))];
        }
        try r.consume(entry.bits);
        return entry.value;
    }
};

/// Root entries with `bits > root_bits` link to a second-level table at
/// `value` (relative to the table start). Others decode `value` in `bits` bits.
const HuffmanEntry = struct { bits: u8, value: u16 };
const root_bits = 8;
const max_code_length = 15;
const max_alphabet = 256 + 24 + (1 << 11);

fn next_key(key: u32, len: u4) u32 {
    var step = @as(u32, 1) << (len - 1);
    while (key & step != 0) step >>= 1;
    return if (step != 0) (key & (step - 1)) + step else key;
}

fn replicate(entries: []HuffmanEntry, step: usize, end: usize, entry: HuffmanEntry) void {
    var e = end;
    while (true) {
        e -= step;
        entries[e] = entry;
        if (e == 0) break;
    }
}

fn next_table_bits(count: *const [max_code_length + 1]u16, len_in: usize) u4 {
    var len = len_in;
    var left: i32 = @as(i32, 1) << @intCast(len - root_bits);
    while (len < max_code_length) {
        left -= count[len];
        if (left <= 0) break;
        len += 1;
        left <<= 1;
    }
    return @intCast(len - root_bits);
}

/// Appends a canonical prefix-code table for `lengths` and returns its start.
/// Incomplete and over-subscribed codes are rejected, except a lone symbol,
/// which decodes with zero bits (libwebp `BuildHuffmanTable`).
fn build_table(a: std.mem.Allocator, list: *std.ArrayList(HuffmanEntry), lengths: []const u8) Error!usize {
    var count: [max_code_length + 1]u16 = @splat(0);
    for (lengths) |len| count[len] += 1;
    count[0] = 0;
    var offsets: [max_code_length + 2]u16 = @splat(0);
    for (1..max_code_length + 1) |len| offsets[len + 1] = offsets[len] + count[len];
    const symbols = offsets[max_code_length + 1];
    if (symbols == 0) return error.InvalidImage;
    var sorted: [max_alphabet]u16 = undefined;
    for (lengths, 0..) |len, s| if (len != 0) {
        sorted[offsets[len]] = @intCast(s);
        offsets[len] += 1;
    };
    const start = list.items.len;
    if (symbols == 1) {
        try list.appendNTimes(a, .{ .bits = 0, .value = sorted[0] }, 1 << root_bits);
        return start;
    }
    var open: i32 = 1;
    for (1..max_code_length + 1) |len| {
        open = open * 2 - count[len];
        if (open < 0) return error.InvalidImage;
    }
    if (open != 0) return error.InvalidImage;

    _ = try list.addManyAsSlice(a, 1 << root_bits);
    var key: u32 = 0;
    var index: usize = 0;
    for (1..root_bits + 1) |len| {
        while (count[len] > 0) : (count[len] -= 1) {
            replicate(list.items[start + key ..], @as(usize, 1) << @intCast(len), 1 << root_bits, .{ .bits = @intCast(len), .value = sorted[index] });
            index += 1;
            key = next_key(key, @intCast(len));
        }
    }
    var low: u32 = std.math.maxInt(u32);
    var sub_start: usize = 0;
    var sub_size: usize = 0;
    for (root_bits + 1..max_code_length + 1) |len| {
        while (count[len] > 0) : (count[len] -= 1) {
            if (key & 0xff != low) {
                const bits = next_table_bits(&count, len);
                sub_size = @as(usize, 1) << bits;
                sub_start = list.items.len - start;
                _ = try list.addManyAsSlice(a, sub_size);
                low = key & 0xff;
                list.items[start + low] = .{ .bits = @as(u8, bits) + root_bits, .value = @intCast(sub_start) };
            }
            replicate(list.items[start + sub_start + (key >> root_bits) ..], @as(usize, 1) << @intCast(len - root_bits), sub_size, .{ .bits = @intCast(len - root_bits), .value = sorted[index] });
            index += 1;
            key = next_key(key, @intCast(len));
        }
    }
    return start;
}

const code_length_order = [19]u8{ 17, 18, 0, 1, 2, 3, 4, 5, 16, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };

fn read_code(a: std.mem.Allocator, r: *BitReader, list: *std.ArrayList(HuffmanEntry), alphabet: usize) Error!usize {
    var lengths_buf: [max_alphabet]u8 = undefined;
    const lengths = lengths_buf[0..alphabet];
    @memset(lengths, 0);
    if (try r.read(1) == 1) {
        const two = try r.read(1) == 1;
        const first = try r.read(if (try r.read(1) == 1) 8 else 1);
        if (first >= alphabet) return error.InvalidImage;
        lengths[first] = 1;
        if (two) {
            const second = try r.read(8);
            if (second >= alphabet) return error.InvalidImage;
            lengths[second] = 1;
        }
        return build_table(a, list, lengths);
    }
    var cl_lengths: [19]u8 = @splat(0);
    const num = try r.read(4) + 4;
    for (code_length_order[0..num]) |s| cl_lengths[s] = @intCast(try r.read(3));
    const scratch = list.items.len;
    const cl_start = try build_table(a, list, &cl_lengths);
    var max_symbol = alphabet;
    if (try r.read(1) == 1) {
        const nbits: u5 = @intCast(2 + 2 * try r.read(3));
        max_symbol = 2 + try r.read(nbits);
        if (max_symbol > alphabet) return error.InvalidImage;
    }
    var previous: u8 = 8;
    var s: usize = 0;
    while (s < alphabet and max_symbol > 0) : (max_symbol -= 1) {
        const code = try r.symbol(list.items[cl_start..]);
        if (code < 16) {
            lengths[s] = @intCast(code);
            s += 1;
            if (code != 0) previous = @intCast(code);
            continue;
        }
        const extra: u5 = switch (code) {
            16 => 2,
            17 => 3,
            else => 7,
        };
        const repeat = try r.read(extra) + @as(u32, if (code == 18) 11 else 3);
        if (s + repeat > alphabet) return error.InvalidImage;
        @memset(lengths[s..][0..repeat], if (code == 16) previous else 0);
        s += repeat;
    }
    list.shrinkRetainingCapacity(scratch);
    return build_table(a, list, lengths);
}

const alphabet_sizes = [5]usize{ 256 + 24, 256, 256, 256, 40 };

fn subsample(size: usize, bits: u5) usize {
    return (size + (@as(usize, 1) << bits) - 1) >> bits;
}

/// Length/distance prefix value (RFC 9649 5.2.2).
fn prefix_value(r: *BitReader, code: u32) Error!usize {
    if (code < 4) return code + 1;
    const extra: u5 = @intCast((code - 2) >> 1);
    const offset = (2 + @as(usize, code & 1)) << extra;
    return offset + try r.read(extra) + 1;
}

fn add_pixels(a: u32, b: u32) u32 {
    const ag = (a & 0xff00ff00) +% (b & 0xff00ff00);
    const rb = (a & 0x00ff00ff) +% (b & 0x00ff00ff);
    return (ag & 0xff00ff00) | (rb & 0x00ff00ff);
}

/// Decodes one entropy-coded image of `out.len == xsize * ysize` ARGB pixels.
/// `level0` streams (the main image) may carry meta prefix codes.
fn decode_stream(a: std.mem.Allocator, r: *BitReader, xsize: usize, ysize: usize, level0: bool, out: []u32) Error!void {
    var cache_bits: u5 = 0;
    if (try r.read(1) == 1) {
        cache_bits = @intCast(try r.read(4));
        if (cache_bits < 1 or cache_bits > 11) return error.InvalidImage;
    }
    var meta_bits: u5 = 0;
    var meta: []u32 = &.{};
    defer a.free(meta);
    var meta_w: usize = 0;
    var num_groups: usize = 1;
    if (level0 and try r.read(1) == 1) {
        meta_bits = @intCast(try r.read(3) + 2);
        meta_w = subsample(xsize, meta_bits);
        meta = try a.alloc(u32, meta_w * subsample(ysize, meta_bits));
        try decode_stream(a, r, meta_w, subsample(ysize, meta_bits), false, meta);
        for (meta) |*m| {
            m.* = (m.* >> 8) & 0xffff;
            num_groups = @max(num_groups, m.* + 1);
        }
    }
    // Groups unused by the entropy image are parsed and discarded, bounding
    // table memory by the image size rather than by hostile group indices.
    const mapping = try a.alloc(u32, num_groups);
    defer a.free(mapping);
    var used: usize = 0;
    if (meta.len == 0) {
        mapping[0] = 0;
        used = 1;
    } else {
        @memset(mapping, std.math.maxInt(u32));
        for (meta) |*m| {
            if (mapping[m.*] == std.math.maxInt(u32)) {
                mapping[m.*] = @intCast(used);
                used += 1;
            }
            m.* = mapping[m.*];
        }
    }
    const groups = try a.alloc([5]usize, used);
    defer a.free(groups);
    var list: std.ArrayList(HuffmanEntry) = .empty;
    defer list.deinit(a);
    const cache_size: usize = if (cache_bits == 0) 0 else @as(usize, 1) << cache_bits;
    for (mapping) |slot| {
        const mark = list.items.len;
        var group: [5]usize = undefined;
        for (&group, alphabet_sizes, 0..) |*table, size, j| {
            table.* = try read_code(a, r, &list, size + if (j == 0) cache_size else 0);
        }
        if (slot == std.math.maxInt(u32)) list.shrinkRetainingCapacity(mark) else groups[slot] = group;
    }
    const cache = try a.alloc(u32, cache_size);
    defer a.free(cache);
    @memset(cache, 0);
    const cache_shift: u5 = if (cache_bits == 0) 0 else @intCast(32 - @as(u6, cache_bits));

    const entries = list.items;
    const mask: usize = if (meta_bits == 0) std.math.maxInt(usize) else (@as(usize, 1) << meta_bits) - 1;
    var group = groups[0];
    var i: usize = 0;
    var x: usize = 0;
    var y: usize = 0;
    while (i < out.len) {
        if (x & mask == 0 and meta.len != 0) group = groups[meta[(y >> meta_bits) * meta_w + (x >> meta_bits)]];
        const green = try r.symbol(entries[group[0]..]);
        if (green < 256) {
            const red = try r.symbol(entries[group[1]..]);
            const blue = try r.symbol(entries[group[2]..]);
            const alpha = try r.symbol(entries[group[3]..]);
            const argb = @as(u32, alpha) << 24 | @as(u32, red) << 16 | @as(u32, green) << 8 | blue;
            out[i] = argb;
            if (cache_size != 0) cache[(argb *% 0x1e35a7bd) >> cache_shift] = argb;
            i += 1;
            x += 1;
            if (x == xsize) {
                x = 0;
                y += 1;
            }
        } else if (green < 256 + 24) {
            const length = try prefix_value(r, green - 256);
            const code = try prefix_value(r, try r.symbol(entries[group[4]..]));
            const distance: usize = if (code > 120) code - 120 else blk: {
                const d = tables.distance_map[code - 1];
                const plane = @as(isize, d[1]) * @as(isize, @intCast(xsize)) + d[0];
                break :blk @intCast(@max(plane, 1));
            };
            if (distance > i or length > out.len - i) return error.InvalidImage;
            for (out[i..][0..length], i - distance..) |*p, src| p.* = out[src];
            if (cache_size != 0) for (out[i..][0..length]) |p| {
                cache[(p *% 0x1e35a7bd) >> cache_shift] = p;
            };
            i += length;
            x += length;
            y += x / xsize;
            x %= xsize;
            if (x & mask != 0 and meta.len != 0 and i < out.len) group = groups[meta[(y >> meta_bits) * meta_w + (x >> meta_bits)]];
        } else {
            const index = green - 280;
            if (index >= cache_size) return error.InvalidImage;
            out[i] = cache[index];
            i += 1;
            x += 1;
            if (x == xsize) {
                x = 0;
                y += 1;
            }
        }
    }
}

const Transform = union(enum) {
    predictor: Tiles,
    color: Tiles,
    subtract_green,
    color_indexing: struct { width_bits: u5, table: [256]u32, xsize: usize },

    const Tiles = struct { bits: u5, data: []u32 };
};

/// Decodes a VP8L stream following its 5-byte header (or an ALPH payload,
/// which has none) into owned ARGB pixels.
fn lossless_decode(a: std.mem.Allocator, data: []const u8, width: usize, height: usize) Error![]u32 {
    var r: BitReader = .{ .data = data };
    var transforms: [4]Transform = undefined;
    var count: usize = 0;
    defer for (transforms[0..count]) |t| switch (t) {
        .predictor, .color => |tiles| a.free(tiles.data),
        else => {},
    };
    var seen: u4 = 0;
    var xsize = width;
    while (try r.read(1) == 1) {
        const kind: u2 = @intCast(try r.read(2));
        const bit = @as(u4, 1) << kind;
        if (seen & bit != 0) return error.InvalidImage;
        seen |= bit;
        switch (kind) {
            0, 1 => {
                const bits: u5 = @intCast(try r.read(3) + 2);
                const data_tiles = try a.alloc(u32, subsample(xsize, bits) * subsample(height, bits));
                errdefer a.free(data_tiles);
                try decode_stream(a, &r, subsample(xsize, bits), subsample(height, bits), false, data_tiles);
                const tiles: Transform.Tiles = .{ .bits = bits, .data = data_tiles };
                transforms[count] = if (kind == 0) .{ .predictor = tiles } else .{ .color = tiles };
            },
            2 => transforms[count] = .subtract_green,
            3 => {
                const size = try r.read(8) + 1;
                var table: [256]u32 = @splat(0);
                try decode_stream(a, &r, size, 1, false, table[0..size]);
                for (1..size) |k| table[k] = add_pixels(table[k], table[k - 1]);
                const width_bits: u5 = if (size <= 2) 3 else if (size <= 4) 2 else if (size <= 16) 1 else 0;
                transforms[count] = .{ .color_indexing = .{ .width_bits = width_bits, .table = table, .xsize = xsize } };
                xsize = subsample(xsize, width_bits);
            },
        }
        count += 1;
    }
    const pixels = try a.alloc(u32, width * height);
    errdefer a.free(pixels);
    try decode_stream(a, &r, xsize, height, true, pixels[0 .. xsize * height]);
    var k = count;
    while (k > 0) {
        k -= 1;
        switch (transforms[k]) {
            .predictor => |tiles| inverse_predictor(pixels[0 .. xsize * height], xsize, height, tiles),
            .color => |tiles| inverse_color(pixels[0 .. xsize * height], xsize, tiles),
            .subtract_green => for (pixels[0 .. xsize * height]) |*p| {
                const green = (p.* >> 8) & 0xff;
                p.* = add_pixels(p.*, green << 16 | green);
            },
            .color_indexing => |ci| {
                inverse_color_indexing(pixels, xsize, ci.xsize, height, ci.width_bits, &ci.table);
                xsize = ci.xsize;
            },
        }
    }
    return pixels;
}

fn average2(a: u32, b: u32) u32 {
    return (((a ^ b) & 0xfefefefe) >> 1) +% (a & b);
}

fn channel(p: u32, comptime shift: u5) i32 {
    return @intCast((p >> shift) & 0xff);
}

fn select(left: u32, top: u32, top_left: u32) u32 {
    var diff: i32 = 0;
    inline for (.{ 24, 16, 8, 0 }) |shift| {
        diff += @as(i32, @intCast(@abs(channel(left, shift) - channel(top_left, shift)))) -
            @as(i32, @intCast(@abs(channel(top, shift) - channel(top_left, shift))));
    }
    return if (diff <= 0) top else left;
}

fn clamp_add_subtract_full(a: u32, b: u32, c: u32) u32 {
    var out: u32 = 0;
    inline for (.{ 24, 16, 8, 0 }) |shift| {
        const v = std.math.clamp(channel(a, shift) + channel(b, shift) - channel(c, shift), 0, 255);
        out |= @as(u32, @intCast(v)) << shift;
    }
    return out;
}

fn clamp_add_subtract_half(a: u32, b: u32) u32 {
    var out: u32 = 0;
    inline for (.{ 24, 16, 8, 0 }) |shift| {
        const ca = channel(a, shift);
        const v = std.math.clamp(ca + @divTrunc(ca - channel(b, shift), 2), 0, 255);
        out |= @as(u32, @intCast(v)) << shift;
    }
    return out;
}

fn predict(comptime mode: u4, left: u32, top: u32, top_left: u32, top_right: u32) u32 {
    return switch (mode) {
        1 => left,
        2 => top,
        3 => top_right,
        4 => top_left,
        5 => average2(average2(left, top_right), top),
        6 => average2(left, top_left),
        7 => average2(left, top),
        8 => average2(top_left, top),
        9 => average2(top, top_right),
        10 => average2(average2(left, top_left), average2(top, top_right)),
        11 => select(left, top, top_left),
        12 => clamp_add_subtract_full(left, top, top_left),
        13 => clamp_add_subtract_half(average2(left, top), top_left),
        // 0 and the unused 14/15 predict opaque black, as libwebp does.
        else => 0xff000000,
    };
}

fn inverse_predictor(px: []u32, w: usize, h: usize, tiles: Transform.Tiles) void {
    px[0] = add_pixels(px[0], 0xff000000);
    for (1..w) |x| px[x] = add_pixels(px[x], px[x - 1]);
    const tiles_w = subsample(w, tiles.bits);
    const tile = @as(usize, 1) << tiles.bits;
    for (1..h) |y| {
        const row = y * w;
        px[row] = add_pixels(px[row], px[row - w]);
        const modes = tiles.data[(y >> tiles.bits) * tiles_w ..];
        var x: usize = 1;
        while (x < w) {
            const end = @min(w, (x & ~(tile - 1)) + tile);
            switch (@as(u4, @truncate(modes[x >> tiles.bits] >> 8))) {
                inline else => |mode| for (row + x..row + end) |i| {
                    // The top-right of the last column wraps to the current
                    // row's first pixel, which the flat layout provides.
                    px[i] = add_pixels(px[i], predict(mode, px[i - 1], px[i - w], px[i - w - 1], px[i - w + 1]));
                },
            }
            x = end;
        }
    }
}

fn color_delta(t: u8, c: u8) i32 {
    return (@as(i32, @as(i8, @bitCast(t))) * @as(i8, @bitCast(c))) >> 5;
}

fn inverse_color(px: []u32, w: usize, tiles: Transform.Tiles) void {
    const tiles_w = subsample(w, tiles.bits);
    for (0..px.len / w) |y| {
        const elements = tiles.data[(y >> tiles.bits) * tiles_w ..];
        for (px[y * w ..][0..w], 0..) |*p, x| {
            const m = elements[x >> tiles.bits];
            const green: u8 = @truncate(p.* >> 8);
            const red: u8 = @truncate(@as(u32, @bitCast(@as(i32, @intCast((p.* >> 16) & 0xff)) + color_delta(@truncate(m), green))));
            const blue_delta = color_delta(@truncate(m >> 8), green) + color_delta(@truncate(m >> 16), red);
            const blue: u8 = @truncate(@as(u32, @bitCast(@as(i32, @intCast(p.* & 0xff)) + blue_delta)));
            p.* = (p.* & 0xff00ff00) | @as(u32, red) << 16 | blue;
        }
    }
}

/// Expands packed indices in place, walking backwards so that unread packed
/// sources (always at or before their destinations) are never overwritten.
fn inverse_color_indexing(px: []u32, packed_w: usize, w: usize, h: usize, width_bits: u5, table: *const [256]u32) void {
    const bits_per_index: u4 = @intCast(@as(u8, 8) >> @intCast(width_bits));
    const index_mask = (@as(u32, 1) << bits_per_index) - 1;
    const per_byte_mask = (@as(usize, 1) << width_bits) - 1;
    var y = h;
    while (y > 0) {
        y -= 1;
        var x = w;
        while (x > 0) {
            x -= 1;
            const packed_green = (px[y * packed_w + (x >> width_bits)] >> 8) & 0xff;
            const shift: u5 = @intCast(bits_per_index * (x & per_byte_mask));
            px[y * w + x] = table[(packed_green >> shift) & index_mask];
        }
    }
}

// ----------------------------------------------------------------------------
// ALPH (RFC 9649 section 2.7.1.2)

fn decode_alpha(a: std.mem.Allocator, data: []const u8, width: usize, height: usize, out: []u8) Error!void {
    if (data.len < 1) return error.TruncatedImage;
    const method = data[0] & 3;
    const filter = (data[0] >> 2) & 3;
    if (data[0] >> 6 != 0 or (data[0] >> 4) & 3 > 1 or method > 1) return error.InvalidImage;
    if (method == 0) {
        if (data.len - 1 < out.len) return error.TruncatedImage;
        @memcpy(out, data[1..][0..out.len]);
    } else {
        const argb = try lossless_decode(a, data[1..], width, height);
        defer a.free(argb);
        for (out, argb) |*o, p| o.* = @truncate(p >> 8);
    }
    // Level-reduction preprocessing is only a hint for optional dithering.
    if (filter == 0) return;
    for (0..height) |y| {
        const row = out[y * width ..][0..width];
        if (y == 0 or filter == 1) {
            var pred: u8 = if (y == 0) 0 else out[(y - 1) * width];
            for (row) |*v| {
                v.* +%= pred;
                pred = v.*;
            }
        } else {
            const prev = out[(y - 1) * width ..][0..width];
            if (filter == 2) {
                for (row, prev) |*v, p| v.* +%= p;
            } else {
                var left = prev[0];
                var top_left = prev[0];
                for (row, prev) |*v, top| {
                    const g = std.math.clamp(@as(i16, left) + top - top_left, 0, 255);
                    v.* +%= @intCast(g);
                    left = v.*;
                    top_left = top;
                }
            }
        }
    }
}

// ----------------------------------------------------------------------------
// VP8 lossy key frames (RFC 6386)

const BoolDecoder = struct {
    data: []const u8,
    pos: usize = 0,
    value: u64 = 0,
    /// Range minus one, kept in [127, 254] between reads.
    range: u32 = 255 - 1,
    /// Bit position of the current byte within `value`; negative needs a load.
    bits: i32 = -8,
    /// Set once the decoder had to invent bytes past its partition.
    eof: bool = false,

    fn init(data: []const u8) BoolDecoder {
        var d: BoolDecoder = .{ .data = data };
        d.load();
        return d;
    }

    fn load(d: *BoolDecoder) void {
        if (d.data.len - d.pos >= 8) {
            d.value = (d.value << 56) | (std.mem.readInt(u64, d.data[d.pos..][0..8], .big) >> 8);
            d.pos += 7;
            d.bits += 56;
        } else if (d.pos < d.data.len) {
            d.value = (d.value << 8) | d.data[d.pos];
            d.pos += 1;
            d.bits += 8;
        } else if (!d.eof) {
            d.value <<= 8;
            d.bits += 8;
            d.eof = true;
        } else {
            d.bits = 0;
        }
    }

    fn bit(d: *BoolDecoder, prob: u8) u1 {
        if (d.bits < 0) d.load();
        const pos: u6 = @intCast(d.bits);
        const split = (d.range * prob) >> 8;
        const value: u32 = @truncate(d.value >> pos);
        var range: u32 = undefined;
        var result: u1 = undefined;
        if (value > split) {
            range = d.range - split;
            d.value -= @as(u64, split + 1) << pos;
            result = 1;
        } else {
            range = split + 1;
            result = 0;
        }
        const shift: u5 = 7 ^ std.math.log2_int(u32, range);
        range <<= shift;
        d.bits -= shift;
        d.range = range - 1;
        return result;
    }

    fn flag(d: *BoolDecoder) bool {
        return d.bit(128) == 1;
    }

    fn literal(d: *BoolDecoder, n: u5) u32 {
        var v: u32 = 0;
        for (0..n) |_| v = (v << 1) | d.bit(128);
        return v;
    }

    fn signed(d: *BoolDecoder, n: u5) i32 {
        const v: i32 = @intCast(d.literal(n));
        return if (d.flag()) -v else v;
    }

    fn optional_signed(d: *BoolDecoder, n: u5) i32 {
        return if (d.flag()) d.signed(n) else 0;
    }
};

// 16x16 luma and chroma modes share the first four subblock mode numbers.
const dc_pred = 0;
const tm_pred = 1;
const v_pred = 2;
const h_pred = 3;
// Remaining subblock modes, RFC 6386 numbering.
const b_ld_pred = 4;
const b_rd_pred = 5;
const b_vr_pred = 6;
const b_vl_pred = 7;
const b_hd_pred = 8;
const b_hu_pred = 9;

/// RFC 6386 `bmode_tree`: positive entries index the next node pair.
const bmode_tree = [18]i8{ -dc_pred, 2, -tm_pred, 4, -v_pred, 6, 8, 12, -h_pred, 10, -b_rd_pred, -b_vr_pred, -b_ld_pred, 14, -b_vl_pred, 16, -b_hd_pred, -b_hu_pred };
const coeff_bands = [17]u8{ 0, 1, 2, 3, 6, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7, 0 };
const zigzag = [16]u8{ 0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15 };
const cat3 = [_]u8{ 173, 148, 140 };
const cat4 = [_]u8{ 176, 155, 140, 135 };
const cat5 = [_]u8{ 180, 157, 141, 134, 130 };
const cat6 = [_]u8{ 254, 254, 243, 230, 196, 177, 153, 140, 133, 130, 129 };

const Quant = struct { y1: [2]i32, y2: [2]i32, uv: [2]i32 };

const MacroblockFilter = struct { limit: u8 = 0, inner_limit: u8 = 0, hev_threshold: u8 = 0, inner: bool = false };

/// Reconstructed planes padded to whole macroblocks.
const Planes = struct {
    width: usize,
    height: usize,
    y: []u8,
    u: []u8,
    v: []u8,
    y_stride: usize,
    uv_stride: usize,

    fn deinit(p: *Planes, a: std.mem.Allocator) void {
        a.free(p.y);
        a.free(p.u);
        a.free(p.v);
        p.* = undefined;
    }

    fn to_rgba(p: *const Planes, dst: []u8, stride: usize) void {
        const w = p.width;
        // libwebp EmitFancyRGB: row 0 and an even final row mirror one chroma
        // row; each other pair (2k-1, 2k) interpolates chroma rows k-1 and k.
        upsample_rows(p.y[0..w], null, p.u, p.v, p.u, p.v, dst, null, w);
        var y: usize = 1;
        while (y + 1 < p.height) : (y += 2) {
            const top = (y - 1) / 2 * p.uv_stride;
            const cur = top + p.uv_stride;
            upsample_rows(p.y[y * p.y_stride ..][0..w], p.y[(y + 1) * p.y_stride ..][0..w], p.u[top..], p.v[top..], p.u[cur..], p.v[cur..], dst[y * stride ..], dst[(y + 1) * stride ..], w);
        }
        if (p.height > 1 and p.height & 1 == 0) {
            const last = p.height - 1;
            const c = (last / 2) * p.uv_stride;
            upsample_rows(p.y[last * p.y_stride ..][0..w], null, p.u[c..], p.v[c..], p.u[c..], p.v[c..], dst[last * stride ..], null, w);
        }
        for (0..p.height) |row| {
            const line = dst[row * stride ..][0 .. w * 4];
            for (0..w) |x| line[x * 4 + 3] = 255;
        }
    }
};

fn mult_hi(v: u8, coeff: i32) i32 {
    return (@as(i32, v) * coeff) >> 8;
}

fn clip8(v: i32) u8 {
    return @intCast(std.math.clamp(v >> 6, 0, 255));
}

fn yuv_to_rgb(y: u8, u: u8, v: u8, out: []u8) void {
    const luma = mult_hi(y, 19077);
    out[0] = clip8(luma + mult_hi(v, 26149) - 14234);
    out[1] = clip8(luma - mult_hi(u, 6419) - mult_hi(v, 13320) + 8708);
    out[2] = clip8(luma + mult_hi(u, 33050) - 17685);
}

/// libwebp `UpsampleRgbaLinePair`: one or two luma rows between chroma rows
/// `top` (nearest to the first row) and `cur` (nearest to the second).
fn upsample_rows(top_y: []const u8, bottom_y: ?[]const u8, top_u: []const u8, top_v: []const u8, cur_u: []const u8, cur_v: []const u8, top_dst: []u8, bottom_dst: ?[]u8, len: usize) void {
    const Uv = struct { u: u32, v: u32 };
    const last_pair = (len - 1) >> 1;
    var tl: Uv = .{ .u = top_u[0], .v = top_v[0] };
    var l: Uv = .{ .u = cur_u[0], .v = cur_v[0] };
    {
        yuv_to_rgb(top_y[0], @intCast((3 * tl.u + l.u + 2) >> 2), @intCast((3 * tl.v + l.v + 2) >> 2), top_dst[0..3]);
        if (bottom_y) |by| yuv_to_rgb(by[0], @intCast((3 * l.u + tl.u + 2) >> 2), @intCast((3 * l.v + tl.v + 2) >> 2), bottom_dst.?[0..3]);
    }
    for (1..last_pair + 1) |x| {
        const t: Uv = .{ .u = top_u[x], .v = top_v[x] };
        const c: Uv = .{ .u = cur_u[x], .v = cur_v[x] };
        var out: [4][2]u8 = undefined; // [top0, top1, bottom0, bottom1][u, v]
        inline for (.{ "u", "v" }, 0..) |field, k| {
            const tl_s = @field(tl, field);
            const t_s = @field(t, field);
            const l_s = @field(l, field);
            const c_s = @field(c, field);
            const avg = tl_s + t_s + l_s + c_s + 8;
            const diag_12 = (avg + 2 * (t_s + l_s)) >> 3;
            const diag_03 = (avg + 2 * (tl_s + c_s)) >> 3;
            out[0][k] = @intCast((diag_12 + tl_s) >> 1);
            out[1][k] = @intCast((diag_03 + t_s) >> 1);
            out[2][k] = @intCast((diag_03 + l_s) >> 1);
            out[3][k] = @intCast((diag_12 + c_s) >> 1);
        }
        yuv_to_rgb(top_y[2 * x - 1], out[0][0], out[0][1], top_dst[(2 * x - 1) * 4 ..][0..3]);
        yuv_to_rgb(top_y[2 * x], out[1][0], out[1][1], top_dst[(2 * x) * 4 ..][0..3]);
        if (bottom_y) |by| {
            yuv_to_rgb(by[2 * x - 1], out[2][0], out[2][1], bottom_dst.?[(2 * x - 1) * 4 ..][0..3]);
            yuv_to_rgb(by[2 * x], out[3][0], out[3][1], bottom_dst.?[(2 * x) * 4 ..][0..3]);
        }
        tl = t;
        l = c;
    }
    if (len & 1 == 0) {
        yuv_to_rgb(top_y[len - 1], @intCast((3 * tl.u + l.u + 2) >> 2), @intCast((3 * tl.v + l.v + 2) >> 2), top_dst[(len - 1) * 4 ..][0..3]);
        if (bottom_y) |by| yuv_to_rgb(by[len - 1], @intCast((3 * l.u + tl.u + 2) >> 2), @intCast((3 * l.v + tl.v + 2) >> 2), bottom_dst.?[(len - 1) * 4 ..][0..3]);
    }
}

const Lossy = struct {
    mbw: usize,
    mbh: usize,
    partitions: [8]BoolDecoder = undefined,
    num_partitions: usize = 1,
    segment_update_map: bool = false,
    segment_probs: [3]u8 = .{ 255, 255, 255 },
    quant: [4]Quant = undefined,
    filters: [4][2]MacroblockFilter = @splat(@splat(.{})),
    filter_simple: bool = false,
    filter_level: u8 = 0,
    probs: [4][8][3][11]u8 = tables.default_coeff_probs,
    skip_prob: ?u8 = null,
    /// Above-row subblock modes (4 per macroblock) and nonzero contexts.
    top_modes: []u8,
    top_nz: [][9]u1,
    /// Unfiltered bottom rows of the previous macroblock row, for prediction.
    top_y: []u8,
    top_u: []u8,
    top_v: []u8,
};

/// Clamps a quantizer index (libwebp clips UV DC at 117, i.e. a factor of 132).
fn clip_index(q: i32, max: i32) usize {
    return @intCast(std.math.clamp(q, 0, max));
}

fn lossy_decode(a: std.mem.Allocator, data: []const u8, width: usize, height: usize) Error!Planes {
    const first_size = le24(data) >> 5;
    var rest = data[10..];
    if (first_size > rest.len) return error.TruncatedImage;
    var br = BoolDecoder.init(rest[0..first_size]);
    rest = rest[first_size..];

    _ = br.flag(); // color space: reserved, YUV
    _ = br.flag(); // clamping type: decoders always clamp
    var segment_enabled = false;
    var absolute_delta = false;
    var segment_quant: [4]i32 = @splat(0);
    var segment_filter: [4]i32 = @splat(0);
    const mbw = (width + 15) / 16;
    const mbh = (height + 15) / 16;
    var d: Lossy = .{
        .mbw = mbw,
        .mbh = mbh,
        .top_modes = try a.alloc(u8, mbw * 4),
        .top_nz = undefined,
        .top_y = undefined,
        .top_u = undefined,
        .top_v = undefined,
    };
    defer a.free(d.top_modes);
    d.top_nz = try a.alloc([9]u1, mbw);
    defer a.free(d.top_nz);
    d.top_y = try a.alloc(u8, mbw * 16 + 4);
    defer a.free(d.top_y);
    d.top_u = try a.alloc(u8, mbw * 8);
    defer a.free(d.top_u);
    d.top_v = try a.alloc(u8, mbw * 8);
    defer a.free(d.top_v);
    @memset(d.top_modes, dc_pred);
    @memset(d.top_nz, @splat(0));

    if (br.flag()) {
        segment_enabled = true;
        d.segment_update_map = br.flag();
        if (br.flag()) {
            absolute_delta = br.flag();
            for (&segment_quant) |*q| q.* = br.optional_signed(7);
            for (&segment_filter) |*f| f.* = br.optional_signed(6);
        }
        if (d.segment_update_map) for (&d.segment_probs) |*p| {
            p.* = if (br.flag()) @intCast(br.literal(8)) else 255;
        };
    }
    d.filter_simple = br.flag();
    d.filter_level = @intCast(br.literal(6));
    const sharpness = br.literal(3);
    var ref_delta: [4]i32 = @splat(0);
    var mode_delta: [4]i32 = @splat(0);
    const use_lf_delta = br.flag();
    if (use_lf_delta and br.flag()) {
        for (&ref_delta) |*v| if (br.flag()) {
            v.* = br.signed(6);
        };
        for (&mode_delta) |*v| if (br.flag()) {
            v.* = br.signed(6);
        };
    }

    // Token partitions: 3-byte little-endian sizes, then data; the last takes
    // the remainder. Oversized entries are clamped as in libwebp.
    d.num_partitions = @as(usize, 1) << @intCast(br.literal(2));
    const last = d.num_partitions - 1;
    if (rest.len < 3 * last) return error.TruncatedImage;
    var part_data = rest[3 * last ..];
    for (0..last) |p| {
        const size = @min(le24(rest[3 * p ..]), part_data.len);
        d.partitions[p] = BoolDecoder.init(part_data[0..size]);
        part_data = part_data[size..];
    }
    if (part_data.len == 0) return error.TruncatedImage;
    d.partitions[last] = BoolDecoder.init(part_data);

    const base_q: i32 = @intCast(br.literal(7));
    const dq_y1_dc = br.optional_signed(4);
    const dq_y2_dc = br.optional_signed(4);
    const dq_y2_ac = br.optional_signed(4);
    const dq_uv_dc = br.optional_signed(4);
    const dq_uv_ac = br.optional_signed(4);
    for (&d.quant, 0..) |*m, s| {
        var q = base_q;
        if (segment_enabled) {
            q = segment_quant[s];
            if (!absolute_delta) q += base_q;
        }
        m.y1 = .{ tables.dc_quant[clip_index(q + dq_y1_dc, 127)], tables.ac_quant[clip_index(q, 127)] };
        // x * 155 / 100 equals (x * 101581) >> 16 over the table range.
        m.y2 = .{ @as(i32, tables.dc_quant[clip_index(q + dq_y2_dc, 127)]) * 2, @max(8, (@as(i32, tables.ac_quant[clip_index(q + dq_y2_ac, 127)]) * 101581) >> 16) };
        m.uv = .{ tables.dc_quant[clip_index(q + dq_uv_dc, 117)], tables.ac_quant[clip_index(q + dq_uv_ac, 127)] };
    }

    _ = br.flag(); // refresh_entropy_probs: irrelevant for a single frame
    for (&d.probs, tables.coeff_update_probs) |*bands, update_bands| {
        for (bands, update_bands) |*contexts, update_contexts| {
            for (contexts, update_contexts) |*nodes, update_nodes| {
                for (nodes, update_nodes) |*p, update| {
                    if (br.bit(update) == 1) p.* = @intCast(br.literal(8));
                }
            }
        }
    }
    if (br.flag()) d.skip_prob = @intCast(br.literal(8));

    // Precompute per-segment, per-(i4x4) loop filter strengths (libwebp PrecomputeFilterStrengths).
    if (d.filter_level != 0) {
        for (0..4) |s| {
            var base: i32 = d.filter_level;
            if (segment_enabled) {
                base = segment_filter[s];
                if (!absolute_delta) base += d.filter_level;
            }
            for (0..2) |i4x4| {
                var level = base;
                if (use_lf_delta) {
                    level += ref_delta[0];
                    if (i4x4 == 1) level += mode_delta[0];
                }
                level = std.math.clamp(level, 0, 63);
                if (level == 0) continue;
                var inner = level;
                if (sharpness > 0) {
                    inner >>= if (sharpness > 4) 2 else 1;
                    inner = @min(inner, 9 - @as(i32, @intCast(sharpness)));
                }
                inner = @max(inner, 1);
                d.filters[s][i4x4] = .{
                    .limit = @intCast(2 * level + inner),
                    .inner_limit = @intCast(inner),
                    .hev_threshold = if (level >= 40) 2 else if (level >= 15) 1 else 0,
                    .inner = i4x4 == 1,
                };
            }
        }
    }

    var planes: Planes = .{
        .width = width,
        .height = height,
        .y_stride = mbw * 16,
        .uv_stride = mbw * 8,
        .y = try a.alloc(u8, mbw * 16 * mbh * 16),
        .u = undefined,
        .v = undefined,
    };
    errdefer a.free(planes.y);
    planes.u = try a.alloc(u8, mbw * 8 * mbh * 8);
    errdefer a.free(planes.u);
    planes.v = try a.alloc(u8, mbw * 8 * mbh * 8);
    errdefer a.free(planes.v);
    const filter_info = try a.alloc(MacroblockFilter, mbw * mbh);
    defer a.free(filter_info);

    var left_y: [17]u8 = undefined; // [0] is top-left, [1..17] the left column
    var left_u: [9]u8 = undefined;
    var left_v: [9]u8 = undefined;
    for (0..mbh) |mby| {
        var left_modes: [4]u8 = @splat(dc_pred);
        var left_nz: [9]u1 = @splat(0);
        const tokens = &d.partitions[mby & last];
        for (0..mbw) |mbx| {
            // Macroblock header (first partition).
            var segment: usize = 0;
            if (d.segment_update_map) {
                segment = if (br.bit(d.segment_probs[0]) == 0) br.bit(d.segment_probs[1]) else @as(usize, br.bit(d.segment_probs[2])) + 2;
            }
            const skip = if (d.skip_prob) |p| br.bit(p) == 1 else false;
            const is_i4x4 = br.bit(145) == 0;
            var modes: [16]u8 = undefined;
            var ymode: u8 = undefined;
            if (!is_i4x4) {
                ymode = if (br.bit(156) == 1) (if (br.bit(128) == 1) tm_pred else h_pred) else (if (br.bit(163) == 1) v_pred else dc_pred);
                @memset(d.top_modes[mbx * 4 ..][0..4], ymode);
                left_modes = @splat(ymode);
            } else {
                for (0..4) |y| {
                    for (0..4) |x| {
                        const probs = &tables.bmode_probs[d.top_modes[mbx * 4 + x]][left_modes[y]];
                        var i: i8 = 0;
                        while (true) {
                            i = bmode_tree[@intCast(i + @as(i8, br.bit(probs[@intCast(i >> 1)])))];
                            if (i <= 0) break;
                        }
                        const mode: u8 = @intCast(-i);
                        modes[y * 4 + x] = mode;
                        d.top_modes[mbx * 4 + x] = mode;
                        left_modes[y] = mode;
                    }
                }
            }
            const uvmode: u8 = if (br.bit(142) == 0) dc_pred else if (br.bit(114) == 0) v_pred else if (br.bit(183) == 1) tm_pred else h_pred;

            // Residuals (token partition).
            var coeffs: [384]i16 = @splat(0);
            var has_coeffs = false;
            if (!skip) {
                has_coeffs = parse_residuals(&d, tokens, &d.quant[segment], is_i4x4, &d.top_nz[mbx], &left_nz, &coeffs);
            } else {
                for (1..9) |k| {
                    left_nz[k] = 0;
                    d.top_nz[mbx][k] = 0;
                }
                if (!is_i4x4) {
                    left_nz[0] = 0;
                    d.top_nz[mbx][0] = 0;
                }
            }
            if (tokens.eof) return error.TruncatedImage;
            var info_entry = d.filters[segment][@intFromBool(is_i4x4)];
            info_entry.inner = info_entry.inner or has_coeffs;
            filter_info[mby * mbw + mbx] = info_entry;

            reconstruct(&d, &planes, mbx, mby, is_i4x4, ymode, &modes, uvmode, &coeffs, &left_y, &left_u, &left_v);
        }
        if (br.eof) return error.TruncatedImage;
    }
    if (d.filter_level != 0) loop_filter(&planes, filter_info, mbw, mbh, d.filter_simple);
    return planes;
}

/// Reads one block's tokens (libwebp `GetCoeffs`). Returns the index after
/// the last decoded token, so a result above `first` means nonzero context.
fn get_coeffs(br: *BoolDecoder, probs: *const [8][3][11]u8, ctx: usize, dq: [2]i32, first: usize, out: *[16]i16) usize {
    var n = first;
    var p = &probs[coeff_bands[n]][ctx];
    while (n < 16) : (n += 1) {
        if (br.bit(p[0]) == 0) return n; // end of block
        while (br.bit(p[1]) == 0) { // zero run
            n += 1;
            if (n == 16) return 16;
            p = &probs[coeff_bands[n]][0];
        }
        var v: i32 = undefined;
        const next = &probs[coeff_bands[n + 1]];
        if (br.bit(p[2]) == 0) {
            v = 1;
            p = &next[1];
        } else {
            if (br.bit(p[3]) == 0) {
                v = if (br.bit(p[4]) == 0) 2 else 3 + @as(i32, br.bit(p[5]));
            } else if (br.bit(p[6]) == 0) {
                if (br.bit(p[7]) == 0) {
                    v = 5 + @as(i32, br.bit(159));
                } else {
                    v = 7 + 2 * @as(i32, br.bit(165));
                    v += br.bit(145);
                }
            } else {
                const bit1 = br.bit(p[8]);
                const bit0 = br.bit(p[9 + @as(usize, bit1)]);
                const cat = 2 * @as(usize, bit1) + bit0;
                const cat_probs: []const u8 = switch (cat) {
                    0 => &cat3,
                    1 => &cat4,
                    2 => &cat5,
                    else => &cat6,
                };
                v = 0;
                for (cat_probs) |prob| v = v + v + br.bit(prob);
                v += 3 + (@as(i32, 8) << @intCast(cat));
            }
            p = &next[2];
        }
        if (br.flag()) v = -v;
        const value = v * dq[@intFromBool(n > 0)];
        // libwebp stores the product in int16 storage; keep its wrapping.
        out[zigzag[n]] = @truncate(value);
    }
    return 16;
}

/// Parses all residual blocks of a macroblock; returns whether any is nonzero.
fn parse_residuals(d: *Lossy, br: *BoolDecoder, q: *const Quant, is_i4x4: bool, top: *[9]u1, left: *[9]u1, coeffs: *[384]i16) bool {
    var any = false;
    var first: usize = 0;
    var ac_type: usize = 3;
    if (!is_i4x4) {
        var dc: [16]i16 = @splat(0);
        const nz = get_coeffs(br, &d.probs[1], @as(usize, top[0]) + left[0], q.y2, 0, &dc);
        top[0] = @intFromBool(nz > 0);
        left[0] = top[0];
        inverse_wht(&dc, coeffs);
        first = 1;
        ac_type = 0;
    }
    for (0..4) |y| {
        for (0..4) |x| {
            const block: *[16]i16 = coeffs[(y * 4 + x) * 16 ..][0..16];
            const nz = get_coeffs(br, &d.probs[ac_type], @as(usize, top[1 + x]) + left[1 + y], q.y1, first, block);
            const flag: u1 = @intFromBool(nz > first);
            top[1 + x] = flag;
            left[1 + y] = flag;
            if (flag == 1 or block[0] != 0) any = true;
        }
    }
    for (0..2) |plane| {
        const base = 5 + plane * 2;
        for (0..2) |y| {
            for (0..2) |x| {
                const block: *[16]i16 = coeffs[(16 + plane * 4 + y * 2 + x) * 16 ..][0..16];
                const nz = get_coeffs(br, &d.probs[2], @as(usize, top[base + x]) + left[base + y], q.uv, 0, block);
                const flag: u1 = @intFromBool(nz > 0);
                top[base + x] = flag;
                left[base + y] = flag;
                if (flag == 1) any = true;
            }
        }
    }
    return any;
}

fn inverse_wht(in: *const [16]i16, out: *[384]i16) void {
    var tmp: [16]i32 = undefined;
    for (0..4) |i| {
        // Sums of wrapped int16 inputs, as in libwebp TransformWHT.
        const a0 = @as(i32, in[0 + i]) + in[12 + i];
        const a1 = @as(i32, in[4 + i]) + in[8 + i];
        const a2 = @as(i32, in[4 + i]) - in[8 + i];
        const a3 = @as(i32, in[0 + i]) - in[12 + i];
        tmp[0 + i] = a0 + a1;
        tmp[8 + i] = a0 - a1;
        tmp[4 + i] = a3 + a2;
        tmp[12 + i] = a3 - a2;
    }
    for (0..4) |i| {
        const dc = tmp[0 + i * 4] + 3;
        const a0 = dc + tmp[3 + i * 4];
        const a1 = tmp[1 + i * 4] + tmp[2 + i * 4];
        const a2 = tmp[1 + i * 4] - tmp[2 + i * 4];
        const a3 = dc - tmp[3 + i * 4];
        out[(i * 4 + 0) * 16] = @truncate((a0 + a1) >> 3);
        out[(i * 4 + 1) * 16] = @truncate((a3 + a2) >> 3);
        out[(i * 4 + 2) * 16] = @truncate((a0 - a1) >> 3);
        out[(i * 4 + 3) * 16] = @truncate((a3 - a2) >> 3);
    }
}

fn mul1(a: i32) i32 {
    return ((a * 20091) >> 16) + a;
}

fn mul2(a: i32) i32 {
    return (a * 35468) >> 16;
}

fn clip_pixel(v: i32) u8 {
    return @intCast(std.math.clamp(v, 0, 255));
}

/// Adds the inverse DCT of `in` to the 4x4 block at `dst` (libwebp TransformOne).
fn add_transform(in: *const [16]i16, dst: []u8, stride: usize) void {
    var ac = false;
    for (in[1..]) |c| ac = ac or c != 0;
    if (!ac) {
        if (in[0] == 0) return;
        const dc = (@as(i32, in[0]) + 4) >> 3;
        for (0..4) |y| for (dst[y * stride ..][0..4]) |*p| {
            p.* = clip_pixel(p.* + dc);
        };
        return;
    }
    var tmp: [16]i32 = undefined;
    for (0..4) |i| {
        const a = @as(i32, in[i]) + in[8 + i];
        const b = @as(i32, in[i]) - in[8 + i];
        const c = mul2(in[4 + i]) - mul1(in[12 + i]);
        const e = mul1(in[4 + i]) + mul2(in[12 + i]);
        tmp[i * 4 + 0] = a + e;
        tmp[i * 4 + 1] = b + c;
        tmp[i * 4 + 2] = b - c;
        tmp[i * 4 + 3] = a - e;
    }
    for (0..4) |i| {
        const dc = tmp[i] + 4;
        const a = dc + tmp[8 + i];
        const b = dc - tmp[8 + i];
        const c = mul2(tmp[4 + i]) - mul1(tmp[12 + i]);
        const e = mul1(tmp[4 + i]) + mul2(tmp[12 + i]);
        const row = dst[i * stride ..][0..4];
        row[0] = clip_pixel(row[0] + ((a + e) >> 3));
        row[1] = clip_pixel(row[1] + ((b + c) >> 3));
        row[2] = clip_pixel(row[2] + ((b - c) >> 3));
        row[3] = clip_pixel(row[3] + ((a - e) >> 3));
    }
}

fn avg3(a: u8, b: u8, c: u8) u8 {
    return @intCast((@as(u16, a) + 2 * @as(u16, b) + c + 2) >> 2);
}

fn avg2(a: u8, b: u8) u8 {
    return @intCast((@as(u16, a) + b + 1) >> 1);
}

/// Whole-block predictors on a workspace whose row -1 and column -1 hold edges.
fn predict_block(ws: []u8, origin: usize, stride: usize, size: usize, mode: u8, has_top: bool, has_left: bool) void {
    switch (mode) {
        dc_pred => {
            var sum: u32 = 0;
            var shift: u5 = if (size == 16) 3 else 2;
            if (has_top) {
                for (ws[origin - stride ..][0..size]) |v| sum += v;
                shift += 1;
            }
            if (has_left) {
                for (0..size) |y| sum += ws[origin + y * stride - 1];
                shift += 1;
            }
            const dc: u8 = if (!has_top and !has_left) 128 else @intCast((sum + (@as(u32, 1) << (shift - 1))) >> shift);
            for (0..size) |y| @memset(ws[origin + y * stride ..][0..size], dc);
        },
        v_pred => for (0..size) |y| @memmove(ws[origin + y * stride ..][0..size], ws[origin - stride ..][0..size]),
        h_pred => for (0..size) |y| @memset(ws[origin + y * stride ..][0..size], ws[origin + y * stride - 1]),
        else => true_motion(ws, origin, stride, size),
    }
}

fn true_motion(ws: []u8, origin: usize, stride: usize, size: usize) void {
    const corner: i32 = ws[origin - stride - 1];
    for (0..size) |y| {
        const left = @as(i32, ws[origin + y * stride - 1]) - corner;
        for (0..size) |x| ws[origin + y * stride + x] = clip_pixel(left + ws[origin - stride + x]);
    }
}

/// Subblock predictors (libwebp dec.c naming: X top-left, A..H top, I..L left).
fn predict_subblock(ws: []u8, o: usize, stride: usize, mode: u8) void {
    const top = ws[o - stride - 1 ..][0..9]; // X, A..H
    const X = top[0];
    const A = top[1];
    const B = top[2];
    const C = top[3];
    const D = top[4];
    const E = top[5];
    const F = top[6];
    const G = top[7];
    const H = top[8];
    const I = ws[o - 1];
    const J = ws[o + stride - 1];
    const K = ws[o + 2 * stride - 1];
    const L = ws[o + 3 * stride - 1];
    var b: [4][4]u8 = undefined; // b[y][x]
    switch (mode) {
        dc_pred => {
            const dc: u8 = @intCast((@as(u32, A) + B + C + D + I + J + K + L + 4) >> 3);
            b = @splat(@splat(dc));
        },
        tm_pred => return true_motion(ws, o, stride, 4),
        v_pred => b = @splat(.{ avg3(X, A, B), avg3(A, B, C), avg3(B, C, D), avg3(C, D, E) }),
        h_pred => {
            b[0] = @splat(avg3(X, I, J));
            b[1] = @splat(avg3(I, J, K));
            b[2] = @splat(avg3(J, K, L));
            b[3] = @splat(avg3(K, L, L));
        },
        b_rd_pred => {
            b[3][0] = avg3(J, K, L);
            b[3][1] = avg3(I, J, K);
            b[2][0] = b[3][1];
            b[3][2] = avg3(X, I, J);
            b[2][1] = b[3][2];
            b[1][0] = b[3][2];
            b[3][3] = avg3(A, X, I);
            b[2][2] = b[3][3];
            b[1][1] = b[3][3];
            b[0][0] = b[3][3];
            b[2][3] = avg3(B, A, X);
            b[1][2] = b[2][3];
            b[0][1] = b[2][3];
            b[1][3] = avg3(C, B, A);
            b[0][2] = b[1][3];
            b[0][3] = avg3(D, C, B);
        },
        b_ld_pred => {
            const v = [7]u8{ avg3(A, B, C), avg3(B, C, D), avg3(C, D, E), avg3(D, E, F), avg3(E, F, G), avg3(F, G, H), avg3(G, H, H) };
            for (0..4) |y| for (0..4) |x| {
                b[y][x] = v[x + y];
            };
        },
        b_vr_pred => {
            b[0][0] = avg2(X, A);
            b[2][1] = b[0][0];
            b[0][1] = avg2(A, B);
            b[2][2] = b[0][1];
            b[0][2] = avg2(B, C);
            b[2][3] = b[0][2];
            b[0][3] = avg2(C, D);
            b[3][0] = avg3(K, J, I);
            b[2][0] = avg3(J, I, X);
            b[1][0] = avg3(I, X, A);
            b[3][1] = b[1][0];
            b[1][1] = avg3(X, A, B);
            b[3][2] = b[1][1];
            b[1][2] = avg3(A, B, C);
            b[3][3] = b[1][2];
            b[1][3] = avg3(B, C, D);
        },
        b_vl_pred => {
            b[0][0] = avg2(A, B);
            b[0][1] = avg2(B, C);
            b[2][0] = b[0][1];
            b[0][2] = avg2(C, D);
            b[2][1] = b[0][2];
            b[0][3] = avg2(D, E);
            b[2][2] = b[0][3];
            b[1][0] = avg3(A, B, C);
            b[1][1] = avg3(B, C, D);
            b[3][0] = b[1][1];
            b[1][2] = avg3(C, D, E);
            b[3][1] = b[1][2];
            b[1][3] = avg3(D, E, F);
            b[3][2] = b[1][3];
            b[2][3] = avg3(E, F, G);
            b[3][3] = avg3(F, G, H);
        },
        b_hd_pred => {
            b[0][0] = avg2(I, X);
            b[1][2] = b[0][0];
            b[1][0] = avg2(J, I);
            b[2][2] = b[1][0];
            b[2][0] = avg2(K, J);
            b[3][2] = b[2][0];
            b[3][0] = avg2(L, K);
            b[0][3] = avg3(A, B, C);
            b[0][2] = avg3(X, A, B);
            b[0][1] = avg3(I, X, A);
            b[1][3] = b[0][1];
            b[1][1] = avg3(J, I, X);
            b[2][3] = b[1][1];
            b[2][1] = avg3(K, J, I);
            b[3][3] = b[2][1];
            b[3][1] = avg3(L, K, J);
        },
        else => { // b_hu_pred
            b[0][0] = avg2(I, J);
            b[0][2] = avg2(J, K);
            b[1][0] = b[0][2];
            b[1][2] = avg2(K, L);
            b[2][0] = b[1][2];
            b[0][1] = avg3(I, J, K);
            b[0][3] = avg3(J, K, L);
            b[1][1] = b[0][3];
            b[1][3] = avg3(K, L, L);
            b[2][1] = b[1][3];
            b[2][2] = L;
            b[2][3] = L;
            b[3] = @splat(L);
        },
    }
    for (0..4) |y| ws[o + y * stride ..][0..4].* = b[y];
}

const luma_stride = 1 + 16 + 4;
const chroma_stride = 1 + 8;

fn reconstruct(
    d: *Lossy,
    planes: *Planes,
    mbx: usize,
    mby: usize,
    is_i4x4: bool,
    ymode: u8,
    modes: *const [16]u8,
    uvmode: u8,
    coeffs: *const [384]i16,
    left_y: *[17]u8,
    left_u: *[9]u8,
    left_v: *[9]u8,
) void {
    // Luma workspace: row 0 holds top-left, 16 above and 4 above-right samples.
    var ws: [17 * luma_stride]u8 = undefined;
    if (mby == 0) {
        @memset(ws[0..luma_stride], 127);
    } else {
        @memcpy(ws[1..17], d.top_y[mbx * 16 ..][0..16]);
        if (mbx + 1 == d.mbw) {
            @memset(ws[17..21], d.top_y[mbx * 16 + 15]);
        } else {
            @memcpy(ws[17..21], d.top_y[mbx * 16 + 16 ..][0..4]);
        }
        ws[0] = if (mbx == 0) 129 else left_y[0];
    }
    for (0..16) |y| ws[(y + 1) * luma_stride] = if (mbx == 0) 129 else left_y[1 + y];
    // Subblocks right of the macroblock reuse the above-right samples.
    for ([_]usize{ 4, 8, 12 }) |y| @memcpy(ws[y * luma_stride + 17 ..][0..4], ws[17..21]);
    if (is_i4x4) {
        for (0..16) |i| {
            const o = (1 + (i / 4) * 4) * luma_stride + 1 + (i % 4) * 4;
            predict_subblock(&ws, o, luma_stride, modes[i]);
            add_transform(coeffs[i * 16 ..][0..16], ws[o..], luma_stride);
        }
    } else {
        predict_block(&ws, luma_stride + 1, luma_stride, 16, ymode, mby != 0, mbx != 0);
        for (0..16) |i| {
            const o = (1 + (i / 4) * 4) * luma_stride + 1 + (i % 4) * 4;
            add_transform(coeffs[i * 16 ..][0..16], ws[o..], luma_stride);
        }
    }
    left_y[0] = ws[16];
    for (0..16) |y| left_y[1 + y] = ws[(y + 1) * luma_stride + 16];
    @memcpy(d.top_y[mbx * 16 ..][0..16], ws[16 * luma_stride + 1 ..][0..16]);
    for (0..16) |y| @memcpy(planes.y[(mby * 16 + y) * planes.y_stride + mbx * 16 ..][0..16], ws[(y + 1) * luma_stride + 1 ..][0..16]);

    inline for (.{ .{ left_u, d.top_u, planes.u, 16 }, .{ left_v, d.top_v, planes.v, 20 } }) |c| {
        const left, const top, const plane, const first_block = c;
        var cws: [9 * chroma_stride]u8 = undefined;
        if (mby == 0) {
            @memset(cws[0..chroma_stride], 127);
        } else {
            @memcpy(cws[1..9], top[mbx * 8 ..][0..8]);
            cws[0] = if (mbx == 0) 129 else left[0];
        }
        for (0..8) |y| cws[(y + 1) * chroma_stride] = if (mbx == 0) 129 else left[1 + y];
        predict_block(&cws, chroma_stride + 1, chroma_stride, 8, uvmode, mby != 0, mbx != 0);
        for (0..4) |i| {
            const o = (1 + (i / 2) * 4) * chroma_stride + 1 + (i % 2) * 4;
            add_transform(coeffs[(first_block + i) * 16 ..][0..16], cws[o..], chroma_stride);
        }
        left[0] = cws[8];
        for (0..8) |y| left[1 + y] = cws[(y + 1) * chroma_stride + 8];
        @memcpy(top[mbx * 8 ..][0..8], cws[8 * chroma_stride + 1 ..][0..8]);
        for (0..8) |y| @memcpy(plane[(mby * 8 + y) * planes.uv_stride + mbx * 8 ..][0..8], cws[(y + 1) * chroma_stride + 1 ..][0..8]);
    }
}

// Loop filter (RFC 6386 section 15, libwebp dsp/dec.c naming).

fn sclip1(v: i32) i32 {
    return std.math.clamp(v, -128, 127);
}

fn sclip2(v: i32) i32 {
    return std.math.clamp(v, -16, 15);
}

const Edge = struct {
    buf: []u8,
    /// Index of q0; p0 is at `at - step`.
    at: usize,
    step: usize,

    inline fn get(e: Edge, comptime k: i32) i32 {
        const i: usize = if (k >= 0) e.at + @as(usize, k) * e.step else e.at - @as(usize, -k) * e.step;
        return e.buf[i];
    }

    inline fn set(e: Edge, comptime k: i32, v: i32) void {
        const i: usize = if (k >= 0) e.at + @as(usize, k) * e.step else e.at - @as(usize, -k) * e.step;
        e.buf[i] = clip_pixel(v);
    }
};

fn absdiff(a: i32, b: i32) i32 {
    return @intCast(@abs(a - b));
}

/// 4|p0-q0| + |p1-q1| <= 2*limit+1.
fn needs_filter(e: Edge, t2: i32) bool {
    return 4 * absdiff(e.get(-1), e.get(0)) + absdiff(e.get(-2), e.get(1)) <= t2;
}

fn needs_filter2(e: Edge, t2: i32, it: i32) bool {
    if (!needs_filter(e, t2)) return false;
    const p3 = e.get(-4);
    const p2 = e.get(-3);
    const p1 = e.get(-2);
    const p0 = e.get(-1);
    const q0 = e.get(0);
    const q1 = e.get(1);
    const q2 = e.get(2);
    const q3 = e.get(3);
    return absdiff(p3, p2) <= it and absdiff(p2, p1) <= it and absdiff(p1, p0) <= it and
        absdiff(q3, q2) <= it and absdiff(q2, q1) <= it and absdiff(q1, q0) <= it;
}

fn hev(e: Edge, thresh: i32) bool {
    return absdiff(e.get(-2), e.get(-1)) > thresh or absdiff(e.get(1), e.get(0)) > thresh;
}

fn do_filter2(e: Edge) void {
    const p1 = e.get(-2);
    const p0 = e.get(-1);
    const q0 = e.get(0);
    const q1 = e.get(1);
    const a = 3 * (q0 - p0) + sclip1(p1 - q1);
    const a1 = sclip2((a + 4) >> 3);
    const a2 = sclip2((a + 3) >> 3);
    e.set(-1, p0 + a2);
    e.set(0, q0 - a1);
}

fn do_filter4(e: Edge) void {
    const p1 = e.get(-2);
    const p0 = e.get(-1);
    const q0 = e.get(0);
    const q1 = e.get(1);
    const a = 3 * (q0 - p0);
    const a1 = sclip2((a + 4) >> 3);
    const a2 = sclip2((a + 3) >> 3);
    const a3 = (a1 + 1) >> 1;
    e.set(-2, p1 + a3);
    e.set(-1, p0 + a2);
    e.set(0, q0 - a1);
    e.set(1, q1 - a3);
}

fn do_filter6(e: Edge) void {
    const p2 = e.get(-3);
    const p1 = e.get(-2);
    const p0 = e.get(-1);
    const q0 = e.get(0);
    const q1 = e.get(1);
    const q2 = e.get(2);
    const a = sclip1(3 * (q0 - p0) + sclip1(p1 - q1));
    const a1 = (27 * a + 63) >> 7;
    const a2 = (18 * a + 63) >> 7;
    const a3 = (9 * a + 63) >> 7;
    e.set(-3, p2 + a3);
    e.set(-2, p1 + a2);
    e.set(-1, p0 + a1);
    e.set(0, q0 - a1);
    e.set(1, q1 - a2);
    e.set(2, q2 - a3);
}

/// Filters `count` positions across one edge. `step` crosses the edge and
/// `along` moves along it.
fn filter_edge(buf: []u8, at: usize, step: usize, along: usize, count: usize, f: MacroblockFilter, comptime kind: enum { simple, macroblock, inner }, limit: i32) void {
    const t2 = 2 * limit + 1;
    for (0..count) |k| {
        const e: Edge = .{ .buf = buf, .at = at + k * along, .step = step };
        switch (kind) {
            .simple => if (needs_filter(e, t2)) do_filter2(e),
            .macroblock => if (needs_filter2(e, t2, f.inner_limit)) {
                if (hev(e, f.hev_threshold)) do_filter2(e) else do_filter6(e);
            },
            .inner => if (needs_filter2(e, t2, f.inner_limit)) {
                if (hev(e, f.hev_threshold)) do_filter2(e) else do_filter4(e);
            },
        }
    }
}

fn loop_filter(planes: *Planes, info_list: []const MacroblockFilter, mbw: usize, mbh: usize, simple: bool) void {
    const ys = planes.y_stride;
    const cs = planes.uv_stride;
    for (0..mbh) |mby| {
        for (0..mbw) |mbx| {
            const f = info_list[mby * mbw + mbx];
            if (f.limit == 0) continue;
            const limit: i32 = f.limit;
            const y0 = mby * 16 * ys + mbx * 16;
            if (simple) {
                if (mbx > 0) filter_edge(planes.y, y0, 1, ys, 16, f, .simple, limit + 4);
                if (f.inner) for ([_]usize{ 4, 8, 12 }) |x| filter_edge(planes.y, y0 + x, 1, ys, 16, f, .simple, limit);
                if (mby > 0) filter_edge(planes.y, y0, ys, 1, 16, f, .simple, limit + 4);
                if (f.inner) for ([_]usize{ 4, 8, 12 }) |y| filter_edge(planes.y, y0 + y * ys, ys, 1, 16, f, .simple, limit);
                continue;
            }
            const c0 = mby * 8 * cs + mbx * 8;
            if (mbx > 0) {
                filter_edge(planes.y, y0, 1, ys, 16, f, .macroblock, limit + 4);
                filter_edge(planes.u, c0, 1, cs, 8, f, .macroblock, limit + 4);
                filter_edge(planes.v, c0, 1, cs, 8, f, .macroblock, limit + 4);
            }
            if (f.inner) {
                for ([_]usize{ 4, 8, 12 }) |x| filter_edge(planes.y, y0 + x, 1, ys, 16, f, .inner, limit);
                filter_edge(planes.u, c0 + 4, 1, cs, 8, f, .inner, limit);
                filter_edge(planes.v, c0 + 4, 1, cs, 8, f, .inner, limit);
            }
            if (mby > 0) {
                filter_edge(planes.y, y0, ys, 1, 16, f, .macroblock, limit + 4);
                filter_edge(planes.u, c0, cs, 1, 8, f, .macroblock, limit + 4);
                filter_edge(planes.v, c0, cs, 1, 8, f, .macroblock, limit + 4);
            }
            if (f.inner) {
                for ([_]usize{ 4, 8, 12 }) |y| filter_edge(planes.y, y0 + y * ys, ys, 1, 16, f, .inner, limit);
                filter_edge(planes.u, c0 + 4 * cs, cs, 1, 8, f, .inner, limit);
                filter_edge(planes.v, c0 + 4 * cs, cs, 1, 8, f, .inner, limit);
            }
        }
    }
}

// ----------------------------------------------------------------------------
// Tests. References are libwebp 1.6.0 decodes made by tools/gen/webp_fixtures.py.

fn expect_reference(comptime name: []const u8, width: u31, height: u31) !void {
    const bytes = @embedFile("testdata/" ++ name ++ ".webp");
    const expected = @embedFile("testdata/" ++ name ++ ".rgba");
    const facts = try info(bytes);
    try std.testing.expectEqual(width, facts.width);
    try std.testing.expectEqual(height, facts.height);
    var image = try decode(std.testing.allocator, bytes, .{});
    defer image.deinit();
    try std.testing.expectEqual(width, image.width);
    try std.testing.expectEqual(height, image.height);
    var mismatches: usize = 0;
    var first: ?usize = null;
    for (image.data, expected) |got, want| {
        if (got != want) {
            if (first == null) first = mismatches;
            mismatches += 1;
        }
    }
    if (mismatches != 0) {
        const at = std.mem.indexOfDiff(u8, image.data, expected).?;
        std.debug.print("{s}: {d} differing bytes, first at pixel {d} channel {d}: got {d} want {d}\n", .{ name, mismatches, at / 4, at % 4, image.data[at], expected[at] });
        return error.TestExpectedEqual;
    }
}

test "VP8L lossless transforms and color cache match libwebp" {
    try expect_reference("webp-lossless", 93, 71);
}

test "VP8L meta prefix codes match libwebp" {
    try expect_reference("webp-lossless-meta", 72, 56);
}

test "VP8L color indexing with bundled indices matches libwebp" {
    try expect_reference("webp-palette", 23, 7);
}

test "VP8 lossy odd dimensions match libwebp fancy upsampling" {
    try expect_reference("webp-lossy", 61, 37);
}

test "VP8 segments, skips, four partitions and simple filter match libwebp" {
    try expect_reference("webp-lossy-simple", 80, 72);
}

test "VP8 eight partitions and strongest normal filter match libwebp" {
    try expect_reference("webp-lossy-strong", 50, 50);
}

test "VP8 with filtered lossless ALPH matches libwebp" {
    try expect_reference("webp-lossy-alpha", 34, 18);
}

test "VP8 with uncompressed ALPH matches libwebp" {
    try expect_reference("webp-lossy-alpha-raw", 17, 9);
}

test "animated WebP returns the first frame only" {
    try expect_reference("webp-animated", 20, 12);
    const facts = try info(@embedFile("testdata/webp-animated.webp"));
    try std.testing.expect(facts.animated);
    try std.testing.expectEqual(@as(u32, 2), facts.frame_count);
}

test "WebP rejects truncated and corrupt input without leaking" {
    const sources = [_][]const u8{
        @embedFile("testdata/webp-lossless.webp"),
        @embedFile("testdata/webp-lossy.webp"),
        @embedFile("testdata/webp-lossy-alpha.webp"),
    };
    for (sources) |source| {
        var cut: usize = 0;
        while (cut < source.len) : (cut += 7) {
            if (decode(std.testing.allocator, source[0..cut], .{})) |image| {
                var owned = image;
                owned.deinit();
            } else |_| {}
        }
        var buf: [16384]u8 = undefined;
        const copy = buf[0..source.len];
        var prng = std.Random.DefaultPrng.init(source.len);
        for (0..64) |_| {
            @memcpy(copy, source);
            for (0..4) |_| copy[20 + prng.random().uintLessThan(usize, source.len - 20)] ^= prng.random().int(u8) | 1;
            if (decode(std.testing.allocator, copy, .{})) |image| {
                var owned = image;
                owned.deinit();
            } else |_| {}
        }
    }
}

test "WebP allocation failures release every owned buffer" {
    const sources = [_][]const u8{
        @embedFile("testdata/webp-lossless.webp"),
        @embedFile("testdata/webp-lossy-alpha.webp"),
    };
    for (sources) |source| {
        try std.testing.checkAllAllocationFailures(std.testing.allocator, struct {
            fn run(a: std.mem.Allocator, bytes: []const u8) !void {
                var image = try decode(a, bytes, .{});
                image.deinit();
            }
        }.run, .{source});
    }
}
