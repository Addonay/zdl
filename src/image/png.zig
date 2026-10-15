//! PNG decoding and encoding over byte slices, ported from stb_image's PNG path
//! as SDL builds it (`STBI_ONLY_PNG`) and from SDL's `SDL_SavePNG_IO`.
//!
//! Decoding keeps stb's behavior: all color types and bit depths 1 to 16,
//! Adam7 interlacing, tRNS as a color key or alpha, 16-bit samples reduced to
//! their high byte, and palette images returned as indices plus a 256-entry
//! palette whose unused entries are opaque white. Zlib data is inflated with
//! `std.compress.flate`. The CgBI (iPhone) container is inflated as raw deflate
//! and its BGR channel order is left unchanged, as SDL does.
//!
//! Deliberate differences from stb/SDL:
//! - Input is a borrowed byte slice; there are no I/O callbacks.
//! - The decompressed stream must contain at least the bytes the image needs.
//!   The expected size is computed exactly (Adam7 includes one filter byte per pass
//!   row), rather than stb's whole-stream guess.
//! - Encoding uses adaptive row filtering and std's deflate compressor. Its
//!   bytes differ from miniz's output, but the decoded pixels match.
//! - Chunk CRC and zlib Adler checks are verified by default, with bounded allocations.
//! - Corrupt data returns `error.CorruptPng` rather than stb's message strings.
// Decoding behavior follows stb_image by Sean Barrett (MIT or public domain,
// see docs/licenses/stb_image.txt), as bundled by upstream SDL.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");

/// Decoder and encoder failures. Encoding reads a surface view, so its pixel
/// access errors are included.
pub const Error = std.mem.Allocator.Error || surface.Error || error{
    /// The bytes do not start with the 8-byte PNG signature.
    NotPng,
    /// Malformed chunk, header, filter or compressed stream.
    CorruptPng,
    /// Valid PNG features that stb_image rejects, such as an unknown critical chunk.
    UnsupportedPng,
    /// Width or height is zero or too large for the decoder's limits.
    ImageTooLarge,
    /// Encoder input has no palette where the format requires one.
    MissingPalette,
};

const signature = [8]u8{ 137, 'P', 'N', 'G', 13, 10, 26, 10 };
const max_dimension: u32 = 1 << 24;

/// Reports whether `bytes` start with the PNG signature (SDL's `SDL_IsPNG` rule,
/// which checks the first four bytes).
pub fn is_png(bytes: []const u8) bool {
    return bytes.len >= 4 and bytes[0] == 0x89 and bytes[1] == 'P' and bytes[2] == 'N' and bytes[3] == 'G';
}

/// Decoded 8-bit PNG. `channels` is 1 for grey or palette indices, 2 for grey
/// with alpha, 3 for RGB and 4 for RGBA. Palette images have one channel and a
/// 256-entry palette; the palette array is owned by this image.
pub const Image = struct {
    allocator: std.mem.Allocator,
    width: u31,
    height: u31,
    channels: u8,
    /// Tightly packed 8-bit samples, row-major.
    data: []u8,
    /// Present for color type 3. Entries past the PLTE chunk are opaque white.
    palette: ?[]pixels.Color = null,

    /// Releases the sample and palette storage.
    pub fn deinit(self: *Image) void {
        self.allocator.free(self.data);
        if (self.palette) |colors| self.allocator.free(colors);
        self.* = undefined;
    }
};

const depth_scale = [9]u8{ 0, 0xff, 0x55, 0, 0x11, 0, 0, 0, 0x01 };

/// Adam7 pass origins and spacing (x and y), as stb's pass tables.
const adam7 = struct {
    const xorig = [7]usize{ 0, 4, 0, 2, 0, 1, 0 };
    const yorig = [7]usize{ 0, 0, 4, 0, 2, 0, 1 };
    const xspc = [7]usize{ 8, 8, 4, 4, 2, 2, 1 };
    const yspc = [7]usize{ 8, 8, 8, 4, 4, 2, 2 };
};

/// Allocation and integrity policy for untrusted PNG input. Limits cover each
/// inflated/output allocation, not allocator bookkeeping or their combined peak.
pub const DecodeOptions = struct {
    max_width: u32 = 32768,
    max_height: u32 = 32768,
    max_decoded_bytes: usize = 512 * 1024 * 1024,
    max_compressed_bytes: usize = 256 * 1024 * 1024,
    verify_checksums: bool = true,
};

/// Decodes a complete PNG into 8-bit samples using bounded, checksum-verified defaults.
pub fn decode(allocator: std.mem.Allocator, bytes: []const u8) Error!Image {
    return decode_with_options(allocator, bytes, .{});
}

/// Decodes with explicit resource/integrity policy. Returned samples are owned.
pub fn decode_with_options(allocator: std.mem.Allocator, bytes: []const u8, options: DecodeOptions) Error!Image {
    if (bytes.len < 8 or !std.mem.eql(u8, bytes[0..8], &signature)) return error.NotPng;

    var header: ?Header = null;
    var palette_rgba: [256][4]u8 = undefined;
    for (&palette_rgba) |*entry| entry.* = .{ 255, 255, 255, 255 };
    var pal_len: usize = 0;
    var has_palette = false;
    var trns: [6]u8 = @splat(0);
    var trns_len: usize = 0;
    var has_trns = false;
    var iphone = false;
    var idata: std.ArrayList(u8) = .empty;
    defer idata.deinit(allocator);

    var first_idat: ?[]const u8 = null;
    var compressed_len: usize = 0;
    var pos: usize = 8;
    var first = true;
    while (true) {
        if (bytes.len - pos < 8) return error.CorruptPng;
        const length: usize = std.mem.readInt(u32, bytes[pos..][0..4], .big);
        const kind = bytes[pos + 4 ..][0..4].*;
        pos += 8;
        if (length > bytes.len - pos or bytes.len - pos - length < 4) return error.CorruptPng;
        const body = bytes[pos..][0..length];
        if (options.verify_checksums) {
            var crc = std.hash.Crc32.init();
            crc.update(&kind);
            crc.update(body);
            if (crc.final() != std.mem.readInt(u32, bytes[pos + length ..][0..4], .big)) return error.CorruptPng;
        }
        pos += length + 4;

        if (std.mem.eql(u8, &kind, "CgBI")) {
            iphone = true;
            continue;
        }
        if (std.mem.eql(u8, &kind, "IHDR")) {
            if (!first) return error.CorruptPng;
            first = false;
            if (length != 13) return error.CorruptPng;
            header = try Header.parse(body);
            const h = header.?;
            if (h.width > options.max_width or h.height > options.max_height) return error.ImageTooLarge;
            const count = std.math.mul(usize, h.width, h.height) catch return error.ImageTooLarge;
            const decoded = std.math.mul(usize, count, @as(usize, h.img_n) * (if (h.depth == 16) @as(usize, 2) else 1)) catch return error.ImageTooLarge;
            if (decoded > options.max_decoded_bytes) return error.ImageTooLarge;
            continue;
        }
        if (first) return error.CorruptPng; // every other chunk must follow IHDR
        const h = header orelse return error.CorruptPng;

        if (std.mem.eql(u8, &kind, "PLTE")) {
            if (length > 256 * 3) return error.CorruptPng;
            if (length % 3 != 0) return error.CorruptPng;
            pal_len = length / 3;
            has_palette = true;
            for (0..pal_len) |i| {
                palette_rgba[i] = .{ body[i * 3], body[i * 3 + 1], body[i * 3 + 2], 255 };
            }
        } else if (std.mem.eql(u8, &kind, "tRNS")) {
            if (compressed_len != 0) return error.CorruptPng;
            if (h.color_type == 3) {
                if (pal_len == 0) return error.CorruptPng;
                if (length > pal_len) return error.CorruptPng;
                for (0..length) |i| palette_rgba[i][3] = body[i];
            } else {
                if ((h.img_n & 1) == 0) return error.CorruptPng; // tRNS with alpha
                if (length != @as(usize, h.img_n) * 2) return error.CorruptPng;
                has_trns = true;
                trns_len = h.img_n;
                // Store the key as big-endian 16-bit values; 8-bit keys are scaled
                // below as stb does.
                for (0..h.img_n) |k| {
                    if (k < 3) {
                        trns[k * 2] = body[k * 2];
                        trns[k * 2 + 1] = body[k * 2 + 1];
                    }
                }
            }
        } else if (std.mem.eql(u8, &kind, "IDAT")) {
            if (h.color_type == 3 and !has_palette) return error.CorruptPng;
            if (body.len > options.max_compressed_bytes -| compressed_len) return error.ImageTooLarge;
            compressed_len += body.len;
            // Most PNGs have one IDAT: borrow it instead of allocating/copying.
            if (first_idat == null) {
                first_idat = body;
            } else {
                if (idata.items.len == 0) try idata.appendSlice(allocator, first_idat.?);
                try idata.appendSlice(allocator, body);
            }
        } else if (std.mem.eql(u8, &kind, "IEND")) {
            if (compressed_len == 0 or length != 0) return error.CorruptPng;
            break;
        } else if ((kind[0] & 0x20) == 0) {
            // Upper-case first letter means critical: stb rejects unknown ones.
            return error.UnsupportedPng;
        }
    }

    const h = header orelse return error.CorruptPng;
    var image = try decode_pixels(allocator, h, if (idata.items.len != 0) idata.items else first_idat.?, iphone, has_trns, &trns, trns_len, options);
    errdefer image.deinit();
    if (h.color_type == 3) {
        const colors = try allocator.alloc(pixels.Color, 256);
        for (colors, palette_rgba) |*color, rgba| color.* = .{ .r = rgba[0], .g = rgba[1], .b = rgba[2], .a = rgba[3] };
        image.palette = colors;
    }
    return image;
}

const Header = struct {
    width: u32,
    height: u32,
    depth: u8,
    color_type: u8,
    interlace: bool,
    /// Samples per pixel in the file (palette images count as 1).
    img_n: u8,

    fn parse(body: []const u8) Error!Header {
        const width = std.mem.readInt(u32, body[0..4], .big);
        const height = std.mem.readInt(u32, body[4..8], .big);
        const depth = body[8];
        const color = body[9];
        const interlace = body[12];
        if (width == 0 or height == 0) return error.CorruptPng;
        if (width > max_dimension or height > max_dimension) return error.ImageTooLarge;
        if (depth != 1 and depth != 2 and depth != 4 and depth != 8 and depth != 16) return error.UnsupportedPng;
        if (color > 6) return error.CorruptPng;
        if (color == 3 and depth == 16) return error.CorruptPng;
        if (color != 3 and (color & 1) != 0) return error.CorruptPng;
        if (body[10] != 0 or body[11] != 0) return error.CorruptPng;
        if (interlace > 1) return error.CorruptPng;
        const img_n: u8 = if (color == 3) 1 else (if ((color & 2) != 0) @as(u8, 3) else 1) + @as(u8, if ((color & 4) != 0) 1 else 0);
        return .{ .width = width, .height = height, .depth = depth, .color_type = color, .interlace = interlace == 1, .img_n = img_n };
    }
};

/// Inflates the IDAT stream, unfilters every scanline and applies tRNS.
fn decode_pixels(allocator: std.mem.Allocator, h: Header, idata: []const u8, iphone: bool, has_trns: bool, trns: *const [6]u8, trns_len: usize, options: DecodeOptions) Error!Image {
    _ = trns_len;
    const x: usize = h.width;
    const y: usize = h.height;
    const img_n: usize = h.img_n;
    const depth: usize = h.depth;
    const sb: usize = if (depth == 16) 2 else 1; // bytes per sample
    const out_n: usize = if (has_trns) img_n + 1 else img_n;

    // Expected inflated size: one filter byte per scanline per pass.
    const raw_len = if (h.interlace) blk: {
        var total: usize = 0;
        for (0..7) |p| {
            const px = pass_extent(x, adam7.xorig[p], adam7.xspc[p]);
            const py = pass_extent(y, adam7.yorig[p], adam7.yspc[p]);
            if (px != 0 and py != 0) total += (row_bytes(img_n, px, depth) + 1) * py;
        }
        break :blk total;
    } else (row_bytes(img_n, x, depth) + 1) * y;

    if (raw_len > options.max_decoded_bytes) return error.ImageTooLarge;
    const raw = try inflate(allocator, idata, raw_len, !iphone, options.verify_checksums);
    defer allocator.free(raw);

    const out_bytes = std.math.mul(usize, std.math.mul(usize, x, y) catch return error.ImageTooLarge, out_n * sb) catch return error.ImageTooLarge;
    if (out_bytes > options.max_decoded_bytes) return error.ImageTooLarge;
    const final = try allocator.alloc(u8, out_bytes);
    errdefer allocator.free(final);

    if (!h.interlace) {
        try unfilter_pass(allocator, raw, x, y, h.depth, h.color_type, img_n, out_n, final, x);
    } else {
        var offset: usize = 0;
        for (0..7) |p| {
            const px = pass_extent(x, adam7.xorig[p], adam7.xspc[p]);
            const py = pass_extent(y, adam7.yorig[p], adam7.yspc[p]);
            if (px == 0 or py == 0) continue;
            const pass_len = (row_bytes(img_n, px, depth) + 1) * py;
            const pass_out = try allocator.alloc(u8, px * py * out_n * sb);
            defer allocator.free(pass_out);
            try unfilter_pass(allocator, raw[offset..][0..pass_len], px, py, h.depth, h.color_type, img_n, out_n, pass_out, px);
            offset += pass_len;
            for (0..py) |j| {
                for (0..px) |i| {
                    const out_y = j * adam7.yspc[p] + adam7.yorig[p];
                    const out_x = i * adam7.xspc[p] + adam7.xorig[p];
                    const src = pass_out[(j * px + i) * out_n * sb ..][0 .. out_n * sb];
                    @memcpy(final[(out_y * x + out_x) * out_n * sb ..][0 .. out_n * sb], src);
                }
            }
        }
    }

    if (has_trns) apply_transparency(final, x * y, out_n, sb, depth, trns, img_n);

    // stb keeps the high byte of each 16-bit sample.
    var data: []u8 = final;
    if (sb == 2) {
        const reduced = try allocator.alloc(u8, x * y * out_n);
        for (reduced, 0..) |*sample, k| sample.* = final[k * 2];
        allocator.free(final);
        data = reduced;
    }
    return .{ .allocator = allocator, .width = @intCast(x), .height = @intCast(y), .channels = @intCast(out_n), .data = data };
}

/// Image extent of one Adam7 pass along an axis (zero when the pass is empty).
fn pass_extent(size: usize, origin: usize, spacing: usize) usize {
    if (size <= origin) return 0;
    return (size - origin + spacing - 1) / spacing;
}

/// Bytes of samples in one unfiltered row (excluding the filter byte).
fn row_bytes(img_n: usize, width: usize, depth: usize) usize {
    return (img_n * width * depth + 7) >> 3;
}

/// Inflates exactly `expected` bytes from the IDAT stream.
fn inflate(allocator: std.mem.Allocator, idata: []const u8, expected: usize, zlib: bool, verify: bool) Error![]u8 {
    var input = std.Io.Reader.fixed(idata);
    const window = try allocator.alloc(u8, std.compress.flate.max_window_len);
    defer allocator.free(window);
    var decompress = std.compress.flate.Decompress.init(&input, if (zlib) .zlib else .raw, window);
    const out = try allocator.alloc(u8, expected);
    errdefer allocator.free(out);
    decompress.reader.readSliceAll(out) catch return error.CorruptPng;
    // Force the end marker and container trailer to be parsed. Reading only the
    // requested pixels used to accept truncated streams and trailing raw output.
    _ = decompress.reader.takeByte() catch |err| switch (err) {
        error.EndOfStream => {
            if (verify and zlib and decompress.container_metadata.zlib.adler != std.hash.Adler32.hash(out)) return error.CorruptPng;
            return out;
        },
        else => return error.CorruptPng,
    };
    return error.CorruptPng;
}

/// Unfilters `height` scanlines from `raw` (filter byte + row bytes each) and
/// expands them to `out_n` channels in `dest`, whose rows are `dest_width` pixels.
fn unfilter_pass(allocator: std.mem.Allocator, raw: []const u8, width: usize, height: usize, depth: u8, color_type: u8, img_n: usize, out_n: usize, dest: []u8, dest_width: usize) Error!void {
    const bytes: usize = if (depth == 16) 2 else 1;
    const nk = row_bytes(img_n, width, depth);
    // Filter byte distance: at least one byte, or one sample for 8/16-bit.
    const filter_bytes: usize = if (depth < 8) 1 else img_n * bytes;
    const dest_row = dest_width * out_n * bytes;

    // Common 8/16-bit rows with no inserted alpha can unfilter directly into
    // their final destination. The previous destination row is the predictor:
    // no two-row scratch allocation, sample allocation or row copy is needed.
    if (depth >= 8 and img_n == out_n) {
        for (0..height) |j| {
            const begin = j * (nk + 1);
            if (raw.len -| begin < nk + 1) return error.CorruptPng;
            const filter = raw[begin];
            if (filter > 4) return error.CorruptPng;
            const cur = dest[j * dest_row ..][0..nk];
            const prior = if (j == 0) cur else dest[(j - 1) * dest_row ..][0..nk];
            unfilter_row(if (j == 0) first_row_filter(filter) else filter, raw[begin + 1 ..][0..nk], prior, cur, filter_bytes);
        }
        return;
    }

    const prior_buf = try allocator.alloc(u8, nk);
    defer allocator.free(prior_buf);
    const cur_buf = try allocator.alloc(u8, nk);
    defer allocator.free(cur_buf);
    const samples = try allocator.alloc(u8, width * img_n);
    defer allocator.free(samples);
    @memset(prior_buf, 0);

    var prior = prior_buf;
    var cur = cur_buf;
    var offset: usize = 0;
    for (0..height) |j| {
        if (offset >= raw.len) return error.CorruptPng;
        var filter = raw[offset];
        offset += 1;
        if (filter > 4) return error.CorruptPng;
        const line = raw[offset..][0..nk];
        offset += nk;
        if (j == 0) filter = first_row_filter(filter);
        unfilter_row(filter, line, prior, cur, filter_bytes);

        // Expand the row into samples and channels.
        const dest_line = dest[j * dest_row ..][0..dest_row];
        if (depth < 8) {
            const scale: u8 = if (color_type == 0) depth_scale[depth] else 1;
            for (0..width * img_n) |i| {
                const shift: u3 = @intCast(8 - depth * (1 + (i % (8 / depth))));
                const value = (cur[i * depth / 8] >> shift) & ((@as(u8, 1) << @intCast(depth)) - 1);
                samples[i] = value *% scale;
            }
            expand_samples(dest_line, samples, width, img_n, out_n, 1);
        } else {
            expand_samples(dest_line, cur[0..nk], width, img_n, out_n, bytes);
        }
        std.mem.swap([]u8, &prior, &cur);
    }
}

/// Expands `width` pixels of `img_n` samples (each `bytes` wide) into `out_n`
/// channels. The opaque alpha sample is the maximum value of the sample size.
fn expand_samples(dest: []u8, src: []const u8, width: usize, img_n: usize, out_n: usize, bytes: usize) void {
    if (img_n == out_n) {
        @memcpy(dest[0 .. width * img_n * bytes], src[0 .. width * img_n * bytes]);
        return;
    }
    for (0..width) |i| {
        const from = i * img_n * bytes;
        const to = i * out_n * bytes;
        @memcpy(dest[to..][0 .. img_n * bytes], src[from..][0 .. img_n * bytes]);
        if (out_n != img_n) {
            @memset(dest[to + img_n * bytes ..][0..bytes], 0xff);
        }
    }
}

/// Filter type used for the first scanline: stb maps the filters whose prior
/// row would be zero onto simpler ones, which yields the same output.
fn first_row_filter(filter: u8) u8 {
    return switch (filter) {
        0 => 0,
        1 => 1,
        2 => 0,
        3 => 5, // average with zero prior row: avg_first
        4 => 1, // Paeth with zero prior row equals Sub
        else => filter,
    };
}

/// Reverses one filter. `bpp` is the byte distance to the left neighbour.
/// Filter values: 0 none, 1 sub, 2 up, 3 average, 4 Paeth, 5 average on the first row.
fn unfilter_row(filter: u8, line: []const u8, prior: []const u8, cur: []u8, bpp: usize) void {
    const n = line.len;
    switch (filter) {
        0 => @memcpy(cur[0..n], line),
        1 => {
            @memcpy(cur[0..@min(bpp, n)], line[0..@min(bpp, n)]);
            for (bpp..n) |k| cur[k] = line[k] +% cur[k - bpp];
        },
        2 => for (0..n) |k| {
            cur[k] = line[k] +% prior[k];
        },
        3 => {
            for (0..@min(bpp, n)) |k| cur[k] = line[k] +% (prior[k] >> 1);
            for (bpp..n) |k| cur[k] = line[k] +% @as(u8, @intCast((@as(u16, prior[k]) + cur[k - bpp]) >> 1));
        },
        4 => {
            for (0..@min(bpp, n)) |k| cur[k] = line[k] +% prior[k];
            for (bpp..n) |k| cur[k] = line[k] +% paeth(cur[k - bpp], prior[k], prior[k - bpp]);
        },
        5 => {
            // First-row average: the left neighbour is the only prediction source.
            @memcpy(cur[0..@min(bpp, n)], line[0..@min(bpp, n)]);
            for (bpp..n) |k| cur[k] = line[k] +% (cur[k - bpp] >> 1);
        },
        else => unreachable,
    }
}

fn paeth(a: u8, b: u8, c: u8) u8 {
    const pa: i32 = @as(i32, b) - c;
    const pb: i32 = @as(i32, a) - c;
    const pc: i32 = pa + pb;
    const aa = @abs(pa);
    const bb = @abs(pb);
    const cc = @abs(pc);
    if (aa <= bb and aa <= cc) return a;
    if (bb <= cc) return b;
    return c;
}

/// Sets alpha from the tRNS color key: grey or RGB samples equal to the key
/// become transparent. Grey alpha is 0 or the maximum value of the sample size.
fn apply_transparency(data: []u8, pixel_count: usize, out_n: usize, sb: usize, depth: usize, trns: *const [6]u8, img_n: usize) void {
    _ = img_n;
    // Key samples: 16-bit keys are compared as stored; smaller depths compare the low byte
    // scaled to the expanded sample range, as stb does.
    var key: [3]u16 = .{ 0, 0, 0 };
    for (0..3) |k| {
        const raw = std.mem.readInt(u16, trns[k * 2 ..][0..2], .big);
        key[k] = if (sb == 2) raw else @as(u16, @as(u8, @truncate(raw & 255)) *% depth_scale[depth]);
    }
    const max: u8 = 0xff;
    if (out_n == 2) {
        for (0..pixel_count) |i| {
            const base = i * 2 * sb;
            const sample = read_sample(data, base, sb);
            const alpha_at = base + sb;
            if (sb == 2) {
                const value: u16 = if (sample == key[0]) 0 else 0xffff;
                std.mem.writeInt(u16, data[alpha_at..][0..2], value, .big);
            } else {
                data[alpha_at] = if (sample == key[0]) 0 else max;
            }
        }
    } else {
        for (0..pixel_count) |i| {
            const base = i * 4 * sb;
            const matches = read_sample(data, base, sb) == key[0] and read_sample(data, base + sb, sb) == key[1] and read_sample(data, base + 2 * sb, sb) == key[2];
            if (matches) @memset(data[base + 3 * sb ..][0..sb], 0);
        }
    }
}

fn read_sample(data: []const u8, offset: usize, sb: usize) u16 {
    if (sb == 2) return std.mem.readInt(u16, data[offset..][0..2], .big);
    return data[offset];
}

/// PNG row predictor. Adaptive chooses the lowest sum of absolute signed
/// residuals per row; explicit filters avoid that search when throughput matters.
pub const Filter = enum { none, sub, up, average, paeth, adaptive };
pub const Compression = enum { fast, balanced, best };
/// Encoding policy. `.fast` trades size for speed; `.none` skips filter search.
pub const EncodeOptions = struct {
    filter: Filter = .adaptive,
    compression: Compression = .balanced,
};

/// Encodes an owned PNG byte slice. Indexed views retain their palette/alpha;
/// other formats become RGBA. Uses adaptive filtering and balanced compression.
pub fn encode(allocator: std.mem.Allocator, view: surface.View) Error![]u8 {
    return encode_with_options(allocator, view, .{});
}

/// Encodes with explicit filtering and compression policy. Temporary storage is
/// proportional to one scanline rather than the entire uncompressed image.
pub fn encode_with_options(allocator: std.mem.Allocator, view: surface.View, options: EncodeOptions) Error![]u8 {
    const indexed = view.format == .indexed;
    if (indexed and view.palette == null) return error.MissingPalette;
    const width: usize = view.width;
    const height: usize = view.height;
    if (width == 0 or height == 0) return error.InvalidSize;
    const bpp: usize = if (indexed) 1 else 4;
    const row_len = std.math.mul(usize, width, bpp) catch return error.ImageTooLarge;
    const storage = try allocator.alloc(u8, std.math.mul(usize, row_len + 1, 4) catch return error.ImageTooLarge);
    defer allocator.free(storage);
    var prior = storage[0..row_len];
    var row = storage[row_len .. row_len * 2];
    const filtered = storage[row_len * 2 ..][0 .. row_len + 1];
    const candidate = storage[row_len * 3 + 1 ..][0 .. row_len + 1];
    @memset(prior, 0);

    var compressed: std.Io.Writer.Allocating = try .initCapacity(allocator, 4096);
    defer compressed.deinit();
    const window = try allocator.alloc(u8, std.compress.flate.max_window_len);
    defer allocator.free(window);
    const compression = switch (options.compression) {
        .fast => std.compress.flate.Compress.Options.fastest,
        .balanced => std.compress.flate.Compress.Options.default,
        .best => std.compress.flate.Compress.Options.best,
    };
    var compress = std.compress.flate.Compress.init(&compressed.writer, window, .zlib, compression) catch return error.OutOfMemory;
    for (0..height) |y| {
        const source = try view.row(y);
        if (view.format == .rgba8) {
            @memcpy(row, source);
        } else if (indexed) {
            const indexed_format = view.format.indexed;
            if (indexed_format.bits == 8) @memcpy(row, source) else {
                for (0..width) |x| row[x] = try indexed_format.read_index(source, x);
            }
        } else {
            for (0..width) |x| {
                const color = try view.read(x, y);
                row[x * 4 ..][0..4].* = .{ color.r, color.g, color.b, color.a };
            }
        }
        if (options.filter == .adaptive) {
            var best_score = filter_encode(0, row, prior, bpp, filtered);
            for (1..5) |kind| {
                const score = filter_encode(@intCast(kind), row, prior, bpp, candidate);
                if (score < best_score) {
                    best_score = score;
                    @memcpy(filtered, candidate);
                }
            }
        } else _ = filter_encode(@intCast(@backingInt(options.filter)), row, prior, bpp, filtered);
        compress.writer.writeAll(filtered) catch return error.OutOfMemory;
        std.mem.swap([]u8, &row, &prior);
    }
    compress.finish() catch return error.OutOfMemory;
    const idat = compressed.written();
    if (idat.len > std.math.maxInt(u32)) return error.ImageTooLarge;

    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    try out.appendSlice(allocator, &signature);
    var ihdr: [13]u8 = undefined;
    std.mem.writeInt(u32, ihdr[0..4], @intCast(width), .big);
    std.mem.writeInt(u32, ihdr[4..8], @intCast(height), .big);
    ihdr[8] = 8;
    ihdr[9] = if (indexed) 3 else 6;
    ihdr[10] = 0;
    ihdr[11] = 0;
    ihdr[12] = 0;
    try append_chunk(allocator, &out, "IHDR", &ihdr);
    if (indexed) {
        const palette = view.palette.?;
        const plte = try allocator.alloc(u8, palette.len * 3);
        defer allocator.free(plte);
        const trns = try allocator.alloc(u8, palette.len);
        defer allocator.free(trns);
        for (palette, 0..) |color, i| {
            plte[i * 3 + 0] = color.r;
            plte[i * 3 + 1] = color.g;
            plte[i * 3 + 2] = color.b;
            trns[i] = color.a;
        }
        try append_chunk(allocator, &out, "PLTE", plte);
        try append_chunk(allocator, &out, "tRNS", trns);
    }
    try append_chunk(allocator, &out, "IDAT", idat);
    try append_chunk(allocator, &out, "IEND", &.{});
    return out.toOwnedSlice(allocator);
}

fn append_chunk(allocator: std.mem.Allocator, out: *std.ArrayList(u8), kind: *const [4]u8, body: []const u8) std.mem.Allocator.Error!void {
    var length: [4]u8 = undefined;
    std.mem.writeInt(u32, &length, @intCast(body.len), .big);
    try out.appendSlice(allocator, &length);
    try out.appendSlice(allocator, kind);
    try out.appendSlice(allocator, body);
    var crc = std.hash.Crc32.init();
    crc.update(kind);
    crc.update(body);
    var checksum: [4]u8 = undefined;
    std.mem.writeInt(u32, &checksum, crc.final(), .big);
    try out.appendSlice(allocator, &checksum);
}

/// Constructs one filtered scanline and its PNG signed-residual heuristic score.
fn filter_encode(kind: u8, row: []const u8, prior: []const u8, bpp: usize, output: []u8) u64 {
    output[0] = kind;
    var score: u64 = 0;
    for (row, 0..) |value, i| {
        const left: u8 = if (i >= bpp) row[i - bpp] else 0;
        const upper_left: u8 = if (i >= bpp) prior[i - bpp] else 0;
        const predicted: u8 = switch (kind) {
            0 => 0,
            1 => left,
            2 => prior[i],
            3 => @intCast((@as(u16, left) + prior[i]) >> 1),
            4 => paeth(left, prior[i], upper_left),
            else => unreachable,
        };
        const residual = value -% predicted;
        output[i + 1] = residual;
        score += @min(@as(u16, residual), 256 - @as(u16, residual));
    }
    return score;
}

test "PNG filters and compression policies roundtrip RGBA without touching padding" {
    const a = std.testing.allocator;
    var input: [7 * 37]u8 = @splat(0xa5);
    const view = try surface.View.init(&input, 8, 7, 37, .rgba8, null);
    for (0..7) |y| for (0..8) |x| {
        try view.write(x, y, .{ .r = @intCast(x * 31), .g = @intCast(y * 41), .b = @intCast((x ^ y) * 29), .a = @intCast(x * 17 + y * 13) });
    };
    const filters = [_]Filter{ .none, .sub, .up, .average, .paeth, .adaptive };
    for (filters) |filter| for ([_]Compression{ .fast, .balanced, .best }) |compression| {
        const encoded = try encode_with_options(a, view, .{ .filter = filter, .compression = compression });
        defer a.free(encoded);
        var decoded = try decode(a, encoded);
        defer decoded.deinit();
        try std.testing.expectEqual(@as(u8, 4), decoded.channels);
        for (0..7) |y| try std.testing.expectEqualSlices(u8, try view.row(y), decoded.data[y * 32 ..][0..32]);
    };
}

test "PNG all filters match independent scalar inverse including short and unaligned rows" {
    var source: [137]u8 = undefined;
    var prior: [137]u8 = undefined;
    var filtered: [138]u8 = undefined;
    var result: [137]u8 = undefined;
    for (&source, &prior, 0..) |*s, *p, i| {
        s.* = @truncate(i * 103 + 17);
        p.* = @truncate(i * 59 + 231);
    }
    for ([_]usize{ 1, 2, 3, 4, 6, 8 }) |bpp| {
        for ([_]usize{ bpp, bpp + 1, 137 }) |len| {
            for (0..5) |kind| {
                _ = filter_encode(@intCast(kind), source[0..len], prior[0..len], bpp, filtered[0 .. len + 1]);
                unfilter_row(@intCast(kind), filtered[1 .. len + 1], prior[0..len], result[0..len], bpp);
                try std.testing.expectEqualSlices(u8, source[0..len], result[0..len]);
            }
        }
    }
}

test "PNG decode bounds and CRC validation reject untrusted input" {
    const a = std.testing.allocator;
    var data: [16]u8 = .{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
    const view = try surface.View.init(&data, 2, 2, 8, .rgba8, null);
    const encoded = try encode(a, view);
    defer a.free(encoded);
    try std.testing.expectError(error.ImageTooLarge, decode_with_options(a, encoded, .{ .max_width = 1 }));
    try std.testing.expectError(error.ImageTooLarge, decode_with_options(a, encoded, .{ .max_decoded_bytes = 15 }));
    try std.testing.expectError(error.ImageTooLarge, decode_with_options(a, encoded, .{ .max_compressed_bytes = 1 }));
    // Alter IHDR's CRC, leaving its actual data intact.
    encoded[29] ^= 1;
    try std.testing.expectError(error.CorruptPng, decode(a, encoded));
    var unchecked = try decode_with_options(a, encoded, .{ .verify_checksums = false });
    unchecked.deinit();
    encoded[29] ^= 1;
    // Every truncated prefix is rejected, including the IEND CRC.
    for (0..encoded.len) |len| {
        if (decode(a, encoded[0..len])) |success| {
            var bad = success;
            bad.deinit();
            return error.TestUnexpectedResult;
        } else |_| {}
    }
}

test "PNG split IDAT chunks decode identically including empty chunks" {
    const a = std.testing.allocator;
    var data: [12]u8 = .{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
    const view = try surface.View.init(&data, 3, 1, 12, .rgba8, null);
    const encoded = try encode(a, view);
    defer a.free(encoded);
    var chunks: std.ArrayList(u8) = .empty;
    defer chunks.deinit(a);
    try chunks.appendSlice(a, encoded[0..33]);
    const len = std.mem.readInt(u32, encoded[33..][0..4], .big);
    const idat = encoded[41..][0..len];
    try append_chunk(a, &chunks, "IDAT", &.{});
    try append_chunk(a, &chunks, "IDAT", idat[0 .. len / 2]);
    try append_chunk(a, &chunks, "IDAT", &.{});
    try append_chunk(a, &chunks, "IDAT", idat[len / 2 ..]);
    try append_chunk(a, &chunks, "IEND", &.{});
    var result = try decode(a, chunks.items);
    defer result.deinit();
    try std.testing.expectEqualSlices(u8, &data, result.data);
}

test "PNG palette alpha roundtrip and indexed packed expansion" {
    const a = std.testing.allocator;
    var data: [2]u8 = .{ 0b01011010, 0b10100101 };
    const palette = [_]pixels.Color{ .{ .r = 255, .g = 0, .b = 0, .a = 127 }, .{ .r = 0, .g = 255, .b = 0, .a = 255 } };
    const view = try surface.View.init(&data, 8, 2, 1, .{ .indexed = .{ .bits = 1 } }, &palette);
    const encoded = try encode(a, view);
    defer a.free(encoded);
    var result = try decode(a, encoded);
    defer result.deinit();
    try std.testing.expectEqual(@as(u8, 1), result.channels);
    try std.testing.expectEqualSlices(pixels.Color, &palette, result.palette.?[0..2]);
    for (0..2) |y| for (0..8) |x| {
        try std.testing.expectEqual(try view.format.indexed.read_index(try view.row(y), x), result.data[y * 8 + x]);
    };
}
