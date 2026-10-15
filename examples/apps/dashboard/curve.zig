//! Natural cubic interpolation for the dashboard's uniformly spaced daily data.
//! Values are borrowed. The tridiagonal system enforces zero endpoint second
//! derivatives and equal first/second derivatives at interior knots.
const std = @import("std");
const data = @import("data.zig");
pub const Natural = struct {
    values: []const f64,
    second: [128]f64 = @splat(0),

    pub fn init(values: []const f64) error{InvalidSeries}!Natural {
        if (values.len < 2 or values.len > 128) return error.InvalidSeries;
        for (values) |v| if (!std.math.isFinite(v)) return error.InvalidSeries;
        var result = Natural{ .values = values };
        if (values.len == 2) return result;
        var diagonal: [128]f64 = @splat(4);
        var rhs: [128]f64 = @splat(0);
        for (1..values.len - 1) |i| rhs[i] = 6 * (values[i + 1] - 2 * values[i] + values[i - 1]);
        for (2..values.len - 1) |i| {
            const factor = 1 / diagonal[i - 1];
            diagonal[i] -= factor;
            rhs[i] -= factor * rhs[i - 1];
        }
        var i = values.len - 2;
        while (i > 0) : (i -= 1) result.second[i] = (rhs[i] - result.second[i + 1]) / diagonal[i];
        return result;
    }

    pub fn at(self: *const Natural, position: f64) f64 {
        const p = std.math.clamp(position, 0, @as(f64, @floatFromInt(self.values.len - 1)));
        const i = @min(self.values.len - 2, @as(usize, @intFromFloat(p)));
        const t = p - @as(f64, @floatFromInt(i));
        const u = 1 - t;
        return self.values[i] * u + self.values[i + 1] * t + (self.second[i] * (u * u * u - u) + self.second[i + 1] * (t * t * t - t)) / 6;
    }
};

/// Recharts' five-tick visitor scale rounds up in half-magnitude increments.
pub fn upper_bound(maximum: f64) f64 {
    if (!(maximum > 0)) return 1;
    const rough = maximum / 4;
    const magnitude = std.math.pow(f64, 10, @floor(@log10(rough)));
    const quantum = magnitude / 2;
    return @ceil(rough / quantum) * quantum * 4;
}

test "natural interpolation preserves knots and the reference chart's first control point" {
    var values: [data.visits.len]f64 = undefined;
    for (data.visits, 0..) |v, i| values[i] = 215 - @as(f64, @floatFromInt(v.mobile)) * 210 / 1200;
    const curve = try Natural.init(&values);
    for (values, 0..) |v, i| try std.testing.expectApproxEqAbs(v, curve.at(@floatFromInt(i)), 1e-10);
    // Browser reference: M5,188.75 C8.837,184.600 ... (1440x900).
    const control_y = values[0] + (values[1] - values[0]) / 3 - curve.second[1] / 18;
    try std.testing.expectApproxEqAbs(@as(f64, 184.600), control_y, 0.001);
    try std.testing.expectEqual(@as(f64, 1200), upper_bound(1018));
}

test "two-point natural curve is linear and invalid input is rejected" {
    const curve = try Natural.init(&.{ 10, 20 });
    try std.testing.expectEqual(@as(f64, 12.5), curve.at(0.25));
    try std.testing.expectError(error.InvalidSeries, Natural.init(&.{1}));
}
