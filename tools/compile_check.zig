//! Compile-only native consumer. The build never runs this program.
//! Explicit calls instantiate generic bodies and formatting paths that a lazy
//! import alone would leave unchecked. No assertions, device access or tests
//! are added here; this guards the public API's ability to compile.
const std = @import("std");
const zdl = @import("zdl");
const geometry = zdl.geometry;
const time = zdl.time;
const Guid = zdl.Guid;
const Diagnostic = zdl.Diagnostic;
const SpinLock = zdl.SpinLock;

pub fn main() !void {
    try foundations();
    try properties();
    try audio();
    try audio_queue();
    try audio_streams();
    try wave();
    if (@import("builtin").os.tag == .linux) {
        try alsa();
        try x11();
    }
    try pixels_and_surfaces();
    try software();
    try yuv();
    try keyboard();
    @import("checks/fs.zig").check();
    @import("checks/events.zig").check();
    try @import("checks/system.zig").check();
    try @import("checks/camera.zig").check();
    try @import("checks/audio_linux.zig").check();
    try @import("checks/xkb.zig").check();
    @import("checks/render.zig").check();
    try @import("checks/devices.zig").check();
    try @import("checks/joystick.zig").check();
    try @import("checks/wayland.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/x11.zig").check();
    try @import("checks/dbus.zig").check();
    try @import("checks/desktop.zig").check();
    try @import("checks/tray.zig").check();
    try @import("checks/video_core.zig").check();
    try @import("checks/pulse.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/x11b.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/wayland2.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/gl.zig").check();
    try @import("checks/misc_input.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/audio3.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/asyncio.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/platform.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/jack.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/gpu.zig").check();
    try @import("checks/pixels2.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/hidapi.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/wayland3.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/x11c.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/gpu2.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/hidapi2.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/platform2.zig").check();
    @import("checks/app.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/upower.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/render_gpu.zig").check();
    @import("checks/image.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/gpu3.zig").check();
    try @import("checks/convert.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/wayland4.zig").check();
    @import("checks/events2.zig").check();
    if (@import("builtin").target.os.tag == .linux) @import("checks/events2_app.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/render_gpu2.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/x11d.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/hidapi3.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/platform3.zig").check();
    if (@import("builtin").target.os.tag == .linux) try @import("checks/graphics.zig").check();
    try @import("checks/lifecycle.zig").check();
}

fn keyboard() !void {
    @setEvalBranchQuota(100_000);
    const kb = zdl.keyboard;
    var buffer: [4]u8 = undefined;
    _ = zdl.casefold.fold(0x00DF).slice();
    _ = try zdl.casefold.order("Stra\u{DF}e", "STRASSE");
    var keymap = kb.Keymap.init(std.heap.page_allocator);
    defer keymap.deinit();
    try keymap.set(.a, .{ .caps = true }, @fromBackingInt(@intCast('A')));
    _ = keymap.keycode(.a, .{ .left_shift = true, .mode = true, .caps = true });
    _ = keymap.chord(.a);
    _ = keymap.next_reserved_scancode();
    const layout = keymap.layout();
    const context: kb.NameContext = .{
        .keymap = kb.effective_keymap(&keymap, layout, .{}),
        .names = .{ .overrides = &.{.{ .scancode = .application, .name = "Menu" }} },
    };
    inline for (comptime std.meta.tags(kb.Scancode)) |scancode| {
        _ = scancode.name();
        _ = kb.default_keycode(scancode, .{ .caps = true });
        _ = kb.event_keycode(&keymap, layout, scancode, .{ .num = true }, .{ .hide_numpad = true });
    }
    inline for (comptime std.meta.tags(kb.Keycode)) |key| {
        _ = key.name(context, &buffer);
        _ = kb.default_chord(key);
        _ = key.without_numpad(false);
    }
    _ = kb.Keycode.from_name("Keypad 1", context);
    _ = kb.Scancode.from_name("Return");
    _ = kb.Modifiers.from_bits(0xFFFF).for_keymap();
    _ = kb.event_keycode(null, kb.default_layout, .@"1", .none, .{});
    var state: zdl.keyboard_state.KeyboardState = .{};
    state.set_keymap(&keymap);
    _ = state.key(.{ .scancode = .capslock, .down = true, .focus = .{ .fullscreen = true } });
    _ = try state.key_with_keycode(.{ .scancode = .a, .down = true, .source = .autorelease }, .a);
    var typed: [4]zdl.keyboard_state.KeyTransition = undefined;
    _ = try state.unicode_key(0x00E9, 0, &typed);
    var releases = state.release_autoreleased(0);
    while (releases.next()) |_| {}
    var all = state.reset(0);
    while (all.next()) |_| {}
    _ = state.is_pressed(.a);
    _ = state.hardware_active(0);
    _ = state.name_keymap();
    state.toggle_modifiers(.{ .num = true }, true);
    const lk = zdl.linux_keys;
    inline for (comptime std.meta.tags(lk.Table)) |table| _ = table.scancode(42);
    _ = lk.evdev_scancode(30);
    _ = lk.keysym_to_ucs(0x5A0);
    _ = lk.keysym_scancode(0x41, 38);
    _ = lk.keysym_keycode(0xFE51, 0, .{ .left_shift = true });
    _ = kb.Keycode.from_name("Menu", .{ .names = lk.names });
}

fn yuv() !void {
    const allocator = std.heap.page_allocator;
    var raster = try zdl.surface.Surface.init(allocator, 3, 3, .rgba8, null);
    defer raster.deinit();
    try raster.view.fill(.{ .r = 100, .g = 150, .b = 200 }, null);
    inline for (comptime std.meta.tags(zdl.yuv.Layout)) |layout| {
        inline for (comptime std.meta.tags(zdl.yuv.Encoding)) |encoding| {
            var image = try zdl.yuv.Image.from_surface(allocator, raster.view, layout, encoding);
            defer image.deinit();
            const view = try zdl.yuv.View.init(image.view.width, image.view.height, layout, image.view.storage);
            _ = try view.sample(2, 2);
            _ = try view.read(2, 2, encoding);
            _ = zdl.yuv.to_rgb(.{ .y = 16, .u = 128, .v = 128 }, encoding);
            try view.convert_into(raster.view, encoding);
            var decoded = try view.to_surface(allocator, encoding, .rgb8, null);
            defer decoded.deinit();
            var copy = try zdl.yuv.Image.copy(allocator, view);
            defer copy.deinit();
        }
    }
}

fn audio_streams() !void {
    const allocator = std.heap.page_allocator;
    inline for (comptime std.meta.tags(zdl.audio.Layout)) |source_layout| {
        inline for (comptime std.meta.tags(zdl.audio.Layout)) |destination_layout| {
            const S = zdl.audio.Stream(source_layout, destination_layout);
            const source_channels = comptime source_layout.channels();
            const destination_channels = comptime destination_layout.channels();
            var converter = try S.init(allocator, .{ .format = .signed32_be, .sample_rate = 44100, .max_block_frames = 4 });
            defer converter.deinit();
            const source: S.Source = .{ .format = .signed32_le, .sample_rate = 48000 };
            try converter.reserve(source, 12);
            const input: [12 * source_channels * 4]u8 = @splat(0);
            var output: [16 * destination_channels * 4]u8 = undefined;
            try converter.write(source, &input);
            _ = try converter.read_some(&output);
            try converter.write(.{ .format = .signed32_le, .sample_rate = 44100 }, &input);
            var input_map: [source_channels]?u3 = undefined;
            for (&input_map, 0..) |*entry, index| entry.* = @intCast(index);
            const owned = try allocator.dupe(u8, &input);
            converter.append_owned(.{ .format = .float32_le, .sample_rate = 22050, .channel_map = input_map }, owned) catch |err| {
                allocator.free(owned);
                return err;
            };
            converter.flush();
            try converter.set_gain(0.5);
            try converter.set_output_map(@as([destination_channels]?u3, @splat(null)));
            _ = converter.destination_spec();
            _ = converter.queued_bytes();
            _ = try converter.available_frames();
            _ = try converter.status();
            _ = try converter.read_some(&output);
            converter.clear();
        }
    }
}

fn audio_queue() !void {
    const allocator = std.heap.page_allocator;
    var queue = zdl.audio.Queue.init(allocator);
    defer queue.deinit();
    const spec: zdl.audio.Spec = .{ .format = .unsigned8, .channels = 2, .sample_rate = 48000 };
    try queue.write(spec, &.{ 0, null }, &.{ 128, 128, 129, 129 });
    const owned = try allocator.dupe(u8, &.{ 127, 127 });
    queue.append_owned(spec, &.{ 0, null }, owned) catch |err| {
        allocator.free(owned);
        return err;
    };
    queue.flush();
    try queue.reset_history(7);
    if (queue.head()) |metadata| _ = metadata.frames();
    _ = queue.queued_bytes();
    var iterator = queue.streams();
    while (iterator.next()) |_| {}
    var destination: [34]u8 = undefined;
    _ = try queue.read_window(&destination, 7, 3, 7);
    try queue.advance();
    try queue.write(spec, null, &.{ 128, 128 });
    queue.discard_stream();
    queue.clear();
}

fn software() !void {
    var image = try zdl.surface.Surface.init(std.heap.page_allocator, 16, 16, .rgba8, null);
    defer image.deinit();
    const draw: zdl.software.Rasterizer = .{ .target = image.view, .clip = .{ .x = 1, .y = 1, .width = 14, .height = 14 }, .blend = .ALPHA };
    const positions = [_]zdl.software.Point{ .{ .x = -8, .y = 2 }, .{ .x = 12, .y = 12 }, .{ .x = 2, .y = 12 } };
    try draw.point(positions[0]);
    try draw.points(&positions);
    try draw.line(positions[0], positions[1]);
    try draw.polyline(&positions, false);
    try draw.polyline(&positions, true);
    try draw.fill_rect(.{ .x = 2, .y = 2, .width = 4, .height = 4 });
    try draw.stroke_rect(.{ .x = 2, .y = 2, .width = 4, .height = 4 });
    const vertices = [_]zdl.software.Vertex{
        .{ .position = .{ .x = 1, .y = 1 }, .uv = .{ .x = -1, .y = 0 } },
        .{ .position = .{ .x = 12, .y = 1 }, .uv = .{ .x = 1, .y = 0 } },
        .{ .position = .{ .x = 1, .y = 12 }, .uv = .{ .x = 0, .y = 1 } },
    };
    try draw.triangle(std.heap.page_allocator, vertices, null);
    try draw.triangle(std.heap.page_allocator, vertices, .{ .view = image.view, .horizontal = .repeat });
    try draw.mesh(std.heap.page_allocator, &vertices, &.{ 2, 1, 0 }, .{ .view = image.view });
}

fn foundations() !void {
    inline for (.{ i32, f32 }) |Scalar| {
        const R = geometry.Rect(Scalar);
        const rect: R = .{ .x = 0, .y = 0, .width = 10, .height = 10 };
        try rect.validate();
        _ = rect.is_empty();
        _ = rect.contains(.{ .x = 1, .y = 1 });
        _ = try rect.intersection(rect);
        _ = try rect.union_with(rect);
        _ = try R.enclosing(&.{.{ .x = 1, .y = 1 }}, rect);
        var bounds: R.Bounds = .{};
        try bounds.include(.{ .x = 1, .y = 1 });
        _ = try bounds.rectangle();
        _ = try rect.clip_line(.{ .start = .{ .x = -10, .y = 0 }, .end = .{ .x = 10, .y = 10 } });
    }
    _ = geometry.enclosing_vertical_span(100, 100, &.{.{ .x = 0, .y = 1, .width = 2, .height = 3 }});
    const date: time.Date = .{ .year = 2026, .month = .oct, .day = 14 };
    _ = try date.weekday();
    _ = try date.year_day();
    _ = try time.Date.from_days(try date.days_since_epoch());
    const instant: time.DateTime = .{ .date = date };
    _ = try time.DateTime.from_timestamp(try instant.to_timestamp(), 0);
    _ = try time.from_windows_time(time.to_windows_time(0));
    const guid = try Guid.parse("00112233445566778899aabbccddeeff");
    var message = Diagnostic.init(std.heap.page_allocator);
    defer message.deinit();
    try message.set("{f}", .{guid});
    var lock: SpinLock = .{};
    lock.lock();
    lock.unlock();
    if (lock.try_lock()) lock.unlock();
}

fn properties() !void {
    var resource: u32 = 42;
    inline for (.{ void, *u32 }) |Resource| {
        const P = zdl.Properties(Resource);
        var props = P.init(std.heap.page_allocator);
        defer props.deinit();
        try props.set("string", .{ .string = "value" });
        try props.set("boolean", .{ .boolean = true });
        try props.set("integer", .{ .integer = 42 });
        try props.set("float", .{ .float = 1.5 });
        _ = try props.get(.string, "string");
        _ = try props.get(.boolean, "boolean");
        _ = try props.get(.integer, "integer");
        _ = try props.get(.float, "float");
        if (Resource != void) {
            try props.set("resource", .{ .resource = &resource });
            _ = try props.get(.resource, "resource");
        }
        var copy = try props.clone(std.heap.page_allocator);
        defer copy.deinit();
        try props.copy_from(&copy);
        _ = props.lookup("float");
        var entries = props.iterator();
        while (entries.next()) |_| {}
        _ = props.count();
        _ = props.remove("string");
    }
}

fn audio() !void {
    inline for (comptime std.meta.tags(zdl.audio.Layout)) |source_layout| {
        inline for (comptime std.meta.tags(zdl.audio.Layout)) |destination_layout| {
            const samples: [source_layout.channels() * 2]f32 = @splat(0);
            var converted: [destination_layout.channels() * 2]f32 = undefined;
            _ = try zdl.audio.convert_channels(source_layout, destination_layout, &samples, &converted);
            const frames = try zdl.audio.convert_frames(source_layout, destination_layout, std.heap.page_allocator, std.mem.sliceAsBytes(&samples), .{ .source_format = .float32_le, .destination_format = .signed16_le });
            std.heap.page_allocator.free(frames);
        }
    }
    var resampler = try zdl.audio.Resampler.init(48000, 44100, 2);
    _ = try resampler.input_frames_for(8);
    _ = try resampler.output_frames_for(9);
    const padded: [46]f32 = @splat(0);
    var output: [64]f32 = undefined;
    _ = try resampler.process(.{ .samples = &padded, .frames = 9 }, &output);
    try resampler.set_rates(44100, 48000);
    resampler.reset();
    inline for (comptime std.meta.tags(zdl.audio.Format)) |format| {
        const spec: zdl.audio.Spec = .{ .format = format, .channels = 1, .sample_rate = 48000 };
        var bytes: [16]u8 = @splat(0);
        var samples: [16]f32 = undefined;
        _ = try spec.frame_count(&bytes);
        const decoded = try zdl.audio.decode_into(format, &bytes, &samples);
        _ = try zdl.audio.encode_into(format, decoded, &bytes);
        try zdl.audio.mix_into(format, &bytes, &bytes, 0.5);
        inline for (comptime std.meta.tags(zdl.audio.Format)) |destination| {
            const converted = try zdl.audio.convert(std.heap.page_allocator, format, &bytes, destination);
            std.heap.page_allocator.free(converted);
        }
    }
}

fn pixels_and_surfaces() !void {
    const color: zdl.pixels.Color = .{ .r = 50, .g = 100, .b = 150 };
    const palette = [_]zdl.pixels.Color{ .{ .r = 0, .g = 0, .b = 0 }, color };
    _ = try zdl.pixels.nearest_color(&palette, color);
    _ = zdl.pixels.srgb_to_linear(0.5);
    _ = zdl.pixels.linear_to_srgb(0.5);
    const direct = [_]zdl.pixels.Format{ .rgba8, .bgra8, .argb8, .abgr8, .rgb8, .bgr8 };
    for (direct) |format| {
        var image = try zdl.surface.Surface.init(std.heap.page_allocator, 8, 8, format, null);
        defer image.deinit();
        _ = image.view.bounds();
        _ = try image.view.row(0);
        try image.view.write(0, 0, color);
        _ = try image.view.read(0, 0);
        try image.view.fill(color, null);
        const bitmap = try zdl.surface.bmp.encode(std.heap.page_allocator, image.view);
        defer std.heap.page_allocator.free(bitmap);
        _ = zdl.surface.bmp.is_bmp(bitmap);
        var decoded = try zdl.surface.bmp.decode(std.heap.page_allocator, bitmap, .{});
        defer decoded.deinit();
        inline for (.{ zdl.surface.ScaleMode.nearest, zdl.surface.ScaleMode.linear, zdl.surface.ScaleMode.pixel_art }) |mode| {
            var scaled = try zdl.surface.Surface.scaled(std.heap.page_allocator, image.view, 4, 4, mode);
            defer scaled.deinit();
        }
        var duplicate = try zdl.surface.Surface.copy(std.heap.page_allocator, image.view);
        defer duplicate.deinit();
        _ = try image.view.blit(std.heap.page_allocator, duplicate.view, .{});
        _ = try image.view.blit(std.heap.page_allocator, image.view, .{ .destination = .{ .x = 1, .y = 1 }, .blend = zdl.surface.Blend.ALPHA });
        const blend: zdl.surface.Blend = .{ .color = .{ .source = .source_color, .destination = .destination_color, .operation = .maximum }, .alpha = .{ .source = .source_alpha, .destination = .destination_alpha, .operation = .minimum } };
        _ = blend.apply(color, color);
        var converted = try zdl.surface.Surface.convert(std.heap.page_allocator, image.view, .rgba8, null);
        defer converted.deinit();
        try image.view.fill(color, .{ .x = -1, .y = -1, .width = 3, .height = 3 });
    }
    inline for (.{ @as(u4, 1), @as(u4, 2), @as(u4, 4), @as(u4, 8) }) |bits| {
        inline for (.{ zdl.pixels.BitOrder.msb_first, zdl.pixels.BitOrder.lsb_first }) |order| {
            const format: zdl.pixels.Format = .{ .indexed = try zdl.pixels.Indexed.init(bits, order) };
            var image = try zdl.surface.Surface.init(std.heap.page_allocator, 8, 8, format, &palette);
            defer image.deinit();
            try image.view.fill(color, null);
            _ = try image.view.read(0, 0);
        }
    }
    inline for (.{ std.lang.Endian.little, std.lang.Endian.big }) |order| {
        const packing = try zdl.pixels.Packed.from_masks(2, order, .{ .r = 0xf800, .g = 0x7e0, .b = 0x1f });
        _ = packing.unpack(packing.pack(color));
        var image = try zdl.surface.Surface.init(std.heap.page_allocator, 8, 8, .{ .masked = packing }, null);
        defer image.deinit();
        try image.view.fill(color, null);
        _ = try image.view.read(0, 0);
    }
}

fn wave() !void {
    const bytes = "RIFF\x26\x00\x00\x00WAVEfmt \x10\x00\x00\x00" ++
        "\x01\x00\x01\x00\x80\xbb\x00\x00\x80\xbb\x00\x00\x01\x00\x08\x00" ++
        "data\x02\x00\x00\x00\x80\x80";
    const parsed = try zdl.audio.Wave.parse(bytes, .{});
    _ = try parsed.frames();
    _ = parsed.header.decoded_format();
    var decoded = try parsed.decode(std.heap.page_allocator);
    defer decoded.deinit();
}

fn alsa() !void {
    // User processes cannot have PID zero. Keep hardware calls semantically
    // checked and linked, but inaccessible if someone manually runs this driver.
    if (std.os.linux.getpid() != 0) return;
    var library = try zdl.audio.alsa.Library.open();
    defer library.deinit();
    var endpoints = try library.enumerate(std.heap.page_allocator);
    defer endpoints.deinit();
    var device = try zdl.audio.alsa.Device.open(&library, .{
        .spec = .{ .format = .float32_le, .channels = 2, .sample_rate = 48000 },
    });
    defer device.deinit();
    if (try device.channel_map(std.heap.page_allocator)) |map| std.heap.page_allocator.free(map);
    const input: [16]u8 = @splat(0);
    var output: [16]u8 = undefined;
    _ = try device.write(&input);
    _ = try device.read(&output);
    _ = try device.wait(0);
    try device.recover();
    try device.prepare();
    try device.drain();
    try device.stop();
}

fn x11() !void {
    if (std.os.linux.getpid() != 0) return; // Compile/link only; never open a window.
    var library = try zdl.x11.window.Library.open(std.heap.page_allocator);
    defer library.deinit();
    var connection = try zdl.x11.window.Connection.open(&library, null);
    defer connection.deinit();
    _ = try connection.file_descriptor();
    try connection.flush();
    var window = try zdl.x11.window.Window.create(&connection, .{});
    defer window.deinit();
    try window.set_title("compile consumer");
    try window.show();
    try window.hide();
    try window.resize(.{ .width = 640, .height = 480 });
    if (try connection.poll()) |event| window.apply(event);
    var image = try zdl.surface.Surface.init(std.heap.page_allocator, 640, 480, .rgba8, null);
    defer image.deinit();
    try window.present(std.heap.page_allocator, image.view);
}
