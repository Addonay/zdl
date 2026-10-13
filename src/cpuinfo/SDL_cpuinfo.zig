// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
// 
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
// 
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
// 
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __off_t = c_long;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn fscanf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const _SC_PAGESIZE: c_int = 30;
pub const _SC_NPROCESSORS_ONLN: c_int = 84;
pub const _SC_PHYS_PAGES: c_int = 85;
pub const _SC_LEVEL1_DCACHE_LINESIZE: c_int = 190;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn getpagesize() c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub fn CPU_haveCPUID() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 1;
}
pub extern fn ZDL_CPUID(c_int, [*c]c_int, [*c]c_int, [*c]c_int, [*c]c_int) void;
pub extern fn ZDL_XGetBV(c_uint) c_int;
pub var CPU_CPUIDFeatures: [4]c_int = @import("std").mem.zeroes([4]c_int);
pub var CPU_CPUIDMaxFunction: c_int = 0;
pub var CPU_OSSavesYMM: bool = @"false" != 0;
pub var CPU_OSSavesZMM: bool = @"false" != 0;
pub fn CPU_calcCPUIDFeatures() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local_checked = struct {
        var checked: bool = @"false" != 0;
    };
    _ = &static_local_checked;
    if (!static_local_checked.checked) {
        static_local_checked.checked = @"true" != 0;
        if (CPU_haveCPUID() != 0) {
            var a: c_int = undefined;
            _ = &a;
            var b: c_int = undefined;
            _ = &b;
            var c: c_int = undefined;
            _ = &c;
            var d: c_int = undefined;
            _ = &d;
            ZDL_CPUID(@as(c_int, 0), &a, &b, &c, &d);
            CPU_CPUIDMaxFunction = a;
            if (CPU_CPUIDMaxFunction >= @as(c_int, 1)) {
                ZDL_CPUID(@as(c_int, 1), &a, &b, &c, &d);
                CPU_CPUIDFeatures[@as(c_int, 0)] = a;
                CPU_CPUIDFeatures[@as(c_int, 1)] = b;
                CPU_CPUIDFeatures[@as(c_int, 2)] = c;
                CPU_CPUIDFeatures[@as(c_int, 3)] = d;
                if ((c & @as(c_int, 134217728)) != 0) {
                    a = ZDL_XGetBV(0);
                    CPU_OSSavesYMM = (if ((a & @as(c_int, 6)) == @as(c_int, 6)) @"true" else @"false") != 0;
                    CPU_OSSavesZMM = (if (CPU_OSSavesYMM and ((a & @as(c_int, 224)) == @as(c_int, 224))) @"true" else @"false") != 0;
                }
            }
        }
    }
}
pub fn CPU_haveAltiVec() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var altivec: c_int = 0;
    _ = &altivec;
    return altivec;
}
pub fn CPU_haveARMSIMD() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn CPU_haveNEON() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn CPU_haveSVE2() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn CPU_readCPUCFG() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var cfg2: u32 = 0;
    _ = &cfg2;
    return @bitCast(@as(c_uint, @truncate(cfg2)));
}
pub fn CPU_haveAVX2() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (CPU_OSSavesYMM and (CPU_CPUIDMaxFunction >= @as(c_int, 7))) {
        var a: c_int = undefined;
        _ = &a;
        var b: c_int = undefined;
        _ = &b;
        var c: c_int = undefined;
        _ = &c;
        var d: c_int = undefined;
        _ = &d;
        _ = &a;
        _ = &b;
        _ = &c;
        _ = &d;
        ZDL_CPUID(@as(c_int, 7), &a, &b, &c, &d);
        return b & @as(c_int, 32);
    }
    return 0;
}
pub fn CPU_haveAVX512F() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (CPU_OSSavesZMM and (CPU_CPUIDMaxFunction >= @as(c_int, 7))) {
        var a: c_int = undefined;
        _ = &a;
        var b: c_int = undefined;
        _ = &b;
        var c: c_int = undefined;
        _ = &c;
        var d: c_int = undefined;
        _ = &d;
        _ = &a;
        _ = &b;
        _ = &c;
        _ = &d;
        ZDL_CPUID(@as(c_int, 7), &a, &b, &c, &d);
        return b & @as(c_int, 65536);
    }
    return 0;
}
pub var SDL_NumLogicalCPUCores: c_int = 0;
pub export fn SDL_GetNumLogicalCPUCores_REAL() c_int {
    @setEvalBranchQuota(100000);
    if (!(SDL_NumLogicalCPUCores != 0)) {
        if (SDL_NumLogicalCPUCores <= @as(c_int, 0)) {
            SDL_NumLogicalCPUCores = @truncate(sysconf(_SC_NPROCESSORS_ONLN));
        }
        if (SDL_NumLogicalCPUCores <= @as(c_int, 0)) {
            SDL_NumLogicalCPUCores = 1;
        }
    }
    return SDL_NumLogicalCPUCores;
}
pub fn SDL_GetCPUType() callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local_SDL_CPUType = struct {
        var SDL_CPUType: [13]u8 = @import("std").mem.zeroes([13]u8);
    };
    _ = &static_local_SDL_CPUType;
    if (!(@as(c_int, static_local_SDL_CPUType.SDL_CPUType[@as(c_int, 0)]) != 0)) {
        var i: c_int = 0;
        _ = &i;
        CPU_calcCPUIDFeatures();
        if (CPU_CPUIDMaxFunction > @as(c_int, 0)) {
            var a: c_int = undefined;
            _ = &a;
            var b: c_int = undefined;
            _ = &b;
            var c: c_int = undefined;
            _ = &c;
            var d: c_int = undefined;
            _ = &d;
            ZDL_CPUID(@as(c_int, 0), &a, &b, &c, &d);
            _ = &a;
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(b & @as(c_int, 255))));
            b >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(b & @as(c_int, 255))));
            b >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(b & @as(c_int, 255))));
            b >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(b & @as(c_int, 255))));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(d & @as(c_int, 255))));
            d >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(d & @as(c_int, 255))));
            d >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(d & @as(c_int, 255))));
            d >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(d & @as(c_int, 255))));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(c & @as(c_int, 255))));
            c >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(c & @as(c_int, 255))));
            c >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(c & @as(c_int, 255))));
            c >>= @intCast(@as(c_int, 8));
            static_local_SDL_CPUType.SDL_CPUType[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(c & @as(c_int, 255))));
        }
        if (!(@as(c_int, static_local_SDL_CPUType.SDL_CPUType[@as(c_int, 0)]) != 0)) {
            _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&static_local_SDL_CPUType.SDL_CPUType)), "Unknown", @sizeOf(@TypeOf(static_local_SDL_CPUType.SDL_CPUType)));
        }
    }
    return @ptrCast(@alignCast(&static_local_SDL_CPUType.SDL_CPUType));
}
pub export fn SDL_GetCPUCacheLineSize_REAL() c_int {
    @setEvalBranchQuota(100000);
    var cpuType: [*c]const u8 = SDL_GetCPUType();
    _ = &cpuType;
    var cacheline_size: c_int = SDL_CACHELINE_SIZE;
    _ = &cacheline_size;
    var a: c_int = undefined;
    _ = &a;
    var b: c_int = undefined;
    _ = &b;
    var c: c_int = undefined;
    _ = &c;
    var d: c_int = undefined;
    _ = &d;
    _ = &a;
    _ = &b;
    _ = &c;
    _ = &d;
    if (((SDL_strcmp_REAL(cpuType, "GenuineIntel") == @as(c_int, 0)) or (SDL_strcmp_REAL(cpuType, "CentaurHauls") == @as(c_int, 0))) or (SDL_strcmp_REAL(cpuType, "  Shanghai  ") == @as(c_int, 0))) {
        ZDL_CPUID(@as(c_int, 1), &a, &b, &c, &d);
        cacheline_size = ((b >> @intCast(@as(c_int, 8))) & @as(c_int, 255)) * @as(c_int, 8);
    } else if ((SDL_strcmp_REAL(cpuType, "AuthenticAMD") == @as(c_int, 0)) or (SDL_strcmp_REAL(cpuType, "HygonGenuine") == @as(c_int, 0))) {
        ZDL_CPUID(@bitCast(@as(c_uint, @truncate(@as(c_uint, 2147483653)))), &a, &b, &c, &d);
        cacheline_size = c & @as(c_int, 255);
    } else {
        if ((blk: {
            const tmp = @as(c_int, @truncate(sysconf(_SC_LEVEL1_DCACHE_LINESIZE)));
            cacheline_size = tmp;
            break :blk tmp;
        }) > @as(c_int, 0)) {
            return cacheline_size;
        } else {
            cacheline_size = SDL_CACHELINE_SIZE;
        }
        {
            var f: ?*FILE = fopen("/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size", "r");
            _ = &f;
            if (f != null) {
                var size: c_int = undefined;
                _ = &size;
                if (fscanf(f, "%d", &size) == @as(c_int, 1)) {
                    cacheline_size = size;
                }
                _ = fclose(f);
            }
        }
    }
    return cacheline_size;
}
pub var SDL_CPUFeatures: Uint32 = SDL_CPUFEATURES_RESET_VALUE;
pub var SDL_SIMDAlignment: Uint32 = 4294967295;
pub fn ref_string_equals(ref: [*c]const u8, arg_test: [*c]const u8, end_test: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"test" = arg_test;
    _ = &@"test";
    var len_test: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(end_test) -% @intFromPtr(@"test"))), @sizeOf(u8))));
    _ = &len_test;
    return ((SDL_strncmp_REAL(ref, @"test", len_test) == @as(c_int, 0)) and (@as(c_int, ref[len_test]) == @as(c_int, '\x00'))) and ((@as(c_int, @"test"[len_test]) == @as(c_int, '\x00')) or (@as(c_int, @"test"[len_test]) == @as(c_int, ',')));
}
pub fn SDL_CPUFeatureMaskFromHint() callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var result_mask: Uint32 = SDL_CPUFEATURES_RESET_VALUE;
    _ = &result_mask;
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_CPU_FEATURE_MASK");
    _ = &hint;
    if (hint != null) {
        {
            var spot: [*c]const u8 = hint;
            _ = &spot;
            var next: [*c]const u8 = undefined;
            _ = &next;
            while (@as(c_int, spot.*) != 0) : (spot = next) {
                var end: [*c]const u8 = SDL_strchr_REAL(spot, ',');
                _ = &end;
                var spot_mask: Uint32 = undefined;
                _ = &spot_mask;
                var add_spot_mask: bool = @"true" != 0;
                _ = &add_spot_mask;
                if (end != null) {
                    next = end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                } else {
                    var len: usize = SDL_strlen_REAL(spot);
                    _ = &len;
                    end = spot + len;
                    next = end;
                }
                if (@as(c_int, spot[@as(c_int, 0)]) == @as(c_int, '+')) {
                    add_spot_mask = @"true" != 0;
                    spot += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                } else if (@as(c_int, spot[@as(c_int, 0)]) == @as(c_int, '-')) {
                    add_spot_mask = @"false" != 0;
                    spot += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                }
                if (ref_string_equals("all", spot, end)) {
                    spot_mask = SDL_CPUFEATURES_RESET_VALUE;
                } else if (ref_string_equals("altivec", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0))));
                } else if (ref_string_equals("mmx", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))));
                } else if (ref_string_equals("sse", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2))));
                } else if (ref_string_equals("sse2", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3))));
                } else if (ref_string_equals("sse3", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 4))));
                } else if (ref_string_equals("sse41", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 5))));
                } else if (ref_string_equals("sse42", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 6))));
                } else if (ref_string_equals("avx", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 7))));
                } else if (ref_string_equals("avx2", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 8))));
                } else if (ref_string_equals("avx512f", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 10))));
                } else if (ref_string_equals("arm-simd", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 11))));
                } else if (ref_string_equals("neon", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 9))));
                } else if (ref_string_equals("lsx", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 12))));
                } else if (ref_string_equals("lasx", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 13))));
                } else if (ref_string_equals("sve2", spot, end)) {
                    spot_mask = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 14))));
                } else {
                    continue;
                }
                if (add_spot_mask) {
                    result_mask |= spot_mask;
                } else {
                    result_mask &= ~spot_mask;
                }
            }
        }
    }
    return result_mask;
}
pub fn SDL_GetCPUFeatures() callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    if (SDL_CPUFeatures == SDL_CPUFEATURES_RESET_VALUE) {
        CPU_calcCPUIDFeatures();
        SDL_CPUFeatures = 0;
        SDL_SIMDAlignment = @truncate(@sizeOf(?*anyopaque));
        if (CPU_haveAltiVec() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 3)] & @as(c_int, 8388608)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 8))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 3)] & @as(c_int, 33554432)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 3)] & @as(c_int, 67108864)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 2)] & @as(c_int, 1)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 4))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 2)] & @as(c_int, 524288)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 5))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_CPUIDFeatures[@as(c_int, 2)] & @as(c_int, 1048576)) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 6))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if (CPU_OSSavesYMM and ((CPU_CPUIDFeatures[@as(c_int, 2)] & @as(c_int, 268435456)) != 0)) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 7))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))));
        }
        if (CPU_haveAVX2() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 8))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))));
        }
        if (CPU_haveAVX512F() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 10))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 64))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 64))));
        }
        if (CPU_haveARMSIMD() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 11))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if (CPU_haveNEON() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 9))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_readCPUCFG() & (@as(c_int, 1) << @intCast(@as(c_int, 6)))) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 12))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        if ((CPU_readCPUCFG() & (@as(c_int, 1) << @intCast(@as(c_int, 7)))) != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 13))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 32))));
        }
        if (CPU_haveSVE2() != 0) {
            SDL_CPUFeatures |= @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 14))));
            SDL_SIMDAlignment = if (SDL_SIMDAlignment > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))))) SDL_SIMDAlignment else @as(Uint32, @bitCast(@as(c_int, @as(c_int, 16))));
        }
        SDL_CPUFeatures &= SDL_CPUFeatureMaskFromHint();
    }
    return SDL_CPUFeatures;
}
pub export fn SDL_QuitCPUInfo() void {
    @setEvalBranchQuota(100000);
    SDL_CPUFeatures = SDL_CPUFEATURES_RESET_VALUE;
}
pub export fn SDL_HasAltiVec_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasMMX_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSSE_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 2)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSSE2_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSSE3_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 4)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSSE41_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 5)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSSE42_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 6)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasAVX_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 7)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasAVX2_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 8)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasAVX512F_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 10)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasARMSIMD_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 11)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasNEON_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 9)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasLSX_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 12)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasLASX_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 13)))))) != 0) @"true" else @"false") != 0;
}
pub export fn SDL_HasSVE2_REAL() bool {
    @setEvalBranchQuota(100000);
    return (if ((SDL_GetCPUFeatures() & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 14)))))) != 0) @"true" else @"false") != 0;
}
pub var SDL_SystemRAM: c_int = 0;
pub export fn SDL_GetSystemRAM_REAL() c_int {
    @setEvalBranchQuota(100000);
    if (!(SDL_SystemRAM != 0)) {
        if (SDL_SystemRAM <= @as(c_int, 0)) {
            SDL_SystemRAM = @truncate(@divTrunc(sysconf(_SC_PHYS_PAGES) * sysconf(_SC_PAGESIZE), @as(Sint64, @as(c_int, 1024) * @as(c_int, 1024))));
        }
    }
    return SDL_SystemRAM;
}
pub var SDL_SystemPageSize: c_int = -@as(c_int, 1);
pub export fn SDL_GetSystemPageSize_REAL() c_int {
    @setEvalBranchQuota(100000);
    if (SDL_SystemPageSize == -@as(c_int, 1)) {
        if (SDL_SystemPageSize <= @as(c_int, 0)) {
            SDL_SystemPageSize = @truncate(sysconf(_SC_PAGESIZE));
        }
        if (SDL_SystemPageSize <= @as(c_int, 0)) {
            SDL_SystemPageSize = getpagesize();
        }
        if (SDL_SystemPageSize < @as(c_int, 0)) {
            SDL_SystemPageSize = 0;
        }
    }
    return SDL_SystemPageSize;
}
pub export fn SDL_GetSIMDAlignment_REAL() usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_GetSIMDAlignment_REAL".*;
    };
    _ = &static_local___func__;
    if (SDL_SIMDAlignment == @as(c_uint, 4294967295)) {
        _ = SDL_GetCPUFeatures();
    }
    while (true) {
        while (!(SDL_SIMDAlignment != @as(Uint32, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_SIMDAlignment != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_cpuinfo.c", 1213);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    return SDL_SIMDAlignment;
}

pub const SDL_GetCPUCacheLineSize = SDL_GetCPUCacheLineSize_REAL;
pub const SDL_GetNumLogicalCPUCores = SDL_GetNumLogicalCPUCores_REAL;
pub const SDL_GetSIMDAlignment = SDL_GetSIMDAlignment_REAL;
pub const SDL_GetSystemRAM = SDL_GetSystemRAM_REAL;
pub const SDL_HasARMSIMD = SDL_HasARMSIMD_REAL;
pub const SDL_HasAVX = SDL_HasAVX_REAL;
pub const SDL_HasAVX2 = SDL_HasAVX2_REAL;
pub const SDL_HasAVX512F = SDL_HasAVX512F_REAL;
pub const SDL_HasLASX = SDL_HasLASX_REAL;
pub const SDL_HasLSX = SDL_HasLSX_REAL;
pub const SDL_HasMMX = SDL_HasMMX_REAL;
pub const SDL_HasNEON = SDL_HasNEON_REAL;
pub const SDL_HasSSE = SDL_HasSSE_REAL;
pub const SDL_HasSSE2 = SDL_HasSSE2_REAL;
pub const SDL_HasSSE3 = SDL_HasSSE3_REAL;
pub const SDL_HasSSE41 = SDL_HasSSE41_REAL;
pub const SDL_HasSSE42 = SDL_HasSSE42_REAL;
pub const SDL_GetSystemPageSize = SDL_GetSystemPageSize_REAL;
pub const SDL_HasSVE2 = SDL_HasSVE2_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_CACHELINE_SIZE = @as(c_int, 128);
pub const HWCAP_SVE = @as(c_int, 1) << @as(c_int, 22);
pub const SDL_CPUFEATURES_RESET_VALUE = __helpers.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
