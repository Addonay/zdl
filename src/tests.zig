//! Runtime unit tests ported from SDL's automated test suites (test/testautomation_*.c).
//! Referenced from the test block in root.zig so `zig build test` reaches them.
comptime {
    _ = @import("video/geometry_test.zig");
    _ = @import("core/guid_test.zig");
    _ = @import("core/properties_test.zig");
}
