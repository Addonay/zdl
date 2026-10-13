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
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const SDL_ELF_NOTE_DLOPEN = @compileError("unable to translate C expr: unexpected token '__VA_ARGS__'");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_dlopennote.h:212:9
pub const thchar_t = u8;
pub const struct_thcell_t = extern struct {
    base: thchar_t = 0,
    hilo: thchar_t = 0,
    top: thchar_t = 0,
};
pub const SDL_LibThaiMakeCells = ?*const fn (s: [*c]const thchar_t, usize, cells: [*c]struct_thcell_t, [*c]usize, c_int) callconv(.c) usize;
pub const struct_SDL_LibThai = extern struct {
    lib: ?*SDL_SharedObject = null,
    make_cells: SDL_LibThaiMakeCells = null,
};
pub const SDL_LibThai = struct_SDL_LibThai;
pub export fn SDL_LibThai_Create() [*c]SDL_LibThai {
    @setEvalBranchQuota(100000);
    var th: [*c]SDL_LibThai = undefined;
    _ = &th;
    th = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_LibThai))));
    if (!(th != null)) {
        return null;
    }
    th.*.lib = SDL_LoadObject_REAL("libthai.so.0");
    if (!(th.*.lib != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(th)));
        return null;
    }
    th.*.make_cells = @as(SDL_LibThaiMakeCells, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(th.*.lib, "th_make_cells")))));
    if (!(th.*.make_cells != null)) {
        SDL_UnloadObject_REAL(th.*.lib);
        SDL_free_REAL(@ptrCast(@alignCast(th)));
        return null;
    }
    return th;
}
pub export fn SDL_LibThai_Destroy(th: [*c]SDL_LibThai) void {
    @setEvalBranchQuota(100000);
    if (!(th != null)) {
        return;
    }
    SDL_UnloadObject_REAL(th.*.lib);
    SDL_free_REAL(@ptrCast(@alignCast(th)));
}

