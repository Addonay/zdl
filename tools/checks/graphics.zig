//! Compile-only consumer for the platform's window-to-graphics integration.
//! Everything that would touch a display, EGL or Vulkan is behind a PID guard.
const std = @import("std");
const zdl = struct {
    const linux = @import("zdl").linux;
    const gpu_window = @import("zdl").gpu.window;
    const gpu_device = @import("zdl").gpu.device;
};

const Counter = struct {
    calls: u32 = 0,
    fn size(self: *Counter) zdl.gpu_window.WindowSize {
        self.calls += 1;
        return .{ .width = 64, .height = 64 };
    }
};

fn plain() zdl.gpu_window.WindowSize {
    return .{ .width = 1, .height = 1 };
}

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;
    var threaded: std.Io.Threaded = .init_single_threaded;
    const io = threaded.io();

    var counter: Counter = .{};
    const source = zdl.gpu_window.SizeSource.bound(Counter, &counter, Counter.size);
    _ = source.read();
    _ = (zdl.gpu_window.SizeSource{ .function = plain }).read();

    const platform = try zdl.linux.Platform.open(allocator, io, .{});
    defer platform.close();
    var window = try platform.create_window(.{ .title = "graphics", .size = .{ .width = 640, .height = 480 } });
    defer window.deinit();

    _ = try window.size_in_pixels();
    _ = try window.pixel_density();
    _ = try window.gl_drawable_size();

    var context = try window.gl_create_context(.{ .attributes = .{ .major_version = 3, .minor_version = 3, .profile = .core } });
    defer context.deinit();
    try window.gl_make_current(context);
    try platform.gl_make_current(window, context);
    try platform.gl_make_current(null, null);
    try platform.gl_set_swap_interval(1);
    _ = try platform.gl_swap_interval();
    _ = platform.gl_extension_supported("GL_ARB_clip_control");
    _ = platform.gl_proc_address(*const fn () void, "glFlush");
    _ = platform.gl_current_window();
    _ = platform.gl_current_context();
    try window.gl_swap();

    _ = platform.vulkan_instance_extensions();
    var loader = try zdl.linux.VulkanLoader.open();
    defer loader.deinit();
    const get_proc = loader.proc_address();
    var instance_storage: u8 = 0;
    var physical_storage: u8 = 0;
    _ = platform.vulkan_presentation_support(get_proc, &instance_storage, &physical_storage, 0);
    const surface = try window.create_vulkan_surface(&instance_storage, get_proc);
    zdl.linux.Window.destroy_vulkan_surface(&instance_storage, get_proc, surface);

    var device = try zdl.gpu_device.Device.create(allocator, .{});
    defer device.destroy();
    const claimed = try window.claim_for_gpu(device, .{});
    try window.release_from_gpu(device);
    _ = claimed;
}
