//! Shared logical paint geometry and color policy.
pub const Point = struct { x: f64, y: f64 };
pub const Rect = struct { x: f64, y: f64, width: f64, height: f64 };
/// Straight-alpha components in the packet policy's encoding; backends convert
/// to premultiplied working storage. Alpha is always finite and in [0,1].
pub const Color = struct { r: f64, g: f64, b: f64, a: f64 = 1 };
pub const ColorPolicy = enum { srgb_compatible, linear, extended_linear };
/// x'=xx*x+xy*y+x0; y'=yx*x+yy*y+y0. concat right-multiplies local transforms.
pub const Affine = struct {
    xx: f64 = 1,
    yx: f64 = 0,
    xy: f64 = 0,
    yy: f64 = 1,
    x0: f64 = 0,
    y0: f64 = 0,
    pub const identity: Affine = .{};
    pub fn point(self: Affine, value: Point) Point {
        return .{ .x = self.xx * value.x + self.xy * value.y + self.x0, .y = self.yx * value.x + self.yy * value.y + self.y0 };
    }
    pub fn concat(self: Affine, local: Affine) Affine {
        return .{ .xx = self.xx * local.xx + self.xy * local.yx, .xy = self.xx * local.xy + self.xy * local.yy, .yx = self.yx * local.xx + self.yy * local.yx, .yy = self.yx * local.xy + self.yy * local.yy, .x0 = self.xx * local.x0 + self.xy * local.y0 + self.x0, .y0 = self.yx * local.x0 + self.yy * local.y0 + self.y0 };
    }
};
