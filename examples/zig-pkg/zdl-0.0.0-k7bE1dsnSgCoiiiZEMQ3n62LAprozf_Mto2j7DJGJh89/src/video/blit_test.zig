//! Ported from SDL test/testautomation_blit.c. Inputs come from SDL's
//! xoroshiro128+ generator and embedded images; the expected values are SDL's
//! FNV-style hashes of the destination pixels.
const std = @import("std");
const testing = std.testing;
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const pixels_test = @import("pixels_test.zig");
const images = @import("../testdata/images.zig");

const packed_format = pixels_test.packed_format;

const Rng = struct {
    state: [2]u64 = .{ 1, 2 },

    fn next(self: *Rng) u64 {
        const s0 = self.state[0];
        const s1 = self.state[1];
        const result = std.math.rotl(u64, (s0 +% s1) *% 9, 29) +% s0;
        self.state[0] = s0 ^ std.math.rotl(u64, s1, 29);
        self.state[1] = s0 ^ (s1 << 9);
        return result;
    }
    fn next32(self: *Rng) u32 {
        return @truncate(self.next());
    }
};

/// SDL's FNVHash: note the prime is really the FNV offset basis and the start is 0.
fn fnv_hash(words: []const u32) u32 {
    var hash: u32 = 0;
    for (words) |w| {
        hash *%= 0x811C9DC5;
        hash ^= w;
    }
    return hash;
}

fn hash_view(view: surface.View) u32 {
    return fnv_hash(@alignCast(std.mem.bytesAsSlice(u32, view.data[0 .. @as(usize, view.width) * view.height * 4])));
}

// blit_testExampleApplicationRender
test "sdl blit: example application render" {
    const a = testing.allocator;
    var dest = try surface.Surface.init(a, 32, 32, packed_format("ARGB8888"), null);
    defer dest.deinit();
    var background = try images.blending_background.to_surface(a);
    defer background.deinit();
    var sprite = try images.blending_sprite.to_surface(a);
    defer sprite.deinit();
    // SDL surfaces whose format has alpha default to the BLEND blend mode.
    _ = try dest.view.blit(a, background.view, .{ .blend = surface.Blend.ALPHA });
    _ = try dest.view.blit(a, sprite.view, .{ .blend = surface.Blend.ALPHA });
    try testing.expectEqual(0xe345d7a7, hash_view(dest.view));
}

// blit_testRandomToRandomSVGA
test "sdl blit: random to random SVGA" {
    const a = testing.allocator;
    const width = 800;
    const height = 600;
    var rng: Rng = .{};
    const dest_pixels = try a.alloc(u32, width * height);
    defer a.free(dest_pixels);
    const src_pixels = try a.alloc(u32, width * height);
    defer a.free(src_pixels);
    for (dest_pixels) |*p| p.* = rng.next32();
    for (src_pixels) |*p| p.* = rng.next32();
    const dest = try surface.View.init(std.mem.sliceAsBytes(dest_pixels), width, height, width * 4, packed_format("BGRA8888"), null);
    const src = try surface.View.init(std.mem.sliceAsBytes(src_pixels), width, height, width * 4, packed_format("RGBA8888"), null);
    _ = try dest.blit(a, src, .{ .blend = surface.Blend.ALPHA });
    try testing.expectEqual(0x42140c5f, hash_view(dest));
}

// blit_testRandomToRandomSVGAMultipleIterations
test "sdl blit: random to random SVGA multiple iterations" {
    const a = testing.allocator;
    const width = 800;
    const height = 600;
    var rng: Rng = .{};
    var src = try surface.Surface.init(a, 15, 15, packed_format("RGBA8888"), null);
    defer src.deinit();
    var dest = try surface.Surface.init(a, width, height, packed_format("ABGR8888"), null);
    defer dest.deinit();
    for (0..250000) |_| {
        for (0..15 * 15) |i| std.mem.writeInt(u32, src.view.data[i * 4 ..][0..4], rng.next32(), .little);
        const location: i32 = @bitCast(rng.next32());
        const x = @rem(location, width - 15 - 1);
        const y = @rem(location, height - 15 - 1);
        _ = try dest.view.blit(a, src.view, .{ .destination = .{ .x = x, .y = y }, .blend = surface.Blend.ALPHA });
    }
    try testing.expectEqual(0x5d26be78, hash_view(dest.view));
}
