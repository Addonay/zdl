//! Headless software framebuffer used by SDL's offscreen video driver.
//!
//! A Framebuffer owns a zeroed, tightly defined raster allocation. Its View is
//! borrowed and becomes invalid when the framebuffer is resized or deinitialized.
//! No display server, EGL implementation, or C library is needed for software use.
const std = @import("std");
const surface = @import("../surface.zig");
const pixels = @import("../pixels.zig");
const geometry = @import("../geometry.zig");

pub const Error = surface.Error || geometry.GeometryError || error{SizeMismatch};

/// Owned software pixels for one offscreen window. The public raster is BGRA8;
/// this keeps a four-byte pixel layout while the unused X channel of SDL's
/// XRGB8888 framebuffer is represented as opaque alpha.
pub const Framebuffer = struct {
    allocator: std.mem.Allocator,
    image: surface.Surface,

    /// Allocates a zero-filled BGRA8 framebuffer without touching the display.
    pub fn init(allocator: std.mem.Allocator, width: u32, height: u32) Error!Framebuffer {
        if (width == 0 or height == 0 or width > std.math.maxInt(u31) or height > std.math.maxInt(u31)) return error.InvalidSize;
        var image = try surface.Surface.init(allocator, @intCast(width), @intCast(height), .bgra8, null);
        errdefer image.deinit();
        try image.view.fill(.{ .r = 0, .g = 0, .b = 0, .a = 255 }, null);
        return .{ .allocator = allocator, .image = image };
    }

    /// Current dimensions in pixels.
    pub fn size(self: *const Framebuffer) Size {
        return .{ .width = self.image.view.width, .height = self.image.view.height };
    }

    /// Borrow the mutable raster. The borrow ends at resize or deinit.
    pub fn view(self: *Framebuffer) surface.View {
        return self.image.view;
    }

    /// Replaces pixel storage transactionally; a failed allocation preserves
    /// the current image and its borrowed views remain valid.
    pub fn resize(self: *Framebuffer, width: u32, height: u32) Error!void {
        var replacement = try Framebuffer.init(self.allocator, width, height);
        var previous = self.image;
        self.image = replacement.image;
        replacement.image = undefined;
        previous.deinit();
    }

    /// Copies a same-sized raster into the framebuffer, converting its format
    /// through the shared scalar surface code. No row padding is exposed.
    pub fn present(self: *Framebuffer, source: surface.View) Error!void {
        if (source.width != self.image.view.width or source.height != self.image.view.height) return error.SizeMismatch;
        _ = try self.image.view.blit(self.allocator, source, .{});
    }

    /// Releases the owned pixel allocation; all borrowed views become invalid.
    pub fn deinit(self: *Framebuffer) void {
        self.image.deinit();
        self.* = undefined;
    }
};

/// Pixel dimensions of an offscreen framebuffer.
pub const Size = struct { width: u31, height: u31 };

/// A platform window's headless software storage. Window presentation copies
/// into this framebuffer and never connects to a display server.
pub const Window = struct {
    framebuffer: Framebuffer,

    pub fn init(allocator: std.mem.Allocator, width: u32, height: u32) Error!Window {
        return .{ .framebuffer = try Framebuffer.init(allocator, width, height) };
    }

    pub fn resize(self: *Window, width: u32, height: u32) Error!void {
        try self.framebuffer.resize(width, height);
    }

    pub fn present(self: *Window, source: surface.View) Error!void {
        try self.framebuffer.present(source);
    }

    pub fn view(self: *Window) surface.View {
        return self.framebuffer.view();
    }

    pub fn deinit(self: *Window) void {
        self.framebuffer.deinit();
        self.* = undefined;
    }
};

test "offscreen framebuffer allocates and presents without a display" {
    const allocator = std.testing.allocator;
    var framebuffer = try Framebuffer.init(allocator, 3, 2);
    defer framebuffer.deinit();

    try std.testing.expectEqual(Size{ .width = 3, .height = 2 }, framebuffer.size());
    const initial = try framebuffer.view().read(0, 0);
    try std.testing.expectEqual(pixels.Color{ .r = 0, .g = 0, .b = 0, .a = 255 }, initial);

    var source = try surface.Surface.init(allocator, 3, 2, .rgba8, null);
    defer source.deinit();
    try source.view.fill(.{ .r = 21, .g = 80, .b = 144, .a = 190 }, null);
    try framebuffer.present(source.view);
    try std.testing.expectEqual(pixels.Color{ .r = 21, .g = 80, .b = 144, .a = 190 }, try framebuffer.view().read(2, 1));

    try std.testing.expectError(error.SizeMismatch, framebuffer.present(try surface.View.init(&.{}, 0, 0, 0, .rgba8, null)));
    try framebuffer.resize(1, 4);
    try std.testing.expectEqual(Size{ .width = 1, .height = 4 }, framebuffer.size());
}
