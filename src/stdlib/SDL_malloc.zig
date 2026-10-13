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
pub extern fn malloc(__size: usize) ?*anyopaque;
pub extern fn calloc(__nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: usize) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub const SDL_malloc_func = ?*const fn (size: usize) callconv(.c) ?*anyopaque;
pub const SDL_calloc_func = ?*const fn (nmemb: usize, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_realloc_func = ?*const fn (mem: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const SDL_free_func = ?*const fn (mem: ?*anyopaque) callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub fn real_malloc(s: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return malloc(s);
}
pub fn real_calloc(n: usize, s: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return calloc(n, s);
}
pub fn real_realloc(p: ?*anyopaque, s: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return realloc(p, s);
}
pub fn real_free(p: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    free(p);
}
const struct_unnamed_14 = extern struct {
    malloc_func: SDL_malloc_func = null,
    calloc_func: SDL_calloc_func = null,
    realloc_func: SDL_realloc_func = null,
    free_func: SDL_free_func = null,
    num_allocations: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
};
pub var s_mem: struct_unnamed_14 = struct_unnamed_14{
    .malloc_func = real_malloc,
    .calloc_func = real_calloc,
    .realloc_func = real_realloc,
    .free_func = real_free,
    .num_allocations = SDL_AtomicInt{
        .value = 0,
    },
};
pub export fn SDL_GetOriginalMemoryFunctions_REAL(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void {
    @setEvalBranchQuota(100000);
    if (malloc_func != null) {
        malloc_func.* = real_malloc;
    }
    if (calloc_func != null) {
        calloc_func.* = real_calloc;
    }
    if (realloc_func != null) {
        realloc_func.* = real_realloc;
    }
    if (free_func != null) {
        free_func.* = real_free;
    }
}
pub export fn SDL_GetMemoryFunctions_REAL(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void {
    @setEvalBranchQuota(100000);
    if (malloc_func != null) {
        malloc_func.* = s_mem.malloc_func;
    }
    if (calloc_func != null) {
        calloc_func.* = s_mem.calloc_func;
    }
    if (realloc_func != null) {
        realloc_func.* = s_mem.realloc_func;
    }
    if (free_func != null) {
        free_func.* = s_mem.free_func;
    }
}
pub export fn SDL_SetMemoryFunctions_REAL(malloc_func: SDL_malloc_func, calloc_func: SDL_calloc_func, realloc_func: SDL_realloc_func, free_func: SDL_free_func) bool {
    @setEvalBranchQuota(100000);
    if (((!(malloc_func != null) and !(calloc_func != null)) and !(realloc_func != null)) and !(free_func != null)) {
        SDL_GetOriginalMemoryFunctions_REAL(&s_mem.malloc_func, &s_mem.calloc_func, &s_mem.realloc_func, &s_mem.free_func);
    } else if (((!(malloc_func != null) or !(calloc_func != null)) or !(realloc_func != null)) or !(free_func != null)) {
        return @"false" != 0;
    } else {
        s_mem.malloc_func = malloc_func;
        s_mem.calloc_func = calloc_func;
        s_mem.realloc_func = realloc_func;
        s_mem.free_func = free_func;
    }
    return @"true" != 0;
}
pub export fn SDL_GetNumAllocations_REAL() c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub export fn SDL_malloc_REAL(arg_size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var mem: ?*anyopaque = undefined;
    _ = &mem;
    if (!(size != 0)) {
        size = 1;
    }
    mem = s_mem.malloc_func.?(size);
    if (mem != null) {} else {
        _ = SDL_OutOfMemory_REAL();
    }
    return mem;
}
pub export fn SDL_calloc_REAL(arg_nmemb: usize, arg_size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var nmemb = arg_nmemb;
    _ = &nmemb;
    var size = arg_size;
    _ = &size;
    var mem: ?*anyopaque = undefined;
    _ = &mem;
    if (!(nmemb != 0) or !(size != 0)) {
        nmemb = 1;
        size = 1;
    }
    mem = s_mem.calloc_func.?(nmemb, size);
    if (mem != null) {} else {
        _ = SDL_OutOfMemory_REAL();
    }
    return mem;
}
pub export fn SDL_realloc_REAL(ptr: ?*anyopaque, arg_size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var mem: ?*anyopaque = undefined;
    _ = &mem;
    if (!(size != 0)) {
        size = 1;
    }
    mem = s_mem.realloc_func.?(ptr, size);
    if ((mem != null) and !(ptr != null)) {} else if (!(mem != null)) {
        _ = SDL_OutOfMemory_REAL();
    }
    return mem;
}
pub export fn SDL_free_REAL(ptr: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (!(ptr != null)) {
        return;
    }
    s_mem.free_func.?(ptr);
}

pub const SDL_AddAtomicInt = SDL_AddAtomicInt_REAL;
pub const SDL_GetMemoryFunctions = SDL_GetMemoryFunctions_REAL;
pub const SDL_GetNumAllocations = SDL_GetNumAllocations_REAL;
pub const SDL_SetMemoryFunctions = SDL_SetMemoryFunctions_REAL;
pub const SDL_calloc = SDL_calloc_REAL;
pub const SDL_free = SDL_free_REAL;
pub const SDL_malloc = SDL_malloc_REAL;
pub const SDL_realloc = SDL_realloc_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub inline fn SDL_AtomicIncRef(a: anytype) @TypeOf(SDL_AddAtomicInt(a, @as(c_int, 1))) {
    @setEvalBranchQuota(100000);
    _ = &a;
    return SDL_AddAtomicInt(a, @as(c_int, 1));
}
