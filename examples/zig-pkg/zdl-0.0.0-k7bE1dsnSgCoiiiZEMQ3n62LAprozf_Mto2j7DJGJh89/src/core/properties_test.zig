//! Ported from SDL test/testautomation_properties.c.
//! Deliberate divergences (docs/porting.md "Properties return WrongType/Missing
//! instead of coercing or inventing a default"): SDL's implicit conversions
//! between pointer/string/number/float/boolean values and its default-value
//! getters are replaced by typed `get` returning Missing/WrongType. SDL's cleanup
//! callbacks and property locking are replaced by explicit ownership and the
//! owning object's lock, so testLocking has no equivalent; cleanup is checked as
//! "no leaks and borrowed resources untouched" under std.testing.allocator.
const std = @import("std");
const testing = std.testing;
const Properties = @import("properties.zig").Properties;

const Resource = *const u8;

fn count_named(props: anytype, name: []const u8) usize {
    var n: usize = 0;
    var it = props.iterator();
    while (it.next()) |entry| {
        if (std.mem.eql(u8, entry.name, name)) n += 1;
    }
    return n;
}

// properties_testBasic
test "sdl properties: basic" {
    const Props = Properties(Resource);
    var props = Props.init(testing.allocator);
    defer props.deinit();

    const values = "abcdefghij";
    for (0..10) |i| {
        const key = values[i .. i + 1];
        try props.set(key, .{ .resource = &values[i] });
        const got = try props.get(.resource, key);
        try testing.expectEqual(values[i], got.*);
    }
    var counted: usize = 0;
    var it = props.iterator();
    while (it.next()) |_| counted += 1;
    try testing.expectEqual(10, counted);
    try testing.expectEqual(10, props.count());

    // Clearing every property (SDL sets NULL, i.e. removes).
    for (0..10) |i| {
        try testing.expect(props.remove(values[i .. i + 1]));
        try testing.expectError(error.Missing, props.get(.resource, values[i .. i + 1]));
    }
    try testing.expectEqual(0, props.count());
    try testing.expect(!props.remove("a"));

    // Missing properties: SDL returns the caller default; zdl reports Missing.
    try testing.expectError(error.Missing, props.get(.resource, "foo"));
    try testing.expectError(error.Missing, props.get(.string, "foo"));
    try testing.expectError(error.Missing, props.get(.integer, "foo"));
    try testing.expectError(error.Missing, props.get(.float, "foo"));
    try testing.expectError(error.Missing, props.get(.boolean, "foo"));
    try testing.expectEqual(null, props.lookup("foo"));

    // Pointer value.
    const one: u8 = 1;
    try props.set("foo", .{ .resource = &one });
    try testing.expectEqual(Props.Kind.resource, std.meta.activeTag(props.lookup("foo").?));
    try testing.expectEqual(&one, try props.get(.resource, "foo"));
    try testing.expectError(error.WrongType, props.get(.string, "foo"));
    try testing.expectError(error.WrongType, props.get(.integer, "foo"));
    try testing.expectError(error.WrongType, props.get(.float, "foo"));
    try testing.expectError(error.WrongType, props.get(.boolean, "foo"));

    // String value (replaces the previous type under the same name).
    try props.set("foo", .{ .string = "bar" });
    try testing.expectEqual(Props.Kind.string, std.meta.activeTag(props.lookup("foo").?));
    try testing.expectEqualStrings("bar", try props.get(.string, "foo"));
    try testing.expectError(error.WrongType, props.get(.resource, "foo"));
    try testing.expectError(error.WrongType, props.get(.integer, "foo"));

    // Number value.
    try props.set("foo", .{ .integer = 1 });
    try testing.expectEqual(Props.Kind.integer, std.meta.activeTag(props.lookup("foo").?));
    try testing.expectEqual(1, try props.get(.integer, "foo"));
    try testing.expectError(error.WrongType, props.get(.string, "foo"));
    try testing.expectError(error.WrongType, props.get(.float, "foo"));

    // Float value.
    try props.set("foo", .{ .float = 1.75 });
    try testing.expectEqual(Props.Kind.float, std.meta.activeTag(props.lookup("foo").?));
    try testing.expectEqual(1.75, try props.get(.float, "foo"));
    try testing.expectError(error.WrongType, props.get(.integer, "foo"));

    // Boolean value.
    try props.set("foo", .{ .boolean = true });
    try testing.expectEqual(Props.Kind.boolean, std.meta.activeTag(props.lookup("foo").?));
    try testing.expectEqual(true, try props.get(.boolean, "foo"));
    try testing.expectError(error.WrongType, props.get(.integer, "foo"));

    // Exactly one property named foo.
    try testing.expectEqual(1, count_named(&props, "foo"));
    try testing.expectEqual(1, props.count());

    // Empty names are rejected.
    try testing.expectError(error.InvalidName, props.set("", .{ .boolean = true }));
}

// properties_testCopy
test "sdl properties: copy" {
    const Props = Properties(Resource);
    var token: u8 = 7;
    var a = Props.init(testing.allocator);
    defer a.deinit();
    try a.set("num", .{ .integer = 1 });
    try a.set("string", .{ .string = "foo" });
    try a.set("data", .{ .resource = &token });

    var b = Props.init(testing.allocator);
    defer b.deinit();
    try b.set("num", .{ .integer = 2 });
    try b.set("other", .{ .boolean = true });

    try b.copy_from(&a);
    // Destroying the source must not affect the destination.
    var source = a;
    a = Props.init(testing.allocator);
    source.deinit();

    try testing.expectEqual(1, try b.get(.integer, "num"));
    try testing.expectEqualStrings("foo", try b.get(.string, "string"));
    try testing.expectEqual(&token, try b.get(.resource, "data"));
    // Unrelated names are preserved by copy_from.
    try testing.expectEqual(true, try b.get(.boolean, "other"));

    // Self copy is a no-op; clone is detached.
    try b.copy_from(&b);
    var c = try b.clone(testing.allocator);
    defer c.deinit();
    const bs = try b.get(.string, "string");
    const cs = try c.get(.string, "string");
    try testing.expect(bs.ptr != cs.ptr);
    try testing.expectEqual(b.count(), c.count());
    // Note: SDL does not copy properties holding cleanup callbacks; zdl has no
    // cleanup callbacks and resources are always borrowed, so they are copied.
}

// properties_testCleanup (ownership instead of callbacks)
test "sdl properties: cleanup of owned storage" {
    const Props = Properties(Resource);
    var props = Props.init(testing.allocator);
    const values = "abcdefghij";
    for (0..10) |i| {
        try props.set(values[i .. i + 1], .{ .string = "owned string value" });
    }
    // Replacement and removal release the old string; deinit releases the rest.
    try props.set("a", .{ .string = "replacement" });
    try testing.expect(props.remove("b"));
    props.deinit();
    // Reuse after deinit is allowed, and repeated deinit is safe.
    try props.set("again", .{ .integer = 1 });
    props.deinit();
    props.deinit();
}

// Primitive-only configuration used by objects without resources.
test "sdl properties: primitive-only set" {
    var props = Properties(void).init(testing.allocator);
    defer props.deinit();
    try props.set("n", .{ .integer = -5 });
    try testing.expectEqual(-5, try props.get(.integer, "n"));
}
