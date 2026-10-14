//! Compile-only consumer for the devices area. Every call that could touch a
//! device, file or socket sits behind a PID-zero guard that never holds, so the
//! program is built and linked but never meant to be run.
const std = @import("std");
const zdl = @import("zdl");

const haptic = zdl.haptic.evdev;
const effect = zdl.haptic.effect;
const hid = zdl.hid.hidraw;
const sysfs = zdl.hid.sysfs;
const filter = zdl.hid.filter;
const descriptor = zdl.hid.report_descriptor;
const sensor = zdl.sensor.sensor;

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    const gpa = std.heap.page_allocator;

    // Haptics: enumeration, effect lifecycle, gain, rumble.
    const haptic_infos = try haptic.enumerate(gpa);
    defer haptic.free_device_infos(gpa, haptic_infos);
    if (try haptic.probe(gpa, "/dev/input/event0")) |found| found.deinit(gpa);

    var device = try haptic.Device.open(gpa, "/dev/input/event0");
    defer device.deinit();
    _ = device.max_effects();
    _ = device.max_playing();
    _ = device.features();

    const id = try device.create_effect(.{ .constant = .{
        .timing = .{ .length = 500, .button = 2, .interval = 10 },
        .direction = .{ .cartesian = .{ 1, 1, 0 } },
        .level = 0x4000,
        .envelope = .{ .attack_length = 10, .attack_level = 100 },
    } });
    try device.run_effect(id, 1);
    try device.stop_effect(id);
    try device.update_effect(id, .{ .constant = .{ .direction = .{ .polar = -9000 }, .level = 100 } });
    try device.destroy_effect(id);

    const periodic_id = try device.create_effect(.{ .periodic = .{
        .direction = .{ .spherical = .{ -12000, 0, 0 } },
        .waveform = .saw_down,
        .period = 100,
        .magnitude = -5000,
        .phase = 9000,
    } });
    try device.update_effect(periodic_id, .{ .periodic = .{
        .direction = .steering_axis,
        .waveform = .sine,
        .period = 50,
        .magnitude = 1000,
    } });
    try device.destroy_effect(periodic_id);

    const condition_id = try device.create_effect(.{ .condition = .{
        .direction = .{ .polar = 0 },
        .kind = .spring,
        .axes = .{
            .{ .right_saturation = 1000, .left_saturation = 1000, .right_coeff = 10, .left_coeff = -10 },
            .{},
            .{},
        },
    } });
    try device.destroy_effect(condition_id);

    _ = try device.create_effect(.{ .ramp = .{ .direction = .{ .polar = 0 }, .start = -100, .end = 100 } });
    _ = try device.create_effect(.{ .left_right = .{ .length = 200, .large_magnitude = 1000, .small_magnitude = 500 } });
    const custom_data = [_]u16{ 1, 2, 3, 4 };
    _ = device.create_effect(.{ .custom = .{
        .direction = .{ .polar = 0 },
        .channels = 2,
        .period = 10,
        .samples = 2,
        .data = &custom_data,
    } }) catch |err| {
        if (err != error.Unsupported) return err;
    };
    try device.set_gain(50);
    try device.set_autocenter(0);
    try device.pause();
    try device.unpause();
    _ = try device.init_rumble();
    try device.play_rumble(0.5, 200);
    try device.stop_rumble();
    try device.stop_all();

    // HID: enumeration, filters, descriptor walking and raw report access.
    const hid_infos = try sysfs.enumerate(gpa, .{ .only_controllers = true, .ignored_devices = "0x045e/0x0000" });
    defer sysfs.free_device_infos(gpa, hid_infos);
    const node_infos = try sysfs.info_for_node(gpa, "hidraw0", .{});
    defer sysfs.free_device_infos(gpa, node_infos);
    _ = filter.is_ignored(.{}, .usb, 0x28de, 0x1205, 0x0001, 0x0006);

    var hidraw = try hid.Device.open(gpa, "/dev/hidraw0");
    defer hidraw.close();
    _ = try hidraw.raw_info();
    const report_bytes = try hidraw.report_descriptor(gpa);
    defer gpa.free(report_bytes);
    var walk: descriptor.Iterator = .{ .descriptor = report_bytes };
    while (try walk.next()) |usage| _ = usage;

    var buffer: [64]u8 = undefined;
    _ = try hidraw.write(buffer[0..4]);
    hidraw.set_blocking(false);
    _ = try hidraw.read(&buffer);
    _ = try hidraw.read_timeout(&buffer, 250);
    _ = try hidraw.send_feature_report(buffer[0..8]);
    _ = try hidraw.get_feature_report(&buffer);
    _ = try hidraw.get_input_report(&buffer);
    _ = try hidraw.info(gpa, .{});

    // Sensors: samples are stored and returned as events, with no device open.
    var accel = sensor.Sensor.init(1, "accelerometer", .accel, -1);
    const event = accel.update(10, 9, &.{ 0, 0, sensor.standard_gravity });
    var out: [sensor.max_values]f32 = undefined;
    _ = accel.read(&out);
    _ = event;
}
