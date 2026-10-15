const std = @import("std");
const zdl = @import("zdl").system;

const Ctx = struct { hits: u32 };
const Timers = zdl.timer.Scheduler(*Ctx);

fn on_tick(ctx: *Ctx, id: zdl.timer.TimerId, interval: u64) u64 {
    _ = id;
    ctx.hits += 1;
    return interval;
}

fn exercise(gpa: std.mem.Allocator, io: std.Io) !void {
    // Power, cpu, locale and iconv are pure reads; calls are still guarded.
    _ = zdl.power.query(io, .{});
    _ = zdl.cpu.query(io);
    _ = zdl.cpu.apply_feature_mask(zdl.cpu.Features.full, "-avx,+sse2");
    _ = zdl.cpu.simd_alignment(zdl.cpu.Features.empty);

    var env = std.process.Environ.Map.init(gpa);
    defer env.deinit();
    var locales = try zdl.locale.preferred(gpa, &env, null);
    defer locales.deinit(gpa);

    const utf8 = try zdl.iconv.convert_alloc(gpa, .utf16, .utf8, "\xff\xfe");
    defer gpa.free(utf8);
    var converter = try zdl.iconv.Converter.open_names("", "UTF-8", &env);
    var buffer: [16]u8 = undefined;
    _ = converter.convert("abc", &buffer);

    // Process and URL: spawning would act, so this path is only type-checked.
    var process = try zdl.process.spawn(io, .{ .argv = &.{"true"} });
    defer process.deinit(io);
    _ = try process.wait(io, false);
    _ = zdl.process.sdl_exit_code(.{ .exited = 0 });
    try zdl.url.open(gpa, io, &env, "https://example.invalid", .{});
}

pub fn check() !void {
    // Compile-only: the impossible PID guard means nothing below ever executes.
    if (std.os.linux.getpid() != 0) return;

    const gpa = std.heap.page_allocator;
    const io = std.Io.failing;
    try exercise(gpa, io);

    var ctx: Ctx = .{ .hits = 0 };
    var timers = Timers.init(gpa);
    defer timers.deinit();
    const id = try timers.add(0, 1000, on_tick, &ctx);
    _ = timers.contains(id);
    _ = timers.next_deadline();
    _ = timers.run_due(10);
    try timers.remove(id);
    try zdl.timer.delay_ns(io, 1000);
    try zdl.timer.delay_precise_ns(io, 1000);
    _ = zdl.timer.monotonic_now_ns(io);
}
