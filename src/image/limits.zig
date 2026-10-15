//! Resource limits shared by every decoder.
//!
//! Limits are checked against header fields before any large allocation, so
//! hostile input cannot exhaust memory. They bound encoded input and final
//! pixels; a decoder's temporary working set is reported separately where it
//! matters, because it cannot always be avoided without changing quality.
//!
//! The defaults suit desktop textures and photographs. A server accepting
//! uploads should lower `max_pixels`; a tool that must open very large images
//! should raise `max_input_bytes`.
const std = @import("std");

pub const Limits = struct {
    /// Encoded bytes accepted. Checked before parsing.
    max_input_bytes: usize = 256 * 1024 * 1024,
    max_width: u31 = 32768,
    max_height: u31 = 32768,
    /// Total decoded pixels across all frames of an animation.
    max_pixels: usize = 64 * 1024 * 1024,
    /// Final output bytes, which bounds the surface a caller receives.
    max_output_bytes: usize = 256 * 1024 * 1024,

    /// True when a width and height fit every limit, including the RGBA8
    /// worst case. Decoders call this before allocating output pixels.
    pub fn accepts(self: Limits, width: u32, height: u32) bool {
        if (width == 0 or height == 0) return false;
        if (width > self.max_width or height > self.max_height) return false;
        const count = std.math.mul(usize, width, height) catch return false;
        if (count > self.max_pixels) return false;
        return count <= self.max_output_bytes / 4;
    }

    /// Bounds for a multi-frame image: the per-frame count must leave room for
    /// the requested number of frames inside `max_pixels`.
    pub fn acceptsFrames(self: Limits, width: u32, height: u32, frames: u32) bool {
        if (!self.accepts(width, height)) return false;
        const count = std.math.mul(usize, width, height) catch return false;
        const total = std.math.mul(usize, count, frames) catch return false;
        return total <= self.max_pixels;
    }
};

test "limits reject oversized headers before allocation" {
    const limits: Limits = .{ .max_width = 100, .max_height = 100, .max_pixels = 1000 };
    try std.testing.expect(limits.accepts(10, 100));
    try std.testing.expect(!limits.accepts(101, 10));
    try std.testing.expect(!limits.accepts(0, 10));
    try std.testing.expect(!limits.accepts(100, 100)); // 10000 pixels
    try std.testing.expect(limits.acceptsFrames(10, 10, 10));
    try std.testing.expect(!limits.acceptsFrames(10, 10, 11));
}
