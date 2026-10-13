const std = @import("std");

pub fn nextPowerOfTwo(value: i32) u32 {
    if (value <= 0) return 1;
    return std.math.ceilPowerOfTwo(u32, @intCast(value)) catch unreachable;
}

pub fn greatestCommonDivisor(first: u32, second: u32) u32 {
    var a = first;
    var b = second;
    while (b != 0) {
        const remainder = a % b;
        a = b;
        b = remainder;
    }
    return a;
}

pub const Fraction = struct { numerator: i32, denominator: i32 };

pub fn approximateFraction(value: f32) Fraction {
    const limit = 1000;
    var lower: Fraction = .{ .numerator = 0, .denominator = 1 };
    var upper: Fraction = .{ .numerator = 1, .denominator = 0 };
    while (lower.denominator <= limit and upper.denominator <= limit) {
        const middle: Fraction = .{
            .numerator = lower.numerator + upper.numerator,
            .denominator = lower.denominator + upper.denominator,
        };
        const mediant = @as(f32, @floatFromInt(middle.numerator)) / @as(f32, @floatFromInt(middle.denominator));
        if (value == mediant) {
            if (middle.denominator <= limit) return middle;
            return if (upper.denominator > lower.denominator) upper else lower;
        }
        if (value > mediant) lower = middle else upper = middle;
    }
    return if (lower.denominator > limit) upper else lower;
}

pub fn startsWith(text: []const u8, prefix: []const u8) bool {
    return std.mem.startsWith(u8, text, prefix);
}

pub fn endsWith(text: []const u8, suffix: []const u8) bool {
    return suffix.len != 0 and std.mem.endsWith(u8, text, suffix);
}
