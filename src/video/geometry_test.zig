//! Ported from SDL test/testautomation_rect.c. Random inputs of the original are
//! drawn from a fixed-seed generator and repeated; fixed cases keep SDL's values.
//! NULL-parameter cases are not applicable: the Zig API takes values and slices.
const std = @import("std");
const testing = std.testing;
const geometry = @import("geometry.zig");

const Rect = geometry.Rect(i32);
const FRect = geometry.Rect(f32);
const Point = geometry.Point(i32);
const FPoint = geometry.Point(f32);

const max_i32 = std.math.maxInt(i32);
const min_i32 = std.math.minInt(i32);

fn rng() std.Random.DefaultPrng {
    return std.Random.DefaultPrng.init(0x5d1_0ec7);
}

fn range(random: std.Random, lo: i32, hi: i32) i32 {
    return random.intRangeAtMost(i32, lo, hi);
}

fn rect(x: i32, y: i32, w: i32, h: i32) Rect {
    return .{ .x = x, .y = y, .width = w, .height = h };
}

fn frect(x: f32, y: f32, w: f32, h: f32) FRect {
    return .{ .x = x, .y = y, .width = w, .height = h };
}

fn expect_line(comptime T: type, expected: ?[4]T, actual: ?geometry.Line(T)) !void {
    if (expected) |e| {
        const a = actual orelse return error.TestExpectedLine;
        if (T == f32) {
            try testing.expectApproxEqAbs(e[0], a.start.x, 1e-5);
            try testing.expectApproxEqAbs(e[1], a.start.y, 1e-5);
            try testing.expectApproxEqAbs(e[2], a.end.x, 1e-5);
            try testing.expectApproxEqAbs(e[3], a.end.y, 1e-5);
        } else {
            try testing.expectEqual(e[0], a.start.x);
            try testing.expectEqual(e[1], a.start.y);
            try testing.expectEqual(e[2], a.end.x);
            try testing.expectEqual(e[3], a.end.y);
        }
    } else try testing.expectEqual(null, actual);
}

fn line(x1: i32, y1: i32, x2: i32, y2: i32) geometry.Line(i32) {
    return .{ .start = .{ .x = x1, .y = y1 }, .end = .{ .x = x2, .y = y2 } };
}

fn fline(x1: f32, y1: f32, x2: f32, y2: f32) geometry.Line(f32) {
    return .{ .start = .{ .x = x1, .y = y1 }, .end = .{ .x = x2, .y = y2 } };
}

// rect_testIntersectRectAndLineFloat
test "sdl rect: line clipping float" {
    try expect_line(f32, .{ 5, 6, 17.75, 6 }, try frect(2.5, 1.5, 15.25, 12).clip_line(fline(5, 6, 23, 6)));
    try expect_line(f32, .{ 2.5, 6, 2.75, 6 }, try frect(2.5, 1.5, 0.25, 12).clip_line(fline(0, 6, 23, 6)));
    try expect_line(f32, .{ 364, 616.243225, 300, 633.108093 }, try frect(300, 592, 64, 64).clip_line(fline(456, 592, 160, 670)));
}

// rect_testIntersectRectAndLine
test "sdl rect: line clipping integer" {
    var prng = rng();
    const random = prng.random();
    const ref = rect(0, 0, 32, 32);
    for (0..32) |_| {
        const x_left = -range(random, 1, ref.width);
        const x_right = ref.width + range(random, 1, ref.width);
        const y_top = -range(random, 1, ref.height);
        const y_bottom = ref.height + range(random, 1, ref.height);
        try expect_line(i32, .{ 0, 15, 31, 15 }, try ref.clip_line(line(x_left, 15, x_right, 15)));
        try expect_line(i32, .{ 15, 0, 15, 31 }, try ref.clip_line(line(15, y_top, 15, y_bottom)));
    }
    try expect_line(i32, .{ 0, 0, 31, 31 }, try ref.clip_line(line(-32, -32, 64, 64)));
    try expect_line(i32, .{ 31, 31, 0, 0 }, try ref.clip_line(line(64, 64, -32, -32)));
    try expect_line(i32, .{ 0, 31, 31, 0 }, try ref.clip_line(line(-1, 32, 32, -1)));
    try expect_line(i32, .{ 31, 0, 0, 31 }, try ref.clip_line(line(32, -1, -1, 32)));
    // Overflow cases.
    const far = rect(max_i32 - 4, max_i32 - 4, 32, 32);
    try testing.expectEqual(null, try far.clip_line(line(max_i32, min_i32, min_i32, max_i32)));
}

// rect_testIntersectRectAndLineInside
test "sdl rect: line clipping inside" {
    var prng = rng();
    const random = prng.random();
    const ref = rect(0, 0, 32, 32);
    const xmax = 31;
    const ymax = 31;
    for (0..32) |_| {
        const x1 = range(random, 1, xmax - 1);
        const y1 = range(random, 1, ymax - 1);
        const x2 = range(random, 1, xmax - 1);
        const y2 = range(random, 1, ymax - 1);
        try expect_line(i32, .{ x1, y1, x2, y2 }, try ref.clip_line(line(x1, y1, x2, y2)));
        try expect_line(i32, .{ x1, y1, xmax, ymax }, try ref.clip_line(line(x1, y1, xmax, ymax)));
        try expect_line(i32, .{ 0, 0, x2, y2 }, try ref.clip_line(line(0, 0, x2, y2)));
    }
    try expect_line(i32, .{ 0, 0, xmax, ymax }, try ref.clip_line(line(0, 0, xmax, ymax)));
    try expect_line(i32, .{ 0, ymax, xmax, 0 }, try ref.clip_line(line(0, ymax, xmax, 0)));
}

// rect_testIntersectRectAndLineOutside
test "sdl rect: line clipping outside" {
    var prng = rng();
    const random = prng.random();
    const ref = rect(0, 0, 32, 32);
    for (0..32) |_| {
        const x_left = -range(random, 1, 32);
        const x_right = 32 + range(random, 1, 32);
        const y_top = -range(random, 1, 32);
        const y_bottom = 32 + range(random, 1, 32);
        try expect_line(i32, null, try ref.clip_line(line(x_left, 0, x_left, 31)));
        try expect_line(i32, null, try ref.clip_line(line(x_right, 0, x_right, 31)));
        try expect_line(i32, null, try ref.clip_line(line(0, y_top, 31, y_top)));
        try expect_line(i32, null, try ref.clip_line(line(0, y_bottom, 31, y_bottom)));
    }
}

// rect_testIntersectRectAndLineEmpty
test "sdl rect: line clipping empty rectangle" {
    var prng = rng();
    const random = prng.random();
    for (0..32) |_| {
        const empty = rect(range(random, 1, 1024), range(random, 1, 1024), 0, 0);
        const l = line(empty.x, empty.y, range(random, 1, 1024), range(random, 1, 1024));
        try expect_line(i32, null, try empty.clip_line(l));
    }
}

// rect_testIntersectRectFloat
test "sdl rect: intersection float" {
    const a = frect(0, 0, 1, 1);
    try testing.expectEqual(a, (try a.intersection(a)).?);
    // Touching edges intersect with zero extent; disjoint rectangles do not.
    try testing.expectEqual(frect(1, 0, 0, 1), (try a.intersection(frect(1, 0, 1, 1))).?);
    try testing.expectEqual(frect(1, 1, 0, 0), (try a.intersection(frect(1, 1, 1, 1))).?);
    try testing.expectEqual(null, try a.intersection(frect(2, 0, 1, 1)));
}

// rect_testIntersectRectInside / Outside
test "sdl rect: intersection inside and outside" {
    var prng = rng();
    const random = prng.random();
    const a = rect(0, 0, 32, 32);
    for (0..32) |_| {
        const inside = rect(0, 0, range(random, 1, 31), range(random, 1, 31));
        try testing.expectEqual(inside, (try a.intersection(inside)).?);
        const outside = rect(32 + range(random, 1, 10), 32 + range(random, 1, 10), 32, 32);
        try testing.expectEqual(null, try a.intersection(outside));
    }
}

// rect_testIntersectRectPartial
test "sdl rect: intersection partial" {
    var prng = rng();
    const random = prng.random();
    const a = rect(0, 0, 32, 32);
    for (0..32) |_| {
        var b = rect(range(random, 1, 31), range(random, 1, 31), 32, 32);
        try testing.expectEqual(rect(b.x, b.y, 32 - b.x, 32 - b.y), (try a.intersection(b)).?);
        // right edge
        b = rect(a.width - 1, a.y, range(random, 1, 31), range(random, 1, 31));
        try testing.expectEqual(rect(b.x, b.y, 1, b.height), (try a.intersection(b)).?);
        // left edge
        b = rect(1 - a.width, a.y, a.width, range(random, 1, 31));
        try testing.expectEqual(rect(0, b.y, 1, b.height), (try a.intersection(b)).?);
        // bottom edge
        b = rect(a.x, a.height - 1, range(random, 1, 31), range(random, 1, 31));
        try testing.expectEqual(rect(b.x, b.y, b.width, 1), (try a.intersection(b)).?);
        // top edge
        b = rect(a.x, 1 - a.height, range(random, 1, 31), a.height);
        try testing.expectEqual(rect(b.x, 0, b.width, 1), (try a.intersection(b)).?);
    }
}

// rect_testIntersectRectPoint, rect_testHasIntersectionPoint
test "sdl rect: intersection of single pixels" {
    var prng = rng();
    const random = prng.random();
    for (0..16) |_| {
        const a = rect(range(random, 1, 100), range(random, 1, 100), 1, 1);
        try testing.expectEqual(a, (try a.intersection(a)).?);
        var dx: i32 = -1;
        while (dx <= 1) : (dx += 1) {
            var dy: i32 = -1;
            while (dy <= 1) : (dy += 1) {
                if (dx == 0 and dy == 0) continue;
                const b = rect(a.x + dx, a.y + dy, 1, 1);
                try testing.expectEqual(null, try a.intersection(b));
            }
        }
    }
}

// rect_testIntersectRectEmpty, rect_testHasIntersectionEmpty
test "sdl rect: intersection with empty rectangles" {
    var prng = rng();
    const random = prng.random();
    for (0..16) |_| {
        const full = rect(range(random, 1, 100), range(random, 1, 100), range(random, 1, 100), range(random, 1, 100));
        const empty = rect(full.x, full.y, 0, 0);
        try testing.expect(empty.is_empty());
        try testing.expectEqual(null, try empty.intersection(full));
        try testing.expectEqual(null, try full.intersection(empty));
        try testing.expectEqual(null, try empty.intersection(empty));
    }
}

// rect_testHasIntersectionFloat
test "sdl rect: has intersection float" {
    const cases = [_]struct { FRect, FRect, bool }{
        .{ frect(0, 0, 0, 0), frect(0, 0, 0, 0), true },
        .{ frect(0, 0, -200, 200), frect(0, 0, -200, 200), false },
        .{ frect(0, 0, 10, 10), frect(-5, 5, 10, 2), true },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 10, 2), false },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 2, 10), false },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 5, 5), true },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 5.1, 5.1), true },
        .{ frect(0, 0, 10, 10), frect(-4.99, -4.99, 5, 5), true },
    };
    for (cases) |c| try testing.expectEqual(c[2], (try c[0].intersection(c[1])) != null);
}

// rect_testGetRectIntersectionFloat
test "sdl rect: get intersection float" {
    const Case = struct { FRect, FRect, ?FRect };
    const cases = [_]Case{
        .{ frect(0, 0, 0, 0), frect(0, 0, 0, 0), frect(0, 0, 0, 0) },
        .{ frect(0, 0, -200, 200), frect(0, 0, -200, 200), null },
        .{ frect(0, 0, 10, 10), frect(-5, 5, 9.9, 2), frect(0, 5, 4.9, 2) },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 10, 2), null },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 2, 10), null },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 5, 5), frect(0, 0, 0, 0) },
        .{ frect(0, 0, 10, 10), frect(-5, -5, 5.5, 6), frect(0, 0, 0.5, 1) },
    };
    for (cases) |c| {
        const got = try c[0].intersection(c[1]);
        if (c[2]) |e| {
            const g = got.?;
            try testing.expectApproxEqAbs(e.x, g.x, 1e-5);
            try testing.expectApproxEqAbs(e.y, g.y, 1e-5);
            try testing.expectApproxEqAbs(e.width, g.width, 1e-5);
            try testing.expectApproxEqAbs(e.height, g.height, 1e-5);
        } else try testing.expectEqual(null, got);
    }
}

// rect_testEnclosePointsFloat
test "sdl rect: enclosing points float" {
    const pts = [_]FPoint{ .{ .x = 1.25, .y = 2.5 }, .{ .x = 1.75, .y = 3.75 }, .{ .x = 3.5, .y = 3.0 } };
    const clip = frect(0, 1, 4, 4);
    const result = (try FRect.enclosing(&pts, clip)).?;
    try testing.expectEqual(frect(1.25, 2.5, 2.25, 1.25), result);
    for (pts) |p| {
        try testing.expect(clip.contains(p));
        try testing.expect(result.contains(p));
    }
}

fn enclosing_reference(points: []const Point, clip: ?Rect) ?Rect {
    var any = false;
    var minx: i32 = 0;
    var maxx: i32 = 0;
    var miny: i32 = 0;
    var maxy: i32 = 0;
    for (points) |p| {
        if (clip) |c| {
            if (!(p.x >= c.x and p.x < c.x + c.width and p.y >= c.y and p.y < c.y + c.height)) continue;
        }
        if (!any) {
            minx = p.x;
            maxx = p.x;
            miny = p.y;
            maxy = p.y;
            any = true;
        } else {
            minx = @min(minx, p.x);
            maxx = @max(maxx, p.x);
            miny = @min(miny, p.y);
            maxy = @max(maxy, p.y);
        }
    }
    return if (any) rect(minx, miny, maxx - minx + 1, maxy - miny + 1) else null;
}

// rect_testEnclosePoints, _RepeatedInput, _WithClipping
test "sdl rect: enclosing points, repeated input and clipping" {
    var prng = rng();
    const random = prng.random();
    for (0..32) |_| {
        var points: [16]Point = undefined;
        for (&points) |*p| p.* = .{ .x = range(random, -1024, 1024), .y = range(random, -1024, 1024) };
        const copy = points;
        try testing.expectEqual(enclosing_reference(&points, null), try Rect.enclosing(&points, null));
        try testing.expectEqualSlices(Point, &copy, &points);

        var repeated: [8]Point = undefined;
        for (&repeated, 0..) |*p, i| p.* = if (i < 4) points[i] else repeated[i - 4];
        try testing.expectEqual(enclosing_reference(&repeated, null), try Rect.enclosing(&repeated, null));

        const clip = rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 1, 1024), range(random, 1, 1024));
        try testing.expectEqual(enclosing_reference(&points, clip), try Rect.enclosing(&points, clip));
        // Empty clipping rectangle.
        try testing.expectEqual(null, try Rect.enclosing(&points, rect(clip.x, clip.y, 0, 0)));
    }
    try testing.expectEqual(null, try Rect.enclosing(&.{}, rect(0, 0, 0, 0)));
}

// rect_testGetRectEnclosingPointsFloat
test "sdl rect: get enclosing points float" {
    const pts = [_]FPoint{ .{ .x = 0.5, .y = 0.1 }, .{ .x = 5.5, .y = 7.1 }, .{ .x = 1.5, .y = 1.1 } };
    const Case = struct { ?FRect, ?FRect };
    const cases = [_]Case{
        .{ frect(0, 0, 10, 10), frect(0.5, 0.1, 5, 7) },
        .{ frect(1.2, 1, 10, 10), frect(1.5, 1.1, 4, 6) },
        .{ frect(-10, -10, 3, 3), null },
        .{ null, frect(0.5, 0.1, 5, 7) },
    };
    for (cases) |c| {
        const got = try FRect.enclosing(&pts, c[0]);
        if (c[1]) |e| {
            const g = got.?;
            try testing.expectApproxEqAbs(e.x, g.x, 1e-5);
            try testing.expectApproxEqAbs(e.y, g.y, 1e-5);
            try testing.expectApproxEqAbs(e.width, g.width, 1e-5);
            try testing.expectApproxEqAbs(e.height, g.height, 1e-5);
        } else try testing.expectEqual(null, got);
    }
}

// rect_testUnionRectOutside
test "sdl rect: union outside" {
    var prng = rng();
    const random = prng.random();
    var dx: i32 = -1;
    while (dx < 2) : (dx += 1) {
        var dy: i32 = -1;
        while (dy < 2) : (dy += 1) {
            if (dx == 0 and dy == 0) continue;
            const a = rect(range(random, -1024, 1024), range(random, -1024, 1024), 1, 1);
            // SDL's test offsets both axes by dx; preserved.
            const b = rect(range(random, -1024, 1024) + dx * 2048, range(random, -1024, 1024) + dx * 2048, 1, 1);
            const minx = @min(a.x, b.x);
            const miny = @min(a.y, b.y);
            const expected = rect(minx, miny, @max(a.x, b.x) - minx + 1, @max(a.y, b.y) - miny + 1);
            try testing.expectEqual(expected, (try a.union_with(b)).?);
        }
    }
    dx = -1;
    while (dx < 2) : (dx += 1) {
        var dy: i32 = -1;
        while (dy < 2) : (dy += 1) {
            if (dx == 0 and dy == 0) continue;
            const a = rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 256, 512), range(random, 256, 512));
            const b = rect(a.x + 1 + dx * 2, a.y + 1 + dy * 2, a.width - 2, a.height - 2);
            var expected = a;
            if (dx == -1) expected.x -= 1;
            if (dy == -1) expected.y -= 1;
            if (dx != 0) expected.width += 1;
            if (dy != 0) expected.height += 1;
            try testing.expectEqual(expected, (try a.union_with(b)).?);
        }
    }
}

// rect_testUnionRectEmpty
test "sdl rect: union with empty" {
    var prng = rng();
    const random = prng.random();
    for (0..16) |_| {
        const empty = rect(range(random, -1024, 1024), range(random, -1024, 1024), 0, 0);
        const full = rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 1, 1024), range(random, 1, 1024));
        try testing.expectEqual(full, (try empty.union_with(full)).?);
        try testing.expectEqual(full, (try full.union_with(empty)).?);
        try testing.expectEqual(null, try empty.union_with(rect(5, 5, 0, 0)));
    }
}

// rect_testUnionRectInside
test "sdl rect: union inside" {
    var prng = rng();
    const random = prng.random();
    for (0..16) |_| {
        const unit = rect(range(random, -1024, 1024), range(random, -1024, 1024), 1, 1);
        try testing.expectEqual(unit, (try unit.union_with(unit)).?);
        const a = rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 256, 1024), range(random, 256, 1024));
        const b = rect(a.x + 1 + range(random, 1, a.width - 2), a.y + 1 + range(random, 1, a.height - 2), 1, 1);
        try testing.expectEqual(a, (try a.union_with(b)).?);
        var dx: i32 = -1;
        while (dx < 2) : (dx += 1) {
            var dy: i32 = -1;
            while (dy < 2) : (dy += 1) {
                if (dx == 0 and dy == 0) continue;
                var c = a;
                if (dx == -1) c.x += 1;
                if (dx != 0) c.width -= 1;
                if (dy == -1) c.y += 1;
                if (dy != 0) c.height -= 1;
                try testing.expectEqual(a, (try a.union_with(c)).?);
            }
        }
    }
}

// rect_testGetRectUntionFloat
test "sdl rect: union float" {
    const Case = struct { FRect, FRect, FRect };
    const cases = [_]Case{
        .{ frect(0, 0, 10, 10), frect(19.9, 20, 10, 10), frect(0, 0, 29.9, 30) },
        .{ frect(0, 0, 0, 0), frect(20, 20.1, 10.1, 10), frect(0, 0, 30.1, 30.1) },
        .{ frect(-200, -4.5, 450, 33), frect(20, 20, 10, 10), frect(-200, -4.5, 450, 34.5) },
        .{ frect(0, 0, 15, 16.5), frect(20, 20, 0, 0), frect(0, 0, 20, 20) },
    };
    for (cases) |c| {
        const g = (try c[0].union_with(c[1])).?;
        try testing.expectApproxEqAbs(c[2].x, g.x, 1e-5);
        try testing.expectApproxEqAbs(c[2].y, g.y, 1e-5);
        try testing.expectApproxEqAbs(c[2].width, g.width, 1e-5);
        try testing.expectApproxEqAbs(c[2].height, g.height, 1e-5);
    }
}

// rect_testRectEmptyFloat, rect_testRectEmpty
test "sdl rect: emptiness" {
    try testing.expect(!frect(0, 0, 1, 1).is_empty());
    try testing.expect(!frect(0, 0, 0, 0).is_empty());
    try testing.expect(frect(0, 0, -1, 1).is_empty());
    try testing.expect(frect(0, 0, 1, -1).is_empty());
    var prng = rng();
    const random = prng.random();
    try testing.expect(!rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 256, 1024), range(random, 256, 1024)).is_empty());
    var w: i32 = -1;
    while (w < 2) : (w += 1) {
        var h: i32 = -1;
        while (h < 2) : (h += 1) {
            if (w == 1 and h == 1) continue;
            try testing.expect(rect(range(random, -1024, 1024), range(random, -1024, 1024), w, h).is_empty());
        }
    }
}

// rect_testRectEquals, rect_testFRectEquals (Zig structs compare with std.meta.eql)
test "sdl rect: equality" {
    var prng = rng();
    const random = prng.random();
    const a = rect(range(random, -1024, 1024), range(random, -1024, 1024), range(random, 1, 1024), range(random, 1, 1024));
    var b = a;
    try testing.expect(std.meta.eql(a, b));
    b.width += 1;
    try testing.expect(!std.meta.eql(a, b));
    const fa = frect(1, 2, 3, 4);
    try testing.expect(std.meta.eql(fa, frect(1, 2, 3, 4)));
    try testing.expect(!std.meta.eql(fa, frect(1, 2, 3, 5)));
}

// rect_testGetRectAndLineIntersectionFloat
test "sdl rect: get line intersection float" {
    try expect_line(f32, .{ 0, 0, 0, 0 }, try frect(0, 0, 0, 0).clip_line(fline(-4.8, -4.8, 5.2, 5.2)));
    try expect_line(f32, .{ 0, 0, 2, 2 }, try frect(0, 0, 2, 2).clip_line(fline(-1, -1, 3.5, 3.5)));
    try expect_line(f32, null, try frect(-4, -4, 14, 14).clip_line(fline(8, 22, 8, 33)));
}
