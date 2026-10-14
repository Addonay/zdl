//! Byte-oriented pixel formats, palettes and color transfer functions.
//! Format values describe actual storage rather than SDL's encoded integer
//! constants. Masks belong to packed numeric pixels; byte-array formats specify
//! memory channel order directly and are independent of host endianness.
// Ported from video/SDL_pixels.c; native ownership and errors replace the C ABI.
const std = @import("std");
const Endian = std.lang.Endian;

/// Eight-bit, straight-alpha color. Missing alpha in RGB storage is opaque.
pub const Color = struct { r: u8, g: u8, b: u8, a: u8 = 255 };
/// Invalid descriptors and buffers are rejected before access or mutation.
pub const Error = error{ InvalidMasks, InvalidBuffer, InvalidPalette, OutOfBounds, Overflow };

const Channel = struct {
    shift: u5 = 0,
    bits: u5 = 0,
    mask: u32 = 0,

    fn from_mask(mask: u32) Error!Channel {
        if (mask == 0) return .{};
        const count = @popCount(mask);
        if (count > 16) return error.InvalidMasks;
        const shift: u5 = @intCast(@ctz(mask));
        const unshifted = mask >> shift;
        if (!std.math.isPowerOfTwo(unshifted + 1)) return error.InvalidMasks;
        return .{ .shift = shift, .bits = @intCast(count), .mask = mask };
    }

    fn encode(self: Channel, value: u8) u32 {
        if (self.bits == 0) return 0;
        if (self.bits <= 8) return (@as(u32, value) >> @as(u5, @intCast(8 - self.bits))) << self.shift;
        // Repeating the source bits matches SDL's eight-to-ten-bit expansion,
        // and naturally extends the same rule through sixteen-bit components.
        const repeated = (@as(u32, value) << 8) | value;
        return (repeated >> @as(u5, @intCast(16 - self.bits))) << self.shift;
    }

    fn decode(self: Channel, pixel: u32) u8 {
        if (self.bits == 0) return 255;
        const value = (pixel & self.mask) >> self.shift;
        if (self.bits >= 8) return @truncate(value >> @as(u5, @intCast(self.bits - 8)));
        // Partial components expand by repeating their bits, matching SDL's
        // lookup tables without keeping hundreds of static table entries.
        var repeated = value;
        var filled = self.bits;
        while (filled < 8) {
            repeated = (repeated << self.bits) | value;
            filled += self.bits;
        }
        return @truncate(repeated >> @as(u5, @intCast(filled - 8)));
    }
};

/// A one-to-four-byte packed pixel with disjoint contiguous component masks.
/// Create with from_masks so mask layout and storage width are checked once.
pub const Packed = struct {
    storage_bytes: u3,
    order: Endian,
    channels: [4]Channel,

    /// Component masks in numeric pixel order, not memory byte order.
    pub const Masks = struct { r: u32, g: u32, b: u32, a: u32 = 0 };

    /// Validates RGB presence, mask overlap, contiguous bits and storage width.
    /// An absent alpha component is decoded as 255 and encoded as no bits.
    pub fn from_masks(storage_bytes: u3, order: Endian, masks: Masks) Error!Packed {
        if (storage_bytes == 0 or storage_bytes > 4 or masks.r == 0 or masks.g == 0 or masks.b == 0) return error.InvalidMasks;
        const values = [_]u32{ masks.r, masks.g, masks.b, masks.a };
        var used: u32 = 0;
        var channels: [4]Channel = undefined;
        for (values, &channels) |mask, *channel| {
            if (used & mask != 0) return error.InvalidMasks;
            used |= mask;
            channel.* = try Channel.from_mask(mask);
        }
        if (storage_bytes < 4) {
            const bits: u5 = @intCast(@as(u6, storage_bytes) * 8);
            if (used >> bits != 0) return error.InvalidMasks;
        }
        return .{ .storage_bytes = storage_bytes, .order = order, .channels = channels };
    }

    /// Packs a color without touching memory or depending on host byte order.
    pub fn pack(self: Packed, color: Color) u32 {
        return self.channels[0].encode(color.r) | self.channels[1].encode(color.g) |
            self.channels[2].encode(color.b) | self.channels[3].encode(color.a);
    }

    /// Expands a numeric pixel to eight-bit color; higher precision components
    /// lose low bits deliberately, matching the byte-color API's representation.
    pub fn unpack(self: Packed, value: u32) Color {
        return .{ .r = self.channels[0].decode(value), .g = self.channels[1].decode(value), .b = self.channels[2].decode(value), .a = self.channels[3].decode(value) };
    }
};

/// Packed palette-index order within a byte; this is not byte endianness.
pub const BitOrder = enum { msb_first, lsb_first };
/// Palette-index storage. One, two, four or eight bits are supported.
pub const Indexed = struct {
    bits: u4,
    order: BitOrder = .msb_first,

    /// Rejects unsupported widths instead of interpreting an arbitrary bit mask.
    pub fn init(bits: u4, order: BitOrder) Error!Indexed {
        if (bits != 1 and bits != 2 and bits != 4 and bits != 8) return error.InvalidMasks;
        return .{ .bits = bits, .order = order };
    }
    /// Reads the encoded index without a palette lookup or color conversion.
    /// This keeps palette identity intact for image decoders and row operations.
    pub fn read_index(self: Indexed, row: []const u8, index: usize) Error!u8 {
        _ = try Indexed.init(self.bits, self.order);
        const per_byte = @as(usize, 8) / self.bits;
        const position = index / per_byte;
        if (position >= row.len) return error.InvalidBuffer;
        const slot = index % per_byte;
        const shift: u3 = @intCast((if (self.order == .msb_first) per_byte - slot - 1 else slot) * self.bits);
        const mask: u8 = @intCast((@as(u16, 1) << self.bits) - 1);
        return (row[position] >> shift) & mask;
    }

    /// Writes one encoded index, preserving neighbours in a shared byte.
    pub fn write_index(self: Indexed, row: []u8, index: usize, value: u8) Error!void {
        _ = try Indexed.init(self.bits, self.order);
        const per_byte = @as(usize, 8) / self.bits;
        const position = index / per_byte;
        if (position >= row.len) return error.InvalidBuffer;
        const slot = index % per_byte;
        const shift: u3 = @intCast((if (self.order == .msb_first) per_byte - slot - 1 else slot) * self.bits);
        const mask: u8 = @intCast((@as(u16, 1) << self.bits) - 1);
        if (value > mask) return error.OutOfBounds;
        row[position] = (row[position] & ~(mask << shift)) | (value << shift);
    }
};

/// Native memory representations. Indexed formats borrow a separate palette;
/// no palette version, reference count or process-global format cache is needed.
pub const Format = union(enum) {
    rgba8,
    bgra8,
    argb8,
    abgr8,
    rgb8,
    bgr8,
    masked: Packed,
    indexed: Indexed,

    /// Storage width of one pixel. Indexed widths may be smaller than a byte.
    pub fn bits_per_pixel(self: Format) usize {
        return switch (self) {
            .rgb8, .bgr8 => 24,
            .masked => |format| @as(usize, format.storage_bytes) * 8,
            .indexed => |format| format.bits,
            else => 32,
        };
    }

    /// Minimal byte width of a complete row, rounding sub-byte pixels upwards.
    pub fn row_bytes(self: Format, width: usize) Error!usize {
        const bits = std.math.mul(usize, width, self.bits_per_pixel()) catch return error.Overflow;
        const rounded = std.math.add(usize, bits, 7) catch return error.Overflow;
        return rounded / 8;
    }

    /// Checks a borrowed palette once when creating a surface/view. Indexed
    /// formats require nonempty colors within their index range. Other formats
    /// need no palette and ignore one if supplied.
    pub fn validate_palette(self: Format, palette: ?[]const Color) Error!void {
        switch (self) {
            .indexed => |format| {
                _ = try Indexed.init(format.bits, format.order);
                const colors = palette orelse return error.InvalidPalette;
                const maximum = @as(usize, 1) << format.bits;
                if (colors.len == 0 or colors.len > maximum) return error.InvalidPalette;
            },
            else => {},
        }
    }

    /// Reads a row pixel without alignment requirements. A palette index that
    /// has no supplied color returns OutOfBounds instead of an invented color.
    pub fn read(self: Format, row: []const u8, index: usize, palette: ?[]const Color) Error!Color {
        if (self == .indexed) {
            try self.validate_palette(palette);
            const format = self.indexed;
            const per_byte = @as(usize, 8) / format.bits;
            const position = index / per_byte;
            if (position >= row.len) return error.InvalidBuffer;
            const slot = index % per_byte;
            const shift: u3 = @intCast((if (format.order == .msb_first) per_byte - slot - 1 else slot) * format.bits);
            const mask: u8 = @intCast((@as(u16, 1) << format.bits) - 1);
            const value = (row[position] >> shift) & mask;
            const colors = palette.?;
            if (value >= colors.len) return error.OutOfBounds;
            return colors[value];
        }
        const width = self.bits_per_pixel() / 8;
        const offset = std.math.mul(usize, index, width) catch return error.Overflow;
        if (offset > row.len or row.len - offset < width) return error.InvalidBuffer;
        const bytes = row[offset..][0..width];
        return switch (self) {
            .rgba8 => .{ .r = bytes[0], .g = bytes[1], .b = bytes[2], .a = bytes[3] },
            .bgra8 => .{ .r = bytes[2], .g = bytes[1], .b = bytes[0], .a = bytes[3] },
            .argb8 => .{ .r = bytes[1], .g = bytes[2], .b = bytes[3], .a = bytes[0] },
            .abgr8 => .{ .r = bytes[3], .g = bytes[2], .b = bytes[1], .a = bytes[0] },
            .rgb8 => .{ .r = bytes[0], .g = bytes[1], .b = bytes[2] },
            .bgr8 => .{ .r = bytes[2], .g = bytes[1], .b = bytes[0] },
            .masked => |format| format.unpack(switch (format.storage_bytes) {
                1 => bytes[0],
                2 => std.mem.readInt(u16, bytes[0..2], format.order),
                3 => std.mem.readInt(u24, bytes[0..3], format.order),
                4 => std.mem.readInt(u32, bytes[0..4], format.order),
                else => unreachable,
            }),
            .indexed => unreachable,
        };
    }

    /// Stores a pixel; sub-byte writes preserve neighbouring palette indices.
    /// Indexed color selection uses SDL's squared RGBA distance and first-match
    /// tie rule. Missing alpha in RGB formats discards the supplied alpha value.
    pub fn write(self: Format, row: []u8, index: usize, color: Color, palette: ?[]const Color) Error!void {
        if (self == .indexed) {
            try self.validate_palette(palette);
            const format = self.indexed;
            const per_byte = @as(usize, 8) / format.bits;
            const position = index / per_byte;
            if (position >= row.len) return error.InvalidBuffer;
            const slot = index % per_byte;
            const shift: u3 = @intCast((if (format.order == .msb_first) per_byte - slot - 1 else slot) * format.bits);
            const mask: u8 = @intCast((@as(u16, 1) << format.bits) - 1);
            const value = try nearest_color(palette.?, color);
            row[position] = (row[position] & ~(mask << shift)) | (value << shift);
            return;
        }
        const width = self.bits_per_pixel() / 8;
        const offset = std.math.mul(usize, index, width) catch return error.Overflow;
        if (offset > row.len or row.len - offset < width) return error.InvalidBuffer;
        const bytes = row[offset..][0..width];
        switch (self) {
            .rgba8 => @memcpy(bytes, &[_]u8{ color.r, color.g, color.b, color.a }),
            .bgra8 => @memcpy(bytes, &[_]u8{ color.b, color.g, color.r, color.a }),
            .argb8 => @memcpy(bytes, &[_]u8{ color.a, color.r, color.g, color.b }),
            .abgr8 => @memcpy(bytes, &[_]u8{ color.a, color.b, color.g, color.r }),
            .rgb8 => @memcpy(bytes, &[_]u8{ color.r, color.g, color.b }),
            .bgr8 => @memcpy(bytes, &[_]u8{ color.b, color.g, color.r }),
            .masked => |format| {
                const value = format.pack(color);
                switch (format.storage_bytes) {
                    1 => bytes[0] = @intCast(value),
                    2 => std.mem.writeInt(u16, bytes[0..2], @intCast(value), format.order),
                    3 => std.mem.writeInt(u24, bytes[0..3], @intCast(value), format.order),
                    4 => std.mem.writeInt(u32, bytes[0..4], value, format.order),
                    else => unreachable,
                }
            },
            .indexed => unreachable,
        }
    }
};

/// Closest palette entry by squared RGBA distance. The first exact match wins.
/// Palettes are borrowed color slices; allocate/share them using std directly.
pub fn nearest_color(palette: []const Color, color: Color) Error!u8 {
    if (palette.len == 0 or palette.len > 256) return error.InvalidPalette;
    var nearest: u8 = 0;
    var distance: u32 = std.math.maxInt(u32);
    for (palette, 0..) |entry, i| {
        const r = @as(i32, entry.r) - color.r;
        const g = @as(i32, entry.g) - color.g;
        const b = @as(i32, entry.b) - color.b;
        const a = @as(i32, entry.a) - color.a;
        const squared: u32 = @intCast(r * r + g * g + b * b + a * a);
        if (squared < distance) {
            nearest = @intCast(i);
            if (squared == 0) break;
            distance = squared;
        }
    }
    return nearest;
}

/// Expands an sRGB channel into linear light; alpha is not gamma-encoded.
/// Negative values follow the linear branch, as in SDL's transfer function.
pub fn srgb_to_linear(value: f32) f32 {
    if (value <= 0.04045) return value / 12.92;
    return std.math.pow(f32, (value + 0.055) / 1.055, 2.4);
}

/// Encodes a linear-light channel as sRGB without clipping its dynamic range.
pub fn linear_to_srgb(value: f32) f32 {
    if (value <= 0.0031308) return value * 12.92;
    const exponent: f32 = 1.0 / 2.4;
    return std.math.pow(f32, value, exponent) * 1.055 - 0.055;
}
