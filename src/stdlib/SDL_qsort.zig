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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub const SDL_CompareCallback_r = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
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
pub const stack_entry = extern struct {
    first: [*c]u8 = null,
    last: [*c]u8 = null,
};
pub fn pivot_big(first: [*c]u8, mid: [*c]u8, last: [*c]u8, size: usize, compare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var d: usize = ((@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) / size) >> @intCast(@as(usize, 3))) *% size;
    _ = &d;
    var m1: [*c]u8 = undefined;
    _ = &m1;
    var m2: [*c]u8 = undefined;
    _ = &m2;
    var m3: [*c]u8 = undefined;
    _ = &m3;
    {
        var a: [*c]u8 = first;
        _ = &a;
        var b: [*c]u8 = first + d;
        _ = &b;
        var c: [*c]u8 = first + (@as(usize, 2) *% d);
        _ = &c;
        m1 = if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(b))) < @as(c_int, 0)) if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) b else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else a else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) a else if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else b;
    }
    {
        var a: [*c]u8 = mid - d;
        _ = &a;
        var b: [*c]u8 = mid;
        _ = &b;
        var c: [*c]u8 = mid + d;
        _ = &c;
        m2 = if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(b))) < @as(c_int, 0)) if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) b else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else a else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) a else if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else b;
    }
    {
        var a: [*c]u8 = last - (@as(usize, 2) *% d);
        _ = &a;
        var b: [*c]u8 = last - d;
        _ = &b;
        var c: [*c]u8 = last;
        _ = &c;
        m3 = if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(b))) < @as(c_int, 0)) if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) b else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else a else if (compare.?(userdata, @ptrCast(@alignCast(a)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) a else if (compare.?(userdata, @ptrCast(@alignCast(b)), @ptrCast(@alignCast(c))) < @as(c_int, 0)) c else b;
    }
    return if (compare.?(userdata, @ptrCast(@alignCast(m1)), @ptrCast(@alignCast(m2))) < @as(c_int, 0)) if (compare.?(userdata, @ptrCast(@alignCast(m2)), @ptrCast(@alignCast(m3))) < @as(c_int, 0)) m2 else if (compare.?(userdata, @ptrCast(@alignCast(m1)), @ptrCast(@alignCast(m3))) < @as(c_int, 0)) m3 else m1 else if (compare.?(userdata, @ptrCast(@alignCast(m1)), @ptrCast(@alignCast(m3))) < @as(c_int, 0)) m1 else if (compare.?(userdata, @ptrCast(@alignCast(m2)), @ptrCast(@alignCast(m3))) < @as(c_int, 0)) m3 else m2;
}
pub fn qsort_r_nonaligned(base: ?*anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "qsort_r_nonaligned".*;
    };
    _ = &static_local___func__;
    var stack: [64]stack_entry = undefined;
    _ = &stack;
    var stacktop: c_int = 0;
    _ = &stacktop;
    var first: [*c]u8 = undefined;
    _ = &first;
    var last: [*c]u8 = undefined;
    _ = &last;
    var pivot: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(size)));
    _ = &pivot;
    var trunc_1: usize = @as(usize, TRUNC_nonaligned) *% size;
    _ = &trunc_1;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pivot))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pivot != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_qsort.c", 412);
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
    first = @ptrCast(@alignCast(base));
    last = first + ((nmemb -% @as(usize, 1)) *% size);
    if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) >= trunc_1) {
        var ffirst: [*c]u8 = first;
        _ = &ffirst;
        var llast: [*c]u8 = last;
        _ = &llast;
        while (true) {
            {
                var mid: [*c]u8 = first + (size *% ((@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) / size) >> @intCast(@as(usize, 1))));
                _ = &mid;
                if (mid >= last) break;
                if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) > (@as(usize, PIVOT_THRESHOLD) *% size)) {
                    mid = pivot_big(first, mid, last, size, compare, userdata);
                } else {
                    if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) < @as(c_int, 0)) {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            {
                                var aa: [*c]u8 = mid;
                                _ = &aa;
                                var bb: [*c]u8 = last;
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: u8 = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= 1;
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) > @as(c_int, 0)) {
                                var aa: [*c]u8 = first;
                                _ = &aa;
                                var bb: [*c]u8 = mid;
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: u8 = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= 1;
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                        }
                    } else {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            var aa: [*c]u8 = first;
                            _ = &aa;
                            var bb: [*c]u8 = last;
                            _ = &bb;
                            var sz: usize = size;
                            _ = &sz;
                            while (true) {
                                var t: u8 = aa.*;
                                _ = &t;
                                (blk: {
                                    const ref = &aa;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = bb.*;
                                (blk: {
                                    const ref = &bb;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = t;
                                if (!((blk: {
                                    const ref = &sz;
                                    ref.* -%= 1;
                                    break :blk ref.*;
                                }) != 0)) break;
                            }
                        } else {
                            {
                                var aa: [*c]u8 = first;
                                _ = &aa;
                                var bb: [*c]u8 = mid;
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: u8 = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= 1;
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                                var aa: [*c]u8 = mid;
                                _ = &aa;
                                var bb: [*c]u8 = last;
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: u8 = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= 1;
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                        }
                    }
                    first += size;
                    last -= size;
                }
                _ = memcpy(@ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(mid)), size);
            }
            {
                while (true) {
                    while (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(pivot))) < @as(c_int, 0)) {
                        first += size;
                    }
                    while (compare.?(userdata, @ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(last))) < @as(c_int, 0)) {
                        last -= size;
                    }
                    if (first < last) {
                        {
                            var aa: [*c]u8 = first;
                            _ = &aa;
                            var bb: [*c]u8 = last;
                            _ = &bb;
                            var sz: usize = size;
                            _ = &sz;
                            while (true) {
                                var t: u8 = aa.*;
                                _ = &t;
                                (blk: {
                                    const ref = &aa;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = bb.*;
                                (blk: {
                                    const ref = &bb;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = t;
                                if (!((blk: {
                                    const ref = &sz;
                                    ref.* -%= 1;
                                    break :blk ref.*;
                                }) != 0)) break;
                            }
                        }
                        first += size;
                        last -= size;
                    } else if (first == last) {
                        first += size;
                        last -= size;
                        break;
                    }
                    if (!(first <= last)) break;
                }
            }
            {
                var l: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(ffirst))), @sizeOf(u8))));
                _ = &l;
                var r: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(llast) -% @intFromPtr(first))), @sizeOf(u8))));
                _ = &r;
                if (l < trunc_1) {
                    if (r >= trunc_1) {
                        ffirst = first;
                        last = llast;
                        continue;
                    } else {
                        if ((blk: {
                            const ref = &stacktop;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) < @as(c_int, 0)) break;
                        first = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].first;
                            ffirst = tmp;
                            break :blk tmp;
                        };
                        last = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].last;
                            llast = tmp;
                            break :blk tmp;
                        };
                        continue;
                    }
                } else if (l <= r) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = first;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = llast;
                    }
                    {
                        first = ffirst;
                        llast = last;
                        continue;
                    }
                } else if (r >= trunc_1) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = ffirst;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = last;
                    }
                    {
                        ffirst = first;
                        last = llast;
                        continue;
                    }
                } else {
                    first = ffirst;
                    llast = last;
                    continue;
                }
            }
        }
    }
    first = @ptrCast(@alignCast(base));
    last = first + (((if (nmemb > @as(usize, TRUNC_nonaligned)) @as(usize, TRUNC_nonaligned) else nmemb) -% @as(usize, 1)) *% size);
    while (@as(?*anyopaque, @ptrCast(@alignCast(last))) != base) {
        if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
            first = last;
        }
        last -= size;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(first))) != base) {
        var aa: [*c]u8 = first;
        _ = &aa;
        var bb: [*c]u8 = @as([*c]u8, @ptrCast(@alignCast(base)));
        _ = &bb;
        var sz: usize = size;
        _ = &sz;
        while (true) {
            var t: u8 = aa.*;
            _ = &t;
            (blk: {
                const ref = &aa;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = bb.*;
            (blk: {
                const ref = &bb;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = t;
            if (!((blk: {
                const ref = &sz;
                ref.* -%= 1;
                break :blk ref.*;
            }) != 0)) break;
        }
    }
    last = @as([*c]u8, @ptrCast(@alignCast(base))) + (nmemb *% size);
    {
        first = @as([*c]u8, @ptrCast(@alignCast(base))) + size;
        while (first != last) : (first += size) {
            var @"test": [*c]u8 = undefined;
            _ = &@"test";
            {
                @"test" = first - size;
                while ((@"test" >= @as([*c]u8, @ptrCast(@alignCast(base)))) and (compare.?(userdata, @ptrCast(@alignCast(@"test")), @ptrCast(@alignCast(first))) > @as(c_int, 0))) : (@"test" -= size) {}
            }
            @"test" += size;
            if (@"test" != first) {
                _ = memcpy(@ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(first)), size);
                _ = memmove(@ptrCast(@alignCast(@"test" + size)), @ptrCast(@alignCast(@"test")), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(first) -% @intFromPtr(@"test"))), @sizeOf(u8)))));
                _ = memcpy(@ptrCast(@alignCast(@"test")), @ptrCast(@alignCast(pivot)), size);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(pivot)));
}
pub fn qsort_r_aligned(base: ?*anyopaque, nmemb: usize, size: usize, compare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "qsort_r_aligned".*;
    };
    _ = &static_local___func__;
    var stack: [64]stack_entry = undefined;
    _ = &stack;
    var stacktop: c_int = 0;
    _ = &stacktop;
    var first: [*c]u8 = undefined;
    _ = &first;
    var last: [*c]u8 = undefined;
    _ = &last;
    var pivot: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(size)));
    _ = &pivot;
    var trunc_1: usize = @as(usize, TRUNC_aligned) *% size;
    _ = &trunc_1;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pivot))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pivot != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_qsort.c", 444);
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
    first = @ptrCast(@alignCast(base));
    last = first + ((nmemb -% @as(usize, 1)) *% size);
    if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) >= trunc_1) {
        var ffirst: [*c]u8 = first;
        _ = &ffirst;
        var llast: [*c]u8 = last;
        _ = &llast;
        while (true) {
            {
                var mid: [*c]u8 = first + (size *% ((@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) / size) >> @intCast(@as(usize, 1))));
                _ = &mid;
                if (mid >= last) break;
                if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) > (@as(usize, PIVOT_THRESHOLD) *% size)) {
                    mid = pivot_big(first, mid, last, size, compare, userdata);
                } else {
                    if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) < @as(c_int, 0)) {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            {
                                var aa: [*c]c_int = @ptrCast(@alignCast(mid));
                                _ = &aa;
                                var bb: [*c]c_int = @ptrCast(@alignCast(last));
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: c_int = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= @sizeOf(c_int);
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) > @as(c_int, 0)) {
                                var aa: [*c]c_int = @ptrCast(@alignCast(first));
                                _ = &aa;
                                var bb: [*c]c_int = @ptrCast(@alignCast(mid));
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: c_int = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= @sizeOf(c_int);
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                        }
                    } else {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            var aa: [*c]c_int = @ptrCast(@alignCast(first));
                            _ = &aa;
                            var bb: [*c]c_int = @ptrCast(@alignCast(last));
                            _ = &bb;
                            var sz: usize = size;
                            _ = &sz;
                            while (true) {
                                var t: c_int = aa.*;
                                _ = &t;
                                (blk: {
                                    const ref = &aa;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = bb.*;
                                (blk: {
                                    const ref = &bb;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = t;
                                if (!((blk: {
                                    const ref = &sz;
                                    ref.* -%= @sizeOf(c_int);
                                    break :blk ref.*;
                                }) != 0)) break;
                            }
                        } else {
                            {
                                var aa: [*c]c_int = @ptrCast(@alignCast(first));
                                _ = &aa;
                                var bb: [*c]c_int = @ptrCast(@alignCast(mid));
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: c_int = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= @sizeOf(c_int);
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                                var aa: [*c]c_int = @ptrCast(@alignCast(mid));
                                _ = &aa;
                                var bb: [*c]c_int = @ptrCast(@alignCast(last));
                                _ = &bb;
                                var sz: usize = size;
                                _ = &sz;
                                while (true) {
                                    var t: c_int = aa.*;
                                    _ = &t;
                                    (blk: {
                                        const ref = &aa;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = bb.*;
                                    (blk: {
                                        const ref = &bb;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = t;
                                    if (!((blk: {
                                        const ref = &sz;
                                        ref.* -%= @sizeOf(c_int);
                                        break :blk ref.*;
                                    }) != 0)) break;
                                }
                            }
                        }
                    }
                    first += size;
                    last -= size;
                }
                _ = memcpy(@ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(mid)), size);
            }
            {
                while (true) {
                    while (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(pivot))) < @as(c_int, 0)) {
                        first += size;
                    }
                    while (compare.?(userdata, @ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(last))) < @as(c_int, 0)) {
                        last -= size;
                    }
                    if (first < last) {
                        {
                            var aa: [*c]c_int = @ptrCast(@alignCast(first));
                            _ = &aa;
                            var bb: [*c]c_int = @ptrCast(@alignCast(last));
                            _ = &bb;
                            var sz: usize = size;
                            _ = &sz;
                            while (true) {
                                var t: c_int = aa.*;
                                _ = &t;
                                (blk: {
                                    const ref = &aa;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = bb.*;
                                (blk: {
                                    const ref = &bb;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = t;
                                if (!((blk: {
                                    const ref = &sz;
                                    ref.* -%= @sizeOf(c_int);
                                    break :blk ref.*;
                                }) != 0)) break;
                            }
                        }
                        first += size;
                        last -= size;
                    } else if (first == last) {
                        first += size;
                        last -= size;
                        break;
                    }
                    if (!(first <= last)) break;
                }
            }
            {
                var l: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(ffirst))), @sizeOf(u8))));
                _ = &l;
                var r: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(llast) -% @intFromPtr(first))), @sizeOf(u8))));
                _ = &r;
                if (l < trunc_1) {
                    if (r >= trunc_1) {
                        ffirst = first;
                        last = llast;
                        continue;
                    } else {
                        if ((blk: {
                            const ref = &stacktop;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) < @as(c_int, 0)) break;
                        first = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].first;
                            ffirst = tmp;
                            break :blk tmp;
                        };
                        last = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].last;
                            llast = tmp;
                            break :blk tmp;
                        };
                        continue;
                    }
                } else if (l <= r) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = first;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = llast;
                    }
                    {
                        first = ffirst;
                        llast = last;
                        continue;
                    }
                } else if (r >= trunc_1) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = ffirst;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = last;
                    }
                    {
                        ffirst = first;
                        last = llast;
                        continue;
                    }
                } else {
                    first = ffirst;
                    llast = last;
                    continue;
                }
            }
        }
    }
    first = @ptrCast(@alignCast(base));
    last = first + (((if (nmemb > @as(usize, TRUNC_aligned)) @as(usize, TRUNC_aligned) else nmemb) -% @as(usize, 1)) *% size);
    while (@as(?*anyopaque, @ptrCast(@alignCast(last))) != base) {
        if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
            first = last;
        }
        last -= size;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(first))) != base) {
        var aa: [*c]c_int = @ptrCast(@alignCast(first));
        _ = &aa;
        var bb: [*c]c_int = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(base)))));
        _ = &bb;
        var sz: usize = size;
        _ = &sz;
        while (true) {
            var t: c_int = aa.*;
            _ = &t;
            (blk: {
                const ref = &aa;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = bb.*;
            (blk: {
                const ref = &bb;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = t;
            if (!((blk: {
                const ref = &sz;
                ref.* -%= @sizeOf(c_int);
                break :blk ref.*;
            }) != 0)) break;
        }
    }
    last = @as([*c]u8, @ptrCast(@alignCast(base))) + (nmemb *% size);
    {
        first = @as([*c]u8, @ptrCast(@alignCast(base))) + size;
        while (first != last) : (first += size) {
            var @"test": [*c]u8 = undefined;
            _ = &@"test";
            {
                @"test" = first - size;
                while ((@"test" >= @as([*c]u8, @ptrCast(@alignCast(base)))) and (compare.?(userdata, @ptrCast(@alignCast(@"test")), @ptrCast(@alignCast(first))) > @as(c_int, 0))) : (@"test" -= size) {}
            }
            @"test" += size;
            if (@"test" != first) {
                _ = memcpy(@ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(first)), size);
                _ = memmove(@ptrCast(@alignCast(@"test" + size)), @ptrCast(@alignCast(@"test")), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(first) -% @intFromPtr(@"test"))), @sizeOf(u8)))));
                _ = memcpy(@ptrCast(@alignCast(@"test")), @ptrCast(@alignCast(pivot)), size);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(pivot)));
}
pub fn qsort_r_words(base: ?*anyopaque, nmemb: usize, compare: ?*const fn (?*anyopaque, ?*const anyopaque, ?*const anyopaque) callconv(.c) c_int, userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "qsort_r_words".*;
    };
    _ = &static_local___func__;
    var stack: [64]stack_entry = undefined;
    _ = &stack;
    var stacktop: c_int = 0;
    _ = &stacktop;
    var first: [*c]u8 = undefined;
    _ = &first;
    var last: [*c]u8 = undefined;
    _ = &last;
    var pivot: [*c]u8 = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int))));
    _ = &pivot;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pivot))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pivot != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_qsort.c", 475);
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
    first = @ptrCast(@alignCast(base));
    last = first + ((nmemb -% @as(usize, 1)) *% @sizeOf(c_int));
    if (@as(c_ulong, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) >= (@as(c_ulong, 12) *% @sizeOf(c_int))) {
        var ffirst: [*c]u8 = first;
        _ = &ffirst;
        var llast: [*c]u8 = last;
        _ = &llast;
        while (true) {
            {
                var mid: [*c]u8 = first + (@sizeOf(c_int) *% (@as(c_ulong, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) / (@as(c_ulong, 2) *% @sizeOf(c_int))));
                _ = &mid;
                if (mid >= last) break;
                if (@as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(first))), @sizeOf(u8))))) > (@as(c_ulong, PIVOT_THRESHOLD) *% @sizeOf(c_int))) {
                    mid = pivot_big(first, mid, last, @sizeOf(c_int), compare, userdata);
                } else {
                    if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) < @as(c_int, 0)) {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            {
                                var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(mid))).*;
                                _ = &t;
                                @as([*c]c_int, @ptrCast(@alignCast(mid))).* = @as([*c]c_int, @ptrCast(@alignCast(last))).*;
                                @as([*c]c_int, @ptrCast(@alignCast(last))).* = t;
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(mid))) > @as(c_int, 0)) {
                                var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
                                _ = &t;
                                @as([*c]c_int, @ptrCast(@alignCast(first))).* = @as([*c]c_int, @ptrCast(@alignCast(mid))).*;
                                @as([*c]c_int, @ptrCast(@alignCast(mid))).* = t;
                            }
                        }
                    } else {
                        if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                            var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
                            _ = &t;
                            @as([*c]c_int, @ptrCast(@alignCast(first))).* = @as([*c]c_int, @ptrCast(@alignCast(last))).*;
                            @as([*c]c_int, @ptrCast(@alignCast(last))).* = t;
                        } else {
                            {
                                var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
                                _ = &t;
                                @as([*c]c_int, @ptrCast(@alignCast(first))).* = @as([*c]c_int, @ptrCast(@alignCast(mid))).*;
                                @as([*c]c_int, @ptrCast(@alignCast(mid))).* = t;
                            }
                            if (compare.?(userdata, @ptrCast(@alignCast(mid)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
                                var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(mid))).*;
                                _ = &t;
                                @as([*c]c_int, @ptrCast(@alignCast(mid))).* = @as([*c]c_int, @ptrCast(@alignCast(last))).*;
                                @as([*c]c_int, @ptrCast(@alignCast(last))).* = t;
                            }
                        }
                    }
                    first += @sizeOf(c_int);
                    last -= @sizeOf(c_int);
                }
                @as([*c]c_int, @ptrCast(@alignCast(pivot))).* = @as([*c]c_int, @ptrCast(@alignCast(mid))).*;
            }
            {
                while (true) {
                    while (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(pivot))) < @as(c_int, 0)) {
                        first += @sizeOf(c_int);
                    }
                    while (compare.?(userdata, @ptrCast(@alignCast(pivot)), @ptrCast(@alignCast(last))) < @as(c_int, 0)) {
                        last -= @sizeOf(c_int);
                    }
                    if (first < last) {
                        {
                            var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
                            _ = &t;
                            @as([*c]c_int, @ptrCast(@alignCast(first))).* = @as([*c]c_int, @ptrCast(@alignCast(last))).*;
                            @as([*c]c_int, @ptrCast(@alignCast(last))).* = t;
                        }
                        first += @sizeOf(c_int);
                        last -= @sizeOf(c_int);
                    } else if (first == last) {
                        first += @sizeOf(c_int);
                        last -= @sizeOf(c_int);
                        break;
                    }
                    if (!(first <= last)) break;
                }
            }
            {
                var l: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(last) -% @intFromPtr(ffirst))), @sizeOf(u8))));
                _ = &l;
                var r: usize = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(llast) -% @intFromPtr(first))), @sizeOf(u8))));
                _ = &r;
                if (l < (@as(c_ulong, 12) *% @sizeOf(c_int))) {
                    if (r >= (@as(c_ulong, 12) *% @sizeOf(c_int))) {
                        ffirst = first;
                        last = llast;
                        continue;
                    } else {
                        if ((blk: {
                            const ref = &stacktop;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) < @as(c_int, 0)) break;
                        first = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].first;
                            ffirst = tmp;
                            break :blk tmp;
                        };
                        last = blk: {
                            const tmp = stack[@bitCast(@as(isize, @intCast(stacktop)))].last;
                            llast = tmp;
                            break :blk tmp;
                        };
                        continue;
                    }
                } else if (l <= r) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = first;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = llast;
                    }
                    {
                        first = ffirst;
                        llast = last;
                        continue;
                    }
                } else if (r >= (@as(c_ulong, 12) *% @sizeOf(c_int))) {
                    {
                        stack[@bitCast(@as(isize, @intCast(stacktop)))].first = ffirst;
                        stack[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &stacktop;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ].last = last;
                    }
                    {
                        ffirst = first;
                        last = llast;
                        continue;
                    }
                } else {
                    first = ffirst;
                    llast = last;
                    continue;
                }
            }
        }
    }
    first = @ptrCast(@alignCast(base));
    last = first + (((if (nmemb > ((@as(c_ulong, 12) *% @sizeOf(c_int)) / @sizeOf(c_int))) (@as(c_ulong, 12) *% @sizeOf(c_int)) / @sizeOf(c_int) else nmemb) -% @as(c_ulong, 1)) *% @sizeOf(c_int));
    while (@as(?*anyopaque, @ptrCast(@alignCast(last))) != base) {
        if (compare.?(userdata, @ptrCast(@alignCast(first)), @ptrCast(@alignCast(last))) > @as(c_int, 0)) {
            first = last;
        }
        last -= @sizeOf(c_int);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(first))) != base) {
        var t: c_int = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
        _ = &t;
        @as([*c]c_int, @ptrCast(@alignCast(first))).* = @as([*c]c_int, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(base)))))).*;
        @as([*c]c_int, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(base)))))).* = t;
    }
    last = @as([*c]u8, @ptrCast(@alignCast(base))) + (nmemb *% @sizeOf(c_int));
    {
        first = @as([*c]u8, @ptrCast(@alignCast(base))) + @sizeOf(c_int);
        while (first != last) : (first += @sizeOf(c_int)) {
            var pl: [*c]c_int = @ptrCast(@alignCast(first - @sizeOf(c_int)));
            _ = &pl;
            var pr: [*c]c_int = @ptrCast(@alignCast(first));
            _ = &pr;
            @as([*c]c_int, @ptrCast(@alignCast(pivot))).* = @as([*c]c_int, @ptrCast(@alignCast(first))).*;
            while ((pl >= @as([*c]c_int, @ptrCast(@alignCast(base)))) and (compare.?(userdata, @ptrCast(@alignCast(pl)), @ptrCast(@alignCast(pivot))) > @as(c_int, 0))) : ({
                pr = pl;
                pl -= 1;
            }) {
                pr.* = pl.*;
            }
            if (pr != @as([*c]c_int, @ptrCast(@alignCast(first)))) {
                pr.* = @as([*c]c_int, @ptrCast(@alignCast(pivot))).*;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(pivot)));
}
pub export fn SDL_qsort_r_REAL(base: ?*anyopaque, arg_nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var nmemb = arg_nmemb;
    _ = &nmemb;
    if (nmemb <= @as(usize, 1)) return;
    if (((@as(usize, @intCast(@intFromPtr(base))) | size) & (@sizeOf(c_int) -% @as(c_ulong, 1))) != 0) {
        qsort_r_nonaligned(base, nmemb, size, compare, userdata);
    } else if (size != @sizeOf(c_int)) {
        qsort_r_aligned(base, nmemb, size, compare, userdata);
    } else {
        qsort_r_words(base, nmemb, compare, userdata);
    }
}
pub fn qsort_non_r_bridge(userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var compare: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int = @ptrCast(@alignCast(userdata));
    _ = &compare;
    return compare.?(a, b);
}
pub export fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void {
    @setEvalBranchQuota(100000);
    SDL_qsort_r_REAL(base, nmemb, size, qsort_non_r_bridge, @ptrCast(@alignCast(@constCast(compare))));
}
pub export fn SDL_bsearch_r_REAL(key: ?*const anyopaque, arg_base: ?*const anyopaque, arg_nmemb: usize, size: usize, compare: SDL_CompareCallback_r, userdata: ?*anyopaque) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var base = arg_base;
    _ = &base;
    var nmemb = arg_nmemb;
    _ = &nmemb;
    var pivot: ?*const anyopaque = undefined;
    _ = &pivot;
    var corr: usize = undefined;
    _ = &corr;
    var rc: c_int = undefined;
    _ = &rc;
    while (nmemb != 0) {
        corr = nmemb % @as(usize, 2);
        nmemb /= 2;
        pivot = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(base))) + (nmemb *% size)));
        rc = compare.?(userdata, key, pivot);
        if (rc > @as(c_int, 0)) {
            base = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(pivot))) + size));
            nmemb -%= @as(usize, 1) -% corr;
        } else if (rc == @as(c_int, 0)) {
            return @ptrCast(@alignCast(@constCast(pivot)));
        }
    }
    return null;
}
pub export fn SDL_bsearch_REAL(key: ?*const anyopaque, base: ?*const anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_bsearch_r_REAL(key, base, nmemb, size, qsort_non_r_bridge, @ptrCast(@alignCast(@constCast(compare))));
}

pub const SDL_bsearch = SDL_bsearch_REAL;
pub const SDL_qsort = SDL_qsort_REAL;
pub const @"false" = @as(c_int, 0);
pub const TRUNC_nonaligned = @as(c_int, 12);
pub const TRUNC_aligned = @as(c_int, 12);
pub const PIVOT_THRESHOLD = @as(c_int, 40);
