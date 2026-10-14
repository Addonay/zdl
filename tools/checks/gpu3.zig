const std = @import("std");
const gpu = @import("zdl").gpu;

fn window_size() gpu.window.WindowSize {
    return .{ .width = 640, .height = 480 };
}

// Compile-only consumer for the cycling, layout, resolve, copy and cache paths.
// Nothing here runs: the guard below returns before any call that would touch
// the GPU driver.
pub fn check() !void {
    // Force analysis of every declaration, including ones this check never calls.
    comptime {
        std.testing.refAllDecls(gpu.device);
        std.testing.refAllDecls(gpu.descriptors);
        std.testing.refAllDecls(gpu.pipeline);
        std.testing.refAllDecls(gpu.pass);
        std.testing.refAllDecls(gpu.window);
        std.testing.refAllDecls(gpu.debug);
        std.testing.refAllDecls(gpu.tables);
        std.testing.refAllDecls(gpu.device.Device);
        std.testing.refAllDecls(gpu.device.CommandBuffer);
        std.testing.refAllDecls(gpu.device.Swapchain);
        std.testing.refAllDecls(gpu.device.Texture);
        std.testing.refAllDecls(gpu.device.TextureBacking);
        std.testing.refAllDecls(gpu.device.Buffer);
        std.testing.refAllDecls(gpu.device.TransferBuffer);
        std.testing.refAllDecls(gpu.device.Shader);
        std.testing.refAllDecls(gpu.pipeline.GraphicsPipeline);
        std.testing.refAllDecls(gpu.pipeline.ComputePipeline);
        std.testing.refAllDecls(gpu.pass.RenderPass);
        std.testing.refAllDecls(gpu.pass.ComputePass);
        std.testing.refAllDecls(gpu.pass.CopyPass);
    }
    if (std.os.linux.getpid() != 0) return;
    const allocator = std.heap.page_allocator;

    const dev = try gpu.device.Device.create(allocator, .{ .debug_mode = true });
    defer dev.destroy();

    var vs = try dev.create_shader(.{ .code = &.{ 0x03, 0x02, 0x23, 0x07 }, .format = .{ .spirv = true }, .stage = .vertex, .entrypoint = "main" });
    defer vs.deinit();
    var fs = try dev.create_shader(.{ .code = &.{ 0x03, 0x02, 0x23, 0x07 }, .format = .{ .spirv = true }, .stage = .fragment, .entrypoint = "main", .num_samplers = 1 });
    defer fs.deinit();

    // Single-sample and multisampled pipelines share the cached resource layouts.
    var pipe = try dev.create_graphics_pipeline(.{
        .vertex_shader = &vs,
        .fragment_shader = &fs,
        .target_info = .{ .color_target_descriptions = &.{.{ .format = .r8g8b8a8_unorm }} },
    });
    defer pipe.deinit();
    var msaa_pipe = try dev.create_graphics_pipeline(.{
        .vertex_shader = &vs,
        .fragment_shader = &fs,
        .target_info = .{ .color_target_descriptions = &.{.{ .format = .r8g8b8a8_unorm }} },
        .multisample_state = .{ .sample_count = .@"4" },
    });
    defer msaa_pipe.deinit();
    var cpipe = try dev.create_compute_pipeline(.{
        .code = &.{ 0x03, 0x02, 0x23, 0x07 },
        .format = .{ .spirv = true },
        .num_readwrite_storage_buffers = 1,
        .num_uniform_buffers = 1,
        .threadcount_x = 8,
        .threadcount_y = 8,
        .threadcount_z = 1,
    });
    defer cpipe.deinit();

    var buffer = try dev.create_buffer(.{ .usage = .{ .vertex = true, .compute_storage_write = true }, .size = 64 });
    defer buffer.deinit();
    var other = try dev.create_buffer(.{ .usage = .{ .vertex = true }, .size = 64 });
    defer other.deinit();
    var transfer = try dev.create_transfer_buffer(.{ .usage = .upload, .size = 64 });
    defer transfer.deinit();
    var download = try dev.create_transfer_buffer(.{ .usage = .download, .size = 64 });
    defer download.deinit();
    var color = try dev.create_texture(.{
        .format = .r8g8b8a8_unorm,
        .usage = .{ .sampler = true, .color_target = true },
        .width = 4,
        .height = 4,
        .num_levels = 3,
    });
    defer color.deinit();
    var resolve_tex = try dev.create_texture(.{
        .format = .r8g8b8a8_unorm,
        .usage = .{ .sampler = true, .color_target = true },
        .width = 4,
        .height = 4,
    });
    defer resolve_tex.deinit();
    var msaa_tex = try dev.create_texture(.{
        .format = .r8g8b8a8_unorm,
        .usage = .{ .color_target = true },
        .width = 4,
        .height = 4,
        .sample_count = .@"4",
    });
    defer msaa_tex.deinit();
    var sampler = try dev.create_sampler(.{});
    defer sampler.deinit();

    var cb = try dev.acquire_command_buffer();
    // Copies with per-resource cycling and the copy-pass entry points.
    try cb.copy_buffer_cycled(&buffer, 0, &other, 0, 16, true);
    try cb.upload_texture_cycled(&transfer, .{}, &color, .{ .w = 4, .h = 4 }, true);
    try cb.generate_mipmaps(&color);

    // Render pass with cycled targets and a resolve that cycles too.
    var rp = try cb.begin_render_pass(&.{.{
        .texture = &msaa_tex,
        .clear_color = .{ .a = 1 },
        .store_op = .store,
        .resolve = .{ .texture = &resolve_tex },
        .cycle = true,
        .cycle_resolve_texture = true,
    }}, null);
    try rp.bind_graphics_pipeline(&msaa_pipe);
    try rp.bind_vertex_buffers(0, &.{.{ .buffer = &buffer }});
    try rp.bind_fragment_samplers(0, &.{.{ .texture = &resolve_tex, .sampler = &sampler }});
    try rp.push_vertex_uniform_data(0, std.mem.asBytes(&[4]f32{ 1, 2, 3, 4 }));
    try rp.draw_primitives(3, 1, 0, 0);
    rp.end();

    var rp2 = try cb.begin_render_pass(&.{.{ .texture = &color, .clear_color = .{ .a = 1 }, .cycle = true }}, .{ .texture = &msaa_tex, .cycle = true });
    try rp2.bind_graphics_pipeline(&pipe);
    rp2.end();

    // Copy pass: buffer upload and download with offsets, plus cycled copies.
    var copy = try cb.begin_copy_pass();
    try copy.upload_to_buffer(.{ .transfer = &transfer, .offset = 8 }, .{ .buffer = &buffer, .offset = 16, .size = 32 }, true);
    try copy.download_from_buffer(.{ .buffer = &buffer, .offset = 16, .size = 32 }, .{ .transfer = &download, .offset = 0 });
    try copy.copy_buffer_to_buffer_cycled(&buffer, 0, &other, 0, 16, true);
    try copy.upload_to_texture_cycled(&transfer, .{}, &color, .{ .w = 4, .h = 4 }, true);
    try copy.copy_texture_to_texture_cycled(&color, .{}, &color, .{ .mip_level = 1 }, 1, 1, 1, true);
    try copy.download_from_texture(&color, .{ .w = 4, .h = 4 }, &download, .{});
    copy.end();

    // Compute pass with cycled storage.
    var cpass = try cb.begin_compute_pass_cycled(&.{}, &.{.{ .buffer = &buffer, .cycle = true }});
    try cpass.bind_compute_pipeline(&cpipe);
    try cpass.dispatch(1, 1, 1);
    cpass.end();

    const fence = try cb.submit_with_fence();
    try dev.wait_fence(fence);

    // Transfer buffer cycling on map.
    const bytes = try transfer.map_cycled(true);
    _ = bytes.len;
    transfer.unmap();

    var swapchain_cb = try dev.acquire_command_buffer();
    try gpu.window.claim_window(dev, 0, .{}, window_size);
    if (try gpu.window.acquire_window_texture(&swapchain_cb, 0)) |target| {
        _ = target.width();
    }
    try swapchain_cb.submit();
    dev.unclaim_window(0);
    try dev.wait_idle();
}
