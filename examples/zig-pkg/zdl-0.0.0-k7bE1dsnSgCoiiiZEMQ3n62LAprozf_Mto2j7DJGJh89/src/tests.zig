//! Runtime unit tests ported from SDL's automated test suites (test/testautomation_*.c).
//! Referenced from the test block in root.zig so `zig build test` reaches them.
comptime {
    _ = @import("video/geometry_test.zig");
    _ = @import("core/guid_test.zig");
    _ = @import("video/pixels_test.zig");
    _ = @import("video/surface_test.zig");
    _ = @import("video/blit_test.zig");
    _ = @import("render/renderer_test.zig");
    _ = @import("core/properties_test.zig");
    _ = @import("video/x11/shm.zig");
    _ = @import("platform/hit_test.zig");
    _ = @import("platform/window_controls.zig");
}
