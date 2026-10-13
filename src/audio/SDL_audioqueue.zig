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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub const struct_SDL_AudioSpec = extern struct {
    format: SDL_AudioFormat = @import("std").mem.zeroes(SDL_AudioFormat),
    channels: c_int = 0,
    freq: c_int = 0,
};
pub const SDL_AudioSpec = struct_SDL_AudioSpec;
pub const SDL_AudioStreamDataCompleteCallback = ?*const fn (userdata: ?*anyopaque, buf: ?*const anyopaque, buflen: c_int) callconv(.c) void;
pub extern fn SDL_GetSilenceValueForFormat_REAL(format: SDL_AudioFormat) c_int;
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const SDL_ReleaseAudioBufferCallback = SDL_AudioStreamDataCompleteCallback;
pub const struct_SDL_AudioQueue = extern struct {
    head: [*c]SDL_AudioTrack = null,
    tail: [*c]SDL_AudioTrack = null,
    history_buffer: [*c]Uint8 = null,
    history_length: usize = 0,
    history_capacity: usize = 0,
    track_pool: SDL_MemoryPool = @import("std").mem.zeroes(SDL_MemoryPool),
    chunk_pool: SDL_MemoryPool = @import("std").mem.zeroes(SDL_MemoryPool),
};
pub const SDL_AudioQueue = struct_SDL_AudioQueue;
pub const struct_SDL_AudioTrack = extern struct {
    spec: SDL_AudioSpec = @import("std").mem.zeroes(SDL_AudioSpec),
    chmap: [*c]c_int = null,
    flushed: bool = false,
    next: [*c]SDL_AudioTrack = null,
    userdata: ?*anyopaque = null,
    callback: SDL_ReleaseAudioBufferCallback = null,
    data: [*c]Uint8 = null,
    head: usize = 0,
    tail: usize = 0,
    capacity: usize = 0,
    chmap_storage: [8]c_int = @import("std").mem.zeroes([8]c_int),
};
pub const SDL_AudioTrack = struct_SDL_AudioTrack;
pub export fn SDL_CreateAudioQueue(chunk_size: usize) [*c]SDL_AudioQueue {
    @setEvalBranchQuota(100000);
    var queue: [*c]SDL_AudioQueue = undefined;
    queue = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(queue.*)))));
    _ = &queue;
    if (!(queue != null)) {
        return null;
    }
    InitMemoryPool(&queue.*.track_pool, @sizeOf(SDL_AudioTrack), 8);
    InitMemoryPool(&queue.*.chunk_pool, chunk_size, 4);
    if (!ReserveMemoryPoolBlocks(&queue.*.track_pool, 2)) {
        SDL_DestroyAudioQueue(queue);
        return null;
    }
    return queue;
}
pub export fn SDL_DestroyAudioQueue(queue: [*c]SDL_AudioQueue) void {
    @setEvalBranchQuota(100000);
    SDL_ClearAudioQueue(queue);
    DestroyMemoryPool(&queue.*.track_pool);
    DestroyMemoryPool(&queue.*.chunk_pool);
    SDL_aligned_free_REAL(@ptrCast(@alignCast(queue.*.history_buffer)));
    SDL_free_REAL(@ptrCast(@alignCast(queue)));
}
pub export fn SDL_ClearAudioQueue(queue: [*c]SDL_AudioQueue) void {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    queue.*.head = null;
    queue.*.tail = null;
    queue.*.history_length = 0;
    while (track != null) {
        var next: [*c]SDL_AudioTrack = track.*.next;
        _ = &next;
        DestroyAudioTrack(queue, track);
        track = next;
    }
}
pub export fn SDL_FlushAudioQueue(queue: [*c]SDL_AudioQueue) void {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.tail;
    _ = &track;
    if (track != null) {
        FlushAudioTrack(track);
    }
}
pub export fn SDL_PopAudioQueueHead(queue: [*c]SDL_AudioQueue) void {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    while (true) {
        var flushed: bool = track.*.flushed;
        _ = &flushed;
        var next: [*c]SDL_AudioTrack = track.*.next;
        _ = &next;
        DestroyAudioTrack(queue, track);
        track = next;
        if (flushed) {
            break;
        }
    }
    queue.*.head = track;
    queue.*.history_length = 0;
    if (!(track != null)) {
        queue.*.tail = null;
    }
}
pub export fn SDL_WriteToAudioQueue(queue: [*c]SDL_AudioQueue, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int, arg_data: [*c]const Uint8, arg_len: usize) bool {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var len = arg_len;
    _ = &len;
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "SDL_WriteToAudioQueue".*;
    };
    _ = &static_local___func__;
    if (len == @as(usize, 0)) {
        return @"true" != 0;
    }
    var track: [*c]SDL_AudioTrack = queue.*.tail;
    _ = &track;
    if (track != null) {
        if (!SDL_AudioSpecsEqual(&track.*.spec, spec, track.*.chmap, chmap)) {
            FlushAudioTrack(track);
        }
    } else {
        while (true) {
            while (!!(queue.*.head != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!queue->head",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioqueue.c", 334);
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
        track = CreateChunkedAudioTrack(queue, spec, chmap);
        if (!(track != null)) {
            return @"false" != 0;
        }
        queue.*.head = track;
        queue.*.tail = track;
    }
    while (true) {
        const written: usize = WriteToAudioTrack(track, data, len);
        _ = &written;
        data += written;
        len -%= written;
        if (len == @as(usize, 0)) {
            break;
        }
        var new_track: [*c]SDL_AudioTrack = CreateChunkedAudioTrack(queue, spec, chmap);
        _ = &new_track;
        if (!(new_track != null)) {
            return @"false" != 0;
        }
        track.*.next = new_track;
        queue.*.tail = new_track;
        track = new_track;
    }
    return @"true" != 0;
}
pub export fn SDL_CreateAudioTrack(queue: [*c]SDL_AudioQueue, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int, data: [*c]Uint8, len: usize, capacity: usize, callback: SDL_ReleaseAudioBufferCallback, userdata: ?*anyopaque) [*c]SDL_AudioTrack {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "SDL_CreateAudioTrack".*;
    };
    _ = &static_local___func__;
    var track: [*c]SDL_AudioTrack = @ptrCast(@alignCast(AllocMemoryPoolBlock(&queue.*.track_pool)));
    _ = &track;
    if (!(track != null)) {
        return null;
    }
    _ = memset(@ptrCast(@alignCast(track)), 0, @sizeOf(@TypeOf(track.*)));
    if (chmap != null) {
        while (true) {
            while (!((@sizeOf(@TypeOf(track.*.chmap_storage)) / @sizeOf(@TypeOf(track.*.chmap_storage[@as(c_int, 0)]))) >= @as(c_ulong, @bitCast(@as(c_long, spec.*.channels))))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "(sizeof(track->chmap_storage)/sizeof(track->chmap_storage[0])) >= spec->channels",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioqueue.c", 245);
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
        _ = memcpy(@ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(&track.*.chmap_storage))))), @ptrCast(@alignCast(chmap)), @sizeOf(@TypeOf(chmap.*)) *% @as(c_ulong, @bitCast(@as(c_long, spec.*.channels))));
        track.*.chmap = @ptrCast(@alignCast(&track.*.chmap_storage));
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&track.*.spec).*)) == @sizeOf(@TypeOf(spec.*)))) @compileError("static assertion failed \"sizeof (*(&track->spec)) == sizeof (*( spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&track.*.spec)), @ptrCast(@alignCast(spec)), @sizeOf(@TypeOf(spec.*)));
    track.*.userdata = userdata;
    track.*.callback = callback;
    track.*.data = data;
    track.*.head = 0;
    track.*.tail = len;
    track.*.capacity = capacity;
    return track;
}
pub export fn SDL_AddTrackToAudioQueue(queue: [*c]SDL_AudioQueue, track: [*c]SDL_AudioTrack) void {
    @setEvalBranchQuota(100000);
    var tail: [*c]SDL_AudioTrack = queue.*.tail;
    _ = &tail;
    if (tail != null) {
        if (!SDL_AudioSpecsEqual(&tail.*.spec, &track.*.spec, tail.*.chmap, track.*.chmap)) {
            FlushAudioTrack(tail);
        }
        tail.*.next = track;
    } else {
        queue.*.head = track;
    }
    queue.*.tail = track;
}
pub export fn SDL_BeginAudioQueueIter(queue: [*c]SDL_AudioQueue) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(queue.*.head));
}
pub export fn SDL_NextAudioQueueIter(_: [*c]SDL_AudioQueue, inout_iter: [*c]?*anyopaque, out_spec: [*c]SDL_AudioSpec, out_chmap: [*c][*c]c_int, out_flushed: [*c]bool) usize {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_NextAudioQueueIter".*;
    };
    _ = &static_local___func__;
    var iter: [*c]SDL_AudioTrack = @ptrCast(@alignCast(inout_iter.*));
    _ = &iter;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(iter))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "iter != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioqueue.c", 376);
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
    {
        comptime {
            if (!(@sizeOf(@TypeOf(out_spec.*)) == @sizeOf(@TypeOf((&iter.*.spec).*)))) @compileError("static assertion failed \"sizeof (*(out_spec)) == sizeof (*( &iter->spec))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(out_spec)), @ptrCast(@alignCast(&iter.*.spec)), @sizeOf(@TypeOf((&iter.*.spec).*)));
    out_chmap.* = iter.*.chmap;
    var flushed: bool = @"false" != 0;
    _ = &flushed;
    var queued_bytes: usize = 0;
    _ = &queued_bytes;
    while (iter != null) {
        var track: [*c]SDL_AudioTrack = iter;
        _ = &track;
        iter = iter.*.next;
        var avail: usize = track.*.tail -% track.*.head;
        _ = &avail;
        if (avail >= (@as(c_ulong, 18446744073709551615) -% queued_bytes)) {
            queued_bytes = @as(c_ulong, 18446744073709551615);
            flushed = @"false" != 0;
            break;
        }
        queued_bytes +%= avail;
        flushed = track.*.flushed;
        if (flushed) {
            break;
        }
    }
    inout_iter.* = @ptrCast(@alignCast(iter));
    out_flushed.* = flushed;
    return queued_bytes;
}
pub export fn SDL_ReadFromAudioQueue(queue: [*c]SDL_AudioQueue, arg_dst: [*c]Uint8, dst_format: SDL_AudioFormat, dst_channels: c_int, dst_map: [*c]const c_int, past_frames: c_int, present_frames: c_int, future_frames: c_int, arg_scratch: [*c]Uint8, gain: f32) [*c]const Uint8 {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var scratch = arg_scratch;
    _ = &scratch;
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    if (!(track != null)) {
        return null;
    }
    var src_format: SDL_AudioFormat = track.*.spec.format;
    _ = &src_format;
    var src_channels: c_int = track.*.spec.channels;
    _ = &src_channels;
    var src_map: [*c]const c_int = track.*.chmap;
    _ = &src_map;
    var src_frame_size: usize = ((src_format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(src_channels));
    _ = &src_frame_size;
    var dst_frame_size: usize = ((dst_format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(dst_channels));
    _ = &dst_frame_size;
    var src_past_bytes: usize = @as(usize, @bitCast(@as(c_long, past_frames))) *% src_frame_size;
    _ = &src_past_bytes;
    var src_present_bytes: usize = @as(usize, @bitCast(@as(c_long, present_frames))) *% src_frame_size;
    _ = &src_present_bytes;
    var src_future_bytes: usize = @as(usize, @bitCast(@as(c_long, future_frames))) *% src_frame_size;
    _ = &src_future_bytes;
    var dst_past_bytes: usize = @as(usize, @bitCast(@as(c_long, past_frames))) *% dst_frame_size;
    _ = &dst_past_bytes;
    var dst_present_bytes: usize = @as(usize, @bitCast(@as(c_long, present_frames))) *% dst_frame_size;
    _ = &dst_present_bytes;
    var dst_future_bytes: usize = @as(usize, @bitCast(@as(c_long, future_frames))) *% dst_frame_size;
    _ = &dst_future_bytes;
    const convert: bool = ((src_format != dst_format) or (src_channels != dst_channels)) or (gain != @as(f32, 1.0));
    _ = &convert;
    if (convert and !(dst != null)) {
        dst = scratch;
    }
    if ((track.*.head >= src_past_bytes) and ((track.*.tail -% track.*.head) >= (src_present_bytes +% src_future_bytes))) {
        var ptr: [*c]const Uint8 = &track.*.data[track.*.head -% src_past_bytes];
        _ = &ptr;
        track.*.head +%= src_present_bytes;
        if (dst != null) {
            ConvertAudio((past_frames + present_frames) + future_frames, @ptrCast(@alignCast(ptr)), src_format, src_channels, src_map, @ptrCast(@alignCast(dst)), dst_format, dst_channels, dst_map, @ptrCast(@alignCast(scratch)), gain);
            ptr = dst;
        }
        return ptr;
    }
    if (!(dst != null)) {
        dst = scratch;
    } else if (!convert) {
        scratch = dst;
    }
    var ptr: [*c]Uint8 = dst;
    _ = &ptr;
    if (src_past_bytes != 0) {
        ConvertAudio(past_frames, @ptrCast(@alignCast(PeekIntoAudioQueuePast(queue, scratch, src_past_bytes))), src_format, src_channels, src_map, @ptrCast(@alignCast(dst)), dst_format, dst_channels, dst_map, @ptrCast(@alignCast(scratch)), gain);
        dst += dst_past_bytes;
        scratch += dst_past_bytes;
    }
    if (src_present_bytes != 0) {
        ConvertAudio(present_frames, @ptrCast(@alignCast(ReadFromAudioQueue(queue, scratch, src_present_bytes))), src_format, src_channels, src_map, @ptrCast(@alignCast(dst)), dst_format, dst_channels, dst_map, @ptrCast(@alignCast(scratch)), gain);
        dst += dst_present_bytes;
        scratch += dst_present_bytes;
    }
    if (src_future_bytes != 0) {
        ConvertAudio(future_frames, @ptrCast(@alignCast(PeekIntoAudioQueueFuture(queue, scratch, src_future_bytes))), src_format, src_channels, src_map, @ptrCast(@alignCast(dst)), dst_format, dst_channels, dst_map, @ptrCast(@alignCast(scratch)), gain);
        dst += dst_future_bytes;
        scratch += dst_future_bytes;
    }
    return ptr;
}
pub export fn SDL_GetAudioQueueQueued(queue: [*c]SDL_AudioQueue) usize {
    @setEvalBranchQuota(100000);
    var total: usize = 0;
    _ = &total;
    var iter: ?*anyopaque = SDL_BeginAudioQueueIter(queue);
    _ = &iter;
    while (iter != null) {
        var src_spec: SDL_AudioSpec = undefined;
        _ = &src_spec;
        var src_chmap: [*c]c_int = undefined;
        _ = &src_chmap;
        var flushed: bool = undefined;
        _ = &flushed;
        var avail: usize = SDL_NextAudioQueueIter(queue, &iter, &src_spec, &src_chmap, &flushed);
        _ = &avail;
        if (avail >= (@as(c_ulong, 18446744073709551615) -% total)) {
            total = @as(c_ulong, 18446744073709551615);
            break;
        }
        total +%= avail;
    }
    return total;
}
pub export fn SDL_ResetAudioQueueHistory(queue: [*c]SDL_AudioQueue, num_frames: c_int) bool {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    if (!(track != null)) {
        return @"false" != 0;
    }
    var length: usize = @bitCast(@as(c_long, num_frames * @as(c_int, @bitCast(((track.*.spec.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(track.*.spec.channels))))));
    _ = &length;
    var history_buffer: [*c]Uint8 = queue.*.history_buffer;
    _ = &history_buffer;
    if (queue.*.history_capacity < length) {
        history_buffer = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), length)));
        if (!(history_buffer != null)) {
            return @"false" != 0;
        }
        SDL_aligned_free_REAL(@ptrCast(@alignCast(queue.*.history_buffer)));
        queue.*.history_buffer = history_buffer;
        queue.*.history_capacity = length;
    }
    queue.*.history_length = length;
    _ = memset(@ptrCast(@alignCast(history_buffer)), SDL_GetSilenceValueForFormat_REAL(track.*.spec.format), length);
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const struct_SDL_MemoryPool = extern struct {
    free_blocks: ?*anyopaque = null,
    block_size: usize = 0,
    num_free: usize = 0,
    max_free: usize = 0,
};
pub const SDL_MemoryPool = struct_SDL_MemoryPool;
pub extern fn ConvertAudio(num_frames: c_int, src: ?*const anyopaque, src_format: SDL_AudioFormat, src_channels: c_int, src_map: [*c]const c_int, dst: ?*anyopaque, dst_format: SDL_AudioFormat, dst_channels: c_int, dst_map: [*c]const c_int, scratch: ?*anyopaque, gain: f32) void;
pub extern fn SDL_AudioSpecsEqual(a: [*c]const SDL_AudioSpec, b: [*c]const SDL_AudioSpec, channel_map_a: [*c]const c_int, channel_map_b: [*c]const c_int) bool;
pub fn AllocNewMemoryPoolBlock(pool: [*c]const SDL_MemoryPool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_malloc_REAL(pool.*.block_size);
}
pub fn AllocMemoryPoolBlock(pool: [*c]SDL_MemoryPool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (pool.*.num_free == @as(usize, 0)) {
        return AllocNewMemoryPoolBlock(pool);
    }
    var block: ?*anyopaque = pool.*.free_blocks;
    _ = &block;
    pool.*.free_blocks = @as([*c]?*anyopaque, @ptrCast(@alignCast(block))).*;
    pool.*.num_free -%= 1;
    return block;
}
pub fn FreeMemoryPoolBlock(pool: [*c]SDL_MemoryPool, block: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pool.*.num_free < pool.*.max_free) {
        @as([*c]?*anyopaque, @ptrCast(@alignCast(block))).* = pool.*.free_blocks;
        pool.*.free_blocks = block;
        pool.*.num_free +%= 1;
    } else {
        SDL_free_REAL(block);
    }
}
pub fn DestroyMemoryPool(pool: [*c]SDL_MemoryPool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var block: ?*anyopaque = pool.*.free_blocks;
    _ = &block;
    pool.*.free_blocks = null;
    pool.*.num_free = 0;
    while (block != null) {
        var next: ?*anyopaque = @as([*c]?*anyopaque, @ptrCast(@alignCast(block))).*;
        _ = &next;
        SDL_free_REAL(block);
        block = next;
    }
}
pub fn InitMemoryPool(pool: [*c]SDL_MemoryPool, arg_block_size: usize, max_free: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var block_size = arg_block_size;
    _ = &block_size;
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "InitMemoryPool".*;
    };
    _ = &static_local___func__;
    _ = memset(@ptrCast(@alignCast(pool)), 0, @sizeOf(@TypeOf(pool.*)));
    while (true) {
        while (!(block_size >= @sizeOf(?*anyopaque))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "block_size >= sizeof(void *)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audioqueue.c", 118);
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
    pool.*.block_size = block_size;
    pool.*.max_free = max_free;
}
pub fn ReserveMemoryPoolBlocks(pool: [*c]SDL_MemoryPool, arg_num_blocks: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var num_blocks = arg_num_blocks;
    _ = &num_blocks;
    while (num_blocks != 0) : (num_blocks -%= 1) {
        var block: ?*anyopaque = AllocNewMemoryPoolBlock(pool);
        _ = &block;
        if (block == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
        @as([*c]?*anyopaque, @ptrCast(@alignCast(block))).* = pool.*.free_blocks;
        pool.*.free_blocks = block;
        pool.*.num_free +%= 1;
    }
    return @"true" != 0;
}
pub fn DestroyAudioTrack(queue: [*c]SDL_AudioQueue, track: [*c]SDL_AudioTrack) callconv(.c) void {
    @setEvalBranchQuota(100000);
    track.*.callback.?(track.*.userdata, @ptrCast(@alignCast(track.*.data)), @bitCast(@as(c_uint, @truncate(track.*.capacity))));
    FreeMemoryPoolBlock(&queue.*.track_pool, @ptrCast(@alignCast(track)));
}
pub fn FlushAudioTrack(track: [*c]SDL_AudioTrack) callconv(.c) void {
    @setEvalBranchQuota(100000);
    track.*.flushed = @"true" != 0;
}
pub fn FreeChunkedAudioBuffer(userdata: ?*anyopaque, buf: ?*const anyopaque, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var queue: [*c]SDL_AudioQueue = @ptrCast(@alignCast(userdata));
    _ = &queue;
    FreeMemoryPoolBlock(&queue.*.chunk_pool, @ptrCast(@alignCast(@constCast(buf))));
}
pub fn CreateChunkedAudioTrack(queue: [*c]SDL_AudioQueue, spec: [*c]const SDL_AudioSpec, chmap: [*c]const c_int) callconv(.c) [*c]SDL_AudioTrack {
    @setEvalBranchQuota(100000);
    var chunk: [*c]Uint8 = @ptrCast(@alignCast(AllocMemoryPoolBlock(&queue.*.chunk_pool)));
    _ = &chunk;
    if (!(chunk != null)) {
        return null;
    }
    var capacity: usize = queue.*.chunk_pool.block_size;
    _ = &capacity;
    capacity -%= capacity % @as(usize, ((spec.*.format & @as(c_uint, 255)) / @as(SDL_AudioFormat, 8)) *% @as(SDL_AudioFormat, @bitCast(spec.*.channels)));
    var track: [*c]SDL_AudioTrack = SDL_CreateAudioTrack(queue, spec, chmap, chunk, 0, capacity, FreeChunkedAudioBuffer, @ptrCast(@alignCast(queue)));
    _ = &track;
    if (!(track != null)) {
        FreeMemoryPoolBlock(&queue.*.chunk_pool, @ptrCast(@alignCast(chunk)));
        return null;
    }
    return track;
}
pub fn WriteToAudioTrack(track: [*c]SDL_AudioTrack, data: [*c]const Uint8, arg_len: usize) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var len = arg_len;
    _ = &len;
    if (track.*.flushed or (track.*.tail >= track.*.capacity)) {
        return 0;
    }
    len = if (len < (track.*.capacity -% track.*.tail)) len else track.*.capacity -% track.*.tail;
    _ = memcpy(@ptrCast(@alignCast(&track.*.data[track.*.tail])), @ptrCast(@alignCast(data)), len);
    track.*.tail +%= len;
    return len;
}
pub fn PeekIntoAudioQueuePast(queue: [*c]SDL_AudioQueue, data: [*c]Uint8, len: usize) callconv(.c) [*c]const Uint8 {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    if (track.*.head >= len) {
        return &track.*.data[track.*.head -% len];
    }
    var past: usize = len -% track.*.head;
    _ = &past;
    if (past > queue.*.history_length) {
        return null;
    }
    _ = memcpy(@ptrCast(@alignCast(data)), @ptrCast(@alignCast(&queue.*.history_buffer[queue.*.history_length -% past])), past);
    _ = memcpy(@ptrCast(@alignCast(&data[past])), @ptrCast(@alignCast(track.*.data)), track.*.head);
    return data;
}
pub fn UpdateAudioQueueHistory(queue: [*c]SDL_AudioQueue, data: [*c]const Uint8, arg_len: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var len = arg_len;
    _ = &len;
    var history_buffer: [*c]Uint8 = queue.*.history_buffer;
    _ = &history_buffer;
    var history_bytes: usize = queue.*.history_length;
    _ = &history_bytes;
    if (len >= history_bytes) {
        _ = memcpy(@ptrCast(@alignCast(history_buffer)), @ptrCast(@alignCast(&data[len -% history_bytes])), history_bytes);
    } else {
        var preserve: usize = history_bytes -% len;
        _ = &preserve;
        _ = memmove(@ptrCast(@alignCast(history_buffer)), @ptrCast(@alignCast(&history_buffer[len])), preserve);
        _ = memcpy(@ptrCast(@alignCast(&history_buffer[preserve])), @ptrCast(@alignCast(data)), len);
    }
}
pub fn ReadFromAudioQueue(queue: [*c]SDL_AudioQueue, data: [*c]Uint8, len: usize) callconv(.c) [*c]const Uint8 {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    if ((track.*.tail -% track.*.head) >= len) {
        var ptr: [*c]const Uint8 = &track.*.data[track.*.head];
        _ = &ptr;
        track.*.head +%= len;
        return ptr;
    }
    var total: usize = 0;
    _ = &total;
    while (true) {
        var avail: usize = if ((len -% total) < (track.*.tail -% track.*.head)) len -% total else track.*.tail -% track.*.head;
        _ = &avail;
        _ = memcpy(@ptrCast(@alignCast(&data[total])), @ptrCast(@alignCast(&track.*.data[track.*.head])), avail);
        track.*.head +%= avail;
        total +%= avail;
        if (total == len) {
            break;
        }
        if (track.*.flushed) {
            _ = SDL_SetError_REAL("Reading past end of flushed track");
            return null;
        }
        var next: [*c]SDL_AudioTrack = track.*.next;
        _ = &next;
        if (!(next != null)) {
            _ = SDL_SetError_REAL("Reading past end of incomplete track");
            return null;
        }
        UpdateAudioQueueHistory(queue, track.*.data, track.*.tail);
        queue.*.head = next;
        DestroyAudioTrack(queue, track);
        track = next;
    }
    return data;
}
pub fn PeekIntoAudioQueueFuture(queue: [*c]SDL_AudioQueue, data: [*c]Uint8, len: usize) callconv(.c) [*c]const Uint8 {
    @setEvalBranchQuota(100000);
    var track: [*c]SDL_AudioTrack = queue.*.head;
    _ = &track;
    if ((track.*.tail -% track.*.head) >= len) {
        return &track.*.data[track.*.head];
    }
    var total: usize = 0;
    _ = &total;
    while (true) {
        var avail: usize = if ((len -% total) < (track.*.tail -% track.*.head)) len -% total else track.*.tail -% track.*.head;
        _ = &avail;
        _ = memcpy(@ptrCast(@alignCast(&data[total])), @ptrCast(@alignCast(&track.*.data[track.*.head])), avail);
        total +%= avail;
        if (total == len) {
            break;
        }
        if (track.*.flushed) {
            _ = memset(@ptrCast(@alignCast(&data[total])), SDL_GetSilenceValueForFormat_REAL(track.*.spec.format), len -% total);
            break;
        }
        track = track.*.next;
        if (!(track != null)) {
            _ = SDL_SetError_REAL("Peeking past end of incomplete track");
            return null;
        }
    }
    return data;
}
