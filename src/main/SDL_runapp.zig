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
pub const SDL_main_func = ?*const fn (argc: c_int, argv: [*c][*c]u8) callconv(.c) c_int;
pub extern fn SDL_CallMainFunction(argc: c_int, argv: [*c][*c]u8, mainFunction: SDL_main_func) c_int;
pub export fn SDL_RunApp_REAL(argc: c_int, argv: [*c][*c]u8, mainFunction: SDL_main_func, arg_reserved: ?*anyopaque) c_int {
    @setEvalBranchQuota(100000);
    var reserved = arg_reserved;
    _ = &reserved;
    _ = &reserved;
    return SDL_CallMainFunction(argc, argv, mainFunction);
}

pub const SDL_RunApp = SDL_RunApp_REAL;
