const std = @import("std");

pub export fn ZDL_Pause() void {
    std.atomic.spinLoopHint();
}

pub export fn ZDL_CompilerBarrier() void {
    asm volatile ("" ::: .{ .memory = true });
}

pub export fn ZDL_CPUID(leaf: c_int, a: *c_int, b: *c_int, c: *c_int, d: *c_int) void {
    var eax: u32 = undefined;
    var ebx: u32 = undefined;
    var ecx: u32 = undefined;
    var edx: u32 = undefined;
    asm volatile ("cpuid"
        : [_] "={eax}" (eax),
          [_] "={ebx}" (ebx),
          [_] "={ecx}" (ecx),
          [_] "={edx}" (edx),
        : [_] "{eax}" (@as(u32, @bitCast(leaf))),
          [_] "{ecx}" (@as(u32, 0)),
    );
    a.* = @bitCast(eax);
    b.* = @bitCast(ebx);
    c.* = @bitCast(ecx);
    d.* = @bitCast(edx);
}

pub export fn ZDL_XGetBV(index: c_uint) c_int {
    const result = asm volatile ("xgetbv"
        : [_] "={eax}" (-> u32),
        : [_] "{ecx}" (index),
        : .{ .edx = true });
    return @bitCast(result);
}
