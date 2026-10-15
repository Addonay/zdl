//! Animated image models: fully composed frames and the shared canvas.
//!
//! Every animation-capable decoder produces the same result: a list of owned
//! RGBA8 surfaces, each already composited over the canvas as the format's
//! animation model requires, plus the per-frame duration. Keeping composition
//! in the decoders means callers never reimplement disposal handling, and a
//! frame stays valid for as long as the animation does.
//!
//! `Canvas` is the incremental piece shared by GIF, APNG and animated WebP: it
//! holds the visible canvas, the previous-canvas snapshot that "restore to
//! previous" needs, and the source-over blend.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");

pub const Error = surface.Error || std.mem.Allocator.Error || error{ InvalidSize, TruncatedAnimation };

/// Frame disposal recorded by the container. Decoders apply it while composing,
/// so it is reported for callers that want to inspect the animation's structure.
pub const Disposal = enum {
    /// Leave the composited frame on the canvas.
    none,
    /// Clear the frame's rectangle to transparent before the next frame.
    background,
    /// Restore the canvas as it was before the frame was drawn.
    previous,
};

/// One composed frame of an animation. The caller owns it and releases it with
/// `Animation.deinit`.
pub const Frame = struct {
    surface: surface.Surface,
    /// Display time in milliseconds; zero marks a frame to be skipped.
    duration_ms: u32,
    index: u32,
    disposal: Disposal = .none,
};

/// An animation's composed frames. Owned by the caller.
pub const Animation = struct {
    allocator: std.mem.Allocator,
    frames: []Frame,
    width: u31,
    height: u31,
    /// Number of extra iterations; zero means loop forever, which is also what
    /// still images report.
    loop_count: u16 = 0,

    pub fn deinit(self: *Animation) void {
        for (self.frames) |*frame| frame.surface.deinit();
        self.allocator.free(self.frames);
        self.* = undefined;
    }

    /// Sum of all frame durations, ignoring the loop count.
    pub fn totalDurationMs(self: Animation) u64 {
        var total: u64 = 0;
        for (self.frames) |frame| total += frame.duration_ms;
        return total;
    }

    /// Composites every frame onto an opaque background color, dropping alpha.
    /// Useful for previewing an animation in a surface that cannot blend.
    pub fn flatten(self: Animation, allocator: std.mem.Allocator, background: pixels.Color) Error!surface.Surface {
        const out = try surface.Surface.init(allocator, self.width, self.height, .rgba8, null);
        errdefer out.deinit();
        for (self.frames) |frame| {
            for (0..out.view.height) |y| {
                const dst = try out.view.row(y);
                const src = try frame.surface.view.row(y);
                blendRow(dst, src, background);
            }
        }
        return out;
    }
};

/// Source-over composite of straight-alpha rows. Fully opaque source pixels are
/// copied wholesale, which is the common case for the lossless animation
/// formats and keeps those decoders close to memcpy speed.
pub fn blendRow(dst: []u8, src: []const u8, background: pixels.Color) void {
    var x: usize = 0;
    while (x + 4 <= dst.len) : (x += 4) {
        const a = src[x + 3];
        if (a == 255) {
            @memcpy(dst[x..][0..4], src[x..][0..4]);
            continue;
        }
        if (a == 0) {
            const flat = [4]u8{ background.r, background.g, background.b, background.a };
            @memcpy(dst[x..][0..4], &flat);
            continue;
        }
        const inv: u16 = 255 - a;
        dst[x + 0] = @intCast((@as(u16, src[x + 0]) * a + @as(u16, background.r) * inv + 127) / 255);
        dst[x + 1] = @intCast((@as(u16, src[x + 1]) * a + @as(u16, background.g) * inv + 127) / 255);
        dst[x + 2] = @intCast((@as(u16, src[x + 2]) * a + @as(u16, background.b) * inv + 127) / 255);
        // Output alpha is the union of the two coverages.
        dst[x + 3] = @intCast(@min(255, @as(u32, a) + (@as(u32, background.a) * inv + 127) / 255));
    }
}

/// Source-over composite of one straight-alpha frame rectangle onto a canvas.
/// Both buffers are RGBA8 rows of the full canvas width.
pub fn blendRegion(
    canvas: []u8,
    src: []const u8,
    canvas_width: usize,
    x: usize,
    y: usize,
    width: usize,
    height: usize,
) void {
    for (0..height) |row| {
        const dst = canvas[(y + row) * canvas_width * 4 ..][x * 4 ..][0 .. width * 4];
        const source = src[row * width * 4 ..][0 .. width * 4];
        blendRow(dst, source, .{ .r = 0, .g = 0, .b = 0, .a = 0 });
    }
}

/// Incremental animation canvas: the visible surface, the snapshot needed by
/// "restore to previous", and the frame's placement rectangle.
pub const Canvas = struct {
    allocator: std.mem.Allocator,
    width: usize,
    height: usize,
    data: []u8,
    /// Snapshot of the canvas taken before the current frame is drawn.
    previous: ?[]u8 = null,

    pub fn init(allocator: std.mem.Allocator, width: usize, height: usize) Error!Canvas {
        if (width == 0 or height == 0) return error.InvalidSize;
        const count = std.math.mul(usize, std.math.mul(usize, width, height) catch return error.InvalidSize, 4) catch return error.InvalidSize;
        return .{ .allocator = allocator, .width = width, .height = height, .data = try allocator.alloc(u8, count) };
    }

    pub fn deinit(self: *Canvas) void {
        self.allocator.free(self.data);
        if (self.previous) |saved| self.allocator.free(saved);
        self.* = undefined;
    }

    /// Clears the visible canvas to fully transparent.
    pub fn clear(self: *Canvas) void {
        @memset(self.data, 0);
    }

    /// Saves the canvas for a later "restore to previous" disposal.
    pub fn snapshot(self: *Canvas) Error!void {
        const next = try self.allocator.dupe(u8, self.data);
        if (self.previous) |old| self.allocator.free(old);
        self.previous = next;
    }

    /// Restores the snapshot taken by `snapshot`, if any.
    pub fn restore(self: *Canvas) void {
        if (self.previous) |saved| @memcpy(self.data, saved);
    }

    /// Clears a rectangle to transparent, the "restore to background" disposal.
    pub fn clearRect(self: *Canvas, x: usize, y: usize, width: usize, height: usize) void {
        for (0..height) |row| {
            const start = (y + row) * self.width * 4 + x * 4;
            @memset(self.data[start..][0 .. width * 4], 0);
        }
    }
};

/// Appends a composed canvas snapshot as a new frame of `frames`.
pub fn appendFrame(
    allocator: std.mem.Allocator,
    frames: *std.ArrayList(Frame),
    canvas: Canvas,
    duration_ms: u32,
    index: u32,
    disposal: Disposal,
) Error!void {
    const copy = try allocator.dupe(u8, canvas.data);
    errdefer allocator.free(copy);
    try frames.append(allocator, .{
        .surface = .{ .allocator = allocator, .view = try surface.View.init(copy, @intCast(canvas.width), @intCast(canvas.height), canvas.width * 4, .rgba8, null) },
        .duration_ms = duration_ms,
        .index = index,
        .disposal = disposal,
    });
}

test "blendRow composites straight alpha over a background" {
    var dst = [_]u8{ 0, 0, 0, 255 };
    blendRow(&dst, &.{ 255, 0, 0, 128 }, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    try std.testing.expect(dst[0] > 120 and dst[0] < 136);
    try std.testing.expectEqual(@as(u8, 255), dst[3]);
    blendRow(&dst, &.{ 0, 0, 0, 0 }, .{ .r = 10, .g = 20, .b = 30, .a = 255 });
    try std.testing.expectEqual(@as(u8, 10), dst[0]);
}

test "canvas snapshot and rectangle clearing" {
    var canvas = try Canvas.init(std.testing.allocator, 4, 4);
    defer canvas.deinit();
    @memset(canvas.data, 0xff);
    try canvas.snapshot();
    @memset(canvas.data, 0x00);
    canvas.restore();
    for (canvas.data) |byte| try std.testing.expectEqual(@as(u8, 0xff), byte);
    canvas.clearRect(1, 1, 2, 2);
    try std.testing.expectEqual(@as(u8, 0xff), canvas.data[0]);
    try std.testing.expectEqual(@as(u8, 0x00), canvas.data[(1 * 4 + 1) * 4]);
}
