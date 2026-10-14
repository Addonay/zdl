//! Sixteen-byte identifiers. Parsing and formatting never allocate.
const std = @import("std");

pub const ParseError = error{ InvalidLength, InvalidCharacter };

/// A value identifier, independent of any operating-system ABI.
/// Store or send `data` explicitly when a stable byte representation is needed.
pub const Guid = struct {
    /// Bytes in display order, not a host-endian integer representation.
    data: [16]u8 = @splat(0),

    /// Accepts exactly 32 hexadecimal digits, without separators.
    pub fn parse(text: []const u8) ParseError!Guid {
        if (text.len != 32) return error.InvalidLength;
        var result: Guid = .{};
        for (&result.data, 0..) |*byte, i| {
            byte.* = (try hex_digit(text[i * 2]) << 4) | try hex_digit(text[i * 2 + 1]);
        }
        return result;
    }

    /// Returns lowercase hexadecimal text without a terminator or allocation.
    pub fn to_string(self: Guid) [32]u8 {
        const alphabet = "0123456789abcdef";
        var result: [32]u8 = undefined;
        for (self.data, 0..) |byte, i| {
            result[i * 2] = alphabet[byte >> 4];
            result[i * 2 + 1] = alphabet[byte & 0x0f];
        }
        return result;
    }

    /// Supports Zig's `{f}` formatting without allocating.
    pub fn format(self: Guid, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        const text = self.to_string();
        try writer.writeAll(&text);
    }
};

fn hex_digit(char: u8) ParseError!u8 {
    return switch (char) {
        '0'...'9' => char - '0',
        'A'...'F' => char - 'A' + 10,
        'a'...'f' => char - 'a' + 10,
        else => error.InvalidCharacter,
    };
}
