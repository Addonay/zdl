//! Minimal SVG icon support for Tabler and Lucide icons.
//!
//! Supported: `path` (M L H V C S Q T A Z, absolute and relative), `circle`,
//! `rect` (with `rx`), `line`, `polyline` and `polygon`, with `fill`, `stroke`
//! and `stroke-width` taken from the element or the root `svg`. Curves and arcs
//! are flattened once at parse time. Rasterization produces an 8-bit coverage
//! mask at the requested device size: strokes are exact distance fields with
//! round caps and joins, fills use 4x4 supersampling with the nonzero rule.

const std = @import("std");
const canvas = @import("canvas.zig");

const Point = canvas.Point;

pub const Mask = struct {
    width: u32,
    height: u32,
    coverage: []u8,

    pub fn deinit(self: Mask, allocator: std.mem.Allocator) void {
        allocator.free(self.coverage);
    }
};

/// One flattened subpath (a range into `Icon.points`).
const Subpath = struct {
    start: usize,
    end: usize,
    closed: bool,
    fill: bool,
    stroke: bool,
};

/// A parsed icon in its 24-unit (or `view_box`) coordinate space.
pub const Icon = struct {
    allocator: std.mem.Allocator,
    view_size: f32,
    stroke_width: f32,
    points: []Point,
    subpaths: []Subpath,

    pub fn deinit(self: *Icon) void {
        self.allocator.free(self.points);
        self.allocator.free(self.subpaths);
        self.* = undefined;
    }

    /// Rasterizes at `size` x `size` device pixels, scaling the view box to fit.
    pub fn rasterize(self: *const Icon, allocator: std.mem.Allocator, size: u32) std.mem.Allocator.Error!Mask {
        const coverage = try allocator.alloc(u8, size * size);
        errdefer allocator.free(coverage);
        @memset(coverage, 0);
        const scale = @as(f32, @floatFromInt(size)) / self.view_size;
        const stroke_radius = self.stroke_width * scale / 2;
        var any_fill = false;
        for (self.subpaths) |subpath| any_fill = any_fill or subpath.fill;

        for (0..size) |row| {
            for (0..size) |column| {
                const fx = (@as(f32, @floatFromInt(column)) + 0.5) / scale;
                const fy = (@as(f32, @floatFromInt(row)) + 0.5) / scale;
                var stroke_distance = std.math.floatMax(f32);
                for (self.subpaths) |subpath| {
                    if (subpath.stroke) {
                        stroke_distance = @min(stroke_distance, self.distance_to_path(subpath, fx, fy) * scale);
                    }
                }
                const stroke_coverage = if (stroke_distance == std.math.floatMax(f32)) 0 else std.math.clamp(stroke_radius - stroke_distance + 0.5, 0, 1);
                const fill_coverage: f32 = if (any_fill) self.supersampled_fill(fx, fy, scale) else 0;
                const value = @max(stroke_coverage, fill_coverage);
                coverage[row * size + column] = @intFromFloat(@round(std.math.clamp(value, 0, 1) * 255));
            }
        }
        return .{ .width = size, .height = size, .coverage = coverage };
    }

    fn distance_to_path(self: *const Icon, subpath: Subpath, x: f32, y: f32) f32 {
        const points = self.points[subpath.start..subpath.end];
        var best = std.math.floatMax(f32);
        if (points.len == 1) return std.math.hypot(x - points[0].x, y - points[0].y);
        for (points[0 .. points.len - 1], points[1..]) |a, b| {
            best = @min(best, segment_distance(a, b, x, y));
        }
        if (subpath.closed and points.len > 2) {
            best = @min(best, segment_distance(points[points.len - 1], points[0], x, y));
        }
        return best;
    }

    /// Coverage of a point set by all filled subpaths, sampled on a 4x4 grid.
    fn supersampled_fill(self: *const Icon, x: f32, y: f32, scale: f32) f32 {
        var hits: u32 = 0;
        const step = 1.0 / 4.0 / scale;
        for (0..4) |sy| {
            for (0..4) |sx| {
                const px = x + (@as(f32, @floatFromInt(sx)) - 1.5) * step;
                const py = y + (@as(f32, @floatFromInt(sy)) - 1.5) * step;
                var winding: i32 = 0;
                for (self.subpaths) |subpath| {
                    if (!subpath.fill) continue;
                    winding += winding_number(self.points[subpath.start..subpath.end], px, py);
                }
                if (winding != 0) hits += 1;
            }
        }
        return @as(f32, @floatFromInt(hits)) / 16;
    }
};

fn segment_distance(a: Point, b: Point, x: f32, y: f32) f32 {
    const dx = b.x - a.x;
    const dy = b.y - a.y;
    const length_squared = dx * dx + dy * dy;
    const t = if (length_squared == 0) 0 else std.math.clamp(((x - a.x) * dx + (y - a.y) * dy) / length_squared, 0, 1);
    return std.math.hypot(x - (a.x + dx * t), y - (a.y + dy * t));
}

/// Crossing-number winding of a closed polygon (the closing edge is implicit).
fn winding_number(points: []const Point, x: f32, y: f32) i32 {
    if (points.len < 3) return 0;
    var winding: i32 = 0;
    for (points, 0..) |a, index| {
        const b = points[(index + 1) % points.len];
        if (a.y <= y) {
            if (b.y > y and is_left(a, b, x, y) > 0) winding += 1;
        } else if (b.y <= y and is_left(a, b, x, y) < 0) {
            winding -= 1;
        }
    }
    return winding;
}

fn is_left(a: Point, b: Point, x: f32, y: f32) f32 {
    return (b.x - a.x) * (y - a.y) - (x - a.x) * (b.y - a.y);
}

// -----------------------------------------------------------------------------
// Parsing
// -----------------------------------------------------------------------------

pub const ParseError = error{ InvalidPath, OutOfMemory };

const Builder = struct {
    allocator: std.mem.Allocator,
    points: std.ArrayList(Point) = .empty,
    subpaths: std.ArrayList(Subpath) = .empty,

    fn add_subpath(self: *Builder, points: []const Point, closed: bool, fill: bool, stroke: bool) ParseError!void {
        if (points.len == 0) return;
        const start = self.points.items.len;
        try self.points.appendSlice(self.allocator, points);
        try self.subpaths.append(self.allocator, .{ .start = start, .end = self.points.items.len, .closed = closed, .fill = fill, .stroke = stroke });
    }
};

/// Parses an SVG document. The returned icon owns its storage.
pub fn parse(allocator: std.mem.Allocator, source: []const u8) ParseError!Icon {
    var builder: Builder = .{ .allocator = allocator };
    errdefer builder.points.deinit(allocator);
    errdefer builder.subpaths.deinit(allocator);

    var view_size: f32 = 24;
    var root_fill = true;
    var root_stroke = false;
    var stroke_width: f32 = 2;
    var position: usize = 0;
    while (next_tag(source, &position)) |tag| {
        if (tag.name.len == 0 or tag.name[0] == '/' or tag.name[0] == '!' or tag.name[0] == '?') continue;
        if (std.mem.eql(u8, tag.name, "svg")) {
            if (attribute(tag.body, "viewBox")) |view_box| {
                var parts = std.mem.tokenizeAny(u8, view_box, " ,");
                _ = parts.next();
                _ = parts.next();
                if (parts.next()) |width_text| view_size = std.fmt.parseFloat(f32, width_text) catch view_size;
            }
            if (attribute(tag.body, "fill")) |value| root_fill = !std.mem.eql(u8, value, "none");
            if (attribute(tag.body, "stroke")) |value| root_stroke = !std.mem.eql(u8, value, "none");
            if (attribute(tag.body, "stroke-width")) |value| stroke_width = std.fmt.parseFloat(f32, value) catch stroke_width;
            continue;
        }

        // Each shape may override fill and stroke; otherwise the root values apply.
        const fill = if (attribute(tag.body, "fill")) |value| !std.mem.eql(u8, value, "none") else root_fill;
        const stroke = if (attribute(tag.body, "stroke")) |value| !std.mem.eql(u8, value, "none") else root_stroke;

        if (std.mem.eql(u8, tag.name, "path")) {
            const d = attribute(tag.body, "d") orelse continue;
            try parse_path(&builder, d, fill, stroke);
        } else if (std.mem.eql(u8, tag.name, "circle")) {
            const cx = number_attribute(tag.body, "cx", 0);
            const cy = number_attribute(tag.body, "cy", 0);
            const r = number_attribute(tag.body, "r", 0);
            var points: [64]Point = undefined;
            for (&points, 0..) |*point, index| {
                const angle = @as(f32, @floatFromInt(index)) / points.len * std.math.tau;
                point.* = .{ .x = cx + r * @cos(angle), .y = cy + r * @sin(angle) };
            }
            try builder.add_subpath(&points, true, fill, stroke);
        } else if (std.mem.eql(u8, tag.name, "rect")) {
            const x = number_attribute(tag.body, "x", 0);
            const y = number_attribute(tag.body, "y", 0);
            const w = number_attribute(tag.body, "width", 0);
            const h = number_attribute(tag.body, "height", 0);
            const rx = @min(number_attribute(tag.body, "rx", 0), @min(w, h) / 2);
            var points: std.ArrayList(Point) = .empty;
            defer points.deinit(allocator);
            try append_rounded_rect(&points, allocator, x, y, w, h, rx);
            try builder.add_subpath(points.items, true, fill, stroke);
        } else if (std.mem.eql(u8, tag.name, "line")) {
            const points = [_]Point{
                .{ .x = number_attribute(tag.body, "x1", 0), .y = number_attribute(tag.body, "y1", 0) },
                .{ .x = number_attribute(tag.body, "x2", 0), .y = number_attribute(tag.body, "y2", 0) },
            };
            try builder.add_subpath(&points, false, false, stroke);
        } else if (std.mem.eql(u8, tag.name, "polyline") or std.mem.eql(u8, tag.name, "polygon")) {
            const text = attribute(tag.body, "points") orelse continue;
            var points: std.ArrayList(Point) = .empty;
            defer points.deinit(allocator);
            var numbers = NumberScanner{ .text = text };
            while (numbers.next()) |x| {
                const y = numbers.next() orelse break;
                try points.append(allocator, .{ .x = x, .y = y });
            }
            const closed = std.mem.eql(u8, tag.name, "polygon");
            try builder.add_subpath(points.items, closed, closed and fill, stroke);
        }
    }
    if (builder.subpaths.items.len == 0) return error.InvalidPath;

    return .{
        .allocator = allocator,
        .view_size = view_size,
        .stroke_width = stroke_width,
        .points = try builder.points.toOwnedSlice(allocator),
        .subpaths = try builder.subpaths.toOwnedSlice(allocator),
    };
}

const Tag = struct { name: []const u8, body: []const u8 };

/// Advances past comments and returns the next element tag, or null at the end.
fn next_tag(source: []const u8, position: *usize) ?Tag {
    while (true) {
        const open = std.mem.indexOfScalarPos(u8, source, position.*, '<') orelse return null;
        if (std.mem.startsWith(u8, source[open..], "<!--")) {
            const close = std.mem.indexOfPos(u8, source, open, "-->") orelse return null;
            position.* = close + 3;
            continue;
        }
        const close = std.mem.indexOfScalarPos(u8, source, open, '>') orelse return null;
        position.* = close + 1;
        var inner = source[open + 1 .. close];
        const self_closing = inner.len > 0 and inner[inner.len - 1] == '/';
        if (self_closing) inner = inner[0 .. inner.len - 1];
        const name_end = std.mem.indexOfAny(u8, inner, " \t\r\n/") orelse inner.len;
        return .{ .name = inner[0..name_end], .body = inner[name_end..] };
    }
}

/// Value of `name="..."` (or single-quoted) within a tag body.
fn attribute(body: []const u8, name: []const u8) ?[]const u8 {
    var search: usize = 0;
    while (std.mem.indexOfPos(u8, body, search, name)) |found| {
        search = found + name.len;
        const boundary_ok = found == 0 or std.ascii.isWhitespace(body[found - 1]);
        var cursor = found + name.len;
        while (cursor < body.len and std.ascii.isWhitespace(body[cursor])) cursor += 1;
        if (!boundary_ok or cursor >= body.len or body[cursor] != '=') continue;
        cursor += 1;
        while (cursor < body.len and std.ascii.isWhitespace(body[cursor])) cursor += 1;
        if (cursor >= body.len) return null;
        const quote = body[cursor];
        if (quote != '"' and quote != '\'') return null;
        const end = std.mem.indexOfScalarPos(u8, body, cursor + 1, quote) orelse return null;
        return body[cursor + 1 .. end];
    }
    return null;
}

fn number_attribute(body: []const u8, name: []const u8, default: f32) f32 {
    const text = attribute(body, name) orelse return default;
    return std.fmt.parseFloat(f32, text) catch default;
}

/// Reads successive numbers from path data and similar lists. SVG allows
/// separators to be omitted before a minus sign or a second decimal point.
const NumberScanner = struct {
    text: []const u8,
    index: usize = 0,

    fn skip_separators(self: *NumberScanner) void {
        while (self.index < self.text.len) : (self.index += 1) {
            switch (self.text[self.index]) {
                ' ', '\t', '\r', '\n', ',' => {},
                else => break,
            }
        }
    }

    fn next(self: *NumberScanner) ?f32 {
        self.skip_separators();
        const start = self.index;
        var cursor = start;
        if (cursor < self.text.len and (self.text[cursor] == '-' or self.text[cursor] == '+')) cursor += 1;
        var seen_dot = false;
        var seen_digit = false;
        while (cursor < self.text.len) : (cursor += 1) {
            const c = self.text[cursor];
            if (std.ascii.isDigit(c)) {
                seen_digit = true;
            } else if (c == '.' and !seen_dot) {
                seen_dot = true;
            } else break;
        }
        if (!seen_digit) return null;
        if (cursor < self.text.len and (self.text[cursor] == 'e' or self.text[cursor] == 'E')) {
            var exponent = cursor + 1;
            if (exponent < self.text.len and (self.text[exponent] == '-' or self.text[exponent] == '+')) exponent += 1;
            if (exponent < self.text.len and std.ascii.isDigit(self.text[exponent])) {
                while (exponent < self.text.len and std.ascii.isDigit(self.text[exponent])) exponent += 1;
                cursor = exponent;
            }
        }
        self.index = cursor;
        return std.fmt.parseFloat(f32, self.text[start..cursor]) catch null;
    }

    /// Arc flags are single digits that may be written without separators.
    fn flag(self: *NumberScanner) ?bool {
        self.skip_separators();
        if (self.index >= self.text.len) return null;
        const c = self.text[self.index];
        if (c != '0' and c != '1') return null;
        self.index += 1;
        return c == '1';
    }

    fn at_number(self: *NumberScanner) bool {
        self.skip_separators();
        if (self.index >= self.text.len) return false;
        const c = self.text[self.index];
        return std.ascii.isDigit(c) or c == '-' or c == '+' or c == '.';
    }
};

const curve_steps = 16;

fn parse_path(builder: *Builder, d: []const u8, fill: bool, stroke: bool) ParseError!void {
    var scanner = NumberScanner{ .text = d };
    var current: Point = .{ .x = 0, .y = 0 };
    var subpath_start: Point = current;
    var last_control: ?Point = null;
    var last_quadratic_control: ?Point = null;
    var command: u8 = 0;
    var pending: std.ArrayList(Point) = .empty;
    defer pending.deinit(builder.allocator);

    while (true) {
        scanner.skip_separators();
        if (scanner.index >= d.len) break;
        const c = d[scanner.index];
        if (std.ascii.isAlphabetic(c)) {
            command = c;
            scanner.index += 1;
        } else if (command == 0 or std.ascii.toUpper(command) == 'Z') {
            // Numbers without a preceding command, or after Z (which takes none), are malformed.
            return error.InvalidPath;
        } else if (command == 'M') {
            command = 'L';
        } else if (command == 'm') {
            command = 'l';
        }
        const relative = std.ascii.isLower(command);
        const origin: Point = if (relative) current else .{ .x = 0, .y = 0 };

        switch (std.ascii.toUpper(command)) {
            'Z' => {
                if (pending.items.len > 0) try builder.add_subpath(pending.items, true, fill, stroke);
                pending.clearRetainingCapacity();
                // A later drawing command without a new moveto starts at the subpath start.
                try pending.append(builder.allocator, subpath_start);
                current = subpath_start;
                last_control = null;
                last_quadratic_control = null;
            },
            'M' => {
                const x = scanner.next() orelse return error.InvalidPath;
                const y = scanner.next() orelse return error.InvalidPath;
                if (pending.items.len > 0) try builder.add_subpath(pending.items, false, fill, stroke);
                pending.clearRetainingCapacity();
                current = .{ .x = origin.x + x, .y = origin.y + y };
                subpath_start = current;
                try pending.append(builder.allocator, current);
                last_control = null;
                last_quadratic_control = null;
            },
            'L' => {
                const x = scanner.next() orelse return error.InvalidPath;
                const y = scanner.next() orelse return error.InvalidPath;
                current = .{ .x = origin.x + x, .y = origin.y + y };
                try pending.append(builder.allocator, current);
                last_control = null;
                last_quadratic_control = null;
            },
            'H' => {
                const x = scanner.next() orelse return error.InvalidPath;
                current = .{ .x = if (relative) current.x + x else x, .y = current.y };
                try pending.append(builder.allocator, current);
                last_control = null;
                last_quadratic_control = null;
            },
            'V' => {
                const y = scanner.next() orelse return error.InvalidPath;
                current = .{ .x = current.x, .y = if (relative) current.y + y else y };
                try pending.append(builder.allocator, current);
                last_control = null;
                last_quadratic_control = null;
            },
            'C', 'S' => {
                const is_smooth = std.ascii.toUpper(command) == 'S';
                const control1: Point = if (is_smooth)
                    (if (last_control) |previous| .{ .x = 2 * current.x - previous.x, .y = 2 * current.y - previous.y } else current)
                else blk: {
                    const x = scanner.next() orelse return error.InvalidPath;
                    const y = scanner.next() orelse return error.InvalidPath;
                    break :blk .{ .x = origin.x + x, .y = origin.y + y };
                };
                const control2_x = scanner.next() orelse return error.InvalidPath;
                const control2_y = scanner.next() orelse return error.InvalidPath;
                const control2: Point = .{ .x = origin.x + control2_x, .y = origin.y + control2_y };
                const x = scanner.next() orelse return error.InvalidPath;
                const y = scanner.next() orelse return error.InvalidPath;
                const end: Point = .{ .x = origin.x + x, .y = origin.y + y };
                try flatten_cubic(builder.allocator, &pending, current, control1, control2, end);
                current = end;
                last_control = control2;
                last_quadratic_control = null;
            },
            'Q', 'T' => {
                const is_smooth = std.ascii.toUpper(command) == 'T';
                const control: Point = if (is_smooth)
                    (if (last_quadratic_control) |previous| .{ .x = 2 * current.x - previous.x, .y = 2 * current.y - previous.y } else current)
                else blk: {
                    const x = scanner.next() orelse return error.InvalidPath;
                    const y = scanner.next() orelse return error.InvalidPath;
                    break :blk .{ .x = origin.x + x, .y = origin.y + y };
                };
                const x = scanner.next() orelse return error.InvalidPath;
                const y = scanner.next() orelse return error.InvalidPath;
                const end: Point = .{ .x = origin.x + x, .y = origin.y + y };
                try flatten_quadratic(builder.allocator, &pending, current, control, end);
                current = end;
                last_quadratic_control = control;
                last_control = null;
            },
            'A' => {
                const rx = scanner.next() orelse return error.InvalidPath;
                const ry = scanner.next() orelse return error.InvalidPath;
                const rotation = scanner.next() orelse return error.InvalidPath;
                const large = scanner.flag() orelse return error.InvalidPath;
                const sweep = scanner.flag() orelse return error.InvalidPath;
                const x = scanner.next() orelse return error.InvalidPath;
                const y = scanner.next() orelse return error.InvalidPath;
                const end: Point = .{ .x = origin.x + x, .y = origin.y + y };
                try flatten_arc(builder.allocator, &pending, current, rx, ry, rotation, large, sweep, end);
                current = end;
                last_control = null;
                last_quadratic_control = null;
            },
            else => return error.InvalidPath,
        }
    }
    if (pending.items.len > 0) try builder.add_subpath(pending.items, false, fill, stroke);
}

fn flatten_cubic(allocator: std.mem.Allocator, out: *std.ArrayList(Point), p0: Point, p1: Point, p2: Point, p3: Point) ParseError!void {
    for (1..curve_steps + 1) |step| {
        const t = @as(f32, @floatFromInt(step)) / curve_steps;
        const u = 1 - t;
        try out.append(allocator, .{
            .x = u * u * u * p0.x + 3 * u * u * t * p1.x + 3 * u * t * t * p2.x + t * t * t * p3.x,
            .y = u * u * u * p0.y + 3 * u * u * t * p1.y + 3 * u * t * t * p2.y + t * t * t * p3.y,
        });
    }
}

fn flatten_quadratic(allocator: std.mem.Allocator, out: *std.ArrayList(Point), p0: Point, p1: Point, p2: Point) ParseError!void {
    for (1..curve_steps + 1) |step| {
        const t = @as(f32, @floatFromInt(step)) / curve_steps;
        const u = 1 - t;
        try out.append(allocator, .{
            .x = u * u * p0.x + 2 * u * t * p1.x + t * t * p2.x,
            .y = u * u * p0.y + 2 * u * t * p1.y + t * t * p2.y,
        });
    }
}

/// Endpoint-to-center arc conversion (SVG 1.1, F.6.5), flattened.
fn flatten_arc(allocator: std.mem.Allocator, out: *std.ArrayList(Point), start: Point, rx_in: f32, ry_in: f32, angle_degrees: f32, large: bool, sweep: bool, end: Point) ParseError!void {
    if (start.x == end.x and start.y == end.y) return;
    var rx = @abs(rx_in);
    var ry = @abs(ry_in);
    if (rx == 0 or ry == 0) {
        try out.append(allocator, end);
        return;
    }
    const phi = angle_degrees * std.math.pi / 180.0;
    const cos_phi = @cos(phi);
    const sin_phi = @sin(phi);
    const dx2 = (start.x - end.x) / 2;
    const dy2 = (start.y - end.y) / 2;
    const x1p = cos_phi * dx2 + sin_phi * dy2;
    const y1p = -sin_phi * dx2 + cos_phi * dy2;
    const lambda = (x1p * x1p) / (rx * rx) + (y1p * y1p) / (ry * ry);
    if (lambda > 1) {
        rx *= @sqrt(lambda);
        ry *= @sqrt(lambda);
    }
    const numerator = rx * rx * ry * ry - rx * rx * y1p * y1p - ry * ry * x1p * x1p;
    const denominator = rx * rx * y1p * y1p + ry * ry * x1p * x1p;
    var factor = @sqrt(@max(0, numerator / denominator));
    if (large == sweep) factor = -factor;
    const cxp = factor * rx * y1p / ry;
    const cyp = -factor * ry * x1p / rx;
    const cx = cos_phi * cxp - sin_phi * cyp + (start.x + end.x) / 2;
    const cy = sin_phi * cxp + cos_phi * cyp + (start.y + end.y) / 2;

    const theta1 = std.math.atan2((y1p - cyp) / ry, (x1p - cxp) / rx);
    var delta = std.math.atan2((-y1p - cyp) / ry, (-x1p - cxp) / rx) - theta1;
    if (sweep and delta < 0) delta += 2 * std.math.pi;
    if (!sweep and delta > 0) delta -= 2 * std.math.pi;

    const steps: usize = @max(4, @as(usize, @intFromFloat(@ceil(@abs(delta) * @max(rx, ry) / 0.5))));
    for (1..steps + 1) |step| {
        const t = theta1 + delta * @as(f32, @floatFromInt(step)) / @as(f32, @floatFromInt(steps));
        const ex = rx * @cos(t);
        const ey = ry * @sin(t);
        try out.append(allocator, .{
            .x = cos_phi * ex - sin_phi * ey + cx,
            .y = sin_phi * ex + cos_phi * ey + cy,
        });
    }
}

fn append_rounded_rect(out: *std.ArrayList(Point), allocator: std.mem.Allocator, x: f32, y: f32, w: f32, h: f32, rx: f32) ParseError!void {
    if (rx <= 0) {
        try out.appendSlice(allocator, &.{
            .{ .x = x, .y = y },
            .{ .x = x + w, .y = y },
            .{ .x = x + w, .y = y + h },
            .{ .x = x, .y = y + h },
        });
        return;
    }
    const corners = [_]struct { cx: f32, cy: f32, start: f32 }{
        .{ .cx = x + w - rx, .cy = y + rx, .start = -std.math.pi / 2.0 },
        .{ .cx = x + w - rx, .cy = y + h - rx, .start = 0 },
        .{ .cx = x + rx, .cy = y + h - rx, .start = std.math.pi / 2.0 },
        .{ .cx = x + rx, .cy = y + rx, .start = std.math.pi },
    };
    for (corners) |corner| {
        for (0..9) |step| {
            const angle = corner.start + (std.math.pi / 2.0) * @as(f32, @floatFromInt(step)) / 8.0;
            try out.append(allocator, .{ .x = corner.cx + rx * @cos(angle), .y = corner.cy + rx * @sin(angle) });
        }
    }
}

test "parses Lucide check path and rasterizes a stroke" {
    const source =
        \\<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
        \\  fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
        \\  <path d="M20 6 9 17l-5-5" />
        \\</svg>
    ;
    var icon = try parse(std.testing.allocator, source);
    defer icon.deinit();
    try std.testing.expectEqual(@as(usize, 1), icon.subpaths.len);
    try std.testing.expect(icon.subpaths[0].stroke and !icon.subpaths[0].fill);
    const mask = try icon.rasterize(std.testing.allocator, 16);
    defer mask.deinit(std.testing.allocator);
    var total: usize = 0;
    for (mask.coverage) |value| total += value;
    try std.testing.expect(total > 0);
}

test "relative and absolute commands produce the same square" {
    var absolute = try parse(std.testing.allocator, "<svg viewBox=\"0 0 24 24\"><path d=\"M0 0 L10 0 L10 10 L0 10 Z\"/></svg>");
    defer absolute.deinit();
    var relative = try parse(std.testing.allocator, "<svg viewBox=\"0 0 24 24\"><path d=\"m0 0 l10 0 l0 10 l-10 0z\"/></svg>");
    defer relative.deinit();
    try std.testing.expectEqualSlices(Point, absolute.points, relative.points);
}
