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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub fn murmur_32_scramble(arg_k: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var k = arg_k;
    _ = &k;
    k *%= 3432918353;
    k = (k << @intCast(@as(Uint32, 15))) | (k >> @intCast(@as(Uint32, 17)));
    k *%= 461845907;
    return k;
}
pub export fn SDL_murmur3_32_REAL(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32 {
    @setEvalBranchQuota(100000);
    var bytes: [*c]const Uint8 = @ptrCast(@alignCast(data));
    _ = &bytes;
    var hash: Uint32 = seed;
    _ = &hash;
    var k: Uint32 = undefined;
    _ = &k;
    if ((@as(usize, @intCast(@intFromPtr(bytes))) & @as(usize, 3)) == @as(usize, 0)) {
        {
            var i: usize = len >> @intCast(@as(usize, 2));
            _ = &i;
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -%= 1;
                break :blk tmp;
            }) != 0) {
                k = @as([*c]const Uint32, @ptrCast(@alignCast(bytes))).*;
                k = k;
                bytes += @sizeOf(Uint32);
                hash ^= murmur_32_scramble(k);
                hash = (hash << @intCast(@as(Uint32, 13))) | (hash >> @intCast(@as(Uint32, 19)));
                hash = (hash *% @as(Uint32, 5)) +% @as(c_uint, 3864292196);
            }
        }
    } else {
        {
            var i: usize = len >> @intCast(@as(usize, 2));
            _ = &i;
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -%= 1;
                break :blk tmp;
            }) != 0) {
                _ = memcpy(@ptrCast(@alignCast(&k)), @ptrCast(@alignCast(bytes)), @sizeOf(Uint32));
                k = k;
                bytes += @sizeOf(Uint32);
                hash ^= murmur_32_scramble(k);
                hash = (hash << @intCast(@as(Uint32, 13))) | (hash >> @intCast(@as(Uint32, 19)));
                hash = (hash *% @as(Uint32, 5)) +% @as(c_uint, 3864292196);
            }
        }
    }
    var left: usize = len & @as(usize, 3);
    _ = &left;
    if (left != 0) {
        k = 0;
        {
            var i: usize = left;
            _ = &i;
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -%= 1;
                break :blk tmp;
            }) != 0) {
                k <<= @intCast(@as(Uint32, 8));
                k |= @bitCast(@as(c_int, @as(c_int, bytes[i])));
            }
        }
        hash ^= murmur_32_scramble(k);
    }
    {
        const ref = &hash;
        ref.* = @truncate(@as(usize, ref.*) ^ len);
    }
    hash ^= hash >> @intCast(@as(Uint32, 16));
    hash *%= 2246822507;
    hash ^= hash >> @intCast(@as(Uint32, 13));
    hash *%= 3266489909;
    hash ^= hash >> @intCast(@as(Uint32, 16));
    return hash;
}

pub const SDL_murmur3_32 = SDL_murmur3_32_REAL;
