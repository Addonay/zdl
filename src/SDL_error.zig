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
// Native Zig implementation; SDL ABI adapters follow the implementation.
const std = @import("std");
pub const errors = @import("core/error_state.zig");

pub export fn SDL_SetError_REAL(format: ?[*:0]const u8, ...) bool {
    const text = format orelse return false;
    var args = @cVaStart();
    defer @cVaEnd(&args);
    errors.format(text, &args);
    return false;
}

pub export fn SDL_SetErrorV_REAL(format: ?[*:0]const u8, args: ?*std.lang.VaList) bool {
    errors.format(format orelse return false, args orelse return false);
    return false;
}

pub export fn SDL_GetError_REAL() ?[*:0]const u8 {
    return errors.get();
}
pub export fn SDL_ClearError_REAL() bool {
    errors.clear();
    return true;
}
pub export fn SDL_OutOfMemory_REAL() bool {
    errors.outOfMemory();
    return false;
}

pub const SDL_SetError = SDL_SetError_REAL;
pub const SDL_SetErrorV = SDL_SetErrorV_REAL;
pub const SDL_GetError = SDL_GetError_REAL;
pub const SDL_ClearError = SDL_ClearError_REAL;
pub const SDL_OutOfMemory = SDL_OutOfMemory_REAL;
