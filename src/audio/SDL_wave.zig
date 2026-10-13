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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_IOFromConstMem_REAL(mem: ?*const anyopaque, size: usize) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOSize_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_SeekIO_REAL(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_TellIO_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_ReadU8_REAL(src: ?*SDL_IOStream, value: [*c]Uint8) bool;
pub extern fn SDL_ReadU16LE_REAL(src: ?*SDL_IOStream, value: [*c]Uint16) bool;
pub extern fn SDL_ReadU32LE_REAL(src: ?*SDL_IOStream, value: [*c]Uint32) bool;
pub const SDL_AUDIO_UNKNOWN: c_int = 0;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S16LE: c_int = 32784;
pub const SDL_AUDIO_S32LE: c_int = 32800;
pub const SDL_AUDIO_F32LE: c_int = 33056;
pub const SDL_AUDIO_S16: c_int = 32784;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub const struct_SDL_AudioSpec = extern struct {
    format: SDL_AudioFormat = @import("std").mem.zeroes(SDL_AudioFormat),
    channels: c_int = 0,
    freq: c_int = 0,
};
pub const SDL_AudioSpec = struct_SDL_AudioSpec;
pub export fn SDL_LoadWAV_IO_REAL(src: ?*SDL_IOStream, closeio: bool, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var file: WaveFile = undefined;
    _ = &file;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"false" != 0;
                if (spec != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (closeio and (src != null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            2 => {
                _ = memset(@ptrCast(@alignCast(spec)), 0, @sizeOf(@TypeOf(spec.*)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (audio_buf != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                audio_buf.* = null;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (audio_len != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                audio_len.* = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (!(src != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (!(spec != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("spec"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (!(audio_buf != null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("audio_buf"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (!(audio_len != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("audio_len"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                _ = memset(@ptrCast(@alignCast(&file)), 0, @sizeOf(@TypeOf(file)));
                file.riffhint = WaveGetRiffSizeHint();
                file.trunchint = WaveGetTruncationHint();
                file.facthint = WaveGetFactChunkHint();
                result = WaveLoad(src, &file, spec, audio_buf, audio_len);
                if (!result) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                SDL_free_REAL(@ptrCast(@alignCast(audio_buf.*)));
                audio_buf.* = null;
                audio_len.* = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (!closeio) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                _ = SDL_SeekIO_REAL(src, file.chunk.position, SDL_IO_SEEK_SET);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                WaveFreeChunkData(&file.chunk);
                SDL_free_REAL(file.decoderdata);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
                _ = SDL_CloseIO_REAL(src);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_LoadWAV_REAL(path: [*c]const u8, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(path, "rb");
    _ = &stream;
    if (!(stream != null)) {
        if (spec != null) {
            _ = memset(@ptrCast(@alignCast(spec)), 0, @sizeOf(@TypeOf(spec.*)));
        }
        if (audio_buf != null) {
            audio_buf.* = null;
        }
        if (audio_len != null) {
            audio_len.* = 0;
        }
        return @"false" != 0;
    }
    return SDL_LoadWAV_IO_REAL(stream, @"true" != 0, spec, audio_buf, audio_len);
}

pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_WaveFormat = extern struct {
    formattag: Uint16 = 0,
    encoding: Uint16 = 0,
    channels: Uint16 = 0,
    frequency: Uint32 = 0,
    byterate: Uint32 = 0,
    blockalign: Uint16 = 0,
    bitspersample: Uint16 = 0,
    extsize: Uint16 = 0,
    validsamplebits: Uint16 = 0,
    samplesperblock: Uint32 = 0,
    channelmask: Uint32 = 0,
    subformat: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const WaveFormat = struct_WaveFormat;
pub const struct_WaveFact = extern struct {
    status: Sint32 = 0,
    samplelength: Uint32 = 0,
};
pub const WaveFact = struct_WaveFact;
pub const struct_WaveChunk = extern struct {
    fourcc: Uint32 = 0,
    length: Uint32 = 0,
    position: Sint64 = 0,
    data: [*c]Uint8 = null,
    size: usize = 0,
};
pub const WaveChunk = struct_WaveChunk;
pub const RiffSizeNoHint: c_int = 0;
pub const RiffSizeForce: c_int = 1;
pub const RiffSizeIgnoreZero: c_int = 2;
pub const RiffSizeIgnore: c_int = 3;
pub const RiffSizeMaximum: c_int = 4;
pub const enum_WaveRiffSizeHint = c_uint;
pub const WaveRiffSizeHint = enum_WaveRiffSizeHint;
pub const TruncNoHint: c_int = 0;
pub const TruncVeryStrict: c_int = 1;
pub const TruncStrict: c_int = 2;
pub const TruncDropFrame: c_int = 3;
pub const TruncDropBlock: c_int = 4;
pub const enum_WaveTruncationHint = c_uint;
pub const WaveTruncationHint = enum_WaveTruncationHint;
pub const FactNoHint: c_int = 0;
pub const FactTruncate: c_int = 1;
pub const FactStrict: c_int = 2;
pub const FactIgnoreZero: c_int = 3;
pub const FactIgnore: c_int = 4;
pub const enum_WaveFactChunkHint = c_uint;
pub const WaveFactChunkHint = enum_WaveFactChunkHint;
pub const struct_WaveFile = extern struct {
    chunk: WaveChunk = @import("std").mem.zeroes(WaveChunk),
    format: WaveFormat = @import("std").mem.zeroes(WaveFormat),
    fact: WaveFact = @import("std").mem.zeroes(WaveFact),
    sampleframes: Sint64 = 0,
    decoderdata: ?*anyopaque = null,
    riffhint: WaveRiffSizeHint = @import("std").mem.zeroes(WaveRiffSizeHint),
    trunchint: WaveTruncationHint = @import("std").mem.zeroes(WaveTruncationHint),
    facthint: WaveFactChunkHint = @import("std").mem.zeroes(WaveFactChunkHint),
};
pub const WaveFile = struct_WaveFile;
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SDL_LoadWAV = SDL_LoadWAV_REAL;
pub const SDL_LoadWAV_IO = SDL_LoadWAV_IO_REAL;
pub const SIZE_MAX = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const RIFF = __helpers.promoteIntLiteral(c_int, 0x46464952, .hex);
pub const WAVE = __helpers.promoteIntLiteral(c_int, 0x45564157, .hex);
pub const FACT = __helpers.promoteIntLiteral(c_int, 0x74636166, .hex);
pub const FMT = __helpers.promoteIntLiteral(c_int, 0x20746D66, .hex);
pub const DATA = __helpers.promoteIntLiteral(c_int, 0x61746164, .hex);
pub const UNKNOWN_CODE = @as(c_int, 0x0000);
pub const PCM_CODE = @as(c_int, 0x0001);
pub const MS_ADPCM_CODE = @as(c_int, 0x0002);
pub const IEEE_FLOAT_CODE = @as(c_int, 0x0003);
pub const ALAW_CODE = @as(c_int, 0x0006);
pub const MULAW_CODE = @as(c_int, 0x0007);
pub const IMA_ADPCM_CODE = @as(c_int, 0x0011);
pub const MPEG_CODE = @as(c_int, 0x0050);
pub const MPEGLAYER3_CODE = @as(c_int, 0x0055);
pub const EXTENSIBLE_CODE = __helpers.promoteIntLiteral(c_int, 0xFFFE, .hex);
pub fn SafeMult(f1: [*c]usize, f2: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if ((f1.* > @as(usize, 0)) and ((@as(c_ulong, 18446744073709551615) / f1.*) <= f2)) {
        return -@as(c_int, 1);
    }
    f1.* *%= f2;
    return 0;
}
const struct_unnamed_15 = extern struct {
    data: [*c]Uint8 = null,
    size: usize = 0,
    pos: usize = 0,
};
const struct_unnamed_16 = extern struct {
    data: [*c]Uint8 = null,
    size: usize = 0,
    pos: usize = 0,
};
const struct_unnamed_17 = extern struct {
    data: [*c]Sint16 = null,
    size: usize = 0,
    pos: usize = 0,
};
pub const struct_ADPCM_DecoderState = extern struct {
    channels: Uint32 = 0,
    blocksize: usize = 0,
    blockheadersize: usize = 0,
    samplesperblock: usize = 0,
    framesize: usize = 0,
    framestotal: Sint64 = 0,
    framesleft: Sint64 = 0,
    ddata: ?*anyopaque = null,
    cstate: ?*anyopaque = null,
    input: struct_unnamed_15 = @import("std").mem.zeroes(struct_unnamed_15),
    block: struct_unnamed_16 = @import("std").mem.zeroes(struct_unnamed_16),
    output: struct_unnamed_17 = @import("std").mem.zeroes(struct_unnamed_17),
};
pub const ADPCM_DecoderState = struct_ADPCM_DecoderState;
pub const struct_MS_ADPCM_CoeffData = extern struct {
    coeffcount: Uint16 = 0,
    coeff: [*c]Sint16 = null,
    aligndummy: Sint16 = 0,
};
pub const MS_ADPCM_CoeffData = struct_MS_ADPCM_CoeffData;
pub const struct_MS_ADPCM_ChannelState = extern struct {
    delta: Uint16 = 0,
    coeff1: Sint16 = 0,
    coeff2: Sint16 = 0,
};
pub const MS_ADPCM_ChannelState = struct_MS_ADPCM_ChannelState;
pub fn WaveAdjustToFactValue(file: [*c]WaveFile, sampleframes: Sint64) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    if (file.*.fact.status == @as(c_int, 2)) {
        if ((file.*.facthint == @as(WaveFactChunkHint, FactStrict)) and (sampleframes < @as(Sint64, file.*.fact.samplelength))) {
            _ = SDL_SetError_REAL("Invalid number of sample frames in WAVE fact chunk (too many)");
            return -@as(c_int, 1);
        } else if (sampleframes > @as(Sint64, file.*.fact.samplelength)) {
            return file.*.fact.samplelength;
        }
    }
    return sampleframes;
}
pub fn MS_ADPCM_CalculateSampleFrames(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    const blockheadersize: usize = @as(usize, file.*.format.channels) *% @as(usize, 7);
    _ = &blockheadersize;
    const availableblocks: usize = datalength / @as(usize, @bitCast(@as(c_long, @as(c_int, file.*.format.blockalign))));
    _ = &availableblocks;
    const blockframebitsize: usize = @as(usize, file.*.format.bitspersample) *% @as(usize, @bitCast(@as(c_long, @as(c_int, file.*.format.channels))));
    _ = &blockframebitsize;
    const trailingdata: usize = datalength % @as(usize, @bitCast(@as(c_long, @as(c_int, file.*.format.blockalign))));
    _ = &trailingdata;
    if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
        if ((datalength < blockheadersize) or (trailingdata > @as(usize, 0))) {
            return SDL_SetError_REAL("Truncated MS ADPCM block");
        }
    }
    file.*.sampleframes = @as(Sint64, @bitCast(@as(c_ulong, @truncate(availableblocks)))) * @as(Sint64, format.*.samplesperblock);
    if (trailingdata > @as(usize, 0)) {
        if (file.*.trunchint == @as(WaveTruncationHint, TruncDropFrame)) {
            if (trailingdata >= blockheadersize) {
                var trailingsamples: usize = @as(usize, 2) +% (((trailingdata -% blockheadersize) *% @as(usize, 8)) / blockframebitsize);
                _ = &trailingsamples;
                if (trailingsamples > @as(usize, format.*.samplesperblock)) {
                    trailingsamples = format.*.samplesperblock;
                }
                {
                    const ref = &file.*.sampleframes;
                    ref.* = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) +% trailingsamples)));
                }
            }
        }
    }
    file.*.sampleframes = WaveAdjustToFactValue(file, file.*.sampleframes);
    if (file.*.sampleframes < @as(Sint64, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn MS_ADPCM_Init(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    const blockheadersize: usize = @as(usize, format.*.channels) *% @as(usize, 7);
    _ = &blockheadersize;
    const blockdatasize: usize = @as(usize, format.*.blockalign) -% blockheadersize;
    _ = &blockdatasize;
    const blockframebitsize: usize = @as(usize, format.*.bitspersample) *% @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.channels))));
    _ = &blockframebitsize;
    const blockdatasamples: usize = (blockdatasize *% @as(usize, 8)) / blockframebitsize;
    _ = &blockdatasamples;
    const presetcoeffs: [14]Sint16 = [14]Sint16{
        256,
        0,
        512,
        @truncate(-@as(c_int, 256)),
        0,
        0,
        192,
        64,
        240,
        0,
        460,
        @truncate(-@as(c_int, 208)),
        392,
        @truncate(-@as(c_int, 232)),
    };
    _ = &presetcoeffs;
    var i: usize = undefined;
    _ = &i;
    var coeffcount: usize = undefined;
    _ = &coeffcount;
    var coeffdata: [*c]MS_ADPCM_CoeffData = undefined;
    _ = &coeffdata;
    if (@as(c_int, format.*.channels) > @as(c_int, 2)) {
        return SDL_SetError_REAL("Invalid number of channels");
    }
    if (@as(c_int, format.*.bitspersample) != @as(c_int, 4)) {
        return SDL_SetError_REAL("Invalid MS ADPCM bits per sample of %u", @as(c_uint, format.*.bitspersample));
    }
    if (@as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign)))) < blockheadersize) {
        return SDL_SetError_REAL("Invalid MS ADPCM block size (nBlockAlign)");
    }
    if (@as(c_int, format.*.formattag) == EXTENSIBLE_CODE) {
        return SDL_SetError_REAL("MS ADPCM with the extensible header is not supported");
    }
    if (chunk.*.size < @as(usize, 22)) {
        return SDL_SetError_REAL("Could not read MS ADPCM format header");
    }
    format.*.samplesperblock = @bitCast(@as(c_int, @as(c_int, chunk.*.data[@as(c_int, 18)]) | (@as(c_int, @as(Uint16, chunk.*.data[@as(c_int, 19)])) << @intCast(@as(c_int, 8)))));
    coeffcount = @as(usize, @bitCast(@as(c_long, @as(c_int, chunk.*.data[@as(c_int, 20)])))) | (@as(usize, chunk.*.data[@as(c_int, 21)]) << @intCast(@as(usize, 8)));
    if (coeffcount > @as(usize, 256)) {
        coeffcount = 256;
    }
    if (chunk.*.size < (@as(usize, 22) +% (coeffcount *% @as(usize, 4)))) {
        return SDL_SetError_REAL("Could not read custom coefficients in MS ADPCM format header");
    } else if (@as(usize, @bitCast(@as(c_long, @as(c_int, format.*.extsize)))) < (@as(usize, 4) +% (coeffcount *% @as(usize, 4)))) {
        return SDL_SetError_REAL("Invalid MS ADPCM format header (too small)");
    } else if (coeffcount < @as(usize, 7)) {
        return SDL_SetError_REAL("Missing required coefficients in MS ADPCM format header");
    }
    coeffdata = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(MS_ADPCM_CoeffData) +% (coeffcount *% @as(usize, 4)))));
    file.*.decoderdata = @ptrCast(@alignCast(coeffdata));
    if (!(coeffdata != null)) {
        return @"false" != 0;
    }
    coeffdata.*.coeff = &coeffdata.*.aligndummy;
    coeffdata.*.coeffcount = @truncate(coeffcount);
    {
        i = 0;
        while (i < (coeffcount *% @as(usize, 2))) : (i +%= 1) {
            var c: Sint32 = @as(c_int, chunk.*.data[@as(usize, 22) +% (i *% @as(usize, 2))]) | (@as(Sint32, chunk.*.data[@as(usize, 23) +% (i *% @as(usize, 2))]) << @intCast(@as(c_int, 8)));
            _ = &c;
            if (c >= @as(c_int, 32768)) {
                c -= 65536;
            }
            if ((i < @as(usize, 14)) and (c != @as(c_int, presetcoeffs[i]))) {
                return SDL_SetError_REAL("Wrong preset coefficients in MS ADPCM format header");
            }
            coeffdata.*.coeff[i] = @truncate(c);
        }
    }
    if (format.*.samplesperblock == @as(Uint32, 0)) {
        format.*.samplesperblock = @as(Uint32, @truncate(blockdatasamples)) +% @as(Uint32, 2);
    }
    if ((format.*.samplesperblock == @as(Uint32, 1)) or (blockdatasamples < @as(usize, format.*.samplesperblock -% @as(Uint32, 2)))) {
        return SDL_SetError_REAL("Invalid number of samples per MS ADPCM block (wSamplesPerBlock)");
    }
    if (!MS_ADPCM_CalculateSampleFrames(file, datalength)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn MS_ADPCM_ProcessNibble(cstate: [*c]MS_ADPCM_ChannelState, sample1: Sint32, sample2: Sint32, nybble: Uint8) callconv(.c) Sint16 {
    @setEvalBranchQuota(100000);
    const max_audioval: Sint32 = 32767;
    _ = &max_audioval;
    const min_audioval: Sint32 = -@as(c_int, 32768);
    _ = &min_audioval;
    const max_deltaval: Uint16 = 65535;
    _ = &max_deltaval;
    const adaptive: [16]Uint16 = [16]Uint16{
        230,
        230,
        230,
        230,
        307,
        409,
        512,
        614,
        768,
        614,
        512,
        409,
        307,
        230,
        230,
        230,
    };
    _ = &adaptive;
    var new_sample: Sint32 = undefined;
    _ = &new_sample;
    var errordelta: Sint32 = undefined;
    _ = &errordelta;
    var delta: Uint32 = cstate.*.delta;
    _ = &delta;
    new_sample = @divTrunc((sample1 * @as(c_int, cstate.*.coeff1)) + (sample2 * @as(c_int, cstate.*.coeff2)), @as(c_int, 256));
    errordelta = @as(Sint32, nybble) - (if (@as(c_int, nybble) >= @as(c_int, 8)) @as(c_int, 16) else @as(c_int, 0));
    new_sample += @as(Sint32, @bitCast(@as(c_uint, @truncate(delta)))) * errordelta;
    if (new_sample < min_audioval) {
        new_sample = min_audioval;
    } else if (new_sample > max_audioval) {
        new_sample = max_audioval;
    }
    delta = (delta *% @as(Uint32, @bitCast(@as(c_int, @as(c_int, adaptive[nybble]))))) / @as(Uint32, 256);
    if (delta < @as(Uint32, 16)) {
        delta = 16;
    } else if (delta > @as(Uint32, @bitCast(@as(c_int, @as(c_int, max_deltaval))))) {
        delta = max_deltaval;
    }
    cstate.*.delta = @truncate(delta);
    return @truncate(new_sample);
}
pub fn MS_ADPCM_DecodeBlockHeader(state: [*c]ADPCM_DecoderState) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var coeffindex: Uint8 = undefined;
    _ = &coeffindex;
    const channels: Uint32 = state.*.channels;
    _ = &channels;
    var sample: Sint32 = undefined;
    _ = &sample;
    var c: Uint32 = undefined;
    _ = &c;
    var cstate: [*c]MS_ADPCM_ChannelState = @ptrCast(@alignCast(state.*.cstate));
    _ = &cstate;
    var ddata: [*c]MS_ADPCM_CoeffData = @ptrCast(@alignCast(state.*.ddata));
    _ = &ddata;
    {
        c = 0;
        while (c < channels) : (c +%= 1) {
            var o: usize = c;
            _ = &o;
            coeffindex = state.*.block.data[o];
            if (@as(c_int, coeffindex) > @as(c_int, ddata.*.coeffcount)) {
                return SDL_SetError_REAL("Invalid MS ADPCM coefficient index in block header");
            }
            cstate[c].coeff1 = ddata.*.coeff[@bitCast(@as(isize, @intCast(@as(c_int, coeffindex) * @as(c_int, 2))))];
            cstate[c].coeff2 = ddata.*.coeff[@bitCast(@as(isize, @intCast((@as(c_int, coeffindex) * @as(c_int, 2)) + @as(c_int, 1))))];
            o = @as(usize, channels) +% @as(usize, c *% @as(Uint32, 2));
            cstate[c].delta = @bitCast(@as(c_short, @truncate(@as(c_int, state.*.block.data[o]) | (@as(c_int, @as(Uint16, state.*.block.data[o +% @as(usize, 1)])) << @intCast(@as(c_int, 8))))));
            o = (@as(usize, channels) *% @as(usize, 3)) +% @as(usize, c *% @as(Uint32, 2));
            sample = @as(c_int, state.*.block.data[o]) | (@as(Sint32, state.*.block.data[o +% @as(usize, 1)]) << @intCast(@as(c_int, 8)));
            if (sample >= @as(c_int, 32768)) {
                sample -= 65536;
            }
            state.*.output.data[state.*.output.pos +% @as(usize, channels)] = @truncate(sample);
            o = (@as(usize, channels) *% @as(usize, 5)) +% @as(usize, c *% @as(Uint32, 2));
            sample = @as(c_int, state.*.block.data[o]) | (@as(Sint32, state.*.block.data[o +% @as(usize, 1)]) << @intCast(@as(c_int, 8)));
            if (sample >= @as(c_int, 32768)) {
                sample -= 65536;
            }
            state.*.output.data[state.*.output.pos] = @truncate(sample);
            state.*.output.pos +%= 1;
        }
    }
    state.*.block.pos +%= state.*.blockheadersize;
    state.*.output.pos +%= state.*.channels;
    state.*.framesleft -= 2;
    return @"true" != 0;
}
pub fn MS_ADPCM_DecodeBlockData(state: [*c]ADPCM_DecoderState) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var nybble: Uint16 = 0;
    _ = &nybble;
    var sample1: Sint16 = undefined;
    _ = &sample1;
    var sample2: Sint16 = undefined;
    _ = &sample2;
    const channels: Uint32 = state.*.channels;
    _ = &channels;
    var c: Uint32 = undefined;
    _ = &c;
    var cstate: [*c]MS_ADPCM_ChannelState = @ptrCast(@alignCast(state.*.cstate));
    _ = &cstate;
    var blockpos: usize = state.*.block.pos;
    _ = &blockpos;
    var blocksize: usize = state.*.block.size;
    _ = &blocksize;
    var outpos: usize = state.*.output.pos;
    _ = &outpos;
    var blockframesleft: Sint64 = @bitCast(@as(c_ulong, @truncate(state.*.samplesperblock -% @as(usize, 2))));
    _ = &blockframesleft;
    if (blockframesleft > state.*.framesleft) {
        blockframesleft = state.*.framesleft;
    }
    while (blockframesleft > @as(Sint64, 0)) {
        {
            c = 0;
            while (c < channels) : (c +%= 1) {
                if ((@as(c_int, nybble) & @as(c_int, 16384)) != 0) {
                    {
                        const ref = &nybble;
                        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 4)))));
                    }
                } else if (blockpos < blocksize) {
                    nybble = @bitCast(@as(c_short, @truncate(@as(c_int, state.*.block.data[
                        blk: {
                            const ref = &blockpos;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ]) | @as(c_int, 16384))));
                } else {
                    state.*.output.pos = outpos -% @as(usize, c);
                    return @"false" != 0;
                }
                sample1 = state.*.output.data[outpos -% @as(usize, channels)];
                sample2 = state.*.output.data[outpos -% @as(usize, channels *% @as(Uint32, 2))];
                sample1 = MS_ADPCM_ProcessNibble(cstate + c, sample1, sample2, @bitCast(@as(i8, @truncate((@as(c_int, nybble) >> @intCast(@as(c_int, 4))) & @as(c_int, 15)))));
                state.*.output.data[
                    blk: {
                        const ref = &outpos;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ] = sample1;
            }
        }
        state.*.framesleft -= 1;
        blockframesleft -= 1;
    }
    state.*.output.pos = outpos;
    return @"true" != 0;
}
pub fn MS_ADPCM_Decode(file: [*c]WaveFile, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var bytesleft: usize = undefined;
    _ = &bytesleft;
    var outputsize: usize = undefined;
    _ = &outputsize;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    var state: ADPCM_DecoderState = undefined;
    _ = &state;
    var cstate: [2]MS_ADPCM_ChannelState = undefined;
    _ = &cstate;
    _ = memset(@ptrCast(@alignCast(&state)), 0, @sizeOf(@TypeOf(state)));
    _ = memset(@ptrCast(@alignCast(@as([*c]MS_ADPCM_ChannelState, @ptrCast(@alignCast(&cstate))))), 0, @sizeOf(@TypeOf(cstate)));
    if (chunk.*.size != @as(usize, chunk.*.length)) {
        if (!MS_ADPCM_CalculateSampleFrames(file, chunk.*.size)) {
            return @"false" != 0;
        }
    }
    if (file.*.sampleframes == @as(Sint64, 0)) {
        audio_buf.* = null;
        audio_len.* = 0;
        return @"true" != 0;
    }
    state.blocksize = file.*.format.blockalign;
    state.channels = file.*.format.channels;
    state.blockheadersize = @as(usize, state.channels) *% @as(usize, 7);
    state.samplesperblock = file.*.format.samplesperblock;
    state.framesize = @as(c_ulong, state.channels) *% @sizeOf(Sint16);
    state.ddata = file.*.decoderdata;
    state.framestotal = file.*.sampleframes;
    state.framesleft = state.framestotal;
    state.input.data = chunk.*.data;
    state.input.size = chunk.*.size;
    state.input.pos = 0;
    outputsize = @bitCast(@as(c_long, state.framestotal));
    if (SafeMult(&outputsize, state.framesize) != 0) {
        return SDL_SetError_REAL("WAVE file too big");
    } else if ((outputsize > @as(usize, @as(c_uint, 4294967295))) or (@as(c_ulong, @bitCast(@as(c_long, state.framestotal))) > @as(c_ulong, 18446744073709551615))) {
        return SDL_SetError_REAL("WAVE file too big");
    }
    state.output.pos = 0;
    state.output.size = outputsize / @sizeOf(Sint16);
    state.output.data = @ptrCast(@alignCast(SDL_calloc_REAL(1, outputsize)));
    if (!(state.output.data != null)) {
        return @"false" != 0;
    }
    state.cstate = @ptrCast(@alignCast(@as([*c]MS_ADPCM_ChannelState, @ptrCast(@alignCast(&cstate)))));
    bytesleft = state.input.size -% state.input.pos;
    while ((state.framesleft > @as(Sint64, 0)) and (bytesleft >= state.blockheadersize)) {
        state.block.data = state.input.data + state.input.pos;
        state.block.size = if (bytesleft < state.blocksize) bytesleft else state.blocksize;
        state.block.pos = 0;
        if ((state.output.size -% state.output.pos) < (@as(Uint64, @bitCast(@as(c_long, state.framesleft))) *% @as(Uint64, state.channels))) {
            SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
            return SDL_SetError_REAL("Unexpected overflow in MS ADPCM decoder");
        }
        result = MS_ADPCM_DecodeBlockHeader(&state);
        if (!result) {
            SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
            return @"false" != 0;
        }
        result = MS_ADPCM_DecodeBlockData(&state);
        if (!result) {
            if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
                SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
                return SDL_SetError_REAL("Truncated data chunk");
            } else if (file.*.trunchint != @as(WaveTruncationHint, TruncDropFrame)) {
                state.output.pos -%= state.output.pos % (state.samplesperblock *% @as(usize, state.channels));
            }
            outputsize = state.output.pos *% @sizeOf(Sint16);
            break;
        }
        state.input.pos +%= state.block.size;
        bytesleft = state.input.size -% state.input.pos;
    }
    audio_buf.* = @ptrCast(@alignCast(state.output.data));
    audio_len.* = @truncate(outputsize);
    return @"true" != 0;
}
pub fn IMA_ADPCM_CalculateSampleFrames(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    const blockheadersize: usize = @as(usize, format.*.channels) *% @as(usize, 4);
    _ = &blockheadersize;
    const subblockframesize: usize = @as(usize, format.*.channels) *% @as(usize, 4);
    _ = &subblockframesize;
    const availableblocks: usize = datalength / @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))));
    _ = &availableblocks;
    const trailingdata: usize = datalength % @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))));
    _ = &trailingdata;
    if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
        if ((datalength < blockheadersize) or (trailingdata > @as(usize, 0))) {
            return SDL_SetError_REAL("Truncated IMA ADPCM block");
        }
    }
    file.*.sampleframes = @bitCast(@as(c_ulong, @truncate(availableblocks *% @as(Uint64, format.*.samplesperblock))));
    if (trailingdata > @as(usize, 0)) {
        if ((file.*.trunchint == @as(WaveTruncationHint, TruncDropFrame)) and (trailingdata > (blockheadersize -% @as(usize, 2)))) {
            var trailingsamples: usize = 1;
            _ = &trailingsamples;
            if (trailingdata > blockheadersize) {
                const trailingblockdata: usize = trailingdata -% blockheadersize;
                _ = &trailingblockdata;
                const trailingsubblockdata: usize = trailingblockdata % subblockframesize;
                _ = &trailingsubblockdata;
                trailingsamples +%= (trailingblockdata / subblockframesize) *% @as(usize, 8);
                if (trailingsubblockdata > (subblockframesize -% @as(usize, 4))) {
                    trailingsamples +%= (trailingsubblockdata % @as(usize, 4)) *% @as(usize, 2);
                }
            }
            if (trailingsamples > @as(usize, format.*.samplesperblock)) {
                trailingsamples = format.*.samplesperblock;
            }
            {
                const ref = &file.*.sampleframes;
                ref.* = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) +% trailingsamples)));
            }
        }
    }
    file.*.sampleframes = WaveAdjustToFactValue(file, file.*.sampleframes);
    if (file.*.sampleframes < @as(Sint64, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn IMA_ADPCM_Init(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    const blockheadersize: usize = @as(usize, format.*.channels) *% @as(usize, 4);
    _ = &blockheadersize;
    const blockdatasize: usize = @as(usize, format.*.blockalign) -% blockheadersize;
    _ = &blockdatasize;
    const blockframebitsize: usize = @as(usize, format.*.bitspersample) *% @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.channels))));
    _ = &blockframebitsize;
    const blockdatasamples: usize = (blockdatasize *% @as(usize, 8)) / blockframebitsize;
    _ = &blockdatasamples;
    if (@as(c_int, format.*.bitspersample) == @as(c_int, 3)) {
        return SDL_SetError_REAL("3-bit IMA ADPCM currently not supported");
    } else if (@as(c_int, format.*.bitspersample) != @as(c_int, 4)) {
        return SDL_SetError_REAL("Invalid IMA ADPCM bits per sample of %u", @as(c_uint, format.*.bitspersample));
    }
    if ((@as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign)))) < blockheadersize) or (__helpers.signedRemainder(@as(c_int, format.*.blockalign), @as(c_int, 4)) != 0)) {
        return SDL_SetError_REAL("Invalid IMA ADPCM block size (nBlockAlign)");
    }
    if (@as(c_int, format.*.formattag) == EXTENSIBLE_CODE) {} else {
        if ((chunk.*.size >= @as(usize, 20)) and (@as(c_int, format.*.extsize) >= @as(c_int, 2))) {
            format.*.samplesperblock = @bitCast(@as(c_int, @as(c_int, chunk.*.data[@as(c_int, 18)]) | (@as(c_int, @as(Uint16, chunk.*.data[@as(c_int, 19)])) << @intCast(@as(c_int, 8)))));
        }
    }
    if (format.*.samplesperblock == @as(Uint32, 0)) {
        format.*.samplesperblock = @as(Uint32, @truncate(blockdatasamples)) +% @as(Uint32, 1);
    }
    if (blockdatasamples < @as(usize, format.*.samplesperblock -% @as(Uint32, 1))) {
        return SDL_SetError_REAL("Invalid number of samples per IMA ADPCM block (wSamplesPerBlock)");
    }
    if (!IMA_ADPCM_CalculateSampleFrames(file, datalength)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn IMA_ADPCM_ProcessNibble(cindex: [*c]Sint8, lastsample: Sint16, nybble: Uint8) callconv(.c) Sint16 {
    @setEvalBranchQuota(100000);
    const max_audioval: Sint32 = 32767;
    _ = &max_audioval;
    const min_audioval: Sint32 = -@as(c_int, 32768);
    _ = &min_audioval;
    const index_table_4b: [16]Sint8 = [16]Sint8{
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        2,
        4,
        6,
        8,
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        @truncate(-@as(c_int, 1)),
        2,
        4,
        6,
        8,
    };
    _ = &index_table_4b;
    const step_table: [89]Uint16 = [89]Uint16{
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        16,
        17,
        19,
        21,
        23,
        25,
        28,
        31,
        34,
        37,
        41,
        45,
        50,
        55,
        60,
        66,
        73,
        80,
        88,
        97,
        107,
        118,
        130,
        143,
        157,
        173,
        190,
        209,
        230,
        253,
        279,
        307,
        337,
        371,
        408,
        449,
        494,
        544,
        598,
        658,
        724,
        796,
        876,
        963,
        1060,
        1166,
        1282,
        1411,
        1552,
        1707,
        1878,
        2066,
        2272,
        2499,
        2749,
        3024,
        3327,
        3660,
        4026,
        4428,
        4871,
        5358,
        5894,
        6484,
        7132,
        7845,
        8630,
        9493,
        10442,
        11487,
        12635,
        13899,
        15289,
        16818,
        18500,
        20350,
        22385,
        24623,
        27086,
        29794,
        32767,
    };
    _ = &step_table;
    var step: Uint32 = undefined;
    _ = &step;
    var sample: Sint32 = undefined;
    _ = &sample;
    var delta: Sint32 = undefined;
    _ = &delta;
    var index_1: Sint8 = cindex.*;
    _ = &index_1;
    if (@as(c_int, index_1) > @as(c_int, 88)) {
        index_1 = 88;
    } else if (@as(c_int, index_1) < @as(c_int, 0)) {
        index_1 = 0;
    }
    step = step_table[@as(usize, @bitCast(@as(c_long, index_1)))];
    cindex.* = @truncate(@as(c_int, index_1) + @as(c_int, index_table_4b[nybble]));
    delta = @bitCast(@as(c_uint, @truncate(step >> @intCast(@as(Uint32, 3)))));
    if ((@as(c_int, nybble) & @as(c_int, 4)) != 0) {
        {
            const ref = &delta;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) +% step)));
        }
    }
    if ((@as(c_int, nybble) & @as(c_int, 2)) != 0) {
        {
            const ref = &delta;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) +% (step >> @intCast(@as(Uint32, 1))))));
        }
    }
    if ((@as(c_int, nybble) & @as(c_int, 1)) != 0) {
        {
            const ref = &delta;
            ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) +% (step >> @intCast(@as(Uint32, 2))))));
        }
    }
    if ((@as(c_int, nybble) & @as(c_int, 8)) != 0) {
        delta = -delta;
    }
    sample = @as(c_int, lastsample) + delta;
    if (sample > max_audioval) {
        sample = max_audioval;
    } else if (sample < min_audioval) {
        sample = min_audioval;
    }
    return @truncate(sample);
}
pub fn IMA_ADPCM_DecodeBlockHeader(state: [*c]ADPCM_DecoderState) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var step: Sint16 = undefined;
    _ = &step;
    var c: Uint32 = undefined;
    _ = &c;
    var cstate: [*c]Uint8 = @ptrCast(@alignCast(state.*.cstate));
    _ = &cstate;
    {
        c = 0;
        while (c < state.*.channels) : (c +%= 1) {
            var o: usize = state.*.block.pos +% @as(usize, c *% @as(Uint32, 4));
            _ = &o;
            var sample: Sint32 = @as(c_int, state.*.block.data[o]) | (@as(Sint32, state.*.block.data[o +% @as(usize, 1)]) << @intCast(@as(c_int, 8)));
            _ = &sample;
            if (sample >= @as(c_int, 32768)) {
                sample -= 65536;
            }
            state.*.output.data[
                blk: {
                    const ref = &state.*.output.pos;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }
            ] = @truncate(sample);
            step = state.*.block.data[o +% @as(usize, 2)];
            cstate[c] = @bitCast(@as(i8, @as(Sint8, @truncate(if (@as(c_int, step) > @as(c_int, 128)) @as(c_int, step) - @as(c_int, 256) else @as(c_int, step)))));
            if (@as(c_int, state.*.block.data[o +% @as(usize, 3)]) != @as(c_int, 0)) {}
        }
    }
    state.*.block.pos +%= state.*.blockheadersize;
    state.*.framesleft -= 1;
    return @"true" != 0;
}
pub fn IMA_ADPCM_DecodeBlockData(state: [*c]ADPCM_DecoderState) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    const channels: Uint32 = state.*.channels;
    _ = &channels;
    const subblockframesize: usize = @as(usize, channels) *% @as(usize, 4);
    _ = &subblockframesize;
    var bytesrequired: Uint64 = undefined;
    _ = &bytesrequired;
    var c: Uint32 = undefined;
    _ = &c;
    var result: bool = @"true" != 0;
    _ = &result;
    var blockpos: usize = state.*.block.pos;
    _ = &blockpos;
    var blocksize: usize = state.*.block.size;
    _ = &blocksize;
    var blockleft: usize = blocksize -% blockpos;
    _ = &blockleft;
    var outpos: usize = state.*.output.pos;
    _ = &outpos;
    var blockframesleft: Sint64 = @bitCast(@as(c_ulong, @truncate(state.*.samplesperblock -% @as(usize, 1))));
    _ = &blockframesleft;
    if (blockframesleft > state.*.framesleft) {
        blockframesleft = state.*.framesleft;
    }
    bytesrequired = @as(usize, @bitCast(@as(c_long, @divTrunc(blockframesleft + @as(Sint64, 7), @as(Sint64, 8))))) *% subblockframesize;
    if (blockleft < bytesrequired) {
        const guaranteedframes: usize = blockleft / subblockframesize;
        _ = &guaranteedframes;
        const remainingbytes: usize = blockleft % subblockframesize;
        _ = &remainingbytes;
        blockframesleft = @bitCast(@as(c_ulong, @truncate(guaranteedframes)));
        if (remainingbytes > (subblockframesize -% @as(usize, 4))) {
            blockframesleft += @as(Sint64, @bitCast(@as(c_ulong, @truncate(remainingbytes % @as(usize, 4))))) * @as(Sint64, 2);
        }
        result = @"false" != 0;
    }
    while (blockframesleft > @as(Sint64, 0)) {
        const subblocksamples: usize = if (blockframesleft < @as(Sint64, 8)) @as(usize, @bitCast(@as(c_long, blockframesleft))) else @as(usize, 8);
        _ = &subblocksamples;
        {
            c = 0;
            while (c < channels) : (c +%= 1) {
                var nybble: Uint8 = 0;
                _ = &nybble;
                var sample: Sint16 = state.*.output.data[(outpos +% @as(usize, c)) -% @as(usize, channels)];
                _ = &sample;
                {
                    i = 0;
                    while (i < subblocksamples) : (i +%= 1) {
                        if ((i & @as(usize, 1)) != 0) {
                            {
                                const ref = &nybble;
                                ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(@as(c_int, 4)))));
                            }
                        } else {
                            nybble = state.*.block.data[
                                blk: {
                                    const ref = &blockpos;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ];
                        }
                        sample = IMA_ADPCM_ProcessNibble(@as([*c]Sint8, @ptrCast(@alignCast(state.*.cstate))) + c, sample, @bitCast(@as(i8, @truncate(@as(c_int, nybble) & @as(c_int, 15)))));
                        state.*.output.data[(outpos +% @as(usize, c)) +% (i *% @as(usize, channels))] = sample;
                    }
                }
            }
        }
        outpos +%= @as(usize, channels) *% subblocksamples;
        {
            const ref = &state.*.framesleft;
            ref.* = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) -% subblocksamples)));
        }
        {
            const ref = &blockframesleft;
            ref.* = @bitCast(@as(c_ulong, @truncate(@as(usize, @bitCast(@as(c_long, ref.*))) -% subblocksamples)));
        }
    }
    state.*.block.pos = blockpos;
    state.*.output.pos = outpos;
    return result;
}
pub fn IMA_ADPCM_Decode(file: [*c]WaveFile, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var bytesleft: usize = undefined;
    _ = &bytesleft;
    var outputsize: usize = undefined;
    _ = &outputsize;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    var state: ADPCM_DecoderState = undefined;
    _ = &state;
    var cstate: [*c]Sint8 = undefined;
    _ = &cstate;
    if (chunk.*.size != @as(usize, chunk.*.length)) {
        if (!IMA_ADPCM_CalculateSampleFrames(file, chunk.*.size)) {
            return @"false" != 0;
        }
    }
    if (file.*.sampleframes == @as(Sint64, 0)) {
        audio_buf.* = null;
        audio_len.* = 0;
        return @"true" != 0;
    }
    _ = memset(@ptrCast(@alignCast(&state)), 0, @sizeOf(@TypeOf(state)));
    state.channels = file.*.format.channels;
    state.blocksize = file.*.format.blockalign;
    state.blockheadersize = @as(usize, state.channels) *% @as(usize, 4);
    state.samplesperblock = file.*.format.samplesperblock;
    state.framesize = @as(c_ulong, state.channels) *% @sizeOf(Sint16);
    state.framestotal = file.*.sampleframes;
    state.framesleft = state.framestotal;
    state.input.data = chunk.*.data;
    state.input.size = chunk.*.size;
    state.input.pos = 0;
    outputsize = @bitCast(@as(c_long, state.framestotal));
    if (SafeMult(&outputsize, state.framesize) != 0) {
        return SDL_SetError_REAL("WAVE file too big");
    } else if ((outputsize > @as(usize, @as(c_uint, 4294967295))) or (@as(c_ulong, @bitCast(@as(c_long, state.framestotal))) > @as(c_ulong, 18446744073709551615))) {
        return SDL_SetError_REAL("WAVE file too big");
    }
    state.output.pos = 0;
    state.output.size = outputsize / @sizeOf(Sint16);
    state.output.data = @ptrCast(@alignCast(SDL_malloc_REAL(outputsize)));
    if (!(state.output.data != null)) {
        return @"false" != 0;
    }
    cstate = @ptrCast(@alignCast(SDL_calloc_REAL(state.channels, @sizeOf(Sint8))));
    if (!(cstate != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
        return @"false" != 0;
    }
    state.cstate = @ptrCast(@alignCast(cstate));
    bytesleft = state.input.size -% state.input.pos;
    while ((state.framesleft > @as(Sint64, 0)) and (bytesleft >= state.blockheadersize)) {
        state.block.data = state.input.data + state.input.pos;
        state.block.size = if (bytesleft < state.blocksize) bytesleft else state.blocksize;
        state.block.pos = 0;
        if ((state.output.size -% state.output.pos) < (@as(Uint64, @bitCast(@as(c_long, state.framesleft))) *% @as(Uint64, state.channels))) {
            SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
            SDL_free_REAL(@ptrCast(@alignCast(cstate)));
            return SDL_SetError_REAL("Unexpected overflow in IMA ADPCM decoder");
        }
        result = IMA_ADPCM_DecodeBlockHeader(&state);
        if (result) {
            result = IMA_ADPCM_DecodeBlockData(&state);
        }
        if (!result) {
            if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
                SDL_free_REAL(@ptrCast(@alignCast(state.output.data)));
                SDL_free_REAL(@ptrCast(@alignCast(cstate)));
                return SDL_SetError_REAL("Truncated data chunk");
            } else if (file.*.trunchint != @as(WaveTruncationHint, TruncDropFrame)) {
                state.output.pos -%= state.output.pos % (state.samplesperblock *% @as(usize, state.channels));
            }
            outputsize = state.output.pos *% @sizeOf(Sint16);
            break;
        }
        state.input.pos +%= state.block.size;
        bytesleft = state.input.size -% state.input.pos;
    }
    audio_buf.* = @ptrCast(@alignCast(state.output.data));
    audio_len.* = @truncate(outputsize);
    SDL_free_REAL(@ptrCast(@alignCast(cstate)));
    return @"true" != 0;
}
pub fn LAW_Init(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    if (@as(c_int, format.*.bitspersample) != @as(c_int, 8)) {
        return SDL_SetError_REAL("Invalid companded bits per sample of %u", @as(c_uint, format.*.bitspersample));
    }
    if (@as(c_int, format.*.blockalign) != @as(c_int, format.*.channels)) {
        return SDL_SetError_REAL("Unsupported block alignment");
    }
    if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
        if ((@as(usize, @bitCast(@as(c_long, @intFromBool(@as(c_int, format.*.blockalign) > @as(c_int, 1))))) != 0) and ((datalength % @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))) != 0)) {
            return SDL_SetError_REAL("Truncated data chunk in WAVE file");
        }
    }
    file.*.sampleframes = WaveAdjustToFactValue(file, @bitCast(@as(c_ulong, @truncate(datalength / @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))))));
    if (file.*.sampleframes < @as(Sint64, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn LAW_Decode(file: [*c]WaveFile, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = undefined;
    _ = &format;
    var chunk: [*c]WaveChunk = undefined;
    _ = &chunk;
    var i: usize = undefined;
    _ = &i;
    var sample_count: usize = undefined;
    _ = &sample_count;
    var expanded_len: usize = undefined;
    _ = &expanded_len;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Sint16 = undefined;
    _ = &dst;
    var nibble: Uint8 = undefined;
    _ = &nibble;
    var exponent: Uint8 = undefined;
    _ = &exponent;
    var mantissa: Sint16 = undefined;
    _ = &mantissa;
    var nibble_1: Uint8 = undefined;
    _ = &nibble_1;
    var mantissa_2: Sint16 = undefined;
    _ = &mantissa_2;
    var exponent_3: Uint8 = undefined;
    _ = &exponent_3;
    var step: Sint16 = undefined;
    _ = &step;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                format = &file.*.format;
                chunk = &file.*.chunk;
                if (@as(usize, chunk.*.length) != chunk.*.size) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                file.*.sampleframes = WaveAdjustToFactValue(file, @bitCast(@as(c_ulong, @truncate(chunk.*.size / @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))))));
                if (file.*.sampleframes < @as(Sint64, 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (file.*.sampleframes == @as(Sint64, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                audio_buf.* = null;
                audio_len.* = 0;
                return @"true" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                sample_count = @bitCast(@as(c_long, file.*.sampleframes));
                if (SafeMult(&sample_count, format.*.channels) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return SDL_SetError_REAL("WAVE file too big");
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                expanded_len = sample_count;
                if (SafeMult(&expanded_len, @sizeOf(Sint16)) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("WAVE file too big");
            },
            14 => {
                if ((expanded_len > @as(usize, @as(c_uint, 4294967295))) or (@as(c_ulong, @bitCast(@as(c_long, file.*.sampleframes))) > @as(c_ulong, 18446744073709551615))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                src = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(chunk.*.data)), if (expanded_len != 0) expanded_len else @as(usize, 1))));
                if (!(src != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            16 => {
                return SDL_SetError_REAL("WAVE file too big");
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                return @"false" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                chunk.*.data = null;
                chunk.*.size = 0;
                dst = @ptrCast(@alignCast(src));
                i = sample_count;
                switch (@as(c_int, file.*.format.encoding)) {
                    ALAW_CODE => {
                        sdl_pc = 23;
                        continue;
                    },
                    MULAW_CODE => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 37;
                        continue;
                    },
                }
            },
            22 => {
                audio_buf.* = src;
                audio_len.* = @truncate(expanded_len);
                return @"true" != 0;
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                nibble = src[i];
                exponent = @bitCast(@as(i8, @truncate((@as(c_int, nibble) & @as(c_int, 127)) ^ @as(c_int, 85))));
                mantissa = @truncate(@as(c_int, exponent) & @as(c_int, 15));
                {
                    const ref = &exponent;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(@as(c_int, 4)))));
                }
                if (@as(c_int, exponent) > @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                {
                    const ref = &mantissa;
                    ref.* = @truncate(@as(c_int, ref.*) | @as(c_int, 16));
                }
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                mantissa = @truncate((@as(c_int, mantissa) << @intCast(@as(c_int, 4))) | @as(c_int, 8));
                if (@as(c_int, exponent) > @as(c_int, 1)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    const ref = &mantissa;
                    ref.* = @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, exponent) - @as(c_int, 1)));
                }
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dst[i] = @truncate(if ((@as(c_int, nibble) & @as(c_int, 128)) != 0) @as(c_int, mantissa) else -@as(c_int, mantissa));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -%= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                nibble_1 = @bitCast(@as(i8, @truncate(~@as(c_int, src[i]))));
                mantissa_2 = @truncate(@as(c_int, nibble_1) & @as(c_int, 15));
                exponent_3 = @bitCast(@as(i8, @truncate((@as(c_int, nibble_1) >> @intCast(@as(c_int, 4))) & @as(c_int, 7))));
                step = @truncate(@as(c_int, 4) << @intCast(@as(c_int, exponent_3) + @as(c_int, 1)));
                mantissa_2 = @truncate((((@as(c_int, 128) << @intCast(@as(c_int, exponent_3))) + (@as(c_int, step) * @as(c_int, mantissa_2))) + @divTrunc(@as(c_int, step), @as(c_int, 2))) - @as(c_int, 132));
                dst[i] = @truncate(if ((@as(c_int, nibble_1) & @as(c_int, 128)) != 0) -@as(c_int, mantissa_2) else @as(c_int, mantissa_2));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            37 => {
                SDL_free_REAL(@ptrCast(@alignCast(src)));
                return SDL_SetError_REAL("Unknown companded encoding");
            },
            else => unreachable,
        }
    }
}
pub fn PCM_Init(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = undefined;
    _ = &format;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                format = &file.*.format;
                if (@as(c_int, format.*.encoding) == PCM_CODE) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (@as(c_int, format.*.bitspersample)) {
                    @as(c_int, 8) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 24) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            2 => {
                if (@as(c_int, format.*.encoding) == IEEE_FLOAT_CODE) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            3 => {
                if (__helpers.signedRemainder(@as(c_int, format.*.channels) * @as(c_int, format.*.bitspersample), @as(c_int, format.*.blockalign) * @as(c_int, 8)) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                return SDL_SetError_REAL("%u-bit PCM format not supported", @as(c_uint, format.*.bitspersample));
            },
            10 => {
                if (@as(c_int, format.*.bitspersample) != @as(c_int, 32)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("%u-bit IEEE floating-point format not supported", @as(c_uint, format.*.bitspersample));
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                return SDL_SetError_REAL("Unsupported block alignment");
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if ((@as(usize, @bitCast(@as(c_long, @intFromBool(@as(c_int, format.*.blockalign) > @as(c_int, 1))))) != 0) and ((datalength % @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))) != 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                file.*.sampleframes = WaveAdjustToFactValue(file, @bitCast(@as(c_ulong, @truncate(datalength / @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))))));
                if (file.*.sampleframes < @as(Sint64, 0)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            22 => {
                return SDL_SetError_REAL("Truncated data chunk in WAVE file");
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                return @"false" != 0;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn PCM_ConvertSint24ToSint32(file: [*c]WaveFile, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    var i: usize = undefined;
    _ = &i;
    var expanded_len: usize = undefined;
    _ = &expanded_len;
    var sample_count: usize = undefined;
    _ = &sample_count;
    var ptr: [*c]Uint8 = undefined;
    _ = &ptr;
    sample_count = @bitCast(@as(c_long, file.*.sampleframes));
    if (SafeMult(&sample_count, format.*.channels) != 0) {
        return SDL_SetError_REAL("WAVE file too big");
    }
    expanded_len = sample_count;
    if (SafeMult(&expanded_len, @sizeOf(Sint32)) != 0) {
        return SDL_SetError_REAL("WAVE file too big");
    } else if ((expanded_len > @as(usize, @as(c_uint, 4294967295))) or (@as(c_ulong, @bitCast(@as(c_long, file.*.sampleframes))) > @as(c_ulong, 18446744073709551615))) {
        return SDL_SetError_REAL("WAVE file too big");
    }
    ptr = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(chunk.*.data)), if (expanded_len != 0) expanded_len else @as(usize, 1))));
    if (!(ptr != null)) {
        return @"false" != 0;
    }
    chunk.*.data = null;
    chunk.*.size = 0;
    audio_buf.* = ptr;
    audio_len.* = @truncate(expanded_len);
    {
        i = sample_count;
        while (i > @as(usize, 0)) : (i -%= 1) {
            const o: usize = i -% @as(usize, 1);
            _ = &o;
            var b: [4]u8 = undefined;
            _ = &b;
            b[@as(c_int, 0)] = 0;
            b[@as(c_int, 1)] = ptr[o *% @as(usize, 3)];
            b[@as(c_int, 2)] = ptr[(o *% @as(usize, 3)) +% @as(usize, 1)];
            b[@as(c_int, 3)] = ptr[(o *% @as(usize, 3)) +% @as(usize, 2)];
            ptr[(o *% @as(usize, 4)) +% @as(usize, 0)] = b[@as(c_int, 0)];
            ptr[(o *% @as(usize, 4)) +% @as(usize, 1)] = b[@as(c_int, 1)];
            ptr[(o *% @as(usize, 4)) +% @as(usize, 2)] = b[@as(c_int, 2)];
            ptr[(o *% @as(usize, 4)) +% @as(usize, 3)] = b[@as(c_int, 3)];
        }
    }
    return @"true" != 0;
}
pub fn PCM_Decode(file: [*c]WaveFile, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    var outputsize: usize = undefined;
    _ = &outputsize;
    if (@as(usize, chunk.*.length) != chunk.*.size) {
        file.*.sampleframes = WaveAdjustToFactValue(file, @bitCast(@as(c_ulong, @truncate(chunk.*.size / @as(usize, @bitCast(@as(c_long, @as(c_int, format.*.blockalign))))))));
        if (file.*.sampleframes < @as(Sint64, 0)) {
            return @"false" != 0;
        }
    }
    if (file.*.sampleframes == @as(Sint64, 0)) {
        audio_buf.* = null;
        audio_len.* = 0;
        return @"true" != 0;
    }
    if ((@as(c_int, format.*.encoding) == PCM_CODE) and (@as(c_int, format.*.bitspersample) == @as(c_int, 24))) {
        return PCM_ConvertSint24ToSint32(file, audio_buf, audio_len);
    }
    outputsize = @bitCast(@as(c_long, file.*.sampleframes));
    if (SafeMult(&outputsize, format.*.blockalign) != 0) {
        return SDL_SetError_REAL("WAVE file too big");
    } else if ((outputsize > @as(usize, @as(c_uint, 4294967295))) or (@as(c_ulong, @bitCast(@as(c_long, file.*.sampleframes))) > @as(c_ulong, 18446744073709551615))) {
        return SDL_SetError_REAL("WAVE file too big");
    }
    audio_buf.* = chunk.*.data;
    audio_len.* = @truncate(outputsize);
    chunk.*.data = null;
    chunk.*.size = 0;
    return @"true" != 0;
}
pub fn WaveGetRiffSizeHint() callconv(.c) WaveRiffSizeHint {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_WAVE_RIFF_CHUNK_SIZE");
    _ = &hint;
    if (hint != null) {
        if (SDL_strcmp_REAL(hint, "force") == @as(c_int, 0)) {
            return RiffSizeForce;
        } else if (SDL_strcmp_REAL(hint, "ignore") == @as(c_int, 0)) {
            return RiffSizeIgnore;
        } else if (SDL_strcmp_REAL(hint, "ignorezero") == @as(c_int, 0)) {
            return RiffSizeIgnoreZero;
        } else if (SDL_strcmp_REAL(hint, "maximum") == @as(c_int, 0)) {
            return RiffSizeMaximum;
        }
    }
    return RiffSizeNoHint;
}
pub fn WaveGetTruncationHint() callconv(.c) WaveTruncationHint {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_WAVE_TRUNCATION");
    _ = &hint;
    if (hint != null) {
        if (SDL_strcmp_REAL(hint, "verystrict") == @as(c_int, 0)) {
            return TruncVeryStrict;
        } else if (SDL_strcmp_REAL(hint, "strict") == @as(c_int, 0)) {
            return TruncStrict;
        } else if (SDL_strcmp_REAL(hint, "dropframe") == @as(c_int, 0)) {
            return TruncDropFrame;
        } else if (SDL_strcmp_REAL(hint, "dropblock") == @as(c_int, 0)) {
            return TruncDropBlock;
        }
    }
    return TruncNoHint;
}
pub fn WaveGetFactChunkHint() callconv(.c) WaveFactChunkHint {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_WAVE_FACT_CHUNK");
    _ = &hint;
    if (hint != null) {
        if (SDL_strcmp_REAL(hint, "truncate") == @as(c_int, 0)) {
            return FactTruncate;
        } else if (SDL_strcmp_REAL(hint, "strict") == @as(c_int, 0)) {
            return FactStrict;
        } else if (SDL_strcmp_REAL(hint, "ignorezero") == @as(c_int, 0)) {
            return FactIgnoreZero;
        } else if (SDL_strcmp_REAL(hint, "ignore") == @as(c_int, 0)) {
            return FactIgnore;
        }
    }
    return FactNoHint;
}
pub fn WaveFreeChunkData(chunk: [*c]WaveChunk) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (chunk.*.data != null) {
        SDL_free_REAL(@ptrCast(@alignCast(chunk.*.data)));
        chunk.*.data = null;
    }
    chunk.*.size = 0;
}
pub fn WaveNextChunk(src: ?*SDL_IOStream, chunk: [*c]WaveChunk) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var chunkheader: [2]Uint32 = undefined;
    _ = &chunkheader;
    var nextposition: Sint64 = chunk.*.position + @as(Sint64, chunk.*.length);
    _ = &nextposition;
    WaveFreeChunkData(chunk);
    if (((@as(c_long, 9223372036854775807) - @as(c_long, chunk.*.length)) < chunk.*.position) or ((@as(c_long, 9223372036854775807) - @as(c_long, 8)) < nextposition)) {
        return -@as(c_int, 1);
    }
    if ((chunk.*.length & @as(Uint32, 1)) != 0) {
        nextposition += 1;
    }
    if (SDL_SeekIO_REAL(src, nextposition, SDL_IO_SEEK_SET) != nextposition) {
        return -@as(c_int, 2);
    } else if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint32, @ptrCast(@alignCast(&chunkheader))))), @sizeOf(Uint32) *% @as(c_ulong, 2)) != (@sizeOf(Uint32) *% @as(c_ulong, 2))) {
        return -@as(c_int, 1);
    }
    chunk.*.fourcc = chunkheader[@as(c_int, 0)];
    chunk.*.length = chunkheader[@as(c_int, 1)];
    chunk.*.position = nextposition + @as(Sint64, 8);
    return 0;
}
pub fn WaveReadPartialChunkData(src: ?*SDL_IOStream, chunk: [*c]WaveChunk, arg_length: usize) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var length = arg_length;
    _ = &length;
    WaveFreeChunkData(chunk);
    if (length > @as(usize, chunk.*.length)) {
        length = chunk.*.length;
    }
    if (length > @as(usize, 0)) {
        chunk.*.data = @ptrCast(@alignCast(SDL_malloc_REAL(length)));
        if (!(chunk.*.data != null)) {
            return -@as(c_int, 1);
        }
        if (SDL_SeekIO_REAL(src, chunk.*.position, SDL_IO_SEEK_SET) != chunk.*.position) {
            return -@as(c_int, 2);
        }
        chunk.*.size = SDL_ReadIO_REAL(src, @ptrCast(@alignCast(chunk.*.data)), length);
        if (chunk.*.size != length) {}
    }
    return 0;
}
pub fn WaveReadChunkData(src: ?*SDL_IOStream, chunk: [*c]WaveChunk) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WaveReadPartialChunkData(src, chunk, chunk.*.length);
}
pub const struct_WaveExtensibleGUID = extern struct {
    encoding: Uint16 = 0,
    guid: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const WaveExtensibleGUID = struct_WaveExtensibleGUID;
pub var extensible_guids: [6]WaveExtensibleGUID = [6]WaveExtensibleGUID{
    WaveExtensibleGUID{
        .encoding = PCM_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(PCM_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(PCM_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
    WaveExtensibleGUID{
        .encoding = MS_ADPCM_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(MS_ADPCM_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(MS_ADPCM_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
    WaveExtensibleGUID{
        .encoding = IEEE_FLOAT_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(IEEE_FLOAT_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(IEEE_FLOAT_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
    WaveExtensibleGUID{
        .encoding = ALAW_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(ALAW_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(ALAW_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
    WaveExtensibleGUID{
        .encoding = MULAW_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(MULAW_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(MULAW_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
    WaveExtensibleGUID{
        .encoding = IMA_ADPCM_CODE,
        .guid = [16]Uint8{
            @bitCast(@as(i8, @truncate(IMA_ADPCM_CODE & @as(c_int, 255)))),
            @bitCast(@as(i8, @truncate(IMA_ADPCM_CODE >> @intCast(@as(c_int, 8))))),
            0,
            0,
            0,
            0,
            16,
            0,
            128,
            0,
            0,
            170,
            0,
            56,
            155,
            113,
        },
    },
};
pub fn WaveGetFormatGUIDEncoding(format: [*c]WaveFormat) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < (@sizeOf(@TypeOf(extensible_guids)) / @sizeOf(@TypeOf(extensible_guids[@as(c_int, 0)])))) : (i +%= 1) {
            if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&format.*.subformat))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&extensible_guids[i].guid))))), 16) == @as(c_int, 0)) {
                return extensible_guids[i].encoding;
            }
        }
    }
    return UNKNOWN_CODE;
}
pub fn WaveReadFormat(file: [*c]WaveFile) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var chunk: [*c]WaveChunk = &file.*.chunk;
    _ = &chunk;
    var format: [*c]WaveFormat = &file.*.format;
    _ = &format;
    var fmtsrc: ?*SDL_IOStream = undefined;
    _ = &fmtsrc;
    var fmtlen: usize = chunk.*.size;
    _ = &fmtlen;
    if (fmtlen > @as(usize, @bitCast(@as(c_long, @as(c_int, 2147483647))))) {
        return SDL_SetError_REAL("Data of WAVE fmt chunk too big");
    }
    fmtsrc = SDL_IOFromConstMem_REAL(@ptrCast(@alignCast(chunk.*.data)), @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(chunk.*.size)))))));
    if (!(fmtsrc != null)) {
        return @"false" != 0;
    }
    if ((((!SDL_ReadU16LE_REAL(fmtsrc, &format.*.formattag) or !SDL_ReadU16LE_REAL(fmtsrc, &format.*.channels)) or !SDL_ReadU32LE_REAL(fmtsrc, &format.*.frequency)) or !SDL_ReadU32LE_REAL(fmtsrc, &format.*.byterate)) or !SDL_ReadU16LE_REAL(fmtsrc, &format.*.blockalign)) {
        return @"false" != 0;
    }
    format.*.encoding = format.*.formattag;
    if (fmtlen >= @as(usize, 16)) {
        if (!SDL_ReadU16LE_REAL(fmtsrc, &format.*.bitspersample)) {
            return @"false" != 0;
        }
    } else if (@as(c_int, format.*.encoding) == PCM_CODE) {
        _ = SDL_CloseIO_REAL(fmtsrc);
        return SDL_SetError_REAL("Missing wBitsPerSample field in WAVE fmt chunk");
    }
    if (fmtlen >= @as(usize, 18)) {
        if (!SDL_ReadU16LE_REAL(fmtsrc, &format.*.extsize)) {
            return @"false" != 0;
        }
    }
    if (@as(c_int, format.*.formattag) == EXTENSIBLE_CODE) {
        if ((fmtlen < @as(usize, 40)) or (@as(c_int, format.*.extsize) < @as(c_int, 22))) {
            _ = SDL_CloseIO_REAL(fmtsrc);
            return SDL_SetError_REAL("Extensible WAVE header too small");
        }
        if ((!SDL_ReadU16LE_REAL(fmtsrc, &format.*.validsamplebits) or !SDL_ReadU32LE_REAL(fmtsrc, &format.*.channelmask)) or (SDL_ReadIO_REAL(fmtsrc, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&format.*.subformat))))), 16) != @as(usize, 16))) {}
        format.*.samplesperblock = format.*.validsamplebits;
        format.*.encoding = WaveGetFormatGUIDEncoding(format);
    }
    _ = SDL_CloseIO_REAL(fmtsrc);
    return @"true" != 0;
}
pub fn WaveCheckFormat(file: [*c]WaveFile, datalength: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var format: [*c]WaveFormat = undefined;
    _ = &format;
    var hint: WaveFactChunkHint = undefined;
    _ = &hint;
    var samples: Uint32 = undefined;
    _ = &samples;
    var errstr: [*c]const u8 = undefined;
    _ = &errstr;
    var g: [*c]const Uint8 = undefined;
    _ = &g;
    var g1: Uint32 = undefined;
    _ = &g1;
    var g2: Uint32 = undefined;
    _ = &g2;
    var g3: Uint32 = undefined;
    _ = &g3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                format = &file.*.format;
                if (@as(c_int, format.*.channels) == @as(c_int, 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Invalid number of channels");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (format.*.frequency == @as(Uint32, 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Invalid sample rate");
            },
            5 => {
                if (format.*.frequency > @as(Uint32, __INT_MAX__)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if ((file.*.facthint == @as(WaveFactChunkHint, FactStrict)) and (file.*.fact.status == -@as(c_int, 1))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("Sample rate exceeds limit of %d", __INT_MAX__);
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                return SDL_SetError_REAL("Invalid fact chunk in WAVE file");
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                switch (@as(c_int, format.*.encoding)) {
                    IEEE_FLOAT_CODE => {
                        sdl_pc = 14;
                        continue;
                    },
                    ALAW_CODE => {
                        sdl_pc = 15;
                        continue;
                    },
                    MULAW_CODE => {
                        sdl_pc = 16;
                        continue;
                    },
                    MS_ADPCM_CODE => {
                        sdl_pc = 17;
                        continue;
                    },
                    IMA_ADPCM_CODE => {
                        sdl_pc = 18;
                        continue;
                    },
                    PCM_CODE => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            13 => {
                switch (@as(c_int, format.*.encoding)) {
                    PCM_CODE => {
                        sdl_pc = 39;
                        continue;
                    },
                    IEEE_FLOAT_CODE => {
                        sdl_pc = 40;
                        continue;
                    },
                    ALAW_CODE => {
                        sdl_pc = 44;
                        continue;
                    },
                    MULAW_CODE => {
                        sdl_pc = 45;
                        continue;
                    },
                    MS_ADPCM_CODE => {
                        sdl_pc = 49;
                        continue;
                    },
                    IMA_ADPCM_CODE => {
                        sdl_pc = 53;
                        continue;
                    },
                    MPEG_CODE => {
                        sdl_pc = 57;
                        continue;
                    },
                    MPEGLAYER3_CODE => {
                        sdl_pc = 58;
                        continue;
                    },
                    else => {
                        sdl_pc = 59;
                        continue;
                    },
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if ((file.*.facthint == @as(WaveFactChunkHint, FactStrict)) and (file.*.fact.status <= @as(c_int, 0))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                return SDL_SetError_REAL("Missing fact chunk in WAVE file");
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (file.*.chunk.size < @as(usize, 16)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return SDL_SetError_REAL("Missing wBitsPerSample field in WAVE fmt chunk");
            },
            24 => {
                if (@as(c_int, format.*.bitspersample) == @as(c_int, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                if (@as(c_int, format.*.blockalign) == @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            26 => {
                return SDL_SetError_REAL("Invalid bits per sample");
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                format.*.blockalign = 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (file.*.fact.status == @as(c_int, 1)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                hint = file.*.facthint;
                samples = file.*.fact.samplelength;
                if (((hint == @as(WaveFactChunkHint, FactTruncate)) or (hint == @as(WaveFactChunkHint, FactStrict))) or ((hint == @as(WaveFactChunkHint, FactIgnoreZero)) and (samples > @as(Uint32, 0)))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            35 => {
                file.*.fact.status = 2;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                return @"true" != 0;
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (!PCM_Init(file, datalength)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                return @"false" != 0;
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (!LAW_Init(file, datalength)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                return @"false" != 0;
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            49 => {
                if (!MS_ADPCM_Init(file, datalength)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                return @"false" != 0;
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            53 => {
                if (!IMA_ADPCM_Init(file, datalength)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                return @"false" != 0;
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                return SDL_SetError_REAL("MPEG formats not supported");
            },
            59 => {
                if (@as(c_int, format.*.formattag) == EXTENSIBLE_CODE) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                errstr = "Unknown WAVE format GUID: %08x-%04x-%04x-%02x%02x%02x%02x%02x%02x%02x%02x";
                g = @ptrCast(@alignCast(&format.*.subformat));
                g1 = ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, g[@as(c_int, 0)])))) | (@as(Uint32, g[@as(c_int, 1)]) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, g[@as(c_int, 2)]) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, g[@as(c_int, 3)]) << @intCast(@as(Uint32, 24)));
                g2 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, g[@as(c_int, 4)])))) | (@as(Uint32, g[@as(c_int, 5)]) << @intCast(@as(Uint32, 8)));
                g3 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, g[@as(c_int, 6)])))) | (@as(Uint32, g[@as(c_int, 7)]) << @intCast(@as(Uint32, 8)));
                return SDL_SetError_REAL(errstr, g1, g2, g3, g[@as(c_int, 8)], g[@as(c_int, 9)], g[@as(c_int, 10)], g[@as(c_int, 11)], g[@as(c_int, 12)], g[@as(c_int, 13)], g[@as(c_int, 14)], g[@as(c_int, 15)]);
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                return SDL_SetError_REAL("Unknown WAVE format tag: 0x%04x", @as(c_uint, format.*.encoding));
            },
            else => unreachable,
        }
    }
}
pub fn WaveLoad(src: ?*SDL_IOStream, file: [*c]WaveFile, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]Uint8, audio_len: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: c_int = undefined;
    _ = &result;
    var chunkcount: Uint32 = undefined;
    _ = &chunkcount;
    var chunkcountlimit: Uint32 = undefined;
    _ = &chunkcountlimit;
    var flen: Sint64 = undefined;
    _ = &flen;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var RIFFstart: Sint64 = undefined;
    _ = &RIFFstart;
    var RIFFend: Sint64 = undefined;
    _ = &RIFFend;
    var lastchunkpos: Sint64 = undefined;
    _ = &lastchunkpos;
    var RIFFlengthknown: bool = undefined;
    _ = &RIFFlengthknown;
    var format: [*c]WaveFormat = undefined;
    _ = &format;
    var chunk: [*c]WaveChunk = undefined;
    _ = &chunk;
    var RIFFchunk: WaveChunk = undefined;
    _ = &RIFFchunk;
    var fmtchunk: WaveChunk = undefined;
    _ = &fmtchunk;
    var datachunk: WaveChunk = undefined;
    _ = &datachunk;
    var count: c_uint = undefined;
    _ = &count;
    var formtype: Uint32 = undefined;
    _ = &formtype;
    var position: Sint64 = undefined;
    _ = &position;
    var tmp: Uint8 = undefined;
    _ = &tmp;
    var position_1: Uint64 = undefined;
    _ = &position_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                chunkcount = 0;
                chunkcountlimit = 10000;
                flen = SDL_GetIOSize_REAL(src);
                RIFFlengthknown = @"false" != 0;
                format = &file.*.format;
                chunk = &file.*.chunk;
                _ = memset(@ptrCast(@alignCast(&RIFFchunk)), 0, @sizeOf(@TypeOf(RIFFchunk)));
                _ = memset(@ptrCast(@alignCast(&fmtchunk)), 0, @sizeOf(@TypeOf(fmtchunk)));
                _ = memset(@ptrCast(@alignCast(&datachunk)), 0, @sizeOf(@TypeOf(datachunk)));
                hint = SDL_GetHint_REAL("SDL_WAVE_CHUNK_LIMIT");
                if (hint != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (SDL_sscanf_REAL(hint, "%u", &count) == @as(c_int, 1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                RIFFstart = SDL_TellIO_REAL(src);
                if (RIFFstart < @as(Sint64, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                chunkcountlimit = if (count <= @as(c_uint, 4294967295)) count else @as(c_uint, 4294967295);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("Could not seek in file");
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                RIFFchunk.position = RIFFstart;
                if (WaveNextChunk(src, &RIFFchunk) < @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return SDL_SetError_REAL("Could not read RIFF header");
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (RIFFchunk.fourcc == @as(Uint32, RIFF)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                if (!SDL_ReadU32LE_REAL(src, &formtype)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (RIFFchunk.fourcc == @as(Uint32, WAVE)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            15 => {
                chunk.*.position = RIFFchunk.position + @as(Sint64, 4);
                switch (file.*.riffhint) {
                    @as(WaveRiffSizeHint, RiffSizeIgnore) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(WaveRiffSizeHint, RiffSizeIgnoreZero) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(WaveRiffSizeHint, RiffSizeForce) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(WaveRiffSizeHint, RiffSizeMaximum) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            16 => {
                return SDL_SetError_REAL("Could not read RIFF form type");
            },
            17 => {
                if (formtype != @as(Uint32, WAVE)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                return SDL_SetError_REAL("RIFF form type is not WAVE (not a Waveform file)");
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                RIFFchunk.position = 0;
                RIFFchunk.length = 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return SDL_SetError_REAL("Could not find RIFF or WAVE identifiers (not a Waveform file)");
            },
            24 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            26 => {
                RIFFend = RIFFchunk.position + @as(Sint64, @as(c_uint, 4294967295));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (RIFFchunk.length == @as(Uint32, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                RIFFend = RIFFchunk.position + @as(Sint64, @as(c_uint, 4294967295));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                RIFFend = RIFFchunk.position + @as(Sint64, RIFFchunk.length);
                RIFFlengthknown = @"true" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
                RIFFend = 9223372036854775807;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            34 => {
                if (@as(Uint64, @bitCast(@as(c_long, RIFFend))) > ((@as(Uint64, @bitCast(@as(c_long, chunk.*.position))) +% @as(Uint64, chunk.*.length)) +% @as(Uint64, chunk.*.length & @as(Uint32, 1)))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                if ((blk: {
                    const ref = &chunkcount;
                    const tmp_1 = ref.*;
                    ref.* +%= 1;
                    break :blk tmp_1;
                }) >= chunkcountlimit) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                lastchunkpos = chunk.*.position + @as(Sint64, chunk.*.length);
                if (fmtchunk.fourcc != @as(Uint32, FMT)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            37 => {
                return SDL_SetError_REAL("Chunk count in WAVE file exceeds limit of %u", chunkcountlimit);
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                result = WaveNextChunk(src, chunk);
                if (result < @as(c_int, 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                if (file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                if (result == -@as(c_int, 2)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            42 => {
                if (chunk.*.fourcc == @as(Uint32, FMT)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            43 => {
                return SDL_SetError_REAL("Unexpected end of WAVE file");
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            46 => {
                return SDL_SetError_REAL("Could not seek to WAVE chunk header");
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            49 => {
                if (fmtchunk.fourcc == @as(Uint32, FMT)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            50 => {
                if (chunk.*.fourcc == @as(Uint32, DATA)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            51 => {
                if (file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                if (datachunk.fourcc == @as(Uint32, DATA)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                return SDL_SetError_REAL("fmt chunk after data chunk in WAVE file");
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                fmtchunk = chunk.*;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                if ((flen > @as(Sint64, 0)) and ((chunk.*.position + @as(Sint64, chunk.*.length)) > flen)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            59 => {
                if (chunk.*.fourcc == @as(Uint32, FACT)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            61 => {
                chunk.*.length = @bitCast(@as(c_int, @truncate(flen - chunk.*.position)));
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                if (datachunk.fourcc != @as(Uint32, DATA)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                datachunk = chunk.*;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            67 => {
                if (file.*.fact.status == @as(c_int, 0)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            70 => {
                if (chunk.*.length < @as(Uint32, 4)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            73 => {
                file.*.fact.status = -@as(c_int, 1);
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                position = SDL_SeekIO_REAL(src, chunk.*.position, SDL_IO_SEEK_SET);
                if ((position == chunk.*.position) and SDL_ReadU32LE_REAL(src, &file.*.fact.samplelength)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                file.*.fact.status = 1;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                file.*.fact.status = -@as(c_int, 1);
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                if (@as(Uint64, @bitCast(@as(c_long, RIFFend))) < (@as(Uint64, @bitCast(@as(c_long, chunk.*.position))) +% @as(Uint64, chunk.*.length))) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            80 => {
                if ((fmtchunk.fourcc == @as(Uint32, FMT)) and (datachunk.fourcc == @as(Uint32, DATA))) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            82 => {
                return SDL_SetError_REAL("RIFF size truncates chunk");
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            85 => {
                if (((file.*.fact.status == @as(c_int, 1)) or (file.*.facthint == @as(WaveFactChunkHint, FactIgnore))) or (file.*.facthint == @as(WaveFactChunkHint, FactNoHint))) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                return SDL_SetError_REAL("Missing fmt chunk in WAVE file");
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (datachunk.fourcc != @as(Uint32, DATA)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                return SDL_SetError_REAL("Missing data chunk in WAVE file");
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                if (file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                if ((chunk.*.fourcc != @as(Uint32, DATA)) and (chunk.*.length > @as(Uint32, 0))) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                chunk.* = fmtchunk;
                if (WaveReadPartialChunkData(src, chunk, 1046) < @as(c_int, 0)) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            100 => {
                position_1 = (@as(Uint64, @bitCast(@as(c_long, chunk.*.position))) +% @as(Uint64, chunk.*.length)) -% @as(Uint64, 1);
                if ((position_1 > @as(Uint64, 9223372036854775807)) or (SDL_SeekIO_REAL(src, @bitCast(@as(c_ulong, @truncate(position_1))), SDL_IO_SEEK_SET) != @as(Sint64, @bitCast(@as(c_ulong, @truncate(position_1)))))) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            103 => {
                return SDL_SetError_REAL("Could not seek to WAVE chunk data");
            },
            104 => {
                if (!SDL_ReadU8_REAL(src, &tmp)) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                return SDL_SetError_REAL("RIFF size truncates chunk");
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            109 => {
                return SDL_SetError_REAL("Could not read data of WAVE fmt chunk");
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                if (chunk.*.length < @as(Uint32, 14)) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                return SDL_SetError_REAL("Invalid WAVE fmt chunk length (too small)");
            },
            113 => {
                if (chunk.*.size < @as(usize, 14)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            114 => {
                WaveFreeChunkData(chunk);
                chunk.* = datachunk;
                if (chunk.*.length > @as(Uint32, 0)) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            115 => {
                return SDL_SetError_REAL("Could not read data of WAVE fmt chunk");
            },
            116 => {
                if (!WaveReadFormat(file)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            118 => {
                return @"false" != 0;
            },
            119 => {
                if (!WaveCheckFormat(file, datachunk.length)) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            121 => {
                return @"false" != 0;
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            124 => {
                result = WaveReadChunkData(src, chunk);
                if (result < @as(c_int, 0)) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                if (@as(usize, chunk.*.length) != chunk.*.size) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            127 => {
                return @"false" != 0;
            },
            128 => {
                if (result == -@as(c_int, 2)) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            130 => {
                return SDL_SetError_REAL("Could not seek data of WAVE data chunk");
            },
            131 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            133 => {
                if ((file.*.trunchint == @as(WaveTruncationHint, TruncVeryStrict)) or (file.*.trunchint == @as(WaveTruncationHint, TruncStrict))) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                switch (@as(c_int, format.*.encoding)) {
                    PCM_CODE => {
                        sdl_pc = 140;
                        continue;
                    },
                    IEEE_FLOAT_CODE => {
                        sdl_pc = 141;
                        continue;
                    },
                    ALAW_CODE => {
                        sdl_pc = 145;
                        continue;
                    },
                    MULAW_CODE => {
                        sdl_pc = 146;
                        continue;
                    },
                    MS_ADPCM_CODE => {
                        sdl_pc = 150;
                        continue;
                    },
                    IMA_ADPCM_CODE => {
                        sdl_pc = 154;
                        continue;
                    },
                    else => {
                        sdl_pc = 139;
                        continue;
                    },
                }
            },
            136 => {
                return SDL_SetError_REAL("Could not read data of WAVE data chunk");
            },
            137 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            139 => {
                spec.*.freq = @bitCast(@as(c_uint, @truncate(format.*.frequency)));
                spec.*.channels = @as(Uint8, @truncate(format.*.channels));
                spec.*.format = SDL_AUDIO_UNKNOWN;
                switch (@as(c_int, format.*.encoding)) {
                    MS_ADPCM_CODE => {
                        sdl_pc = 159;
                        continue;
                    },
                    IMA_ADPCM_CODE => {
                        sdl_pc = 160;
                        continue;
                    },
                    ALAW_CODE => {
                        sdl_pc = 161;
                        continue;
                    },
                    MULAW_CODE => {
                        sdl_pc = 162;
                        continue;
                    },
                    IEEE_FLOAT_CODE => {
                        sdl_pc = 163;
                        continue;
                    },
                    PCM_CODE => {
                        sdl_pc = 164;
                        continue;
                    },
                    else => {
                        sdl_pc = 171;
                        continue;
                    },
                }
            },
            140 => {
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            141 => {
                if (!PCM_Decode(file, audio_buf, audio_len)) {
                    sdl_pc = 142;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            142 => {
                return @"false" != 0;
            },
            143 => {
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                if (!LAW_Decode(file, audio_buf, audio_len)) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                return @"false" != 0;
            },
            148 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            150 => {
                if (!MS_ADPCM_Decode(file, audio_buf, audio_len)) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                return @"false" != 0;
            },
            152 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            154 => {
                if (!IMA_ADPCM_Decode(file, audio_buf, audio_len)) {
                    sdl_pc = 155;
                    continue;
                } else {
                    sdl_pc = 156;
                    continue;
                }
            },
            155 => {
                return @"false" != 0;
            },
            156 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            158 => {
                if (RIFFlengthknown) {
                    sdl_pc = 172;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            159 => {
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                spec.*.format = SDL_AUDIO_S16;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            163 => {
                spec.*.format = SDL_AUDIO_F32LE;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            164 => {
                switch (@as(c_int, format.*.bitspersample)) {
                    @as(c_int, 8) => {
                        sdl_pc = 166;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 167;
                        continue;
                    },
                    @as(c_int, 24) => {
                        sdl_pc = 168;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 169;
                        continue;
                    },
                    else => {
                        sdl_pc = 170;
                        continue;
                    },
                }
            },
            165 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            166 => {
                spec.*.format = SDL_AUDIO_U8;
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            167 => {
                spec.*.format = SDL_AUDIO_S16LE;
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                spec.*.format = SDL_AUDIO_S32LE;
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            170 => {
                return SDL_SetError_REAL("Unexpected %u-bit PCM data format", @as(c_uint, format.*.bitspersample));
            },
            171 => {
                return SDL_SetError_REAL("Unexpected data format");
            },
            172 => {
                chunk.*.position = RIFFend;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            173 => {
                chunk.*.position = lastchunkpos;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            174 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
