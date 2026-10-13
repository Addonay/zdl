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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub fn crc32_for_byte(arg_r: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var r = arg_r;
    _ = &r;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < @as(c_int, 8)) : (i += 1) {
            r = (if ((r & @as(Uint32, 1)) != 0) @as(Uint32, 0) else @as(Uint32, @bitCast(@as(c_int, @truncate(@as(c_long, 3988292384)))))) ^ (r >> @intCast(@as(Uint32, 1)));
        }
    }
    return r ^ @as(Uint32, @bitCast(@as(c_int, @truncate(@as(c_long, 4278190080)))));
}
pub export fn SDL_crc32_REAL(arg_crc: Uint32, data: ?*const anyopaque, len: usize) Uint32 {
    @setEvalBranchQuota(100000);
    var crc = arg_crc;
    _ = &crc;
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < len) : (i +%= 1) {
            crc = crc32_for_byte(@bitCast(@as(c_int, @as(c_int, @as(Uint8, @truncate(crc))) ^ @as(c_int, @as([*c]const Uint8, @ptrCast(@alignCast(data)))[i])))) ^ (crc >> @intCast(@as(Uint32, 8)));
        }
    }
    return crc;
}

pub const SDL_crc32 = SDL_crc32_REAL;
