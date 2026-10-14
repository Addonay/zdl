const std = @import("std");
const gpu = @import("zdl").gpu;

// Compile-only consumer. Nothing here runs: the guard below returns before any
// call that would touch the GPU driver.
pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    const dev = try gpu.device.Device.create(allocator, .{
        .debug_mode = true,
        .instance_extensions = &.{ "VK_KHR_surface", "VK_KHR_xlib_surface" },
    });
    defer dev.destroy();
    _ = dev.device_name();
    _ = dev.supports_texture_format(.r8g8b8a8_unorm, .@"2d", .{ .sampler = true });
    _ = dev.supports_sample_count(.d32_float, .@"4");

    const surface: u64 = 0;
    _ = try dev.supports_swapchain_composition(surface, .sdr);
    _ = try dev.supports_present_mode(surface, .mailbox);

    var buffer = try dev.create_buffer(.{ .usage = .{ .vertex = true }, .size = 64 });
    defer buffer.deinit();
    var transfer = try dev.create_transfer_buffer(.{ .usage = .upload, .size = 64 });
    defer transfer.deinit();
    var texture = try dev.create_texture(.{
        .format = .r8g8b8a8_unorm,
        .usage = .{ .sampler = true, .color_target = true },
        .width = 4,
        .height = 4,
    });
    defer texture.deinit();
    var sampler = try dev.create_sampler(.{});
    defer sampler.deinit();
    var shader = try dev.create_shader(.{
        .code = &.{ 0x03, 0x02, 0x23, 0x07 },
        .format = .{ .spirv = true },
        .stage = .vertex,
    });
    defer shader.deinit();

    var abandoned = try dev.acquire_command_buffer();
    try abandoned.abort();

    var cb = try dev.acquire_command_buffer();
    try cb.copy_buffer(&buffer, 0, &buffer, 0, 16);
    try cb.upload_texture(&transfer, .{}, &texture, .{ .w = 4, .h = 4 });
    try cb.download_texture(&texture, .{ .w = 4, .h = 4 }, &transfer, .{});

    var swapchain = try gpu.device.Swapchain.create(dev, surface, .{ .present_mode = .vsync });
    defer swapchain.deinit();
    if (try cb.acquire_swapchain_texture(&swapchain)) |target| {
        _ = target.width();
    }
    const fence = try cb.submit_with_fence();
    try dev.wait_fence(fence);
    _ = try dev.is_fence_complete(fence);

    const bytes = try transfer.map();
    _ = bytes.len;
    transfer.unmap();

    try swapchain.recreate(.{ .composition = .sdr_linear });
    try dev.wait_idle();
}
