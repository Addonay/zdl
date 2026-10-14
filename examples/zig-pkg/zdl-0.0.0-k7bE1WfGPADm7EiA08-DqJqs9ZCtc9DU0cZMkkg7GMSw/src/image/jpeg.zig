//! Baseline and progressive JPEG decoding over byte slices, ported from the
//! JPEG path of stb_image as SDL builds it (`STBI_ONLY_JPEG`, scalar kernels).
//!
//! Algorithms kept from stb: 9-bit fast Huffman lookup with a slow canonical
//! fallback, the integer AAN-style IDCT with stb's 12-bit fixed-point constants,
//! stb's triangle ("tent") chroma upsamplers, nearest replication for other
//! sampling ratios, the reduced-precision fixed-point YCbCr to RGB conversion,
//! Adobe APP14 CMYK/YCCK handling, and the rule that a marker-parse failure ends
//! decoding with whatever has been decoded so far (stb returns success there).
//!
//! Deliberate differences from stb/SDL:
//! - Input is a borrowed byte slice. There are no I/O callbacks, no thread-local
//!   failure strings and no SIMD kernels; the scalar kernels are the reference
//!   that stb's SSE2/NEON paths are required to match.
//! - Corrupt input returns `error.CorruptJpeg` instead of stb's message string.
//! - The NV12 writer (`decode_nv12`) addresses component samples with the
//!   component's MCU-padded row stride. SDL's copy of stb's `output_jpeg_nv12`
//!   used the unpadded component width for both the luma and chroma row stride,
//!   which reads the wrong samples whenever the width is not a whole MCU multiple.
//!   It also stepped chroma pointers by `1 + (2 - sampling)`, which walks backwards
//!   for 4:1:1-style sampling. Sample positions here are `(2j / h_ratio)` and
//!   `(2i / v_ratio)`, which match stb for ratios 1 and 2 and stay in range otherwise.
//! - Components with an unusual sampling factor only at the first component are
//!   sampled at their own resolution in the NV12 luma copy, not assumed full size.
//! - EXIF orientation is not applied; stb does not apply it either.
// Decoding behavior follows stb_image by Sean Barrett (MIT or public domain,
// see docs/licenses/stb_image.txt), as bundled by upstream SDL.
const std = @import("std");

/// Decoder failures. stb's messages are represented by the error name.
pub const Error = std.mem.Allocator.Error || error{
    /// The bytes do not start with an SOI marker.
    NotJpeg,
    /// Malformed or inconsistent marker segment, scan or entropy data.
    CorruptJpeg,
    /// Valid JPEG features that stb_image rejects, such as 12-bit precision.
    UnsupportedJpeg,
    /// Width or height is zero or exceeds stb's dimension limit.
    ImageTooLarge,
    /// The NV12 target dimensions differ from the JPEG frame.
    SizeMismatch,
    /// An RGB (non-YCbCr) JPEG cannot be written as NV12 without a conversion.
    UnsupportedColor,
    /// NV12 plane storage is too small or its pitch is narrower than a row.
    InvalidBuffer,
};

/// Output channel choice, matching stb's `req_comp` (0 = natural).
pub const Channels = enum {
    /// One channel for grey JPEGs, three for everything else (stb's natural format).
    automatic,
    grey,
    rgb,
    rgba,

    fn count(self: Channels, natural: u8) u8 {
        return switch (self) {
            .automatic => if (natural >= 3) 3 else 1,
            .grey => 1,
            .rgb => 3,
            .rgba => 4,
        };
    }
};

/// Decoded interleaved 8-bit samples. The pixel buffer is owned by the allocator
/// that decoded it; rows are tightly packed with no padding.
pub const Image = struct {
    allocator: std.mem.Allocator,
    width: u31,
    height: u31,
    /// Samples per pixel in `data`: 1 (grey), 3 (RGB) or 4 (RGB with opaque alpha).
    channels: u8,
    data: []u8,

    /// Releases the pixel storage.
    pub fn deinit(self: *Image) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }
};

/// Caller-owned NV12 destination. `y` holds `height` rows of `width` luma bytes
/// at `y_stride`; `uv` holds `ceil(height / 2)` rows of interleaved Cb, Cr pairs
/// at `uv_stride` (at least `2 * ceil(width / 2)` bytes).
pub const Nv12Target = struct {
    width: u31,
    height: u31,
    y: []u8,
    y_stride: usize,
    uv: []u8,
    uv_stride: usize,
};

/// Reports whether `bytes` look like a JPEG, using SDL's `SDL_IsJPG` rule.
///
/// The scan starts at the SOI marker and walks segment lengths up to the first
/// SOS marker (SDL's `FAST_IS_JPEG` configuration), so it does not validate
/// entropy data.
pub fn is_jpeg(bytes: []const u8) bool {
    if (bytes.len < 2 or bytes[0] != 0xff or bytes[1] != 0xd8) return false;
    var pos: usize = 2;
    while (true) {
        if (pos + 2 > bytes.len) return false;
        const m0 = bytes[pos];
        const m1 = bytes[pos + 1];
        pos += 2;
        if (m0 != 0xff) return false;
        if (m1 == 0xff) {
            // Fill byte: re-read the second 0xff as the next marker start.
            pos -= 1;
        } else if (m1 == 0xd9) {
            return true;
        } else if (m1 >= 0xd0 and m1 < 0xd9) {
            // Standalone restart markers carry no length.
        } else {
            if (pos + 2 > bytes.len) return false;
            const size: usize = (@as(usize, bytes[pos]) << 8) | bytes[pos + 1];
            pos += 2;
            const inner_start = pos;
            // SDL seeks by size-2 and rejects seeks outside the stream.
            const target = @as(i64, @intCast(inner_start)) + @as(i64, @intCast(size)) - 2;
            if (target < 0 or target > bytes.len) return false;
            pos = @intCast(target);
            if (m1 == 0xda) return true;
        }
    }
}

/// Decodes a complete JPEG into interleaved 8-bit samples.
///
/// `channels` selects stb's `req_comp`. With `.automatic` a grey image has one
/// channel and a color image has three. A requested grey output from a color
/// image decodes only the luma component.
pub fn decode(allocator: std.mem.Allocator, bytes: []const u8, channels: Channels) Error!Image {
    var decoder = try Decoder.init(allocator, bytes);
    defer decoder.deinit();
    try decoder.decode_header();
    try decoder.decode_scans();
    const n = channels.count(decoder.img_n);
    const width = decoder.img_x;
    const height = decoder.img_y;
    const size = try std.math.mul(usize, try std.math.mul(usize, width, height), n);
    const data = try allocator.alloc(u8, size);
    errdefer allocator.free(data);
    try decoder.write_channels(data, n);
    return .{
        .allocator = allocator,
        .width = @intCast(width),
        .height = @intCast(height),
        .channels = if (n == 1) 1 else if (n == 3) 3 else 4,
        .data = data,
    };
}

/// Decodes a YCbCr JPEG directly into NV12 planes, as SDL's MJPG-to-NV12 path does.
///
/// The target size must match the frame exactly. RGB JPEGs (identified by their
/// component ids or an Adobe transform of 0 without JFIF) are rejected because
/// their samples are not YCbCr.
pub fn decode_nv12(allocator: std.mem.Allocator, bytes: []const u8, target: Nv12Target) Error!void {
    var decoder = try Decoder.init(allocator, bytes);
    defer decoder.deinit();
    try decoder.decode_header();
    try decoder.decode_scans();
    if (target.width != decoder.img_x or target.height != decoder.img_y) return error.SizeMismatch;
    try decoder.write_nv12(target);
}

// Huffman lookup geometry. Codes of at most FAST_BITS bits resolve in one probe.
const fast_bits = 9;
const fast_size = 1 << fast_bits;
const marker_none: u8 = 0xff;
const max_dimension: u32 = 1 << 24;

/// Zigzag-to-natural index map. Entries past 63 repeat 63 so run lengths that
/// overshoot a corrupt block stay in bounds, as stb's table does.
const dezigzag = [79]u8{
    0,  1,  8,  16, 9,  2,  3,  10,
    17, 24, 32, 25, 18, 11, 4,  5,
    12, 19, 26, 33, 40, 48, 41, 34,
    27, 20, 13, 6,  7,  14, 21, 28,
    35, 42, 49, 56, 57, 50, 43, 36,
    29, 22, 15, 23, 30, 37, 44, 51,
    58, 59, 52, 45, 38, 31, 39, 46,
    53, 60, 61, 54, 47, 55, 62, 63,
    63, 63, 63, 63, 63, 63, 63, 63,
    63, 63, 63, 63, 63, 63, 63,
};

/// Adds a signed JPEG coefficient delta to a DC predictor without overflow.
fn mul_short_fits(a: i32, b: u16) bool {
    const factor: i64 = b;
    const product = @as(i64, a) * factor;
    return product >= std.math.minInt(i16) and product <= std.math.maxInt(i16);
}

/// Canonical Huffman table built from the DHT counts (JPEG Annex C).
const Huffman = struct {
    /// Symbol index for codes of at most FAST_BITS bits; 255 means not accelerated.
    fast: [fast_size]u8 = @splat(255),
    code: [256]u16 = @splat(0),
    values: [256]u8 = @splat(0),
    size: [257]u8 = @splat(0),
    /// Largest code of each length, left-aligned to 16 bits; maxcode[17] is a sentinel.
    maxcode: [18]u32 = @splat(0),
    /// Offset from the canonical code index to the symbol index, per length.
    delta: [17]i32 = @splat(0),

    fn build(self: *Huffman, counts: *const [16]u8) Error!void {
        var k: usize = 0;
        for (0..16) |i| {
            for (0..counts[i]) |_| {
                self.size[k] = @intCast(i + 1);
                k += 1;
                if (k >= 257) return error.CorruptJpeg;
            }
        }
        self.size[k] = 0;

        var code: u32 = 0;
        k = 0;
        var j: usize = 1;
        while (j <= 16) : (j += 1) {
            self.delta[j] = @as(i32, @intCast(k)) - @as(i32, @intCast(code));
            if (self.size[k] == j) {
                while (self.size[k] == j) : (k += 1) {
                    self.code[k] = @intCast(code);
                    code += 1;
                }
                // The codes of this length must fit in j bits.
                if (code -% 1 >= (@as(u32, 1) << @intCast(j))) return error.CorruptJpeg;
            }
            self.maxcode[j] = code << @intCast(16 - j);
            code <<= 1;
        }
        self.maxcode[17] = 0xffffffff;

        // Fast table: every short code fills the 9-bit prefixes it covers.
        @memset(&self.fast, 255);
        for (0..k) |i| {
            const s = self.size[i];
            if (s <= fast_bits) {
                const c = @as(usize, self.code[i]) << @intCast(fast_bits - s);
                const m = @as(usize, 1) << @intCast(fast_bits - s);
                for (0..m) |offset| self.fast[c + offset] = @intCast(i);
            }
        }
    }
};

const Component = struct {
    id: u8 = 0,
    /// Horizontal and vertical sampling factors.
    h: u8 = 0,
    v: u8 = 0,
    tq: u8 = 0,
    hd: u8 = 0,
    ha: u8 = 0,
    dc_pred: i32 = 0,
    /// Component sample dimensions, rounded up from the image size.
    x: usize = 0,
    y: usize = 0,
    /// MCU-padded row stride and row count of `data`.
    w2: usize = 0,
    h2: usize = 0,
    /// Decoded samples, `w2 * h2` bytes, row-major.
    data: []u8 = &.{},
    /// Progressive coefficients in natural order, 64 per 8x8 block.
    coeff: []i16 = &.{},
    coeff_w: usize = 0,
    /// Scratch row for upsampling output.
    linebuf: []u8 = &.{},
};

/// Upsampling kernel chosen from the horizontal and vertical sampling ratios.
const Resampler = enum { one, v2, h2, hv2, generic };

/// Per-component upsampling cursor. `line0`/`line1` are offsets into the
/// component's sample plane for the rows currently being blended.
const Resample = struct {
    kernel: Resampler,
    hs: usize,
    vs: usize,
    w_lores: usize,
    ystep: usize = 0,
    ypos: usize = 0,
    line0: usize = 0,
    line1: usize = 0,
};

const Decoder = struct {
    allocator: std.mem.Allocator,
    data: []const u8,
    pos: usize = 0,

    img_x: u32 = 0,
    img_y: u32 = 0,
    img_n: u8 = 0,

    huff_dc: [4]Huffman = .{ .{}, .{}, .{}, .{} },
    huff_ac: [4]Huffman = .{ .{}, .{}, .{}, .{} },
    dequant: [4][64]u16 = std.mem.zeroes([4][64]u16),
    fast_ac: [4][fast_size]i16 = std.mem.zeroes([4][fast_size]i16),

    img_h_max: usize = 1,
    img_v_max: usize = 1,
    img_mcu_x: usize = 0,
    img_mcu_y: usize = 0,
    comp: [4]Component = .{ .{}, .{}, .{}, .{} },

    code_buffer: u32 = 0,
    code_bits: i32 = 0,
    marker: u8 = marker_none,
    nomore: bool = false,
    progressive: bool = false,
    spec_start: usize = 0,
    spec_end: usize = 0,
    succ_high: u5 = 0,
    succ_low: u5 = 0,
    eob_run: i32 = 0,
    jfif: bool = false,
    /// Adobe APP14 transform flag: 0 CMYK/RGB, 1 YCbCr, 2 YCCK, -1 absent.
    app14_color_transform: i32 = -1,
    /// Number of components whose ids are 'R', 'G', 'B' in order.
    rgb: u8 = 0,
    scan_n: u8 = 0,
    order: [4]usize = .{ 0, 0, 0, 0 },
    restart_interval: u32 = 0,
    todo: i32 = 0,

    fn init(allocator: std.mem.Allocator, bytes: []const u8) Error!Decoder {
        if (bytes.len < 2 or bytes[0] != 0xff or bytes[1] != 0xd8) return error.NotJpeg;
        return .{ .allocator = allocator, .data = bytes };
    }

    fn deinit(self: *Decoder) void {
        for (&self.comp) |*c| {
            if (c.data.len != 0) self.allocator.free(c.data);
            if (c.coeff.len != 0) self.allocator.free(c.coeff);
            if (c.linebuf.len != 0) self.allocator.free(c.linebuf);
            c.* = .{};
        }
    }

    // Byte reader. Reads past the end return zero and do not advance, as stb's
    // memory context does, so truncated data drives the decoder to a corrupt-data
    // error or a clean early stop rather than out-of-bounds access.

    fn get8(self: *Decoder) u8 {
        if (self.pos < self.data.len) {
            const value = self.data[self.pos];
            self.pos += 1;
            return value;
        }
        return 0;
    }

    fn get16be(self: *Decoder) u16 {
        const high = self.get8();
        return (@as(u16, high) << 8) | self.get8();
    }

    fn at_eof(self: *const Decoder) bool {
        return self.pos >= self.data.len;
    }

    fn skip(self: *Decoder, n: i64) void {
        if (n == 0) return;
        if (n < 0) {
            self.pos = self.data.len;
            return;
        }
        self.pos = @intCast(@min(@as(u64, self.data.len), @as(u64, self.pos) + @as(u64, @intCast(n))));
    }

    // Entropy-coded bit reader. code_buffer holds the next bits left-aligned in
    // 32 bits; code_bits counts the valid bits. A marker encountered while
    // filling sets `marker`, and `nomore` makes the reader return zero bits.

    fn grow_buffer_unsafe(self: *Decoder) void {
        while (true) {
            var b: u32 = if (self.nomore) 0 else self.get8();
            if (b == 0xff) {
                var c = self.get8();
                while (c == 0xff) c = self.get8(); // consume fill bytes
                if (c != 0) {
                    self.marker = c;
                    self.nomore = true;
                    return;
                }
            }
            b <<= @intCast(24 - self.code_bits);
            self.code_buffer |= b;
            self.code_bits += 8;
            if (self.code_bits > 24) return;
        }
    }

    fn huff_decode(self: *Decoder, h: *const Huffman) i32 {
        if (self.code_bits < 16) self.grow_buffer_unsafe();
        const c: usize = @intCast((self.code_buffer >> (32 - fast_bits)) & (fast_size - 1));
        const k = h.fast[c];
        if (k < 255) {
            const s: i32 = h.size[k];
            if (s > self.code_bits) return -1;
            self.code_buffer <<= @intCast(s);
            self.code_bits -= s;
            return h.values[k];
        }
        // Slow path: find the code length whose left-aligned maximum exceeds the bits.
        const temp = self.code_buffer >> 16;
        var k2: usize = fast_bits + 1;
        while (k2 < 17) : (k2 += 1) {
            if (temp < h.maxcode[k2]) break;
        }
        if (k2 == 17) {
            self.code_bits -= 16;
            return -1;
        }
        if (k2 > self.code_bits) return -1;
        const bits: u32 = (self.code_buffer >> @intCast(32 - k2)) & ((@as(u32, 1) << @intCast(k2)) - 1);
        const index = @as(i64, bits) + h.delta[k2];
        if (index < 0 or index >= 256) return -1;
        self.code_bits -= @intCast(k2);
        self.code_buffer <<= @intCast(k2);
        return h.values[@intCast(index)];
    }

    /// Reads an n-bit magnitude and sign-extends it per JPEG's receive/extend rule.
    fn extend_receive(self: *Decoder, n: u5) i32 {
        if (self.code_bits < n) self.grow_buffer_unsafe();
        if (self.code_bits < n) return 0; // out of data: stb returns zeros
        const sgn: u32 = self.code_buffer >> 31;
        var k = std.math.rotl(u32, self.code_buffer, n);
        const mask = (@as(u32, 1) << n) - 1;
        self.code_buffer = k & ~mask;
        k &= mask;
        self.code_bits -= n;
        // Negative values (sign bit set) are used as-is; positive ones get the bias.
        const bias: i32 = if (sgn == 1) 0 else -@as(i32, @intCast(mask));
        return @as(i32, @intCast(k)) + bias;
    }

    fn get_bits(self: *Decoder, n: u5) u32 {
        if (self.code_bits < n) self.grow_buffer_unsafe();
        if (self.code_bits < n) return 0;
        var k = std.math.rotl(u32, self.code_buffer, n);
        const mask = (@as(u32, 1) << n) - 1;
        self.code_buffer = k & ~mask;
        k &= mask;
        self.code_bits -= n;
        return k;
    }

    fn get_bit(self: *Decoder) bool {
        if (self.code_bits < 1) self.grow_buffer_unsafe();
        if (self.code_bits < 1) return false;
        const set = (self.code_buffer & 0x80000000) != 0;
        self.code_buffer <<= 1;
        self.code_bits -= 1;
        return set;
    }

    // Markers and headers.

    fn get_marker(self: *Decoder) u8 {
        if (self.marker != marker_none) {
            const x = self.marker;
            self.marker = marker_none;
            return x;
        }
        var x = self.get8();
        if (x != 0xff) return marker_none;
        while (x == 0xff) x = self.get8(); // consume repeated fill bytes
        return x;
    }

    fn reset(self: *Decoder) void {
        self.code_bits = 0;
        self.code_buffer = 0;
        self.nomore = false;
        for (&self.comp) |*c| c.dc_pred = 0;
        self.marker = marker_none;
        self.todo = if (self.restart_interval != 0) @intCast(self.restart_interval) else 0x7fffffff;
        self.eob_run = 0;
    }

    fn process_frame_header(self: *Decoder) Error!void {
        const lf = self.get16be();
        if (lf < 11) return error.CorruptJpeg;
        const p = self.get8();
        if (p != 8) return error.UnsupportedJpeg;
        const img_y: u32 = self.get16be();
        if (img_y == 0) return error.UnsupportedJpeg; // delayed height (DNL), as stb rejects
        const img_x: u32 = self.get16be();
        if (img_x == 0) return error.CorruptJpeg;
        if (img_y > max_dimension or img_x > max_dimension) return error.ImageTooLarge;
        const c = self.get8();
        if (c != 3 and c != 1 and c != 4) return error.CorruptJpeg;
        self.img_n = c;
        self.img_x = img_x;
        self.img_y = img_y;
        if (lf != 8 + 3 * @as(u32, self.img_n)) return error.CorruptJpeg;

        self.rgb = 0;
        const rgb_ids = [3]u8{ 'R', 'G', 'B' };
        for (0..self.img_n) |i| {
            self.comp[i].id = self.get8();
            if (self.img_n == 3 and self.comp[i].id == rgb_ids[i]) self.rgb += 1;
            const q = self.get8();
            self.comp[i].h = q >> 4;
            if (self.comp[i].h == 0 or self.comp[i].h > 4) return error.CorruptJpeg;
            self.comp[i].v = q & 15;
            if (self.comp[i].v == 0 or self.comp[i].v > 4) return error.CorruptJpeg;
            self.comp[i].tq = self.get8();
            if (self.comp[i].tq > 3) return error.CorruptJpeg;
        }

        // Output-size arithmetic is checked in u64 before any allocation.
        const total = std.math.mul(u64, std.math.mul(u64, img_x, img_y) catch return error.ImageTooLarge, self.img_n) catch return error.ImageTooLarge;
        if (total > std.math.maxInt(usize) / 2) return error.ImageTooLarge;

        var h_max: usize = 1;
        var v_max: usize = 1;
        for (0..self.img_n) |i| {
            h_max = @max(h_max, self.comp[i].h);
            v_max = @max(v_max, self.comp[i].v);
        }
        for (0..self.img_n) |i| {
            if (h_max % self.comp[i].h != 0) return error.CorruptJpeg;
            if (v_max % self.comp[i].v != 0) return error.CorruptJpeg;
        }
        self.img_h_max = h_max;
        self.img_v_max = v_max;
        const mcu_w = h_max * 8;
        const mcu_h = v_max * 8;
        self.img_mcu_x = (img_x + mcu_w - 1) / mcu_w;
        self.img_mcu_y = (img_y + mcu_h - 1) / mcu_h;

        for (0..self.img_n) |i| {
            const comp = &self.comp[i];
            comp.x = (img_x * comp.h + h_max - 1) / h_max;
            comp.y = (img_y * comp.v + v_max - 1) / v_max;
            comp.w2 = self.img_mcu_x * comp.h * 8;
            comp.h2 = self.img_mcu_y * comp.v * 8;
            const samples = comp.w2 * comp.h2;
            comp.data = try self.allocator.alloc(u8, samples);
            @memset(comp.data, 0);
            if (self.progressive) {
                comp.coeff_w = comp.w2 / 8;
                comp.coeff = try self.allocator.alloc(i16, samples);
                @memset(comp.coeff, 0);
            }
        }
    }

    fn process_scan_header(self: *Decoder) Error!void {
        const ls = self.get16be();
        self.scan_n = self.get8();
        if (self.scan_n < 1 or self.scan_n > 4 or self.scan_n > self.img_n) return error.CorruptJpeg;
        if (ls != 6 + 2 * @as(u32, self.scan_n)) return error.CorruptJpeg;
        for (0..self.scan_n) |i| {
            const id = self.get8();
            const q = self.get8();
            var which: usize = 0;
            while (which < self.img_n) : (which += 1) {
                if (self.comp[which].id == id) break;
            }
            if (which == self.img_n) return error.CorruptJpeg;
            self.comp[which].hd = q >> 4;
            if (self.comp[which].hd > 3) return error.CorruptJpeg;
            self.comp[which].ha = q & 15;
            if (self.comp[which].ha > 3) return error.CorruptJpeg;
            self.order[i] = which;
        }
        self.spec_start = self.get8();
        self.spec_end = self.get8(); // usually 63; progressive scans may use less
        const aa = self.get8();
        self.succ_high = @intCast(aa >> 4);
        self.succ_low = @intCast(aa & 15);
        if (self.progressive) {
            if (self.spec_start > 63 or self.spec_end > 63 or self.spec_start > self.spec_end or self.succ_high > 13 or self.succ_low > 13) return error.CorruptJpeg;
        } else {
            if (self.spec_start != 0) return error.CorruptJpeg;
            if (self.succ_high != 0 or self.succ_low != 0) return error.CorruptJpeg;
            self.spec_end = 63;
        }
    }

    fn process_marker(self: *Decoder, m: u8) Error!void {
        if (m == marker_none) return error.CorruptJpeg;
        if (m == 0xdd) { // DRI
            if (self.get16be() != 4) return error.CorruptJpeg;
            self.restart_interval = self.get16be();
            return;
        }
        if (m == 0xdb) { // DQT
            var len: i32 = @as(i32, self.get16be()) - 2;
            while (len > 0) {
                const q = self.get8();
                const p = q >> 4;
                const sixteen = p != 0;
                const t = q & 15;
                if (p != 0 and p != 1) return error.CorruptJpeg;
                if (t > 3) return error.CorruptJpeg;
                for (0..64) |i| {
                    const value: u16 = if (sixteen) self.get16be() else self.get8();
                    self.dequant[t][dezigzag[i]] = value;
                }
                len -= if (sixteen) 129 else 65;
            }
            if (len != 0) return error.CorruptJpeg;
            return;
        }
        if (m == 0xc4) { // DHT
            var len: i32 = @as(i32, self.get16be()) - 2;
            while (len > 0) {
                const q = self.get8();
                const tc = q >> 4;
                const th = q & 15;
                if (tc > 1 or th > 3) return error.CorruptJpeg;
                var sizes: [16]u8 = undefined;
                var n: usize = 0;
                for (0..16) |i| {
                    sizes[i] = self.get8();
                    n += sizes[i];
                }
                if (n > 256) return error.CorruptJpeg;
                len -= 17;
                const table = if (tc == 0) &self.huff_dc[th] else &self.huff_ac[th];
                try table.build(&sizes);
                for (0..n) |i| table.values[i] = self.get8();
                if (tc != 0) build_fast_ac(&self.fast_ac[th], &self.huff_ac[th]);
                len -= @intCast(n);
            }
            if (len != 0) return error.CorruptJpeg;
            return;
        }
        if ((m >= 0xe0 and m <= 0xef) or m == 0xfe) { // APPn and COM
            var len: i32 = @as(i32, self.get16be());
            if (len < 2) return error.CorruptJpeg;
            len -= 2;
            if (m == 0xe0 and len >= 5) { // JFIF
                const tag = "JFIF\x00";
                var ok = true;
                for (tag) |t| {
                    if (self.get8() != t) ok = false;
                }
                len -= 5;
                if (ok) self.jfif = true;
            } else if (m == 0xee and len >= 12) { // Adobe
                const tag = "Adobe\x00";
                var ok = true;
                for (tag) |t| {
                    if (self.get8() != t) ok = false;
                }
                len -= 6;
                if (ok) {
                    _ = self.get8(); // version
                    _ = self.get16be(); // flags0
                    _ = self.get16be(); // flags1
                    self.app14_color_transform = self.get8();
                    len -= 6;
                }
            }
            self.skip(len);
            return;
        }
        return error.CorruptJpeg;
    }

    fn decode_header(self: *Decoder) Error!void {
        self.jfif = false;
        self.app14_color_transform = -1;
        self.marker = marker_none;
        var m = self.get_marker();
        if (m != 0xd8) return error.NotJpeg;
        m = self.get_marker();
        while (!is_sof(m)) {
            try self.process_marker(m);
            m = self.get_marker();
            while (m == marker_none) {
                if (self.at_eof()) return error.CorruptJpeg;
                m = self.get_marker();
            }
        }
        self.progressive = m == 0xc2;
        try self.process_frame_header();
    }

    /// Walks the remaining markers, decoding every scan. A marker-segment failure
    /// stops decoding successfully with the samples decoded so far, matching stb.
    /// Progressive coefficients are only transformed when the walk reaches EOI.
    fn decode_scans(self: *Decoder) Error!void {
        var m = self.get_marker();
        while (m != 0xd9) {
            if (m == 0xda) { // SOS
                try self.process_scan_header();
                try self.parse_entropy_coded_data();
                if (self.marker == marker_none) self.marker = self.skip_junk_at_end();
                m = self.get_marker();
                if (is_restart(m)) m = self.get_marker();
            } else if (m == 0xdc) { // DNL
                const ld = self.get16be();
                const nl: u32 = self.get16be();
                if (ld != 4) return error.CorruptJpeg;
                if (nl != self.img_y) return error.CorruptJpeg;
                m = self.get_marker();
            } else {
                self.process_marker(m) catch return;
                m = self.get_marker();
            }
        }
        if (self.progressive) self.finish_progressive();
    }

    fn skip_junk_at_end(self: *Decoder) u8 {
        while (!self.at_eof()) {
            var x = self.get8();
            while (x == 0xff) {
                if (self.at_eof()) return marker_none;
                x = self.get8();
                if (x != 0x00 and x != 0xff) return x;
            }
        }
        return marker_none;
    }

    // Entropy decoding of one scan.

    fn decode_block(self: *Decoder, data: *[64]i16, hdc: *const Huffman, hac: *const Huffman, fac: *const [fast_size]i16, b: usize, dequant: *const [64]u16) Error!void {
        if (self.code_bits < 16) self.grow_buffer_unsafe();
        const t = self.huff_decode(hdc);
        if (t < 0 or t > 15) return error.CorruptJpeg;
        @memset(data, 0);
        const diff: i32 = if (t != 0) self.extend_receive(@intCast(t)) else 0;
        const dc = std.math.add(i32, self.comp[b].dc_pred, diff) catch return error.CorruptJpeg;
        self.comp[b].dc_pred = dc;
        if (!mul_short_fits(dc, dequant[0])) return error.CorruptJpeg;
        data[0] = @intCast(dc * @as(i32, dequant[0]));

        var k: usize = 1;
        while (k < 64) {
            if (self.code_bits < 16) self.grow_buffer_unsafe();
            const c: usize = @intCast((self.code_buffer >> (32 - fast_bits)) & (fast_size - 1));
            const r: i32 = fac[c];
            if (r != 0) { // fast AC: magnitude and run in one probe
                k += @intCast((r >> 4) & 15);
                const s: i32 = r & 15;
                if (s > self.code_bits) return error.CorruptJpeg;
                self.code_buffer <<= @intCast(s);
                self.code_bits -= s;
                const zig = dezigzag[k];
                k += 1;
                data[zig] = @truncate((r >> 8) * @as(i32, dequant[zig]));
            } else {
                const rs = self.huff_decode(hac);
                if (rs < 0) return error.CorruptJpeg;
                const s: u5 = @intCast(rs & 15);
                const run = rs >> 4;
                if (s == 0) {
                    if (rs != 0xf0) break; // end of block
                    k += 16;
                } else {
                    k += @intCast(run);
                    const zig = dezigzag[k];
                    k += 1;
                    const value = self.extend_receive(s);
                    data[zig] = @truncate(value * @as(i32, dequant[zig]));
                }
            }
        }
    }

    fn decode_block_prog_dc(self: *Decoder, data: *[64]i16, hdc: *const Huffman, b: usize) Error!void {
        if (self.spec_end != 0) return error.CorruptJpeg;
        if (self.code_bits < 16) self.grow_buffer_unsafe();
        if (self.succ_high == 0) {
            @memset(data, 0);
            const t = self.huff_decode(hdc);
            if (t < 0 or t > 15) return error.CorruptJpeg;
            const diff: i32 = if (t != 0) self.extend_receive(@intCast(t)) else 0;
            const dc = std.math.add(i32, self.comp[b].dc_pred, diff) catch return error.CorruptJpeg;
            self.comp[b].dc_pred = dc;
            const scale: i32 = @as(i32, 1) << self.succ_low;
            if (!mul_short_fits(dc, @intCast(scale))) return error.CorruptJpeg;
            data[0] = @intCast(dc * scale);
        } else {
            if (self.get_bit()) data[0] +%= @as(i16, 1) << self.succ_low;
        }
    }

    fn decode_block_prog_ac(self: *Decoder, data: *[64]i16, hac: *const Huffman, fac: *const [fast_size]i16) Error!void {
        if (self.spec_start == 0) return error.CorruptJpeg;
        if (self.succ_high == 0) {
            // First AC scan for these coefficients: fresh values, scaled by the point transform.
            const shift: u5 = self.succ_low;
            if (self.eob_run != 0) {
                self.eob_run -= 1;
                return;
            }
            var k = self.spec_start;
            while (k <= self.spec_end) {
                if (self.code_bits < 16) self.grow_buffer_unsafe();
                const c: usize = @intCast((self.code_buffer >> (32 - fast_bits)) & (fast_size - 1));
                const r: i32 = fac[c];
                if (r != 0) {
                    k += @intCast((r >> 4) & 15);
                    const s: i32 = r & 15;
                    if (s > self.code_bits) return error.CorruptJpeg;
                    self.code_buffer <<= @intCast(s);
                    self.code_bits -= s;
                    const zig = dezigzag[k];
                    k += 1;
                    data[zig] = @truncate((r >> 8) * (@as(i32, 1) << shift));
                } else {
                    const rs = self.huff_decode(hac);
                    if (rs < 0) return error.CorruptJpeg;
                    const s: u5 = @intCast(rs & 15);
                    const r2 = rs >> 4;
                    if (s == 0) {
                        if (r2 < 15) {
                            self.eob_run = @as(i32, 1) << @intCast(r2);
                            if (r2 != 0) self.eob_run += @intCast(self.get_bits(@intCast(r2)));
                            self.eob_run -= 1;
                            break;
                        }
                        k += 16;
                    } else {
                        k += @intCast(r2);
                        const zig = dezigzag[k];
                        k += 1;
                        const value = self.extend_receive(s);
                        data[zig] = @truncate(value * (@as(i32, 1) << shift));
                    }
                }
            }
        } else {
            // Refinement scan: correct already-nonzero coefficients by one bit and
            // place newly nonzero coefficients (+/-bit) at the requested run.
            const bit: i16 = @as(i16, 1) << self.succ_low;
            if (self.eob_run != 0) {
                self.eob_run -= 1;
                var k = self.spec_start;
                while (k <= self.spec_end) : (k += 1) {
                    const p = &data[dezigzag[k]];
                    if (p.* != 0) {
                        if (self.get_bit()) {
                            if ((p.* & bit) == 0) {
                                if (p.* > 0) p.* +%= bit else p.* -%= bit;
                            }
                        }
                    }
                }
            } else {
                var k = self.spec_start;
                while (k <= self.spec_end) {
                    const rs = self.huff_decode(hac);
                    if (rs < 0) return error.CorruptJpeg;
                    const s = rs & 15;
                    var r = rs >> 4;
                    var value: i16 = 0;
                    if (s == 0) {
                        if (r < 15) {
                            self.eob_run = @as(i32, 1) << @intCast(r);
                            if (r != 0) self.eob_run += @intCast(self.get_bits(@intCast(r)));
                            r = 64; // force end of block
                        }
                        // r == 15 and s == 0 skips 16 zero-valued coefficients.
                    } else {
                        if (s != 1) return error.CorruptJpeg;
                        value = if (self.get_bit()) bit else -bit;
                    }
                    while (k <= self.spec_end) {
                        const p = &data[dezigzag[k]];
                        k += 1;
                        if (p.* != 0) {
                            if (self.get_bit()) {
                                if ((p.* & bit) == 0) {
                                    if (p.* > 0) p.* +%= bit else p.* -%= bit;
                                }
                            }
                        } else {
                            if (r == 0) {
                                p.* = value;
                                break;
                            }
                            r -= 1;
                        }
                    }
                }
            }
        }
    }

    fn restart_marker(m: u8) bool {
        return m >= 0xd0 and m <= 0xd7;
    }

    fn parse_entropy_coded_data(self: *Decoder) Error!void {
        self.reset();
        if (!self.progressive) {
            if (self.scan_n == 1) {
                const n = self.order[0];
                const w = (self.comp[n].x + 7) >> 3;
                const h = (self.comp[n].y + 7) >> 3;
                var block: [64]i16 = undefined;
                const hd = self.comp[n].hd;
                const ha = self.comp[n].ha;
                const tq = self.comp[n].tq;
                for (0..h) |j| {
                    for (0..w) |i| {
                        try self.decode_block(&block, &self.huff_dc[hd], &self.huff_ac[ha], &self.fast_ac[ha], n, &self.dequant[tq]);
                        const stride = self.comp[n].w2;
                        idct_block(self.comp[n].data[stride * j * 8 + i * 8 ..], stride, &block);
                        if (try self.end_of_restart_interval()) return;
                    }
                }
                return;
            }
            var block: [64]i16 = undefined;
            for (0..self.img_mcu_y) |j| {
                for (0..self.img_mcu_x) |i| {
                    for (0..self.scan_n) |k| {
                        const n = self.order[k];
                        const comp_h = self.comp[n].h;
                        const comp_v = self.comp[n].v;
                        const hd = self.comp[n].hd;
                        const ha = self.comp[n].ha;
                        const tq = self.comp[n].tq;
                        for (0..comp_v) |y| {
                            for (0..comp_h) |x| {
                                const x2 = (i * comp_h + x) * 8;
                                const y2 = (j * comp_v + y) * 8;
                                try self.decode_block(&block, &self.huff_dc[hd], &self.huff_ac[ha], &self.fast_ac[ha], n, &self.dequant[tq]);
                                const stride = self.comp[n].w2;
                                idct_block(self.comp[n].data[stride * y2 + x2 ..], stride, &block);
                            }
                        }
                    }
                    if (try self.end_of_restart_interval()) return;
                }
            }
            return;
        }

        // Progressive scans store coefficients; the IDCT runs after the last scan.
        if (self.scan_n == 1) {
            const n = self.order[0];
            const w = (self.comp[n].x + 7) >> 3;
            const h = (self.comp[n].y + 7) >> 3;
            const hd = self.comp[n].hd;
            const ha = self.comp[n].ha;
            for (0..h) |j| {
                for (0..w) |i| {
                    const block = self.coeff_block(n, i, j);
                    if (self.spec_start == 0) {
                        try self.decode_block_prog_dc(block, &self.huff_dc[hd], n);
                    } else {
                        try self.decode_block_prog_ac(block, &self.huff_ac[ha], &self.fast_ac[ha]);
                    }
                    if (try self.end_of_restart_interval()) return;
                }
            }
            return;
        }
        for (0..self.img_mcu_y) |j| {
            for (0..self.img_mcu_x) |i| {
                for (0..self.scan_n) |k| {
                    const n = self.order[k];
                    const comp_h = self.comp[n].h;
                    const comp_v = self.comp[n].v;
                    const hd = self.comp[n].hd;
                    for (0..comp_v) |y| {
                        for (0..comp_h) |x| {
                            const block = self.coeff_block(n, i * comp_h + x, j * comp_v + y);
                            try self.decode_block_prog_dc(block, &self.huff_dc[hd], n);
                        }
                    }
                }
                if (try self.end_of_restart_interval()) return;
            }
        }
    }

    fn coeff_block(self: *Decoder, n: usize, bx: usize, by: usize) *[64]i16 {
        const offset = 64 * (bx + by * self.comp[n].coeff_w);
        return @ptrCast(self.comp[n].coeff[offset..][0..64]);
    }

    /// Counts a decoded MCU toward the restart interval. Returns true when the
    /// scan must stop early (an unexpected marker, or the end of the data).
    fn end_of_restart_interval(self: *Decoder) Error!bool {
        self.todo -= 1;
        if (self.todo > 0) return false;
        if (self.code_bits < 24) self.grow_buffer_unsafe();
        if (!restart_marker(self.marker)) return true;
        self.reset();
        return false;
    }

    fn finish_progressive(self: *Decoder) void {
        for (0..self.img_n) |n| {
            const w = (self.comp[n].x + 7) >> 3;
            const h = (self.comp[n].y + 7) >> 3;
            const quant = &self.dequant[self.comp[n].tq];
            for (0..h) |j| {
                for (0..w) |i| {
                    const block = self.coeff_block(n, i, j);
                    for (block, quant) |*value, q| value.* = @truncate(@as(i32, value.*) * @as(i32, q));
                    const stride = self.comp[n].w2;
                    idct_block(self.comp[n].data[stride * j * 8 + i * 8 ..], stride, block);
                }
            }
        }
    }

    // Output.

    fn ensure_linebuf(self: *Decoder, k: usize) Error!void {
        if (self.comp[k].linebuf.len == 0) {
            self.comp[k].linebuf = try self.allocator.alloc(u8, self.img_x + 3);
        }
    }

    /// Writes interleaved samples with `n` channels, upsampling chroma per row.
    fn write_channels(self: *Decoder, out_all: []u8, n: u8) Error!void {
        const img_n = self.img_n;
        const decode_n: u8 = if (img_n == 3 and n < 3 and !self.is_rgb()) 1 else img_n;
        const width: usize = self.img_x;
        const height: usize = self.img_y;
        var resample: [4]Resample = undefined;
        for (0..decode_n) |k| {
            try self.ensure_linebuf(k);
            const hs = self.img_h_max / self.comp[k].h;
            const vs = self.img_v_max / self.comp[k].v;
            resample[k] = .{
                .kernel = if (hs == 1 and vs == 1) .one else if (hs == 1 and vs == 2) .v2 else if (hs == 2 and vs == 1) .h2 else if (hs == 2 and vs == 2) .hv2 else .generic,
                .hs = hs,
                .vs = vs,
                .w_lores = (width + hs - 1) / hs,
            };
        }

        const is_rgb_color = self.is_rgb();
        for (0..height) |j| {
            const out = out_all[n * width * j ..][0 .. n * width];
            var coutput: [4][]const u8 = .{ &.{}, &.{}, &.{}, &.{} };
            for (0..decode_n) |k| {
                const r = &resample[k];
                const y_bot = r.ystep >= (r.vs >> 1);
                const near_off = if (y_bot) r.line1 else r.line0;
                const far_off = if (y_bot) r.line0 else r.line1;
                const plane = self.comp[k].data;
                coutput[k] = resample_row(r.kernel, self.comp[k].linebuf, plane[near_off..], plane[far_off..], r.w_lores, r.hs);
                r.ystep += 1;
                if (r.ystep >= r.vs) {
                    r.ystep = 0;
                    r.line0 = r.line1;
                    r.ypos += 1;
                    if (r.ypos < self.comp[k].y) r.line1 += self.comp[k].w2;
                }
            }
            self.emit_row(out, n, &coutput, decode_n, is_rgb_color);
        }
    }

    fn is_rgb(self: *const Decoder) bool {
        return self.img_n == 3 and (self.rgb == 3 or (self.app14_color_transform == 0 and !self.jfif));
    }

    /// Converts one row of upsampled component rows to `n` output channels.
    fn emit_row(self: *const Decoder, out: []u8, n: u8, coutput: *const [4][]const u8, decode_n: u8, is_rgb_color: bool) void {
        _ = decode_n;
        const width: usize = self.img_x;
        const count = n;
        if (count >= 3) {
            const y = coutput[0];
            if (self.img_n == 3) {
                if (is_rgb_color) {
                    for (0..width) |i| {
                        out[i * count + 0] = y[i];
                        out[i * count + 1] = coutput[1][i];
                        out[i * count + 2] = coutput[2][i];
                        if (count == 4) out[i * count + 3] = 255;
                    }
                } else {
                    ycbcr_to_rgb_row(out, y, coutput[1], coutput[2], width, count);
                }
            } else if (self.img_n == 4) {
                if (self.app14_color_transform == 0) { // CMYK
                    for (0..width) |i| {
                        const m = coutput[3][i];
                        out[i * count + 0] = blinn_8x8(coutput[0][i], m);
                        out[i * count + 1] = blinn_8x8(coutput[1][i], m);
                        out[i * count + 2] = blinn_8x8(coutput[2][i], m);
                        if (count == 4) out[i * count + 3] = 255;
                    }
                } else if (self.app14_color_transform == 2) { // YCCK
                    ycbcr_to_rgb_row(out, y, coutput[1], coutput[2], width, count);
                    for (0..width) |i| {
                        const m = coutput[3][i];
                        out[i * count + 0] = blinn_8x8(255 - out[i * count + 0], m);
                        out[i * count + 1] = blinn_8x8(255 - out[i * count + 1], m);
                        out[i * count + 2] = blinn_8x8(255 - out[i * count + 2], m);
                    }
                } else { // YCbCr plus an ignored fourth channel
                    ycbcr_to_rgb_row(out, y, coutput[1], coutput[2], width, count);
                }
            } else {
                for (0..width) |i| {
                    out[i * count + 0] = y[i];
                    out[i * count + 1] = y[i];
                    out[i * count + 2] = y[i];
                    if (count == 4) out[i * count + 3] = 255;
                }
            }
            return;
        }

        // Single-channel output.
        if (is_rgb_color) {
            for (0..width) |i| out[i] = compute_y(coutput[0][i], coutput[1][i], coutput[2][i]);
        } else if (self.img_n == 4 and self.app14_color_transform == 0) {
            for (0..width) |i| {
                const m = coutput[3][i];
                const r = blinn_8x8(coutput[0][i], m);
                const g = blinn_8x8(coutput[1][i], m);
                const b = blinn_8x8(coutput[2][i], m);
                out[i] = compute_y(r, g, b);
            }
        } else if (self.img_n == 4 and self.app14_color_transform == 2) {
            for (0..width) |i| out[i] = blinn_8x8(255 - coutput[0][i], coutput[3][i]);
        } else {
            @memcpy(out[0..width], coutput[0][0..width]);
        }
    }

    /// Writes NV12 planes. Luma and chroma use nearest samples from the MCU-padded
    /// component planes, as described in the module comment.
    fn write_nv12(self: *Decoder, target: Nv12Target) Error!void {
        if (self.is_rgb()) return error.UnsupportedColor;
        const width: usize = self.img_x;
        const height: usize = self.img_y;
        const chroma_w = (width + 1) / 2;
        const chroma_h = (height + 1) / 2;
        if (target.y_stride < width or target.uv_stride < 2 * chroma_w) return error.InvalidBuffer;
        if (target.y.len < rows_bytes(target.y_stride, width, height) or target.uv.len < rows_bytes(target.uv_stride, 2 * chroma_w, chroma_h)) return error.InvalidBuffer;

        const hs0 = self.img_h_max / self.comp[0].h;
        const vs0 = self.img_v_max / self.comp[0].v;
        for (0..height) |row| {
            const src_row = row / vs0;
            const src = self.comp[0].data[src_row * self.comp[0].w2 ..];
            const dst = target.y[row * target.y_stride ..][0..width];
            for (dst, 0..) |*sample, col| sample.* = src[col / hs0];
        }

        if (self.img_n == 3) {
            const u_hs = self.img_h_max / self.comp[1].h;
            const u_vs = self.img_v_max / self.comp[1].v;
            const v_hs = self.img_h_max / self.comp[2].h;
            const v_vs = self.img_v_max / self.comp[2].v;
            for (0..chroma_h) |i| {
                const row = target.uv[i * target.uv_stride ..];
                const u_row = self.comp[1].data[((2 * i) / u_vs) * self.comp[1].w2 ..];
                const v_row = self.comp[2].data[((2 * i) / v_vs) * self.comp[2].w2 ..];
                for (0..chroma_w) |j| {
                    row[2 * j] = u_row[(2 * j) / u_hs];
                    row[2 * j + 1] = v_row[(2 * j) / v_hs];
                }
            }
        } else {
            for (0..chroma_h) |i| {
                @memset(target.uv[i * target.uv_stride ..][0 .. 2 * chroma_w], 0x80);
            }
        }
    }
};

fn rows_bytes(stride: usize, row_bytes: usize, rows: usize) usize {
    if (rows == 0) return 0;
    return (rows - 1) * stride + row_bytes;
}

fn is_sof(m: u8) bool {
    return m == 0xc0 or m == 0xc1 or m == 0xc2;
}

fn is_restart(m: u8) bool {
    return m >= 0xd0 and m <= 0xd7;
}

/// Second-level lookup for AC coefficients that fit a 9-bit code plus magnitude:
/// stores `(value << 8) | (run << 4) | length` so the decoder can skip a probe.
fn build_fast_ac(fast_ac: *[fast_size]i16, h: *const Huffman) void {
    for (0..fast_size) |i| {
        const fast = h.fast[i];
        fast_ac[i] = 0;
        if (fast < 255) {
            const rs: u8 = h.values[fast];
            const run: u32 = (rs >> 4) & 15;
            const magbits: u5 = @intCast(rs & 15);
            const len: u5 = @intCast(h.size[fast]);
            if (magbits != 0 and @as(u32, len) + magbits <= fast_bits) {
                // Magnitude bits follow the Huffman code within the probe window.
                var k: i32 = @intCast(((i << len) & (fast_size - 1)) >> (fast_bits - magbits));
                const m: i32 = @as(i32, 1) << (magbits - 1);
                if (k < m) k -= (@as(i32, 1) << magbits) - 1;
                if (k >= -128 and k <= 127) {
                    fast_ac[i] = @intCast(k * 256 + @as(i32, @intCast(run)) * 16 + @as(i32, len) + magbits);
                }
            }
        }
    }
}

/// stb's 8x8 integer IDCT: 12-bit fixed-point butterfly, two 1-D passes with
/// different output shifts, clamped to 8 bits, written with `out_stride` rows.
fn idct_block(out: []u8, out_stride: usize, data: *const [64]i16) void {
    var val: [64]i32 = undefined;
    // Columns first. A column of zero AC terms is a constant, computed directly.
    for (0..8) |i| {
        const d = data[i..];
        if (d[8] == 0 and d[16] == 0 and d[24] == 0 and d[32] == 0 and d[40] == 0 and d[48] == 0 and d[56] == 0) {
            const dcterm: i32 = @as(i32, d[0]) *% 4;
            inline for (0..8) |r| val[i + 8 * r] = dcterm;
        } else {
            const t = idct_1d(d[0], d[8], d[16], d[24], d[32], d[40], d[48], d[56]);
            const x0 = t.x0 +% 512;
            const x1 = t.x1 +% 512;
            const x2 = t.x2 +% 512;
            const x3 = t.x3 +% 512;
            val[i + 0] = (x0 +% t.t3) >> 10;
            val[i + 56] = (x0 -% t.t3) >> 10;
            val[i + 8] = (x1 +% t.t2) >> 10;
            val[i + 48] = (x1 -% t.t2) >> 10;
            val[i + 16] = (x2 +% t.t1) >> 10;
            val[i + 40] = (x2 -% t.t1) >> 10;
            val[i + 24] = (x3 +% t.t0) >> 10;
            val[i + 32] = (x3 -% t.t0) >> 10;
        }
    }
    // Rows second: 128 bias and the final >> 17 shift.
    for (0..8) |i| {
        const v = val[i * 8 ..][0..8];
        const t = idct_1d(v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7]);
        const x0 = t.x0 +% (65536 + (128 << 17));
        const x1 = t.x1 +% (65536 + (128 << 17));
        const x2 = t.x2 +% (65536 + (128 << 17));
        const x3 = t.x3 +% (65536 + (128 << 17));
        const o = out[i * out_stride ..][0..8];
        o[0] = clamp_u8((x0 +% t.t3) >> 17);
        o[7] = clamp_u8((x0 -% t.t3) >> 17);
        o[1] = clamp_u8((x1 +% t.t2) >> 17);
        o[6] = clamp_u8((x1 -% t.t2) >> 17);
        o[2] = clamp_u8((x2 +% t.t1) >> 17);
        o[5] = clamp_u8((x2 -% t.t1) >> 17);
        o[3] = clamp_u8((x3 +% t.t0) >> 17);
        o[4] = clamp_u8((x3 -% t.t0) >> 17);
    }
}

const IdctOutputs = struct { x0: i32, x1: i32, x2: i32, x3: i32, t0: i32, t1: i32, t2: i32, t3: i32 };

/// One 1-D pass of stb's IDCT. Constants are stb's `stbi__f2f` values, i.e.
/// round(c * 4096) computed in single precision. Wrapping arithmetic matches the
/// C code's two's-complement behaviour on corrupt coefficient magnitudes.
fn idct_1d(s0: anytype, s1: anytype, s2: anytype, s3: anytype, s4: anytype, s5: anytype, s6: anytype, s7: anytype) IdctOutputs {
    const a0: i32 = s0;
    const a1: i32 = s1;
    const a2: i32 = s2;
    const a3: i32 = s3;
    const a4: i32 = s4;
    const a5: i32 = s5;
    const a6: i32 = s6;
    const a7: i32 = s7;
    var p2 = a2;
    var p3 = a6;
    var p1 = (p2 +% p3) *% 2217; // 0.5411961
    var t2 = p1 +% p3 *% -7567; // -1.847759065
    var t3 = p1 +% p2 *% 3135; // 0.765366865
    p2 = a0;
    p3 = a4;
    var t0 = (p2 +% p3) *% 4096;
    var t1 = (p2 -% p3) *% 4096;
    const x0 = t0 +% t3;
    const x3 = t0 -% t3;
    const x1 = t1 +% t2;
    const x2 = t1 -% t2;
    t0 = a7;
    t1 = a5;
    t2 = a3;
    t3 = a1;
    p3 = t0 +% t2;
    var p4 = t1 +% t3;
    p1 = t0 +% t3;
    p2 = t1 +% t2;
    const p5 = (p3 +% p4) *% 4816; // 1.175875602
    t0 = t0 *% 1223; // 0.298631336
    t1 = t1 *% 8410; // 2.053119869
    t2 = t2 *% 12586; // 3.072711026
    t3 = t3 *% 6149; // 1.501321110
    p1 = p5 +% p1 *% -3685; // -0.899976223
    p2 = p5 +% p2 *% -10497; // -2.562915447
    p3 = p3 *% -8034; // -1.961570560
    p4 = p4 *% -1597; // -0.390180644
    t3 +%= p1 +% p4;
    t2 +%= p2 +% p3;
    t1 +%= p2 +% p4;
    t0 +%= p1 +% p3;
    return .{ .x0 = x0, .x1 = x1, .x2 = x2, .x3 = x3, .t0 = t0, .t1 = t1, .t2 = t2, .t3 = t3 };
}

fn clamp_u8(x: i32) u8 {
    if (@as(u32, @bitCast(x)) > 255) {
        if (x < 0) return 0;
        return 255;
    }
    return @intCast(x);
}

/// stb's 8x8 alpha blend: (x * y) / 255 rounded.
fn blinn_8x8(x: u8, y: u8) u8 {
    const t: u32 = @as(u32, x) * @as(u32, y) + 128;
    return @intCast((t + (t >> 8)) >> 8);
}

fn compute_y(r: u8, g: u8, b: u8) u8 {
    const value = (@as(u32, r) * 77 + @as(u32, g) * 150 + 29 * @as(u32, b)) >> 8;
    return @intCast(value);
}

/// Reduced-precision YCbCr to RGB using stb's fixed-point constants, shifted
/// into a 20-bit fraction with rounding. Output is written with `step` channels;
/// alpha is written only for four-channel output.
fn ycbcr_to_rgb_row(out: []u8, y: []const u8, pcb: []const u8, pcr: []const u8, count: usize, step: u8) void {
    for (0..count) |i| {
        const y_fixed: i32 = (@as(i32, y[i]) << 20) + (1 << 19);
        const cr: i32 = @as(i32, pcr[i]) - 128;
        const cb: i32 = @as(i32, pcb[i]) - 128;
        // stb masks the Cb term to its upper 16 bits so the same bits hold on SIMD paths.
        var r = y_fixed +% cr *% 1470208;
        var g = y_fixed +% (cr *% -748800) +% ((cb *% -360960) & @as(i32, @bitCast(@as(u32, 0xffff0000))));
        var b = y_fixed +% cb *% 1858048;
        r >>= 20;
        g >>= 20;
        b >>= 20;
        const base = i * step;
        out[base + 0] = clamp_u8(r);
        out[base + 1] = clamp_u8(g);
        out[base + 2] = clamp_u8(b);
        if (step == 4) out[base + 3] = 255;
    }
}

/// Selects the upsampling kernel output for one row, returning a slice of the
/// row's samples (either `out` or a slice of the component plane).
fn resample_row(kernel: Resampler, out: []u8, near: []const u8, far: []const u8, w: usize, hs: usize) []const u8 {
    switch (kernel) {
        .one => return near,
        .v2 => {
            for (0..w) |i| out[i] = @intCast((3 * @as(u32, near[i]) + far[i] + 2) >> 2);
            return out[0..w];
        },
        .h2 => {
            if (w == 1) {
                out[0] = near[0];
                out[1] = near[0];
                return out[0..2];
            }
            out[0] = near[0];
            out[1] = @intCast((@as(u32, near[0]) * 3 + near[1] + 2) >> 2);
            for (1..w - 1) |i| {
                const n: u32 = 3 * @as(u32, near[i]) + 2;
                out[i * 2 + 0] = @intCast((n + near[i - 1]) >> 2);
                out[i * 2 + 1] = @intCast((n + near[i + 1]) >> 2);
            }
            out[(w - 1) * 2 + 0] = @intCast((@as(u32, near[w - 2]) * 3 + near[w - 1] + 2) >> 2);
            out[(w - 1) * 2 + 1] = near[w - 1];
            return out[0 .. w * 2];
        },
        .hv2 => {
            if (w == 1) {
                const v: u8 = @intCast((3 * @as(u32, near[0]) + far[0] + 2) >> 2);
                out[0] = v;
                out[1] = v;
                return out[0..2];
            }
            var t1: u32 = 3 * @as(u32, near[0]) + far[0];
            out[0] = @intCast((t1 + 2) >> 2);
            for (1..w) |i| {
                const t0 = t1;
                t1 = 3 * @as(u32, near[i]) + far[i];
                out[i * 2 - 1] = @intCast((3 * t0 + t1 + 8) >> 4);
                out[i * 2] = @intCast((3 * t1 + t0 + 8) >> 4);
            }
            out[w * 2 - 1] = @intCast((t1 + 2) >> 2);
            return out[0 .. w * 2];
        },
        .generic => {
            // Nearest replication horizontally; vertical choice is made by the caller.
            for (0..w) |i| {
                for (0..hs) |j| out[i * hs + j] = near[i];
            }
            return out[0 .. w * hs];
        },
    }
}
