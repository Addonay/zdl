//! SDL's GUID representation with native Zig parsing and formatting.
pub const Guid = extern struct {
    data: [16]u8 = @splat(0),

    pub fn parse(text: []const u8) Guid {
        var result: Guid = .{};
        const byte_count = @min(result.data.len, text.len / 2);
        for (result.data[0..byte_count], 0..) |*byte, i| {
            byte.* = (hexDigit(text[i * 2]) << 4) | hexDigit(text[i * 2 + 1]);
        }
        return result;
    }

    pub fn format(self: Guid) [32]u8 {
        const alphabet = "0123456789abcdef";
        var result: [32]u8 = undefined;
        for (self.data, 0..) |byte, i| {
            result[i * 2] = alphabet[byte >> 4];
            result[i * 2 + 1] = alphabet[byte & 0x0f];
        }
        return result;
    }
};

fn hexDigit(char: u8) u8 {
    return switch (char) {
        '0'...'9' => char - '0',
        'A'...'F' => char - 'A' + 10,
        'a'...'f' => char - 'a' + 10,
        else => 0,
    };
}
