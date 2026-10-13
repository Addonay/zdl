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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn dlopen(__file: [*c]const u8, __mode: c_int) ?*anyopaque;
pub extern fn dlclose(__handle: ?*anyopaque) c_int;
pub extern fn dlsym(noalias __handle: ?*anyopaque, noalias __name: [*c]const u8) ?*anyopaque;
pub extern fn dlerror() [*c]u8;
pub export fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject {
    @setEvalBranchQuota(100000);
    var handle: ?*anyopaque = undefined;
    _ = &handle;
    var loaderror: [*c]const u8 = undefined;
    _ = &loaderror;
    handle = dlopen(sofile, RTLD_NOW | RTLD_LOCAL);
    loaderror = dlerror();
    if (!(handle != null)) {
        _ = SDL_SetError_REAL("Failed loading %s: %s", sofile, loaderror);
    }
    return @ptrCast(@alignCast(handle));
}
pub export fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    var symbol: ?*anyopaque = dlsym(@ptrCast(@alignCast(handle)), name);
    _ = &symbol;
    if (!(symbol != null)) {
        var isstack: bool = undefined;
        _ = &isstack;
        var len: usize = SDL_strlen_REAL(name) +% @as(usize, 1);
        _ = &len;
        var _name: [*c]u8 = blk: {
            (&isstack).* = (@sizeOf(u8) *% (len +% @as(usize, 1))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&isstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% (len +% @as(usize, 1)))))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% (len +% @as(usize, 1))))));
        };
        _ = &_name;
        _name[@as(c_int, 0)] = '_';
        _ = memcpy(@ptrCast(@alignCast(&_name[@as(c_int, 1)])), @ptrCast(@alignCast(name)), len);
        symbol = dlsym(@ptrCast(@alignCast(handle)), _name);
        if (isstack) {
            SDL_free_REAL(@ptrCast(@alignCast(_name)));
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(_name)));
        }
        if (!(symbol != null)) {
            _ = SDL_SetError_REAL("Failed loading %s: %s", name, @as([*c]const u8, @ptrCast(@alignCast(dlerror()))));
        }
    }
    return @ptrCast(@alignCast(symbol));
}
pub export fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void {
    @setEvalBranchQuota(100000);
    if (handle != null) {
        _ = dlclose(@ptrCast(@alignCast(handle)));
    }
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_LoadFunction = SDL_LoadFunction_REAL;
pub const SDL_LoadObject = SDL_LoadObject_REAL;
pub const SDL_UnloadObject = SDL_UnloadObject_REAL;
pub const RTLD_NOW = @as(c_int, 0x00002);
pub const RTLD_LOCAL = @as(c_int, 0);
