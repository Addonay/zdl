const std = @import("std");
const gpu = @import("zdl").gpu;

fn window_size() gpu.window.WindowSize {
    return .{ .width = 640, .height = 480 };
}

// Compile-only consumer. Nothing here runs: the guard below returns before any
// call that would touch the GPU driver.
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

    const dev = try gpu.device.Device.create(allocator, .{
        .debug_mode = true,
        .instance_extensions = &.{ "VK_KHR_surface", "VK_KHR_xlib_surface" },
    });
    defer dev.destroy();
    dev.name_object(.buffer, 1, "vertices");

    // Shaders and pipelines.
    var vs = try dev.create_shader(.{ .code = &.{ 0x03, 0x02, 0x23, 0x07 }, .format = .{ .spirv = true }, .stage = .vertex, .entrypoint = "main", .num_uniform_buffers = 1 });
    defer vs.deinit();
    var fs = try dev.create_shader(.{ .code = &.{ 0x03, 0x02, 0x23, 0x07 }, .format = .{ .spirv = true }, .stage = .fragment, .entrypoint = "main", .num_samplers = 1 });
    defer fs.deinit();
    var pipe = try dev.create_graphics_pipeline(.{
        .vertex_shader = &vs,
        .fragment_shader = &fs,
        .vertex_input_state = .{
            .vertex_buffer_descriptions = &.{.{ .slot = 0, .pitch = 16 }},
            .vertex_attributes = &.{.{ .location = 0, .buffer_slot = 0, .format = .float4, .offset = 0 }},
        },
        .target_info = .{ .color_target_descriptions = &.{.{ .format = .r8g8b8a8_unorm }} },
    });
    defer pipe.deinit();
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

    // Resources.
    var buffer = try dev.create_buffer(.{ .usage = .{ .vertex = true, .compute_storage_write = true }, .size = 64 });
    defer buffer.deinit();
    var transfer = try dev.create_transfer_buffer(.{ .usage = .upload, .size = 64 });
    defer transfer.deinit();
    var color = try dev.create_texture(.{
        .format = .r8g8b8a8_unorm,
        .usage = .{ .sampler = true, .color_target = true },
        .width = 4,
        .height = 4,
        .num_levels = 3,
    });
    defer color.deinit();
    var sampler = try dev.create_sampler(.{});
    defer sampler.deinit();

    // Command buffer: render pass, bindings, uniforms and draws.
    var cb = try dev.acquire_command_buffer();
    try cb.copy_buffer(&buffer, 0, &buffer, 0, 16);
    try cb.upload_texture(&transfer, .{}, &color, .{ .w = 4, .h = 4 });
    try cb.generate_mipmaps(&color);

    var rp = try cb.begin_render_pass(&.{.{ .texture = &color, .clear_color = .{ .a = 1 } }}, null);
    try rp.bind_graphics_pipeline(&pipe);
    try rp.bind_vertex_buffers(0, &.{.{ .buffer = &buffer }});
    try rp.bind_fragment_samplers(0, &.{.{ .texture = &color, .sampler = &sampler }});
    try rp.push_vertex_uniform_data(0, std.mem.asBytes(&[4]f32{ 1, 2, 3, 4 }));
    rp.set_viewport(.{ .x = 0, .y = 0, .w = 4, .h = 4 });
    rp.set_scissor(.{ .w = 4, .h = 4 });
    rp.set_blend_constants(.{});
    rp.set_stencil_reference(0);
    try rp.draw_primitives(3, 1, 0, 0);
    try rp.draw_primitives_indirect(&buffer, 0, 1);
    rp.end();

    var copy = try cb.begin_copy_pass();
    try copy.copy_texture_to_texture(&color, .{}, &color, .{}, 1, 1, 1);
    copy.end();

    var cpass = try cb.begin_compute_pass(&.{}, &.{&buffer});
    try cpass.bind_compute_pipeline(&cpipe);
    try cpass.dispatch(1, 1, 1);
    cpass.end();

    cb.push_debug_group("frame");
    cb.insert_debug_label("draw");
    cb.pop_debug_group();

    var swap = try dev.acquire_command_buffer();
    try gpu.window.claim_window(dev, 0, .{}, window_size);
    _ = try dev.get_swapchain_texture_format(0);
    if (try gpu.window.acquire_window_texture(&swap, 0)) |target| {
        _ = target.width();
    }
    try swap.submit();
    dev.unclaim_window(0);
    _ = try cb.blit_texture(.{ .source = &color, .source_region = .{ .w = 4, .h = 4 }, .destination = &color, .destination_region = .{ .w = 4, .h = 4 } });
    const fence = try cb.submit_with_fence();
    try dev.wait_fence(fence);
    try dev.wait_idle();
}
