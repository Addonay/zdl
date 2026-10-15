//! Ported from SDL test/testautomation_guid.c (TestStringToGUID, TestGUIDToString).
const std = @import("std");
const testing = std.testing;
const Guid = @import("guid.zig").Guid;

const Case = struct { text: []const u8, upper: u64, lower: u64 };

const cases = [_]Case{
    .{ .text = "0000000000000000" ++ "ffffffffffffffff", .upper = 0x0000000000000000, .lower = 0xffffffffffffffff },
    .{ .text = "0011223344556677" ++ "8091a2b3c4d5e6f0", .upper = 0x0011223344556677, .lower = 0x8091a2b3c4d5e6f0 },
    .{ .text = "a011223344556677" ++ "8091a2b3c4d5e6f0", .upper = 0xa011223344556677, .lower = 0x8091a2b3c4d5e6f0 },
    .{ .text = "a011223344556677" ++ "8091a2b3c4d5e6f1", .upper = 0xa011223344556677, .lower = 0x8091a2b3c4d5e6f1 },
    .{ .text = "a011223344556677" ++ "8191a2b3c4d5e6f0", .upper = 0xa011223344556677, .lower = 0x8191a2b3c4d5e6f0 },
};

fn expected_bytes(c: Case) [16]u8 {
    var out: [16]u8 = undefined;
    std.mem.writeInt(u64, out[0..8], c.upper, .big);
    std.mem.writeInt(u64, out[8..16], c.lower, .big);
    return out;
}

test "sdl guid: string to guid" {
    for (cases) |c| {
        const guid = try Guid.parse(c.text);
        try testing.expectEqualSlices(u8, &expected_bytes(c), &guid.data);
    }
}

test "sdl guid: guid to string" {
    for (cases) |c| {
        const guid: Guid = .{ .data = expected_bytes(c) };
        try testing.expectEqualStrings(c.text, &guid.to_string());
        var buffer: [32]u8 = undefined;
        try testing.expectEqualStrings(c.text, try std.fmt.bufPrint(&buffer, "{f}", .{guid}));
    }
}
