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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const pthread_key_t = c_uint;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn pthread_key_create(__key: [*c]pthread_key_t, __destr_function: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn pthread_key_delete(__key: pthread_key_t) c_int;
pub extern fn pthread_getspecific(__key: pthread_key_t) ?*anyopaque;
pub extern fn pthread_setspecific(__key: pthread_key_t, __pointer: ?*const anyopaque) c_int;
const struct_unnamed_24 = extern struct {
    data: ?*anyopaque = null,
    destructor: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const SDL_TLSData = extern struct {
    limit: c_int = 0,
    _array: [0]struct_unnamed_24 = @import("std").mem.zeroes([0]struct_unnamed_24),
    pub fn array(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._array)).array.child) {
        return @ptrCast(@alignCast(&_self.*._array));
    }
};
pub extern fn SDL_Generic_InitTLSData() void;
pub extern fn SDL_Generic_GetTLSData() [*c]SDL_TLSData;
pub extern fn SDL_Generic_SetTLSData(data: [*c]SDL_TLSData) bool;
pub extern fn SDL_Generic_QuitTLSData() void;
pub var thread_local_storage: pthread_key_t = @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))));
pub var generic_local_storage: bool = @"false" != 0;
pub export fn SDL_SYS_InitTLSData() void {
    @setEvalBranchQuota(100000);
    if ((thread_local_storage == @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))))) and !generic_local_storage) {
        if (pthread_key_create(&thread_local_storage, null) != @as(c_int, 0)) {
            thread_local_storage = @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))));
            SDL_Generic_InitTLSData();
            generic_local_storage = @"true" != 0;
        }
    }
}
pub export fn SDL_SYS_GetTLSData() [*c]SDL_TLSData {
    @setEvalBranchQuota(100000);
    if (generic_local_storage) {
        return SDL_Generic_GetTLSData();
    }
    if (thread_local_storage != @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        return @ptrCast(@alignCast(pthread_getspecific(thread_local_storage)));
    }
    return null;
}
pub export fn SDL_SYS_SetTLSData(data: [*c]SDL_TLSData) bool {
    @setEvalBranchQuota(100000);
    if (generic_local_storage) {
        return SDL_Generic_SetTLSData(data);
    }
    if (pthread_setspecific(thread_local_storage, @ptrCast(@alignCast(data))) != @as(c_int, 0)) {
        return SDL_SetError_REAL("pthread_setspecific() failed");
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_QuitTLSData() void {
    @setEvalBranchQuota(100000);
    if (generic_local_storage) {
        SDL_Generic_QuitTLSData();
        generic_local_storage = @"false" != 0;
    } else {
        if (thread_local_storage != @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))))) {
            _ = pthread_key_delete(thread_local_storage);
            thread_local_storage = @as(pthread_key_t, @bitCast(@as(c_int, -@as(c_int, 1))));
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
