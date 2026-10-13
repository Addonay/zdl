const std = @import("std");
const base = std.zig.c_translation.builtins;

pub fn debugtrap() void {
    @breakpoint();
}

pub inline fn va_start(destination: anytype, value: std.lang.VaList) void {
    const pointer: *std.lang.VaList = @ptrCast(@alignCast(destination));
    pointer.* = value;
}

pub inline fn va_copy(destination: anytype, source: anytype) void {
    const from: *std.lang.VaList = @ptrCast(@alignCast(@constCast(source)));
    const to: *std.lang.VaList = @ptrCast(@alignCast(destination));
    to.* = @cVaCopy(from);
}

pub inline fn va_end(source: anytype) void {
    const pointer: *std.lang.VaList = @ptrCast(@alignCast(source));
    @cVaEnd(pointer);
}

pub inline fn va_arg(source: anytype, comptime T: type) T {
    const pointer: *std.lang.VaList = @ptrCast(@alignCast(source));
    return @cVaArg(pointer, T);
}

pub inline fn pshuflw(vector: @Vector(8, i16), comptime mask: c_int) @Vector(8, i16) {
    return @shuffle(i16, vector, vector, @Vector(8, i32){ mask & 3, (mask >> 2) & 3, (mask >> 4) & 3, (mask >> 6) & 3, 4, 5, 6, 7 });
}

pub inline fn pshufhw(vector: @Vector(8, i16), comptime mask: c_int) @Vector(8, i16) {
    return @shuffle(i16, vector, vector, @Vector(8, i32){ 0, 1, 2, 3, 4 + (mask & 3), 4 + ((mask >> 2) & 3), 4 + ((mask >> 4) & 3), 4 + ((mask >> 6) & 3) });
}

pub inline fn pshufd(vector: @Vector(4, i32), comptime mask: c_int) @Vector(4, i32) {
    return @shuffle(i32, vector, vector, @Vector(4, i32){ mask & 3, (mask >> 2) & 3, (mask >> 4) & 3, (mask >> 6) & 3 });
}

pub inline fn shufps(first: @Vector(4, f32), second: @Vector(4, f32), comptime mask: c_int) @Vector(4, f32) {
    return @shuffle(f32, first, second, @Vector(4, i32){ mask & 3, (mask >> 2) & 3, ~((mask >> 4) & 3), ~((mask >> 6) & 3) });
}

pub inline fn byte_shift_left(vector: @Vector(16, u8), comptime shift: c_int) @Vector(16, u8) {
    const amount: u8 = @truncate(@as(u32, @bitCast(shift)));
    const mask = comptime block: {
        var indices: [16]i32 = undefined;
        for (&indices, 0..) |*index, i| index.* = if (i >= amount) @intCast(i - amount) else -1;
        break :block @as(@Vector(16, i32), indices);
    };
    return @shuffle(u8, vector, @as(@Vector(16, u8), @splat(0)), mask);
}

pub inline fn byte_shift_right(vector: @Vector(16, u8), comptime shift: c_int) @Vector(16, u8) {
    const amount: u8 = @truncate(@as(u32, @bitCast(shift)));
    const mask = comptime block: {
        var indices: [16]i32 = undefined;
        for (&indices, 0..) |*index, i| index.* = if (i + amount < 16) @intCast(i + amount) else -1;
        break :block @as(@Vector(16, i32), indices);
    };
    return @shuffle(u8, vector, @as(@Vector(16, u8), @splat(0)), mask);
}

pub inline fn insert_i16(vector: @Vector(8, i16), value: c_int, comptime index: c_int) @Vector(8, i16) {
    var result = vector;
    result[@as(u3, @truncate(@as(u32, @bitCast(index))))] = std.zig.c_translation.helpers.cast(i16, value);
    return result;
}

pub inline fn memmove(destination: anytype, source: anytype, length: usize) @TypeOf(destination) {
    @memmove(@as([*]u8, @ptrCast(destination))[0..length], @as([*]const u8, @ptrCast(source))[0..length]);
    return destination;
}

pub inline fn prefetch(pointer: anytype, rw: c_int, locality: c_int) void {
    @prefetch(pointer, .{
        .rw = if (rw == 0) .read else .write,
        .locality = @intCast(locality),
        .cache = .data,
    });
}

fn Pointee(comptime P: type) type {
    return @typeInfo(P).pointer.child;
}

fn CPointer(comptime P: type) type {
    const info = @typeInfo(P).pointer;
    const constant = if (@hasField(@TypeOf(info), "attrs")) info.attrs.@"const" else info.is_const;
    const alignment = if (@hasField(@TypeOf(info), "attrs")) info.attrs.@"align" orelse @alignOf(info.child) else info.alignment;
    return if (constant) [*c]align(alignment) const info.child else [*c]align(alignment) info.child;
}

pub inline fn as_c_pointer(value: anytype) CPointer(@TypeOf(value)) {
    return @ptrCast(value);
}

pub inline fn sync_cas(pointer: anytype, expected: Pointee(@TypeOf(pointer)), desired: Pointee(@TypeOf(pointer))) bool {
    const T = Pointee(@TypeOf(pointer));
    return @cmpxchgStrong(T, pointer, expected, desired, .seq_cst, .seq_cst) == null;
}

pub inline fn sync_fetch_add(pointer: anytype, value: Pointee(@TypeOf(pointer))) Pointee(@TypeOf(pointer)) {
    return @atomicRmw(Pointee(@TypeOf(pointer)), pointer, .Add, value, .seq_cst);
}

pub inline fn sync_exchange(pointer: anytype, value: Pointee(@TypeOf(pointer))) Pointee(@TypeOf(pointer)) {
    return @atomicRmw(Pointee(@TypeOf(pointer)), pointer, .Xchg, value, .acquire);
}

pub inline fn sync_release(pointer: anytype) void {
    @atomicStore(Pointee(@TypeOf(pointer)), pointer, 0, .release);
}

fn ordering(comptime order: c_int) std.lang.AtomicOrder {
    return switch (order) {
        0 => .monotonic,
        1, 2 => .acquire,
        3 => .release,
        4 => .acq_rel,
        5 => .seq_cst,
        else => @compileError("unknown C atomic ordering"),
    };
}

pub inline fn atomic_exchange(pointer: anytype, value: Pointee(@TypeOf(pointer)), comptime order: c_int) Pointee(@TypeOf(pointer)) {
    return @atomicRmw(Pointee(@TypeOf(pointer)), pointer, .Xchg, value, comptime ordering(order));
}

pub inline fn atomic_load(pointer: anytype, comptime order: c_int) Pointee(@TypeOf(pointer)) {
    return @atomicLoad(Pointee(@TypeOf(pointer)), pointer, comptime ordering(order));
}

pub inline fn atomic_fence(comptime order: c_int) void {
    switch (@import("builtin").cpu.arch) {
        .x86, .x86_64 => {
            if (order == 5) asm volatile ("mfence" ::: .{ .memory = true });
            asm volatile ("" ::: .{ .memory = true });
        },
        .aarch64, .aarch64_be, .arm, .armeb, .thumb, .thumbeb => asm volatile ("dmb ish" ::: .{ .memory = true }),
        else => @compileError("C memory barrier needs an implementation for this architecture"),
    }
}

pub const abs = base.abs;

pub const add_overflow = base.add_overflow;

pub const assume = base.assume;

pub const bswap16 = base.bswap16;

pub const bswap32 = base.bswap32;

pub const bswap64 = base.bswap64;

pub const ceilf = base.ceilf;

pub const ceil = base.ceil;

pub const clz = base.clz;

pub const constant_p = base.constant_p;

pub const cosf = base.cosf;

pub const cos = base.cos;

pub const ctz = base.ctz;

pub const exp2f = base.exp2f;

pub const exp2 = base.exp2;

pub const expf = base.expf;

pub const exp = base.exp;

pub const expect = base.expect;

pub const fabsf = base.fabsf;

pub const fabs = base.fabs;

pub const floorf = base.floorf;

pub const floor = base.floor;

pub const elementwise_clzg = base.elementwise_clzg;

pub const elementwise_ctzg = base.elementwise_ctzg;

pub const elementwise_fshl = base.elementwise_fshl;

pub const elementwise_fshr = base.elementwise_fshr;

pub const has_builtin = base.has_builtin;

pub const huge_valf = base.huge_valf;

pub const inff = base.inff;

pub const isinf_sign = base.isinf_sign;

pub const isinf = base.isinf;

pub const isnan = base.isnan;

pub const labs = base.labs;

pub const llabs = base.llabs;

pub const log10f = base.log10f;

pub const log10 = base.log10;

pub const log2f = base.log2f;

pub const log2 = base.log2;

pub const logf = base.logf;

pub const log = base.log;

pub const memcpy_chk = base.memcpy_chk;

pub const memcpy = base.memcpy;

pub const memset_chk = base.memset_chk;

pub const memset = base.memset;

pub const mul_overflow = base.mul_overflow;

pub const nanf = base.nanf;

pub const object_size = base.object_size;

pub const popcount = base.popcount;

pub const roundf = base.roundf;

pub const round = base.round;

pub const signbitf = base.signbitf;

pub const signbit = base.signbit;

pub const sinf = base.sinf;

pub const sin = base.sin;

pub const sqrtf = base.sqrtf;

pub const sqrt = base.sqrt;

pub const strcmp = base.strcmp;

pub const strlen = base.strlen;

pub const sub_overflow = base.sub_overflow;

pub const truncf = base.truncf;

pub const trunc = base.trunc;
