//! These tests explicitly require installed Pango/PangoCairo/Cairo/GObject.
//! Missing providers fail this opt-in suite instead of producing green skips.
const std = @import("std");
const paragraph = @import("paragraph.zig");
const Library = paragraph.Library;
const Snapshot = paragraph.Snapshot;

test "paragraph optional provider absence and missing symbols reject construction" {
    inline for (.{ "pango", "pangocairo", "gobject", "cairo" }) |field| {
        var paths: paragraph.Paths = .{};
        @field(paths, field) = "/zdl-nonexistent-provider-for-fixture.so";
        if (Library.open_resident(paths)) |value| {
            var library = value;
            library.deinit();
            return error.ExpectedUnavailable;
        } else |_| {}
    }
    try std.testing.expectError(error.MissingSymbol, Library.open_resident(.{ .pango = "libc.so.6" }));
}

test "paragraph visual motion respects combining grapheme and reverse traversal" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    var snapshot = try Snapshot.init(std.testing.allocator, &library, "Ae\u{301}B", .{});
    defer snapshot.deinit();
    const expected = [_]usize{ 0, 1, 4, 5 };
    var cursor: paragraph.Cursor = .{ .index = 0 };
    var index: usize = 0;
    while (true) {
        try std.testing.expect(index < expected.len);
        try std.testing.expectEqual(expected[index], try snapshot.byte_offset(cursor));
        index += 1;
        cursor = try snapshot.move(cursor, true, true) orelse break;
    }
    try std.testing.expectEqual(expected.len, index);
    cursor = .{ .index = snapshot.text.len };
    index = expected.len;
    while (true) {
        try std.testing.expect(index != 0);
        index -= 1;
        try std.testing.expectEqual(expected[index], try snapshot.byte_offset(cursor));
        cursor = try snapshot.move(cursor, false, true) orelse break;
    }
    try std.testing.expectEqual(@as(usize, 0), index);
}

test "paragraph mixed bidi has distinct affinities and nonlogical visual order" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    var snapshot = try Snapshot.init(std.testing.allocator, &library, "abc אבג xyz العربية", .{ .font = "Liberation Sans 20" });
    defer snapshot.deinit();
    try std.testing.expectEqual(@as(usize, 0), snapshot.missing_glyphs());
    const carets = try snapshot.carets(4);
    try std.testing.expect(@abs(carets.strong.x - carets.weak.x) > 1);
    var cursor: paragraph.Cursor = .{ .index = 0 };
    var reversed = false;
    var steps: usize = 0;
    while (try snapshot.move(cursor, true, true)) |next| {
        const previous = try snapshot.byte_offset(cursor);
        const offset = try snapshot.byte_offset(next);
        reversed = reversed or offset < previous;
        cursor = next;
        steps += 1;
        try std.testing.expect(steps <= snapshot.text.len * 2);
    }
    try std.testing.expect(reversed);
    try std.testing.expectError(error.InvalidPosition, snapshot.carets(5)); // Hebrew continuation byte.
}

test "paragraph ASCII carets hit-test to the same UTF-8 position" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    var snapshot = try Snapshot.init(std.testing.allocator, &library, "abc xyz", .{});
    defer snapshot.deinit();
    for (0..snapshot.text.len) |offset| {
        const caret = (try snapshot.carets(offset)).strong;
        const hit = try snapshot.hit_test(caret.x, caret.y + caret.height / 2);
        try std.testing.expect(hit.inside);
        try std.testing.expectEqual(offset, try snapshot.byte_offset(hit.cursor));
    }
    const outside = try snapshot.hit_test(-100, -100);
    try std.testing.expect(!outside.inside);
    try std.testing.expectError(error.InvalidPosition, snapshot.hit_test(std.math.nan(f64), 0));
}

fn lifetime(allocator: std.mem.Allocator, library: *Library) !void {
    var input = [_]u8{ 'a', 'b', 'c' };
    var snapshot = try Snapshot.init(allocator, library, &input, .{});
    var alive = true;
    defer if (alive) snapshot.deinit();
    input[0] = 'x';
    try std.testing.expectEqualStrings("abc", snapshot.text);
    var image = try snapshot.rasterize();
    defer image.deinit();
    var repeated = try snapshot.rasterize();
    defer repeated.deinit();
    try std.testing.expectEqualSlices(u8, image.pixels, repeated.pixels);
    const hash = std.hash.Wyhash.hash(0, image.pixels);
    snapshot.deinit();
    alive = false;
    try std.testing.expectEqual(hash, std.hash.Wyhash.hash(0, image.pixels));
    var ink: usize = 0;
    for (0..image.height) |y| {
        const row = image.pixels[y * image.stride ..][0 .. image.width * 4];
        for (0..image.width) |x| {
            const value = std.mem.readInt(u32, row[x * 4 ..][0..4], @import("builtin").target.cpu.arch.endian());
            try std.testing.expectEqual(@as(u32, 255), value >> 24);
            if (value & 0x00ffffff != 0x00ffffff) ink += 1;
        }
    }
    try std.testing.expect(ink > 20);
}

test "paragraph owns input and bitmap outlives layout including allocation failure" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    try lifetime(std.testing.allocator, &library);
    try std.testing.checkAllAllocationFailures(std.testing.allocator, lifetime, .{&library});
}

test "paragraph wrapping and invalid input limits are explicit" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    var snapshot = try Snapshot.init(std.testing.allocator, &library, "A narrow paragraph wraps several words, including cafe\u{301} and العربية. Another line.", .{ .width_px = 120 });
    defer snapshot.deinit();
    try std.testing.expect(snapshot.line_count() > 3);
    var image = try snapshot.rasterize();
    defer image.deinit();
    try std.testing.expect(image.height > 100);
    try std.testing.expectError(error.InvalidUtf8, Snapshot.init(std.testing.allocator, &library, "\xff", .{}));
    try std.testing.expectError(error.InvalidOptions, Snapshot.init(std.testing.allocator, &library, "a\x00b", .{}));
    try std.testing.expectError(error.InvalidOptions, Snapshot.init(std.testing.allocator, &library, "abc", .{ .width_px = 0 }));
    try std.testing.expectError(error.InvalidOptions, Snapshot.init(std.testing.allocator, &library, "abc", .{ .dpi = std.math.inf(f64) }));
    try std.testing.expectError(error.InvalidOptions, Snapshot.init(std.testing.allocator, &library, "abc", .{ .font = "Sans 100000" }));
}

test "paragraph resident provider supports repeated object and handle lifetimes" {
    for (0..16) |_| {
        var library = try Library.open_resident(.{});
        var snapshot = try Snapshot.init(std.testing.allocator, &library, "مرحبا hello", .{});
        var image = try snapshot.rasterize();
        image.deinit();
        snapshot.deinit();
        library.deinit();
    }
}

test "paragraph logical stops use provider grapheme boundaries including emoji and empty text" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    inline for (.{ "e\u{301}", "👩‍👩‍👧‍👦", "🇺🇸" }) |source| {
        var snapshot = try Snapshot.init(std.testing.allocator, &library, source, .{});
        defer snapshot.deinit();
        try std.testing.expectEqualSlices(usize, &.{ 0, source.len }, snapshot.stops());
        try std.testing.expectEqual(@as(?usize, 0), snapshot.adjacent_stop(source.len, false));
    }
    var empty = try Snapshot.init(std.testing.allocator, &library, "", .{});
    defer empty.deinit();
    try std.testing.expectEqualSlices(usize, &.{0}, empty.stops());
}

test "paragraph bidi selection splits and decorated raster uses the same layout" {
    var library = try Library.open_resident(.{});
    defer library.deinit();
    var snapshot = try Snapshot.init(std.testing.allocator, &library, "abc אבג xyz", .{});
    defer snapshot.deinit();
    const rectangles = try snapshot.selection_rects(std.testing.allocator, 1, 8);
    defer std.testing.allocator.free(rectangles);
    try std.testing.expect(rectangles.len >= 2);
    for (rectangles) |box| try std.testing.expect(box.width >= 0 and box.height > 0);
    var plain = try snapshot.rasterize();
    defer plain.deinit();
    var decorated = try snapshot.rasterize_decorated(.{ .selection = .{ .start = 1, .end = 8 }, .cursor = .{ .index = 8 } });
    defer decorated.deinit();
    try std.testing.expect(!std.mem.eql(u8, plain.pixels, decorated.pixels));
}
