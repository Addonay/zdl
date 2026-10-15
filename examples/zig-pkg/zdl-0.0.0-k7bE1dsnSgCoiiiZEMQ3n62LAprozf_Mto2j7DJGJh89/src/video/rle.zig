//! Run-length encoded surfaces for colorkey and per-pixel-alpha blitting.
//! Altered native port of SDL_RLEaccel.c. The encoded bytes follow SDL's
//! format so the same streams can be reasoned about against the reference; the
//! owner is an explicit `Encoded` value with its own allocator, not a surface
//! field.
//!
//! Colorkey streams (`Kind.colorkey`): segments `<skip> <run> <pixels>` with
//! 8-bit counts for one- to three-byte pixels and 16-bit counts for four-byte
//! pixels. Pixels are raw destination-format bytes. A `<0,0>` pair at the
//! start of a line terminates the stream; trailing blank lines are dropped.
//!
//! Alpha streams (`Kind.alpha`) are encoded per line in two sections:
//! opaque pixels in the target format (8-bit counts for 16-bit targets, 16-bit
//! counts for 32-bit targets), then zero padding to a 4-byte boundary, then
//! translucent pixels as 32-bit words with 16-bit counts. A 32-bit translucent
//! word holds the target RGB with alpha in bits 24..31. A 16-bit word stores
//! green in bits 16..26 and five alpha bits in bits 5..9, as in SDL_RLEaccel.c.
//! Supported targets: 32-bit packed formats whose RGB masks cover 0x00ffffff,
//! and 16-bit RGB565 or RGB555 masks.
//!
//! Deliberate differences from SDL:
//! - Counts and words are little-endian, so streams are not host-order
//!   dependent. SDL uses host order.
//! - `Encoded` keeps the target `pixels.Format` next to the data instead of
//!   prefixing the stream with SDL's `SDL_PixelFormat` word.
//! - Per-surface alpha and color modulation are not part of the encoding.
//!   Callers that need them use the scalar blitter in `surface.zig`.
//! - Clipping is per pixel against both rectangles. SDL's separate clip
//!   blitters are not needed.
const std = @import("std");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const geometry = @import("geometry.zig");

pub const Error = pixels.Error || surface.Error || std.mem.Allocator.Error || geometry.GeometryError || error{ UnsupportedFormat, FormatMismatch, InvalidRle };

/// Encoding flavor.
pub const Kind = enum { colorkey, alpha };

/// Colorkey value. `pixel` holds the key's raw little-endian storage bits.
/// Bits set in `ignored` (SDL: the alpha bits) are excluded from comparison.
pub const Key = struct {
    pixel: u32,
    ignored: u32 = 0,
};

/// Owned encoded stream plus the target format and dimensions it was built for.
pub const Encoded = struct {
    allocator: std.mem.Allocator,
    kind: Kind,
    format: pixels.Format,
    width: u31,
    height: u31,
    data: []u8,

    /// Frees the stream with the allocator used to encode it.
    pub fn deinit(self: *Encoded) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }

    /// Bytes per pixel of the target raster: 1 to 4 for colorkey, 2 or 4 for alpha.
    pub fn bytes_per_pixel(self: Encoded) usize {
        return self.format.bits_per_pixel() / 8;
    }

    /// Blits the source rectangle `source` (in encoded-surface coordinates) with
    /// its top-left at `position` in `destination`. Both rectangles are clipped;
    /// nothing outside either is touched. The destination format must equal the
    /// format the stream was encoded for.
    pub fn blit(self: Encoded, destination: surface.View, source: geometry.Rect(i32), position: geometry.Point(i32)) Error!void {
        if (!std.meta.eql(destination.format, self.format)) return error.FormatMismatch;
        const bounds: geometry.Rect(i32) = .{ .x = 0, .y = 0, .width = self.width, .height = self.height };
        const region = (try bounds.intersection(source)) orelse return;
        const origin: geometry.Point(i32) = .{
            .x = position.x + (region.x - source.x),
            .y = position.y + (region.y - source.y),
        };
        var blitter: Blitter = .{ .encoded = self, .destination = destination, .region = region, .origin = origin, .pos = 0 };
        switch (self.kind) {
            .colorkey => try blitter.colorkey(),
            .alpha => try blitter.alpha(),
        }
    }
};

/// Encodes a byte-aligned surface for colorkey blitting. Pixels whose raw bits
/// equal `key` (ignoring `key.ignored`) are transparent. The result owns its
/// bytes and targets the source format.
pub fn encode_colorkey(allocator: std.mem.Allocator, source: surface.View, key: Key) Error!Encoded {
    const bits = source.format.bits_per_pixel();
    if (bits < 8 or bits % 8 != 0 or bits > 32) return error.UnsupportedFormat;
    const bpp = bits / 8;
    const maximum_run: usize = if (bpp == 4) 65535 else 255;
    const compare_mask = ~key.ignored;
    const wanted = key.pixel & compare_mask;
    const width: usize = source.width;

    var list: std.ArrayList(u8) = .empty;
    errdefer list.deinit(allocator);
    var last_line: usize = 0;

    for (0..source.height) |y| {
        const row = try source.row(y);
        var blank = false;
        var x: usize = 0;
        // Runs out one segment group per iteration; the body always runs once so
        // an empty line still records its transparent skip, as SDL does.
        while (true) {
            const skip_start = x;
            while (x < width and (raw_pixel(row, x, bpp) & compare_mask) == wanted) x += 1;
            const run_start = x;
            while (x < width and (raw_pixel(row, x, bpp) & compare_mask) != wanted) x += 1;
            var skip = run_start - skip_start;
            if (skip == width) blank = true;
            var run = x - run_start;
            while (skip > maximum_run) {
                try add_counts(allocator, &list, bpp == 4, maximum_run, 0);
                skip -= maximum_run;
            }
            var length = @min(run, maximum_run);
            try add_counts(allocator, &list, bpp == 4, skip, length);
            try list.appendSlice(allocator, row[run_start * bpp ..][0 .. length * bpp]);
            var position = run_start + length;
            run -= length;
            while (run > 0) {
                length = @min(run, maximum_run);
                try add_counts(allocator, &list, bpp == 4, 0, length);
                try list.appendSlice(allocator, row[position * bpp ..][0 .. length * bpp]);
                position += length;
                run -= length;
            }
            if (!blank) last_line = list.items.len;
            if (x >= width) break;
        }
    }
    list.shrinkRetainingCapacity(last_line);
    try add_counts(allocator, &list, bpp == 4, 0, 0);
    return .{
        .allocator = allocator,
        .kind = .colorkey,
        .format = source.format,
        .width = source.width,
        .height = source.height,
        .data = try list.toOwnedSlice(allocator),
    };
}

/// Encodes a 32-bit RGBA surface for per-pixel-alpha blitting into `target`, a
/// 32-bit RGB word format (RGB masks within 0x00ffffff) or a 16-bit RGB565/RGB555
/// format. Opaque and translucent pixels are separated as SDL does; fully
/// transparent pixels are omitted from both sections.
pub fn encode_alpha(allocator: std.mem.Allocator, source: surface.View, target: pixels.Packed) Error!Encoded {
    if (source.format.bits_per_pixel() != 32) return error.UnsupportedFormat;
    const mode = try target_mode(target);
    const wide_opaque = mode == .rgb32;
    const width: usize = source.width;

    var list: std.ArrayList(u8) = .empty;
    errdefer list.deinit(allocator);
    var last_line: usize = 0;

    for (0..source.height) |y| {
        var blank = false;
        var x: usize = 0;
        // Opaque section.
        while (true) {
            const skip_start = x;
            while (x < width and !try is_opaque(source, y, x)) x += 1;
            const run_start = x;
            while (x < width and try is_opaque(source, y, x)) x += 1;
            var skip = run_start - skip_start;
            if (skip == width) blank = true;
            var run = x - run_start;
            while (skip > 255) {
                try add_counts(allocator, &list, wide_opaque, 255, 0);
                skip -= 255;
            }
            var length = @min(run, 255);
            try add_counts(allocator, &list, wide_opaque, skip, length);
            try append_pixels(allocator, &list, source, y, run_start, length, target, mode, false);
            var position = run_start + length;
            run -= length;
            while (run > 0) {
                length = @min(run, 255);
                try add_counts(allocator, &list, wide_opaque, 0, length);
                try append_pixels(allocator, &list, source, y, position, length, target, mode, false);
                position += length;
                run -= length;
            }
            if (x >= width) break;
        }
        // Keep translucent words 4-byte aligned, as SDL's `dst += (ptr & 2)`.
        if (list.items.len & 2 != 0) try list.appendSlice(allocator, &[_]u8{ 0, 0 });
        // Translucent section.
        x = 0;
        while (true) {
            const skip_start = x;
            while (x < width and !try is_translucent(source, y, x)) x += 1;
            const run_start = x;
            while (x < width and try is_translucent(source, y, x)) x += 1;
            var skip = run_start - skip_start;
            blank = blank and skip == width;
            var run = x - run_start;
            while (skip > 65535) {
                try add_word_counts(allocator, &list, 65535, 0);
                skip -= 65535;
            }
            var length = @min(run, 65535);
            try add_word_counts(allocator, &list, skip, length);
            try append_pixels(allocator, &list, source, y, run_start, length, target, mode, true);
            var position = run_start + length;
            run -= length;
            while (run > 0) {
                length = @min(run, 65535);
                try add_word_counts(allocator, &list, 0, length);
                try append_pixels(allocator, &list, source, y, position, length, target, mode, true);
                position += length;
                run -= length;
            }
            if (!blank) last_line = list.items.len;
            if (x >= width) break;
        }
    }
    list.shrinkRetainingCapacity(last_line);
    try add_counts(allocator, &list, wide_opaque, 0, 0);
    return .{
        .allocator = allocator,
        .kind = .alpha,
        .format = .{ .masked = target },
        .width = source.width,
        .height = source.height,
        .data = try list.toOwnedSlice(allocator),
    };
}

const TargetMode = enum { rgb32, rgb565, rgb555 };

/// Chooses the translucent word layout from the target masks, as SDL does.
fn target_mode(target: pixels.Packed) Error!TargetMode {
    const masks = [3]u32{ target.channels[0].mask, target.channels[1].mask, target.channels[2].mask };
    const union_mask = masks[0] | masks[1] | masks[2];
    if (target.channels[3].mask != 0) return error.UnsupportedFormat;
    switch (target.storage_bytes) {
        4 => {
            if (union_mask != 0x00ffffff) return error.UnsupportedFormat;
            return .rgb32;
        },
        2 => {
            if (union_mask == 0xffff and (masks[1] == 0x07e0 or masks[0] == 0x07e0 or masks[2] == 0x07e0)) return .rgb565;
            if (union_mask == 0x7fff and (masks[1] == 0x03e0 or masks[0] == 0x03e0 or masks[2] == 0x03e0)) return .rgb555;
            return error.UnsupportedFormat;
        },
        else => return error.UnsupportedFormat,
    }
}

fn alpha_at(source: surface.View, y: usize, x: usize) Error!u8 {
    return (try source.read(x, y)).a;
}

fn is_opaque(source: surface.View, y: usize, x: usize) Error!bool {
    return (try alpha_at(source, y, x)) == 255;
}

fn is_translucent(source: surface.View, y: usize, x: usize) Error!bool {
    const a = try alpha_at(source, y, x);
    return a >= 1 and a <= 254;
}

/// Storage value of the raw pixel at `x` as a little-endian integer.
fn raw_pixel(row: []const u8, x: usize, bpp: usize) u32 {
    var value: u32 = 0;
    for (row[x * bpp ..][0..bpp], 0..) |byte, i| value |= @as(u32, byte) << @as(u5, @intCast(8 * i));
    return value;
}

/// Writes one `<skip> <run>` pair: 8-bit counts, or 16-bit counts when `wide`.
fn add_counts(allocator: std.mem.Allocator, list: *std.ArrayList(u8), wide: bool, skip: usize, run: usize) !void {
    if (wide) {
        var bytes: [4]u8 = undefined;
        std.mem.writeInt(u16, bytes[0..2], @intCast(skip), .little);
        std.mem.writeInt(u16, bytes[2..4], @intCast(run), .little);
        try list.appendSlice(allocator, &bytes);
    } else {
        try list.appendSlice(allocator, &[_]u8{ @intCast(skip), @intCast(run) });
    }
}

/// Writes one 16-bit `<skip> <run>` pair (translucent sections).
fn add_word_counts(allocator: std.mem.Allocator, list: *std.ArrayList(u8), skip: usize, run: usize) !void {
    var bytes: [4]u8 = undefined;
    std.mem.writeInt(u16, bytes[0..2], @intCast(skip), .little);
    std.mem.writeInt(u16, bytes[2..4], @intCast(run), .little);
    try list.appendSlice(allocator, &bytes);
}

/// Appends `count` encoded pixels starting at source column `start` of row `y`.
/// Opaque pixels use the target layout (565/555 halfwords or RGB words with
/// alpha 255 in the top byte). Translucent pixels use the 32-bit words of
/// SDL's copy_32, copy_transl_565 and copy_transl_555.
fn append_pixels(allocator: std.mem.Allocator, list: *std.ArrayList(u8), source: surface.View, y: usize, start: usize, count: usize, target: pixels.Packed, mode: TargetMode, translucent: bool) Error!void {
    for (start..start + count) |x| {
        const c = try source.read(x, y);
        const pixel = target.pack(.{ .r = c.r, .g = c.g, .b = c.b, .a = 0 });
        const a: u32 = c.a;
        if (!translucent) {
            if (mode == .rgb32) {
                var bytes: [4]u8 = undefined;
                std.mem.writeInt(u32, &bytes, pixel | (@as(u32, 255) << 24), .little);
                try list.appendSlice(allocator, &bytes);
            } else {
                var bytes: [2]u8 = undefined;
                std.mem.writeInt(u16, &bytes, @intCast(pixel), .little);
                try list.appendSlice(allocator, &bytes);
            }
            continue;
        }
        const word: u32 = switch (mode) {
            .rgb32 => pixel | (a << 24),
            .rgb565 => ((pixel & 0x7e0) << 16) | (pixel & 0xf81f) | ((a << 2) & 0x7e0),
            .rgb555 => ((pixel & 0x3e0) << 16) | (pixel & 0xfc1f) | ((a << 2) & 0x3e0),
        };
        var bytes: [4]u8 = undefined;
        std.mem.writeInt(u32, &bytes, word, .little);
        try list.appendSlice(allocator, &bytes);
    }
}

/// Blit state for one call. Walks the stream once, from the first row.
const Blitter = struct {
    encoded: Encoded,
    destination: surface.View,
    /// Clipped source rectangle, in encoded-surface coordinates.
    region: geometry.Rect(i32),
    /// Destination coordinates of `region`'s top-left pixel.
    origin: geometry.Point(i32),
    /// Byte offset of the next unread stream byte.
    pos: usize,

    const Count = struct { skip: usize, run: usize };

    fn read_count(self: *Blitter, wide: bool) Error!Count {
        const size: usize = if (wide) 4 else 2;
        if (self.pos + size > self.encoded.data.len) return error.InvalidRle;
        const d = self.encoded.data[self.pos..];
        self.pos += size;
        if (wide) return .{ .skip = std.mem.readInt(u16, d[0..2], .little), .run = std.mem.readInt(u16, d[2..4], .little) };
        return .{ .skip = d[0], .run = d[1] };
    }

    const Span = struct { row: usize, column: usize, first: usize, length: usize };

    /// Destination placement of the source pixels `[start, start+count)` on
    /// source row `y`, clipped to the region and the destination. Null when none
    /// of them is visible.
    fn clip(self: Blitter, y: usize, start: usize, count: usize) ?Span {
        const sy: i64 = @intCast(y);
        const top: i64 = self.region.y;
        if (sy < top or sy >= top + self.region.height) return null;
        const dy = @as(i64, self.origin.y) + (sy - top);
        if (dy < 0 or dy >= self.destination.height) return null;
        const left: i64 = self.region.x;
        var sx0 = @max(@as(i64, @intCast(start)), left);
        var sx1 = @min(@as(i64, @intCast(start + count)), left + self.region.width);
        if (sx0 >= sx1) return null;
        var dx0 = @as(i64, self.origin.x) + (sx0 - left);
        if (dx0 < 0) {
            sx0 -= dx0;
            dx0 = 0;
        }
        const dx1 = @min(@as(i64, self.origin.x) + (sx1 - left), @as(i64, self.destination.width));
        if (dx0 >= dx1) return null;
        sx1 = sx0 + (dx1 - dx0);
        return .{
            .row = @intCast(dy),
            .column = @intCast(dx0),
            .first = @intCast(sx0 - @as(i64, @intCast(start))),
            .length = @intCast(sx1 - sx0),
        };
    }

    fn colorkey(self: *Blitter) Error!void {
        const bpp = self.encoded.bytes_per_pixel();
        const width: usize = self.encoded.width;
        const end: usize = @intCast(self.region.y + self.region.height);
        for (0..end) |y| {
            var ofs: usize = 0;
            while (true) {
                const count = try self.read_count(bpp == 4);
                ofs += count.skip;
                if (count.run != 0) {
                    try self.copy_opaque(y, ofs, count.run, bpp);
                    ofs += count.run;
                } else if (ofs == 0) {
                    return;
                }
                if (ofs >= width) break;
            }
        }
    }

    /// Copies `count` raw target pixels from the stream at `pos`, then advances past them.
    fn copy_opaque(self: *Blitter, y: usize, start: usize, count: usize, bpp: usize) Error!void {
        const bytes = count * bpp;
        if (self.pos + bytes > self.encoded.data.len) return error.InvalidRle;
        defer self.pos += bytes;
        if (y < self.region.y) return;
        const span = self.clip(y, start, count) orelse return;
        const row = try self.destination.row(span.row);
        const from = self.pos + span.first * bpp;
        @memcpy(row[span.column * bpp ..][0 .. span.length * bpp], self.encoded.data[from..][0 .. span.length * bpp]);
    }

    fn alpha(self: *Blitter) Error!void {
        const target = self.encoded.format.masked;
        const mode = try target_mode(target);
        const bpp = self.encoded.bytes_per_pixel();
        const width: usize = self.encoded.width;
        const end: usize = @intCast(self.region.y + self.region.height);
        for (0..end) |y| {
            // Opaque section. A <0,0> pair at the start of a line ends the stream.
            var ofs: usize = 0;
            while (true) {
                const count = try self.read_count(mode == .rgb32);
                ofs += count.skip;
                if (count.run != 0) {
                    try self.copy_opaque(y, ofs, count.run, bpp);
                    ofs += count.run;
                } else if (ofs == 0) {
                    return;
                }
                if (ofs >= width) break;
            }
            if (bpp == 2 and self.pos & 2 != 0) self.pos += 2;
            // Translucent section.
            ofs = 0;
            while (true) {
                const count = try self.read_count(true);
                ofs += count.skip;
                if (count.run != 0) {
                    try self.blend_run(y, ofs, count.run, mode);
                    ofs += count.run;
                }
                if (ofs >= width) break;
            }
        }
    }

    /// Blends `count` translucent words from the stream into the destination.
    fn blend_run(self: *Blitter, y: usize, start: usize, count: usize, mode: TargetMode) Error!void {
        const bytes = count * 4;
        if (self.pos + bytes > self.encoded.data.len) return error.InvalidRle;
        defer self.pos += bytes;
        if (y < self.region.y) return;
        const span = self.clip(y, start, count) orelse return;
        const row = try self.destination.row(span.row);
        const bpp: usize = if (mode == .rgb32) 4 else 2;
        for (0..span.length) |i| {
            const word_at = self.pos + (span.first + i) * 4;
            const s = std.mem.readInt(u32, self.encoded.data[word_at..][0..4], .little);
            const at = (span.column + i) * bpp;
            switch (mode) {
                .rgb32 => {
                    const d = std.mem.readInt(u32, row[at..][0..4], .little);
                    std.mem.writeInt(u32, row[at..][0..4], blend_888(s, d), .little);
                },
                .rgb565 => std.mem.writeInt(u16, row[at..][0..2], blend_565(s, std.mem.readInt(u16, row[at..][0..2], .little)), .little),
                .rgb555 => std.mem.writeInt(u16, row[at..][0..2], blend_555(s, std.mem.readInt(u16, row[at..][0..2], .little)), .little),
            }
        }
    }
};

/// SDL's BLIT_TRANSL_888 with wrapping 32-bit arithmetic, alpha in bits 24..31.
/// The destination's high byte is set to 0xff, as SDL does.
pub fn blend_888(s: u32, d: u32) u32 {
    const alpha = s >> 24;
    const s1 = s & 0xff00ff;
    var d1 = d & 0xff00ff;
    d1 = (d1 +% (((s1 -% d1) *% alpha) >> 8)) & 0xff00ff;
    const s2 = s & 0xff00;
    var d2 = d & 0xff00;
    d2 = (d2 +% (((s2 -% d2) *% alpha) >> 8)) & 0xff00;
    return d1 | d2 | 0xff000000;
}

/// SDL's BLIT_TRANSL_565: five alpha bits in 5..9, RGB565 packed as G0RAB words.
pub fn blend_565(s: u32, d_in: u16) u16 {
    const alpha = (s & 0x3e0) >> 5;
    const src = s & 0x07e0f81f;
    var d: u32 = (@as(u32, d_in) | (@as(u32, d_in) << 16)) & 0x07e0f81f;
    d = d +% (((src -% d) *% alpha) >> 5);
    d &= 0x07e0f81f;
    return @truncate(d | (d >> 16));
}

/// SDL's BLIT_TRANSL_555 with the RGB555 field masks.
pub fn blend_555(s: u32, d_in: u16) u16 {
    const alpha = (s & 0x3e0) >> 5;
    const src = s & 0x03e07c1f;
    var d: u32 = (@as(u32, d_in) | (@as(u32, d_in) << 16)) & 0x03e07c1f;
    d = d +% (((src -% d) *% alpha) >> 5);
    d &= 0x03e07c1f;
    return @truncate(d | (d >> 16));
}
