//! Windows BMP decoding/encoding over slices, derived from SDL_bmp.c.
//! std handles file I/O. Decoded images own their surface and optional palette;
//! the input is borrowed only for the duration of decode. CORE/INFO/V2-V5 headers,
//! uncompressed RGB/indexed data, bitfields and RLE4/RLE8 are supported. Embedded
//! JPEG/PNG, OS/2 extended compression and color-profile transforms are pending.
const std = @import("std");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");

/// Container, shape and ownership failures are explicit.
pub const Error = surface.Error || error{
    InvalidContainer,
    InvalidHeader,
    InvalidSize,
    UnsupportedCompression,
    UnsupportedBitDepth,
    TruncatedData,
    InvalidData,
};
/// The ambiguous alpha byte of legacy BI_RGB32 can be corrected as SDL does.
pub const Options = struct { alpha: enum { automatic, preserve, force_opaque } = .automatic };

/// Owns a decoded surface and its palette. Views borrowed from surface remain
/// valid until deinit. Do not copy the owning image after decoding.
pub const Image = struct {
    surface: surface.Surface,
    palette: ?[]pixels.Color,
    /// Frees pixel storage before the palette borrowed by its view.
    pub fn deinit(self: *Image) void {
        const allocator = self.surface.allocator;
        self.surface.deinit();
        if (self.palette) |colors| allocator.free(colors);
        self.* = undefined;
    }
};

/// Identifies the file signature without seeking or changing an input reader.
pub fn is_bmp(bytes: []const u8) bool {
    return bytes.len >= 2 and std.mem.eql(u8, bytes[0..2], "BM");
}

/// Decodes a bounded BMP slice. Row padding and bottom-up orientation are handled
/// explicitly; palette indices remain packed instead of expanding every image
/// to eight-bit indices. Pixel bits are preserved when no alpha correction is
/// requested. Every allocation is released if a later chunk or RLE command fails.
pub fn decode(allocator: std.mem.Allocator, bytes: []const u8, options: Options) Error!Image {
    if (!is_bmp(bytes)) return error.InvalidContainer;
    if (bytes.len < 26) return error.TruncatedData;
    const data_offset: usize = read(u32, bytes, 10);
    const dib_size: usize = read(u32, bytes, 14);
    const dib_end = std.math.add(usize, 14, dib_size) catch return error.Overflow;
    if (dib_end > bytes.len or data_offset > bytes.len) return error.TruncatedData;
    var width: i32 = 0;
    var signed_height: i32 = 0;
    var bits: u16 = 0;
    var compression: u32 = 0;
    var colors_used: u32 = 0;
    var palette_start = dib_end;
    if (dib_size == 12) {
        width = read(u16, bytes, 18);
        signed_height = read(u16, bytes, 20);
        if (read(u16, bytes, 22) != 1) return error.InvalidHeader;
        bits = read(u16, bytes, 24);
    } else if (dib_size >= 40) {
        width = read(i32, bytes, 18);
        signed_height = read(i32, bytes, 22);
        if (read(u16, bytes, 26) != 1) return error.InvalidHeader;
        bits = read(u16, bytes, 28);
        compression = read(u32, bytes, 30);
        colors_used = read(u32, bytes, 46);
    } else return error.InvalidHeader;
    if (width <= 0 or signed_height == 0 or signed_height == std.math.minInt(i32)) return error.InvalidSize;
    const top_down = signed_height < 0;
    const height: u31 = @intCast(@abs(signed_height));
    const image_width: u31 = @intCast(width);
    if (dib_size == 64 and compression != 0) return error.UnsupportedCompression;
    if (compression > 3 and compression != 6) return error.UnsupportedCompression;
    if ((compression == 1 and bits != 8) or (compression == 2 and bits != 4)) return error.InvalidHeader;
    if ((compression == 1 or compression == 2) and top_down) return error.InvalidHeader;

    var palette: ?[]pixels.Color = null;
    errdefer if (palette) |colors| allocator.free(colors);
    var format: pixels.Format = undefined;
    if (bits == 1 or bits == 2 or bits == 4 or bits == 8) {
        if (compression == 3 or compression == 6) return error.InvalidHeader;
        const capacity = @as(usize, 1) << @as(u6, @intCast(bits));
        const count: usize = if (colors_used == 0) capacity else colors_used;
        if (count == 0 or count > capacity) return error.InvalidPalette;
        const entry_size: usize = if (dib_size == 12) 3 else 4;
        const length = count * entry_size;
        if (palette_start > data_offset or data_offset - palette_start < length) return error.TruncatedData;
        const colors = try allocator.alloc(pixels.Color, count);
        palette = colors;
        for (colors, 0..) |*color, i| {
            const start = palette_start + i * entry_size;
            color.* = .{ .r = bytes[start + 2], .g = bytes[start + 1], .b = bytes[start], .a = 255 };
        }
        format = .{ .indexed = try pixels.Indexed.init(@intCast(bits), .msb_first) };
    } else if (bits == 15 or bits == 16 or bits == 24 or bits == 32) {
        if (compression == 1 or compression == 2) return error.InvalidHeader;
        var masks: pixels.Packed.Masks = if (bits <= 16)
            .{ .r = 0x7c00, .g = 0x3e0, .b = 0x1f }
        else
            .{ .r = 0xff0000, .g = 0xff00, .b = 0xff, .a = if (bits == 32) 0xff000000 else 0 };
        if (compression == 3 or compression == 6) {
            const start: usize = 54;
            const mask_count: usize = if (compression == 6 or dib_size >= 56) 4 else 3;
            if (dib_size < 40 or data_offset < start + mask_count * 4) return error.InvalidHeader;
            masks = .{ .r = read(u32, bytes, start), .g = read(u32, bytes, start + 4), .b = read(u32, bytes, start + 8), .a = if (mask_count == 4) read(u32, bytes, start + 12) else 0 };
            if (dib_size == 40) palette_start = start + mask_count * 4;
        }
        format = .{ .masked = try pixels.Packed.from_masks(@intCast((@as(u32, bits) + 7) / 8), .little, masks) };
    } else return error.UnsupportedBitDepth;
    if (data_offset < palette_start) return error.InvalidHeader;

    var image = try surface.Surface.init(allocator, image_width, height, format, palette);
    errdefer image.deinit();
    if (compression == 1 or compression == 2) {
        try decode_rle(bytes[data_offset..], image.view, compression == 1);
    } else {
        const row_bits = std.math.mul(usize, image_width, if (bits == 15) @as(usize, 16) else bits) catch return error.Overflow;
        const pitch = (std.math.add(usize, row_bits, 31) catch return error.Overflow) / 32 * 4;
        const size = std.math.mul(usize, pitch, height) catch return error.Overflow;
        if (bytes.len - data_offset < size) return error.TruncatedData;
        for (0..height) |row| {
            const destination_y = if (top_down) row else height - row - 1;
            const output = try image.view.row(destination_y);
            @memcpy(output, bytes[data_offset + row * pitch ..][0..output.len]);
        }
        if (bits == 32 and compression == 0 and options.alpha != .preserve) {
            var has_alpha = false;
            for (0..height) |y| {
                const row = try image.view.row(y);
                for (0..image_width) |x| if (row[x * 4 + 3] != 0) {
                    has_alpha = true;
                    break;
                };
            }
            // Legacy BMPs often store unused zero high bytes. SDL interprets an
            // entirely zero alpha plane as opaque rather than invisible pixels.
            if (!has_alpha or options.alpha == .force_opaque) for (0..height) |y| {
                const row = try image.view.row(y);
                for (0..image_width) |x| row[x * 4 + 3] = 255;
            };
        }
    }
    return .{ .surface = image, .palette = palette };
}

fn decode_rle(bytes: []const u8, view: surface.View, eight_bit: bool) Error!void {
    const indexed = view.format.indexed;
    var cursor: usize = 0;
    var x: usize = 0;
    var y: usize = view.height - 1;
    var past_last_row = false;
    while (cursor < bytes.len) {
        if (bytes.len - cursor < 2) return error.TruncatedData;
        const count = bytes[cursor];
        const value = bytes[cursor + 1];
        cursor += 2;
        if (count != 0) {
            if (past_last_row or x > view.width or view.width - x < count) return error.InvalidData;
            const row = try view.row(y);
            for (0..count) |i| try indexed.write_index(row, x + i, if (eight_bit) value else if (i & 1 == 0) value >> 4 else value & 15);
            x += count;
        } else switch (value) {
            0 => {
                x = 0;
                if (y == 0) past_last_row = true else y -= 1;
            },
            1 => return,
            2 => {
                if (past_last_row or bytes.len - cursor < 2) return error.TruncatedData;
                const dx = bytes[cursor];
                const dy = bytes[cursor + 1];
                cursor += 2;
                if (x > view.width or view.width - x < dx or y < dy) return error.InvalidData;
                x += dx;
                y -= dy;
            },
            else => {
                if (past_last_row or x > view.width or view.width - x < value) return error.InvalidData;
                const length: usize = if (eight_bit) value else (@as(usize, value) + 1) / 2;
                const padded = length + (length & 1);
                if (bytes.len - cursor < padded) return error.TruncatedData;
                const row = try view.row(y);
                for (0..value) |i| {
                    const byte = bytes[cursor + (if (eight_bit) i else i / 2)];
                    try indexed.write_index(row, x + i, if (eight_bit) byte else if (i & 1 == 0) byte >> 4 else byte & 15);
                }
                cursor += padded;
                x += value;
            },
        }
    }
    return error.TruncatedData; // A bounded compressed stream must terminate.
}

/// Encodes a view as a 32-bit V4 BMP with explicit RGBA masks and sRGB metadata.
/// Alpha is preserved. The caller frees the returned byte buffer with allocator;
/// file writing is a separate std.Io operation, not a hidden side effect here.
pub fn encode(allocator: std.mem.Allocator, view: surface.View) Error![]u8 {
    if (view.width == 0 or view.height == 0) return error.InvalidSize;
    const pitch = std.math.mul(usize, view.width, 4) catch return error.Overflow;
    const data_size = std.math.mul(usize, pitch, view.height) catch return error.Overflow;
    const size = std.math.add(usize, data_size, 122) catch return error.Overflow;
    const encoded_size = std.math.cast(u32, size) orelse return error.Overflow;
    const output = try allocator.alloc(u8, size);
    errdefer allocator.free(output);
    @memset(output, 0);
    @memcpy(output[0..2], "BM");
    write(u32, output, 2, encoded_size);
    write(u32, output, 10, 122);
    write(u32, output, 14, 108);
    write(i32, output, 18, view.width);
    write(i32, output, 22, view.height);
    write(u16, output, 26, 1);
    write(u16, output, 28, 32);
    write(u32, output, 30, 3);
    write(u32, output, 34, @intCast(data_size));
    write(u32, output, 54, 0xff0000);
    write(u32, output, 58, 0xff00);
    write(u32, output, 62, 0xff);
    write(u32, output, 66, 0xff000000);
    write(u32, output, 70, 0x73524742); // LCS_sRGB in the V4 header.
    for (0..view.height) |y| {
        const row = output[122 + (view.height - y - 1) * pitch ..][0..pitch];
        for (0..view.width) |x| {
            const color = try view.read(x, y);
            @memcpy(row[x * 4 ..][0..4], &[_]u8{ color.b, color.g, color.r, color.a });
        }
    }
    return output;
}
fn read(comptime Integer: type, bytes: []const u8, offset: usize) Integer {
    return std.mem.readInt(Integer, bytes[offset..][0..@divExact(@bitSizeOf(Integer), 8)], .little);
}
fn write(comptime Integer: type, bytes: []u8, offset: usize, value: Integer) void {
    std.mem.writeInt(Integer, bytes[offset..][0..@divExact(@bitSizeOf(Integer), 8)], value, .little);
}
