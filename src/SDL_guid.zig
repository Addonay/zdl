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
pub const Guid = @import("guid").Guid;
pub const SDL_GUID = Guid;

pub export fn SDL_GUIDToString_REAL(guid: Guid, output: ?[*]u8, capacity: c_int) void {
    const destination = output orelse return;
    if (capacity <= 0) return;
    const count = @min(@as(usize, @intCast(capacity - 1)) / 2, guid.data.len) * 2;
    const formatted = guid.format();
    @memcpy(destination[0..count], formatted[0..count]);
    destination[count] = 0;
}

pub export fn SDL_StringToGUID_REAL(text: [*:0]const u8) Guid {
    return Guid.parse(std.mem.span(text));
}

pub const SDL_GUIDToString = SDL_GUIDToString_REAL;
pub const SDL_StringToGUID = SDL_StringToGUID_REAL;
