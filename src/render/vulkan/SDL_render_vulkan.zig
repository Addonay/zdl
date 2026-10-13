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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
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
pub extern fn SDL_cosf_REAL(x: f32) f32;
pub extern fn SDL_fabs_REAL(x: f64) f64;
pub extern fn SDL_sinf_REAL(x: f32) f32;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_CopyProperties_REAL(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_BlendMode = Uint32;
pub const SDL_BLENDOPERATION_ADD: c_int = 1;
pub const SDL_BLENDOPERATION_SUBTRACT: c_int = 2;
pub const SDL_BLENDOPERATION_REV_SUBTRACT: c_int = 3;
pub const SDL_BLENDOPERATION_MINIMUM: c_int = 4;
pub const SDL_BLENDOPERATION_MAXIMUM: c_int = 5;
pub const enum_SDL_BlendOperation = c_uint;
pub const SDL_BlendOperation = enum_SDL_BlendOperation;
pub const SDL_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR: c_int = 4;
pub const SDL_BLENDFACTOR_SRC_ALPHA: c_int = 5;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 6;
pub const SDL_BLENDFACTOR_DST_COLOR: c_int = 7;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR: c_int = 8;
pub const SDL_BLENDFACTOR_DST_ALPHA: c_int = 9;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA: c_int = 10;
pub const enum_SDL_BlendFactor = c_uint;
pub const SDL_BlendFactor = enum_SDL_BlendFactor;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_RGBA4444: c_int = 356651010;
pub const SDL_PIXELFORMAT_ABGR4444: c_int = 359796738;
pub const SDL_PIXELFORMAT_BGRA4444: c_int = 360845314;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGBA5551: c_int = 356782082;
pub const SDL_PIXELFORMAT_BGRA5551: c_int = 360976386;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_BGR565: c_int = 357896194;
pub const SDL_PIXELFORMAT_ABGR2101010: c_int = 376905732;
pub const SDL_PIXELFORMAT_RGBA64_FLOAT: c_int = 438321160;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_I444: c_int = 875836489;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_EXTERNAL_OES: c_int = 542328143;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_PRIMARIES_BT2020: c_int = 9;
pub const enum_SDL_ColorPrimaries = c_uint;
pub const SDL_ColorPrimaries = enum_SDL_ColorPrimaries;
pub const SDL_TRANSFER_CHARACTERISTICS_PQ: c_int = 16;
pub const enum_SDL_TransferCharacteristics = c_uint;
pub const SDL_TransferCharacteristics = enum_SDL_TransferCharacteristics;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_SRGB_LINEAR: c_int = 301991168;
pub const SDL_COLORSPACE_HDR10: c_int = 301999616;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_FColor = extern struct {
    r: f32 = 0,
    g: f32 = 0,
    b: f32 = 0,
    a: f32 = 0,
};
pub const SDL_FColor = struct_SDL_FColor;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_FPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const struct_SDL_FRect = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
};
pub const SDL_FRect = struct_SDL_FRect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const SDL_SCALEMODE_PIXELART: c_int = 2;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
pub const enum_SDL_FlipMode = c_uint;
pub const SDL_FlipMode = enum_SDL_FlipMode;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub const SDL_CameraID = Uint32;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_DisplayModeData = opaque {};
pub const SDL_DisplayModeData = struct_SDL_DisplayModeData;
pub const struct_SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixel_density: f32 = 0,
    refresh_rate: f32 = 0,
    refresh_rate_numerator: c_int = 0,
    refresh_rate_denominator: c_int = 0,
    internal: ?*SDL_DisplayModeData = null,
};
pub const SDL_DisplayMode = struct_SDL_DisplayMode;
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_RENDER_DEVICE_RESET: c_int = 8193;
pub const SDL_EVENT_RENDER_DEVICE_LOST: c_int = 8194;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const SDL_TEXTUREACCESS_TARGET: c_int = 2;
pub const enum_SDL_TextureAccess = c_uint;
pub const SDL_TextureAccess = enum_SDL_TextureAccess;
pub const enum_SDL_RendererLogicalPresentation = c_uint;
pub const SDL_RendererLogicalPresentation = enum_SDL_RendererLogicalPresentation;
pub const struct_SDL_RenderViewState = extern struct {
    pixel_w: c_int = 0,
    pixel_h: c_int = 0,
    viewport: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    pixel_viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    clip_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    pixel_clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    clipping_enabled: bool = false,
    scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    logical_presentation_mode: SDL_RendererLogicalPresentation = @import("std").mem.zeroes(SDL_RendererLogicalPresentation),
    logical_w: c_int = 0,
    logical_h: c_int = 0,
    logical_src_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    logical_dst_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    logical_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    logical_offset: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    current_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
};
pub const SDL_RenderViewState = struct_SDL_RenderViewState;
pub const struct_SDL_TexturePalette = extern struct {
    refcount: c_int = 0,
    version: Uint32 = 0,
    last_command_generation: Uint32 = 0,
    internal: ?*anyopaque = null,
};
pub const SDL_TexturePalette = struct_SDL_TexturePalette;
pub const struct_SDL_SW_YUVTexture = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    target_format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixels: [*c]Uint8 = null,
    pitches: [3]c_int = @import("std").mem.zeroes([3]c_int),
    planes: [3][*c]Uint8 = @import("std").mem.zeroes([3][*c]Uint8),
    stretch: [*c]SDL_Surface = null,
    display: [*c]SDL_Surface = null,
};
pub const SDL_SW_YUVTexture = struct_SDL_SW_YUVTexture;
pub const struct_SDL_Texture = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    refcount: c_int = 0,
    renderer: [*c]SDL_Renderer = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    SDR_white_point: f32 = 0,
    HDR_headroom: f32 = 0,
    access: SDL_TextureAccess = @import("std").mem.zeroes(SDL_TextureAccess),
    blendMode: SDL_BlendMode = 0,
    scaleMode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    view: SDL_RenderViewState = @import("std").mem.zeroes(SDL_RenderViewState),
    public_palette: [*c]SDL_Palette = null,
    palette: [*c]SDL_TexturePalette = null,
    palette_version: Uint32 = 0,
    palette_surface: [*c]SDL_Surface = null,
    native: [*c]SDL_Texture = null,
    yuv: [*c]SDL_SW_YUVTexture = null,
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    locked_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    locked_surface: [*c]SDL_Surface = null,
    last_command_generation: Uint32 = 0,
    props: SDL_PropertiesID = 0,
    internal: ?*anyopaque = null,
    prev: [*c]SDL_Texture = null,
    next: [*c]SDL_Texture = null,
};
pub const SDL_Texture = struct_SDL_Texture;
const struct_unnamed_9 = extern struct {
    first: usize = 0,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
const struct_unnamed_10 = extern struct {
    enabled: bool = false,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const SDL_TEXTURE_ADDRESS_CLAMP: c_int = 1;
pub const SDL_TEXTURE_ADDRESS_WRAP: c_int = 2;
pub const enum_SDL_TextureAddressMode = c_int;
pub const SDL_TextureAddressMode = enum_SDL_TextureAddressMode;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    sampler: ?*SDL_GPUSampler = null,
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
pub const struct_SDL_GPURenderStateUniformBuffer = extern struct {
    slot_index: Uint32 = 0,
    data: ?*anyopaque = null,
    length: Uint32 = 0,
};
pub const SDL_GPURenderStateUniformBuffer = struct_SDL_GPURenderStateUniformBuffer;
pub const struct_SDL_GPURenderState = extern struct {
    renderer: [*c]SDL_Renderer = null,
    last_command_generation: Uint32 = 0,
    fragment_shader: ?*SDL_GPUShader = null,
    num_sampler_bindings: c_int = 0,
    sampler_bindings: [*c]SDL_GPUTextureSamplerBinding = null,
    num_storage_textures: c_int = 0,
    storage_textures: [*c]?*SDL_GPUTexture = null,
    num_storage_buffers: c_int = 0,
    storage_buffers: [*c]?*SDL_GPUBuffer = null,
    num_uniform_buffers: c_int = 0,
    uniform_buffers: [*c]SDL_GPURenderStateUniformBuffer = null,
};
pub const SDL_GPURenderState = struct_SDL_GPURenderState;
const struct_unnamed_11 = extern struct {
    first: usize = 0,
    count: usize = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    blend: SDL_BlendMode = 0,
    texture: [*c]SDL_Texture = null,
    texture_scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    gpu_render_state: [*c]SDL_GPURenderState = null,
};
const struct_unnamed_12 = extern struct {
    first: usize = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
const union_unnamed_8 = extern union {
    viewport: struct_unnamed_9,
    cliprect: struct_unnamed_10,
    draw: struct_unnamed_11,
    color: struct_unnamed_12,
};
pub const struct_SDL_RenderCommand = extern struct {
    command: SDL_RenderCommandType = @import("std").mem.zeroes(SDL_RenderCommandType),
    data: union_unnamed_8 = @import("std").mem.zeroes(union_unnamed_8),
    next: [*c]struct_SDL_RenderCommand = null,
};
pub const SDL_RenderCommand = struct_SDL_RenderCommand;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_SDL_Renderer = extern struct {
    WindowEvent: ?*const fn (renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void = null,
    GetOutputSize: ?*const fn (renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) callconv(.c) bool = null,
    SupportsBlendMode: ?*const fn (renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool = null,
    CreateTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool = null,
    QueueSetViewport: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand) callconv(.c) bool = null,
    QueueSetDrawColor: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand) callconv(.c) bool = null,
    QueueDrawPoints: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool = null,
    QueueDrawLines: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool = null,
    QueueFillRects: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, rects: [*c]const SDL_FRect, count: c_int) callconv(.c) bool = null,
    QueueCopy: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) callconv(.c) bool = null,
    QueueCopyEx: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, srcquad: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode, scale_x: f32, scale_y: f32) callconv(.c) bool = null,
    QueueGeometry: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool = null,
    InvalidateCachedState: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) void = null,
    RunCommandQueue: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, vertsize: usize) callconv(.c) bool = null,
    CreatePalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool = null,
    UpdatePalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool = null,
    DestroyPalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void = null,
    ChangeTexturePalette: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool = null,
    UpdateTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool = null,
    UpdateTextureYUV: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool = null,
    UpdateTextureNV: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool = null,
    LockTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool = null,
    UnlockTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void = null,
    SetRenderTarget: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool = null,
    RenderReadPixels: ?*const fn (renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface = null,
    RenderPresent: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) bool = null,
    DestroyTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void = null,
    DestroyRenderer: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) void = null,
    SetVSync: ?*const fn (renderer: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool = null,
    GetMetalLayer: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) ?*anyopaque = null,
    GetMetalCommandEncoder: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) ?*anyopaque = null,
    AddVulkanRenderSemaphores: ?*const fn (renderer: [*c]SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) callconv(.c) bool = null,
    name: [*c]const u8 = null,
    texture_formats: [*c]SDL_PixelFormat = null,
    num_texture_formats: c_int = 0,
    software: bool = false,
    npot_texture_wrap_unsupported: bool = false,
    window: [*c]SDL_Window = null,
    hidden: bool = false,
    wanted_vsync: bool = false,
    simulate_vsync: bool = false,
    simulate_vsync_interval_ns: Uint64 = 0,
    last_present: Uint64 = 0,
    view: [*c]SDL_RenderViewState = null,
    main_view: SDL_RenderViewState = @import("std").mem.zeroes(SDL_RenderViewState),
    dpi_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    line_method: SDL_RenderLineMethod = @import("std").mem.zeroes(SDL_RenderLineMethod),
    scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    textures: [*c]SDL_Texture = null,
    target: [*c]SDL_Texture = null,
    target_mutex: ?*SDL_Mutex = null,
    palettes: ?*SDL_HashTable = null,
    current_colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    output_colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    SDR_white_point: f32 = 0,
    HDR_headroom: f32 = 0,
    desired_color_scale: f32 = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    blendMode: SDL_BlendMode = 0,
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    gpu_render_state: [*c]SDL_GPURenderState = null,
    render_commands: [*c]SDL_RenderCommand = null,
    render_commands_tail: [*c]SDL_RenderCommand = null,
    render_commands_pool: [*c]SDL_RenderCommand = null,
    render_command_generation: Uint32 = 0,
    last_queued_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    last_queued_color_scale: f32 = 0,
    last_queued_viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    last_queued_cliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    last_queued_cliprect_enabled: bool = false,
    color_queued: bool = false,
    viewport_queued: bool = false,
    cliprect_queued: bool = false,
    vertex_data: ?*anyopaque = null,
    vertex_data_used: usize = 0,
    vertex_data_allocation: usize = 0,
    transparent_window: bool = false,
    shape_surface: [*c]SDL_Surface = null,
    shape_texture: [*c]SDL_Texture = null,
    props: SDL_PropertiesID = 0,
    debug_char_texture_atlas: [*c]SDL_Texture = null,
    destroyed: bool = false,
    internal: ?*anyopaque = null,
    next: [*c]SDL_Renderer = null,
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_WindowData = opaque {};
pub const SDL_WindowData = struct_SDL_WindowData;
pub const struct_SDL_Window = extern struct {
    id: SDL_WindowID = 0,
    title: [*c]u8 = null,
    icon: [*c]SDL_Surface = null,
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
    min_w: c_int = 0,
    min_h: c_int = 0,
    max_w: c_int = 0,
    max_h: c_int = 0,
    min_aspect: f32 = 0,
    max_aspect: f32 = 0,
    last_pixel_w: c_int = 0,
    last_pixel_h: c_int = 0,
    flags: SDL_WindowFlags = 0,
    pending_flags: SDL_WindowFlags = 0,
    display_scale: f32 = 0,
    external_graphics_context: bool = false,
    fullscreen_exclusive: bool = false,
    last_fullscreen_exclusive_display: SDL_DisplayID = 0,
    displayID: SDL_DisplayID = 0,
    pending_displayID: SDL_DisplayID = 0,
    windowed: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    floating: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    pending: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    tiled: bool = false,
    undefined_x: bool = false,
    undefined_y: bool = false,
    requested_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    opacity: f32 = 0,
    surface: [*c]SDL_Surface = null,
    surface_valid: bool = false,
    is_hiding: bool = false,
    restore_on_show: bool = false,
    last_position_pending: bool = false,
    last_size_pending: bool = false,
    update_fullscreen_on_display_changed: bool = false,
    constrain_popup: bool = false,
    is_destroying: bool = false,
    is_dropping: bool = false,
    safe_inset_left: c_int = 0,
    safe_inset_right: c_int = 0,
    safe_inset_top: c_int = 0,
    safe_inset_bottom: c_int = 0,
    safe_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_props: SDL_PropertiesID = 0,
    text_input_active: bool = false,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    mouse_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    hit_test: SDL_HitTest = null,
    hit_test_data: ?*anyopaque = null,
    progress_state: SDL_ProgressState = @import("std").mem.zeroes(SDL_ProgressState),
    progress_value: f32 = 0,
    props: SDL_PropertiesID = 0,
    num_renderers: c_int = 0,
    renderers: [*c][*c]SDL_Renderer = null,
    internal: ?*SDL_WindowData = null,
    keyboard_focus: [*c]SDL_Window = null,
    prev: [*c]SDL_Window = null,
    next: [*c]SDL_Window = null,
    parent: [*c]SDL_Window = null,
    first_child: [*c]SDL_Window = null,
    prev_sibling: [*c]SDL_Window = null,
    next_sibling: [*c]SDL_Window = null,
};
pub extern fn SDL_GetWindowID_REAL(window: [*c]SDL_Window) SDL_WindowID;
pub extern fn SDL_GetWindowFlags_REAL(window: [*c]SDL_Window) SDL_WindowFlags;
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetRenderWindow_REAL(renderer: [*c]SDL_Renderer) [*c]SDL_Window;
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetTextureProperties_REAL(texture: [*c]SDL_Texture) SDL_PropertiesID;
pub const VkBool32 = u32;
pub const VkDeviceSize = u64;
pub const VkFlags = u32;
pub const VkSampleMask = u32;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {
};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkDevice_T = opaque {};
pub const VkDevice = ?*struct_VkDevice_T;
pub const struct_VkQueue_T = opaque {};
pub const VkQueue = ?*struct_VkQueue_T;
pub const struct_VkSemaphore_T = opaque {};
pub const VkSemaphore = ?*struct_VkSemaphore_T;
pub const struct_VkCommandBuffer_T = opaque {};
pub const VkCommandBuffer = ?*struct_VkCommandBuffer_T;
pub const struct_VkFence_T = opaque {};
pub const VkFence = ?*struct_VkFence_T;
pub const struct_VkDeviceMemory_T = opaque {};
pub const VkDeviceMemory = ?*struct_VkDeviceMemory_T;
pub const struct_VkBuffer_T = opaque {};
pub const VkBuffer = ?*struct_VkBuffer_T;
pub const struct_VkImage_T = opaque {};
pub const VkImage = ?*struct_VkImage_T;
pub const struct_VkImageView_T = opaque {};
pub const VkImageView = ?*struct_VkImageView_T;
pub const struct_VkCommandPool_T = opaque {};
pub const VkCommandPool = ?*struct_VkCommandPool_T;
pub const struct_VkRenderPass_T = opaque {};
pub const VkRenderPass = ?*struct_VkRenderPass_T;
pub const struct_VkFramebuffer_T = opaque {};
pub const VkFramebuffer = ?*struct_VkFramebuffer_T;
pub const struct_VkBufferView_T = opaque {};
pub const VkBufferView = ?*struct_VkBufferView_T;
pub const struct_VkShaderModule_T = opaque {};
pub const VkShaderModule = ?*struct_VkShaderModule_T;
pub const struct_VkPipelineCache_T = opaque {};
pub const VkPipelineCache = ?*struct_VkPipelineCache_T;
pub const struct_VkPipeline_T = opaque {};
pub const VkPipeline = ?*struct_VkPipeline_T;
pub const struct_VkPipelineLayout_T = opaque {};
pub const VkPipelineLayout = ?*struct_VkPipelineLayout_T;
pub const struct_VkDescriptorSetLayout_T = opaque {};
pub const VkDescriptorSetLayout = ?*struct_VkDescriptorSetLayout_T;
pub const struct_VkSampler_T = opaque {};
pub const VkSampler = ?*struct_VkSampler_T;
pub const struct_VkDescriptorSet_T = opaque {};
pub const VkDescriptorSet = ?*struct_VkDescriptorSet_T;
pub const struct_VkDescriptorPool_T = opaque {};
pub const VkDescriptorPool = ?*struct_VkDescriptorPool_T;
pub const VK_SUCCESS: c_int = 0;
pub const VK_ERROR_OUT_OF_DEVICE_MEMORY: c_int = -2;
pub const VK_ERROR_DEVICE_LOST: c_int = -4;
pub const VK_ERROR_UNKNOWN: c_int = -13;
pub const VK_ERROR_SURFACE_LOST_KHR: c_int = -1000000000;
pub const VK_SUBOPTIMAL_KHR: c_int = 1000001003;
pub const VK_ERROR_OUT_OF_DATE_KHR: c_int = -1000001004;
pub const enum_VkResult = c_int;
pub const VkResult = enum_VkResult;
pub const VK_STRUCTURE_TYPE_APPLICATION_INFO: c_int = 0;
pub const VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO: c_int = 1;
pub const VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO: c_int = 2;
pub const VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO: c_int = 3;
pub const VK_STRUCTURE_TYPE_SUBMIT_INFO: c_int = 4;
pub const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO: c_int = 5;
pub const VK_STRUCTURE_TYPE_FENCE_CREATE_INFO: c_int = 8;
pub const VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO: c_int = 9;
pub const VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO: c_int = 12;
pub const VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO: c_int = 14;
pub const VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO: c_int = 15;
pub const VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO: c_int = 16;
pub const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO: c_int = 18;
pub const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO: c_int = 19;
pub const VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO: c_int = 20;
pub const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO: c_int = 22;
pub const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO: c_int = 23;
pub const VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO: c_int = 24;
pub const VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO: c_int = 25;
pub const VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO: c_int = 26;
pub const VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO: c_int = 27;
pub const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO: c_int = 28;
pub const VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO: c_int = 30;
pub const VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO: c_int = 31;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO: c_int = 32;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO: c_int = 33;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO: c_int = 34;
pub const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET: c_int = 35;
pub const VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO: c_int = 37;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO: c_int = 38;
pub const VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO: c_int = 39;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO: c_int = 40;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO: c_int = 42;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO: c_int = 43;
pub const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER: c_int = 45;
pub const VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO: c_int = 1000117002;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES: c_int = 1000156004;
pub const VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR: c_int = 1000001000;
pub const VK_STRUCTURE_TYPE_PRESENT_INFO_KHR: c_int = 1000001001;
pub const VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR: c_int = 1000156001;
pub const enum_VkStructureType = c_uint;
pub const VkStructureType = enum_VkStructureType;
pub const enum_VkSystemAllocationScope = c_uint;
pub const VkSystemAllocationScope = enum_VkSystemAllocationScope;
pub const enum_VkInternalAllocationType = c_uint;
pub const VkInternalAllocationType = enum_VkInternalAllocationType;
pub const VK_FORMAT_UNDEFINED: c_int = 0;
pub const VK_FORMAT_R4G4B4A4_UNORM_PACK16: c_int = 2;
pub const VK_FORMAT_B4G4R4A4_UNORM_PACK16: c_int = 3;
pub const VK_FORMAT_R5G6B5_UNORM_PACK16: c_int = 4;
pub const VK_FORMAT_B5G6R5_UNORM_PACK16: c_int = 5;
pub const VK_FORMAT_R5G5B5A1_UNORM_PACK16: c_int = 6;
pub const VK_FORMAT_B5G5R5A1_UNORM_PACK16: c_int = 7;
pub const VK_FORMAT_A1R5G5B5_UNORM_PACK16: c_int = 8;
pub const VK_FORMAT_R8_UNORM: c_int = 9;
pub const VK_FORMAT_R8G8_UNORM: c_int = 16;
pub const VK_FORMAT_R8G8B8A8_UNORM: c_int = 37;
pub const VK_FORMAT_R8G8B8A8_SRGB: c_int = 43;
pub const VK_FORMAT_B8G8R8A8_UNORM: c_int = 44;
pub const VK_FORMAT_B8G8R8A8_SRGB: c_int = 50;
pub const VK_FORMAT_A2B10G10R10_UNORM_PACK32: c_int = 64;
pub const VK_FORMAT_R16_UNORM: c_int = 70;
pub const VK_FORMAT_R16G16_UNORM: c_int = 77;
pub const VK_FORMAT_R16G16B16A16_SFLOAT: c_int = 97;
pub const VK_FORMAT_R32G32_SFLOAT: c_int = 103;
pub const VK_FORMAT_R32G32B32A32_SFLOAT: c_int = 109;
pub const VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM: c_int = 1000156002;
pub const VK_FORMAT_G8_B8R8_2PLANE_420_UNORM: c_int = 1000156003;
pub const VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM: c_int = 1000156006;
pub const VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16: c_int = 1000156013;
pub const VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM: c_int = 1000156029;
pub const VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM: c_int = 1000156033;
pub const VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT: c_int = 1000340000;
pub const VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT: c_int = 1000340001;
pub const enum_VkFormat = c_uint;
pub const VkFormat = enum_VkFormat;
pub const VK_IMAGE_TILING_OPTIMAL: c_int = 0;
pub const enum_VkImageTiling = c_uint;
pub const VkImageTiling = enum_VkImageTiling;
pub const VK_IMAGE_TYPE_2D: c_int = 1;
pub const enum_VkImageType = c_uint;
pub const VkImageType = enum_VkImageType;
pub const enum_VkPhysicalDeviceType = c_uint;
pub const VkPhysicalDeviceType = enum_VkPhysicalDeviceType;
pub const VK_SHARING_MODE_EXCLUSIVE: c_int = 0;
pub const enum_VkSharingMode = c_uint;
pub const VkSharingMode = enum_VkSharingMode;
pub const VK_IMAGE_LAYOUT_UNDEFINED: c_int = 0;
pub const VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL: c_int = 2;
pub const VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL: c_int = 5;
pub const VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL: c_int = 6;
pub const VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL: c_int = 7;
pub const VK_IMAGE_LAYOUT_PRESENT_SRC_KHR: c_int = 1000001002;
pub const enum_VkImageLayout = c_uint;
pub const VkImageLayout = enum_VkImageLayout;
pub const VK_COMPONENT_SWIZZLE_IDENTITY: c_int = 0;
pub const enum_VkComponentSwizzle = c_uint;
pub const VkComponentSwizzle = enum_VkComponentSwizzle;
pub const VK_IMAGE_VIEW_TYPE_2D: c_int = 1;
pub const enum_VkImageViewType = c_uint;
pub const VkImageViewType = enum_VkImageViewType;
pub const VK_COMMAND_BUFFER_LEVEL_PRIMARY: c_int = 0;
pub const enum_VkCommandBufferLevel = c_uint;
pub const VkCommandBufferLevel = enum_VkCommandBufferLevel;
pub const enum_VkBorderColor = c_uint;
pub const VkBorderColor = enum_VkBorderColor;
pub const VK_FILTER_NEAREST: c_int = 0;
pub const VK_FILTER_LINEAR: c_int = 1;
pub const enum_VkFilter = c_uint;
pub const VkFilter = enum_VkFilter;
pub const VK_SAMPLER_ADDRESS_MODE_REPEAT: c_int = 0;
pub const VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE: c_int = 2;
pub const enum_VkSamplerAddressMode = c_uint;
pub const VkSamplerAddressMode = enum_VkSamplerAddressMode;
pub const enum_VkCompareOp = c_uint;
pub const VkCompareOp = enum_VkCompareOp;
pub const VK_SAMPLER_MIPMAP_MODE_NEAREST: c_int = 0;
pub const enum_VkSamplerMipmapMode = c_uint;
pub const VkSamplerMipmapMode = enum_VkSamplerMipmapMode;
pub const VK_DESCRIPTOR_TYPE_SAMPLER: c_int = 0;
pub const VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER: c_int = 1;
pub const VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER: c_int = 6;
pub const enum_VkDescriptorType = c_uint;
pub const VkDescriptorType = enum_VkDescriptorType;
pub const VK_PIPELINE_BIND_POINT_GRAPHICS: c_int = 0;
pub const enum_VkPipelineBindPoint = c_uint;
pub const VkPipelineBindPoint = enum_VkPipelineBindPoint;
pub const VK_BLEND_FACTOR_ZERO: c_int = 0;
pub const VK_BLEND_FACTOR_ONE: c_int = 1;
pub const VK_BLEND_FACTOR_SRC_COLOR: c_int = 2;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR: c_int = 3;
pub const VK_BLEND_FACTOR_DST_COLOR: c_int = 4;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR: c_int = 5;
pub const VK_BLEND_FACTOR_SRC_ALPHA: c_int = 6;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA: c_int = 7;
pub const VK_BLEND_FACTOR_DST_ALPHA: c_int = 8;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA: c_int = 9;
pub const VK_BLEND_FACTOR_MAX_ENUM: c_int = 2147483647;
pub const enum_VkBlendFactor = c_uint;
pub const VkBlendFactor = enum_VkBlendFactor;
pub const VK_BLEND_OP_ADD: c_int = 0;
pub const VK_BLEND_OP_SUBTRACT: c_int = 1;
pub const VK_BLEND_OP_REVERSE_SUBTRACT: c_int = 2;
pub const VK_BLEND_OP_MIN: c_int = 3;
pub const VK_BLEND_OP_MAX: c_int = 4;
pub const VK_BLEND_OP_MAX_ENUM: c_int = 2147483647;
pub const enum_VkBlendOp = c_uint;
pub const VkBlendOp = enum_VkBlendOp;
pub const VK_DYNAMIC_STATE_VIEWPORT: c_int = 0;
pub const VK_DYNAMIC_STATE_SCISSOR: c_int = 1;
pub const enum_VkDynamicState = c_uint;
pub const VkDynamicState = enum_VkDynamicState;
pub const VK_FRONT_FACE_COUNTER_CLOCKWISE: c_int = 0;
pub const enum_VkFrontFace = c_uint;
pub const VkFrontFace = enum_VkFrontFace;
pub const enum_VkLogicOp = c_uint;
pub const VkLogicOp = enum_VkLogicOp;
pub const enum_VkStencilOp = c_uint;
pub const VkStencilOp = enum_VkStencilOp;
pub const VK_VERTEX_INPUT_RATE_VERTEX: c_int = 0;
pub const enum_VkVertexInputRate = c_uint;
pub const VkVertexInputRate = enum_VkVertexInputRate;
pub const VK_PRIMITIVE_TOPOLOGY_POINT_LIST: c_int = 0;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_LIST: c_int = 1;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_STRIP: c_int = 2;
pub const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST: c_int = 3;
pub const enum_VkPrimitiveTopology = c_uint;
pub const VkPrimitiveTopology = enum_VkPrimitiveTopology;
pub const VK_POLYGON_MODE_FILL: c_int = 0;
pub const enum_VkPolygonMode = c_uint;
pub const VkPolygonMode = enum_VkPolygonMode;
pub const VK_ATTACHMENT_LOAD_OP_LOAD: c_int = 0;
pub const VK_ATTACHMENT_LOAD_OP_CLEAR: c_int = 1;
pub const VK_ATTACHMENT_LOAD_OP_DONT_CARE: c_int = 2;
pub const enum_VkAttachmentLoadOp = c_uint;
pub const VkAttachmentLoadOp = enum_VkAttachmentLoadOp;
pub const VK_ATTACHMENT_STORE_OP_STORE: c_int = 0;
pub const VK_ATTACHMENT_STORE_OP_DONT_CARE: c_int = 1;
pub const enum_VkAttachmentStoreOp = c_uint;
pub const VkAttachmentStoreOp = enum_VkAttachmentStoreOp;
pub const VK_SUBPASS_CONTENTS_INLINE: c_int = 0;
pub const enum_VkSubpassContents = c_uint;
pub const VkSubpassContents = enum_VkSubpassContents;
pub const VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT: c_int = 8;
pub const VkImageCreateFlags = VkFlags;
pub const VK_SAMPLE_COUNT_1_BIT: c_int = 1;
pub const enum_VkSampleCountFlagBits = c_uint;
pub const VkSampleCountFlagBits = enum_VkSampleCountFlagBits;
pub const VkSampleCountFlags = VkFlags;
pub const VK_IMAGE_USAGE_TRANSFER_SRC_BIT: c_int = 1;
pub const VK_IMAGE_USAGE_TRANSFER_DST_BIT: c_int = 2;
pub const VK_IMAGE_USAGE_SAMPLED_BIT: c_int = 4;
pub const VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT: c_int = 16;
pub const VkImageUsageFlags = VkFlags;
pub const VkInstanceCreateFlags = VkFlags;
pub const VkMemoryHeapFlags = VkFlags;
pub const VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT: c_int = 1;
pub const VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT: c_int = 2;
pub const VK_MEMORY_PROPERTY_HOST_COHERENT_BIT: c_int = 4;
pub const VkMemoryPropertyFlags = VkFlags;
pub const VK_QUEUE_GRAPHICS_BIT: c_int = 1;
pub const VkQueueFlags = VkFlags;
pub const VK_SHADER_STAGE_VERTEX_BIT: c_int = 1;
pub const VK_SHADER_STAGE_FRAGMENT_BIT: c_int = 16;
pub const enum_VkShaderStageFlagBits = c_uint;
pub const VkShaderStageFlagBits = enum_VkShaderStageFlagBits;
pub const VkShaderStageFlags = VkFlags;
pub const VkDeviceCreateFlags = VkFlags;
pub const VkDeviceQueueCreateFlags = VkFlags;
pub const VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT: c_int = 1;
pub const VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT: c_int = 128;
pub const VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT: c_int = 1024;
pub const VK_PIPELINE_STAGE_TRANSFER_BIT: c_int = 4096;
pub const VK_PIPELINE_STAGE_ALL_COMMANDS_BIT: c_int = 65536;
pub const VkPipelineStageFlags = VkFlags;
pub const VkMemoryMapFlags = VkFlags;
pub const VK_IMAGE_ASPECT_COLOR_BIT: c_int = 1;
pub const VK_IMAGE_ASPECT_PLANE_0_BIT: c_int = 16;
pub const VkImageAspectFlags = VkFlags;
pub const VK_FENCE_CREATE_SIGNALED_BIT: c_int = 1;
pub const VkFenceCreateFlags = VkFlags;
pub const VkSemaphoreCreateFlags = VkFlags;
pub const VkQueryPipelineStatisticFlags = VkFlags;
pub const VkBufferCreateFlags = VkFlags;
pub const VK_BUFFER_USAGE_TRANSFER_SRC_BIT: c_int = 1;
pub const VK_BUFFER_USAGE_TRANSFER_DST_BIT: c_int = 2;
pub const VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT: c_int = 16;
pub const VK_BUFFER_USAGE_VERTEX_BUFFER_BIT: c_int = 128;
pub const VkBufferUsageFlags = VkFlags;
pub const VkImageViewCreateFlags = VkFlags;
pub const VK_ACCESS_SHADER_READ_BIT: c_int = 32;
pub const VK_ACCESS_COLOR_ATTACHMENT_READ_BIT: c_int = 128;
pub const VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT: c_int = 256;
pub const VK_ACCESS_TRANSFER_READ_BIT: c_int = 2048;
pub const VK_ACCESS_TRANSFER_WRITE_BIT: c_int = 4096;
pub const VK_ACCESS_NONE: c_int = 0;
pub const VkAccessFlags = VkFlags;
pub const VK_DEPENDENCY_BY_REGION_BIT: c_int = 1;
pub const VkDependencyFlags = VkFlags;
pub const VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT: c_int = 2;
pub const VkCommandPoolCreateFlags = VkFlags;
pub const VkCommandPoolResetFlags = VkFlags;
pub const VkQueryControlFlags = VkFlags;
pub const VkCommandBufferUsageFlags = VkFlags;
pub const VkCommandBufferResetFlags = VkFlags;
pub const VkShaderModuleCreateFlags = VkFlags;
pub const VkPipelineCreateFlags = VkFlags;
pub const VkPipelineLayoutCreateFlags = VkFlags;
pub const VkPipelineShaderStageCreateFlags = VkFlags;
pub const VkSamplerCreateFlags = VkFlags;
pub const VkDescriptorPoolCreateFlags = VkFlags;
pub const VkDescriptorPoolResetFlags = VkFlags;
pub const VkDescriptorSetLayoutCreateFlags = VkFlags;
pub const VK_COLOR_COMPONENT_R_BIT: c_int = 1;
pub const VK_COLOR_COMPONENT_G_BIT: c_int = 2;
pub const VK_COLOR_COMPONENT_B_BIT: c_int = 4;
pub const VK_COLOR_COMPONENT_A_BIT: c_int = 8;
pub const VkColorComponentFlags = VkFlags;
pub const VK_CULL_MODE_NONE: c_int = 0;
pub const VkCullModeFlags = VkFlags;
pub const VkPipelineColorBlendStateCreateFlags = VkFlags;
pub const VkPipelineDepthStencilStateCreateFlags = VkFlags;
pub const VkPipelineDynamicStateCreateFlags = VkFlags;
pub const VkPipelineInputAssemblyStateCreateFlags = VkFlags;
pub const VkPipelineMultisampleStateCreateFlags = VkFlags;
pub const VkPipelineRasterizationStateCreateFlags = VkFlags;
pub const VkPipelineTessellationStateCreateFlags = VkFlags;
pub const VkPipelineVertexInputStateCreateFlags = VkFlags;
pub const VkPipelineViewportStateCreateFlags = VkFlags;
pub const VkAttachmentDescriptionFlags = VkFlags;
pub const VkFramebufferCreateFlags = VkFlags;
pub const VkRenderPassCreateFlags = VkFlags;
pub const VkSubpassDescriptionFlags = VkFlags;
pub const struct_VkExtent2D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const VkExtent2D = struct_VkExtent2D;
pub const struct_VkExtent3D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
    depth: u32 = 0,
};
pub const VkExtent3D = struct_VkExtent3D;
pub const struct_VkOffset2D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
};
pub const VkOffset2D = struct_VkOffset2D;
pub const struct_VkOffset3D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
    z: i32 = 0,
};
pub const VkOffset3D = struct_VkOffset3D;
pub const struct_VkRect2D = extern struct {
    offset: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    extent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkRect2D = struct_VkRect2D;
pub const PFN_vkAllocationFunction = ?*const fn (pUserData: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkFreeFunction = ?*const fn (pUserData: ?*anyopaque, pMemory: ?*anyopaque) callconv(.c) void;
pub const PFN_vkInternalAllocationNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkInternalFreeNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkReallocationFunction = ?*const fn (pUserData: ?*anyopaque, pOriginal: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_VkAllocationCallbacks = extern struct {
    pUserData: ?*anyopaque = null,
    pfnAllocation: PFN_vkAllocationFunction = null,
    pfnReallocation: PFN_vkReallocationFunction = null,
    pfnFree: PFN_vkFreeFunction = null,
    pfnInternalAllocation: PFN_vkInternalAllocationNotification = null,
    pfnInternalFree: PFN_vkInternalFreeNotification = null,
};
pub const VkAllocationCallbacks = struct_VkAllocationCallbacks;
pub const struct_VkApplicationInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    pApplicationName: [*c]const u8 = null,
    applicationVersion: u32 = 0,
    pEngineName: [*c]const u8 = null,
    engineVersion: u32 = 0,
    apiVersion: u32 = 0,
};
pub const VkApplicationInfo = struct_VkApplicationInfo;
pub const struct_VkImageFormatProperties = extern struct {
    maxExtent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
    maxMipLevels: u32 = 0,
    maxArrayLayers: u32 = 0,
    sampleCounts: VkSampleCountFlags = 0,
    maxResourceSize: VkDeviceSize = 0,
};
pub const VkImageFormatProperties = struct_VkImageFormatProperties;
pub const struct_VkInstanceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkInstanceCreateFlags = 0,
    pApplicationInfo: [*c]const VkApplicationInfo = null,
    enabledLayerCount: u32 = 0,
    ppEnabledLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    ppEnabledExtensionNames: [*c]const [*c]const u8 = null,
};
pub const VkInstanceCreateInfo = struct_VkInstanceCreateInfo;
pub const struct_VkMemoryHeap = extern struct {
    size: VkDeviceSize = 0,
    flags: VkMemoryHeapFlags = 0,
};
pub const VkMemoryHeap = struct_VkMemoryHeap;
pub const struct_VkMemoryType = extern struct {
    propertyFlags: VkMemoryPropertyFlags = 0,
    heapIndex: u32 = 0,
};
pub const VkMemoryType = struct_VkMemoryType;
pub const struct_VkPhysicalDeviceFeatures = extern struct {
    robustBufferAccess: VkBool32 = 0,
    fullDrawIndexUint32: VkBool32 = 0,
    imageCubeArray: VkBool32 = 0,
    independentBlend: VkBool32 = 0,
    geometryShader: VkBool32 = 0,
    tessellationShader: VkBool32 = 0,
    sampleRateShading: VkBool32 = 0,
    dualSrcBlend: VkBool32 = 0,
    logicOp: VkBool32 = 0,
    multiDrawIndirect: VkBool32 = 0,
    drawIndirectFirstInstance: VkBool32 = 0,
    depthClamp: VkBool32 = 0,
    depthBiasClamp: VkBool32 = 0,
    fillModeNonSolid: VkBool32 = 0,
    depthBounds: VkBool32 = 0,
    wideLines: VkBool32 = 0,
    largePoints: VkBool32 = 0,
    alphaToOne: VkBool32 = 0,
    multiViewport: VkBool32 = 0,
    samplerAnisotropy: VkBool32 = 0,
    textureCompressionETC2: VkBool32 = 0,
    textureCompressionASTC_LDR: VkBool32 = 0,
    textureCompressionBC: VkBool32 = 0,
    occlusionQueryPrecise: VkBool32 = 0,
    pipelineStatisticsQuery: VkBool32 = 0,
    vertexPipelineStoresAndAtomics: VkBool32 = 0,
    fragmentStoresAndAtomics: VkBool32 = 0,
    shaderTessellationAndGeometryPointSize: VkBool32 = 0,
    shaderImageGatherExtended: VkBool32 = 0,
    shaderStorageImageExtendedFormats: VkBool32 = 0,
    shaderStorageImageMultisample: VkBool32 = 0,
    shaderStorageImageReadWithoutFormat: VkBool32 = 0,
    shaderStorageImageWriteWithoutFormat: VkBool32 = 0,
    shaderUniformBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderSampledImageArrayDynamicIndexing: VkBool32 = 0,
    shaderStorageBufferArrayDynamicIndexing: VkBool32 = 0,
    shaderStorageImageArrayDynamicIndexing: VkBool32 = 0,
    shaderClipDistance: VkBool32 = 0,
    shaderCullDistance: VkBool32 = 0,
    shaderFloat64: VkBool32 = 0,
    shaderInt64: VkBool32 = 0,
    shaderInt16: VkBool32 = 0,
    shaderResourceResidency: VkBool32 = 0,
    shaderResourceMinLod: VkBool32 = 0,
    sparseBinding: VkBool32 = 0,
    sparseResidencyBuffer: VkBool32 = 0,
    sparseResidencyImage2D: VkBool32 = 0,
    sparseResidencyImage3D: VkBool32 = 0,
    sparseResidency2Samples: VkBool32 = 0,
    sparseResidency4Samples: VkBool32 = 0,
    sparseResidency8Samples: VkBool32 = 0,
    sparseResidency16Samples: VkBool32 = 0,
    sparseResidencyAliased: VkBool32 = 0,
    variableMultisampleRate: VkBool32 = 0,
    inheritedQueries: VkBool32 = 0,
};
pub const VkPhysicalDeviceFeatures = struct_VkPhysicalDeviceFeatures;
pub const struct_VkPhysicalDeviceLimits = extern struct {
    maxImageDimension1D: u32 = 0,
    maxImageDimension2D: u32 = 0,
    maxImageDimension3D: u32 = 0,
    maxImageDimensionCube: u32 = 0,
    maxImageArrayLayers: u32 = 0,
    maxTexelBufferElements: u32 = 0,
    maxUniformBufferRange: u32 = 0,
    maxStorageBufferRange: u32 = 0,
    maxPushConstantsSize: u32 = 0,
    maxMemoryAllocationCount: u32 = 0,
    maxSamplerAllocationCount: u32 = 0,
    bufferImageGranularity: VkDeviceSize = 0,
    sparseAddressSpaceSize: VkDeviceSize = 0,
    maxBoundDescriptorSets: u32 = 0,
    maxPerStageDescriptorSamplers: u32 = 0,
    maxPerStageDescriptorUniformBuffers: u32 = 0,
    maxPerStageDescriptorStorageBuffers: u32 = 0,
    maxPerStageDescriptorSampledImages: u32 = 0,
    maxPerStageDescriptorStorageImages: u32 = 0,
    maxPerStageDescriptorInputAttachments: u32 = 0,
    maxPerStageResources: u32 = 0,
    maxDescriptorSetSamplers: u32 = 0,
    maxDescriptorSetUniformBuffers: u32 = 0,
    maxDescriptorSetUniformBuffersDynamic: u32 = 0,
    maxDescriptorSetStorageBuffers: u32 = 0,
    maxDescriptorSetStorageBuffersDynamic: u32 = 0,
    maxDescriptorSetSampledImages: u32 = 0,
    maxDescriptorSetStorageImages: u32 = 0,
    maxDescriptorSetInputAttachments: u32 = 0,
    maxVertexInputAttributes: u32 = 0,
    maxVertexInputBindings: u32 = 0,
    maxVertexInputAttributeOffset: u32 = 0,
    maxVertexInputBindingStride: u32 = 0,
    maxVertexOutputComponents: u32 = 0,
    maxTessellationGenerationLevel: u32 = 0,
    maxTessellationPatchSize: u32 = 0,
    maxTessellationControlPerVertexInputComponents: u32 = 0,
    maxTessellationControlPerVertexOutputComponents: u32 = 0,
    maxTessellationControlPerPatchOutputComponents: u32 = 0,
    maxTessellationControlTotalOutputComponents: u32 = 0,
    maxTessellationEvaluationInputComponents: u32 = 0,
    maxTessellationEvaluationOutputComponents: u32 = 0,
    maxGeometryShaderInvocations: u32 = 0,
    maxGeometryInputComponents: u32 = 0,
    maxGeometryOutputComponents: u32 = 0,
    maxGeometryOutputVertices: u32 = 0,
    maxGeometryTotalOutputComponents: u32 = 0,
    maxFragmentInputComponents: u32 = 0,
    maxFragmentOutputAttachments: u32 = 0,
    maxFragmentDualSrcAttachments: u32 = 0,
    maxFragmentCombinedOutputResources: u32 = 0,
    maxComputeSharedMemorySize: u32 = 0,
    maxComputeWorkGroupCount: [3]u32 = @import("std").mem.zeroes([3]u32),
    maxComputeWorkGroupInvocations: u32 = 0,
    maxComputeWorkGroupSize: [3]u32 = @import("std").mem.zeroes([3]u32),
    subPixelPrecisionBits: u32 = 0,
    subTexelPrecisionBits: u32 = 0,
    mipmapPrecisionBits: u32 = 0,
    maxDrawIndexedIndexValue: u32 = 0,
    maxDrawIndirectCount: u32 = 0,
    maxSamplerLodBias: f32 = 0,
    maxSamplerAnisotropy: f32 = 0,
    maxViewports: u32 = 0,
    maxViewportDimensions: [2]u32 = @import("std").mem.zeroes([2]u32),
    viewportBoundsRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    viewportSubPixelBits: u32 = 0,
    minMemoryMapAlignment: usize = 0,
    minTexelBufferOffsetAlignment: VkDeviceSize = 0,
    minUniformBufferOffsetAlignment: VkDeviceSize = 0,
    minStorageBufferOffsetAlignment: VkDeviceSize = 0,
    minTexelOffset: i32 = 0,
    maxTexelOffset: u32 = 0,
    minTexelGatherOffset: i32 = 0,
    maxTexelGatherOffset: u32 = 0,
    minInterpolationOffset: f32 = 0,
    maxInterpolationOffset: f32 = 0,
    subPixelInterpolationOffsetBits: u32 = 0,
    maxFramebufferWidth: u32 = 0,
    maxFramebufferHeight: u32 = 0,
    maxFramebufferLayers: u32 = 0,
    framebufferColorSampleCounts: VkSampleCountFlags = 0,
    framebufferDepthSampleCounts: VkSampleCountFlags = 0,
    framebufferStencilSampleCounts: VkSampleCountFlags = 0,
    framebufferNoAttachmentsSampleCounts: VkSampleCountFlags = 0,
    maxColorAttachments: u32 = 0,
    sampledImageColorSampleCounts: VkSampleCountFlags = 0,
    sampledImageIntegerSampleCounts: VkSampleCountFlags = 0,
    sampledImageDepthSampleCounts: VkSampleCountFlags = 0,
    sampledImageStencilSampleCounts: VkSampleCountFlags = 0,
    storageImageSampleCounts: VkSampleCountFlags = 0,
    maxSampleMaskWords: u32 = 0,
    timestampComputeAndGraphics: VkBool32 = 0,
    timestampPeriod: f32 = 0,
    maxClipDistances: u32 = 0,
    maxCullDistances: u32 = 0,
    maxCombinedClipAndCullDistances: u32 = 0,
    discreteQueuePriorities: u32 = 0,
    pointSizeRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    lineWidthRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    pointSizeGranularity: f32 = 0,
    lineWidthGranularity: f32 = 0,
    strictLines: VkBool32 = 0,
    standardSampleLocations: VkBool32 = 0,
    optimalBufferCopyOffsetAlignment: VkDeviceSize = 0,
    optimalBufferCopyRowPitchAlignment: VkDeviceSize = 0,
    nonCoherentAtomSize: VkDeviceSize = 0,
};
pub const VkPhysicalDeviceLimits = struct_VkPhysicalDeviceLimits;
pub const struct_VkPhysicalDeviceMemoryProperties = extern struct {
    memoryTypeCount: u32 = 0,
    memoryTypes: [32]VkMemoryType = @import("std").mem.zeroes([32]VkMemoryType),
    memoryHeapCount: u32 = 0,
    memoryHeaps: [16]VkMemoryHeap = @import("std").mem.zeroes([16]VkMemoryHeap),
};
pub const VkPhysicalDeviceMemoryProperties = struct_VkPhysicalDeviceMemoryProperties;
pub const struct_VkPhysicalDeviceSparseProperties = extern struct {
    residencyStandard2DBlockShape: VkBool32 = 0,
    residencyStandard2DMultisampleBlockShape: VkBool32 = 0,
    residencyStandard3DBlockShape: VkBool32 = 0,
    residencyAlignedMipSize: VkBool32 = 0,
    residencyNonResidentStrict: VkBool32 = 0,
};
pub const VkPhysicalDeviceSparseProperties = struct_VkPhysicalDeviceSparseProperties;
pub const struct_VkPhysicalDeviceProperties = extern struct {
    apiVersion: u32 = 0,
    driverVersion: u32 = 0,
    vendorID: u32 = 0,
    deviceID: u32 = 0,
    deviceType: VkPhysicalDeviceType = @import("std").mem.zeroes(VkPhysicalDeviceType),
    deviceName: [256]u8 = @import("std").mem.zeroes([256]u8),
    pipelineCacheUUID: [16]u8 = @import("std").mem.zeroes([16]u8),
    limits: VkPhysicalDeviceLimits = @import("std").mem.zeroes(VkPhysicalDeviceLimits),
    sparseProperties: VkPhysicalDeviceSparseProperties = @import("std").mem.zeroes(VkPhysicalDeviceSparseProperties),
};
pub const VkPhysicalDeviceProperties = struct_VkPhysicalDeviceProperties;
pub const struct_VkQueueFamilyProperties = extern struct {
    queueFlags: VkQueueFlags = 0,
    queueCount: u32 = 0,
    timestampValidBits: u32 = 0,
    minImageTransferGranularity: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkQueueFamilyProperties = struct_VkQueueFamilyProperties;
pub const struct_VkDeviceQueueCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDeviceQueueCreateFlags = 0,
    queueFamilyIndex: u32 = 0,
    queueCount: u32 = 0,
    pQueuePriorities: [*c]const f32 = null,
};
pub const VkDeviceQueueCreateInfo = struct_VkDeviceQueueCreateInfo;
pub const struct_VkDeviceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDeviceCreateFlags = 0,
    queueCreateInfoCount: u32 = 0,
    pQueueCreateInfos: [*c]const VkDeviceQueueCreateInfo = null,
    enabledLayerCount: u32 = 0,
    ppEnabledLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    ppEnabledExtensionNames: [*c]const [*c]const u8 = null,
    pEnabledFeatures: [*c]const VkPhysicalDeviceFeatures = null,
};
pub const VkDeviceCreateInfo = struct_VkDeviceCreateInfo;
pub const struct_VkExtensionProperties = extern struct {
    extensionName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
};
pub const VkExtensionProperties = struct_VkExtensionProperties;
pub const struct_VkLayerProperties = extern struct {
    layerName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
    implementationVersion: u32 = 0,
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const VkLayerProperties = struct_VkLayerProperties;
pub const struct_VkSubmitInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    waitSemaphoreCount: u32 = 0,
    pWaitSemaphores: [*c]const VkSemaphore = null,
    pWaitDstStageMask: [*c]const VkPipelineStageFlags = null,
    commandBufferCount: u32 = 0,
    pCommandBuffers: [*c]const VkCommandBuffer = null,
    signalSemaphoreCount: u32 = 0,
    pSignalSemaphores: [*c]const VkSemaphore = null,
};
pub const VkSubmitInfo = struct_VkSubmitInfo;
pub const struct_VkMemoryAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    allocationSize: VkDeviceSize = 0,
    memoryTypeIndex: u32 = 0,
};
pub const VkMemoryAllocateInfo = struct_VkMemoryAllocateInfo;
pub const struct_VkMemoryRequirements = extern struct {
    size: VkDeviceSize = 0,
    alignment: VkDeviceSize = 0,
    memoryTypeBits: u32 = 0,
};
pub const VkMemoryRequirements = struct_VkMemoryRequirements;
pub const struct_VkFenceCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkFenceCreateFlags = 0,
};
pub const VkFenceCreateInfo = struct_VkFenceCreateInfo;
pub const struct_VkSemaphoreCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSemaphoreCreateFlags = 0,
};
pub const VkSemaphoreCreateInfo = struct_VkSemaphoreCreateInfo;
pub const struct_VkBufferCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkBufferCreateFlags = 0,
    size: VkDeviceSize = 0,
    usage: VkBufferUsageFlags = 0,
    sharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
};
pub const VkBufferCreateInfo = struct_VkBufferCreateInfo;
pub const struct_VkImageCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkImageCreateFlags = 0,
    imageType: VkImageType = @import("std").mem.zeroes(VkImageType),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    extent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
    mipLevels: u32 = 0,
    arrayLayers: u32 = 0,
    samples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    tiling: VkImageTiling = @import("std").mem.zeroes(VkImageTiling),
    usage: VkImageUsageFlags = 0,
    sharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
    initialLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkImageCreateInfo = struct_VkImageCreateInfo;
pub const struct_VkComponentMapping = extern struct {
    r: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    g: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    b: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
    a: VkComponentSwizzle = @import("std").mem.zeroes(VkComponentSwizzle),
};
pub const VkComponentMapping = struct_VkComponentMapping;
pub const struct_VkImageSubresourceRange = extern struct {
    aspectMask: VkImageAspectFlags = 0,
    baseMipLevel: u32 = 0,
    levelCount: u32 = 0,
    baseArrayLayer: u32 = 0,
    layerCount: u32 = 0,
};
pub const VkImageSubresourceRange = struct_VkImageSubresourceRange;
pub const struct_VkImageViewCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkImageViewCreateFlags = 0,
    image: VkImage = null,
    viewType: VkImageViewType = @import("std").mem.zeroes(VkImageViewType),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    components: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    subresourceRange: VkImageSubresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
};
pub const VkImageViewCreateInfo = struct_VkImageViewCreateInfo;
pub const struct_VkCommandPoolCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkCommandPoolCreateFlags = 0,
    queueFamilyIndex: u32 = 0,
};
pub const VkCommandPoolCreateInfo = struct_VkCommandPoolCreateInfo;
pub const struct_VkCommandBufferAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    commandPool: VkCommandPool = null,
    level: VkCommandBufferLevel = @import("std").mem.zeroes(VkCommandBufferLevel),
    commandBufferCount: u32 = 0,
};
pub const VkCommandBufferAllocateInfo = struct_VkCommandBufferAllocateInfo;
pub const struct_VkCommandBufferInheritanceInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    renderPass: VkRenderPass = null,
    subpass: u32 = 0,
    framebuffer: VkFramebuffer = null,
    occlusionQueryEnable: VkBool32 = 0,
    queryFlags: VkQueryControlFlags = 0,
    pipelineStatistics: VkQueryPipelineStatisticFlags = 0,
};
pub const VkCommandBufferInheritanceInfo = struct_VkCommandBufferInheritanceInfo;
pub const struct_VkCommandBufferBeginInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkCommandBufferUsageFlags = 0,
    pInheritanceInfo: [*c]const VkCommandBufferInheritanceInfo = null,
};
pub const VkCommandBufferBeginInfo = struct_VkCommandBufferBeginInfo;
pub const struct_VkImageSubresourceLayers = extern struct {
    aspectMask: VkImageAspectFlags = 0,
    mipLevel: u32 = 0,
    baseArrayLayer: u32 = 0,
    layerCount: u32 = 0,
};
pub const VkImageSubresourceLayers = struct_VkImageSubresourceLayers;
pub const struct_VkBufferImageCopy = extern struct {
    bufferOffset: VkDeviceSize = 0,
    bufferRowLength: u32 = 0,
    bufferImageHeight: u32 = 0,
    imageSubresource: VkImageSubresourceLayers = @import("std").mem.zeroes(VkImageSubresourceLayers),
    imageOffset: VkOffset3D = @import("std").mem.zeroes(VkOffset3D),
    imageExtent: VkExtent3D = @import("std").mem.zeroes(VkExtent3D),
};
pub const VkBufferImageCopy = struct_VkBufferImageCopy;
pub const struct_VkBufferMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    srcQueueFamilyIndex: u32 = 0,
    dstQueueFamilyIndex: u32 = 0,
    buffer: VkBuffer = null,
    offset: VkDeviceSize = 0,
    size: VkDeviceSize = 0,
};
pub const VkBufferMemoryBarrier = struct_VkBufferMemoryBarrier;
pub const struct_VkImageMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    oldLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    newLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    srcQueueFamilyIndex: u32 = 0,
    dstQueueFamilyIndex: u32 = 0,
    image: VkImage = null,
    subresourceRange: VkImageSubresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
};
pub const VkImageMemoryBarrier = struct_VkImageMemoryBarrier;
pub const struct_VkMemoryBarrier = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
};
pub const VkMemoryBarrier = struct_VkMemoryBarrier;
pub const struct_VkShaderModuleCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkShaderModuleCreateFlags = 0,
    codeSize: usize = 0,
    pCode: [*c]const u32 = null,
};
pub const VkShaderModuleCreateInfo = struct_VkShaderModuleCreateInfo;
pub const struct_VkSpecializationMapEntry = extern struct {
    constantID: u32 = 0,
    offset: u32 = 0,
    size: usize = 0,
};
pub const VkSpecializationMapEntry = struct_VkSpecializationMapEntry;
pub const struct_VkSpecializationInfo = extern struct {
    mapEntryCount: u32 = 0,
    pMapEntries: [*c]const VkSpecializationMapEntry = null,
    dataSize: usize = 0,
    pData: ?*const anyopaque = null,
};
pub const VkSpecializationInfo = struct_VkSpecializationInfo;
pub const struct_VkPipelineShaderStageCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineShaderStageCreateFlags = 0,
    stage: VkShaderStageFlagBits = @import("std").mem.zeroes(VkShaderStageFlagBits),
    module: VkShaderModule = null,
    pName: [*c]const u8 = null,
    pSpecializationInfo: [*c]const VkSpecializationInfo = null,
};
pub const VkPipelineShaderStageCreateInfo = struct_VkPipelineShaderStageCreateInfo;
pub const struct_VkPushConstantRange = extern struct {
    stageFlags: VkShaderStageFlags = 0,
    offset: u32 = 0,
    size: u32 = 0,
};
pub const VkPushConstantRange = struct_VkPushConstantRange;
pub const struct_VkPipelineLayoutCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineLayoutCreateFlags = 0,
    setLayoutCount: u32 = 0,
    pSetLayouts: [*c]const VkDescriptorSetLayout = null,
    pushConstantRangeCount: u32 = 0,
    pPushConstantRanges: [*c]const VkPushConstantRange = null,
};
pub const VkPipelineLayoutCreateInfo = struct_VkPipelineLayoutCreateInfo;
pub const struct_VkSamplerCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSamplerCreateFlags = 0,
    magFilter: VkFilter = @import("std").mem.zeroes(VkFilter),
    minFilter: VkFilter = @import("std").mem.zeroes(VkFilter),
    mipmapMode: VkSamplerMipmapMode = @import("std").mem.zeroes(VkSamplerMipmapMode),
    addressModeU: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    addressModeV: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    addressModeW: VkSamplerAddressMode = @import("std").mem.zeroes(VkSamplerAddressMode),
    mipLodBias: f32 = 0,
    anisotropyEnable: VkBool32 = 0,
    maxAnisotropy: f32 = 0,
    compareEnable: VkBool32 = 0,
    compareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    minLod: f32 = 0,
    maxLod: f32 = 0,
    borderColor: VkBorderColor = @import("std").mem.zeroes(VkBorderColor),
    unnormalizedCoordinates: VkBool32 = 0,
};
pub const VkSamplerCreateInfo = struct_VkSamplerCreateInfo;
pub const struct_VkCopyDescriptorSet = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    srcSet: VkDescriptorSet = null,
    srcBinding: u32 = 0,
    srcArrayElement: u32 = 0,
    dstSet: VkDescriptorSet = null,
    dstBinding: u32 = 0,
    dstArrayElement: u32 = 0,
    descriptorCount: u32 = 0,
};
pub const VkCopyDescriptorSet = struct_VkCopyDescriptorSet;
pub const struct_VkDescriptorBufferInfo = extern struct {
    buffer: VkBuffer = null,
    offset: VkDeviceSize = 0,
    range: VkDeviceSize = 0,
};
pub const VkDescriptorBufferInfo = struct_VkDescriptorBufferInfo;
pub const struct_VkDescriptorImageInfo = extern struct {
    sampler: VkSampler = null,
    imageView: VkImageView = null,
    imageLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkDescriptorImageInfo = struct_VkDescriptorImageInfo;
pub const struct_VkDescriptorPoolSize = extern struct {
    type: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    descriptorCount: u32 = 0,
};
pub const VkDescriptorPoolSize = struct_VkDescriptorPoolSize;
pub const struct_VkDescriptorPoolCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDescriptorPoolCreateFlags = 0,
    maxSets: u32 = 0,
    poolSizeCount: u32 = 0,
    pPoolSizes: [*c]const VkDescriptorPoolSize = null,
};
pub const VkDescriptorPoolCreateInfo = struct_VkDescriptorPoolCreateInfo;
pub const struct_VkDescriptorSetAllocateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    descriptorPool: VkDescriptorPool = null,
    descriptorSetCount: u32 = 0,
    pSetLayouts: [*c]const VkDescriptorSetLayout = null,
};
pub const VkDescriptorSetAllocateInfo = struct_VkDescriptorSetAllocateInfo;
pub const struct_VkDescriptorSetLayoutBinding = extern struct {
    binding: u32 = 0,
    descriptorType: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    descriptorCount: u32 = 0,
    stageFlags: VkShaderStageFlags = 0,
    pImmutableSamplers: [*c]const VkSampler = null,
};
pub const VkDescriptorSetLayoutBinding = struct_VkDescriptorSetLayoutBinding;
pub const struct_VkDescriptorSetLayoutCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDescriptorSetLayoutCreateFlags = 0,
    bindingCount: u32 = 0,
    pBindings: [*c]const VkDescriptorSetLayoutBinding = null,
};
pub const VkDescriptorSetLayoutCreateInfo = struct_VkDescriptorSetLayoutCreateInfo;
pub const struct_VkWriteDescriptorSet = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    dstSet: VkDescriptorSet = null,
    dstBinding: u32 = 0,
    dstArrayElement: u32 = 0,
    descriptorCount: u32 = 0,
    descriptorType: VkDescriptorType = @import("std").mem.zeroes(VkDescriptorType),
    pImageInfo: [*c]const VkDescriptorImageInfo = null,
    pBufferInfo: [*c]const VkDescriptorBufferInfo = null,
    pTexelBufferView: [*c]const VkBufferView = null,
};
pub const VkWriteDescriptorSet = struct_VkWriteDescriptorSet;
pub const union_VkClearColorValue = extern union {
    float32: [4]f32,
    int32: [4]i32,
    uint32: [4]u32,
};
pub const VkClearColorValue = union_VkClearColorValue;
pub const struct_VkStencilOpState = extern struct {
    failOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    passOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    depthFailOp: VkStencilOp = @import("std").mem.zeroes(VkStencilOp),
    compareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    compareMask: u32 = 0,
    writeMask: u32 = 0,
    reference: u32 = 0,
};
pub const VkStencilOpState = struct_VkStencilOpState;
pub const struct_VkVertexInputAttributeDescription = extern struct {
    location: u32 = 0,
    binding: u32 = 0,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    offset: u32 = 0,
};
pub const VkVertexInputAttributeDescription = struct_VkVertexInputAttributeDescription;
pub const struct_VkVertexInputBindingDescription = extern struct {
    binding: u32 = 0,
    stride: u32 = 0,
    inputRate: VkVertexInputRate = @import("std").mem.zeroes(VkVertexInputRate),
};
pub const VkVertexInputBindingDescription = struct_VkVertexInputBindingDescription;
pub const struct_VkViewport = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,
    minDepth: f32 = 0,
    maxDepth: f32 = 0,
};
pub const VkViewport = struct_VkViewport;
pub const struct_VkPipelineColorBlendAttachmentState = extern struct {
    blendEnable: VkBool32 = 0,
    srcColorBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    dstColorBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    colorBlendOp: VkBlendOp = @import("std").mem.zeroes(VkBlendOp),
    srcAlphaBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    dstAlphaBlendFactor: VkBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
    alphaBlendOp: VkBlendOp = @import("std").mem.zeroes(VkBlendOp),
    colorWriteMask: VkColorComponentFlags = 0,
};
pub const VkPipelineColorBlendAttachmentState = struct_VkPipelineColorBlendAttachmentState;
pub const struct_VkPipelineColorBlendStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineColorBlendStateCreateFlags = 0,
    logicOpEnable: VkBool32 = 0,
    logicOp: VkLogicOp = @import("std").mem.zeroes(VkLogicOp),
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkPipelineColorBlendAttachmentState = null,
    blendConstants: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const VkPipelineColorBlendStateCreateInfo = struct_VkPipelineColorBlendStateCreateInfo;
pub const struct_VkPipelineDepthStencilStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineDepthStencilStateCreateFlags = 0,
    depthTestEnable: VkBool32 = 0,
    depthWriteEnable: VkBool32 = 0,
    depthCompareOp: VkCompareOp = @import("std").mem.zeroes(VkCompareOp),
    depthBoundsTestEnable: VkBool32 = 0,
    stencilTestEnable: VkBool32 = 0,
    front: VkStencilOpState = @import("std").mem.zeroes(VkStencilOpState),
    back: VkStencilOpState = @import("std").mem.zeroes(VkStencilOpState),
    minDepthBounds: f32 = 0,
    maxDepthBounds: f32 = 0,
};
pub const VkPipelineDepthStencilStateCreateInfo = struct_VkPipelineDepthStencilStateCreateInfo;
pub const struct_VkPipelineDynamicStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineDynamicStateCreateFlags = 0,
    dynamicStateCount: u32 = 0,
    pDynamicStates: [*c]const VkDynamicState = null,
};
pub const VkPipelineDynamicStateCreateInfo = struct_VkPipelineDynamicStateCreateInfo;
pub const struct_VkPipelineInputAssemblyStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineInputAssemblyStateCreateFlags = 0,
    topology: VkPrimitiveTopology = @import("std").mem.zeroes(VkPrimitiveTopology),
    primitiveRestartEnable: VkBool32 = 0,
};
pub const VkPipelineInputAssemblyStateCreateInfo = struct_VkPipelineInputAssemblyStateCreateInfo;
pub const struct_VkPipelineMultisampleStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineMultisampleStateCreateFlags = 0,
    rasterizationSamples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    sampleShadingEnable: VkBool32 = 0,
    minSampleShading: f32 = 0,
    pSampleMask: [*c]const VkSampleMask = null,
    alphaToCoverageEnable: VkBool32 = 0,
    alphaToOneEnable: VkBool32 = 0,
};
pub const VkPipelineMultisampleStateCreateInfo = struct_VkPipelineMultisampleStateCreateInfo;
pub const struct_VkPipelineRasterizationStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineRasterizationStateCreateFlags = 0,
    depthClampEnable: VkBool32 = 0,
    rasterizerDiscardEnable: VkBool32 = 0,
    polygonMode: VkPolygonMode = @import("std").mem.zeroes(VkPolygonMode),
    cullMode: VkCullModeFlags = 0,
    frontFace: VkFrontFace = @import("std").mem.zeroes(VkFrontFace),
    depthBiasEnable: VkBool32 = 0,
    depthBiasConstantFactor: f32 = 0,
    depthBiasClamp: f32 = 0,
    depthBiasSlopeFactor: f32 = 0,
    lineWidth: f32 = 0,
};
pub const VkPipelineRasterizationStateCreateInfo = struct_VkPipelineRasterizationStateCreateInfo;
pub const struct_VkPipelineTessellationStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineTessellationStateCreateFlags = 0,
    patchControlPoints: u32 = 0,
};
pub const VkPipelineTessellationStateCreateInfo = struct_VkPipelineTessellationStateCreateInfo;
pub const struct_VkPipelineVertexInputStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineVertexInputStateCreateFlags = 0,
    vertexBindingDescriptionCount: u32 = 0,
    pVertexBindingDescriptions: [*c]const VkVertexInputBindingDescription = null,
    vertexAttributeDescriptionCount: u32 = 0,
    pVertexAttributeDescriptions: [*c]const VkVertexInputAttributeDescription = null,
};
pub const VkPipelineVertexInputStateCreateInfo = struct_VkPipelineVertexInputStateCreateInfo;
pub const struct_VkPipelineViewportStateCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineViewportStateCreateFlags = 0,
    viewportCount: u32 = 0,
    pViewports: [*c]const VkViewport = null,
    scissorCount: u32 = 0,
    pScissors: [*c]const VkRect2D = null,
};
pub const VkPipelineViewportStateCreateInfo = struct_VkPipelineViewportStateCreateInfo;
pub const struct_VkGraphicsPipelineCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkPipelineCreateFlags = 0,
    stageCount: u32 = 0,
    pStages: [*c]const VkPipelineShaderStageCreateInfo = null,
    pVertexInputState: [*c]const VkPipelineVertexInputStateCreateInfo = null,
    pInputAssemblyState: [*c]const VkPipelineInputAssemblyStateCreateInfo = null,
    pTessellationState: [*c]const VkPipelineTessellationStateCreateInfo = null,
    pViewportState: [*c]const VkPipelineViewportStateCreateInfo = null,
    pRasterizationState: [*c]const VkPipelineRasterizationStateCreateInfo = null,
    pMultisampleState: [*c]const VkPipelineMultisampleStateCreateInfo = null,
    pDepthStencilState: [*c]const VkPipelineDepthStencilStateCreateInfo = null,
    pColorBlendState: [*c]const VkPipelineColorBlendStateCreateInfo = null,
    pDynamicState: [*c]const VkPipelineDynamicStateCreateInfo = null,
    layout: VkPipelineLayout = null,
    renderPass: VkRenderPass = null,
    subpass: u32 = 0,
    basePipelineHandle: VkPipeline = null,
    basePipelineIndex: i32 = 0,
};
pub const VkGraphicsPipelineCreateInfo = struct_VkGraphicsPipelineCreateInfo;
pub const struct_VkAttachmentDescription = extern struct {
    flags: VkAttachmentDescriptionFlags = 0,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    samples: VkSampleCountFlagBits = @import("std").mem.zeroes(VkSampleCountFlagBits),
    loadOp: VkAttachmentLoadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
    storeOp: VkAttachmentStoreOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
    stencilLoadOp: VkAttachmentLoadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
    stencilStoreOp: VkAttachmentStoreOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
    initialLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    finalLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkAttachmentDescription = struct_VkAttachmentDescription;
pub const struct_VkAttachmentReference = extern struct {
    attachment: u32 = 0,
    layout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
};
pub const VkAttachmentReference = struct_VkAttachmentReference;
pub const struct_VkFramebufferCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkFramebufferCreateFlags = 0,
    renderPass: VkRenderPass = null,
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkImageView = null,
    width: u32 = 0,
    height: u32 = 0,
    layers: u32 = 0,
};
pub const VkFramebufferCreateInfo = struct_VkFramebufferCreateInfo;
pub const struct_VkSubpassDependency = extern struct {
    srcSubpass: u32 = 0,
    dstSubpass: u32 = 0,
    srcStageMask: VkPipelineStageFlags = 0,
    dstStageMask: VkPipelineStageFlags = 0,
    srcAccessMask: VkAccessFlags = 0,
    dstAccessMask: VkAccessFlags = 0,
    dependencyFlags: VkDependencyFlags = 0,
};
pub const VkSubpassDependency = struct_VkSubpassDependency;
pub const struct_VkSubpassDescription = extern struct {
    flags: VkSubpassDescriptionFlags = 0,
    pipelineBindPoint: VkPipelineBindPoint = @import("std").mem.zeroes(VkPipelineBindPoint),
    inputAttachmentCount: u32 = 0,
    pInputAttachments: [*c]const VkAttachmentReference = null,
    colorAttachmentCount: u32 = 0,
    pColorAttachments: [*c]const VkAttachmentReference = null,
    pResolveAttachments: [*c]const VkAttachmentReference = null,
    pDepthStencilAttachment: [*c]const VkAttachmentReference = null,
    preserveAttachmentCount: u32 = 0,
    pPreserveAttachments: [*c]const u32 = null,
};
pub const VkSubpassDescription = struct_VkSubpassDescription;
pub const struct_VkRenderPassCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkRenderPassCreateFlags = 0,
    attachmentCount: u32 = 0,
    pAttachments: [*c]const VkAttachmentDescription = null,
    subpassCount: u32 = 0,
    pSubpasses: [*c]const VkSubpassDescription = null,
    dependencyCount: u32 = 0,
    pDependencies: [*c]const VkSubpassDependency = null,
};
pub const VkRenderPassCreateInfo = struct_VkRenderPassCreateInfo;
pub const struct_VkClearDepthStencilValue = extern struct {
    depth: f32 = 0,
    stencil: u32 = 0,
};
pub const VkClearDepthStencilValue = struct_VkClearDepthStencilValue;
pub const union_VkClearValue = extern union {
    color: VkClearColorValue,
    depthStencil: VkClearDepthStencilValue,
};
pub const VkClearValue = union_VkClearValue;
pub const struct_VkRenderPassBeginInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    renderPass: VkRenderPass = null,
    framebuffer: VkFramebuffer = null,
    renderArea: VkRect2D = @import("std").mem.zeroes(VkRect2D),
    clearValueCount: u32 = 0,
    pClearValues: [*c]const VkClearValue = null,
};
pub const VkRenderPassBeginInfo = struct_VkRenderPassBeginInfo;
pub const PFN_vkCreateInstance = ?*const fn (pCreateInfo: [*c]const VkInstanceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pInstance: [*c]VkInstance) callconv(.c) VkResult;
pub const PFN_vkDestroyInstance = ?*const fn (instance: VkInstance, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkEnumeratePhysicalDevices = ?*const fn (instance: VkInstance, pPhysicalDeviceCount: [*c]u32, pPhysicalDevices: [*c]VkPhysicalDevice) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceFeatures = ?*const fn (physicalDevice: VkPhysicalDevice, pFeatures: [*c]VkPhysicalDeviceFeatures) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceImageFormatProperties = ?*const fn (physicalDevice: VkPhysicalDevice, format: VkFormat, @"type": VkImageType, tiling: VkImageTiling, usage: VkImageUsageFlags, flags: VkImageCreateFlags, pImageFormatProperties: [*c]VkImageFormatProperties) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pProperties: [*c]VkPhysicalDeviceProperties) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceQueueFamilyProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pQueueFamilyPropertyCount: [*c]u32, pQueueFamilyProperties: [*c]VkQueueFamilyProperties) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceMemoryProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pMemoryProperties: [*c]VkPhysicalDeviceMemoryProperties) callconv(.c) void;
pub const PFN_vkGetInstanceProcAddr = ?*const fn (instance: VkInstance, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkGetDeviceProcAddr = ?*const fn (device: VkDevice, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkCreateDevice = ?*const fn (physicalDevice: VkPhysicalDevice, pCreateInfo: [*c]const VkDeviceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pDevice: [*c]VkDevice) callconv(.c) VkResult;
pub const PFN_vkDestroyDevice = ?*const fn (device: VkDevice, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkEnumerateInstanceExtensionProperties = ?*const fn (pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const PFN_vkEnumerateDeviceExtensionProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const PFN_vkEnumerateInstanceLayerProperties = ?*const fn (pPropertyCount: [*c]u32, pProperties: [*c]VkLayerProperties) callconv(.c) VkResult;
pub const PFN_vkGetDeviceQueue = ?*const fn (device: VkDevice, queueFamilyIndex: u32, queueIndex: u32, pQueue: [*c]VkQueue) callconv(.c) void;
pub const PFN_vkQueueSubmit = ?*const fn (queue: VkQueue, submitCount: u32, pSubmits: [*c]const VkSubmitInfo, fence: VkFence) callconv(.c) VkResult;
pub const PFN_vkQueueWaitIdle = ?*const fn (queue: VkQueue) callconv(.c) VkResult;
pub const PFN_vkDeviceWaitIdle = ?*const fn (device: VkDevice) callconv(.c) VkResult;
pub const PFN_vkAllocateMemory = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkMemoryAllocateInfo, pAllocator: [*c]const VkAllocationCallbacks, pMemory: [*c]VkDeviceMemory) callconv(.c) VkResult;
pub const PFN_vkFreeMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkMapMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory, offset: VkDeviceSize, size: VkDeviceSize, flags: VkMemoryMapFlags, ppData: [*c]?*anyopaque) callconv(.c) VkResult;
pub const PFN_vkUnmapMemory = ?*const fn (device: VkDevice, memory: VkDeviceMemory) callconv(.c) void;
pub const PFN_vkBindBufferMemory = ?*const fn (device: VkDevice, buffer: VkBuffer, memory: VkDeviceMemory, memoryOffset: VkDeviceSize) callconv(.c) VkResult;
pub const PFN_vkBindImageMemory = ?*const fn (device: VkDevice, image: VkImage, memory: VkDeviceMemory, memoryOffset: VkDeviceSize) callconv(.c) VkResult;
pub const PFN_vkGetBufferMemoryRequirements = ?*const fn (device: VkDevice, buffer: VkBuffer, pMemoryRequirements: [*c]VkMemoryRequirements) callconv(.c) void;
pub const PFN_vkGetImageMemoryRequirements = ?*const fn (device: VkDevice, image: VkImage, pMemoryRequirements: [*c]VkMemoryRequirements) callconv(.c) void;
pub const PFN_vkCreateFence = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkFenceCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pFence: [*c]VkFence) callconv(.c) VkResult;
pub const PFN_vkDestroyFence = ?*const fn (device: VkDevice, fence: VkFence, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetFences = ?*const fn (device: VkDevice, fenceCount: u32, pFences: [*c]const VkFence) callconv(.c) VkResult;
pub const PFN_vkGetFenceStatus = ?*const fn (device: VkDevice, fence: VkFence) callconv(.c) VkResult;
pub const PFN_vkWaitForFences = ?*const fn (device: VkDevice, fenceCount: u32, pFences: [*c]const VkFence, waitAll: VkBool32, timeout: u64) callconv(.c) VkResult;
pub const PFN_vkCreateSemaphore = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSemaphoreCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSemaphore: [*c]VkSemaphore) callconv(.c) VkResult;
pub const PFN_vkDestroySemaphore = ?*const fn (device: VkDevice, semaphore: VkSemaphore, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateBuffer = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkBufferCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pBuffer: [*c]VkBuffer) callconv(.c) VkResult;
pub const PFN_vkDestroyBuffer = ?*const fn (device: VkDevice, buffer: VkBuffer, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateImage = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkImageCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pImage: [*c]VkImage) callconv(.c) VkResult;
pub const PFN_vkDestroyImage = ?*const fn (device: VkDevice, image: VkImage, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateImageView = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkImageViewCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pView: [*c]VkImageView) callconv(.c) VkResult;
pub const PFN_vkDestroyImageView = ?*const fn (device: VkDevice, imageView: VkImageView, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateCommandPool = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkCommandPoolCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pCommandPool: [*c]VkCommandPool) callconv(.c) VkResult;
pub const PFN_vkDestroyCommandPool = ?*const fn (device: VkDevice, commandPool: VkCommandPool, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetCommandPool = ?*const fn (device: VkDevice, commandPool: VkCommandPool, flags: VkCommandPoolResetFlags) callconv(.c) VkResult;
pub const PFN_vkAllocateCommandBuffers = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkCommandBufferAllocateInfo, pCommandBuffers: [*c]VkCommandBuffer) callconv(.c) VkResult;
pub const PFN_vkFreeCommandBuffers = ?*const fn (device: VkDevice, commandPool: VkCommandPool, commandBufferCount: u32, pCommandBuffers: [*c]const VkCommandBuffer) callconv(.c) void;
pub const PFN_vkBeginCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer, pBeginInfo: [*c]const VkCommandBufferBeginInfo) callconv(.c) VkResult;
pub const PFN_vkEndCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer) callconv(.c) VkResult;
pub const PFN_vkResetCommandBuffer = ?*const fn (commandBuffer: VkCommandBuffer, flags: VkCommandBufferResetFlags) callconv(.c) VkResult;
pub const PFN_vkCmdCopyBufferToImage = ?*const fn (commandBuffer: VkCommandBuffer, srcBuffer: VkBuffer, dstImage: VkImage, dstImageLayout: VkImageLayout, regionCount: u32, pRegions: [*c]const VkBufferImageCopy) callconv(.c) void;
pub const PFN_vkCmdCopyImageToBuffer = ?*const fn (commandBuffer: VkCommandBuffer, srcImage: VkImage, srcImageLayout: VkImageLayout, dstBuffer: VkBuffer, regionCount: u32, pRegions: [*c]const VkBufferImageCopy) callconv(.c) void;
pub const PFN_vkCmdPipelineBarrier = ?*const fn (commandBuffer: VkCommandBuffer, srcStageMask: VkPipelineStageFlags, dstStageMask: VkPipelineStageFlags, dependencyFlags: VkDependencyFlags, memoryBarrierCount: u32, pMemoryBarriers: [*c]const VkMemoryBarrier, bufferMemoryBarrierCount: u32, pBufferMemoryBarriers: [*c]const VkBufferMemoryBarrier, imageMemoryBarrierCount: u32, pImageMemoryBarriers: [*c]const VkImageMemoryBarrier) callconv(.c) void;
pub const PFN_vkCreateShaderModule = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkShaderModuleCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pShaderModule: [*c]VkShaderModule) callconv(.c) VkResult;
pub const PFN_vkDestroyShaderModule = ?*const fn (device: VkDevice, shaderModule: VkShaderModule, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkDestroyPipeline = ?*const fn (device: VkDevice, pipeline: VkPipeline, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreatePipelineLayout = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkPipelineLayoutCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelineLayout: [*c]VkPipelineLayout) callconv(.c) VkResult;
pub const PFN_vkDestroyPipelineLayout = ?*const fn (device: VkDevice, pipelineLayout: VkPipelineLayout, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateSampler = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSamplerCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSampler: [*c]VkSampler) callconv(.c) VkResult;
pub const PFN_vkDestroySampler = ?*const fn (device: VkDevice, sampler: VkSampler, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateDescriptorSetLayout = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkDescriptorSetLayoutCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pSetLayout: [*c]VkDescriptorSetLayout) callconv(.c) VkResult;
pub const PFN_vkDestroyDescriptorSetLayout = ?*const fn (device: VkDevice, descriptorSetLayout: VkDescriptorSetLayout, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateDescriptorPool = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkDescriptorPoolCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pDescriptorPool: [*c]VkDescriptorPool) callconv(.c) VkResult;
pub const PFN_vkDestroyDescriptorPool = ?*const fn (device: VkDevice, descriptorPool: VkDescriptorPool, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkResetDescriptorPool = ?*const fn (device: VkDevice, descriptorPool: VkDescriptorPool, flags: VkDescriptorPoolResetFlags) callconv(.c) VkResult;
pub const PFN_vkAllocateDescriptorSets = ?*const fn (device: VkDevice, pAllocateInfo: [*c]const VkDescriptorSetAllocateInfo, pDescriptorSets: [*c]VkDescriptorSet) callconv(.c) VkResult;
pub const PFN_vkUpdateDescriptorSets = ?*const fn (device: VkDevice, descriptorWriteCount: u32, pDescriptorWrites: [*c]const VkWriteDescriptorSet, descriptorCopyCount: u32, pDescriptorCopies: [*c]const VkCopyDescriptorSet) callconv(.c) void;
pub const PFN_vkCmdBindPipeline = ?*const fn (commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, pipeline: VkPipeline) callconv(.c) void;
pub const PFN_vkCmdBindDescriptorSets = ?*const fn (commandBuffer: VkCommandBuffer, pipelineBindPoint: VkPipelineBindPoint, layout: VkPipelineLayout, firstSet: u32, descriptorSetCount: u32, pDescriptorSets: [*c]const VkDescriptorSet, dynamicOffsetCount: u32, pDynamicOffsets: [*c]const u32) callconv(.c) void;
pub const PFN_vkCmdClearColorImage = ?*const fn (commandBuffer: VkCommandBuffer, image: VkImage, imageLayout: VkImageLayout, pColor: [*c]const VkClearColorValue, rangeCount: u32, pRanges: [*c]const VkImageSubresourceRange) callconv(.c) void;
pub const PFN_vkCmdPushConstants = ?*const fn (commandBuffer: VkCommandBuffer, layout: VkPipelineLayout, stageFlags: VkShaderStageFlags, offset: u32, size: u32, pValues: ?*const anyopaque) callconv(.c) void;
pub const PFN_vkCreateGraphicsPipelines = ?*const fn (device: VkDevice, pipelineCache: VkPipelineCache, createInfoCount: u32, pCreateInfos: [*c]const VkGraphicsPipelineCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pPipelines: [*c]VkPipeline) callconv(.c) VkResult;
pub const PFN_vkCreateFramebuffer = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkFramebufferCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pFramebuffer: [*c]VkFramebuffer) callconv(.c) VkResult;
pub const PFN_vkDestroyFramebuffer = ?*const fn (device: VkDevice, framebuffer: VkFramebuffer, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCreateRenderPass = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkRenderPassCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pRenderPass: [*c]VkRenderPass) callconv(.c) VkResult;
pub const PFN_vkDestroyRenderPass = ?*const fn (device: VkDevice, renderPass: VkRenderPass, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkCmdSetViewport = ?*const fn (commandBuffer: VkCommandBuffer, firstViewport: u32, viewportCount: u32, pViewports: [*c]const VkViewport) callconv(.c) void;
pub const PFN_vkCmdSetScissor = ?*const fn (commandBuffer: VkCommandBuffer, firstScissor: u32, scissorCount: u32, pScissors: [*c]const VkRect2D) callconv(.c) void;
pub const PFN_vkCmdBindVertexBuffers = ?*const fn (commandBuffer: VkCommandBuffer, firstBinding: u32, bindingCount: u32, pBuffers: [*c]const VkBuffer, pOffsets: [*c]const VkDeviceSize) callconv(.c) void;
pub const PFN_vkCmdDraw = ?*const fn (commandBuffer: VkCommandBuffer, vertexCount: u32, instanceCount: u32, firstVertex: u32, firstInstance: u32) callconv(.c) void;
pub const PFN_vkCmdBeginRenderPass = ?*const fn (commandBuffer: VkCommandBuffer, pRenderPassBegin: [*c]const VkRenderPassBeginInfo, contents: VkSubpassContents) callconv(.c) void;
pub const PFN_vkCmdEndRenderPass = ?*const fn (commandBuffer: VkCommandBuffer) callconv(.c) void;
pub const struct_VkSamplerYcbcrConversion_T = opaque {};
pub const VkSamplerYcbcrConversion = ?*struct_VkSamplerYcbcrConversion_T;
pub const enum_VkSamplerYcbcrModelConversion = c_uint;
pub const VkSamplerYcbcrModelConversion = enum_VkSamplerYcbcrModelConversion;
pub const enum_VkSamplerYcbcrRange = c_uint;
pub const VkSamplerYcbcrRange = enum_VkSamplerYcbcrRange;
pub const enum_VkChromaLocation = c_uint;
pub const VkChromaLocation = enum_VkChromaLocation;
pub const struct_VkPhysicalDeviceFeatures2 = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    features: VkPhysicalDeviceFeatures = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
};
pub const VkPhysicalDeviceFeatures2 = struct_VkPhysicalDeviceFeatures2;
pub const struct_VkPhysicalDeviceProperties2 = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    properties: VkPhysicalDeviceProperties = @import("std").mem.zeroes(VkPhysicalDeviceProperties),
};
pub const VkPhysicalDeviceProperties2 = struct_VkPhysicalDeviceProperties2;
pub const struct_VkPhysicalDeviceMemoryProperties2 = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    memoryProperties: VkPhysicalDeviceMemoryProperties = @import("std").mem.zeroes(VkPhysicalDeviceMemoryProperties),
};
pub const VkPhysicalDeviceMemoryProperties2 = struct_VkPhysicalDeviceMemoryProperties2;
pub const struct_VkImageViewUsageCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    usage: VkImageUsageFlags = 0,
};
pub const VkImageViewUsageCreateInfo = struct_VkImageViewUsageCreateInfo;
pub const struct_VkSamplerYcbcrConversionCreateInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    ycbcrModel: VkSamplerYcbcrModelConversion = @import("std").mem.zeroes(VkSamplerYcbcrModelConversion),
    ycbcrRange: VkSamplerYcbcrRange = @import("std").mem.zeroes(VkSamplerYcbcrRange),
    components: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    xChromaOffset: VkChromaLocation = @import("std").mem.zeroes(VkChromaLocation),
    yChromaOffset: VkChromaLocation = @import("std").mem.zeroes(VkChromaLocation),
    chromaFilter: VkFilter = @import("std").mem.zeroes(VkFilter),
    forceExplicitReconstruction: VkBool32 = 0,
};
pub const VkSamplerYcbcrConversionCreateInfo = struct_VkSamplerYcbcrConversionCreateInfo;
pub const struct_VkSamplerYcbcrConversionInfo = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    conversion: VkSamplerYcbcrConversion = null,
};
pub const VkSamplerYcbcrConversionInfo = struct_VkSamplerYcbcrConversionInfo;
pub const struct_VkPhysicalDeviceSamplerYcbcrConversionFeatures = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*anyopaque = null,
    samplerYcbcrConversion: VkBool32 = 0,
};
pub const VkPhysicalDeviceSamplerYcbcrConversionFeatures = struct_VkPhysicalDeviceSamplerYcbcrConversionFeatures;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const VK_PRESENT_MODE_IMMEDIATE_KHR: c_int = 0;
pub const VK_PRESENT_MODE_MAILBOX_KHR: c_int = 1;
pub const VK_PRESENT_MODE_FIFO_KHR: c_int = 2;
pub const VK_PRESENT_MODE_FIFO_RELAXED_KHR: c_int = 3;
pub const enum_VkPresentModeKHR = c_uint;
pub const VkPresentModeKHR = enum_VkPresentModeKHR;
pub const VK_COLOR_SPACE_SRGB_NONLINEAR_KHR: c_int = 0;
pub const VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT: c_int = 1000104002;
pub const VK_COLOR_SPACE_HDR10_ST2084_EXT: c_int = 1000104008;
pub const VK_COLORSPACE_SRGB_NONLINEAR_KHR: c_int = 0;
pub const enum_VkColorSpaceKHR = c_uint;
pub const VkColorSpaceKHR = enum_VkColorSpaceKHR;
pub const VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR: c_int = 1;
pub const VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR: c_int = 2;
pub const VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR: c_int = 4;
pub const VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR: c_int = 8;
pub const enum_VkSurfaceTransformFlagBitsKHR = c_uint;
pub const VkSurfaceTransformFlagBitsKHR = enum_VkSurfaceTransformFlagBitsKHR;
pub const VkSurfaceTransformFlagsKHR = VkFlags;
pub const VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR: c_int = 1;
pub const VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR: c_int = 2;
pub const VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR: c_int = 4;
pub const VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR: c_int = 8;
pub const enum_VkCompositeAlphaFlagBitsKHR = c_uint;
pub const VkCompositeAlphaFlagBitsKHR = enum_VkCompositeAlphaFlagBitsKHR;
pub const VkCompositeAlphaFlagsKHR = VkFlags;
pub const struct_VkSurfaceCapabilitiesKHR = extern struct {
    minImageCount: u32 = 0,
    maxImageCount: u32 = 0,
    currentExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    minImageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxImageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxImageArrayLayers: u32 = 0,
    supportedTransforms: VkSurfaceTransformFlagsKHR = 0,
    currentTransform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    supportedCompositeAlpha: VkCompositeAlphaFlagsKHR = 0,
    supportedUsageFlags: VkImageUsageFlags = 0,
};
pub const VkSurfaceCapabilitiesKHR = struct_VkSurfaceCapabilitiesKHR;
pub const struct_VkSurfaceFormatKHR = extern struct {
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    colorSpace: VkColorSpaceKHR = @import("std").mem.zeroes(VkColorSpaceKHR),
};
pub const VkSurfaceFormatKHR = struct_VkSurfaceFormatKHR;
pub const PFN_vkDestroySurfaceKHR = ?*const fn (instance: VkInstance, surface: VkSurfaceKHR, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceSurfaceSupportKHR = ?*const fn (physicalDevice: VkPhysicalDevice, queueFamilyIndex: u32, surface: VkSurfaceKHR, pSupported: [*c]VkBool32) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceCapabilities: [*c]VkSurfaceCapabilitiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pSurfaceFormatCount: [*c]u32, pSurfaceFormats: [*c]VkSurfaceFormatKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, surface: VkSurfaceKHR, pPresentModeCount: [*c]u32, pPresentModes: [*c]VkPresentModeKHR) callconv(.c) VkResult;
pub const struct_VkSwapchainKHR_T = opaque {};
pub const VkSwapchainKHR = ?*struct_VkSwapchainKHR_T;
pub const VkSwapchainCreateFlagsKHR = VkFlags;
pub const struct_VkSwapchainCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkSwapchainCreateFlagsKHR = 0,
    surface: VkSurfaceKHR = null,
    minImageCount: u32 = 0,
    imageFormat: VkFormat = @import("std").mem.zeroes(VkFormat),
    imageColorSpace: VkColorSpaceKHR = @import("std").mem.zeroes(VkColorSpaceKHR),
    imageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    imageArrayLayers: u32 = 0,
    imageUsage: VkImageUsageFlags = 0,
    imageSharingMode: VkSharingMode = @import("std").mem.zeroes(VkSharingMode),
    queueFamilyIndexCount: u32 = 0,
    pQueueFamilyIndices: [*c]const u32 = null,
    preTransform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    compositeAlpha: VkCompositeAlphaFlagBitsKHR = @import("std").mem.zeroes(VkCompositeAlphaFlagBitsKHR),
    presentMode: VkPresentModeKHR = @import("std").mem.zeroes(VkPresentModeKHR),
    clipped: VkBool32 = 0,
    oldSwapchain: VkSwapchainKHR = null,
};
pub const VkSwapchainCreateInfoKHR = struct_VkSwapchainCreateInfoKHR;
pub const struct_VkPresentInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    waitSemaphoreCount: u32 = 0,
    pWaitSemaphores: [*c]const VkSemaphore = null,
    swapchainCount: u32 = 0,
    pSwapchains: [*c]const VkSwapchainKHR = null,
    pImageIndices: [*c]const u32 = null,
    pResults: [*c]VkResult = null,
};
pub const VkPresentInfoKHR = struct_VkPresentInfoKHR;
pub const PFN_vkCreateSwapchainKHR = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSwapchainCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pSwapchain: [*c]VkSwapchainKHR) callconv(.c) VkResult;
pub const PFN_vkDestroySwapchainKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const PFN_vkGetSwapchainImagesKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, pSwapchainImageCount: [*c]u32, pSwapchainImages: [*c]VkImage) callconv(.c) VkResult;
pub const PFN_vkAcquireNextImageKHR = ?*const fn (device: VkDevice, swapchain: VkSwapchainKHR, timeout: u64, semaphore: VkSemaphore, fence: VkFence, pImageIndex: [*c]u32) callconv(.c) VkResult;
pub const PFN_vkQueuePresentKHR = ?*const fn (queue: VkQueue, pPresentInfo: [*c]const VkPresentInfoKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceFeatures2KHR = ?*const fn (physicalDevice: VkPhysicalDevice, pFeatures: [*c]VkPhysicalDeviceFeatures2) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceProperties2KHR = ?*const fn (physicalDevice: VkPhysicalDevice, pProperties: [*c]VkPhysicalDeviceProperties2) callconv(.c) void;
pub const PFN_vkGetPhysicalDeviceMemoryProperties2KHR = ?*const fn (physicalDevice: VkPhysicalDevice, pMemoryProperties: [*c]VkPhysicalDeviceMemoryProperties2) callconv(.c) void;
pub const VkSamplerYcbcrConversionKHR = VkSamplerYcbcrConversion;
pub const VkSamplerYcbcrConversionCreateInfoKHR = VkSamplerYcbcrConversionCreateInfo;
pub const VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfo;
pub const PFN_vkCreateSamplerYcbcrConversionKHR = ?*const fn (device: VkDevice, pCreateInfo: [*c]const VkSamplerYcbcrConversionCreateInfo, pAllocator: [*c]const VkAllocationCallbacks, pYcbcrConversion: [*c]VkSamplerYcbcrConversion) callconv(.c) VkResult;
pub const PFN_vkDestroySamplerYcbcrConversionKHR = ?*const fn (device: VkDevice, ycbcrConversion: VkSamplerYcbcrConversion, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub extern fn SDL_Vulkan_LoadLibrary_REAL(path: [*c]const u8) bool;
pub extern fn SDL_Vulkan_GetVkGetInstanceProcAddr_REAL() SDL_FunctionPointer;
pub extern fn SDL_Vulkan_GetInstanceExtensions_REAL(count: [*c]Uint32) [*c]const [*c]const u8;
pub extern fn SDL_Vulkan_CreateSurface_REAL(window: [*c]SDL_Window, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool;
pub extern fn SDL_Vulkan_GetResultString(result: VkResult) [*c]const u8;
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_ReconfigureWindow(window: [*c]SDL_Window, flags: SDL_WindowFlags) bool;
pub const struct_SDL_RenderDriver = extern struct {
    CreateRenderer: ?*const fn (renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) bool = null,
    name: [*c]const u8 = null,
};
pub const SDL_RenderDriver = struct_SDL_RenderDriver;
pub const SDL_RENDERCMD_NO_OP: c_int = 0;
pub const SDL_RENDERCMD_SETVIEWPORT: c_int = 1;
pub const SDL_RENDERCMD_SETCLIPRECT: c_int = 2;
pub const SDL_RENDERCMD_SETDRAWCOLOR: c_int = 3;
pub const SDL_RENDERCMD_CLEAR: c_int = 4;
pub const SDL_RENDERCMD_DRAW_POINTS: c_int = 5;
pub const SDL_RENDERCMD_DRAW_LINES: c_int = 6;
pub const SDL_RENDERCMD_FILL_RECTS: c_int = 7;
pub const SDL_RENDERCMD_COPY: c_int = 8;
pub const SDL_RENDERCMD_COPY_EX: c_int = 9;
pub const SDL_RENDERCMD_GEOMETRY: c_int = 10;
pub const SDL_RenderCommandType = c_uint;
pub const SDL_RenderLineMethod = c_uint;
pub extern fn SDL_AddSupportedTextureFormat(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat) bool;
pub extern fn SDL_SetupRendererColorspace(renderer: [*c]SDL_Renderer, props: SDL_PropertiesID) void;
pub extern fn SDL_ConvertToLinear(renderer: [*c]SDL_Renderer, color: [*c]SDL_FColor) void;
pub extern fn SDL_GetBlendModeSrcColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeColorOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub extern fn SDL_GetBlendModeSrcAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeAlphaOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub extern fn SDL_AllocateRenderVertices(renderer: [*c]SDL_Renderer, numbytes: usize, alignment: usize, offset: [*c]usize) ?*anyopaque;
const struct_unnamed_41 = extern struct {
    _11: f32 = 0,
    _12: f32 = 0,
    _13: f32 = 0,
    _14: f32 = 0,
    _21: f32 = 0,
    _22: f32 = 0,
    _23: f32 = 0,
    _24: f32 = 0,
    _31: f32 = 0,
    _32: f32 = 0,
    _33: f32 = 0,
    _34: f32 = 0,
    _41: f32 = 0,
    _42: f32 = 0,
    _43: f32 = 0,
    _44: f32 = 0,
};
const union_unnamed_40 = extern union {
    v: struct_unnamed_41,
    m: [4][4]f32,
};
pub const Float4X4 = extern struct {
    unnamed_0: union_unnamed_40 = @import("std").mem.zeroes(union_unnamed_40),
};
pub fn MatrixIdentity() callconv(.c) Float4X4 {
    @setEvalBranchQuota(100000);
    var m: Float4X4 = undefined;
    _ = &m;
    _ = memset(@ptrCast(@alignCast(&m)), 0, @sizeOf(@TypeOf(m)));
    m.unnamed_0.v._11 = 1.0;
    m.unnamed_0.v._22 = 1.0;
    m.unnamed_0.v._33 = 1.0;
    m.unnamed_0.v._44 = 1.0;
    return m;
}
pub fn MatrixMultiply(M1: Float4X4, M2: Float4X4) callconv(.c) Float4X4 {
    @setEvalBranchQuota(100000);
    var m: Float4X4 = undefined;
    _ = &m;
    m.unnamed_0.v._11 = (((M1.unnamed_0.v._11 * M2.unnamed_0.v._11) + (M1.unnamed_0.v._12 * M2.unnamed_0.v._21)) + (M1.unnamed_0.v._13 * M2.unnamed_0.v._31)) + (M1.unnamed_0.v._14 * M2.unnamed_0.v._41);
    m.unnamed_0.v._12 = (((M1.unnamed_0.v._11 * M2.unnamed_0.v._12) + (M1.unnamed_0.v._12 * M2.unnamed_0.v._22)) + (M1.unnamed_0.v._13 * M2.unnamed_0.v._32)) + (M1.unnamed_0.v._14 * M2.unnamed_0.v._42);
    m.unnamed_0.v._13 = (((M1.unnamed_0.v._11 * M2.unnamed_0.v._13) + (M1.unnamed_0.v._12 * M2.unnamed_0.v._23)) + (M1.unnamed_0.v._13 * M2.unnamed_0.v._33)) + (M1.unnamed_0.v._14 * M2.unnamed_0.v._43);
    m.unnamed_0.v._14 = (((M1.unnamed_0.v._11 * M2.unnamed_0.v._14) + (M1.unnamed_0.v._12 * M2.unnamed_0.v._24)) + (M1.unnamed_0.v._13 * M2.unnamed_0.v._34)) + (M1.unnamed_0.v._14 * M2.unnamed_0.v._44);
    m.unnamed_0.v._21 = (((M1.unnamed_0.v._21 * M2.unnamed_0.v._11) + (M1.unnamed_0.v._22 * M2.unnamed_0.v._21)) + (M1.unnamed_0.v._23 * M2.unnamed_0.v._31)) + (M1.unnamed_0.v._24 * M2.unnamed_0.v._41);
    m.unnamed_0.v._22 = (((M1.unnamed_0.v._21 * M2.unnamed_0.v._12) + (M1.unnamed_0.v._22 * M2.unnamed_0.v._22)) + (M1.unnamed_0.v._23 * M2.unnamed_0.v._32)) + (M1.unnamed_0.v._24 * M2.unnamed_0.v._42);
    m.unnamed_0.v._23 = (((M1.unnamed_0.v._21 * M2.unnamed_0.v._13) + (M1.unnamed_0.v._22 * M2.unnamed_0.v._23)) + (M1.unnamed_0.v._23 * M2.unnamed_0.v._33)) + (M1.unnamed_0.v._24 * M2.unnamed_0.v._43);
    m.unnamed_0.v._24 = (((M1.unnamed_0.v._21 * M2.unnamed_0.v._14) + (M1.unnamed_0.v._22 * M2.unnamed_0.v._24)) + (M1.unnamed_0.v._23 * M2.unnamed_0.v._34)) + (M1.unnamed_0.v._24 * M2.unnamed_0.v._44);
    m.unnamed_0.v._31 = (((M1.unnamed_0.v._31 * M2.unnamed_0.v._11) + (M1.unnamed_0.v._32 * M2.unnamed_0.v._21)) + (M1.unnamed_0.v._33 * M2.unnamed_0.v._31)) + (M1.unnamed_0.v._34 * M2.unnamed_0.v._41);
    m.unnamed_0.v._32 = (((M1.unnamed_0.v._31 * M2.unnamed_0.v._12) + (M1.unnamed_0.v._32 * M2.unnamed_0.v._22)) + (M1.unnamed_0.v._33 * M2.unnamed_0.v._32)) + (M1.unnamed_0.v._34 * M2.unnamed_0.v._42);
    m.unnamed_0.v._33 = (((M1.unnamed_0.v._31 * M2.unnamed_0.v._13) + (M1.unnamed_0.v._32 * M2.unnamed_0.v._23)) + (M1.unnamed_0.v._33 * M2.unnamed_0.v._33)) + (M1.unnamed_0.v._34 * M2.unnamed_0.v._43);
    m.unnamed_0.v._34 = (((M1.unnamed_0.v._31 * M2.unnamed_0.v._14) + (M1.unnamed_0.v._32 * M2.unnamed_0.v._24)) + (M1.unnamed_0.v._33 * M2.unnamed_0.v._34)) + (M1.unnamed_0.v._34 * M2.unnamed_0.v._44);
    m.unnamed_0.v._41 = (((M1.unnamed_0.v._41 * M2.unnamed_0.v._11) + (M1.unnamed_0.v._42 * M2.unnamed_0.v._21)) + (M1.unnamed_0.v._43 * M2.unnamed_0.v._31)) + (M1.unnamed_0.v._44 * M2.unnamed_0.v._41);
    m.unnamed_0.v._42 = (((M1.unnamed_0.v._41 * M2.unnamed_0.v._12) + (M1.unnamed_0.v._42 * M2.unnamed_0.v._22)) + (M1.unnamed_0.v._43 * M2.unnamed_0.v._32)) + (M1.unnamed_0.v._44 * M2.unnamed_0.v._42);
    m.unnamed_0.v._43 = (((M1.unnamed_0.v._41 * M2.unnamed_0.v._13) + (M1.unnamed_0.v._42 * M2.unnamed_0.v._23)) + (M1.unnamed_0.v._43 * M2.unnamed_0.v._33)) + (M1.unnamed_0.v._44 * M2.unnamed_0.v._43);
    m.unnamed_0.v._44 = (((M1.unnamed_0.v._41 * M2.unnamed_0.v._14) + (M1.unnamed_0.v._42 * M2.unnamed_0.v._24)) + (M1.unnamed_0.v._43 * M2.unnamed_0.v._34)) + (M1.unnamed_0.v._44 * M2.unnamed_0.v._44);
    return m;
}
pub fn MatrixRotationZ(r: f32) callconv(.c) Float4X4 {
    @setEvalBranchQuota(100000);
    var sinR: f32 = SDL_sinf_REAL(r);
    _ = &sinR;
    var cosR: f32 = SDL_cosf_REAL(r);
    _ = &cosR;
    var m: Float4X4 = undefined;
    _ = &m;
    _ = memset(@ptrCast(@alignCast(&m)), 0, @sizeOf(@TypeOf(m)));
    m.unnamed_0.v._11 = cosR;
    m.unnamed_0.v._12 = sinR;
    m.unnamed_0.v._21 = -sinR;
    m.unnamed_0.v._22 = cosR;
    m.unnamed_0.v._33 = 1.0;
    m.unnamed_0.v._44 = 1.0;
    return m;
}
pub extern fn SDL_PQfromNits(v: f32) f32;
pub extern fn SDL_GetYCbCRtoRGBConversionMatrix(colorspace: SDL_Colorspace, w: c_int, h: c_int, bits_per_pixel: c_int) [*c]const f32;
pub extern fn SDL_DuplicatePixels(width: c_int, height: c_int, format: SDL_PixelFormat, colorspace: SDL_Colorspace, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool;
pub const SHADER_SOLID: c_int = 0;
pub const SHADER_SOLID_PQ: c_int = 1;
pub const SHADER_RGB: c_int = 2;
pub const SHADER_ADVANCED: c_int = 3;
pub const SHADER_RGB_PQ: c_int = 4;
pub const SHADER_RGB_SIMPLE: c_int = 5;
pub const NUM_SHADERS: c_int = 6;
pub const VULKAN_Shader = c_uint;
pub extern fn VULKAN_GetVertexShader(shader: VULKAN_Shader, outBytecode: [*c][*c]const u32, outSize: [*c]usize) void;
pub extern fn VULKAN_GetPixelShader(shader: VULKAN_Shader, outBytecode: [*c][*c]const u32, outSize: [*c]usize) void;
pub var vkAcquireNextImageKHR: PFN_vkAcquireNextImageKHR = null;
pub var vkAllocateCommandBuffers: PFN_vkAllocateCommandBuffers = null;
pub var vkAllocateDescriptorSets: PFN_vkAllocateDescriptorSets = null;
pub var vkAllocateMemory: PFN_vkAllocateMemory = null;
pub var vkBeginCommandBuffer: PFN_vkBeginCommandBuffer = null;
pub var vkBindBufferMemory: PFN_vkBindBufferMemory = null;
pub var vkBindImageMemory: PFN_vkBindImageMemory = null;
pub var vkCmdBeginRenderPass: PFN_vkCmdBeginRenderPass = null;
pub var vkCmdBindDescriptorSets: PFN_vkCmdBindDescriptorSets = null;
pub var vkCmdBindPipeline: PFN_vkCmdBindPipeline = null;
pub var vkCmdBindVertexBuffers: PFN_vkCmdBindVertexBuffers = null;
pub var vkCmdClearColorImage: PFN_vkCmdClearColorImage = null;
pub var vkCmdCopyBufferToImage: PFN_vkCmdCopyBufferToImage = null;
pub var vkCmdCopyImageToBuffer: PFN_vkCmdCopyImageToBuffer = null;
pub var vkCmdDraw: PFN_vkCmdDraw = null;
pub var vkCmdEndRenderPass: PFN_vkCmdEndRenderPass = null;
pub var vkCmdPipelineBarrier: PFN_vkCmdPipelineBarrier = null;
pub var vkCmdPushConstants: PFN_vkCmdPushConstants = null;
pub var vkCmdSetScissor: PFN_vkCmdSetScissor = null;
pub var vkCmdSetViewport: PFN_vkCmdSetViewport = null;
pub var vkCreateBuffer: PFN_vkCreateBuffer = null;
pub var vkCreateCommandPool: PFN_vkCreateCommandPool = null;
pub var vkCreateDescriptorPool: PFN_vkCreateDescriptorPool = null;
pub var vkCreateDescriptorSetLayout: PFN_vkCreateDescriptorSetLayout = null;
pub var vkCreateFence: PFN_vkCreateFence = null;
pub var vkCreateFramebuffer: PFN_vkCreateFramebuffer = null;
pub var vkCreateGraphicsPipelines: PFN_vkCreateGraphicsPipelines = null;
pub var vkCreateImage: PFN_vkCreateImage = null;
pub var vkCreateImageView: PFN_vkCreateImageView = null;
pub var vkCreatePipelineLayout: PFN_vkCreatePipelineLayout = null;
pub var vkCreateRenderPass: PFN_vkCreateRenderPass = null;
pub var vkCreateSampler: PFN_vkCreateSampler = null;
pub var vkCreateSemaphore: PFN_vkCreateSemaphore = null;
pub var vkCreateShaderModule: PFN_vkCreateShaderModule = null;
pub var vkCreateSwapchainKHR: PFN_vkCreateSwapchainKHR = null;
pub var vkDestroyBuffer: PFN_vkDestroyBuffer = null;
pub var vkDestroyCommandPool: PFN_vkDestroyCommandPool = null;
pub var vkDestroyDevice: PFN_vkDestroyDevice = null;
pub var vkDestroyDescriptorPool: PFN_vkDestroyDescriptorPool = null;
pub var vkDestroyDescriptorSetLayout: PFN_vkDestroyDescriptorSetLayout = null;
pub var vkDestroyFence: PFN_vkDestroyFence = null;
pub var vkDestroyFramebuffer: PFN_vkDestroyFramebuffer = null;
pub var vkDestroyImage: PFN_vkDestroyImage = null;
pub var vkDestroyImageView: PFN_vkDestroyImageView = null;
pub var vkDestroyPipeline: PFN_vkDestroyPipeline = null;
pub var vkDestroyPipelineLayout: PFN_vkDestroyPipelineLayout = null;
pub var vkDestroyRenderPass: PFN_vkDestroyRenderPass = null;
pub var vkDestroySampler: PFN_vkDestroySampler = null;
pub var vkDestroySemaphore: PFN_vkDestroySemaphore = null;
pub var vkDestroyShaderModule: PFN_vkDestroyShaderModule = null;
pub var vkDestroySwapchainKHR: PFN_vkDestroySwapchainKHR = null;
pub var vkDeviceWaitIdle: PFN_vkDeviceWaitIdle = null;
pub var vkEndCommandBuffer: PFN_vkEndCommandBuffer = null;
pub var vkFreeCommandBuffers: PFN_vkFreeCommandBuffers = null;
pub var vkFreeMemory: PFN_vkFreeMemory = null;
pub var vkGetBufferMemoryRequirements: PFN_vkGetBufferMemoryRequirements = null;
pub var vkGetImageMemoryRequirements: PFN_vkGetImageMemoryRequirements = null;
pub var vkGetDeviceQueue: PFN_vkGetDeviceQueue = null;
pub var vkGetFenceStatus: PFN_vkGetFenceStatus = null;
pub var vkGetSwapchainImagesKHR: PFN_vkGetSwapchainImagesKHR = null;
pub var vkMapMemory: PFN_vkMapMemory = null;
pub var vkQueuePresentKHR: PFN_vkQueuePresentKHR = null;
pub var vkQueueSubmit: PFN_vkQueueSubmit = null;
pub var vkResetCommandBuffer: PFN_vkResetCommandBuffer = null;
pub var vkResetCommandPool: PFN_vkResetCommandPool = null;
pub var vkResetDescriptorPool: PFN_vkResetDescriptorPool = null;
pub var vkResetFences: PFN_vkResetFences = null;
pub var vkUnmapMemory: PFN_vkUnmapMemory = null;
pub var vkUpdateDescriptorSets: PFN_vkUpdateDescriptorSets = null;
pub var vkWaitForFences: PFN_vkWaitForFences = null;
pub var vkCreateInstance: PFN_vkCreateInstance = null;
pub var vkEnumerateInstanceExtensionProperties: PFN_vkEnumerateInstanceExtensionProperties = null;
pub var vkEnumerateInstanceLayerProperties: PFN_vkEnumerateInstanceLayerProperties = null;
pub var vkCreateDevice: PFN_vkCreateDevice = null;
pub var vkDestroyInstance: PFN_vkDestroyInstance = null;
pub var vkDestroySurfaceKHR: PFN_vkDestroySurfaceKHR = null;
pub var vkEnumerateDeviceExtensionProperties: PFN_vkEnumerateDeviceExtensionProperties = null;
pub var vkEnumeratePhysicalDevices: PFN_vkEnumeratePhysicalDevices = null;
pub var vkGetDeviceProcAddr: PFN_vkGetDeviceProcAddr = null;
pub var vkGetPhysicalDeviceFeatures: PFN_vkGetPhysicalDeviceFeatures = null;
pub var vkGetPhysicalDeviceImageFormatProperties: PFN_vkGetPhysicalDeviceImageFormatProperties = null;
pub var vkGetPhysicalDeviceProperties: PFN_vkGetPhysicalDeviceProperties = null;
pub var vkGetPhysicalDeviceMemoryProperties: PFN_vkGetPhysicalDeviceMemoryProperties = null;
pub var vkGetPhysicalDeviceQueueFamilyProperties: PFN_vkGetPhysicalDeviceQueueFamilyProperties = null;
pub var vkGetPhysicalDeviceSurfaceCapabilitiesKHR: PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = null;
pub var vkGetPhysicalDeviceSurfaceFormatsKHR: PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = null;
pub var vkGetPhysicalDeviceSurfacePresentModesKHR: PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = null;
pub var vkGetPhysicalDeviceSurfaceSupportKHR: PFN_vkGetPhysicalDeviceSurfaceSupportKHR = null;
pub var vkQueueWaitIdle: PFN_vkQueueWaitIdle = null;
pub var vkGetPhysicalDeviceFeatures2KHR: PFN_vkGetPhysicalDeviceFeatures2KHR = null;
pub var vkGetPhysicalDeviceMemoryProperties2KHR: PFN_vkGetPhysicalDeviceMemoryProperties2KHR = null;
pub var vkGetPhysicalDeviceProperties2KHR: PFN_vkGetPhysicalDeviceProperties2KHR = null;
pub var vkCreateSamplerYcbcrConversionKHR: PFN_vkCreateSamplerYcbcrConversionKHR = null;
pub var vkDestroySamplerYcbcrConversionKHR: PFN_vkDestroySamplerYcbcrConversionKHR = null;
pub const VULKAN_RENDERPASS_LOAD: c_int = 0;
pub const VULKAN_RENDERPASS_CLEAR: c_int = 1;
pub const VULKAN_RENDERPASS_COUNT: c_int = 2;
pub const VULKAN_VertexShaderConstants = extern struct {
    model: Float4X4 = @import("std").mem.zeroes(Float4X4),
    projectionAndView: Float4X4 = @import("std").mem.zeroes(Float4X4),
};
pub const TONEMAP_NONE: f32 = @floatFromInt(@as(c_int, 0));
pub const TONEMAP_CHROME: f32 = @floatFromInt(@as(c_int, 2));
pub const TEXTURETYPE_RGB: f32 = @floatFromInt(@as(c_int, 1));
pub const TEXTURETYPE_RGB_PIXELART: f32 = @floatFromInt(@as(c_int, 2));
pub const TEXTURETYPE_PALETTE_NEAREST: f32 = @floatFromInt(@as(c_int, 3));
pub const TEXTURETYPE_PALETTE_LINEAR: f32 = @floatFromInt(@as(c_int, 4));
pub const TEXTURETYPE_PALETTE_PIXELART: f32 = @floatFromInt(@as(c_int, 5));
pub const TEXTURETYPE_NV12: f32 = @floatFromInt(@as(c_int, 6));
pub const TEXTURETYPE_NV21: f32 = @floatFromInt(@as(c_int, 7));
pub const TEXTURETYPE_YUV: f32 = @floatFromInt(@as(c_int, 8));
pub const INPUTTYPE_UNSPECIFIED: f32 = @floatFromInt(@as(c_int, 0));
pub const INPUTTYPE_SRGB: f32 = @floatFromInt(@as(c_int, 1));
pub const INPUTTYPE_SCRGB: f32 = @floatFromInt(@as(c_int, 2));
pub const INPUTTYPE_HDR10: f32 = @floatFromInt(@as(c_int, 3));
pub const VULKAN_PixelShaderConstants = extern struct {
    scRGB_output: f32 = 0,
    texture_type: f32 = 0,
    input_type: f32 = 0,
    color_scale: f32 = 0,
    texel_width: f32 = 0,
    texel_height: f32 = 0,
    texture_width: f32 = 0,
    texture_height: f32 = 0,
    tonemap_method: f32 = 0,
    tonemap_factor1: f32 = 0,
    tonemap_factor2: f32 = 0,
    sdr_white_point: f32 = 0,
    YCbCr_matrix: [16]f32 = @import("std").mem.zeroes([16]f32),
};
pub const VULKAN_VertexPositionColor = extern struct {
    pos: [2]f32 = @import("std").mem.zeroes([2]f32),
    tex: [2]f32 = @import("std").mem.zeroes([2]f32),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
pub const VULKAN_ExternalBufferInfo = extern struct {
    dummy: c_int = 0,
};
pub const VULKAN_Buffer = extern struct {
    deviceMemory: VkDeviceMemory = null,
    buffer: VkBuffer = null,
    size: VkDeviceSize = 0,
    mappedBufferPtr: ?*anyopaque = null,
};
pub const VULKAN_Image = extern struct {
    allocatedImage: bool = false,
    image: VkImage = null,
    deviceMemory: VkDeviceMemory = null,
    imageLayout: VkImageLayout = @import("std").mem.zeroes(VkImageLayout),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
};
pub const VULKAN_PaletteData = extern struct {
    image: VULKAN_Image = @import("std").mem.zeroes(VULKAN_Image),
    imageView: VkImageView = null,
};
pub const VULKAN_YUVPipelineCreateInfo = extern struct {
    externalFormat: Uint64 = 0,
    filter: VkFilter = @import("std").mem.zeroes(VkFilter),
    samplerYcbcrConversionCreateInfo: VkSamplerYcbcrConversionCreateInfoKHR = @import("std").mem.zeroes(VkSamplerYcbcrConversionCreateInfoKHR),
};
pub const struct_VULKAN_YUVPipeline = extern struct {
    createInfo: VULKAN_YUVPipelineCreateInfo = @import("std").mem.zeroes(VULKAN_YUVPipelineCreateInfo),
    samplerYcbcrConversion: VkSamplerYcbcrConversion = null,
    samplerYcbcr: VkSampler = null,
    descriptorSetLayoutYcbcr: VkDescriptorSetLayout = null,
    pipelineLayoutYcbcr: VkPipelineLayout = null,
    next: [*c]struct_VULKAN_YUVPipeline = null,
};
pub const VULKAN_YUVPipeline = struct_VULKAN_YUVPipeline;
pub const VULKAN_TextureData = extern struct {
    numImages: c_int = 0,
    images: [3]VULKAN_Image = @import("std").mem.zeroes([3]VULKAN_Image),
    numImageViews: c_int = 0,
    imageViews: [3]VkImageView = @import("std").mem.zeroes([3]VkImageView),
    mainRenderpasses: [2]VkRenderPass = @import("std").mem.zeroes([2]VkRenderPass),
    mainFramebuffer: VkFramebuffer = null,
    stagingBuffer: VULKAN_Buffer = @import("std").mem.zeroes(VULKAN_Buffer),
    width: c_int = 0,
    height: c_int = 0,
    YCbCr_matrix: [*c]const f32 = null,
    yuvPipeline: [*c]VULKAN_YUVPipeline = null,
    pixels: [*c]Uint8 = null,
    pitch: c_int = 0,
    lockedRect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const VULKAN_PipelineState = extern struct {
    shader: VULKAN_Shader = @import("std").mem.zeroes(VULKAN_Shader),
    shader_constants: VULKAN_PixelShaderConstants = @import("std").mem.zeroes(VULKAN_PixelShaderConstants),
    blendMode: SDL_BlendMode = 0,
    topology: VkPrimitiveTopology = @import("std").mem.zeroes(VkPrimitiveTopology),
    format: VkFormat = @import("std").mem.zeroes(VkFormat),
    pipelineLayout: VkPipelineLayout = null,
    descriptorSetLayout: VkDescriptorSetLayout = null,
    pipeline: VkPipeline = null,
};
pub const VULKAN_DrawStateCache = extern struct {
    vertexBuffer: VkBuffer = null,
};
pub const VULKAN_RenderData = extern struct {
    vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = null,
    instance: VkInstance = null,
    instance_external: bool = false,
    surface: VkSurfaceKHR = null,
    surface_external: bool = false,
    physicalDevice: VkPhysicalDevice = null,
    physicalDeviceProperties: VkPhysicalDeviceProperties = @import("std").mem.zeroes(VkPhysicalDeviceProperties),
    physicalDeviceMemoryProperties: VkPhysicalDeviceMemoryProperties = @import("std").mem.zeroes(VkPhysicalDeviceMemoryProperties),
    physicalDeviceFeatures: VkPhysicalDeviceFeatures = @import("std").mem.zeroes(VkPhysicalDeviceFeatures),
    graphicsQueue: VkQueue = null,
    presentQueue: VkQueue = null,
    device: VkDevice = null,
    device_external: bool = false,
    graphicsQueueFamilyIndex: u32 = 0,
    presentQueueFamilyIndex: u32 = 0,
    swapchain: VkSwapchainKHR = null,
    commandPool: VkCommandPool = null,
    commandBuffers: [*c]VkCommandBuffer = null,
    currentCommandBufferIndex: u32 = 0,
    currentCommandBuffer: VkCommandBuffer = null,
    fences: [*c]VkFence = null,
    surfaceCapabilities: VkSurfaceCapabilitiesKHR = @import("std").mem.zeroes(VkSurfaceCapabilitiesKHR),
    surfaceFormats: [*c]VkSurfaceFormatKHR = null,
    recreateSwapchain: bool = false,
    vsync: c_int = 0,
    create_props: SDL_PropertiesID = 0,
    framebuffers: [*c]VkFramebuffer = null,
    renderPasses: [2]VkRenderPass = @import("std").mem.zeroes([2]VkRenderPass),
    currentRenderPass: VkRenderPass = null,
    vertexShaderModules: [6]VkShaderModule = @import("std").mem.zeroes([6]VkShaderModule),
    fragmentShaderModules: [6]VkShaderModule = @import("std").mem.zeroes([6]VkShaderModule),
    descriptorSetLayout: VkDescriptorSetLayout = null,
    pipelineLayout: VkPipelineLayout = null,
    vertexBuffers: [256]VULKAN_Buffer = @import("std").mem.zeroes([256]VULKAN_Buffer),
    vertexShaderConstantsData: VULKAN_VertexShaderConstants = @import("std").mem.zeroes(VULKAN_VertexShaderConstants),
    uploadBuffers: [*c][*c]VULKAN_Buffer = null,
    currentUploadBuffer: [*c]c_int = null,
    constantBuffers: [*c][*c]VULKAN_Buffer = null,
    numConstantBuffers: [*c]u32 = null,
    currentConstantBufferIndex: u32 = 0,
    currentConstantBufferOffset: i32 = 0,
    samplers: [8]VkSampler = @import("std").mem.zeroes([8]VkSampler),
    descriptorPools: [*c][*c]VkDescriptorPool = null,
    numDescriptorPools: [*c]u32 = null,
    currentDescriptorPoolIndex: u32 = 0,
    currentDescriptorSetIndex: u32 = 0,
    pipelineStateCount: c_int = 0,
    pipelineStates: [*c]VULKAN_PipelineState = null,
    currentPipelineState: [*c]VULKAN_PipelineState = null,
    yuvPipelineCache: [*c]VULKAN_YUVPipeline = null,
    supportsEXTSwapchainColorspace: bool = false,
    supportsKHRGetPhysicalDeviceProperties2: bool = false,
    supportsKHRSamplerYCbCrConversion: bool = false,
    supportsKHRExternalMemoryCapabilities: bool = false,
    supportsANDROIDExternalMemoryAndroidHardwareBuffer: bool = false,
    surfaceFormatsAllocatedCount: u32 = 0,
    surfaceFormatsCount: u32 = 0,
    swapchainDesiredImageCount: u32 = 0,
    surfaceFormat: VkSurfaceFormatKHR = @import("std").mem.zeroes(VkSurfaceFormatKHR),
    swapchainSize: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    swapChainPreTransform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    swapchainImageCount: u32 = 0,
    swapchainImages: [*c]VkImage = null,
    swapchainImageViews: [*c]VkImageView = null,
    swapchainImageLayouts: [*c]VkImageLayout = null,
    imageAvailableSemaphores: [*c]VkSemaphore = null,
    renderingFinishedSemaphores: [*c]VkSemaphore = null,
    currentImageAvailableSemaphore: VkSemaphore = null,
    currentSwapchainImageIndex: u32 = 0,
    waitDestStageMasks: [*c]VkPipelineStageFlags = null,
    waitRenderSemaphores: [*c]VkSemaphore = null,
    waitRenderSemaphoreCount: u32 = 0,
    waitRenderSemaphoreMax: u32 = 0,
    signalRenderSemaphores: [*c]VkSemaphore = null,
    signalRenderSemaphoreCount: u32 = 0,
    signalRenderSemaphoreMax: u32 = 0,
    textureRenderTarget: [*c]VULKAN_TextureData = null,
    cliprectDirty: bool = false,
    currentCliprectEnabled: bool = false,
    currentCliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    currentViewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    currentViewportRotation: c_int = 0,
    viewportDirty: bool = false,
    identity: Float4X4 = @import("std").mem.zeroes(Float4X4),
    identitySwizzle: VkComponentMapping = @import("std").mem.zeroes(VkComponentMapping),
    currentVertexBuffer: c_int = 0,
    issueBatch: bool = false,
};
const struct_unnamed_42 = extern struct {
    sdl: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    unorm: VkFormat = @import("std").mem.zeroes(VkFormat),
    srgb: VkFormat = @import("std").mem.zeroes(VkFormat),
};
pub const vk_format_map: [13]struct_unnamed_42 = [13]struct_unnamed_42{
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_BGRA32,
        .unorm = VK_FORMAT_B8G8R8A8_UNORM,
        .srgb = VK_FORMAT_B8G8R8A8_SRGB,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_RGBA32,
        .unorm = VK_FORMAT_R8G8B8A8_UNORM,
        .srgb = VK_FORMAT_R8G8B8A8_SRGB,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_ABGR2101010,
        .unorm = VK_FORMAT_A2B10G10R10_UNORM_PACK32,
        .srgb = VK_FORMAT_A2B10G10R10_UNORM_PACK32,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_RGBA64_FLOAT,
        .unorm = VK_FORMAT_R16G16B16A16_SFLOAT,
        .srgb = VK_FORMAT_R16G16B16A16_SFLOAT,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_RGB565,
        .unorm = VK_FORMAT_R5G6B5_UNORM_PACK16,
        .srgb = VK_FORMAT_R5G6B5_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_BGR565,
        .unorm = VK_FORMAT_B5G6R5_UNORM_PACK16,
        .srgb = VK_FORMAT_B5G6R5_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_RGBA5551,
        .unorm = VK_FORMAT_R5G5B5A1_UNORM_PACK16,
        .srgb = VK_FORMAT_R5G5B5A1_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_BGRA5551,
        .unorm = VK_FORMAT_B5G5R5A1_UNORM_PACK16,
        .srgb = VK_FORMAT_B5G5R5A1_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_ARGB1555,
        .unorm = VK_FORMAT_A1R5G5B5_UNORM_PACK16,
        .srgb = VK_FORMAT_A1R5G5B5_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_RGBA4444,
        .unorm = VK_FORMAT_R4G4B4A4_UNORM_PACK16,
        .srgb = VK_FORMAT_R4G4B4A4_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_BGRA4444,
        .unorm = VK_FORMAT_B4G4R4A4_UNORM_PACK16,
        .srgb = VK_FORMAT_B4G4R4A4_UNORM_PACK16,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_ARGB4444,
        .unorm = VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT,
        .srgb = VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT,
    },
    struct_unnamed_42{
        .sdl = SDL_PIXELFORMAT_ABGR4444,
        .unorm = VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT,
        .srgb = VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT,
    },
};
pub fn VULKAN_VkFormatToSDLPixelFormat(vkFormat: VkFormat) callconv(.c) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(vk_format_map)) / @sizeOf(@TypeOf(vk_format_map[@as(c_int, 0)])))) : (i += 1) {
            if ((vk_format_map[@bitCast(@as(isize, @intCast(i)))].unorm == vkFormat) or (vk_format_map[@bitCast(@as(isize, @intCast(i)))].srgb == vkFormat)) {
                return vk_format_map[@bitCast(@as(isize, @intCast(i)))].sdl;
            }
        }
    }
    return SDL_PIXELFORMAT_UNKNOWN;
}
pub fn VULKAN_GetFormatImageCount(format: SDL_PixelFormat) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 5;
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
                return 3;
            },
            7 => {
                return 1;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_GetFormatImageViewCount(format: SDL_PixelFormat) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                return 2;
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
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                return 3;
            },
            10 => {
                return 1;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_VkFormatGetNumPlanes(vkFormat: VkFormat) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (vkFormat) {
                    @as(VkFormat, VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G8_B8R8_2PLANE_420_UNORM) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                return 3;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                return 2;
            },
            8 => {
                return 1;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_GetBytesPerPixel(vkFormat: VkFormat, plane: c_int) callconv(.c) VkDeviceSize {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (vkFormat) {
                    @as(VkFormat, VK_FORMAT_R8_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_R8G8_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_R16G16_UNORM) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G8_B8R8_2PLANE_420_UNORM) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(VkFormat, VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return 1;
            },
            3 => {
                return 2;
            },
            4 => {
                return 4;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return 1;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return 2;
            },
            9 => {
                return @bitCast(@as(c_long, if (plane == @as(c_int, 0)) @as(c_int, 1) else @as(c_int, 2)));
            },
            10 => {
                return @bitCast(@as(c_long, if (plane == @as(c_int, 0)) @as(c_int, 2) else @as(c_int, 4)));
            },
            11 => {
                return @bitCast(@as(c_long, if ((VULKAN_VkFormatToSDLPixelFormat(vkFormat) != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((VULKAN_VkFormatToSDLPixelFormat(vkFormat) >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (VULKAN_VkFormatToSDLPixelFormat(vkFormat) == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((VULKAN_VkFormatToSDLPixelFormat(vkFormat) >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))));
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_GetVkImageFormat(format: SDL_PixelFormat, output_colorspace: Uint32) callconv(.c) VkFormat {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                return VK_FORMAT_R8_UNORM;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                return VK_FORMAT_G8_B8R8_2PLANE_420_UNORM;
            },
            8 => {
                return VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                return VK_FORMAT_R16_UNORM;
            },
            11 => {
                i = 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(vk_format_map)) / @sizeOf(@TypeOf(vk_format_map[@as(c_int, 0)])))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (vk_format_map[@bitCast(@as(isize, @intCast(i)))].sdl == format) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                i += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                return VK_FORMAT_UNDEFINED;
            },
            16 => {
                if ((output_colorspace == @as(Uint32, SDL_COLORSPACE_SRGB_LINEAR)) or (output_colorspace == @as(Uint32, SDL_COLORSPACE_HDR10))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            19 => {
                return vk_format_map[@bitCast(@as(isize, @intCast(i)))].srgb;
            },
            20 => {
                return vk_format_map[@bitCast(@as(isize, @intCast(i)))].unorm;
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_GetVkImageViewFormat(format: SDL_PixelFormat, plane: c_int, output_colorspace: Uint32) callconv(.c) VkFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (plane == @as(c_int, 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return VK_FORMAT_R8_UNORM;
            },
            5 => {
                return VK_FORMAT_R8G8_UNORM;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (plane == @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return VK_FORMAT_R16_UNORM;
            },
            9 => {
                return VK_FORMAT_R16G16_UNORM;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return VULKAN_GetVkImageFormat(format, output_colorspace);
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_DestroyAll(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "VULKAN_DestroyAll".*;
    };
    _ = &static_local___func__;
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    if (@as(?*anyopaque, @ptrCast(@alignCast(renderer))) == @as(?*anyopaque, null)) {
        return;
    }
    rendererData = @ptrCast(@alignCast(renderer.*.internal));
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData))) == @as(?*anyopaque, null)) {
        return;
    }
    {
        var texture: [*c]SDL_Texture = renderer.*.textures;
        _ = &texture;
        while (texture != null) : (texture = texture.*.next) {
            VULKAN_DestroyTexture(renderer, texture);
        }
    }
    {
        var pipeline: [*c]VULKAN_YUVPipeline = rendererData.*.yuvPipelineCache;
        _ = &pipeline;
        while (pipeline != null) {
            var next: [*c]VULKAN_YUVPipeline = pipeline.*.next;
            _ = &next;
            VULKAN_CleanupYUVPipeline(rendererData, pipeline);
            pipeline = next;
        }
    }
    rendererData.*.yuvPipelineCache = null;
    if (rendererData.*.waitDestStageMasks != null) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.waitDestStageMasks)));
        rendererData.*.waitDestStageMasks = null;
    }
    if (rendererData.*.waitRenderSemaphores != null) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.waitRenderSemaphores)));
        rendererData.*.waitRenderSemaphores = null;
    }
    if (rendererData.*.signalRenderSemaphores != null) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.signalRenderSemaphores)));
        rendererData.*.signalRenderSemaphores = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.surfaceFormats))) != @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.surfaceFormats)));
        rendererData.*.surfaceFormats = null;
        rendererData.*.surfaceFormatsAllocatedCount = 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.swapchainImages))) != @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImages)));
        rendererData.*.swapchainImages = null;
    }
    if (rendererData.*.swapchain != null) {
        vkDestroySwapchainKHR.?(rendererData.*.device, rendererData.*.swapchain, null);
        rendererData.*.swapchain = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.fences))) != @as(?*anyopaque, null)) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.fences[i]))) != @as(?*anyopaque, null)) {
                    vkDestroyFence.?(rendererData.*.device, rendererData.*.fences[i], null);
                    rendererData.*.fences[i] = null;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.fences)));
        rendererData.*.fences = null;
    }
    if (rendererData.*.swapchainImageViews != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.swapchainImageViews[i]))) != @as(?*anyopaque, null)) {
                    vkDestroyImageView.?(rendererData.*.device, rendererData.*.swapchainImageViews[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImageViews)));
        rendererData.*.swapchainImageViews = null;
    }
    if (rendererData.*.swapchainImageLayouts != null) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImageLayouts)));
        rendererData.*.swapchainImageLayouts = null;
    }
    if (rendererData.*.framebuffers != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.framebuffers[i]))) != @as(?*anyopaque, null)) {
                    vkDestroyFramebuffer.?(rendererData.*.device, rendererData.*.framebuffers[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.framebuffers)));
        rendererData.*.framebuffers = null;
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(rendererData.*.samplers)) / @sizeOf(@TypeOf(rendererData.*.samplers[@as(c_int, 0)])))) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.samplers[i]))) != @as(?*anyopaque, null)) {
                vkDestroySampler.?(rendererData.*.device, rendererData.*.samplers[i], null);
                rendererData.*.samplers[i] = null;
            }
        }
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(rendererData.*.vertexBuffers)) / @sizeOf(@TypeOf(rendererData.*.vertexBuffers[@as(c_int, 0)])))) : (i +%= 1) {
            VULKAN_DestroyBuffer(rendererData, &rendererData.*.vertexBuffers[i]);
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]VULKAN_Buffer, @ptrCast(@alignCast(&rendererData.*.vertexBuffers))))), 0, @sizeOf(@TypeOf(rendererData.*.vertexBuffers)));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < @as(u32, VULKAN_RENDERPASS_COUNT)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.renderPasses[i]))) != @as(?*anyopaque, null)) {
                vkDestroyRenderPass.?(rendererData.*.device, rendererData.*.renderPasses[i], null);
                rendererData.*.renderPasses[i] = null;
            }
        }
    }
    if (rendererData.*.imageAvailableSemaphores != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.imageAvailableSemaphores[i]))) != @as(?*anyopaque, null)) {
                    vkDestroySemaphore.?(rendererData.*.device, rendererData.*.imageAvailableSemaphores[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.imageAvailableSemaphores)));
        rendererData.*.imageAvailableSemaphores = null;
    }
    if (rendererData.*.renderingFinishedSemaphores != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.renderingFinishedSemaphores[i]))) != @as(?*anyopaque, null)) {
                    vkDestroySemaphore.?(rendererData.*.device, rendererData.*.renderingFinishedSemaphores[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.renderingFinishedSemaphores)));
        rendererData.*.renderingFinishedSemaphores = null;
    }
    if (rendererData.*.commandBuffers != null) {
        vkFreeCommandBuffers.?(rendererData.*.device, rendererData.*.commandPool, rendererData.*.swapchainImageCount, rendererData.*.commandBuffers);
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.commandBuffers)));
        rendererData.*.commandBuffers = null;
        rendererData.*.currentCommandBuffer = null;
        rendererData.*.currentCommandBufferIndex = 0;
    }
    if (rendererData.*.commandPool != null) {
        vkDestroyCommandPool.?(rendererData.*.device, rendererData.*.commandPool, null);
        rendererData.*.commandPool = null;
    }
    if (rendererData.*.descriptorPools != null) {
        while (true) {
            while (!(rendererData.*.numDescriptorPools != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rendererData->numDescriptorPools",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 765);
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
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: u32 = 0;
                    _ = &j;
                    while (j < rendererData.*.numDescriptorPools[i]) : (j +%= 1) {
                        if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.descriptorPools[i][j]))) != @as(?*anyopaque, null)) {
                            vkDestroyDescriptorPool.?(rendererData.*.device, rendererData.*.descriptorPools[i][j], null);
                        }
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.descriptorPools[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.descriptorPools)));
        rendererData.*.descriptorPools = null;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.numDescriptorPools)));
        rendererData.*.numDescriptorPools = null;
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (i < @as(u32, NUM_SHADERS)) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.vertexShaderModules[i]))) != @as(?*anyopaque, null)) {
                vkDestroyShaderModule.?(rendererData.*.device, rendererData.*.vertexShaderModules[i], null);
                rendererData.*.vertexShaderModules[i] = null;
            }
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.fragmentShaderModules[i]))) != @as(?*anyopaque, null)) {
                vkDestroyShaderModule.?(rendererData.*.device, rendererData.*.fragmentShaderModules[i], null);
                rendererData.*.fragmentShaderModules[i] = null;
            }
        }
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.descriptorSetLayout))) != @as(?*anyopaque, null)) {
        vkDestroyDescriptorSetLayout.?(rendererData.*.device, rendererData.*.descriptorSetLayout, null);
        rendererData.*.descriptorSetLayout = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.pipelineLayout))) != @as(?*anyopaque, null)) {
        vkDestroyPipelineLayout.?(rendererData.*.device, rendererData.*.pipelineLayout, null);
        rendererData.*.pipelineLayout = null;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < rendererData.*.pipelineStateCount) : (i += 1) {
            vkDestroyPipeline.?(rendererData.*.device, rendererData.*.pipelineStates[@bitCast(@as(isize, @intCast(i)))].pipeline, null);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.pipelineStates)));
    rendererData.*.pipelineStates = null;
    rendererData.*.pipelineStateCount = 0;
    if (rendererData.*.currentUploadBuffer != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: c_int = 0;
                    _ = &j;
                    while (j < rendererData.*.currentUploadBuffer[i]) : (j += 1) {
                        VULKAN_DestroyBuffer(rendererData, &rendererData.*.uploadBuffers[i][@bitCast(@as(isize, @intCast(j)))]);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.uploadBuffers[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.uploadBuffers)));
        rendererData.*.uploadBuffers = null;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.currentUploadBuffer)));
        rendererData.*.currentUploadBuffer = null;
    }
    if (rendererData.*.constantBuffers != null) {
        while (true) {
            while (!(rendererData.*.numConstantBuffers != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rendererData->numConstantBuffers",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 818);
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
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: u32 = 0;
                    _ = &j;
                    while (j < rendererData.*.numConstantBuffers[i]) : (j +%= 1) {
                        VULKAN_DestroyBuffer(rendererData, &rendererData.*.constantBuffers[i][j]);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.constantBuffers[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.constantBuffers)));
        rendererData.*.constantBuffers = null;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.numConstantBuffers)));
        rendererData.*.numConstantBuffers = null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.device))) != @as(?*anyopaque, null)) and !rendererData.*.device_external) {
        vkDestroyDevice.?(rendererData.*.device, null);
        rendererData.*.device = null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.surface))) != @as(?*anyopaque, null)) and !rendererData.*.surface_external) {
        vkDestroySurfaceKHR.?(rendererData.*.instance, rendererData.*.surface, null);
        rendererData.*.surface = null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.instance))) != @as(?*anyopaque, null)) and !rendererData.*.instance_external) {
        vkDestroyInstance.?(rendererData.*.instance, null);
        rendererData.*.instance = null;
    }
}
pub fn VULKAN_DestroyBuffer(rendererData: [*c]VULKAN_RenderData, vulkanBuffer: [*c]VULKAN_Buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanBuffer.*.buffer))) != @as(?*anyopaque, null)) {
        vkDestroyBuffer.?(rendererData.*.device, vulkanBuffer.*.buffer, null);
        vulkanBuffer.*.buffer = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanBuffer.*.deviceMemory))) != @as(?*anyopaque, null)) {
        vkFreeMemory.?(rendererData.*.device, vulkanBuffer.*.deviceMemory, null);
        vulkanBuffer.*.deviceMemory = null;
    }
    _ = memset(@ptrCast(@alignCast(vulkanBuffer)), 0, @sizeOf(@TypeOf(vulkanBuffer.*)));
}
pub fn VULKAN_AllocateBuffer(rendererData: [*c]VULKAN_RenderData, size: VkDeviceSize, usage: VkBufferUsageFlags, requiredMemoryProps: VkMemoryPropertyFlags, desiredMemoryProps: VkMemoryPropertyFlags, bufferOut: [*c]VULKAN_Buffer) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    var bufferCreateInfo: VkBufferCreateInfo = VkBufferCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .size = 0,
        .usage = 0,
        .sharingMode = @import("std").mem.zeroes(VkSharingMode),
        .queueFamilyIndexCount = 0,
        .pQueueFamilyIndices = null,
    };
    _ = &bufferCreateInfo;
    bufferCreateInfo.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    bufferCreateInfo.size = size;
    bufferCreateInfo.usage = usage;
    result = vkCreateBuffer.?(rendererData.*.device, &bufferCreateInfo, null, &bufferOut.*.buffer);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateBuffer()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateBuffer()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    var memoryRequirements: VkMemoryRequirements = VkMemoryRequirements{
        .size = 0,
        .alignment = 0,
        .memoryTypeBits = 0,
    };
    _ = &memoryRequirements;
    vkGetBufferMemoryRequirements.?(rendererData.*.device, bufferOut.*.buffer, &memoryRequirements);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyBuffer(rendererData, bufferOut);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetBufferMemoryRequirements()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetBufferMemoryRequirements()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    var memoryTypeIndex: u32 = 0;
    _ = &memoryTypeIndex;
    if (!VULKAN_FindMemoryTypeIndex(rendererData, memoryRequirements.memoryTypeBits, requiredMemoryProps, desiredMemoryProps, &memoryTypeIndex)) {
        VULKAN_DestroyBuffer(rendererData, bufferOut);
        return VK_ERROR_UNKNOWN;
    }
    var memoryAllocateInfo: VkMemoryAllocateInfo = VkMemoryAllocateInfo{
        .sType = 0,
        .pNext = null,
        .allocationSize = 0,
        .memoryTypeIndex = 0,
    };
    _ = &memoryAllocateInfo;
    memoryAllocateInfo.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    memoryAllocateInfo.allocationSize = memoryRequirements.size;
    memoryAllocateInfo.memoryTypeIndex = memoryTypeIndex;
    result = vkAllocateMemory.?(rendererData.*.device, &memoryAllocateInfo, null, &bufferOut.*.deviceMemory);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyBuffer(rendererData, bufferOut);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateMemory()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateMemory()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    result = vkBindBufferMemory.?(rendererData.*.device, bufferOut.*.buffer, bufferOut.*.deviceMemory, 0);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyBuffer(rendererData, bufferOut);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindBufferMemory()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindBufferMemory()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    result = vkMapMemory.?(rendererData.*.device, bufferOut.*.deviceMemory, 0, size, 0, &bufferOut.*.mappedBufferPtr);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyBuffer(rendererData, bufferOut);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkMapMemory()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkMapMemory()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    bufferOut.*.size = size;
    return result;
}
pub fn VULKAN_DestroyImage(rendererData: [*c]VULKAN_RenderData, vulkanImage: [*c]VULKAN_Image) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanImage.*.image))) != @as(?*anyopaque, null)) {
        if (vulkanImage.*.allocatedImage) {
            vkDestroyImage.?(rendererData.*.device, vulkanImage.*.image, null);
        }
        vulkanImage.*.image = null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(vulkanImage.*.deviceMemory))) != @as(?*anyopaque, null)) {
        if (vulkanImage.*.allocatedImage) {
            vkFreeMemory.?(rendererData.*.device, vulkanImage.*.deviceMemory, null);
        }
        vulkanImage.*.deviceMemory = null;
    }
}
pub fn VULKAN_AllocateImage(rendererData: [*c]VULKAN_RenderData, create_props: SDL_PropertiesID, property: [*c]const u8, width: u32, height: u32, format: VkFormat, imageUsage: VkImageUsageFlags, _: VkSamplerYcbcrConversionKHR, external: [*c]VULKAN_ExternalBufferInfo, imageOut: [*c]VULKAN_Image) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    _ = memset(@ptrCast(@alignCast(imageOut)), 0, @sizeOf(@TypeOf(imageOut.*)));
    imageOut.*.format = format;
    imageOut.*.image = @ptrFromInt(@as(usize, @intCast(SDL_GetNumberProperty_REAL(create_props, property, 0))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(imageOut.*.image))) == @as(?*anyopaque, null)) {
        imageOut.*.allocatedImage = VK_TRUE != 0;
        var imageCreateInfo: VkImageCreateInfo = VkImageCreateInfo{
            .sType = 0,
            .pNext = null,
            .flags = 0,
            .imageType = @import("std").mem.zeroes(VkImageType),
            .format = @import("std").mem.zeroes(VkFormat),
            .extent = @import("std").mem.zeroes(VkExtent3D),
            .mipLevels = 0,
            .arrayLayers = 0,
            .samples = @import("std").mem.zeroes(VkSampleCountFlagBits),
            .tiling = @import("std").mem.zeroes(VkImageTiling),
            .usage = 0,
            .sharingMode = @import("std").mem.zeroes(VkSharingMode),
            .queueFamilyIndexCount = 0,
            .pQueueFamilyIndices = null,
            .initialLayout = @import("std").mem.zeroes(VkImageLayout),
        };
        _ = &imageCreateInfo;
        imageCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
        imageCreateInfo.flags = 0;
        imageCreateInfo.imageType = VK_IMAGE_TYPE_2D;
        imageCreateInfo.format = format;
        imageCreateInfo.extent.width = width;
        imageCreateInfo.extent.height = height;
        imageCreateInfo.extent.depth = 1;
        imageCreateInfo.mipLevels = 1;
        imageCreateInfo.arrayLayers = 1;
        imageCreateInfo.samples = VK_SAMPLE_COUNT_1_BIT;
        imageCreateInfo.tiling = VK_IMAGE_TILING_OPTIMAL;
        imageCreateInfo.usage = imageUsage;
        imageCreateInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
        imageCreateInfo.queueFamilyIndexCount = 0;
        imageCreateInfo.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
        if (VULKAN_VkFormatGetNumPlanes(format) > @as(c_int, 1)) {
            imageCreateInfo.flags |= VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT;
        }
        result = vkCreateImage.?(rendererData.*.device, &imageCreateInfo, null, &imageOut.*.image);
        if (result != VK_SUCCESS) {
            VULKAN_DestroyImage(rendererData, imageOut);
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImage()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImage()"))), SDL_Vulkan_GetResultString(result));
            return result;
        }
        var memoryRequirements: VkMemoryRequirements = VkMemoryRequirements{
            .size = 0,
            .alignment = 0,
            .memoryTypeBits = 0,
        };
        _ = &memoryRequirements;
        {
            vkGetImageMemoryRequirements.?(rendererData.*.device, imageOut.*.image, &memoryRequirements);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyImage(rendererData, imageOut);
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetImageMemoryRequirements()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetImageMemoryRequirements()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
        }
        var memoryTypeIndex: u32 = 0;
        _ = &memoryTypeIndex;
        if (!VULKAN_FindMemoryTypeIndex(rendererData, memoryRequirements.memoryTypeBits, 0, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &memoryTypeIndex)) {
            VULKAN_DestroyImage(rendererData, imageOut);
            return VK_ERROR_UNKNOWN;
        }
        var memoryAllocateInfo: VkMemoryAllocateInfo = VkMemoryAllocateInfo{
            .sType = 0,
            .pNext = null,
            .allocationSize = 0,
            .memoryTypeIndex = 0,
        };
        _ = &memoryAllocateInfo;
        memoryAllocateInfo.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
        memoryAllocateInfo.allocationSize = memoryRequirements.size;
        memoryAllocateInfo.memoryTypeIndex = memoryTypeIndex;
        result = vkAllocateMemory.?(rendererData.*.device, &memoryAllocateInfo, null, &imageOut.*.deviceMemory);
        if (result != VK_SUCCESS) {
            VULKAN_DestroyImage(rendererData, imageOut);
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateMemory()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateMemory()"))), SDL_Vulkan_GetResultString(result));
            return result;
        }
        result = vkBindImageMemory.?(rendererData.*.device, imageOut.*.image, imageOut.*.deviceMemory, 0);
        if (result != VK_SUCCESS) {
            VULKAN_DestroyImage(rendererData, imageOut);
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindImageMemory()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkBindImageMemory()"))), SDL_Vulkan_GetResultString(result));
            return result;
        }
    } else {
        imageOut.*.imageLayout = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.vulkan.layout", VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL))));
    }
    if (imageOut.*.imageLayout != @as(VkImageLayout, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL)) {
        VULKAN_EnsureCommandBuffer(rendererData);
        if (external != null) {
            VULKAN_RecordExternalImageBarrier(rendererData, VK_ACCESS_NONE, VK_ACCESS_SHADER_READ_BIT, VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, imageOut.*.image, &imageOut.*.imageLayout);
        } else {
            VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_NONE, VK_ACCESS_SHADER_READ_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, imageOut.*.image, &imageOut.*.imageLayout);
        }
    }
    return VK_SUCCESS;
}
pub fn VULKAN_AllocateImageView(rendererData: [*c]VULKAN_RenderData, image: VkImage, plane: c_int, format: VkFormat, arg_imageUsage: VkImageUsageFlags, swizzle: VkComponentMapping, samplerYcbcrConversion: VkSamplerYcbcrConversionKHR, imageViewOut: [*c]VkImageView) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var imageUsage = arg_imageUsage;
    _ = &imageUsage;
    var result: VkResult = undefined;
    _ = &result;
    var samplerYcbcrConversionInfo: VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfoKHR{
        .sType = 0,
        .pNext = null,
        .conversion = null,
    };
    _ = &samplerYcbcrConversionInfo;
    var aspectMask: VkImageAspectFlags = undefined;
    _ = &aspectMask;
    if (plane < @as(c_int, 0)) {
        aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    } else {
        aspectMask = @bitCast(@as(c_int, VK_IMAGE_ASPECT_PLANE_0_BIT << @intCast(plane)));
    }
    imageUsage &= @bitCast(@as(c_int, VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT));
    var imageViewCreateInfo: VkImageViewCreateInfo = VkImageViewCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .image = null,
        .viewType = @import("std").mem.zeroes(VkImageViewType),
        .format = @import("std").mem.zeroes(VkFormat),
        .components = @import("std").mem.zeroes(VkComponentMapping),
        .subresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
    };
    _ = &imageViewCreateInfo;
    imageViewCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    imageViewCreateInfo.image = image;
    imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
    imageViewCreateInfo.format = format;
    imageViewCreateInfo.components = swizzle;
    imageViewCreateInfo.subresourceRange.aspectMask = aspectMask;
    imageViewCreateInfo.subresourceRange.baseMipLevel = 0;
    imageViewCreateInfo.subresourceRange.levelCount = 1;
    imageViewCreateInfo.subresourceRange.baseArrayLayer = 0;
    imageViewCreateInfo.subresourceRange.layerCount = 1;
    var imageViewUsageCreateInfo: VkImageViewUsageCreateInfo = VkImageViewUsageCreateInfo{
        .sType = 0,
        .pNext = null,
        .usage = 0,
    };
    _ = &imageViewUsageCreateInfo;
    imageViewUsageCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO;
    imageViewUsageCreateInfo.usage = imageUsage;
    imageViewCreateInfo.pNext = @ptrCast(@alignCast(&imageViewUsageCreateInfo));
    if (@as(?*anyopaque, @ptrCast(@alignCast(samplerYcbcrConversion))) != @as(?*anyopaque, null)) {
        samplerYcbcrConversionInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR;
        samplerYcbcrConversionInfo.conversion = samplerYcbcrConversion;
        imageViewUsageCreateInfo.pNext = @ptrCast(@alignCast(&samplerYcbcrConversionInfo));
    }
    result = vkCreateImageView.?(rendererData.*.device, &imageViewCreateInfo, null, imageViewOut);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    return VK_SUCCESS;
}
pub fn VULKAN_RecordExternalImageBarrier(rendererData: [*c]VULKAN_RenderData, sourceAccessMask: VkAccessFlags, destAccessMask: VkAccessFlags, srcStageFlags: VkPipelineStageFlags, dstStageFlags: VkPipelineStageFlags, destLayout: VkImageLayout, image: VkImage, imageLayout: [*c]VkImageLayout) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
        vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
        rendererData.*.currentRenderPass = null;
    }
    var barrier: VkImageMemoryBarrier = VkImageMemoryBarrier{
        .sType = 0,
        .pNext = null,
        .srcAccessMask = 0,
        .dstAccessMask = 0,
        .oldLayout = @import("std").mem.zeroes(VkImageLayout),
        .newLayout = @import("std").mem.zeroes(VkImageLayout),
        .srcQueueFamilyIndex = 0,
        .dstQueueFamilyIndex = 0,
        .image = null,
        .subresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
    };
    _ = &barrier;
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    barrier.srcAccessMask = sourceAccessMask;
    barrier.dstAccessMask = destAccessMask;
    barrier.oldLayout = imageLayout.*;
    barrier.newLayout = destLayout;
    barrier.srcQueueFamilyIndex = ~@as(c_uint, 2);
    barrier.dstQueueFamilyIndex = rendererData.*.graphicsQueueFamilyIndex;
    barrier.image = image;
    barrier.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    barrier.subresourceRange.baseMipLevel = 0;
    barrier.subresourceRange.levelCount = 1;
    barrier.subresourceRange.baseArrayLayer = 0;
    barrier.subresourceRange.layerCount = 1;
    vkCmdPipelineBarrier.?(rendererData.*.currentCommandBuffer, srcStageFlags, dstStageFlags, 0, 0, null, 0, null, 1, &barrier);
    imageLayout.* = destLayout;
}
pub fn VULKAN_RecordPipelineImageBarrier(rendererData: [*c]VULKAN_RenderData, sourceAccessMask: VkAccessFlags, destAccessMask: VkAccessFlags, srcStageFlags: VkPipelineStageFlags, dstStageFlags: VkPipelineStageFlags, destLayout: VkImageLayout, image: VkImage, imageLayout: [*c]VkImageLayout) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
        vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
        rendererData.*.currentRenderPass = null;
    }
    var barrier: VkImageMemoryBarrier = VkImageMemoryBarrier{
        .sType = 0,
        .pNext = null,
        .srcAccessMask = 0,
        .dstAccessMask = 0,
        .oldLayout = @import("std").mem.zeroes(VkImageLayout),
        .newLayout = @import("std").mem.zeroes(VkImageLayout),
        .srcQueueFamilyIndex = 0,
        .dstQueueFamilyIndex = 0,
        .image = null,
        .subresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
    };
    _ = &barrier;
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    barrier.srcAccessMask = sourceAccessMask;
    barrier.dstAccessMask = destAccessMask;
    barrier.oldLayout = imageLayout.*;
    barrier.newLayout = destLayout;
    barrier.srcQueueFamilyIndex = ~@as(c_uint, 0);
    barrier.dstQueueFamilyIndex = ~@as(c_uint, 0);
    barrier.image = image;
    barrier.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    barrier.subresourceRange.baseMipLevel = 0;
    barrier.subresourceRange.levelCount = 1;
    barrier.subresourceRange.baseArrayLayer = 0;
    barrier.subresourceRange.layerCount = 1;
    vkCmdPipelineBarrier.?(rendererData.*.currentCommandBuffer, srcStageFlags, dstStageFlags, 0, 0, null, 0, null, 1, &barrier);
    imageLayout.* = destLayout;
}
pub fn VULKAN_AcquireNextSwapchainImage(renderer: [*c]SDL_Renderer) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = undefined;
    _ = &result;
    rendererData.*.currentImageAvailableSemaphore = null;
    result = vkAcquireNextImageKHR.?(rendererData.*.device, rendererData.*.swapchain, @as(c_ulong, 18446744073709551615), rendererData.*.imageAvailableSemaphores[rendererData.*.currentCommandBufferIndex], null, &rendererData.*.currentSwapchainImageIndex);
    if ((result == VK_ERROR_OUT_OF_DATE_KHR) or (result == VK_ERROR_SURFACE_LOST_KHR)) {
        if (!((renderer.*.window.*.flags & @as(c_ulong, 64)) != 0)) {
            result = VULKAN_CreateWindowSizeDependentResources(renderer);
        }
        return result;
    } else if (result == VK_SUBOPTIMAL_KHR) {} else if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAcquireNextImageKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAcquireNextImageKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    rendererData.*.currentImageAvailableSemaphore = rendererData.*.imageAvailableSemaphores[rendererData.*.currentCommandBufferIndex];
    return result;
}
pub fn VULKAN_BeginRenderPass(rendererData: [*c]VULKAN_RenderData, loadOp: VkAttachmentLoadOp, clearColor: [*c]VkClearColorValue) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var framebuffer: VkFramebuffer = undefined;
    _ = &framebuffer;
    var renderPassBeginInfo: VkRenderPassBeginInfo = undefined;
    _ = &renderPassBeginInfo;
    var clearValue: VkClearValue = undefined;
    _ = &clearValue;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = @bitCast(@as(c_uint, @truncate(rendererData.*.swapchainSize.width)));
                height = @bitCast(@as(c_uint, @truncate(rendererData.*.swapchainSize.height)));
                if (rendererData.*.textureRenderTarget != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                width = rendererData.*.textureRenderTarget.*.width;
                height = rendererData.*.textureRenderTarget.*.height;
                {
                    sdl_pc = 3;
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
                switch (loadOp) {
                    @as(VkAttachmentLoadOp, VK_ATTACHMENT_LOAD_OP_CLEAR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(VkAttachmentLoadOp, VK_ATTACHMENT_LOAD_OP_LOAD) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                framebuffer = if (rendererData.*.textureRenderTarget != null) rendererData.*.textureRenderTarget.*.mainFramebuffer else rendererData.*.framebuffers[rendererData.*.currentSwapchainImageIndex];
                renderPassBeginInfo = VkRenderPassBeginInfo{
                    .sType = 0,
                    .pNext = null,
                    .renderPass = null,
                    .framebuffer = null,
                    .renderArea = @import("std").mem.zeroes(VkRect2D),
                    .clearValueCount = 0,
                    .pClearValues = null,
                };
                renderPassBeginInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
                renderPassBeginInfo.pNext = null;
                renderPassBeginInfo.renderPass = rendererData.*.currentRenderPass;
                renderPassBeginInfo.framebuffer = framebuffer;
                renderPassBeginInfo.renderArea.offset.x = 0;
                renderPassBeginInfo.renderArea.offset.y = 0;
                renderPassBeginInfo.renderArea.extent.width = @bitCast(@as(c_int, width));
                renderPassBeginInfo.renderArea.extent.height = @bitCast(@as(c_int, height));
                renderPassBeginInfo.clearValueCount = @bitCast(@as(c_int, if (@as(?*anyopaque, @ptrCast(@alignCast(clearColor))) == @as(?*anyopaque, null)) @as(c_int, 0) else @as(c_int, 1)));
                if (@as(?*anyopaque, @ptrCast(@alignCast(clearColor))) != @as(?*anyopaque, null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            5 => {
                rendererData.*.currentRenderPass = if (rendererData.*.textureRenderTarget != null) rendererData.*.textureRenderTarget.*.mainRenderpasses[VULKAN_RENDERPASS_CLEAR] else rendererData.*.renderPasses[VULKAN_RENDERPASS_CLEAR];
                {
                    sdl_pc = 4;
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
                rendererData.*.currentRenderPass = if (rendererData.*.textureRenderTarget != null) rendererData.*.textureRenderTarget.*.mainRenderpasses[VULKAN_RENDERPASS_LOAD] else rendererData.*.renderPasses[VULKAN_RENDERPASS_LOAD];
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                clearValue.color = clearColor.*;
                renderPassBeginInfo.pClearValues = &clearValue;
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
                vkCmdBeginRenderPass.?(rendererData.*.currentCommandBuffer, &renderPassBeginInfo, VK_SUBPASS_CONTENTS_INLINE);
                {}
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_EnsureCommandBuffer(rendererData: [*c]VULKAN_RenderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentCommandBuffer))) == @as(?*anyopaque, null)) {
        rendererData.*.currentCommandBuffer = rendererData.*.commandBuffers[rendererData.*.currentCommandBufferIndex];
        VULKAN_ResetCommandList(rendererData);
        if (rendererData.*.swapchainImageLayouts[rendererData.*.currentSwapchainImageIndex] == @as(VkImageLayout, VK_IMAGE_LAYOUT_UNDEFINED)) {
            VULKAN_RecordPipelineImageBarrier(rendererData, 0, @bitCast(@as(c_int, VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL, rendererData.*.swapchainImages[rendererData.*.currentSwapchainImageIndex], &rendererData.*.swapchainImageLayouts[rendererData.*.currentSwapchainImageIndex]);
        } else if (rendererData.*.swapchainImageLayouts[rendererData.*.currentCommandBufferIndex] != @as(VkImageLayout, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)) {
            VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_COLOR_ATTACHMENT_READ_BIT, @bitCast(@as(c_int, VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL, rendererData.*.swapchainImages[rendererData.*.currentSwapchainImageIndex], &rendererData.*.swapchainImageLayouts[rendererData.*.currentSwapchainImageIndex]);
        }
    }
}
pub fn VULKAN_ActivateCommandBuffer(renderer: [*c]SDL_Renderer, loadOp: VkAttachmentLoadOp, clearColor: [*c]VkClearColorValue, stateCache: [*c]VULKAN_DrawStateCache) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    VULKAN_EnsureCommandBuffer(rendererData);
    if ((@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) == @as(?*anyopaque, null)) or (loadOp == @as(VkAttachmentLoadOp, VK_ATTACHMENT_LOAD_OP_CLEAR))) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
            vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
            rendererData.*.currentRenderPass = null;
        }
        VULKAN_BeginRenderPass(rendererData, loadOp, clearColor);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(stateCache.*.vertexBuffer))) != @as(?*anyopaque, null)) {
        var offset: VkDeviceSize = 0;
        _ = &offset;
        vkCmdBindVertexBuffers.?(rendererData.*.currentCommandBuffer, 0, 1, &stateCache.*.vertexBuffer, &offset);
    }
    return @"true" != 0;
}
pub fn VULKAN_WaitForGPU(rendererData: [*c]VULKAN_RenderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = vkQueueWaitIdle.?(rendererData.*.graphicsQueue);
}
pub fn VULKAN_ResetCommandList(rendererData: [*c]VULKAN_RenderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = vkResetCommandBuffer.?(rendererData.*.currentCommandBuffer, 0);
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.numDescriptorPools[rendererData.*.currentCommandBufferIndex]) : (i +%= 1) {
            _ = vkResetDescriptorPool.?(rendererData.*.device, rendererData.*.descriptorPools[rendererData.*.currentCommandBufferIndex][i], 0);
        }
    }
    var beginInfo: VkCommandBufferBeginInfo = VkCommandBufferBeginInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .pInheritanceInfo = null,
    };
    _ = &beginInfo;
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    beginInfo.flags = 0;
    _ = vkBeginCommandBuffer.?(rendererData.*.currentCommandBuffer, &beginInfo);
    rendererData.*.currentPipelineState = null;
    rendererData.*.currentVertexBuffer = 0;
    rendererData.*.issueBatch = @"false" != 0;
    rendererData.*.cliprectDirty = @"true" != 0;
    rendererData.*.currentDescriptorSetIndex = 0;
    rendererData.*.currentDescriptorPoolIndex = 0;
    rendererData.*.currentConstantBufferOffset = -@as(c_int, 1);
    rendererData.*.currentConstantBufferIndex = 0;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < rendererData.*.currentUploadBuffer[rendererData.*.currentCommandBufferIndex]) : (i += 1) {
            VULKAN_DestroyBuffer(rendererData, &rendererData.*.uploadBuffers[rendererData.*.currentCommandBufferIndex][@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    rendererData.*.currentUploadBuffer[rendererData.*.currentCommandBufferIndex] = 0;
}
pub fn VULKAN_IssueBatch(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentCommandBuffer))) == @as(?*anyopaque, null)) {
        return VK_SUCCESS;
    }
    if (rendererData.*.currentRenderPass != null) {
        vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
        rendererData.*.currentRenderPass = null;
    }
    rendererData.*.currentPipelineState = null;
    rendererData.*.viewportDirty = @"true" != 0;
    _ = vkEndCommandBuffer.?(rendererData.*.currentCommandBuffer);
    var submitInfo: VkSubmitInfo = VkSubmitInfo{
        .sType = 0,
        .pNext = null,
        .waitSemaphoreCount = 0,
        .pWaitSemaphores = null,
        .pWaitDstStageMask = null,
        .commandBufferCount = 0,
        .pCommandBuffers = null,
        .signalSemaphoreCount = 0,
        .pSignalSemaphores = null,
    };
    _ = &submitInfo;
    var waitDestStageMask: VkPipelineStageFlags = VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
    _ = &waitDestStageMask;
    submitInfo.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submitInfo.commandBufferCount = 1;
    submitInfo.pCommandBuffers = &rendererData.*.currentCommandBuffer;
    if (rendererData.*.waitRenderSemaphoreCount > @as(u32, 0)) {
        var additionalSemaphoreCount: Uint32 = @bitCast(@as(c_int, if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentImageAvailableSemaphore))) != @as(?*anyopaque, null)) @as(c_int, 1) else @as(c_int, 0)));
        _ = &additionalSemaphoreCount;
        submitInfo.waitSemaphoreCount = rendererData.*.waitRenderSemaphoreCount +% additionalSemaphoreCount;
        if (additionalSemaphoreCount > @as(Uint32, 0)) {
            rendererData.*.waitRenderSemaphores[rendererData.*.waitRenderSemaphoreCount] = rendererData.*.currentImageAvailableSemaphore;
            rendererData.*.waitDestStageMasks[rendererData.*.waitRenderSemaphoreCount] = VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
        }
        submitInfo.pWaitSemaphores = rendererData.*.waitRenderSemaphores;
        submitInfo.pWaitDstStageMask = rendererData.*.waitDestStageMasks;
        rendererData.*.waitRenderSemaphoreCount = 0;
    } else if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentImageAvailableSemaphore))) != @as(?*anyopaque, null)) {
        submitInfo.waitSemaphoreCount = 1;
        submitInfo.pWaitSemaphores = &rendererData.*.currentImageAvailableSemaphore;
        submitInfo.pWaitDstStageMask = &waitDestStageMask;
    }
    result = vkQueueSubmit.?(rendererData.*.graphicsQueue, 1, &submitInfo, null);
    rendererData.*.currentImageAvailableSemaphore = null;
    VULKAN_WaitForGPU(rendererData);
    VULKAN_ResetCommandList(rendererData);
    return result;
}
pub fn VULKAN_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    if (rendererData != null) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.device))) != @as(?*anyopaque, null)) {
            _ = vkDeviceWaitIdle.?(rendererData.*.device);
            VULKAN_DestroyAll(renderer);
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData)));
    }
}
pub fn GetBlendFactor(factor: SDL_BlendFactor) callconv(.c) VkBlendFactor {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (factor) {
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ZERO) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ONE) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_SRC_COLOR) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_SRC_ALPHA) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_DST_COLOR) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_DST_ALPHA) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_BlendFactor, SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return VK_BLEND_FACTOR_ZERO;
            },
            3 => {
                return VK_BLEND_FACTOR_ONE;
            },
            4 => {
                return VK_BLEND_FACTOR_SRC_COLOR;
            },
            5 => {
                return VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR;
            },
            6 => {
                return VK_BLEND_FACTOR_SRC_ALPHA;
            },
            7 => {
                return VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA;
            },
            8 => {
                return VK_BLEND_FACTOR_DST_COLOR;
            },
            9 => {
                return VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR;
            },
            10 => {
                return VK_BLEND_FACTOR_DST_ALPHA;
            },
            11 => {
                return VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA;
            },
            12 => {
                return VK_BLEND_FACTOR_MAX_ENUM;
            },
            else => unreachable,
        }
    }
}
pub fn GetBlendOp(operation: SDL_BlendOperation) callconv(.c) VkBlendOp {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (operation) {
                    @as(SDL_BlendOperation, SDL_BLENDOPERATION_ADD) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_BlendOperation, SDL_BLENDOPERATION_SUBTRACT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_BlendOperation, SDL_BLENDOPERATION_REV_SUBTRACT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_BlendOperation, SDL_BLENDOPERATION_MINIMUM) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_BlendOperation, SDL_BLENDOPERATION_MAXIMUM) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return VK_BLEND_OP_ADD;
            },
            3 => {
                return VK_BLEND_OP_SUBTRACT;
            },
            4 => {
                return VK_BLEND_OP_REVERSE_SUBTRACT;
            },
            5 => {
                return VK_BLEND_OP_MIN;
            },
            6 => {
                return VK_BLEND_OP_MAX;
            },
            7 => {
                return VK_BLEND_OP_MAX_ENUM;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_CreatePipelineState(renderer: [*c]SDL_Renderer, shader: VULKAN_Shader, pipelineLayout: VkPipelineLayout, descriptorSetLayout: VkDescriptorSetLayout, blendMode: SDL_BlendMode, topology: VkPrimitiveTopology, format: VkFormat) callconv(.c) [*c]VULKAN_PipelineState {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var pipelineStates: [*c]VULKAN_PipelineState = undefined;
    _ = &pipelineStates;
    var pipeline: VkPipeline = null;
    _ = &pipeline;
    var result: VkResult = VK_SUCCESS;
    _ = &result;
    var vertexInputCreateInfo: VkPipelineVertexInputStateCreateInfo = VkPipelineVertexInputStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .vertexBindingDescriptionCount = 0,
        .pVertexBindingDescriptions = null,
        .vertexAttributeDescriptionCount = 0,
        .pVertexAttributeDescriptions = null,
    };
    _ = &vertexInputCreateInfo;
    var inputAssemblyStateCreateInfo: VkPipelineInputAssemblyStateCreateInfo = VkPipelineInputAssemblyStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .topology = @import("std").mem.zeroes(VkPrimitiveTopology),
        .primitiveRestartEnable = 0,
    };
    _ = &inputAssemblyStateCreateInfo;
    var attributeDescriptions: [3]VkVertexInputAttributeDescription = undefined;
    _ = &attributeDescriptions;
    var bindingDescriptions: [1]VkVertexInputBindingDescription = undefined;
    _ = &bindingDescriptions;
    var shaderStageCreateInfo: [2]VkPipelineShaderStageCreateInfo = undefined;
    _ = &shaderStageCreateInfo;
    var dynamicStateCreateInfo: VkPipelineDynamicStateCreateInfo = VkPipelineDynamicStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .dynamicStateCount = 0,
        .pDynamicStates = null,
    };
    _ = &dynamicStateCreateInfo;
    var viewportStateCreateInfo: VkPipelineViewportStateCreateInfo = VkPipelineViewportStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .viewportCount = 0,
        .pViewports = null,
        .scissorCount = 0,
        .pScissors = null,
    };
    _ = &viewportStateCreateInfo;
    var rasterizationStateCreateInfo: VkPipelineRasterizationStateCreateInfo = VkPipelineRasterizationStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .depthClampEnable = 0,
        .rasterizerDiscardEnable = 0,
        .polygonMode = @import("std").mem.zeroes(VkPolygonMode),
        .cullMode = 0,
        .frontFace = @import("std").mem.zeroes(VkFrontFace),
        .depthBiasEnable = 0,
        .depthBiasConstantFactor = 0,
        .depthBiasClamp = 0,
        .depthBiasSlopeFactor = 0,
        .lineWidth = 0,
    };
    _ = &rasterizationStateCreateInfo;
    var multisampleStateCreateInfo: VkPipelineMultisampleStateCreateInfo = VkPipelineMultisampleStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .rasterizationSamples = @import("std").mem.zeroes(VkSampleCountFlagBits),
        .sampleShadingEnable = 0,
        .minSampleShading = 0,
        .pSampleMask = null,
        .alphaToCoverageEnable = 0,
        .alphaToOneEnable = 0,
    };
    _ = &multisampleStateCreateInfo;
    var depthStencilStateCreateInfo: VkPipelineDepthStencilStateCreateInfo = VkPipelineDepthStencilStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .depthTestEnable = 0,
        .depthWriteEnable = 0,
        .depthCompareOp = @import("std").mem.zeroes(VkCompareOp),
        .depthBoundsTestEnable = 0,
        .stencilTestEnable = 0,
        .front = @import("std").mem.zeroes(VkStencilOpState),
        .back = @import("std").mem.zeroes(VkStencilOpState),
        .minDepthBounds = 0,
        .maxDepthBounds = 0,
    };
    _ = &depthStencilStateCreateInfo;
    var colorBlendStateCreateInfo: VkPipelineColorBlendStateCreateInfo = VkPipelineColorBlendStateCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .logicOpEnable = 0,
        .logicOp = @import("std").mem.zeroes(VkLogicOp),
        .attachmentCount = 0,
        .pAttachments = null,
        .blendConstants = @import("std").mem.zeroes([4]f32),
    };
    _ = &colorBlendStateCreateInfo;
    var pipelineCreateInfo: VkGraphicsPipelineCreateInfo = VkGraphicsPipelineCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .stageCount = 0,
        .pStages = null,
        .pVertexInputState = null,
        .pInputAssemblyState = null,
        .pTessellationState = null,
        .pViewportState = null,
        .pRasterizationState = null,
        .pMultisampleState = null,
        .pDepthStencilState = null,
        .pColorBlendState = null,
        .pDynamicState = null,
        .layout = null,
        .renderPass = null,
        .subpass = 0,
        .basePipelineHandle = null,
        .basePipelineIndex = 0,
    };
    _ = &pipelineCreateInfo;
    pipelineCreateInfo.sType = VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
    pipelineCreateInfo.flags = 0;
    pipelineCreateInfo.pStages = @ptrCast(@alignCast(&shaderStageCreateInfo));
    pipelineCreateInfo.pVertexInputState = &vertexInputCreateInfo;
    pipelineCreateInfo.pInputAssemblyState = &inputAssemblyStateCreateInfo;
    pipelineCreateInfo.pViewportState = &viewportStateCreateInfo;
    pipelineCreateInfo.pRasterizationState = &rasterizationStateCreateInfo;
    pipelineCreateInfo.pMultisampleState = &multisampleStateCreateInfo;
    pipelineCreateInfo.pDepthStencilState = &depthStencilStateCreateInfo;
    pipelineCreateInfo.pColorBlendState = &colorBlendStateCreateInfo;
    pipelineCreateInfo.pDynamicState = &dynamicStateCreateInfo;
    var name: [*c]const u8 = "main";
    _ = &name;
    {
        var i: u32 = 0;
        _ = &i;
        while (i < @as(u32, 2)) : (i +%= 1) {
            _ = memset(@ptrCast(@alignCast(&shaderStageCreateInfo[i])), 0, @sizeOf(@TypeOf(shaderStageCreateInfo[i])));
            shaderStageCreateInfo[i].sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO;
            shaderStageCreateInfo[i].module = if (i == @as(u32, 0)) rendererData.*.vertexShaderModules[shader] else rendererData.*.fragmentShaderModules[shader];
            shaderStageCreateInfo[i].stage = @bitCast(if (i == @as(u32, 0)) VK_SHADER_STAGE_VERTEX_BIT else VK_SHADER_STAGE_FRAGMENT_BIT);
            shaderStageCreateInfo[i].pName = name;
        }
    }
    pipelineCreateInfo.stageCount = 2;
    pipelineCreateInfo.pStages = &shaderStageCreateInfo[@as(c_int, 0)];
    vertexInputCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;
    vertexInputCreateInfo.vertexAttributeDescriptionCount = 3;
    vertexInputCreateInfo.pVertexAttributeDescriptions = &attributeDescriptions[@as(c_int, 0)];
    vertexInputCreateInfo.vertexBindingDescriptionCount = 1;
    vertexInputCreateInfo.pVertexBindingDescriptions = &bindingDescriptions[@as(c_int, 0)];
    attributeDescriptions[@as(c_int, 0)].binding = 0;
    attributeDescriptions[@as(c_int, 0)].format = VK_FORMAT_R32G32_SFLOAT;
    attributeDescriptions[@as(c_int, 0)].location = 0;
    attributeDescriptions[@as(c_int, 0)].offset = 0;
    attributeDescriptions[@as(c_int, 1)].binding = 0;
    attributeDescriptions[@as(c_int, 1)].format = VK_FORMAT_R32G32_SFLOAT;
    attributeDescriptions[@as(c_int, 1)].location = 1;
    attributeDescriptions[@as(c_int, 1)].offset = 8;
    attributeDescriptions[@as(c_int, 2)].binding = 0;
    attributeDescriptions[@as(c_int, 2)].format = VK_FORMAT_R32G32B32A32_SFLOAT;
    attributeDescriptions[@as(c_int, 2)].location = 2;
    attributeDescriptions[@as(c_int, 2)].offset = 16;
    bindingDescriptions[@as(c_int, 0)].binding = 0;
    bindingDescriptions[@as(c_int, 0)].inputRate = VK_VERTEX_INPUT_RATE_VERTEX;
    bindingDescriptions[@as(c_int, 0)].stride = 32;
    inputAssemblyStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
    inputAssemblyStateCreateInfo.topology = topology;
    inputAssemblyStateCreateInfo.primitiveRestartEnable = VK_FALSE;
    viewportStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
    viewportStateCreateInfo.scissorCount = 1;
    viewportStateCreateInfo.viewportCount = 1;
    dynamicStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO;
    var dynamicStates: [2]VkDynamicState = [2]VkDynamicState{
        VK_DYNAMIC_STATE_VIEWPORT,
        VK_DYNAMIC_STATE_SCISSOR,
    };
    _ = &dynamicStates;
    dynamicStateCreateInfo.dynamicStateCount = @truncate(@sizeOf(@TypeOf(dynamicStates)) / @sizeOf(@TypeOf(dynamicStates[@as(c_int, 0)])));
    dynamicStateCreateInfo.pDynamicStates = @ptrCast(@alignCast(&dynamicStates));
    rasterizationStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
    rasterizationStateCreateInfo.depthClampEnable = VK_FALSE;
    rasterizationStateCreateInfo.rasterizerDiscardEnable = VK_FALSE;
    rasterizationStateCreateInfo.cullMode = VK_CULL_MODE_NONE;
    rasterizationStateCreateInfo.polygonMode = VK_POLYGON_MODE_FILL;
    rasterizationStateCreateInfo.frontFace = VK_FRONT_FACE_COUNTER_CLOCKWISE;
    rasterizationStateCreateInfo.depthBiasEnable = VK_FALSE;
    rasterizationStateCreateInfo.depthBiasConstantFactor = 0.0;
    rasterizationStateCreateInfo.depthBiasClamp = 0.0;
    rasterizationStateCreateInfo.depthBiasSlopeFactor = 0.0;
    rasterizationStateCreateInfo.lineWidth = 1.0;
    multisampleStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
    var multiSampleMask: VkSampleMask = 4294967295;
    _ = &multiSampleMask;
    multisampleStateCreateInfo.pSampleMask = &multiSampleMask;
    multisampleStateCreateInfo.rasterizationSamples = VK_SAMPLE_COUNT_1_BIT;
    depthStencilStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO;
    var colorBlendAttachment: VkPipelineColorBlendAttachmentState = VkPipelineColorBlendAttachmentState{
        .blendEnable = 0,
        .srcColorBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
        .dstColorBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
        .colorBlendOp = @import("std").mem.zeroes(VkBlendOp),
        .srcAlphaBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
        .dstAlphaBlendFactor = @import("std").mem.zeroes(VkBlendFactor),
        .alphaBlendOp = @import("std").mem.zeroes(VkBlendOp),
        .colorWriteMask = 0,
    };
    _ = &colorBlendAttachment;
    colorBlendStateCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
    colorBlendStateCreateInfo.attachmentCount = 1;
    colorBlendStateCreateInfo.pAttachments = &colorBlendAttachment;
    colorBlendAttachment.blendEnable = VK_TRUE;
    colorBlendAttachment.srcColorBlendFactor = GetBlendFactor(SDL_GetBlendModeSrcColorFactor(blendMode));
    colorBlendAttachment.srcAlphaBlendFactor = GetBlendFactor(SDL_GetBlendModeSrcAlphaFactor(blendMode));
    colorBlendAttachment.colorBlendOp = GetBlendOp(SDL_GetBlendModeColorOperation(blendMode));
    colorBlendAttachment.dstColorBlendFactor = GetBlendFactor(SDL_GetBlendModeDstColorFactor(blendMode));
    colorBlendAttachment.dstAlphaBlendFactor = GetBlendFactor(SDL_GetBlendModeDstAlphaFactor(blendMode));
    colorBlendAttachment.alphaBlendOp = GetBlendOp(SDL_GetBlendModeAlphaOperation(blendMode));
    colorBlendAttachment.colorWriteMask = @bitCast(@as(c_int, ((VK_COLOR_COMPONENT_R_BIT | VK_COLOR_COMPONENT_G_BIT) | VK_COLOR_COMPONENT_B_BIT) | VK_COLOR_COMPONENT_A_BIT));
    pipelineCreateInfo.renderPass = rendererData.*.currentRenderPass;
    pipelineCreateInfo.subpass = 0;
    pipelineCreateInfo.layout = pipelineLayout;
    result = vkCreateGraphicsPipelines.?(rendererData.*.device, null, 1, &pipelineCreateInfo, null, &pipeline);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateGraphicsPipelines()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateGraphicsPipelines()"))), SDL_Vulkan_GetResultString(result));
        return null;
    }
    pipelineStates = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.pipelineStates)), @as(c_ulong, @bitCast(@as(c_long, rendererData.*.pipelineStateCount + @as(c_int, 1)))) *% @sizeOf(@TypeOf(pipelineStates.*)))));
    if (!(pipelineStates != null)) {
        return null;
    }
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].shader = shader;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].blendMode = blendMode;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].topology = topology;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].format = format;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].pipeline = pipeline;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].descriptorSetLayout = descriptorSetLayout;
    pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount)))].pipelineLayout = pipelineCreateInfo.layout;
    rendererData.*.pipelineStates = pipelineStates;
    rendererData.*.pipelineStateCount += 1;
    return &pipelineStates[@bitCast(@as(isize, @intCast(rendererData.*.pipelineStateCount - @as(c_int, 1))))];
}
pub fn VULKAN_FindMemoryTypeIndex(rendererData: [*c]VULKAN_RenderData, typeBits: u32, arg_requiredFlags: VkMemoryPropertyFlags, arg_desiredFlags: VkMemoryPropertyFlags, memoryTypeIndexOut: [*c]u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var requiredFlags = arg_requiredFlags;
    _ = &requiredFlags;
    var desiredFlags = arg_desiredFlags;
    _ = &desiredFlags;
    var memoryTypeIndex: u32 = 0;
    _ = &memoryTypeIndex;
    var foundExactMatch: bool = @"false" != 0;
    _ = &foundExactMatch;
    desiredFlags |= requiredFlags;
    {
        memoryTypeIndex = 0;
        while (memoryTypeIndex < rendererData.*.physicalDeviceMemoryProperties.memoryTypeCount) : (memoryTypeIndex +%= 1) {
            if ((typeBits & (@as(u32, 1) << @intCast(memoryTypeIndex))) != 0) {
                if (rendererData.*.physicalDeviceMemoryProperties.memoryTypes[memoryTypeIndex].propertyFlags == desiredFlags) {
                    foundExactMatch = @"true" != 0;
                    break;
                }
            }
        }
    }
    if (!foundExactMatch) {
        {
            memoryTypeIndex = 0;
            while (memoryTypeIndex < rendererData.*.physicalDeviceMemoryProperties.memoryTypeCount) : (memoryTypeIndex +%= 1) {
                if ((typeBits & (@as(u32, 1) << @intCast(memoryTypeIndex))) != 0) {
                    if ((rendererData.*.physicalDeviceMemoryProperties.memoryTypes[memoryTypeIndex].propertyFlags & requiredFlags) == requiredFlags) {
                        break;
                    }
                }
            }
        }
    }
    if (memoryTypeIndex >= rendererData.*.physicalDeviceMemoryProperties.memoryTypeCount) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("Unable to find memory type for allocation"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("Unable to find memory type for allocation"))));
        return @"false" != 0;
    }
    memoryTypeIndexOut.* = memoryTypeIndex;
    return @"true" != 0;
}
pub fn VULKAN_CreateVertexBuffer(rendererData: [*c]VULKAN_RenderData, vbidx: usize, size: usize) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    VULKAN_DestroyBuffer(rendererData, &rendererData.*.vertexBuffers[vbidx]);
    result = VULKAN_AllocateBuffer(rendererData, size, VK_BUFFER_USAGE_VERTEX_BUFFER_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_COHERENT_BIT | VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &rendererData.*.vertexBuffers[vbidx]);
    if (result != VK_SUCCESS) {
        return result;
    }
    return result;
}
pub fn VULKAN_LoadGlobalFunctions(rendererData: [*c]VULKAN_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    vkCreateInstance = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(null, "vkCreateInstance"))));
    if (!(vkCreateInstance != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkCreateInstance\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkCreateInstance\") failed"))));
        return @"false" != 0;
    }
    vkEnumerateInstanceExtensionProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(null, "vkEnumerateInstanceExtensionProperties"))));
    if (!(vkEnumerateInstanceExtensionProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceExtensionProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceExtensionProperties\") failed"))));
        return @"false" != 0;
    }
    vkEnumerateInstanceLayerProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(null, "vkEnumerateInstanceLayerProperties"))));
    if (!(vkEnumerateInstanceLayerProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceLayerProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(VK_NULL_HANDLE, \"vkEnumerateInstanceLayerProperties\") failed"))));
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_LoadInstanceFunctions(rendererData: [*c]VULKAN_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    vkCreateDevice = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkCreateDevice"))));
    if (!(vkCreateDevice != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkCreateDevice\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkCreateDevice\") failed"))));
        return @"false" != 0;
    }
    vkDestroyInstance = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkDestroyInstance"))));
    if (!(vkDestroyInstance != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkDestroyInstance\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkDestroyInstance\") failed"))));
        return @"false" != 0;
    }
    vkDestroySurfaceKHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkDestroySurfaceKHR"))));
    if (!(vkDestroySurfaceKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkDestroySurfaceKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkDestroySurfaceKHR\") failed"))));
        return @"false" != 0;
    }
    vkEnumerateDeviceExtensionProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkEnumerateDeviceExtensionProperties"))));
    if (!(vkEnumerateDeviceExtensionProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkEnumerateDeviceExtensionProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkEnumerateDeviceExtensionProperties\") failed"))));
        return @"false" != 0;
    }
    vkEnumeratePhysicalDevices = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkEnumeratePhysicalDevices"))));
    if (!(vkEnumeratePhysicalDevices != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkEnumeratePhysicalDevices\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkEnumeratePhysicalDevices\") failed"))));
        return @"false" != 0;
    }
    vkGetDeviceProcAddr = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetDeviceProcAddr"))));
    if (!(vkGetDeviceProcAddr != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetDeviceProcAddr\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetDeviceProcAddr\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceFeatures = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceFeatures"))));
    if (!(vkGetPhysicalDeviceFeatures != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceFeatures\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceFeatures\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceImageFormatProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceImageFormatProperties"))));
    if (!(vkGetPhysicalDeviceImageFormatProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceImageFormatProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceImageFormatProperties\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceProperties"))));
    if (!(vkGetPhysicalDeviceProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceProperties\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceMemoryProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceMemoryProperties"))));
    if (!(vkGetPhysicalDeviceMemoryProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceMemoryProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceMemoryProperties\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceQueueFamilyProperties = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceQueueFamilyProperties"))));
    if (!(vkGetPhysicalDeviceQueueFamilyProperties != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceQueueFamilyProperties\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceQueueFamilyProperties\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceSurfaceCapabilitiesKHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"))));
    if (!(vkGetPhysicalDeviceSurfaceCapabilitiesKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceCapabilitiesKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceCapabilitiesKHR\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceSurfaceFormatsKHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceSurfaceFormatsKHR"))));
    if (!(vkGetPhysicalDeviceSurfaceFormatsKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceFormatsKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceFormatsKHR\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceSurfacePresentModesKHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceSurfacePresentModesKHR"))));
    if (!(vkGetPhysicalDeviceSurfacePresentModesKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfacePresentModesKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfacePresentModesKHR\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceSurfaceSupportKHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceSurfaceSupportKHR"))));
    if (!(vkGetPhysicalDeviceSurfaceSupportKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceSupportKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkGetPhysicalDeviceSurfaceSupportKHR\") failed"))));
        return @"false" != 0;
    }
    vkQueueWaitIdle = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkQueueWaitIdle"))));
    if (!(vkQueueWaitIdle != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkQueueWaitIdle\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetInstanceProcAddr(instance, \"vkQueueWaitIdle\") failed"))));
        return @"false" != 0;
    }
    vkGetPhysicalDeviceFeatures2KHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceFeatures2KHR"))));
    vkGetPhysicalDeviceMemoryProperties2KHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceMemoryProperties2KHR"))));
    vkGetPhysicalDeviceProperties2KHR = @ptrCast(@alignCast(@constCast(rendererData.*.vkGetInstanceProcAddr.?(rendererData.*.instance, "vkGetPhysicalDeviceProperties2KHR"))));
    return @"true" != 0;
}
pub fn VULKAN_LoadDeviceFunctions(rendererData: [*c]VULKAN_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    vkAcquireNextImageKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkAcquireNextImageKHR"))));
    if (!(vkAcquireNextImageKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAcquireNextImageKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAcquireNextImageKHR\") failed"))));
        return @"false" != 0;
    }
    vkAllocateCommandBuffers = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkAllocateCommandBuffers"))));
    if (!(vkAllocateCommandBuffers != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateCommandBuffers\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateCommandBuffers\") failed"))));
        return @"false" != 0;
    }
    vkAllocateDescriptorSets = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkAllocateDescriptorSets"))));
    if (!(vkAllocateDescriptorSets != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateDescriptorSets\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateDescriptorSets\") failed"))));
        return @"false" != 0;
    }
    vkAllocateMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkAllocateMemory"))));
    if (!(vkAllocateMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkAllocateMemory\") failed"))));
        return @"false" != 0;
    }
    vkBeginCommandBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkBeginCommandBuffer"))));
    if (!(vkBeginCommandBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBeginCommandBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBeginCommandBuffer\") failed"))));
        return @"false" != 0;
    }
    vkBindBufferMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkBindBufferMemory"))));
    if (!(vkBindBufferMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBindBufferMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBindBufferMemory\") failed"))));
        return @"false" != 0;
    }
    vkBindImageMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkBindImageMemory"))));
    if (!(vkBindImageMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBindImageMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkBindImageMemory\") failed"))));
        return @"false" != 0;
    }
    vkCmdBeginRenderPass = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdBeginRenderPass"))));
    if (!(vkCmdBeginRenderPass != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBeginRenderPass\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBeginRenderPass\") failed"))));
        return @"false" != 0;
    }
    vkCmdBindDescriptorSets = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdBindDescriptorSets"))));
    if (!(vkCmdBindDescriptorSets != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindDescriptorSets\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindDescriptorSets\") failed"))));
        return @"false" != 0;
    }
    vkCmdBindPipeline = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdBindPipeline"))));
    if (!(vkCmdBindPipeline != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindPipeline\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindPipeline\") failed"))));
        return @"false" != 0;
    }
    vkCmdBindVertexBuffers = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdBindVertexBuffers"))));
    if (!(vkCmdBindVertexBuffers != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindVertexBuffers\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdBindVertexBuffers\") failed"))));
        return @"false" != 0;
    }
    vkCmdClearColorImage = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdClearColorImage"))));
    if (!(vkCmdClearColorImage != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdClearColorImage\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdClearColorImage\") failed"))));
        return @"false" != 0;
    }
    vkCmdCopyBufferToImage = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdCopyBufferToImage"))));
    if (!(vkCmdCopyBufferToImage != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdCopyBufferToImage\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdCopyBufferToImage\") failed"))));
        return @"false" != 0;
    }
    vkCmdCopyImageToBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdCopyImageToBuffer"))));
    if (!(vkCmdCopyImageToBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdCopyImageToBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdCopyImageToBuffer\") failed"))));
        return @"false" != 0;
    }
    vkCmdDraw = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdDraw"))));
    if (!(vkCmdDraw != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdDraw\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdDraw\") failed"))));
        return @"false" != 0;
    }
    vkCmdEndRenderPass = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdEndRenderPass"))));
    if (!(vkCmdEndRenderPass != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdEndRenderPass\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdEndRenderPass\") failed"))));
        return @"false" != 0;
    }
    vkCmdPipelineBarrier = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdPipelineBarrier"))));
    if (!(vkCmdPipelineBarrier != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdPipelineBarrier\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdPipelineBarrier\") failed"))));
        return @"false" != 0;
    }
    vkCmdPushConstants = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdPushConstants"))));
    if (!(vkCmdPushConstants != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdPushConstants\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdPushConstants\") failed"))));
        return @"false" != 0;
    }
    vkCmdSetScissor = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdSetScissor"))));
    if (!(vkCmdSetScissor != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdSetScissor\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdSetScissor\") failed"))));
        return @"false" != 0;
    }
    vkCmdSetViewport = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCmdSetViewport"))));
    if (!(vkCmdSetViewport != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdSetViewport\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCmdSetViewport\") failed"))));
        return @"false" != 0;
    }
    vkCreateBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateBuffer"))));
    if (!(vkCreateBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateBuffer\") failed"))));
        return @"false" != 0;
    }
    vkCreateCommandPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateCommandPool"))));
    if (!(vkCreateCommandPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateCommandPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateCommandPool\") failed"))));
        return @"false" != 0;
    }
    vkCreateDescriptorPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateDescriptorPool"))));
    if (!(vkCreateDescriptorPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateDescriptorPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateDescriptorPool\") failed"))));
        return @"false" != 0;
    }
    vkCreateDescriptorSetLayout = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateDescriptorSetLayout"))));
    if (!(vkCreateDescriptorSetLayout != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateDescriptorSetLayout\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateDescriptorSetLayout\") failed"))));
        return @"false" != 0;
    }
    vkCreateFence = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateFence"))));
    if (!(vkCreateFence != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateFence\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateFence\") failed"))));
        return @"false" != 0;
    }
    vkCreateFramebuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateFramebuffer"))));
    if (!(vkCreateFramebuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateFramebuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateFramebuffer\") failed"))));
        return @"false" != 0;
    }
    vkCreateGraphicsPipelines = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateGraphicsPipelines"))));
    if (!(vkCreateGraphicsPipelines != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateGraphicsPipelines\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateGraphicsPipelines\") failed"))));
        return @"false" != 0;
    }
    vkCreateImage = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateImage"))));
    if (!(vkCreateImage != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateImage\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateImage\") failed"))));
        return @"false" != 0;
    }
    vkCreateImageView = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateImageView"))));
    if (!(vkCreateImageView != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateImageView\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateImageView\") failed"))));
        return @"false" != 0;
    }
    vkCreatePipelineLayout = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreatePipelineLayout"))));
    if (!(vkCreatePipelineLayout != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreatePipelineLayout\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreatePipelineLayout\") failed"))));
        return @"false" != 0;
    }
    vkCreateRenderPass = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateRenderPass"))));
    if (!(vkCreateRenderPass != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateRenderPass\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateRenderPass\") failed"))));
        return @"false" != 0;
    }
    vkCreateSampler = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateSampler"))));
    if (!(vkCreateSampler != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSampler\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSampler\") failed"))));
        return @"false" != 0;
    }
    vkCreateSemaphore = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateSemaphore"))));
    if (!(vkCreateSemaphore != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSemaphore\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSemaphore\") failed"))));
        return @"false" != 0;
    }
    vkCreateShaderModule = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateShaderModule"))));
    if (!(vkCreateShaderModule != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateShaderModule\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateShaderModule\") failed"))));
        return @"false" != 0;
    }
    vkCreateSwapchainKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateSwapchainKHR"))));
    if (!(vkCreateSwapchainKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSwapchainKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkCreateSwapchainKHR\") failed"))));
        return @"false" != 0;
    }
    vkDestroyBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyBuffer"))));
    if (!(vkDestroyBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyBuffer\") failed"))));
        return @"false" != 0;
    }
    vkDestroyCommandPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyCommandPool"))));
    if (!(vkDestroyCommandPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyCommandPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyCommandPool\") failed"))));
        return @"false" != 0;
    }
    vkDestroyDevice = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyDevice"))));
    if (!(vkDestroyDevice != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDevice\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDevice\") failed"))));
        return @"false" != 0;
    }
    vkDestroyDescriptorPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyDescriptorPool"))));
    if (!(vkDestroyDescriptorPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDescriptorPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDescriptorPool\") failed"))));
        return @"false" != 0;
    }
    vkDestroyDescriptorSetLayout = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyDescriptorSetLayout"))));
    if (!(vkDestroyDescriptorSetLayout != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDescriptorSetLayout\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyDescriptorSetLayout\") failed"))));
        return @"false" != 0;
    }
    vkDestroyFence = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyFence"))));
    if (!(vkDestroyFence != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyFence\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyFence\") failed"))));
        return @"false" != 0;
    }
    vkDestroyFramebuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyFramebuffer"))));
    if (!(vkDestroyFramebuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyFramebuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyFramebuffer\") failed"))));
        return @"false" != 0;
    }
    vkDestroyImage = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyImage"))));
    if (!(vkDestroyImage != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyImage\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyImage\") failed"))));
        return @"false" != 0;
    }
    vkDestroyImageView = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyImageView"))));
    if (!(vkDestroyImageView != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyImageView\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyImageView\") failed"))));
        return @"false" != 0;
    }
    vkDestroyPipeline = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyPipeline"))));
    if (!(vkDestroyPipeline != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyPipeline\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyPipeline\") failed"))));
        return @"false" != 0;
    }
    vkDestroyPipelineLayout = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyPipelineLayout"))));
    if (!(vkDestroyPipelineLayout != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyPipelineLayout\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyPipelineLayout\") failed"))));
        return @"false" != 0;
    }
    vkDestroyRenderPass = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyRenderPass"))));
    if (!(vkDestroyRenderPass != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyRenderPass\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyRenderPass\") failed"))));
        return @"false" != 0;
    }
    vkDestroySampler = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroySampler"))));
    if (!(vkDestroySampler != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySampler\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySampler\") failed"))));
        return @"false" != 0;
    }
    vkDestroySemaphore = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroySemaphore"))));
    if (!(vkDestroySemaphore != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySemaphore\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySemaphore\") failed"))));
        return @"false" != 0;
    }
    vkDestroyShaderModule = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroyShaderModule"))));
    if (!(vkDestroyShaderModule != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyShaderModule\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroyShaderModule\") failed"))));
        return @"false" != 0;
    }
    vkDestroySwapchainKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroySwapchainKHR"))));
    if (!(vkDestroySwapchainKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySwapchainKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDestroySwapchainKHR\") failed"))));
        return @"false" != 0;
    }
    vkDeviceWaitIdle = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDeviceWaitIdle"))));
    if (!(vkDeviceWaitIdle != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDeviceWaitIdle\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkDeviceWaitIdle\") failed"))));
        return @"false" != 0;
    }
    vkEndCommandBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkEndCommandBuffer"))));
    if (!(vkEndCommandBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkEndCommandBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkEndCommandBuffer\") failed"))));
        return @"false" != 0;
    }
    vkFreeCommandBuffers = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkFreeCommandBuffers"))));
    if (!(vkFreeCommandBuffers != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkFreeCommandBuffers\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkFreeCommandBuffers\") failed"))));
        return @"false" != 0;
    }
    vkFreeMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkFreeMemory"))));
    if (!(vkFreeMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkFreeMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkFreeMemory\") failed"))));
        return @"false" != 0;
    }
    vkGetBufferMemoryRequirements = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkGetBufferMemoryRequirements"))));
    if (!(vkGetBufferMemoryRequirements != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetBufferMemoryRequirements\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetBufferMemoryRequirements\") failed"))));
        return @"false" != 0;
    }
    vkGetImageMemoryRequirements = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkGetImageMemoryRequirements"))));
    if (!(vkGetImageMemoryRequirements != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetImageMemoryRequirements\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetImageMemoryRequirements\") failed"))));
        return @"false" != 0;
    }
    vkGetDeviceQueue = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkGetDeviceQueue"))));
    if (!(vkGetDeviceQueue != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetDeviceQueue\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetDeviceQueue\") failed"))));
        return @"false" != 0;
    }
    vkGetFenceStatus = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkGetFenceStatus"))));
    if (!(vkGetFenceStatus != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetFenceStatus\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetFenceStatus\") failed"))));
        return @"false" != 0;
    }
    vkGetSwapchainImagesKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkGetSwapchainImagesKHR"))));
    if (!(vkGetSwapchainImagesKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetSwapchainImagesKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkGetSwapchainImagesKHR\") failed"))));
        return @"false" != 0;
    }
    vkMapMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkMapMemory"))));
    if (!(vkMapMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkMapMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkMapMemory\") failed"))));
        return @"false" != 0;
    }
    vkQueuePresentKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkQueuePresentKHR"))));
    if (!(vkQueuePresentKHR != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkQueuePresentKHR\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkQueuePresentKHR\") failed"))));
        return @"false" != 0;
    }
    vkQueueSubmit = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkQueueSubmit"))));
    if (!(vkQueueSubmit != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkQueueSubmit\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkQueueSubmit\") failed"))));
        return @"false" != 0;
    }
    vkResetCommandBuffer = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkResetCommandBuffer"))));
    if (!(vkResetCommandBuffer != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetCommandBuffer\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetCommandBuffer\") failed"))));
        return @"false" != 0;
    }
    vkResetCommandPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkResetCommandPool"))));
    if (!(vkResetCommandPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetCommandPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetCommandPool\") failed"))));
        return @"false" != 0;
    }
    vkResetDescriptorPool = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkResetDescriptorPool"))));
    if (!(vkResetDescriptorPool != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetDescriptorPool\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetDescriptorPool\") failed"))));
        return @"false" != 0;
    }
    vkResetFences = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkResetFences"))));
    if (!(vkResetFences != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetFences\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkResetFences\") failed"))));
        return @"false" != 0;
    }
    vkUnmapMemory = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkUnmapMemory"))));
    if (!(vkUnmapMemory != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkUnmapMemory\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkUnmapMemory\") failed"))));
        return @"false" != 0;
    }
    vkUpdateDescriptorSets = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkUpdateDescriptorSets"))));
    if (!(vkUpdateDescriptorSets != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkUpdateDescriptorSets\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkUpdateDescriptorSets\") failed"))));
        return @"false" != 0;
    }
    vkWaitForFences = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkWaitForFences"))));
    if (!(vkWaitForFences != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkWaitForFences\") failed"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkGetDeviceProcAddr(device, \"vkWaitForFences\") failed"))));
        return @"false" != 0;
    }
    vkCreateSamplerYcbcrConversionKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkCreateSamplerYcbcrConversionKHR"))));
    vkDestroySamplerYcbcrConversionKHR = @ptrCast(@alignCast(@constCast(vkGetDeviceProcAddr.?(rendererData.*.device, "vkDestroySamplerYcbcrConversionKHR"))));
    return @"true" != 0;
}
pub fn VULKAN_FindPhysicalDevice(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var physicalDeviceCount: u32 = 0;
    _ = &physicalDeviceCount;
    var physicalDevices: [*c]VkPhysicalDevice = undefined;
    _ = &physicalDevices;
    var queueFamiliesProperties: [*c]VkQueueFamilyProperties = null;
    _ = &queueFamiliesProperties;
    var queueFamiliesPropertiesAllocatedSize: u32 = 0;
    _ = &queueFamiliesPropertiesAllocatedSize;
    var deviceExtensions: [*c]VkExtensionProperties = null;
    _ = &deviceExtensions;
    var deviceExtensionsAllocatedSize: u32 = 0;
    _ = &deviceExtensionsAllocatedSize;
    var physicalDeviceIndex: u32 = undefined;
    _ = &physicalDeviceIndex;
    var result: VkResult = undefined;
    _ = &result;
    result = vkEnumeratePhysicalDevices.?(rendererData.*.instance, &physicalDeviceCount, null);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    if (physicalDeviceCount == @as(u32, 0)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices(): no physical devices"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices(): no physical devices"))));
        return VK_ERROR_UNKNOWN;
    }
    physicalDevices = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPhysicalDevice) *% @as(c_ulong, physicalDeviceCount))));
    result = vkEnumeratePhysicalDevices.?(rendererData.*.instance, &physicalDeviceCount, physicalDevices);
    if (result != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumeratePhysicalDevices()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    rendererData.*.physicalDevice = null;
    {
        physicalDeviceIndex = 0;
        while (physicalDeviceIndex < physicalDeviceCount) : (physicalDeviceIndex +%= 1) {
            var queueFamiliesCount: u32 = 0;
            _ = &queueFamiliesCount;
            var queueFamilyIndex: u32 = undefined;
            _ = &queueFamilyIndex;
            var deviceExtensionCount: u32 = 0;
            _ = &deviceExtensionCount;
            var hasSwapchainExtension: bool = @"false" != 0;
            _ = &hasSwapchainExtension;
            var i: u32 = undefined;
            _ = &i;
            var physicalDevice: VkPhysicalDevice = physicalDevices[physicalDeviceIndex];
            _ = &physicalDevice;
            vkGetPhysicalDeviceProperties.?(physicalDevice, &rendererData.*.physicalDeviceProperties);
            if ((rendererData.*.physicalDeviceProperties.apiVersion >> @intCast(@as(c_uint, 22))) < @as(u32, 1)) {
                continue;
            }
            vkGetPhysicalDeviceMemoryProperties.?(physicalDevice, &rendererData.*.physicalDeviceMemoryProperties);
            vkGetPhysicalDeviceFeatures.?(physicalDevice, &rendererData.*.physicalDeviceFeatures);
            vkGetPhysicalDeviceQueueFamilyProperties.?(physicalDevice, &queueFamiliesCount, null);
            if (queueFamiliesCount == @as(u32, 0)) {
                continue;
            }
            if (queueFamiliesPropertiesAllocatedSize < queueFamiliesCount) {
                SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
                queueFamiliesPropertiesAllocatedSize = queueFamiliesCount;
                queueFamiliesProperties = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkQueueFamilyProperties) *% @as(c_ulong, queueFamiliesPropertiesAllocatedSize))));
                if (!(queueFamiliesProperties != null)) {
                    SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                    SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
                    return VK_ERROR_UNKNOWN;
                }
            }
            vkGetPhysicalDeviceQueueFamilyProperties.?(physicalDevice, &queueFamiliesCount, queueFamiliesProperties);
            rendererData.*.graphicsQueueFamilyIndex = queueFamiliesCount;
            rendererData.*.presentQueueFamilyIndex = queueFamiliesCount;
            {
                queueFamilyIndex = 0;
                while (queueFamilyIndex < queueFamiliesCount) : (queueFamilyIndex +%= 1) {
                    var supported: VkBool32 = 0;
                    _ = &supported;
                    if (queueFamiliesProperties[queueFamilyIndex].queueCount == @as(u32, 0)) {
                        continue;
                    }
                    if ((queueFamiliesProperties[queueFamilyIndex].queueFlags & @as(VkQueueFlags, VK_QUEUE_GRAPHICS_BIT)) != 0) {
                        rendererData.*.graphicsQueueFamilyIndex = queueFamilyIndex;
                    }
                    result = vkGetPhysicalDeviceSurfaceSupportKHR.?(physicalDevice, queueFamilyIndex, rendererData.*.surface, &supported);
                    if (result != VK_SUCCESS) {
                        SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                        SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
                        SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
                        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceSupportKHR()"))), SDL_Vulkan_GetResultString(result));
                            __builtin.debugtrap();
                        }
                        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceSupportKHR()"))), SDL_Vulkan_GetResultString(result));
                        return VK_ERROR_UNKNOWN;
                    }
                    if (supported != 0) {
                        rendererData.*.presentQueueFamilyIndex = queueFamilyIndex;
                        if ((queueFamiliesProperties[queueFamilyIndex].queueFlags & @as(VkQueueFlags, VK_QUEUE_GRAPHICS_BIT)) != 0) {
                            break;
                        }
                    }
                }
            }
            if (rendererData.*.graphicsQueueFamilyIndex == queueFamiliesCount) {
                continue;
            }
            if (rendererData.*.presentQueueFamilyIndex == queueFamiliesCount) {
                continue;
            }
            result = vkEnumerateDeviceExtensionProperties.?(physicalDevice, null, &deviceExtensionCount, null);
            if (result != VK_SUCCESS) {
                SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
                SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                return VK_ERROR_UNKNOWN;
            }
            if (deviceExtensionCount == @as(u32, 0)) {
                continue;
            }
            if (deviceExtensionsAllocatedSize < deviceExtensionCount) {
                SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
                deviceExtensionsAllocatedSize = deviceExtensionCount;
                deviceExtensions = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkExtensionProperties) *% @as(c_ulong, deviceExtensionsAllocatedSize))));
                if (!(deviceExtensions != null)) {
                    SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                    SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
                    return VK_ERROR_UNKNOWN;
                }
            }
            result = vkEnumerateDeviceExtensionProperties.?(physicalDevice, null, &deviceExtensionCount, deviceExtensions);
            if (result != VK_SUCCESS) {
                SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
                SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
            {
                i = 0;
                while (i < deviceExtensionCount) : (i +%= 1) {
                    if (SDL_strcmp_REAL(@ptrCast(@alignCast(&deviceExtensions[i].extensionName)), "VK_KHR_swapchain") == @as(c_int, 0)) {
                        hasSwapchainExtension = @"true" != 0;
                        break;
                    }
                }
            }
            if (!hasSwapchainExtension) {
                continue;
            }
            rendererData.*.physicalDevice = physicalDevice;
            break;
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
    SDL_free_REAL(@ptrCast(@alignCast(queueFamiliesProperties)));
    SDL_free_REAL(@ptrCast(@alignCast(deviceExtensions)));
    if (!(rendererData.*.physicalDevice != null)) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", @as([*c]u8, @as([*c]u8, @constCast("No viable physical devices found"))));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s", @as([*c]u8, @as([*c]u8, @constCast("No viable physical devices found"))));
        return VK_ERROR_UNKNOWN;
    }
    return VK_SUCCESS;
}
pub fn VULKAN_GetSurfaceFormats(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var result: VkResult = vkGetPhysicalDeviceSurfaceFormatsKHR.?(rendererData.*.physicalDevice, rendererData.*.surface, &rendererData.*.surfaceFormatsCount, null);
    _ = &result;
    if (result != VK_SUCCESS) {
        rendererData.*.surfaceFormatsCount = 0;
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    if (rendererData.*.surfaceFormatsCount > rendererData.*.surfaceFormatsAllocatedCount) {
        rendererData.*.surfaceFormatsAllocatedCount = rendererData.*.surfaceFormatsCount;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.surfaceFormats)));
        rendererData.*.surfaceFormats = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkSurfaceFormatKHR) *% @as(c_ulong, rendererData.*.surfaceFormatsAllocatedCount))));
    }
    result = vkGetPhysicalDeviceSurfaceFormatsKHR.?(rendererData.*.physicalDevice, rendererData.*.surface, &rendererData.*.surfaceFormatsCount, rendererData.*.surfaceFormats);
    if (result != VK_SUCCESS) {
        rendererData.*.surfaceFormatsCount = 0;
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceFormatsKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    return VK_SUCCESS;
}
pub fn VULKAN_CreateSemaphore(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkSemaphore {
    @setEvalBranchQuota(100000);
    var result: VkResult = undefined;
    _ = &result;
    var semaphore: VkSemaphore = null;
    _ = &semaphore;
    var semaphoreCreateInfo: VkSemaphoreCreateInfo = VkSemaphoreCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
    };
    _ = &semaphoreCreateInfo;
    semaphoreCreateInfo.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
    result = vkCreateSemaphore.?(rendererData.*.device, &semaphoreCreateInfo, null, &semaphore);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSemaphore()"))), SDL_Vulkan_GetResultString(result));
        return null;
    }
    return semaphore;
}
pub fn VULKAN_DeviceExtensionsFound(rendererData: [*c]VULKAN_RenderData, extensionsToCheck: c_int, extNames: [*c]const [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var extensionCount: u32 = undefined;
    _ = &extensionCount;
    var foundExtensions: bool = @"true" != 0;
    _ = &foundExtensions;
    var result: VkResult = vkEnumerateDeviceExtensionProperties.?(rendererData.*.physicalDevice, null, &extensionCount, null);
    _ = &result;
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
        return @"false" != 0;
    }
    if (extensionCount > @as(u32, 0)) {
        var extensionProperties: [*c]VkExtensionProperties = @ptrCast(@alignCast(SDL_calloc_REAL(extensionCount, @sizeOf(VkExtensionProperties))));
        _ = &extensionProperties;
        result = vkEnumerateDeviceExtensionProperties.?(rendererData.*.physicalDevice, null, &extensionCount, extensionProperties);
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateDeviceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
            SDL_free_REAL(@ptrCast(@alignCast(extensionProperties)));
            return @"false" != 0;
        }
        {
            var ext: c_int = 0;
            _ = &ext;
            while ((ext < extensionsToCheck) and foundExtensions) : (ext += 1) {
                var foundExtension: bool = @"false" != 0;
                _ = &foundExtension;
                {
                    var i: u32 = 0;
                    _ = &i;
                    while (i < extensionCount) : (i +%= 1) {
                        if (SDL_strcmp_REAL(@ptrCast(@alignCast(&extensionProperties[i].extensionName)), extNames[@bitCast(@as(isize, @intCast(ext)))]) == @as(c_int, 0)) {
                            foundExtension = @"true" != 0;
                            break;
                        }
                    }
                }
                {
                    const ref = &foundExtensions;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(foundExtension))) != 0;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(extensionProperties)));
    }
    return foundExtensions;
}
pub fn VULKAN_InstanceExtensionFound(_: [*c]VULKAN_RenderData, extName: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var extensionCount: u32 = undefined;
    _ = &extensionCount;
    var result: VkResult = vkEnumerateInstanceExtensionProperties.?(null, &extensionCount, null);
    _ = &result;
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateInstanceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateInstanceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
        return @"false" != 0;
    }
    if (extensionCount > @as(u32, 0)) {
        var extensionProperties: [*c]VkExtensionProperties = @ptrCast(@alignCast(SDL_calloc_REAL(extensionCount, @sizeOf(VkExtensionProperties))));
        _ = &extensionProperties;
        result = vkEnumerateInstanceExtensionProperties.?(null, &extensionCount, extensionProperties);
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateInstanceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateInstanceExtensionProperties()"))), SDL_Vulkan_GetResultString(result));
            SDL_free_REAL(@ptrCast(@alignCast(extensionProperties)));
            return @"false" != 0;
        }
        {
            var i: u32 = 0;
            _ = &i;
            while (i < extensionCount) : (i +%= 1) {
                if (SDL_strcmp_REAL(@ptrCast(@alignCast(&extensionProperties[i].extensionName)), extName) == @as(c_int, 0)) {
                    SDL_free_REAL(@ptrCast(@alignCast(extensionProperties)));
                    return @"true" != 0;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(extensionProperties)));
    }
    return @"false" != 0;
}
pub fn VULKAN_ValidationLayersFound() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var instanceLayerCount: u32 = 0;
    _ = &instanceLayerCount;
    var i: u32 = undefined;
    _ = &i;
    var foundValidation: bool = @"false" != 0;
    _ = &foundValidation;
    _ = vkEnumerateInstanceLayerProperties.?(&instanceLayerCount, null);
    if (instanceLayerCount > @as(u32, 0)) {
        var instanceLayers: [*c]VkLayerProperties = @ptrCast(@alignCast(SDL_calloc_REAL(instanceLayerCount, @sizeOf(VkLayerProperties))));
        _ = &instanceLayers;
        _ = vkEnumerateInstanceLayerProperties.?(&instanceLayerCount, instanceLayers);
        {
            i = 0;
            while (i < instanceLayerCount) : (i +%= 1) {
                if (!(SDL_strcmp_REAL("VK_LAYER_KHRONOS_validation", @ptrCast(@alignCast(&instanceLayers[i].layerName))) != 0)) {
                    foundValidation = @"true" != 0;
                    break;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(instanceLayers)));
    }
    return foundValidation;
}
pub fn VULKAN_CreateDeviceResources(renderer: [*c]SDL_Renderer, create_props: SDL_PropertiesID) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    const static_local_deviceExtensionNames = struct {
        const deviceExtensionNames: [6][*c]const u8 = [6][*c]const u8{
            "VK_KHR_swapchain",
            "VK_KHR_sampler_ycbcr_conversion",
            "VK_KHR_maintenance1",
            "VK_KHR_maintenance2",
            "VK_KHR_bind_memory2",
            "VK_KHR_get_memory_requirements2",
        };
    };
    _ = &static_local_deviceExtensionNames;
    comptime {
        if (!((@sizeOf(@TypeOf(static_local_deviceExtensionNames.deviceExtensionNames)) / @sizeOf(@TypeOf(static_local_deviceExtensionNames.deviceExtensionNames[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, (YCBCR_EXTENSION_OFFSET + YCBCR_EXTENSION_COUNT) + ANDROID_EXTENSION_COUNT))))) @compileError("static assertion failed \"SDL_arraysize(deviceExtensionNames) == (YCBCR_EXTENSION_OFFSET + YCBCR_EXTENSION_COUNT + ANDROID_EXTENSION_COUNT)\"");
    }
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = VK_SUCCESS;
    _ = &result;
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = null;
    _ = &vkGetInstanceProcAddr;
    var createDebug: bool = SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0);
    _ = &createDebug;
    var validationLayerName: [1][*c]const u8 = [1][*c]const u8{
        "VK_LAYER_KHRONOS_validation",
    };
    _ = &validationLayerName;
    if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "SDL_Vulkan_LoadLibrary failed");
        return VK_ERROR_UNKNOWN;
    }
    vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(SDL_Vulkan_GetVkGetInstanceProcAddr_REAL())));
    if (!(vkGetInstanceProcAddr != null)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "vkGetInstanceProcAddr is NULL");
        return VK_ERROR_UNKNOWN;
    }
    rendererData.*.vkGetInstanceProcAddr = vkGetInstanceProcAddr;
    if (!VULKAN_LoadGlobalFunctions(rendererData)) {
        return VK_ERROR_UNKNOWN;
    }
    rendererData.*.supportsEXTSwapchainColorspace = VK_FALSE != 0;
    if ((renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))) {
        rendererData.*.supportsEXTSwapchainColorspace = VULKAN_InstanceExtensionFound(rendererData, "VK_EXT_swapchain_colorspace");
        if (!rendererData.*.supportsEXTSwapchainColorspace) {
            _ = SDL_SetError_REAL("Using HDR output but %s not supported", @as([*c]u8, @as([*c]u8, @constCast("VK_EXT_swapchain_colorspace"))));
            return VK_ERROR_UNKNOWN;
        }
    }
    rendererData.*.supportsKHRGetPhysicalDeviceProperties2 = VULKAN_InstanceExtensionFound(rendererData, "VK_KHR_get_physical_device_properties2");
    rendererData.*.supportsKHRExternalMemoryCapabilities = VULKAN_InstanceExtensionFound(rendererData, "VK_KHR_external_memory_capabilities");
    rendererData.*.instance = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.renderer.create.vulkan.instance", null)));
    if (rendererData.*.instance != null) {
        rendererData.*.instance_external = @"true" != 0;
    } else {
        var instanceCreateInfo: VkInstanceCreateInfo = VkInstanceCreateInfo{
            .sType = 0,
            .pNext = null,
            .flags = 0,
            .pApplicationInfo = null,
            .enabledLayerCount = 0,
            .ppEnabledLayerNames = null,
            .enabledExtensionCount = 0,
            .ppEnabledExtensionNames = null,
        };
        _ = &instanceCreateInfo;
        var appInfo: VkApplicationInfo = VkApplicationInfo{
            .sType = 0,
            .pNext = null,
            .pApplicationName = null,
            .applicationVersion = 0,
            .pEngineName = null,
            .engineVersion = 0,
            .apiVersion = 0,
        };
        _ = &appInfo;
        appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
        appInfo.apiVersion = (((@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 29))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(c_uint, 22)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 0)))) << @intCast(@as(c_uint, 12)))) | @as(u32, @bitCast(@as(c_int, @as(c_int, 0))));
        instanceCreateInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
        instanceCreateInfo.pApplicationInfo = &appInfo;
        var instanceExtensions: [*c]const [*c]const u8 = SDL_Vulkan_GetInstanceExtensions_REAL(&instanceCreateInfo.enabledExtensionCount);
        _ = &instanceExtensions;
        var instanceExtensionsCopy: [*c][*c]const u8 = @ptrCast(@alignCast(SDL_calloc_REAL(instanceCreateInfo.enabledExtensionCount +% @as(u32, 3), @sizeOf([*c]const u8))));
        _ = &instanceExtensionsCopy;
        {
            var i: u32 = 0;
            _ = &i;
            while (i < instanceCreateInfo.enabledExtensionCount) : (i +%= 1) {
                instanceExtensionsCopy[i] = instanceExtensions[i];
            }
        }
        if (rendererData.*.supportsEXTSwapchainColorspace) {
            instanceExtensionsCopy[instanceCreateInfo.enabledExtensionCount] = "VK_EXT_swapchain_colorspace";
            instanceCreateInfo.enabledExtensionCount +%= 1;
        }
        if (rendererData.*.supportsKHRGetPhysicalDeviceProperties2) {
            instanceExtensionsCopy[instanceCreateInfo.enabledExtensionCount] = "VK_KHR_get_physical_device_properties2";
            instanceCreateInfo.enabledExtensionCount +%= 1;
        }
        if (rendererData.*.supportsKHRExternalMemoryCapabilities) {
            instanceExtensionsCopy[instanceCreateInfo.enabledExtensionCount] = "VK_KHR_external_memory_capabilities";
            instanceCreateInfo.enabledExtensionCount +%= 1;
        }
        instanceCreateInfo.ppEnabledExtensionNames = @ptrCast(@alignCast(instanceExtensionsCopy));
        if (createDebug and VULKAN_ValidationLayersFound()) {
            instanceCreateInfo.ppEnabledLayerNames = @ptrCast(@alignCast(&validationLayerName));
            instanceCreateInfo.enabledLayerCount = 1;
        }
        result = vkCreateInstance.?(&instanceCreateInfo, null, &rendererData.*.instance);
        SDL_free_REAL(@ptrCast(@alignCast(instanceExtensionsCopy)));
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateInstance()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateInstance()"))), SDL_Vulkan_GetResultString(result));
            return result;
        }
    }
    if (!VULKAN_LoadInstanceFunctions(rendererData)) {
        VULKAN_DestroyAll(renderer);
        return VK_ERROR_UNKNOWN;
    }
    rendererData.*.surface = @ptrFromInt(@as(usize, @intCast(SDL_GetNumberProperty_REAL(create_props, "SDL.renderer.create.vulkan.surface", 0))));
    if (rendererData.*.surface != null) {
        rendererData.*.surface_external = @"true" != 0;
    } else {
        if (!SDL_Vulkan_CreateSurface_REAL(renderer.*.window, rendererData.*.instance, null, &rendererData.*.surface)) {
            VULKAN_DestroyAll(renderer);
            return VK_ERROR_UNKNOWN;
        }
    }
    rendererData.*.physicalDevice = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.renderer.create.vulkan.physical_device", null)));
    if (rendererData.*.physicalDevice != null) {
        vkGetPhysicalDeviceProperties.?(rendererData.*.physicalDevice, &rendererData.*.physicalDeviceProperties);
        vkGetPhysicalDeviceMemoryProperties.?(rendererData.*.physicalDevice, &rendererData.*.physicalDeviceMemoryProperties);
        vkGetPhysicalDeviceFeatures.?(rendererData.*.physicalDevice, &rendererData.*.physicalDeviceFeatures);
    } else {
        if (VULKAN_FindPhysicalDevice(rendererData) != VK_SUCCESS) {
            VULKAN_DestroyAll(renderer);
            return VK_ERROR_UNKNOWN;
        }
    }
    if (SDL_HasProperty_REAL(create_props, "SDL.renderer.create.vulkan.graphics_queue_family_index")) {
        rendererData.*.graphicsQueueFamilyIndex = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.renderer.create.vulkan.graphics_queue_family_index", 0))));
    }
    if (SDL_HasProperty_REAL(create_props, "SDL.renderer.create.vulkan.present_queue_family_index")) {
        rendererData.*.presentQueueFamilyIndex = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.renderer.create.vulkan.present_queue_family_index", 0))));
    }
    if (rendererData.*.supportsKHRGetPhysicalDeviceProperties2 and VULKAN_DeviceExtensionsFound(rendererData, YCBCR_EXTENSION_COUNT, &static_local_deviceExtensionNames.deviceExtensionNames[YCBCR_EXTENSION_OFFSET])) {
        rendererData.*.supportsKHRSamplerYCbCrConversion = @"true" != 0;
    }
    rendererData.*.device = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.renderer.create.vulkan.device", null)));
    if (rendererData.*.device != null) {
        rendererData.*.device_external = @"true" != 0;
    } else {
        var deviceSamplerYcbcrConversionFeatures: VkPhysicalDeviceSamplerYcbcrConversionFeatures = VkPhysicalDeviceSamplerYcbcrConversionFeatures{
            .sType = 0,
            .pNext = null,
            .samplerYcbcrConversion = 0,
        };
        _ = &deviceSamplerYcbcrConversionFeatures;
        var deviceQueueCreateInfo: [2]VkDeviceQueueCreateInfo = [2]VkDeviceQueueCreateInfo{
            VkDeviceQueueCreateInfo{
                .sType = 0,
                .pNext = null,
                .flags = 0,
                .queueFamilyIndex = 0,
                .queueCount = 0,
                .pQueuePriorities = null,
            },
            VkDeviceQueueCreateInfo{
                .sType = 0,
                .pNext = null,
                .flags = 0,
                .queueFamilyIndex = 0,
                .queueCount = 0,
                .pQueuePriorities = null,
            },
        };
        _ = &deviceQueueCreateInfo;
        const static_local_queuePriority = struct {
            const queuePriority: [1]f32 = [1]f32{
                1.0,
            };
        };
        _ = &static_local_queuePriority;
        var deviceCreateInfo: VkDeviceCreateInfo = VkDeviceCreateInfo{
            .sType = 0,
            .pNext = null,
            .flags = 0,
            .queueCreateInfoCount = 0,
            .pQueueCreateInfos = null,
            .enabledLayerCount = 0,
            .ppEnabledLayerNames = null,
            .enabledExtensionCount = 0,
            .ppEnabledExtensionNames = null,
            .pEnabledFeatures = null,
        };
        _ = &deviceCreateInfo;
        deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
        deviceCreateInfo.queueCreateInfoCount = 0;
        deviceCreateInfo.pQueueCreateInfos = @ptrCast(@alignCast(&deviceQueueCreateInfo));
        deviceCreateInfo.pEnabledFeatures = null;
        deviceCreateInfo.enabledExtensionCount = 1;
        if (rendererData.*.supportsKHRSamplerYCbCrConversion) {
            deviceCreateInfo.enabledExtensionCount +%= YCBCR_EXTENSION_COUNT;
        }
        deviceCreateInfo.ppEnabledExtensionNames = @ptrCast(@alignCast(&static_local_deviceExtensionNames.deviceExtensionNames));
        deviceQueueCreateInfo[@as(c_int, 0)].sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
        deviceQueueCreateInfo[@as(c_int, 0)].queueFamilyIndex = rendererData.*.graphicsQueueFamilyIndex;
        deviceQueueCreateInfo[@as(c_int, 0)].queueCount = 1;
        deviceQueueCreateInfo[@as(c_int, 0)].pQueuePriorities = @ptrCast(@alignCast(&static_local_queuePriority.queuePriority));
        deviceCreateInfo.queueCreateInfoCount +%= 1;
        if (rendererData.*.presentQueueFamilyIndex != rendererData.*.graphicsQueueFamilyIndex) {
            deviceQueueCreateInfo[@as(c_int, 1)].sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
            deviceQueueCreateInfo[@as(c_int, 1)].queueFamilyIndex = rendererData.*.presentQueueFamilyIndex;
            deviceQueueCreateInfo[@as(c_int, 1)].queueCount = 1;
            deviceQueueCreateInfo[@as(c_int, 1)].pQueuePriorities = @ptrCast(@alignCast(&static_local_queuePriority.queuePriority));
            deviceCreateInfo.queueCreateInfoCount +%= 1;
        }
        if (rendererData.*.supportsKHRSamplerYCbCrConversion) {
            deviceSamplerYcbcrConversionFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
            deviceSamplerYcbcrConversionFeatures.samplerYcbcrConversion = VK_TRUE;
            deviceSamplerYcbcrConversionFeatures.pNext = @ptrCast(@alignCast(@constCast(deviceCreateInfo.pNext)));
            deviceCreateInfo.pNext = @ptrCast(@alignCast(&deviceSamplerYcbcrConversionFeatures));
        }
        result = vkCreateDevice.?(rendererData.*.physicalDevice, &deviceCreateInfo, null, &rendererData.*.device);
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDevice()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDevice()"))), SDL_Vulkan_GetResultString(result));
            VULKAN_DestroyAll(renderer);
            return result;
        }
    }
    if (!VULKAN_LoadDeviceFunctions(rendererData)) {
        VULKAN_DestroyAll(renderer);
        return VK_ERROR_UNKNOWN;
    }
    vkGetDeviceQueue.?(rendererData.*.device, rendererData.*.graphicsQueueFamilyIndex, 0, &rendererData.*.graphicsQueue);
    if (rendererData.*.graphicsQueueFamilyIndex != rendererData.*.presentQueueFamilyIndex) {
        vkGetDeviceQueue.?(rendererData.*.device, rendererData.*.presentQueueFamilyIndex, 0, &rendererData.*.presentQueue);
    } else {
        rendererData.*.presentQueue = rendererData.*.graphicsQueue;
    }
    var commandPoolCreateInfo: VkCommandPoolCreateInfo = VkCommandPoolCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .queueFamilyIndex = 0,
    };
    _ = &commandPoolCreateInfo;
    commandPoolCreateInfo.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
    commandPoolCreateInfo.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    commandPoolCreateInfo.queueFamilyIndex = rendererData.*.graphicsQueueFamilyIndex;
    result = vkCreateCommandPool.?(rendererData.*.device, &commandPoolCreateInfo, null, &rendererData.*.commandPool);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyAll(renderer);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateCommandPool()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateCommandPool()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    if (VULKAN_GetSurfaceFormats(rendererData) != VK_SUCCESS) {
        VULKAN_DestroyAll(renderer);
        return result;
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (i < @as(u32, NUM_SHADERS)) : (i +%= 1) {
            var shader: VULKAN_Shader = i;
            _ = &shader;
            var shaderModuleCreateInfo: VkShaderModuleCreateInfo = VkShaderModuleCreateInfo{
                .sType = 0,
                .pNext = null,
                .flags = 0,
                .codeSize = 0,
                .pCode = null,
            };
            _ = &shaderModuleCreateInfo;
            shaderModuleCreateInfo.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
            VULKAN_GetVertexShader(shader, &shaderModuleCreateInfo.pCode, &shaderModuleCreateInfo.codeSize);
            result = vkCreateShaderModule.?(rendererData.*.device, &shaderModuleCreateInfo, null, &rendererData.*.vertexShaderModules[i]);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyAll(renderer);
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
            VULKAN_GetPixelShader(shader, &shaderModuleCreateInfo.pCode, &shaderModuleCreateInfo.codeSize);
            result = vkCreateShaderModule.?(rendererData.*.device, &shaderModuleCreateInfo, null, &rendererData.*.fragmentShaderModules[i]);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyAll(renderer);
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateShaderModule()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
        }
    }
    result = VULKAN_CreateDescriptorSetAndPipelineLayout(rendererData, null, &rendererData.*.descriptorSetLayout, &rendererData.*.pipelineLayout);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyAll(renderer);
        return result;
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (i < @as(u32, SDL_VULKAN_NUM_VERTEX_BUFFERS)) : (i +%= 1) {
            _ = VULKAN_CreateVertexBuffer(rendererData, i, SDL_VULKAN_VERTEX_BUFFER_DEFAULT_SIZE);
        }
    }
    var props: SDL_PropertiesID = SDL_GetRendererProperties_REAL(renderer);
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.vulkan.instance", @ptrCast(@alignCast(rendererData.*.instance)));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.renderer.vulkan.surface", @intCast(@intFromPtr(rendererData.*.surface)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.vulkan.physical_device", @ptrCast(@alignCast(rendererData.*.physicalDevice)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.vulkan.device", @ptrCast(@alignCast(rendererData.*.device)));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.renderer.vulkan.graphics_queue_family_index", rendererData.*.graphicsQueueFamilyIndex);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.renderer.vulkan.present_queue_family_index", rendererData.*.presentQueueFamilyIndex);
    return VK_SUCCESS;
}
pub fn VULKAN_CreateFramebuffersAndRenderPasses(renderer: [*c]SDL_Renderer, w: c_int, h: c_int, format: VkFormat, imageViewCount: c_int, imageViews: [*c]VkImageView, framebuffers: [*c]VkFramebuffer, renderPasses: [*c]VkRenderPass) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = undefined;
    _ = &result;
    var attachmentDescription: VkAttachmentDescription = VkAttachmentDescription{
        .flags = 0,
        .format = @import("std").mem.zeroes(VkFormat),
        .samples = @import("std").mem.zeroes(VkSampleCountFlagBits),
        .loadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
        .storeOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
        .stencilLoadOp = @import("std").mem.zeroes(VkAttachmentLoadOp),
        .stencilStoreOp = @import("std").mem.zeroes(VkAttachmentStoreOp),
        .initialLayout = @import("std").mem.zeroes(VkImageLayout),
        .finalLayout = @import("std").mem.zeroes(VkImageLayout),
    };
    _ = &attachmentDescription;
    attachmentDescription.format = format;
    attachmentDescription.loadOp = VK_ATTACHMENT_LOAD_OP_LOAD;
    attachmentDescription.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    attachmentDescription.stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
    attachmentDescription.stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
    attachmentDescription.initialLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    attachmentDescription.finalLayout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    attachmentDescription.samples = VK_SAMPLE_COUNT_1_BIT;
    attachmentDescription.flags = 0;
    var colorAttachmentReference: VkAttachmentReference = VkAttachmentReference{
        .attachment = 0,
        .layout = @import("std").mem.zeroes(VkImageLayout),
    };
    _ = &colorAttachmentReference;
    colorAttachmentReference.attachment = 0;
    colorAttachmentReference.layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    var subpassDescription: VkSubpassDescription = VkSubpassDescription{
        .flags = 0,
        .pipelineBindPoint = @import("std").mem.zeroes(VkPipelineBindPoint),
        .inputAttachmentCount = 0,
        .pInputAttachments = null,
        .colorAttachmentCount = 0,
        .pColorAttachments = null,
        .pResolveAttachments = null,
        .pDepthStencilAttachment = null,
        .preserveAttachmentCount = 0,
        .pPreserveAttachments = null,
    };
    _ = &subpassDescription;
    subpassDescription.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpassDescription.flags = 0;
    subpassDescription.inputAttachmentCount = 0;
    subpassDescription.pInputAttachments = null;
    subpassDescription.colorAttachmentCount = 1;
    subpassDescription.pColorAttachments = &colorAttachmentReference;
    subpassDescription.pResolveAttachments = null;
    subpassDescription.pDepthStencilAttachment = null;
    subpassDescription.preserveAttachmentCount = 0;
    subpassDescription.pPreserveAttachments = null;
    var subPassDependency: VkSubpassDependency = VkSubpassDependency{
        .srcSubpass = 0,
        .dstSubpass = 0,
        .srcStageMask = 0,
        .dstStageMask = 0,
        .srcAccessMask = 0,
        .dstAccessMask = 0,
        .dependencyFlags = 0,
    };
    _ = &subPassDependency;
    subPassDependency.srcSubpass = ~@as(c_uint, 0);
    subPassDependency.dstSubpass = 0;
    subPassDependency.srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    subPassDependency.dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    subPassDependency.srcAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
    subPassDependency.dstAccessMask = @bitCast(@as(c_int, VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT));
    subPassDependency.dependencyFlags = VK_DEPENDENCY_BY_REGION_BIT;
    var renderPassCreateInfo: VkRenderPassCreateInfo = VkRenderPassCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .attachmentCount = 0,
        .pAttachments = null,
        .subpassCount = 0,
        .pSubpasses = null,
        .dependencyCount = 0,
        .pDependencies = null,
    };
    _ = &renderPassCreateInfo;
    renderPassCreateInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
    renderPassCreateInfo.flags = 0;
    renderPassCreateInfo.attachmentCount = 1;
    renderPassCreateInfo.pAttachments = &attachmentDescription;
    renderPassCreateInfo.subpassCount = 1;
    renderPassCreateInfo.pSubpasses = &subpassDescription;
    renderPassCreateInfo.dependencyCount = 1;
    renderPassCreateInfo.pDependencies = &subPassDependency;
    result = vkCreateRenderPass.?(rendererData.*.device, &renderPassCreateInfo, null, &renderPasses[VULKAN_RENDERPASS_LOAD]);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    attachmentDescription.loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR;
    result = vkCreateRenderPass.?(rendererData.*.device, &renderPassCreateInfo, null, &renderPasses[VULKAN_RENDERPASS_CLEAR]);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateRenderPass()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    var framebufferCreateInfo: VkFramebufferCreateInfo = VkFramebufferCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .renderPass = null,
        .attachmentCount = 0,
        .pAttachments = null,
        .width = 0,
        .height = 0,
        .layers = 0,
    };
    _ = &framebufferCreateInfo;
    framebufferCreateInfo.sType = VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    framebufferCreateInfo.pNext = null;
    framebufferCreateInfo.renderPass = renderPasses[VULKAN_RENDERPASS_LOAD];
    framebufferCreateInfo.attachmentCount = 1;
    framebufferCreateInfo.width = @bitCast(@as(c_int, w));
    framebufferCreateInfo.height = @bitCast(@as(c_int, h));
    framebufferCreateInfo.layers = 1;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < imageViewCount) : (i += 1) {
            framebufferCreateInfo.pAttachments = &imageViews[@bitCast(@as(isize, @intCast(i)))];
            result = vkCreateFramebuffer.?(rendererData.*.device, &framebufferCreateInfo, null, &framebuffers[@bitCast(@as(isize, @intCast(i)))]);
            if (result != VK_SUCCESS) {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFramebuffer()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFramebuffer()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
        }
    }
    return result;
}
pub fn VULKAN_CreateSwapChain(renderer: [*c]SDL_Renderer, w: c_int, h: c_int) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "VULKAN_CreateSwapChain".*;
    };
    _ = &static_local___func__;
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = vkGetPhysicalDeviceSurfaceCapabilitiesKHR.?(rendererData.*.physicalDevice, rendererData.*.surface, &rendererData.*.surfaceCapabilities);
    _ = &result;
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceCapabilitiesKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfaceCapabilitiesKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    if (rendererData.*.swapchainImageViews != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                vkDestroyImageView.?(rendererData.*.device, rendererData.*.swapchainImageViews[i], null);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImageViews)));
        rendererData.*.swapchainImageViews = null;
    }
    if (rendererData.*.fences != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.fences[i]))) != @as(?*anyopaque, null)) {
                    vkDestroyFence.?(rendererData.*.device, rendererData.*.fences[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.fences)));
        rendererData.*.fences = null;
    }
    if (rendererData.*.commandBuffers != null) {
        vkFreeCommandBuffers.?(rendererData.*.device, rendererData.*.commandPool, rendererData.*.swapchainImageCount, rendererData.*.commandBuffers);
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.commandBuffers)));
        rendererData.*.commandBuffers = null;
        rendererData.*.currentCommandBuffer = null;
        rendererData.*.currentCommandBufferIndex = 0;
    }
    if (rendererData.*.framebuffers != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.framebuffers[i]))) != @as(?*anyopaque, null)) {
                    vkDestroyFramebuffer.?(rendererData.*.device, rendererData.*.framebuffers[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.framebuffers)));
        rendererData.*.framebuffers = null;
    }
    if (rendererData.*.descriptorPools != null) {
        while (true) {
            while (!(rendererData.*.numDescriptorPools != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rendererData->numDescriptorPools",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 2397);
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
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: u32 = 0;
                    _ = &j;
                    while (j < rendererData.*.numDescriptorPools[i]) : (j +%= 1) {
                        if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.descriptorPools[i][j]))) != @as(?*anyopaque, null)) {
                            vkDestroyDescriptorPool.?(rendererData.*.device, rendererData.*.descriptorPools[i][j], null);
                        }
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.descriptorPools[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.descriptorPools)));
        rendererData.*.descriptorPools = null;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.numDescriptorPools)));
        rendererData.*.numDescriptorPools = null;
    }
    if (rendererData.*.imageAvailableSemaphores != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.imageAvailableSemaphores[i]))) != @as(?*anyopaque, null)) {
                    vkDestroySemaphore.?(rendererData.*.device, rendererData.*.imageAvailableSemaphores[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.imageAvailableSemaphores)));
        rendererData.*.imageAvailableSemaphores = null;
    }
    if (rendererData.*.renderingFinishedSemaphores != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.renderingFinishedSemaphores[i]))) != @as(?*anyopaque, null)) {
                    vkDestroySemaphore.?(rendererData.*.device, rendererData.*.renderingFinishedSemaphores[i], null);
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.renderingFinishedSemaphores)));
        rendererData.*.renderingFinishedSemaphores = null;
    }
    if (rendererData.*.uploadBuffers != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: u32 = 0;
                    _ = &j;
                    while (j < @as(u32, SDL_VULKAN_NUM_UPLOAD_BUFFERS)) : (j +%= 1) {
                        VULKAN_DestroyBuffer(rendererData, &rendererData.*.uploadBuffers[i][j]);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.uploadBuffers[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.uploadBuffers)));
        rendererData.*.uploadBuffers = null;
    }
    if (rendererData.*.constantBuffers != null) {
        while (true) {
            while (!(rendererData.*.numConstantBuffers != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "rendererData->numConstantBuffers",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 2440);
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
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                {
                    var j: u32 = 0;
                    _ = &j;
                    while (j < rendererData.*.numConstantBuffers[i]) : (j +%= 1) {
                        VULKAN_DestroyBuffer(rendererData, &rendererData.*.constantBuffers[i][j]);
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.constantBuffers[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.constantBuffers)));
        rendererData.*.constantBuffers = null;
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.numConstantBuffers)));
        rendererData.*.numConstantBuffers = null;
    }
    rendererData.*.swapchainDesiredImageCount = rendererData.*.surfaceCapabilities.minImageCount +% @as(u32, SDL_VULKAN_FRAME_QUEUE_DEPTH);
    if ((rendererData.*.swapchainDesiredImageCount > rendererData.*.surfaceCapabilities.maxImageCount) and (rendererData.*.surfaceCapabilities.maxImageCount > @as(u32, 0))) {
        rendererData.*.swapchainDesiredImageCount = rendererData.*.surfaceCapabilities.maxImageCount;
    }
    var desiredFormat: VkFormat = VK_FORMAT_B8G8R8A8_UNORM;
    _ = &desiredFormat;
    var desiredColorSpace: VkColorSpaceKHR = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
    _ = &desiredColorSpace;
    if (renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) {
        desiredFormat = VK_FORMAT_R16G16B16A16_SFLOAT;
        desiredColorSpace = VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT;
    } else if (renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
        desiredFormat = VK_FORMAT_A2B10G10R10_UNORM_PACK32;
        desiredColorSpace = VK_COLOR_SPACE_HDR10_ST2084_EXT;
    }
    if ((rendererData.*.surfaceFormatsCount == @as(u32, 1)) and (rendererData.*.surfaceFormats[@as(c_int, 0)].format == @as(VkFormat, VK_FORMAT_UNDEFINED))) {
        rendererData.*.surfaceFormat.colorSpace = VK_COLORSPACE_SRGB_NONLINEAR_KHR;
        rendererData.*.surfaceFormat.format = desiredFormat;
    } else {
        rendererData.*.surfaceFormat = rendererData.*.surfaceFormats[@as(c_int, 0)];
        rendererData.*.surfaceFormat.colorSpace = rendererData.*.surfaceFormats[@as(c_int, 0)].colorSpace;
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.surfaceFormatsCount) : (i +%= 1) {
                if ((rendererData.*.surfaceFormats[i].format == desiredFormat) and (rendererData.*.surfaceFormats[i].colorSpace == desiredColorSpace)) {
                    rendererData.*.surfaceFormat = rendererData.*.surfaceFormats[i];
                    break;
                }
            }
        }
    }
    rendererData.*.swapchainSize.width = if (@as(u32, @bitCast(@as(c_int, w))) < rendererData.*.surfaceCapabilities.minImageExtent.width) rendererData.*.surfaceCapabilities.minImageExtent.width else if (@as(u32, @bitCast(@as(c_int, w))) > rendererData.*.surfaceCapabilities.maxImageExtent.width) rendererData.*.surfaceCapabilities.maxImageExtent.width else @as(u32, @bitCast(@as(c_int, w)));
    rendererData.*.swapchainSize.height = if (@as(u32, @bitCast(@as(c_int, h))) < rendererData.*.surfaceCapabilities.minImageExtent.height) rendererData.*.surfaceCapabilities.minImageExtent.height else if (@as(u32, @bitCast(@as(c_int, h))) > rendererData.*.surfaceCapabilities.maxImageExtent.height) rendererData.*.surfaceCapabilities.maxImageExtent.height else @as(u32, @bitCast(@as(c_int, h)));
    rendererData.*.swapChainPreTransform = rendererData.*.surfaceCapabilities.currentTransform;
    if ((rendererData.*.swapChainPreTransform == @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR)) or (rendererData.*.swapChainPreTransform == @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR))) {
        var tempWidth: u32 = rendererData.*.swapchainSize.width;
        _ = &tempWidth;
        rendererData.*.swapchainSize.width = rendererData.*.swapchainSize.height;
        rendererData.*.swapchainSize.height = tempWidth;
    }
    if ((rendererData.*.swapchainSize.width == @as(u32, 0)) and (rendererData.*.swapchainSize.height == @as(u32, 0))) {
        return VK_ERROR_OUT_OF_DATE_KHR;
    }
    var presentMode: VkPresentModeKHR = VK_PRESENT_MODE_FIFO_KHR;
    _ = &presentMode;
    if (rendererData.*.vsync <= @as(c_int, 0)) {
        var presentModeCount: u32 = 0;
        _ = &presentModeCount;
        result = vkGetPhysicalDeviceSurfacePresentModesKHR.?(rendererData.*.physicalDevice, rendererData.*.surface, &presentModeCount, null);
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR()"))), SDL_Vulkan_GetResultString(result));
            return result;
        }
        if (presentModeCount > @as(u32, 0)) {
            var presentModes: [*c]VkPresentModeKHR = @ptrCast(@alignCast(SDL_calloc_REAL(presentModeCount, @sizeOf(VkPresentModeKHR))));
            _ = &presentModes;
            result = vkGetPhysicalDeviceSurfacePresentModesKHR.?(rendererData.*.physicalDevice, rendererData.*.surface, &presentModeCount, presentModes);
            if (result != VK_SUCCESS) {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetPhysicalDeviceSurfacePresentModesKHR()"))), SDL_Vulkan_GetResultString(result));
                SDL_free_REAL(@ptrCast(@alignCast(presentModes)));
                return result;
            }
            if (rendererData.*.vsync == @as(c_int, 0)) {
                {
                    var i: u32 = 0;
                    _ = &i;
                    while (i < presentModeCount) : (i +%= 1) {
                        if (presentModes[i] == @as(VkPresentModeKHR, VK_PRESENT_MODE_IMMEDIATE_KHR)) {
                            presentMode = VK_PRESENT_MODE_IMMEDIATE_KHR;
                            break;
                        } else if (presentModes[i] == @as(VkPresentModeKHR, VK_PRESENT_MODE_MAILBOX_KHR)) {
                            presentMode = VK_PRESENT_MODE_MAILBOX_KHR;
                        } else if ((presentMode != @as(VkPresentModeKHR, VK_PRESENT_MODE_MAILBOX_KHR)) and (presentModes[i] == @as(VkPresentModeKHR, VK_PRESENT_MODE_FIFO_RELAXED_KHR))) {
                            presentMode = VK_PRESENT_MODE_FIFO_RELAXED_KHR;
                        }
                    }
                }
            } else if (rendererData.*.vsync == -@as(c_int, 1)) {
                {
                    var i: u32 = 0;
                    _ = &i;
                    while (i < presentModeCount) : (i +%= 1) {
                        if (presentModes[i] == @as(VkPresentModeKHR, VK_PRESENT_MODE_FIFO_RELAXED_KHR)) {
                            presentMode = VK_PRESENT_MODE_FIFO_RELAXED_KHR;
                            break;
                        }
                    }
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(presentModes)));
        }
    }
    var compositeAlphaFlag: VkCompositeAlphaFlagsKHR = 0;
    _ = &compositeAlphaFlag;
    if ((rendererData.*.surfaceCapabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR)) != 0) {
        compositeAlphaFlag = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    } else if ((rendererData.*.surfaceCapabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR)) != 0) {
        compositeAlphaFlag = VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR;
    }
    if (((renderer.*.window.*.flags & @as(c_ulong, 1073741824)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(compositeAlphaFlag != 0))))) != 0)) {
        if ((rendererData.*.surfaceCapabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR;
        } else if ((rendererData.*.surfaceCapabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR;
        } else if ((rendererData.*.surfaceCapabilities.supportedCompositeAlpha & @as(VkCompositeAlphaFlagsKHR, VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR)) != 0) {
            compositeAlphaFlag = VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR;
        } else {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_RENDER, "SDL_WINDOW_TRANSPARENT flag set, but no suitable swapchain composite alpha value supported!");
        }
    }
    var swapchainCreateInfo: VkSwapchainCreateInfoKHR = VkSwapchainCreateInfoKHR{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .surface = null,
        .minImageCount = 0,
        .imageFormat = @import("std").mem.zeroes(VkFormat),
        .imageColorSpace = @import("std").mem.zeroes(VkColorSpaceKHR),
        .imageExtent = @import("std").mem.zeroes(VkExtent2D),
        .imageArrayLayers = 0,
        .imageUsage = 0,
        .imageSharingMode = @import("std").mem.zeroes(VkSharingMode),
        .queueFamilyIndexCount = 0,
        .pQueueFamilyIndices = null,
        .preTransform = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
        .compositeAlpha = @import("std").mem.zeroes(VkCompositeAlphaFlagBitsKHR),
        .presentMode = @import("std").mem.zeroes(VkPresentModeKHR),
        .clipped = 0,
        .oldSwapchain = null,
    };
    _ = &swapchainCreateInfo;
    swapchainCreateInfo.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    swapchainCreateInfo.surface = rendererData.*.surface;
    swapchainCreateInfo.minImageCount = rendererData.*.swapchainDesiredImageCount;
    swapchainCreateInfo.imageFormat = rendererData.*.surfaceFormat.format;
    swapchainCreateInfo.imageColorSpace = rendererData.*.surfaceFormat.colorSpace;
    swapchainCreateInfo.imageExtent = rendererData.*.swapchainSize;
    swapchainCreateInfo.imageArrayLayers = 1;
    swapchainCreateInfo.imageUsage = @bitCast(@as(c_int, VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT));
    if ((rendererData.*.surfaceCapabilities.supportedUsageFlags & @as(VkImageUsageFlags, VK_IMAGE_USAGE_TRANSFER_SRC_BIT)) != 0) {
        swapchainCreateInfo.imageUsage |= VK_IMAGE_USAGE_TRANSFER_SRC_BIT;
    }
    swapchainCreateInfo.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    swapchainCreateInfo.preTransform = rendererData.*.swapChainPreTransform;
    swapchainCreateInfo.compositeAlpha = compositeAlphaFlag;
    swapchainCreateInfo.presentMode = presentMode;
    swapchainCreateInfo.clipped = VK_TRUE;
    swapchainCreateInfo.oldSwapchain = rendererData.*.swapchain;
    result = vkCreateSwapchainKHR.?(rendererData.*.device, &swapchainCreateInfo, null, &rendererData.*.swapchain);
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchainCreateInfo.oldSwapchain))) != @as(?*anyopaque, null)) {
        vkDestroySwapchainKHR.?(rendererData.*.device, swapchainCreateInfo.oldSwapchain, null);
    }
    if (result != VK_SUCCESS) {
        rendererData.*.swapchain = null;
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSwapchainKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSwapchainKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImages)));
    rendererData.*.swapchainImages = null;
    result = vkGetSwapchainImagesKHR.?(rendererData.*.device, rendererData.*.swapchain, &rendererData.*.swapchainImageCount, null);
    if (result != VK_SUCCESS) {
        rendererData.*.swapchainImageCount = 0;
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    rendererData.*.swapchainImages = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkImage) *% @as(c_ulong, rendererData.*.swapchainImageCount))));
    result = vkGetSwapchainImagesKHR.?(rendererData.*.device, rendererData.*.swapchain, &rendererData.*.swapchainImageCount, rendererData.*.swapchainImages);
    if (result != VK_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImages)));
        rendererData.*.swapchainImages = null;
        rendererData.*.swapchainImageCount = 0;
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkGetSwapchainImagesKHR()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    {
        var imageViewCreateInfo: VkImageViewCreateInfo = VkImageViewCreateInfo{
            .sType = 0,
            .pNext = null,
            .flags = 0,
            .image = null,
            .viewType = @import("std").mem.zeroes(VkImageViewType),
            .format = @import("std").mem.zeroes(VkFormat),
            .components = @import("std").mem.zeroes(VkComponentMapping),
            .subresourceRange = @import("std").mem.zeroes(VkImageSubresourceRange),
        };
        _ = &imageViewCreateInfo;
        imageViewCreateInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        imageViewCreateInfo.flags = 0;
        imageViewCreateInfo.format = rendererData.*.surfaceFormat.format;
        imageViewCreateInfo.components.r = VK_COMPONENT_SWIZZLE_IDENTITY;
        imageViewCreateInfo.components.g = VK_COMPONENT_SWIZZLE_IDENTITY;
        imageViewCreateInfo.components.b = VK_COMPONENT_SWIZZLE_IDENTITY;
        imageViewCreateInfo.components.a = VK_COMPONENT_SWIZZLE_IDENTITY;
        imageViewCreateInfo.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
        imageViewCreateInfo.subresourceRange.baseArrayLayer = 0;
        imageViewCreateInfo.subresourceRange.baseMipLevel = 0;
        imageViewCreateInfo.subresourceRange.layerCount = 1;
        imageViewCreateInfo.subresourceRange.levelCount = 1;
        imageViewCreateInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
        rendererData.*.swapchainImageViews = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkImageView))));
        SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.swapchainImageLayouts)));
        rendererData.*.swapchainImageLayouts = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkImageLayout))));
        {
            var i: u32 = 0;
            _ = &i;
            while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
                imageViewCreateInfo.image = rendererData.*.swapchainImages[i];
                result = vkCreateImageView.?(rendererData.*.device, &imageViewCreateInfo, null, &rendererData.*.swapchainImageViews[i]);
                if (result != VK_SUCCESS) {
                    VULKAN_DestroyAll(renderer);
                    if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                        SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView()"))), SDL_Vulkan_GetResultString(result));
                        __builtin.debugtrap();
                    }
                    _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateImageView()"))), SDL_Vulkan_GetResultString(result));
                    return result;
                }
                rendererData.*.swapchainImageLayouts[i] = VK_IMAGE_LAYOUT_UNDEFINED;
            }
        }
    }
    var commandBufferAllocateInfo: VkCommandBufferAllocateInfo = VkCommandBufferAllocateInfo{
        .sType = 0,
        .pNext = null,
        .commandPool = null,
        .level = @import("std").mem.zeroes(VkCommandBufferLevel),
        .commandBufferCount = 0,
    };
    _ = &commandBufferAllocateInfo;
    commandBufferAllocateInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
    commandBufferAllocateInfo.commandPool = rendererData.*.commandPool;
    commandBufferAllocateInfo.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    commandBufferAllocateInfo.commandBufferCount = rendererData.*.swapchainImageCount;
    rendererData.*.commandBuffers = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkCommandBuffer))));
    result = vkAllocateCommandBuffers.?(rendererData.*.device, &commandBufferAllocateInfo, rendererData.*.commandBuffers);
    if (result != VK_SUCCESS) {
        VULKAN_DestroyAll(renderer);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateCommandBuffers()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkAllocateCommandBuffers()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    rendererData.*.fences = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkFence))));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
            var fenceCreateInfo: VkFenceCreateInfo = VkFenceCreateInfo{
                .sType = 0,
                .pNext = null,
                .flags = 0,
            };
            _ = &fenceCreateInfo;
            fenceCreateInfo.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
            fenceCreateInfo.flags = VK_FENCE_CREATE_SIGNALED_BIT;
            result = vkCreateFence.?(rendererData.*.device, &fenceCreateInfo, null, &rendererData.*.fences[i]);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyAll(renderer);
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFence()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateFence()"))), SDL_Vulkan_GetResultString(result));
                return result;
            }
        }
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(rendererData.*.renderPasses)) / @sizeOf(@TypeOf(rendererData.*.renderPasses[@as(c_int, 0)])))) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.renderPasses[i]))) != @as(?*anyopaque, null)) {
                vkDestroyRenderPass.?(rendererData.*.device, rendererData.*.renderPasses[i], null);
                rendererData.*.renderPasses[i] = null;
            }
        }
    }
    rendererData.*.framebuffers = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkFramebuffer))));
    result = VULKAN_CreateFramebuffersAndRenderPasses(renderer, @bitCast(@as(c_uint, @truncate(rendererData.*.swapchainSize.width))), @bitCast(@as(c_uint, @truncate(rendererData.*.swapchainSize.height))), rendererData.*.surfaceFormat.format, @bitCast(@as(c_uint, @truncate(rendererData.*.swapchainImageCount))), rendererData.*.swapchainImageViews, rendererData.*.framebuffers, @ptrCast(@alignCast(&rendererData.*.renderPasses)));
    if (result != VK_SUCCESS) {
        VULKAN_DestroyAll(renderer);
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_CreateFramebuffersAndRenderPasses()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_CreateFramebuffersAndRenderPasses()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    rendererData.*.descriptorPools = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf([*c]VkDescriptorPool))));
    rendererData.*.numDescriptorPools = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(u32))));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
            rendererData.*.numDescriptorPools[i] = 1;
            rendererData.*.descriptorPools[i] = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VkDescriptorPool))));
            rendererData.*.descriptorPools[i][@as(c_int, 0)] = VULKAN_AllocateDescriptorPool(rendererData);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyAll(renderer);
                return result;
            }
        }
    }
    rendererData.*.imageAvailableSemaphores = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkSemaphore))));
    rendererData.*.renderingFinishedSemaphores = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(VkSemaphore))));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
            rendererData.*.imageAvailableSemaphores[i] = VULKAN_CreateSemaphore(rendererData);
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.imageAvailableSemaphores[i]))) == @as(?*anyopaque, null)) {
                VULKAN_DestroyAll(renderer);
                return VK_ERROR_UNKNOWN;
            }
            rendererData.*.renderingFinishedSemaphores[i] = VULKAN_CreateSemaphore(rendererData);
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.renderingFinishedSemaphores[i]))) == @as(?*anyopaque, null)) {
                VULKAN_DestroyAll(renderer);
                return VK_ERROR_UNKNOWN;
            }
        }
    }
    rendererData.*.uploadBuffers = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf([*c]VULKAN_Buffer))));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
            rendererData.*.uploadBuffers[i] = @ptrCast(@alignCast(SDL_calloc_REAL(SDL_VULKAN_NUM_UPLOAD_BUFFERS, @sizeOf(VULKAN_Buffer))));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(rendererData.*.currentUploadBuffer)));
    rendererData.*.currentUploadBuffer = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(c_int))));
    rendererData.*.constantBuffers = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf([*c]VULKAN_Buffer))));
    rendererData.*.numConstantBuffers = @ptrCast(@alignCast(SDL_calloc_REAL(rendererData.*.swapchainImageCount, @sizeOf(u32))));
    {
        var i: u32 = 0;
        _ = &i;
        while (i < rendererData.*.swapchainImageCount) : (i +%= 1) {
            rendererData.*.numConstantBuffers[i] = 1;
            rendererData.*.constantBuffers[i] = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VULKAN_Buffer))));
            result = VULKAN_AllocateBuffer(rendererData, SDL_VULKAN_CONSTANT_BUFFER_DEFAULT_SIZE, VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &rendererData.*.constantBuffers[i][@as(c_int, 0)]);
            if (result != VK_SUCCESS) {
                VULKAN_DestroyAll(renderer);
                return result;
            }
        }
    }
    rendererData.*.currentConstantBufferOffset = -@as(c_int, 1);
    rendererData.*.currentConstantBufferIndex = 0;
    _ = VULKAN_AcquireNextSwapchainImage(renderer);
    var props: SDL_PropertiesID = SDL_GetRendererProperties_REAL(renderer);
    _ = &props;
    _ = SDL_SetNumberProperty_REAL(props, "SDL.renderer.vulkan.swapchain_image_count", rendererData.*.swapchainImageCount);
    return result;
}
pub fn VULKAN_CreateWindowSizeDependentResources(renderer: [*c]SDL_Renderer) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = VK_SUCCESS;
    _ = &result;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    _ = VULKAN_IssueBatch(rendererData);
    VULKAN_WaitForGPU(rendererData);
    _ = SDL_GetWindowSizeInPixels_REAL(renderer.*.window, &w, &h);
    result = VULKAN_CreateSwapChain(renderer, w, h);
    if (result != VK_SUCCESS) {
        rendererData.*.recreateSwapchain = @"true" != 0;
    }
    rendererData.*.viewportDirty = @"true" != 0;
    return result;
}
pub fn VULKAN_HandleDeviceLost(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var recovered: bool = @"false" != 0;
    _ = &recovered;
    VULKAN_DestroyAll(renderer);
    if ((VULKAN_CreateDeviceResources(renderer, rendererData.*.create_props) == VK_SUCCESS) and (VULKAN_CreateWindowSizeDependentResources(renderer) == VK_SUCCESS)) {
        recovered = @"true" != 0;
    } else {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "Renderer couldn't recover from device lost: %s", SDL_GetError_REAL());
        VULKAN_DestroyAll(renderer);
    }
    var event: SDL_Event = undefined;
    _ = &event;
    _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
    event.type = @bitCast(@as(c_int, if (recovered) SDL_EVENT_RENDER_DEVICE_RESET else SDL_EVENT_RENDER_DEVICE_LOST));
    event.render.windowID = SDL_GetWindowID_REAL(SDL_GetRenderWindow_REAL(renderer));
    _ = SDL_PushEvent_REAL(&event);
    return recovered;
}
pub fn VULKAN_UpdateForWindowSizeChange(renderer: [*c]SDL_Renderer) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    VULKAN_WaitForGPU(rendererData);
    return VULKAN_CreateWindowSizeDependentResources(renderer);
}
pub fn VULKAN_WindowEvent(renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    if (event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED)) {
        rendererData.*.recreateSwapchain = @"true" != 0;
    }
}
pub fn VULKAN_SupportsBlendMode(_: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var srcColorFactor: SDL_BlendFactor = SDL_GetBlendModeSrcColorFactor(blendMode);
    _ = &srcColorFactor;
    var srcAlphaFactor: SDL_BlendFactor = SDL_GetBlendModeSrcAlphaFactor(blendMode);
    _ = &srcAlphaFactor;
    var colorOperation: SDL_BlendOperation = SDL_GetBlendModeColorOperation(blendMode);
    _ = &colorOperation;
    var dstColorFactor: SDL_BlendFactor = SDL_GetBlendModeDstColorFactor(blendMode);
    _ = &dstColorFactor;
    var dstAlphaFactor: SDL_BlendFactor = SDL_GetBlendModeDstAlphaFactor(blendMode);
    _ = &dstAlphaFactor;
    var alphaOperation: SDL_BlendOperation = SDL_GetBlendModeAlphaOperation(blendMode);
    _ = &alphaOperation;
    if ((((((GetBlendFactor(srcColorFactor) == @as(VkBlendFactor, VK_BLEND_FACTOR_MAX_ENUM)) or (GetBlendFactor(srcAlphaFactor) == @as(VkBlendFactor, VK_BLEND_FACTOR_MAX_ENUM))) or (GetBlendOp(colorOperation) == @as(VkBlendOp, VK_BLEND_OP_MAX_ENUM))) or (GetBlendFactor(dstColorFactor) == @as(VkBlendFactor, VK_BLEND_FACTOR_MAX_ENUM))) or (GetBlendFactor(dstAlphaFactor) == @as(VkBlendFactor, VK_BLEND_FACTOR_MAX_ENUM))) or (GetBlendOp(alphaOperation) == @as(VkBlendOp, VK_BLEND_OP_MAX_ENUM))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_CreatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]VULKAN_PaletteData = undefined;
    palettedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(palettedata.*)))));
    _ = &palettedata;
    if (!(palettedata != null)) {
        return @"false" != 0;
    }
    palette.*.internal = @ptrCast(@alignCast(palettedata));
    var format: VkFormat = VULKAN_GetVkImageFormat(SDL_PIXELFORMAT_RGBA32, renderer.*.output_colorspace);
    _ = &format;
    var usage: VkImageUsageFlags = @bitCast(@as(c_int, VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT));
    _ = &usage;
    var imageViewSwizzle: VkComponentMapping = data.*.identitySwizzle;
    _ = &imageViewSwizzle;
    var result: VkResult = VULKAN_AllocateImage(data, 0, null, 256, 1, format, usage, null, null, &palettedata.*.image);
    _ = &result;
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
        return @"false" != 0;
    }
    result = VULKAN_AllocateImageView(data, palettedata.*.image.image, -@as(c_int, 1), format, usage, imageViewSwizzle, null, &palettedata.*.imageView);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_UpdatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]VULKAN_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    return VULKAN_UpdateTextureInternal(data, palettedata.*.image.image, palettedata.*.image.format, 0, 0, 0, ncolors, 1, @ptrCast(@alignCast(colors)), @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ncolors))) *% @sizeOf(@TypeOf(colors.*))))), &palettedata.*.image.imageLayout);
}
pub fn VULKAN_DestroyPalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]VULKAN_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    if (!(palettedata != null)) {
        return;
    }
    _ = VULKAN_IssueBatch(data);
    VULKAN_WaitForGPU(data);
    VULKAN_DestroyImage(data, &palettedata.*.image);
    if (@as(?*anyopaque, @ptrCast(@alignCast(palettedata.*.imageView))) != @as(?*anyopaque, null)) {
        vkDestroyImageView.?(data.*.device, palettedata.*.imageView, null);
        palettedata.*.imageView = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(palettedata)));
}
pub fn VULKAN_CreateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = undefined;
    _ = &textureData;
    var result: VkResult = undefined;
    _ = &result;
    var numImages: c_int = undefined;
    _ = &numImages;
    var numImageViews: c_int = undefined;
    _ = &numImageViews;
    var textureFormat: VkFormat = undefined;
    _ = &textureFormat;
    var chromaFormat: VkFormat = undefined;
    _ = &chromaFormat;
    var width: u32 = undefined;
    _ = &width;
    var height: u32 = undefined;
    _ = &height;
    var chromaWidth: u32 = undefined;
    _ = &chromaWidth;
    var chromaHeight: u32 = undefined;
    _ = &chromaHeight;
    var imageViewSwizzle: VkComponentMapping = undefined;
    _ = &imageViewSwizzle;
    var externalBufferInfo: VULKAN_ExternalBufferInfo = undefined;
    _ = &externalBufferInfo;
    var external: [*c]VULKAN_ExternalBufferInfo = undefined;
    _ = &external;
    var bits_per_pixel: c_int = undefined;
    _ = &bits_per_pixel;
    var usage: VkImageUsageFlags = undefined;
    _ = &usage;
    var imageCreateProperties: [3][*c]const u8 = undefined;
    _ = &imageCreateProperties;
    var samplerYcbcrConversion: VkSamplerYcbcrConversionKHR = undefined;
    _ = &samplerYcbcrConversion;
    var i: c_int = undefined;
    _ = &i;
    var imageWidth: u32 = undefined;
    _ = &imageWidth;
    var imageHeight: u32 = undefined;
    _ = &imageHeight;
    var imageFormat: VkFormat = undefined;
    _ = &imageFormat;
    var usePlaneViews: bool = undefined;
    _ = &usePlaneViews;
    var imageIndex: c_int = undefined;
    _ = &imageIndex;
    var i_1: c_int = undefined;
    _ = &i_1;
    var imageViewFormat: VkFormat = undefined;
    _ = &imageViewFormat;
    var imagePlane: c_int = undefined;
    _ = &imagePlane;
    var imageProperties: [3][*c]const u8 = undefined;
    _ = &imageProperties;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var i_2: c_int = undefined;
    _ = &i_2;
    comptime {
        if (!((@sizeOf(@TypeOf(imageCreateProperties)) / @sizeOf(@TypeOf(imageCreateProperties[@as(c_int, 0)]))) == @as(c_ulong, SDL_VULKAN_NUM_TEXTURE_BINDINGS))) @compileError("static assertion failed \"SDL_arraysize(imageCreateProperties) == SDL_VULKAN_NUM_TEXTURE_BINDINGS\"");
    }
    comptime {
        if (!((@sizeOf(@TypeOf(imageProperties)) / @sizeOf(@TypeOf(imageProperties[@as(c_int, 0)]))) == @as(c_ulong, SDL_VULKAN_NUM_TEXTURE_BINDINGS))) @compileError("static assertion failed \"SDL_arraysize(imageProperties) == SDL_VULKAN_NUM_TEXTURE_BINDINGS\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                rendererData = @ptrCast(@alignCast(renderer.*.internal));
                numImages = VULKAN_GetFormatImageCount(texture.*.format);
                numImageViews = VULKAN_GetFormatImageViewCount(texture.*.format);
                textureFormat = VULKAN_GetVkImageFormat(texture.*.format, renderer.*.output_colorspace);
                chromaFormat = textureFormat;
                width = @bitCast(@as(c_int, texture.*.w));
                height = @bitCast(@as(c_int, texture.*.h));
                chromaWidth = width;
                chromaHeight = height;
                imageViewSwizzle = rendererData.*.identitySwizzle;
                external = null;
                if (!(rendererData.*.device != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Device lost and couldn't be recovered");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                textureData = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(textureData.*)))));
                if (!(textureData != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                texture.*.internal = @ptrCast(@alignCast(textureData));
                if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                _ = memset(@ptrCast(@alignCast(&externalBufferInfo)), 0, @sizeOf(@TypeOf(externalBufferInfo)));
                external = &externalBufferInfo;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                textureData.*.width = @bitCast(@as(c_uint, @truncate(width)));
                textureData.*.height = @bitCast(@as(c_uint, @truncate(height)));
                usage = @bitCast(@as(c_int, VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT));
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            10 => {
                if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) {
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
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                width = (width +% @as(u32, 1)) & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 1))));
                height = (height +% @as(u32, 1)) & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 1))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                chromaWidth = width / @as(u32, 2);
                chromaHeight = height / @as(u32, 2);
                {
                    sdl_pc = 18;
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
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            19 => {
                textureData.*.YCbCr_matrix = SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, bits_per_pixel);
                if (!(textureData.*.YCbCr_matrix != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                bits_per_pixel = 16;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                bits_per_pixel = 10;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                bits_per_pixel = 8;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            27 => {
                usage |= @bitCast(@as(c_int, VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT));
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
                usage |= @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.vulkan.usage", 0))));
                imageCreateProperties = [3][*c]const u8{
                    "SDL.texture.create.vulkan.texture",
                    "SDL.texture.create.vulkan.texture_u",
                    "SDL.texture.create.vulkan.texture_v",
                };
                if ((numImageViews == @as(c_int, 2)) and SDL_HasProperty_REAL(create_props, "SDL.texture.create.vulkan.texture_uv")) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                numImages = 2;
                chromaWidth = width / @as(u32, 2);
                chromaHeight = height / @as(u32, 2);
                textureFormat = VULKAN_GetVkImageViewFormat(texture.*.format, 0, renderer.*.output_colorspace);
                chromaFormat = VULKAN_GetVkImageViewFormat(texture.*.format, 1, renderer.*.output_colorspace);
                imageCreateProperties[@as(c_int, 1)] = "SDL.texture.create.vulkan.texture_uv";
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
                samplerYcbcrConversion = @ptrCast(@alignCast(if (textureData.*.yuvPipeline != null) @as(?*anyopaque, @ptrCast(@alignCast(textureData.*.yuvPipeline.*.samplerYcbcrConversion))) else @as(?*anyopaque, null)));
                i = 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (i < numImages) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                imageWidth = if (i == @as(c_int, 0)) width else chromaWidth;
                imageHeight = if (i == @as(c_int, 0)) height else chromaHeight;
                imageFormat = if (i == @as(c_int, 0)) textureFormat else chromaFormat;
                result = VULKAN_AllocateImage(rendererData, create_props, imageCreateProperties[@bitCast(@as(isize, @intCast(i)))], imageWidth, imageHeight, imageFormat, usage, samplerYcbcrConversion, external, &textureData.*.images[@bitCast(@as(isize, @intCast(i)))]);
                if (result != VK_SUCCESS) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                i += 1;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                usePlaneViews = numImageViews > numImages;
                imageIndex = 0;
                i_1 = 0;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            37 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                textureData.*.numImages += 1;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            40 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImage()"))), SDL_Vulkan_GetResultString(result));
                return @"false" != 0;
            },
            43 => {
                if (i_1 < numImageViews) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                imageViewFormat = VULKAN_GetVkImageViewFormat(texture.*.format, i_1, renderer.*.output_colorspace);
                imagePlane = if (usePlaneViews) i_1 else -@as(c_int, 1);
                result = VULKAN_AllocateImageView(rendererData, textureData.*.images[@bitCast(@as(isize, @intCast(imageIndex)))].image, imagePlane, imageViewFormat, usage, imageViewSwizzle, samplerYcbcrConversion, &textureData.*.imageViews[@bitCast(@as(isize, @intCast(i_1)))]);
                if (result != VK_SUCCESS) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                i_1 += 1;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            47 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                textureData.*.numImageViews += 1;
                if (imageIndex < (numImages - @as(c_int, 1))) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            50 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImageView()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_AllocateImageView()"))), SDL_Vulkan_GetResultString(result));
                return @"false" != 0;
            },
            53 => {
                imageIndex += 1;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            56 => {
                result = VULKAN_CreateFramebuffersAndRenderPasses(renderer, texture.*.w, texture.*.h, textureFormat, textureData.*.numImageViews, @ptrCast(@alignCast(&textureData.*.imageViews)), &textureData.*.mainFramebuffer, @ptrCast(@alignCast(&textureData.*.mainRenderpasses)));
                if (result != VK_SUCCESS) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
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
                imageProperties = [3][*c]const u8{
                    "SDL.texture.vulkan.texture",
                    "SDL.texture.vulkan.texture_u",
                    "SDL.texture.vulkan.texture_v",
                };
                if ((numImageViews == @as(c_int, 2)) and SDL_HasProperty_REAL(create_props, "SDL.texture.create.vulkan.texture_uv")) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            59 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_CreateFramebuffersAndRenderPasses()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("VULKAN_CreateFramebuffersAndRenderPasses()"))), SDL_Vulkan_GetResultString(result));
                return @"false" != 0;
            },
            65 => {
                imageProperties[@as(c_int, 1)] = "SDL.texture.vulkan.texture_uv";
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                props = SDL_GetTextureProperties_REAL(texture);
                i_2 = 0;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (i_2 < numImages) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                _ = SDL_SetNumberProperty_REAL(props, imageProperties[@bitCast(@as(isize, @intCast(i_2)))], @intCast(@intFromPtr(textureData.*.images[@bitCast(@as(isize, @intCast(i_2)))].image)));
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                i_2 += 1;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_DestroyTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    if (!(textureData != null)) {
        return;
    }
    _ = VULKAN_IssueBatch(rendererData);
    VULKAN_WaitForGPU(rendererData);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < textureData.*.numImageViews) : (i += 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(textureData.*.imageViews[@bitCast(@as(isize, @intCast(i)))]))) != @as(?*anyopaque, null)) {
                vkDestroyImageView.?(rendererData.*.device, textureData.*.imageViews[@bitCast(@as(isize, @intCast(i)))], null);
                textureData.*.imageViews[@bitCast(@as(isize, @intCast(i)))] = null;
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < textureData.*.numImages) : (i += 1) {
            VULKAN_DestroyImage(rendererData, &textureData.*.images[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    VULKAN_DestroyBuffer(rendererData, &textureData.*.stagingBuffer);
    if (@as(?*anyopaque, @ptrCast(@alignCast(textureData.*.mainFramebuffer))) != @as(?*anyopaque, null)) {
        vkDestroyFramebuffer.?(rendererData.*.device, textureData.*.mainFramebuffer, null);
        textureData.*.mainFramebuffer = null;
    }
    {
        var i: u32 = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(textureData.*.mainRenderpasses)) / @sizeOf(@TypeOf(textureData.*.mainRenderpasses[@as(c_int, 0)])))) : (i +%= 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(textureData.*.mainRenderpasses[i]))) != @as(?*anyopaque, null)) {
                vkDestroyRenderPass.?(rendererData.*.device, textureData.*.mainRenderpasses[i], null);
                textureData.*.mainRenderpasses[i] = null;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(textureData.*.pixels)));
    SDL_free_REAL(@ptrCast(@alignCast(textureData)));
    texture.*.internal = null;
}
pub fn VULKAN_UpdateTextureInternal(rendererData: [*c]VULKAN_RenderData, image: VkImage, format: VkFormat, plane: c_int, x: c_int, y: c_int, w: c_int, h: c_int, pixels: ?*const anyopaque, pitch: c_int, imageLayout: [*c]VkImageLayout) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pixelSize: VkDeviceSize = VULKAN_GetBytesPerPixel(format, plane);
    _ = &pixelSize;
    var length: VkDeviceSize = @as(VkDeviceSize, @bitCast(@as(c_long, w))) *% pixelSize;
    _ = &length;
    var uploadBufferSize: VkDeviceSize = length *% @as(VkDeviceSize, @bitCast(@as(c_long, h)));
    _ = &uploadBufferSize;
    var src: [*c]const Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var rc: VkResult = undefined;
    _ = &rc;
    var planeCount: c_int = VULKAN_VkFormatGetNumPlanes(format);
    _ = &planeCount;
    VULKAN_EnsureCommandBuffer(rendererData);
    var currentUploadBufferIndex: c_int = rendererData.*.currentUploadBuffer[rendererData.*.currentCommandBufferIndex];
    _ = &currentUploadBufferIndex;
    var uploadBuffer: [*c]VULKAN_Buffer = &rendererData.*.uploadBuffers[rendererData.*.currentCommandBufferIndex][@bitCast(@as(isize, @intCast(currentUploadBufferIndex)))];
    _ = &uploadBuffer;
    rc = VULKAN_AllocateBuffer(rendererData, uploadBufferSize, VK_BUFFER_USAGE_TRANSFER_SRC_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, uploadBuffer);
    if (rc != VK_SUCCESS) {
        return @"false" != 0;
    }
    src = @ptrCast(@alignCast(pixels));
    dst = @ptrCast(@alignCast(uploadBuffer.*.mappedBufferPtr));
    if (length == @as(VkDeviceSize, @bitCast(@as(c_long, pitch)))) {
        _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length *% @as(usize, @bitCast(@as(c_long, h))));
    } else {
        if (length > @as(VkDeviceSize, @bitCast(@as(c_long, pitch)))) {
            length = @bitCast(@as(c_long, pitch));
        }
        {
            var row: VkDeviceSize = @bitCast(@as(c_long, h));
            _ = &row;
            while ((blk: {
                const ref = &row;
                const tmp = ref.*;
                ref.* -%= 1;
                break :blk tmp;
            }) != 0) {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst += length;
            }
        }
    }
    VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, (((VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_TRANSFER_READ_BIT) | VK_ACCESS_TRANSFER_WRITE_BIT)), VK_ACCESS_TRANSFER_WRITE_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT) | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT)), VK_PIPELINE_STAGE_TRANSFER_BIT, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, image, imageLayout);
    var region: VkBufferImageCopy = undefined;
    _ = &region;
    region.bufferOffset = 0;
    region.bufferRowLength = 0;
    region.bufferImageHeight = 0;
    region.imageSubresource.baseArrayLayer = 0;
    region.imageSubresource.layerCount = 1;
    region.imageSubresource.mipLevel = 0;
    if (planeCount <= @as(c_int, 1)) {
        region.imageSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    } else {
        region.imageSubresource.aspectMask = @bitCast(@as(c_int, VK_IMAGE_ASPECT_PLANE_0_BIT << @intCast(plane)));
    }
    region.imageOffset.x = x;
    region.imageOffset.y = y;
    region.imageOffset.z = 0;
    region.imageExtent.width = @bitCast(@as(c_int, w));
    region.imageExtent.height = @bitCast(@as(c_int, h));
    region.imageExtent.depth = 1;
    vkCmdCopyBufferToImage.?(rendererData.*.currentCommandBuffer, uploadBuffer.*.buffer, image, imageLayout.*, 1, &region);
    VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_TRANSFER_WRITE_BIT, VK_ACCESS_SHADER_READ_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, image, imageLayout);
    rendererData.*.currentUploadBuffer[rendererData.*.currentCommandBufferIndex] += 1;
    if (rendererData.*.currentUploadBuffer[rendererData.*.currentCommandBufferIndex] == SDL_VULKAN_NUM_UPLOAD_BUFFERS) {
        _ = VULKAN_IssueBatch(rendererData);
    }
    return @"true" != 0;
}
pub fn VULKAN_UpdateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, srcPixels: ?*const anyopaque, srcPitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    if (!(textureData != null)) {
        return SDL_SetError_REAL("Texture is not currently available");
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (textureData.*.numImageViews == @as(c_int, 2)) {
        var UVbpp: c_int = @bitCast(@as(c_uint, @truncate(VULKAN_GetBytesPerPixel(textureData.*.images[@bitCast(@as(isize, @intCast(textureData.*.numImages - @as(c_int, 1))))].format, 1))));
        _ = &UVbpp;
        var Ypitch: c_int = srcPitch;
        _ = &Ypitch;
        var UVpitch: c_int = (srcPitch + (UVbpp - @as(c_int, 1))) & ~(UVbpp - @as(c_int, 1));
        _ = &UVpitch;
        var plane0: [*c]const Uint8 = @ptrCast(@alignCast(srcPixels));
        _ = &plane0;
        var plane1: [*c]const Uint8 = plane0 + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * srcPitch))));
        _ = &plane1;
        return VULKAN_UpdateTextureNV(renderer, texture, rect, plane0, Ypitch, plane1, UVpitch);
    } else if (textureData.*.numImageViews == @as(c_int, 3)) {
        if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
            var plane0: [*c]const Uint8 = @ptrCast(@alignCast(srcPixels));
            _ = &plane0;
            var plane1: [*c]const Uint8 = plane0 + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * srcPitch))));
            _ = &plane1;
            var plane2: [*c]const Uint8 = plane1 + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * srcPitch))));
            _ = &plane2;
            return VULKAN_UpdateTextureYUV(renderer, texture, rect, plane0, srcPitch, plane1, srcPitch, plane2, srcPitch);
        } else {
            var Ypitch: c_int = srcPitch;
            _ = &Ypitch;
            var UVpitch: c_int = @divTrunc(Ypitch + (@as(c_int, 1) * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))), @as(c_int, 2));
            _ = &UVpitch;
            var plane0: [*c]const Uint8 = @ptrCast(@alignCast(srcPixels));
            _ = &plane0;
            var plane1: [*c]const Uint8 = plane0 + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * Ypitch))));
            _ = &plane1;
            var plane2: [*c]const Uint8 = plane1 + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * UVpitch))));
            _ = &plane2;
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                return VULKAN_UpdateTextureYUV(renderer, texture, rect, plane0, Ypitch, plane2, UVpitch, plane1, UVpitch);
            } else {
                return VULKAN_UpdateTextureYUV(renderer, texture, rect, plane0, Ypitch, plane1, UVpitch, plane2, UVpitch);
            }
        }
    }
    if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 0)].image, textureData.*.images[@as(c_int, 0)].format, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, srcPixels, srcPitch, &textureData.*.images[@as(c_int, 0)].imageLayout)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_UpdateTextureYUV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    if (!(textureData != null)) {
        return SDL_SetError_REAL("Texture is not currently available");
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 0)].image, textureData.*.images[@as(c_int, 0)].format, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Yplane)), Ypitch, &textureData.*.images[@as(c_int, 0)].imageLayout)) {
        return @"false" != 0;
    }
    if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 1)].image, textureData.*.images[@as(c_int, 1)].format, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Uplane)), Upitch, &textureData.*.images[@as(c_int, 1)].imageLayout)) {
            return @"false" != 0;
        }
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 2)].image, textureData.*.images[@as(c_int, 2)].format, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Vplane)), Vpitch, &textureData.*.images[@as(c_int, 2)].imageLayout)) {
            return @"false" != 0;
        }
    } else if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 2)].image, textureData.*.images[@as(c_int, 2)].format, 1, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Vplane)), Vpitch, &textureData.*.images[@as(c_int, 2)].imageLayout)) {
            return @"false" != 0;
        }
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 1)].image, textureData.*.images[@as(c_int, 1)].format, 2, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Uplane)), Upitch, &textureData.*.images[@as(c_int, 1)].imageLayout)) {
            return @"false" != 0;
        }
    } else {
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 1)].image, textureData.*.images[@as(c_int, 1)].format, 1, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Uplane)), Upitch, &textureData.*.images[@as(c_int, 1)].imageLayout)) {
            return @"false" != 0;
        }
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 2)].image, textureData.*.images[@as(c_int, 2)].format, 2, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Vplane)), Vpitch, &textureData.*.images[@as(c_int, 2)].imageLayout)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_UpdateTextureNV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    if (!(textureData != null)) {
        return SDL_SetError_REAL("Texture is not currently available");
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 0)].image, textureData.*.images[@as(c_int, 0)].format, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Yplane)), Ypitch, &textureData.*.images[@as(c_int, 0)].imageLayout)) {
        return @"false" != 0;
    }
    if (textureData.*.numImages == @as(c_int, 2)) {
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 1)].image, textureData.*.images[@as(c_int, 1)].format, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(UVplane)), UVpitch, &textureData.*.images[@as(c_int, 1)].imageLayout)) {
            return @"false" != 0;
        }
    } else {
        if (!VULKAN_UpdateTextureInternal(rendererData, textureData.*.images[@as(c_int, 0)].image, textureData.*.images[@as(c_int, 0)].format, 1, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(UVplane)), UVpitch, &textureData.*.images[@as(c_int, 0)].imageLayout)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_LockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    var rc: VkResult = undefined;
    _ = &rc;
    if (!(textureData != null)) {
        return SDL_SetError_REAL("Texture is not currently available");
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(textureData.*.stagingBuffer.buffer))) != @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("texture is already locked");
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (textureData.*.numImageViews > @as(c_int, 1)) {
        if (!(textureData.*.pixels != null)) {
            var size: usize = undefined;
            _ = &size;
            var calculated_pitch: usize = undefined;
            _ = &calculated_pitch;
            if (!SDL_CalculateYUVSize(texture.*.format, texture.*.w, texture.*.h, &size, &calculated_pitch)) {
                return @"false" != 0;
            }
            textureData.*.pitch = @bitCast(@as(c_uint, @truncate(calculated_pitch)));
            textureData.*.pixels = @ptrCast(@alignCast(SDL_malloc_REAL(size)));
            if (!(textureData.*.pixels != null)) {
                return @"false" != 0;
            }
        }
        textureData.*.lockedRect = rect.*;
        pixels.* = @ptrCast(@alignCast((textureData.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * textureData.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
        pitch.* = textureData.*.pitch;
        return @"true" != 0;
    }
    var pixelSize: VkDeviceSize = VULKAN_GetBytesPerPixel(textureData.*.images[@as(c_int, 0)].format, 0);
    _ = &pixelSize;
    var length: VkDeviceSize = @as(VkDeviceSize, @bitCast(@as(c_long, rect.*.w))) *% pixelSize;
    _ = &length;
    var stagingBufferSize: VkDeviceSize = length *% @as(VkDeviceSize, @bitCast(@as(c_long, rect.*.h)));
    _ = &stagingBufferSize;
    rc = VULKAN_AllocateBuffer(rendererData, stagingBufferSize, VK_BUFFER_USAGE_TRANSFER_SRC_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_COHERENT_BIT | VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &textureData.*.stagingBuffer);
    if (rc != VK_SUCCESS) {
        return @"false" != 0;
    }
    textureData.*.lockedRect = rect.*;
    pixels.* = textureData.*.stagingBuffer.mappedBufferPtr;
    pitch.* = @bitCast(@as(c_uint, @truncate(length)));
    return @"true" != 0;
}
pub fn VULKAN_UnlockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    if (!(textureData != null)) {
        return;
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
        return;
    }
    if (textureData.*.numImageViews > @as(c_int, 1)) {
        var rect: [*c]const SDL_Rect = &textureData.*.lockedRect;
        _ = &rect;
        var pixels: [*c]const Uint8 = (textureData.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * textureData.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))));
        _ = &pixels;
        _ = VULKAN_UpdateTexture(renderer, texture, rect, @ptrCast(@alignCast(pixels)), textureData.*.pitch);
        return;
    }
    VULKAN_EnsureCommandBuffer(rendererData);
    VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, (((VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_TRANSFER_READ_BIT) | VK_ACCESS_TRANSFER_WRITE_BIT)), VK_ACCESS_TRANSFER_WRITE_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT) | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT)), VK_PIPELINE_STAGE_TRANSFER_BIT, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, textureData.*.images[@as(c_int, 0)].image, &textureData.*.images[@as(c_int, 0)].imageLayout);
    var region: VkBufferImageCopy = undefined;
    _ = &region;
    region.bufferOffset = 0;
    region.bufferRowLength = 0;
    region.bufferImageHeight = 0;
    region.imageSubresource.baseArrayLayer = 0;
    region.imageSubresource.layerCount = 1;
    region.imageSubresource.mipLevel = 0;
    region.imageSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    region.imageOffset.x = textureData.*.lockedRect.x;
    region.imageOffset.y = textureData.*.lockedRect.y;
    region.imageOffset.z = 0;
    region.imageExtent.width = @bitCast(@as(c_int, textureData.*.lockedRect.w));
    region.imageExtent.height = @bitCast(@as(c_int, textureData.*.lockedRect.h));
    region.imageExtent.depth = 1;
    vkCmdCopyBufferToImage.?(rendererData.*.currentCommandBuffer, textureData.*.stagingBuffer.buffer, textureData.*.images[@as(c_int, 0)].image, textureData.*.images[@as(c_int, 0)].imageLayout, 1, &region);
    VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_TRANSFER_WRITE_BIT, VK_ACCESS_SHADER_READ_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, textureData.*.images[@as(c_int, 0)].image, &textureData.*.images[@as(c_int, 0)].imageLayout);
    _ = VULKAN_IssueBatch(rendererData);
    VULKAN_DestroyBuffer(rendererData, &textureData.*.stagingBuffer);
}
pub fn VULKAN_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = null;
    _ = &textureData;
    VULKAN_EnsureCommandBuffer(rendererData);
    if (texture != null) {
        textureData = @ptrCast(@alignCast(texture.*.internal));
        if (@as(?*anyopaque, @ptrCast(@alignCast(textureData.*.imageViews[@as(c_int, 0)]))) == @as(?*anyopaque, null)) {
            return SDL_SetError_REAL("specified texture is not a render target");
        }
        rendererData.*.textureRenderTarget = textureData;
        VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, ((VK_ACCESS_TRANSFER_WRITE_BIT | VK_ACCESS_SHADER_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), @bitCast(@as(c_int, ((VK_ACCESS_TRANSFER_WRITE_BIT | VK_ACCESS_SHADER_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT) | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT)), @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT) | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT)), VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL, rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].image, &rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].imageLayout);
    } else {
        if (rendererData.*.textureRenderTarget != null) {
            VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, ((VK_ACCESS_TRANSFER_WRITE_BIT | VK_ACCESS_SHADER_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_ACCESS_SHADER_READ_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT) | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT)), VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].image, &rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].imageLayout);
        }
        rendererData.*.textureRenderTarget = null;
    }
    _ = VULKAN_IssueBatch(rendererData);
    return @"true" != 0;
}
pub fn VULKAN_QueueNoOp(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn VULKAN_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var verts: [*c]VULKAN_VertexPositionColor = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(VULKAN_VertexPositionColor), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var i: c_int = undefined;
    _ = &i;
    var color: SDL_FColor = cmd.*.data.draw.color;
    _ = &color;
    var convert_color: bool = (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10));
    _ = &convert_color;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    if (convert_color) {
        SDL_ConvertToLinear(renderer, &color);
    }
    {
        i = 0;
        while (i < count) : (i += 1) {
            verts.*.pos[@as(c_int, 0)] = points[@bitCast(@as(isize, @intCast(i)))].x + @as(f32, 0.5);
            verts.*.pos[@as(c_int, 1)] = points[@bitCast(@as(isize, @intCast(i)))].y + @as(f32, 0.5);
            verts.*.tex[@as(c_int, 0)] = 0.0;
            verts.*.tex[@as(c_int, 1)] = 0.0;
            verts.*.color = color;
            verts += 1;
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    var verts: [*c]VULKAN_VertexPositionColor = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(VULKAN_VertexPositionColor), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var convert_color: bool = (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10));
    _ = &convert_color;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(if (texture != null) @as(?*anyopaque, @ptrCast(@alignCast(@as([*c]VULKAN_TextureData, @ptrCast(@alignCast(texture.*.internal)))))) else @as(?*anyopaque, null)));
    _ = &textureData;
    var u_scale: f32 = if (textureData != null) @as(f32, @floatFromInt(texture.*.w)) / @as(f32, @floatFromInt(textureData.*.width)) else @as(f32, 0.0);
    _ = &u_scale;
    var v_scale: f32 = if (textureData != null) @as(f32, @floatFromInt(texture.*.h)) / @as(f32, @floatFromInt(textureData.*.height)) else @as(f32, 0.0);
    _ = &v_scale;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    size_indices = if (indices != null) size_indices else @as(c_int, 0);
    {
        i = 0;
        while (i < count) : (i += 1) {
            var j: c_int = undefined;
            _ = &j;
            var xy_: [*c]f32 = undefined;
            _ = &xy_;
            if (size_indices == @as(c_int, 4)) {
                j = @bitCast(@as(c_uint, @truncate(@as([*c]const Uint32, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))])));
            } else if (size_indices == @as(c_int, 2)) {
                j = @as([*c]const Uint16, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
            } else if (size_indices == @as(c_int, 1)) {
                j = @as([*c]const Uint8, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
            } else {
                j = i;
            }
            xy_ = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(xy)))) + @as(usize, @bitCast(@as(isize, @intCast(j * xy_stride))))));
            verts.*.pos[@as(c_int, 0)] = xy_[@as(c_int, 0)] * scale_x;
            verts.*.pos[@as(c_int, 1)] = xy_[@as(c_int, 1)] * scale_y;
            verts.*.color = @as([*c]SDL_FColor, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))))).*;
            if (convert_color) {
                SDL_ConvertToLinear(renderer, &verts.*.color);
            }
            if (texture != null) {
                var uv_: [*c]f32 = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(uv)))) + @as(usize, @bitCast(@as(isize, @intCast(j * uv_stride))))));
                _ = &uv_;
                verts.*.tex[@as(c_int, 0)] = uv_[@as(c_int, 0)] * u_scale;
                verts.*.tex[@as(c_int, 1)] = uv_[@as(c_int, 1)] * v_scale;
            } else {
                verts.*.tex[@as(c_int, 0)] = 0.0;
                verts.*.tex[@as(c_int, 1)] = 0.0;
            }
            verts += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
        }
    }
    return @"true" != 0;
}
pub fn VULKAN_UpdateVertexBuffer(renderer: [*c]SDL_Renderer, vertexData: ?*const anyopaque, dataSizeInBytes: usize, stateCache: [*c]VULKAN_DrawStateCache) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    const vbidx: c_int = rendererData.*.currentVertexBuffer;
    _ = &vbidx;
    var vertexBuffer: [*c]VULKAN_Buffer = undefined;
    _ = &vertexBuffer;
    if (dataSizeInBytes == @as(usize, 0)) {
        return @"true" != 0;
    }
    if (rendererData.*.issueBatch) {
        if (VULKAN_IssueBatch(rendererData) != VK_SUCCESS) {
            return SDL_SetError_REAL("Failed to issue intermediate batch");
        }
    }
    if (dataSizeInBytes > rendererData.*.vertexBuffers[@bitCast(@as(isize, @intCast(vbidx)))].size) {
        _ = VULKAN_IssueBatch(rendererData);
        VULKAN_WaitForGPU(rendererData);
        _ = VULKAN_CreateVertexBuffer(rendererData, @bitCast(@as(c_long, vbidx)), dataSizeInBytes);
    }
    vertexBuffer = &rendererData.*.vertexBuffers[@bitCast(@as(isize, @intCast(vbidx)))];
    _ = memcpy(vertexBuffer.*.mappedBufferPtr, vertexData, dataSizeInBytes);
    stateCache.*.vertexBuffer = vertexBuffer.*.buffer;
    rendererData.*.currentVertexBuffer = vbidx + @as(c_int, 1);
    if (rendererData.*.currentVertexBuffer >= SDL_VULKAN_NUM_VERTEX_BUFFERS) {
        rendererData.*.currentVertexBuffer = 0;
        rendererData.*.issueBatch = @"true" != 0;
    }
    return @"true" != 0;
}
pub fn VULKAN_GetRotationForCurrentRenderTarget(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkSurfaceTransformFlagBitsKHR {
    @setEvalBranchQuota(100000);
    if (rendererData.*.textureRenderTarget != null) {
        return VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;
    } else {
        return rendererData.*.swapChainPreTransform;
    }
}
pub fn VULKAN_IsDisplayRotated90Degrees(rotation: VkSurfaceTransformFlagBitsKHR) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (rotation) {
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_UpdateViewport(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    var viewport: [*c]const SDL_Rect = undefined;
    _ = &viewport;
    var projection: Float4X4 = undefined;
    _ = &projection;
    var view: Float4X4 = undefined;
    _ = &view;
    var rotation: VkSurfaceTransformFlagBitsKHR = undefined;
    _ = &rotation;
    var swapDimensions: bool = undefined;
    _ = &swapDimensions;
    var vkViewport: VkViewport = undefined;
    _ = &vkViewport;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                rendererData = @ptrCast(@alignCast(renderer.*.internal));
                viewport = &rendererData.*.currentViewport;
                rotation = VULKAN_GetRotationForCurrentRenderTarget(rendererData);
                if ((viewport.*.w == @as(c_int, 0)) or (viewport.*.h == @as(c_int, 0))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (rotation) {
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(VkSurfaceTransformFlagBitsKHR, VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            4 => {
                _ = memset(@ptrCast(@alignCast(&view)), 0, @sizeOf(@TypeOf(view)));
                view.unnamed_0.m[@as(c_int, 0)][@as(c_int, 0)] = @as(f32, 2.0) / @as(f32, @floatFromInt(viewport.*.w));
                view.unnamed_0.m[@as(c_int, 1)][@as(c_int, 1)] = -@as(f32, 2.0) / @as(f32, @floatFromInt(viewport.*.h));
                view.unnamed_0.m[@as(c_int, 2)][@as(c_int, 2)] = 1.0;
                view.unnamed_0.m[@as(c_int, 3)][@as(c_int, 0)] = -@as(f32, 1.0);
                view.unnamed_0.m[@as(c_int, 3)][@as(c_int, 1)] = 1.0;
                view.unnamed_0.m[@as(c_int, 3)][@as(c_int, 3)] = 1.0;
                rendererData.*.vertexShaderConstantsData.projectionAndView = MatrixMultiply(view, projection);
                swapDimensions = VULKAN_IsDisplayRotated90Degrees(rotation);
                if (swapDimensions) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            5 => {
                projection = MatrixRotationZ(SDL_PI_F * @as(f32, 0.5));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                projection = MatrixRotationZ(SDL_PI_F);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                projection = MatrixRotationZ(-SDL_PI_F * @as(f32, 0.5));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                projection = MatrixIdentity();
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                vkViewport.x = @floatFromInt(viewport.*.y);
                vkViewport.y = @floatFromInt(viewport.*.x);
                vkViewport.width = @floatFromInt(viewport.*.h);
                vkViewport.height = @floatFromInt(viewport.*.w);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                vkViewport.x = @floatFromInt(viewport.*.x);
                vkViewport.y = @floatFromInt(viewport.*.y);
                vkViewport.width = @floatFromInt(viewport.*.w);
                vkViewport.height = @floatFromInt(viewport.*.h);
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                vkViewport.minDepth = 0.0;
                vkViewport.maxDepth = 1.0;
                vkCmdSetViewport.?(rendererData.*.currentCommandBuffer, 0, 1, &vkViewport);
                rendererData.*.viewportDirty = @"false" != 0;
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_UpdateClipRect(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var viewport: [*c]const SDL_Rect = &rendererData.*.currentViewport;
    _ = &viewport;
    var rotation: VkSurfaceTransformFlagBitsKHR = VULKAN_GetRotationForCurrentRenderTarget(rendererData);
    _ = &rotation;
    var swapDimensions: bool = VULKAN_IsDisplayRotated90Degrees(rotation);
    _ = &swapDimensions;
    var scissor: VkRect2D = undefined;
    _ = &scissor;
    if (rendererData.*.currentCliprectEnabled) {
        scissor.offset.x = viewport.*.x + rendererData.*.currentCliprect.x;
        scissor.offset.y = viewport.*.y + rendererData.*.currentCliprect.y;
        scissor.extent.width = @bitCast(@as(c_int, rendererData.*.currentCliprect.w));
        scissor.extent.height = @bitCast(@as(c_int, rendererData.*.currentCliprect.h));
    } else {
        scissor.offset.x = viewport.*.x;
        scissor.offset.y = viewport.*.y;
        scissor.extent.width = @bitCast(@as(c_int, viewport.*.w));
        scissor.extent.height = @bitCast(@as(c_int, viewport.*.h));
    }
    if (swapDimensions) {
        var scissorTemp: VkRect2D = scissor;
        _ = &scissorTemp;
        scissor.offset.x = scissorTemp.offset.y;
        scissor.offset.y = scissorTemp.offset.x;
        scissor.extent.width = scissorTemp.extent.height;
        scissor.extent.height = scissorTemp.extent.width;
    }
    vkCmdSetScissor.?(rendererData.*.currentCommandBuffer, 0, 1, &scissor);
    rendererData.*.cliprectDirty = @"false" != 0;
    return @"true" != 0;
}
pub fn VULKAN_SetupShaderConstants(renderer: [*c]SDL_Renderer, cmd: [*c]const SDL_RenderCommand, texture: [*c]const SDL_Texture, constants: [*c]VULKAN_PixelShaderConstants) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "VULKAN_SetupShaderConstants".*;
    };
    _ = &static_local___func__;
    var output_headroom: f32 = undefined;
    _ = &output_headroom;
    var textureData: [*c]VULKAN_TextureData = undefined;
    _ = &textureData;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unknown scale mode\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memset(@ptrCast(@alignCast(constants)), 0, @sizeOf(@TypeOf(constants.*)));
                constants.*.scRGB_output = @floatFromInt(@intFromBool((renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))));
                constants.*.color_scale = cmd.*.data.draw.color_scale;
                if (texture != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                textureData = @ptrCast(@alignCast(texture.*.internal));
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if (((constants.*.texture_type == TEXTURETYPE_PALETTE_LINEAR) or (constants.*.texture_type == TEXTURETYPE_PALETTE_PIXELART)) or (constants.*.texture_type == TEXTURETYPE_RGB_PIXELART)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            5 => {
                switch (cmd.*.data.draw.texture_scale_mode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_NEAREST;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_LINEAR;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_PIXELART;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            14 => {
                if (!!(@intFromPtr("Unknown scale mode") != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 3996);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 22;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
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
                constants.*.texture_type = TEXTURETYPE_YUV;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            26 => {
                constants.*.texture_type = TEXTURETYPE_NV12;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            27 => {
                constants.*.texture_type = TEXTURETYPE_NV21;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            28 => {
                constants.*.texture_type = TEXTURETYPE_NV12;
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                constants.*.texture_type = TEXTURETYPE_YUV;
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            31 => {
                if (cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                constants.*.texture_type = TEXTURETYPE_RGB_PIXELART;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                constants.*.texture_type = TEXTURETYPE_RGB;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if (texture.*.colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                constants.*.input_type = INPUTTYPE_SCRGB;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if ((@as(SDL_ColorPrimaries, (texture.*.colorspace >> @intCast(@as(SDL_Colorspace, 10))) & @as(SDL_Colorspace, 31)) == @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT2020)) and (@as(SDL_TransferCharacteristics, (texture.*.colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)) == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ))) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            38 => {
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                constants.*.input_type = INPUTTYPE_UNSPECIFIED;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                constants.*.texture_width = @floatFromInt(texture.*.w);
                constants.*.texture_height = @floatFromInt(texture.*.h);
                constants.*.texel_width = @as(f32, 1.0) / constants.*.texture_width;
                constants.*.texel_height = @as(f32, 1.0) / constants.*.texture_height;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                constants.*.sdr_white_point = texture.*.SDR_white_point;
                if (renderer.*.target != null) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                output_headroom = renderer.*.target.*.HDR_headroom;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                output_headroom = renderer.*.HDR_headroom;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if ((texture.*.HDR_headroom > output_headroom) and (output_headroom > @as(f32, 0.0))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                constants.*.tonemap_method = TONEMAP_CHROME;
                constants.*.tonemap_factor1 = output_headroom / (texture.*.HDR_headroom * texture.*.HDR_headroom);
                constants.*.tonemap_factor2 = @as(f32, 1.0) / output_headroom;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                if (textureData.*.YCbCr_matrix != null) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&constants.*.YCbCr_matrix))))), @ptrCast(@alignCast(textureData.*.YCbCr_matrix)), @sizeOf(@TypeOf(constants.*.YCbCr_matrix)));
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn PQShaderScalesInput(shader_constants: [*c]const VULKAN_PixelShaderConstants) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (shader_constants.*.tonemap_method != @as(f32, 0.0)) {
        return @"true" != 0;
    }
    if (SDL_fabs_REAL(@floatCast(shader_constants.*.sdr_white_point - (shader_constants.*.color_scale * SCRGB_NITS))) > @as(f64, @floatCast(@as(f32, 1.0)))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn SelectShader(renderer: [*c]SDL_Renderer, shader_constants: [*c]const VULKAN_PixelShaderConstants) callconv(.c) VULKAN_Shader {
    @setEvalBranchQuota(100000);
    if (shader_constants != null) {
        if (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
            if (((shader_constants.*.texture_type == TEXTURETYPE_RGB) and (shader_constants.*.input_type == INPUTTYPE_HDR10)) and !PQShaderScalesInput(shader_constants)) {
                return SHADER_RGB_SIMPLE;
            } else {
                return SHADER_RGB_PQ;
            }
        }
        if (((shader_constants.*.texture_type == TEXTURETYPE_RGB) and (shader_constants.*.input_type == INPUTTYPE_UNSPECIFIED)) and (shader_constants.*.tonemap_method == TONEMAP_NONE)) {
            return SHADER_RGB;
        }
        return SHADER_ADVANCED;
    } else {
        if (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
            return SHADER_SOLID_PQ;
        }
        return SHADER_SOLID;
    }
}
pub fn VULKAN_AllocateDescriptorPool(rendererData: [*c]VULKAN_RenderData) callconv(.c) VkDescriptorPool {
    @setEvalBranchQuota(100000);
    var descriptorPool: VkDescriptorPool = null;
    _ = &descriptorPool;
    var descriptorPoolSizes: [3]VkDescriptorPoolSize = undefined;
    _ = &descriptorPoolSizes;
    var result: VkResult = undefined;
    _ = &result;
    descriptorPoolSizes[@as(c_int, 0)].descriptorCount = SDL_VULKAN_MAX_DESCRIPTOR_SETS;
    descriptorPoolSizes[@as(c_int, 0)].type = VK_DESCRIPTOR_TYPE_SAMPLER;
    descriptorPoolSizes[@as(c_int, 1)].descriptorCount = @bitCast(@as(c_int, SDL_VULKAN_NUM_TEXTURE_BINDINGS * SDL_VULKAN_MAX_DESCRIPTOR_SETS));
    descriptorPoolSizes[@as(c_int, 1)].type = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
    descriptorPoolSizes[@as(c_int, 2)].descriptorCount = SDL_VULKAN_MAX_DESCRIPTOR_SETS;
    descriptorPoolSizes[@as(c_int, 2)].type = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
    var descriptorPoolCreateInfo: VkDescriptorPoolCreateInfo = VkDescriptorPoolCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .maxSets = 0,
        .poolSizeCount = 0,
        .pPoolSizes = null,
    };
    _ = &descriptorPoolCreateInfo;
    descriptorPoolCreateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO;
    descriptorPoolCreateInfo.poolSizeCount = @truncate(@sizeOf(@TypeOf(descriptorPoolSizes)) / @sizeOf(@TypeOf(descriptorPoolSizes[@as(c_int, 0)])));
    descriptorPoolCreateInfo.pPoolSizes = @ptrCast(@alignCast(&descriptorPoolSizes));
    descriptorPoolCreateInfo.maxSets = SDL_VULKAN_MAX_DESCRIPTOR_SETS;
    result = vkCreateDescriptorPool.?(rendererData.*.device, &descriptorPoolCreateInfo, null, &descriptorPool);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescrptorPool()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescrptorPool()"))), SDL_Vulkan_GetResultString(result));
        return null;
    }
    return descriptorPool;
}
pub fn VULKAN_CreateDescriptorSetAndPipelineLayout(rendererData: [*c]VULKAN_RenderData, arg_samplerYcbcr: VkSampler, descriptorSetLayoutOut: [*c]VkDescriptorSetLayout, pipelineLayoutOut: [*c]VkPipelineLayout) callconv(.c) VkResult {
    @setEvalBranchQuota(100000);
    var samplerYcbcr = arg_samplerYcbcr;
    _ = &samplerYcbcr;
    var result: VkResult = undefined;
    _ = &result;
    var descriptorSetLayoutCreateInfo: VkDescriptorSetLayoutCreateInfo = VkDescriptorSetLayoutCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .bindingCount = 0,
        .pBindings = null,
    };
    _ = &descriptorSetLayoutCreateInfo;
    descriptorSetLayoutCreateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO;
    descriptorSetLayoutCreateInfo.flags = 0;
    var layoutBindings: [4]VkDescriptorSetLayoutBinding = undefined;
    _ = &layoutBindings;
    layoutBindings[@as(c_int, 0)].binding = 0;
    layoutBindings[@as(c_int, 0)].descriptorCount = 1;
    layoutBindings[@as(c_int, 0)].descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
    layoutBindings[@as(c_int, 0)].stageFlags = VK_SHADER_STAGE_FRAGMENT_BIT;
    layoutBindings[@as(c_int, 0)].pImmutableSamplers = null;
    {
        var i: u32 = 1;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(layoutBindings)) / @sizeOf(@TypeOf(layoutBindings[@as(c_int, 0)])))) : (i +%= 1) {
            layoutBindings[i].binding = i;
            layoutBindings[i].descriptorCount = 1;
            layoutBindings[i].descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
            layoutBindings[i].stageFlags = VK_SHADER_STAGE_FRAGMENT_BIT;
            layoutBindings[i].pImmutableSamplers = @ptrCast(@alignCast(if (@as(?*anyopaque, @ptrCast(@alignCast(samplerYcbcr))) != @as(?*anyopaque, null)) @as(?*anyopaque, @ptrCast(@alignCast(&samplerYcbcr))) else @as(?*anyopaque, null)));
        }
    }
    descriptorSetLayoutCreateInfo.bindingCount = @truncate(@sizeOf(@TypeOf(layoutBindings)) / @sizeOf(@TypeOf(layoutBindings[@as(c_int, 0)])));
    descriptorSetLayoutCreateInfo.pBindings = @ptrCast(@alignCast(&layoutBindings));
    result = vkCreateDescriptorSetLayout.?(rendererData.*.device, &descriptorSetLayoutCreateInfo, null, descriptorSetLayoutOut);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorSetLayout()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateDescriptorSetLayout()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    var pipelineLayoutCreateInfo: VkPipelineLayoutCreateInfo = VkPipelineLayoutCreateInfo{
        .sType = 0,
        .pNext = null,
        .flags = 0,
        .setLayoutCount = 0,
        .pSetLayouts = null,
        .pushConstantRangeCount = 0,
        .pPushConstantRanges = null,
    };
    _ = &pipelineLayoutCreateInfo;
    var pushConstantRange: VkPushConstantRange = undefined;
    _ = &pushConstantRange;
    pushConstantRange.size = @truncate(@sizeOf(VULKAN_VertexShaderConstants));
    pushConstantRange.offset = 0;
    pushConstantRange.stageFlags = VK_SHADER_STAGE_VERTEX_BIT;
    pipelineLayoutCreateInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
    pipelineLayoutCreateInfo.setLayoutCount = 1;
    pipelineLayoutCreateInfo.pSetLayouts = descriptorSetLayoutOut;
    pipelineLayoutCreateInfo.pushConstantRangeCount = 1;
    pipelineLayoutCreateInfo.pPushConstantRanges = &pushConstantRange;
    result = vkCreatePipelineLayout.?(rendererData.*.device, &pipelineLayoutCreateInfo, null, pipelineLayoutOut);
    if (result != VK_SUCCESS) {
        if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout()"))), SDL_Vulkan_GetResultString(result));
            __builtin.debugtrap();
        }
        _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreatePipelineLayout()"))), SDL_Vulkan_GetResultString(result));
        return result;
    }
    return result;
}
pub fn VULKAN_AllocateDescriptorSet(renderer: [*c]SDL_Renderer, shader: VULKAN_Shader, arg_descriptorSetLayout: VkDescriptorSetLayout, constantBuffer: VkBuffer, constantBufferOffset: VkDeviceSize, numImages: c_int, imageViews: [*c]VkImageView, numSamplers: c_int, samplers: [*c]VkSampler) callconv(.c) VkDescriptorSet {
    @setEvalBranchQuota(100000);
    var descriptorSetLayout = arg_descriptorSetLayout;
    _ = &descriptorSetLayout;
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "VULKAN_AllocateDescriptorSet".*;
    };
    _ = &static_local___func__;
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var currentDescriptorPoolIndex: u32 = rendererData.*.currentDescriptorPoolIndex;
    _ = &currentDescriptorPoolIndex;
    var descriptorPool: VkDescriptorPool = rendererData.*.descriptorPools[rendererData.*.currentCommandBufferIndex][currentDescriptorPoolIndex];
    _ = &descriptorPool;
    var descriptorSetAllocateInfo: VkDescriptorSetAllocateInfo = VkDescriptorSetAllocateInfo{
        .sType = 0,
        .pNext = null,
        .descriptorPool = null,
        .descriptorSetCount = 0,
        .pSetLayouts = null,
    };
    _ = &descriptorSetAllocateInfo;
    descriptorSetAllocateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
    descriptorSetAllocateInfo.descriptorSetCount = 1;
    descriptorSetAllocateInfo.descriptorPool = descriptorPool;
    descriptorSetAllocateInfo.pSetLayouts = &descriptorSetLayout;
    var descriptorSet: VkDescriptorSet = null;
    _ = &descriptorSet;
    var result: VkResult = if (rendererData.*.currentDescriptorSetIndex >= @as(u32, SDL_VULKAN_MAX_DESCRIPTOR_SETS)) VK_ERROR_OUT_OF_DEVICE_MEMORY else VK_SUCCESS;
    _ = &result;
    if (result == VK_SUCCESS) {
        result = vkAllocateDescriptorSets.?(rendererData.*.device, &descriptorSetAllocateInfo, &descriptorSet);
    }
    if (result != VK_SUCCESS) {
        currentDescriptorPoolIndex +%= 1;
        if (currentDescriptorPoolIndex < rendererData.*.numDescriptorPools[rendererData.*.currentCommandBufferIndex]) {
            descriptorPool = rendererData.*.descriptorPools[rendererData.*.currentCommandBufferIndex][currentDescriptorPoolIndex];
            descriptorSetAllocateInfo.descriptorPool = descriptorPool;
            result = vkAllocateDescriptorSets.?(rendererData.*.device, &descriptorSetAllocateInfo, &descriptorSet);
            if (result != VK_SUCCESS) {
                _ = SDL_SetError_REAL("Unable to allocate descriptor set");
                return null;
            }
            rendererData.*.currentDescriptorPoolIndex = currentDescriptorPoolIndex;
            rendererData.*.currentDescriptorSetIndex = 0;
        } else {
            descriptorPool = VULKAN_AllocateDescriptorPool(rendererData);
            if (@as(?*anyopaque, @ptrCast(@alignCast(descriptorPool))) == @as(?*anyopaque, null)) {
                return null;
            }
            rendererData.*.numDescriptorPools[rendererData.*.currentCommandBufferIndex] +%= 1;
            var descriptorPools: [*c]VkDescriptorPool = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.descriptorPools[rendererData.*.currentCommandBufferIndex])), @sizeOf(VkDescriptorPool) *% @as(c_ulong, rendererData.*.numDescriptorPools[rendererData.*.currentCommandBufferIndex]))));
            _ = &descriptorPools;
            descriptorPools[rendererData.*.numDescriptorPools[rendererData.*.currentCommandBufferIndex] -% @as(u32, 1)] = descriptorPool;
            rendererData.*.descriptorPools[rendererData.*.currentCommandBufferIndex] = descriptorPools;
            rendererData.*.currentDescriptorPoolIndex = currentDescriptorPoolIndex;
            rendererData.*.currentDescriptorSetIndex = 0;
            return VULKAN_AllocateDescriptorSet(renderer, shader, descriptorSetLayout, constantBuffer, constantBufferOffset, numImages, imageViews, numSamplers, samplers);
        }
    }
    rendererData.*.currentDescriptorSetIndex +%= 1;
    var combinedImageSamplerDescriptor: [3]VkDescriptorImageInfo = undefined;
    _ = &combinedImageSamplerDescriptor;
    var bufferDescriptor: VkDescriptorBufferInfo = VkDescriptorBufferInfo{
        .buffer = null,
        .offset = 0,
        .range = 0,
    };
    _ = &bufferDescriptor;
    bufferDescriptor.buffer = constantBuffer;
    bufferDescriptor.offset = constantBufferOffset;
    bufferDescriptor.range = @sizeOf(VULKAN_PixelShaderConstants);
    var descriptorWrites: [4]VkWriteDescriptorSet = undefined;
    _ = &descriptorWrites;
    _ = memset(@ptrCast(@alignCast(&descriptorWrites)), 0, @sizeOf(@TypeOf(descriptorWrites)));
    var descriptorCount: u32 = 1;
    _ = &descriptorCount;
    descriptorWrites[@as(c_int, 0)].sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    descriptorWrites[@as(c_int, 0)].dstSet = descriptorSet;
    descriptorWrites[@as(c_int, 0)].dstBinding = 0;
    descriptorWrites[@as(c_int, 0)].dstArrayElement = 0;
    descriptorWrites[@as(c_int, 0)].descriptorCount = 1;
    descriptorWrites[@as(c_int, 0)].descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
    descriptorWrites[@as(c_int, 0)].pBufferInfo = &bufferDescriptor;
    while (true) {
        while (!(numSamplers == numImages)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "numSamplers == numImages",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 4269);
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
        var i: c_int = 0;
        _ = &i;
        while (i < numImages) : (i += 1) {
            while (true) {
                while (!(@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(combinedImageSamplerDescriptor)) / @sizeOf(@TypeOf(combinedImageSamplerDescriptor[@as(c_int, 0)]))))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "i < (sizeof(combinedImageSamplerDescriptor)/sizeof(combinedImageSamplerDescriptor[0]))",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 4271);
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
            var pImageInfo: [*c]VkDescriptorImageInfo = &combinedImageSamplerDescriptor[@bitCast(@as(isize, @intCast(i)))];
            _ = &pImageInfo;
            _ = memset(@ptrCast(@alignCast(pImageInfo)), 0, @sizeOf(@TypeOf(pImageInfo.*)));
            if (descriptorSetLayout == rendererData.*.descriptorSetLayout) {
                pImageInfo.*.sampler = samplers[@bitCast(@as(isize, @intCast(i)))];
            } else {}
            pImageInfo.*.imageView = imageViews[@bitCast(@as(isize, @intCast(i)))];
            pImageInfo.*.imageLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
            while (true) {
                while (!(@as(c_ulong, descriptorCount) < (@sizeOf(@TypeOf(descriptorWrites)) / @sizeOf(@TypeOf(descriptorWrites[@as(c_int, 0)]))))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "descriptorCount < (sizeof(descriptorWrites)/sizeof(descriptorWrites[0]))",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 4282);
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
            var pDescriptorSet: [*c]VkWriteDescriptorSet = &descriptorWrites[
                blk: {
                    const ref = &descriptorCount;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }
            ];
            _ = &pDescriptorSet;
            pDescriptorSet.*.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
            pDescriptorSet.*.dstSet = descriptorSet;
            pDescriptorSet.*.dstBinding = @bitCast(@as(c_int, @as(c_int, 1) + i));
            pDescriptorSet.*.dstArrayElement = 0;
            pDescriptorSet.*.descriptorCount = 1;
            pDescriptorSet.*.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
            pDescriptorSet.*.pImageInfo = pImageInfo;
        }
    }
    vkUpdateDescriptorSets.?(rendererData.*.device, descriptorCount, @ptrCast(@alignCast(&descriptorWrites)), 0, null);
    return descriptorSet;
}
pub fn VULKAN_CleanupYUVPipeline(rendererData: [*c]VULKAN_RenderData, pipeline: [*c]VULKAN_YUVPipeline) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(pipeline.*.samplerYcbcrConversion))) != @as(?*anyopaque, null)) {
        vkDestroySamplerYcbcrConversionKHR.?(rendererData.*.device, pipeline.*.samplerYcbcrConversion, null);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(pipeline.*.samplerYcbcr))) != @as(?*anyopaque, null)) {
        vkDestroySampler.?(rendererData.*.device, pipeline.*.samplerYcbcr, null);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(pipeline.*.pipelineLayoutYcbcr))) != @as(?*anyopaque, null)) {
        vkDestroyPipelineLayout.?(rendererData.*.device, pipeline.*.pipelineLayoutYcbcr, null);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(pipeline.*.descriptorSetLayoutYcbcr))) != @as(?*anyopaque, null)) {
        vkDestroyDescriptorSetLayout.?(rendererData.*.device, pipeline.*.descriptorSetLayoutYcbcr, null);
    }
    SDL_free_REAL(@ptrCast(@alignCast(pipeline)));
}
pub fn VULKAN_SetDrawState(renderer: [*c]SDL_Renderer, cmd: [*c]const SDL_RenderCommand, pipelineLayout: VkPipelineLayout, descriptorSetLayout: VkDescriptorSetLayout, arg_shader_constants: [*c]const VULKAN_PixelShaderConstants, topology: VkPrimitiveTopology, numImages: c_int, imageViews: [*c]VkImageView, numSamplers: c_int, samplers: [*c]VkSampler, matrix: [*c]const Float4X4, stateCache: [*c]VULKAN_DrawStateCache) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var shader_constants = arg_shader_constants;
    _ = &shader_constants;
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "VULKAN_SetDrawState".*;
    };
    _ = &static_local___func__;
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    const blendMode: SDL_BlendMode = cmd.*.data.draw.blend;
    _ = &blendMode;
    var format: VkFormat = undefined;
    _ = &format;
    var newmatrix: [*c]const Float4X4 = if (matrix != null) matrix else @as([*c]const Float4X4, @ptrCast(@alignCast(&rendererData.*.identity)));
    _ = &newmatrix;
    var updateConstants: bool = @"false" != 0;
    _ = &updateConstants;
    var shader: VULKAN_Shader = SelectShader(renderer, shader_constants);
    _ = &shader;
    var solid_constants: VULKAN_PixelShaderConstants = undefined;
    _ = &solid_constants;
    var descriptorSet: VkDescriptorSet = undefined;
    _ = &descriptorSet;
    var constantBuffer: VkBuffer = undefined;
    _ = &constantBuffer;
    var constantBufferOffset: VkDeviceSize = undefined;
    _ = &constantBufferOffset;
    var i: c_int = undefined;
    _ = &i;
    if (!VULKAN_ActivateCommandBuffer(renderer, VK_ATTACHMENT_LOAD_OP_LOAD, null, stateCache)) {
        return @"false" != 0;
    }
    if (rendererData.*.textureRenderTarget != null) {
        format = rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].format;
    } else {
        format = rendererData.*.surfaceFormat.format;
    }
    if ((((((!(rendererData.*.currentPipelineState != null) or (rendererData.*.currentPipelineState.*.shader != shader)) or (rendererData.*.currentPipelineState.*.blendMode != blendMode)) or (rendererData.*.currentPipelineState.*.topology != topology)) or (rendererData.*.currentPipelineState.*.format != format)) or (rendererData.*.currentPipelineState.*.pipelineLayout != pipelineLayout)) or (rendererData.*.currentPipelineState.*.descriptorSetLayout != descriptorSetLayout)) {
        rendererData.*.currentPipelineState = null;
        {
            i = 0;
            while (i < rendererData.*.pipelineStateCount) : (i += 1) {
                var candidatePiplineState: [*c]VULKAN_PipelineState = &rendererData.*.pipelineStates[@bitCast(@as(isize, @intCast(i)))];
                _ = &candidatePiplineState;
                if ((((((candidatePiplineState.*.shader == shader) and (candidatePiplineState.*.blendMode == blendMode)) and (candidatePiplineState.*.topology == topology)) and (candidatePiplineState.*.format == format)) and (candidatePiplineState.*.pipelineLayout == pipelineLayout)) and (candidatePiplineState.*.descriptorSetLayout == descriptorSetLayout)) {
                    rendererData.*.currentPipelineState = candidatePiplineState;
                    break;
                }
            }
        }
        if (!(rendererData.*.currentPipelineState != null)) {
            rendererData.*.currentPipelineState = VULKAN_CreatePipelineState(renderer, shader, pipelineLayout, descriptorSetLayout, blendMode, topology, format);
        }
        if (!(rendererData.*.currentPipelineState != null)) {
            return SDL_SetError_REAL("Unable to create required pipeline state");
        }
        vkCmdBindPipeline.?(rendererData.*.currentCommandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, rendererData.*.currentPipelineState.*.pipeline);
        updateConstants = @"true" != 0;
    }
    if (rendererData.*.viewportDirty) {
        if (VULKAN_UpdateViewport(renderer)) {
            updateConstants = @"true" != 0;
        }
    }
    if (rendererData.*.cliprectDirty) {
        _ = VULKAN_UpdateClipRect(renderer);
    }
    if ((@as(c_int, @intFromBool(updateConstants)) == @"true") or (SDL_memcmp_REAL(@ptrCast(@alignCast(&rendererData.*.vertexShaderConstantsData.model)), @ptrCast(@alignCast(newmatrix)), @sizeOf(@TypeOf(newmatrix.*))) != @as(c_int, 0))) {
        _ = memcpy(@ptrCast(@alignCast(&rendererData.*.vertexShaderConstantsData.model)), @ptrCast(@alignCast(newmatrix)), @sizeOf(@TypeOf(newmatrix.*)));
        vkCmdPushConstants.?(rendererData.*.currentCommandBuffer, rendererData.*.currentPipelineState.*.pipelineLayout, VK_SHADER_STAGE_VERTEX_BIT, 0, @truncate(@sizeOf(@TypeOf(rendererData.*.vertexShaderConstantsData))), @ptrCast(@alignCast(&rendererData.*.vertexShaderConstantsData)));
    }
    if (!(shader_constants != null)) {
        VULKAN_SetupShaderConstants(renderer, cmd, null, &solid_constants);
        shader_constants = &solid_constants;
    }
    constantBuffer = rendererData.*.constantBuffers[rendererData.*.currentCommandBufferIndex][rendererData.*.currentConstantBufferIndex].buffer;
    constantBufferOffset = @bitCast(@as(c_long, if (rendererData.*.currentConstantBufferOffset < @as(c_int, 0)) @as(c_int, 0) else rendererData.*.currentConstantBufferOffset));
    if (updateConstants or (SDL_memcmp_REAL(@ptrCast(@alignCast(shader_constants)), @ptrCast(@alignCast(&rendererData.*.currentPipelineState.*.shader_constants)), @sizeOf(@TypeOf(shader_constants.*))) != @as(c_int, 0))) {
        if (rendererData.*.currentConstantBufferOffset == -@as(c_int, 1)) {
            rendererData.*.currentConstantBufferOffset = 0;
            constantBufferOffset = 0;
        } else {
            var alignment: VkDeviceSize = rendererData.*.physicalDeviceProperties.limits.minUniformBufferOffsetAlignment;
            _ = &alignment;
            while (true) {
                while (!(rendererData.*.currentConstantBufferOffset >= @as(c_int, 0))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "rendererData->currentConstantBufferOffset >= 0",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 4481);
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
                const ref = &rendererData.*.currentConstantBufferOffset;
                ref.* = @bitCast(@as(c_uint, @truncate(@as(VkDeviceSize, @bitCast(@as(c_long, ref.*))) +% (@as(VkDeviceSize, @bitCast(@as(c_long, @as(i32, @bitCast(@as(c_uint, @truncate((@sizeOf(VULKAN_PixelShaderConstants) +% alignment) -% @as(c_ulong, 1)))))))) & ~(alignment -% @as(VkDeviceSize, 1))))));
            }
            constantBufferOffset = @bitCast(@as(c_long, rendererData.*.currentConstantBufferOffset));
        }
        if (rendererData.*.currentConstantBufferOffset >= SDL_VULKAN_CONSTANT_BUFFER_DEFAULT_SIZE) {
            var newConstantBufferIndex: u32 = rendererData.*.currentConstantBufferIndex +% @as(u32, 1);
            _ = &newConstantBufferIndex;
            if (newConstantBufferIndex >= rendererData.*.numConstantBuffers[rendererData.*.currentCommandBufferIndex]) {
                var newConstantBuffer: VULKAN_Buffer = undefined;
                _ = &newConstantBuffer;
                var result: VkResult = VULKAN_AllocateBuffer(rendererData, SDL_VULKAN_CONSTANT_BUFFER_DEFAULT_SIZE, VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &newConstantBuffer);
                _ = &result;
                if (result != VK_SUCCESS) {
                    return @"false" != 0;
                }
                rendererData.*.numConstantBuffers[rendererData.*.currentCommandBufferIndex] +%= 1;
                var newConstantBuffers: [*c]VULKAN_Buffer = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.constantBuffers[rendererData.*.currentCommandBufferIndex])), @sizeOf(VULKAN_Buffer) *% @as(c_ulong, rendererData.*.numConstantBuffers[rendererData.*.currentCommandBufferIndex]))));
                _ = &newConstantBuffers;
                newConstantBuffers[rendererData.*.numConstantBuffers[rendererData.*.currentCommandBufferIndex] -% @as(u32, 1)] = newConstantBuffer;
                rendererData.*.constantBuffers[rendererData.*.currentCommandBufferIndex] = newConstantBuffers;
            }
            rendererData.*.currentConstantBufferIndex = newConstantBufferIndex;
            rendererData.*.currentConstantBufferOffset = 0;
            constantBufferOffset = 0;
            constantBuffer = rendererData.*.constantBuffers[rendererData.*.currentCommandBufferIndex][rendererData.*.currentConstantBufferIndex].buffer;
        }
        _ = memcpy(@ptrCast(@alignCast(&rendererData.*.currentPipelineState.*.shader_constants)), @ptrCast(@alignCast(shader_constants)), @sizeOf(@TypeOf(shader_constants.*)));
        var dst: [*c]u8 = @ptrCast(@alignCast(rendererData.*.constantBuffers[rendererData.*.currentCommandBufferIndex][rendererData.*.currentConstantBufferIndex].mappedBufferPtr));
        _ = &dst;
        dst += constantBufferOffset;
        _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(&rendererData.*.currentPipelineState.*.shader_constants)), @sizeOf(VULKAN_PixelShaderConstants));
    }
    descriptorSet = VULKAN_AllocateDescriptorSet(renderer, shader, descriptorSetLayout, constantBuffer, constantBufferOffset, numImages, imageViews, numSamplers, samplers);
    if (@as(?*anyopaque, @ptrCast(@alignCast(descriptorSet))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    vkCmdBindDescriptorSets.?(rendererData.*.currentCommandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, rendererData.*.currentPipelineState.*.pipelineLayout, 0, 1, &descriptorSet, 0, null);
    return @"true" != 0;
}
pub fn VULKAN_GetSampler(data: [*c]VULKAN_RenderData, format: SDL_PixelFormat, arg_scale_mode: SDL_ScaleMode, address_u: SDL_TextureAddressMode, address_v: SDL_TextureAddressMode) callconv(.c) VkSampler {
    @setEvalBranchQuota(100000);
    var scale_mode = arg_scale_mode;
    _ = &scale_mode;
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "VULKAN_GetSampler".*;
    };
    _ = &static_local___func__;
    var key: Uint32 = undefined;
    _ = &key;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "key < (sizeof(data->samplers)/sizeof(data->samplers[0]))",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var samplerCreateInfo: VkSamplerCreateInfo = undefined;
    _ = &samplerCreateInfo;
    var result: VkResult = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                scale_mode = SDL_SCALEMODE_NEAREST;
                {
                    sdl_pc = 3;
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
                key = @bitCast(@as(c_int, ((@as(c_int, @intFromBool((scale_mode == SDL_SCALEMODE_NEAREST))) << @intCast(@as(c_int, 0))) | (@as(c_int, @intFromBool((address_u == SDL_TEXTURE_ADDRESS_WRAP))) << @intCast(@as(c_int, 1)))) | (@as(c_int, @intFromBool((address_v == SDL_TEXTURE_ADDRESS_WRAP))) << @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!(data.*.samplers[key] != null)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            7 => {
                if (!(@as(c_ulong, key) < (@sizeOf(@TypeOf(data.*.samplers)) / @sizeOf(@TypeOf(data.*.samplers[@as(c_int, 0)]))))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_vulkan.c", 4544);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 15;
                    continue;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                samplerCreateInfo = VkSamplerCreateInfo{
                    .sType = 0,
                    .pNext = null,
                    .flags = 0,
                    .magFilter = @import("std").mem.zeroes(VkFilter),
                    .minFilter = @import("std").mem.zeroes(VkFilter),
                    .mipmapMode = @import("std").mem.zeroes(VkSamplerMipmapMode),
                    .addressModeU = @import("std").mem.zeroes(VkSamplerAddressMode),
                    .addressModeV = @import("std").mem.zeroes(VkSamplerAddressMode),
                    .addressModeW = @import("std").mem.zeroes(VkSamplerAddressMode),
                    .mipLodBias = 0,
                    .anisotropyEnable = 0,
                    .maxAnisotropy = 0,
                    .compareEnable = 0,
                    .compareOp = @import("std").mem.zeroes(VkCompareOp),
                    .minLod = 0,
                    .maxLod = 0,
                    .borderColor = @import("std").mem.zeroes(VkBorderColor),
                    .unnormalizedCoordinates = 0,
                };
                samplerCreateInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO;
                samplerCreateInfo.mipmapMode = VK_SAMPLER_MIPMAP_MODE_NEAREST;
                samplerCreateInfo.addressModeW = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
                samplerCreateInfo.mipLodBias = 0.0;
                samplerCreateInfo.anisotropyEnable = VK_FALSE;
                samplerCreateInfo.maxAnisotropy = 1.0;
                samplerCreateInfo.minLod = 0.0;
                samplerCreateInfo.maxLod = 1000.0;
                switch (scale_mode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 21;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                return data.*.samplers[key];
            },
            19 => {
                switch (address_u) {
                    SDL_TEXTURE_ADDRESS_CLAMP => {
                        sdl_pc = 25;
                        continue;
                    },
                    SDL_TEXTURE_ADDRESS_WRAP => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            20 => {
                samplerCreateInfo.magFilter = VK_FILTER_NEAREST;
                samplerCreateInfo.minFilter = VK_FILTER_NEAREST;
                {
                    sdl_pc = 19;
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
                samplerCreateInfo.magFilter = VK_FILTER_LINEAR;
                samplerCreateInfo.minFilter = VK_FILTER_LINEAR;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                _ = SDL_SetError_REAL("Unknown scale mode: %d", scale_mode);
                return null;
            },
            24 => {
                switch (address_v) {
                    SDL_TEXTURE_ADDRESS_CLAMP => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_TEXTURE_ADDRESS_WRAP => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
                        continue;
                    },
                }
            },
            25 => {
                samplerCreateInfo.addressModeU = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                samplerCreateInfo.addressModeU = VK_SAMPLER_ADDRESS_MODE_REPEAT;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                _ = SDL_SetError_REAL("Unknown texture address mode: %d", address_u);
                return null;
            },
            28 => {
                result = vkCreateSampler.?(data.*.device, &samplerCreateInfo, null, &data.*.samplers[key]);
                if (result != VK_SUCCESS) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            29 => {
                samplerCreateInfo.addressModeV = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            30 => {
                samplerCreateInfo.addressModeV = VK_SAMPLER_ADDRESS_MODE_REPEAT;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                _ = SDL_SetError_REAL("Unknown texture address mode: %d", address_v);
                return null;
            },
            32 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
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
                    sdl_pc = 18;
                    continue;
                }
            },
            35 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSampler()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
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
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkCreateSampler()"))), SDL_Vulkan_GetResultString(result));
                return null;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_SetCopyState(renderer: [*c]SDL_Renderer, cmd: [*c]const SDL_RenderCommand, matrix: [*c]const Float4X4, stateCache: [*c]VULKAN_DrawStateCache) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
    _ = &texture;
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var textureData: [*c]VULKAN_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &textureData;
    var numImageViews: c_int = 0;
    _ = &numImageViews;
    var imageViews: [3]VkImageView = undefined;
    _ = &imageViews;
    var numSamplers: c_int = 0;
    _ = &numSamplers;
    var samplers: [3]VkSampler = undefined;
    _ = &samplers;
    var constants: VULKAN_PixelShaderConstants = undefined;
    _ = &constants;
    var descriptorSetLayout: VkDescriptorSetLayout = undefined;
    _ = &descriptorSetLayout;
    var pipelineLayout: VkPipelineLayout = undefined;
    _ = &pipelineLayout;
    if (!(textureData != null)) {
        return SDL_SetError_REAL("Texture is not currently available");
    }
    VULKAN_SetupShaderConstants(renderer, cmd, texture, &constants);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < textureData.*.numImages) : (i += 1) {
            if (textureData.*.images[@bitCast(@as(isize, @intCast(i)))].imageLayout != @as(VkImageLayout, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL)) {
                var stoppedRenderPass: bool = @"false" != 0;
                _ = &stoppedRenderPass;
                if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
                    vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
                    rendererData.*.currentRenderPass = null;
                    stoppedRenderPass = @"true" != 0;
                }
                VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, ((VK_ACCESS_TRANSFER_WRITE_BIT | VK_ACCESS_SHADER_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_ACCESS_SHADER_READ_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT) | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT)), VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, textureData.*.images[@bitCast(@as(isize, @intCast(i)))].image, &textureData.*.images[@bitCast(@as(isize, @intCast(i)))].imageLayout);
                if (stoppedRenderPass) {
                    VULKAN_BeginRenderPass(rendererData, VK_ATTACHMENT_LOAD_OP_LOAD, null);
                }
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < textureData.*.numImageViews) : (i += 1) {
            imageViews[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &numImageViews;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = textureData.*.imageViews[@bitCast(@as(isize, @intCast(i)))];
        }
    }
    samplers[@bitCast(@as(isize, @intCast(numSamplers)))] = VULKAN_GetSampler(rendererData, texture.*.format, cmd.*.data.draw.texture_scale_mode, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
    if (@as(?*anyopaque, @ptrCast(@alignCast(samplers[@bitCast(@as(isize, @intCast(numSamplers)))]))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    numSamplers += 1;
    if (texture.*.palette != null) {
        var palette: [*c]VULKAN_PaletteData = @ptrCast(@alignCast(texture.*.palette.*.internal));
        _ = &palette;
        if (palette.*.image.imageLayout != @as(VkImageLayout, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL)) {
            var stoppedRenderPass: bool = @"false" != 0;
            _ = &stoppedRenderPass;
            if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
                vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
                rendererData.*.currentRenderPass = null;
                stoppedRenderPass = @"true" != 0;
            }
            VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, ((VK_ACCESS_TRANSFER_WRITE_BIT | VK_ACCESS_SHADER_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_ACCESS_SHADER_READ_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT) | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT)), VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, palette.*.image.image, &palette.*.image.imageLayout);
            if (stoppedRenderPass) {
                VULKAN_BeginRenderPass(rendererData, VK_ATTACHMENT_LOAD_OP_LOAD, null);
            }
        }
        imageViews[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &numImageViews;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = palette.*.imageView;
        samplers[@bitCast(@as(isize, @intCast(numSamplers)))] = VULKAN_GetSampler(rendererData, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
        if (@as(?*anyopaque, @ptrCast(@alignCast(samplers[@bitCast(@as(isize, @intCast(numSamplers)))]))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
        numSamplers += 1;
    }
    while (@as(c_ulong, @bitCast(@as(c_long, numImageViews))) < (@sizeOf(@TypeOf(imageViews)) / @sizeOf(@TypeOf(imageViews[@as(c_int, 0)])))) {
        imageViews[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &numImageViews;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = imageViews[@as(c_int, 0)];
    }
    while (@as(c_ulong, @bitCast(@as(c_long, numSamplers))) < (@sizeOf(@TypeOf(samplers)) / @sizeOf(@TypeOf(samplers[@as(c_int, 0)])))) {
        samplers[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &numSamplers;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = samplers[@as(c_int, 0)];
    }
    if (textureData.*.yuvPipeline != null) {
        descriptorSetLayout = textureData.*.yuvPipeline.*.descriptorSetLayoutYcbcr;
        pipelineLayout = textureData.*.yuvPipeline.*.pipelineLayoutYcbcr;
    } else {
        descriptorSetLayout = rendererData.*.descriptorSetLayout;
        pipelineLayout = rendererData.*.pipelineLayout;
    }
    return VULKAN_SetDrawState(renderer, cmd, pipelineLayout, descriptorSetLayout, &constants, VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, numImageViews, @ptrCast(@alignCast(&imageViews)), numSamplers, @ptrCast(@alignCast(&samplers)), matrix, stateCache);
}
pub fn VULKAN_DrawPrimitives(renderer: [*c]SDL_Renderer, _: VkPrimitiveTopology, vertexStart: usize, vertexCount: usize) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &vertexStart;
    _ = &vertexCount;
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    vkCmdDraw.?(rendererData.*.currentCommandBuffer, @truncate(vertexCount), 1, @truncate(vertexStart), 0);
}
pub fn VULKAN_InvalidateCachedState(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    rendererData.*.currentPipelineState = null;
    rendererData.*.cliprectDirty = @"true" != 0;
    _ = VULKAN_IssueBatch(rendererData);
}
pub fn VULKAN_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, vertsize: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    var currentRotation: VkSurfaceTransformFlagBitsKHR = undefined;
    _ = &currentRotation;
    var stateCache: VULKAN_DrawStateCache = undefined;
    _ = &stateCache;
    var viewport: [*c]SDL_Rect = undefined;
    _ = &viewport;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var color: SDL_FColor = undefined;
    _ = &color;
    var clearColor: VkClearColorValue = undefined;
    _ = &clearColor;
    var count: usize = undefined;
    _ = &count;
    var first: usize = undefined;
    _ = &first;
    var start: usize = undefined;
    _ = &start;
    var verts: [*c]const VULKAN_VertexPositionColor = undefined;
    _ = &verts;
    var have_point_draw_state: bool = undefined;
    _ = &have_point_draw_state;
    var line_start: usize = undefined;
    _ = &line_start;
    var line_end: usize = undefined;
    _ = &line_end;
    var finalcmd: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd;
    var nextcmd: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd;
    var thiscolorscale: f32 = undefined;
    _ = &thiscolorscale;
    var thisblend: SDL_BlendMode = undefined;
    _ = &thisblend;
    var nextcmdtype: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype;
    var thiscolorscale_1: f32 = undefined;
    _ = &thiscolorscale_1;
    var thistexture: [*c]SDL_Texture = undefined;
    _ = &thistexture;
    var thisblend_2: SDL_BlendMode = undefined;
    _ = &thisblend_2;
    var thisscalemode: SDL_ScaleMode = undefined;
    _ = &thisscalemode;
    var thisaddressmode_u: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_u;
    var thisaddressmode_v: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_v;
    var thiscmdtype: SDL_RenderCommandType = undefined;
    _ = &thiscmdtype;
    var finalcmd_3: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd_3;
    var nextcmd_4: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd_4;
    var count_5: usize = undefined;
    _ = &count_5;
    var first_6: usize = undefined;
    _ = &first_6;
    var start_7: usize = undefined;
    _ = &start_7;
    var nextcmdtype_8: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype_8;
    var setState: bool = undefined;
    _ = &setState;
    comptime {
        if (!(@sizeOf(@TypeOf(viewport.*)) == @sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)))) @compileError("static assertion failed \"sizeof (*(viewport)) == sizeof (*( &cmd->data.viewport.rect))\"");
    }
    comptime {
        if (!(@sizeOf(@TypeOf((&rendererData.*.currentCliprect).*)) == @sizeOf(@TypeOf(rect.*)))) @compileError("static assertion failed \"sizeof (*(&rendererData->currentCliprect)) == sizeof (*( rect))\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                rendererData = @ptrCast(@alignCast(renderer.*.internal));
                currentRotation = VULKAN_GetRotationForCurrentRenderTarget(rendererData);
                _ = memset(@ptrCast(@alignCast(&stateCache)), 0, @sizeOf(@TypeOf(stateCache)));
                if (!(rendererData.*.device != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Device lost and couldn't be recovered");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (rendererData.*.currentViewportRotation != @as(c_int, @bitCast(currentRotation))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                rendererData.*.currentViewportRotation = @bitCast(currentRotation);
                rendererData.*.viewportDirty = @"true" != 0;
                rendererData.*.cliprectDirty = @"true" != 0;
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
                if (rendererData.*.recreateSwapchain) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                if (VULKAN_UpdateForWindowSizeChange(renderer) != VK_SUCCESS) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (!VULKAN_UpdateVertexBuffer(renderer, vertices, vertsize, &stateCache)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                rendererData.*.recreateSwapchain = @"false" != 0;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                return @"false" != 0;
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
                if (cmd != null) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                switch (cmd.*.command) {
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETVIEWPORT) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETCLIPRECT) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_CLEAR) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 110;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            18 => {
                return @"true" != 0;
            },
            19 => {
                cmd = cmd.*.next;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            21 => {
                viewport = &rendererData.*.currentViewport;
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf(cmd.*.data.viewport.rect))) != @as(c_int, 0)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                _ = memcpy(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)));
                rendererData.*.viewportDirty = @"true" != 0;
                rendererData.*.cliprectDirty = @"true" != 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            25 => {
                rect = &cmd.*.data.cliprect.rect;
                if (@as(c_int, @intFromBool(rendererData.*.currentCliprectEnabled)) != @as(c_int, @intFromBool(cmd.*.data.cliprect.enabled))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                rendererData.*.currentCliprectEnabled = cmd.*.data.cliprect.enabled;
                rendererData.*.cliprectDirty = @"true" != 0;
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
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(&rendererData.*.currentCliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*))) != @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                _ = memcpy(@ptrCast(@alignCast(&rendererData.*.currentCliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
                rendererData.*.cliprectDirty = @"true" != 0;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            32 => {
                color = cmd.*.data.color.color;
                if ((renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                SDL_ConvertToLinear(renderer, &color);
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                color.r *= cmd.*.data.color.color_scale;
                color.g *= cmd.*.data.color.color_scale;
                color.b *= cmd.*.data.color.color_scale;
                if (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                color.r = SDL_PQfromNits(color.r * SCRGB_NITS);
                color.g = SDL_PQfromNits(color.g * SCRGB_NITS);
                color.b = SDL_PQfromNits(color.b * SCRGB_NITS);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                clearColor.float32[@as(c_int, 0)] = color.r;
                clearColor.float32[@as(c_int, 1)] = color.g;
                clearColor.float32[@as(c_int, 2)] = color.b;
                clearColor.float32[@as(c_int, 3)] = color.a;
                _ = VULKAN_ActivateCommandBuffer(renderer, VK_ATTACHMENT_LOAD_OP_CLEAR, &clearColor, &stateCache);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            39 => {
                count = cmd.*.data.draw.count;
                first = cmd.*.data.draw.first;
                start = first / @sizeOf(VULKAN_VertexPositionColor);
                verts = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + first));
                have_point_draw_state = @"false" != 0;
                line_start = 0;
                line_end = (line_start +% count) -% @as(usize, 1);
                if ((verts[line_start].pos[@as(c_int, 0)] != verts[line_end].pos[@as(c_int, 0)]) or (verts[line_start].pos[@as(c_int, 1)] != verts[line_end].pos[@as(c_int, 1)])) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                if (VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, 0, null, 0, null, null, &stateCache)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (count > @as(usize, 2)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            43 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, start +% line_end, 1);
                have_point_draw_state = @"true" != 0;
                {
                    sdl_pc = 45;
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
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                if (VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_LINE_STRIP, 0, null, 0, null, null, &stateCache)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                finalcmd = cmd;
                thiscolorscale = cmd.*.data.draw.color_scale;
                thisblend = cmd.*.data.draw.blend;
                nextcmd = cmd.*.next;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            49 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_LINE_STRIP, start, count);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                if (nextcmd != null) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            53 => {
                nextcmdtype = nextcmd.*.command;
                if (nextcmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            54 => {
                nextcmd = nextcmd.*.next;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                if (VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_LINE_LIST, 0, null, 0, null, null, &stateCache)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            56 => {
                if (nextcmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                if (nextcmd.*.data.draw.count != @as(usize, 2)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            63 => {
                if ((nextcmd.*.data.draw.blend != thisblend) or (nextcmd.*.data.draw.color_scale != thiscolorscale)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            66 => {
                finalcmd = nextcmd;
                line_start = count;
                line_end = (line_start +% nextcmd.*.data.draw.count) -% @as(usize, 1);
                if ((verts[line_start].pos[@as(c_int, 0)] != verts[line_end].pos[@as(c_int, 0)]) or (verts[line_start].pos[@as(c_int, 1)] != verts[line_end].pos[@as(c_int, 1)])) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            68 => {
                if (!have_point_draw_state) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                count +%= nextcmd.*.data.draw.count;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            71 => {
                have_point_draw_state = VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, 0, null, 0, null, null, &stateCache);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if (have_point_draw_state) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, start +% line_end, 1);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            77 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_LINE_LIST, start, count);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                cmd = finalcmd;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                thiscolorscale_1 = cmd.*.data.draw.color_scale;
                thistexture = cmd.*.data.draw.texture;
                thisblend_2 = cmd.*.data.draw.blend;
                thisscalemode = cmd.*.data.draw.texture_scale_mode;
                thisaddressmode_u = cmd.*.data.draw.texture_address_mode_u;
                thisaddressmode_v = cmd.*.data.draw.texture_address_mode_v;
                thiscmdtype = cmd.*.command;
                finalcmd_3 = cmd;
                count_5 = cmd.*.data.draw.count;
                first_6 = cmd.*.data.draw.first;
                start_7 = first_6 / @sizeOf(VULKAN_VertexPositionColor);
                nextcmd_4 = cmd.*.next;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (nextcmd_4 != null) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                nextcmdtype_8 = nextcmd_4.*.command;
                if (nextcmdtype_8 != thiscmdtype) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            87 => {
                nextcmd_4 = nextcmd_4.*.next;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            88 => {
                if (thiscmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            89 => {
                if (nextcmdtype_8 == @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                if ((((((nextcmd_4.*.data.draw.texture != thistexture) or (nextcmd_4.*.data.draw.texture_scale_mode != thisscalemode)) or (nextcmd_4.*.data.draw.texture_address_mode_u != thisaddressmode_u)) or (nextcmd_4.*.data.draw.texture_address_mode_v != thisaddressmode_v)) or (nextcmd_4.*.data.draw.blend != thisblend_2)) or (nextcmd_4.*.data.draw.color_scale != thiscolorscale_1)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            96 => {
                finalcmd_3 = nextcmd_4;
                count_5 +%= nextcmd_4.*.data.draw.count;
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            98 => {
                if (thistexture != null) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                if (VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, 0, null, 0, null, null, &stateCache)) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            100 => {
                cmd = finalcmd_3;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            101 => {
                setState = VULKAN_SetCopyState(renderer, cmd, null, &stateCache);
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                setState = VULKAN_SetDrawState(renderer, cmd, rendererData.*.pipelineLayout, rendererData.*.descriptorSetLayout, null, VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, 0, null, 0, null, null, &stateCache);
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                if (setState) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST, start_7, count_5);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            107 => {
                VULKAN_DrawPrimitives(renderer, VK_PRIMITIVE_TOPOLOGY_POINT_LIST, start_7, count_5);
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var backBuffer: VkImage = undefined;
    _ = &backBuffer;
    var imageLayout: [*c]VkImageLayout = undefined;
    _ = &imageLayout;
    var readbackBuffer: VULKAN_Buffer = undefined;
    _ = &readbackBuffer;
    var pixelSize: VkDeviceSize = undefined;
    _ = &pixelSize;
    var length: VkDeviceSize = undefined;
    _ = &length;
    var readbackBufferSize: VkDeviceSize = undefined;
    _ = &readbackBufferSize;
    var vkFormat: VkFormat = undefined;
    _ = &vkFormat;
    var output: [*c]SDL_Surface = undefined;
    _ = &output;
    VULKAN_EnsureCommandBuffer(rendererData);
    if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentRenderPass))) != @as(?*anyopaque, null)) {
        vkCmdEndRenderPass.?(rendererData.*.currentCommandBuffer);
        rendererData.*.currentRenderPass = null;
    }
    if (rendererData.*.textureRenderTarget != null) {
        backBuffer = rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].image;
        imageLayout = &rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].imageLayout;
        vkFormat = rendererData.*.textureRenderTarget.*.images[@as(c_int, 0)].format;
    } else {
        backBuffer = rendererData.*.swapchainImages[rendererData.*.currentSwapchainImageIndex];
        imageLayout = &rendererData.*.swapchainImageLayouts[rendererData.*.currentSwapchainImageIndex];
        vkFormat = rendererData.*.surfaceFormat.format;
    }
    pixelSize = VULKAN_GetBytesPerPixel(vkFormat, 0);
    length = @as(VkDeviceSize, @bitCast(@as(c_long, rect.*.w))) *% pixelSize;
    readbackBufferSize = length *% @as(VkDeviceSize, @bitCast(@as(c_long, rect.*.h)));
    if (VULKAN_AllocateBuffer(rendererData, readbackBufferSize, VK_BUFFER_USAGE_TRANSFER_DST_BIT, @bitCast(@as(c_int, VK_MEMORY_PROPERTY_HOST_COHERENT_BIT | VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT)), VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT, &readbackBuffer) != VK_SUCCESS) {
        return null;
    }
    VULKAN_RecordPipelineImageBarrier(rendererData, @bitCast(@as(c_int, (((VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_TRANSFER_READ_BIT) | VK_ACCESS_TRANSFER_WRITE_BIT)), VK_ACCESS_TRANSFER_READ_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT) | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT)), VK_PIPELINE_STAGE_TRANSFER_BIT, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, backBuffer, imageLayout);
    var region: VkBufferImageCopy = undefined;
    _ = &region;
    region.bufferOffset = 0;
    region.bufferRowLength = 0;
    region.bufferImageHeight = 0;
    region.imageSubresource.baseArrayLayer = 0;
    region.imageSubresource.layerCount = 1;
    region.imageSubresource.mipLevel = 0;
    region.imageSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    region.imageOffset.x = rect.*.x;
    region.imageOffset.y = rect.*.y;
    region.imageOffset.z = 0;
    region.imageExtent.width = @bitCast(@as(c_int, rect.*.w));
    region.imageExtent.height = @bitCast(@as(c_int, rect.*.h));
    region.imageExtent.depth = 1;
    vkCmdCopyImageToBuffer.?(rendererData.*.currentCommandBuffer, backBuffer, imageLayout.*, readbackBuffer.buffer, 1, &region);
    _ = VULKAN_IssueBatch(rendererData);
    VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_TRANSFER_WRITE_BIT, @bitCast(@as(c_int, (((VK_ACCESS_SHADER_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT) | VK_ACCESS_COLOR_ATTACHMENT_READ_BIT) | VK_ACCESS_TRANSFER_READ_BIT) | VK_ACCESS_TRANSFER_WRITE_BIT)), VK_PIPELINE_STAGE_TRANSFER_BIT, @bitCast(@as(c_int, (VK_PIPELINE_STAGE_TRANSFER_BIT | VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT) | VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT)), VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL, backBuffer, imageLayout);
    output = SDL_DuplicatePixels(rect.*.w, rect.*.h, VULKAN_VkFormatToSDLPixelFormat(vkFormat), renderer.*.current_colorspace, readbackBuffer.mappedBufferPtr, @bitCast(@as(c_uint, @truncate(length))));
    VULKAN_DestroyBuffer(rendererData, &readbackBuffer);
    return output;
}
pub fn VULKAN_AddVulkanRenderSemaphores(renderer: [*c]SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    if (wait_semaphore != 0) {
        if (rendererData.*.waitRenderSemaphoreCount == rendererData.*.waitRenderSemaphoreMax) {
            var waitDestStageMasks: [*c]VkPipelineStageFlags = undefined;
            waitDestStageMasks = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.waitDestStageMasks)), @as(c_ulong, rendererData.*.waitRenderSemaphoreMax +% @as(u32, 2)) *% @sizeOf(@TypeOf(waitDestStageMasks.*)))));
            _ = &waitDestStageMasks;
            if (!(waitDestStageMasks != null)) {
                return @"false" != 0;
            }
            rendererData.*.waitDestStageMasks = waitDestStageMasks;
            var semaphores: [*c]VkSemaphore = undefined;
            semaphores = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.waitRenderSemaphores)), @as(c_ulong, rendererData.*.waitRenderSemaphoreMax +% @as(u32, 2)) *% @sizeOf(@TypeOf(semaphores.*)))));
            _ = &semaphores;
            if (!(semaphores != null)) {
                return @"false" != 0;
            }
            rendererData.*.waitRenderSemaphores = semaphores;
            rendererData.*.waitRenderSemaphoreMax +%= 1;
        }
        rendererData.*.waitDestStageMasks[rendererData.*.waitRenderSemaphoreCount] = wait_stage_mask;
        rendererData.*.waitRenderSemaphores[rendererData.*.waitRenderSemaphoreCount] = @ptrFromInt(@as(usize, @intCast(wait_semaphore)));
        rendererData.*.waitRenderSemaphoreCount +%= 1;
    }
    if (signal_semaphore != 0) {
        if (rendererData.*.signalRenderSemaphoreCount == rendererData.*.signalRenderSemaphoreMax) {
            var semaphores: [*c]VkSemaphore = undefined;
            semaphores = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(rendererData.*.signalRenderSemaphores)), @as(c_ulong, rendererData.*.signalRenderSemaphoreMax +% @as(u32, 2)) *% @sizeOf(@TypeOf(semaphores.*)))));
            _ = &semaphores;
            if (!(semaphores != null)) {
                return @"false" != 0;
            }
            rendererData.*.signalRenderSemaphores = semaphores;
            rendererData.*.signalRenderSemaphoreMax +%= 1;
        }
        rendererData.*.signalRenderSemaphores[rendererData.*.signalRenderSemaphoreCount] = @ptrFromInt(@as(usize, @intCast(signal_semaphore)));
        rendererData.*.signalRenderSemaphoreCount +%= 1;
    }
    return @"true" != 0;
}
pub fn VULKAN_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &rendererData;
    var result: VkResult = VK_SUCCESS;
    _ = &result;
    if (!(rendererData.*.device != null)) {
        return SDL_SetError_REAL("Device lost and couldn't be recovered");
    }
    if (rendererData.*.currentCommandBuffer != null) {
        rendererData.*.currentPipelineState = null;
        rendererData.*.viewportDirty = @"true" != 0;
        VULKAN_RecordPipelineImageBarrier(rendererData, VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT, @bitCast(@as(c_int, VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT)), VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT, VK_IMAGE_LAYOUT_PRESENT_SRC_KHR, rendererData.*.swapchainImages[rendererData.*.currentSwapchainImageIndex], &rendererData.*.swapchainImageLayouts[rendererData.*.currentSwapchainImageIndex]);
        _ = vkEndCommandBuffer.?(rendererData.*.currentCommandBuffer);
        result = vkResetFences.?(rendererData.*.device, 1, &rendererData.*.fences[rendererData.*.currentCommandBufferIndex]);
        if (result != VK_SUCCESS) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetFences()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkResetFences()"))), SDL_Vulkan_GetResultString(result));
            return @"false" != 0;
        }
        var waitDestStageMask: VkPipelineStageFlags = VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
        _ = &waitDestStageMask;
        var submitInfo: VkSubmitInfo = VkSubmitInfo{
            .sType = 0,
            .pNext = null,
            .waitSemaphoreCount = 0,
            .pWaitSemaphores = null,
            .pWaitDstStageMask = null,
            .commandBufferCount = 0,
            .pCommandBuffers = null,
            .signalSemaphoreCount = 0,
            .pSignalSemaphores = null,
        };
        _ = &submitInfo;
        submitInfo.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
        if (rendererData.*.waitRenderSemaphoreCount > @as(u32, 0)) {
            var additionalSemaphoreCount: Uint32 = @bitCast(@as(c_int, if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentImageAvailableSemaphore))) != @as(?*anyopaque, null)) @as(c_int, 1) else @as(c_int, 0)));
            _ = &additionalSemaphoreCount;
            submitInfo.waitSemaphoreCount = rendererData.*.waitRenderSemaphoreCount +% additionalSemaphoreCount;
            if (additionalSemaphoreCount > @as(Uint32, 0)) {
                rendererData.*.waitRenderSemaphores[rendererData.*.waitRenderSemaphoreCount] = rendererData.*.currentImageAvailableSemaphore;
                rendererData.*.waitDestStageMasks[rendererData.*.waitRenderSemaphoreCount] = VK_PIPELINE_STAGE_ALL_COMMANDS_BIT;
            }
            submitInfo.pWaitSemaphores = rendererData.*.waitRenderSemaphores;
            submitInfo.pWaitDstStageMask = rendererData.*.waitDestStageMasks;
            rendererData.*.waitRenderSemaphoreCount = 0;
        } else if (@as(?*anyopaque, @ptrCast(@alignCast(rendererData.*.currentImageAvailableSemaphore))) != @as(?*anyopaque, null)) {
            submitInfo.waitSemaphoreCount = 1;
            submitInfo.pWaitSemaphores = &rendererData.*.currentImageAvailableSemaphore;
            submitInfo.pWaitDstStageMask = &waitDestStageMask;
        }
        submitInfo.commandBufferCount = 1;
        submitInfo.pCommandBuffers = &rendererData.*.currentCommandBuffer;
        if (rendererData.*.signalRenderSemaphoreCount > @as(u32, 0)) {
            submitInfo.signalSemaphoreCount = rendererData.*.signalRenderSemaphoreCount +% @as(u32, 1);
            rendererData.*.signalRenderSemaphores[rendererData.*.signalRenderSemaphoreCount] = rendererData.*.renderingFinishedSemaphores[rendererData.*.currentCommandBufferIndex];
            submitInfo.pSignalSemaphores = rendererData.*.signalRenderSemaphores;
            rendererData.*.signalRenderSemaphoreCount = 0;
        } else {
            submitInfo.signalSemaphoreCount = 1;
            submitInfo.pSignalSemaphores = &rendererData.*.renderingFinishedSemaphores[rendererData.*.currentCommandBufferIndex];
        }
        result = vkQueueSubmit.?(rendererData.*.graphicsQueue, 1, &submitInfo, rendererData.*.fences[rendererData.*.currentCommandBufferIndex]);
        if (result != VK_SUCCESS) {
            if (result == VK_ERROR_DEVICE_LOST) {
                if (VULKAN_HandleDeviceLost(renderer)) {
                    _ = SDL_SetError_REAL("Present failed, device lost");
                } else {}
            } else {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueueSubmit()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueueSubmit()"))), SDL_Vulkan_GetResultString(result));
            }
            return @"false" != 0;
        }
        rendererData.*.currentCommandBuffer = null;
        rendererData.*.currentImageAvailableSemaphore = null;
        var presentInfo: VkPresentInfoKHR = VkPresentInfoKHR{
            .sType = 0,
            .pNext = null,
            .waitSemaphoreCount = 0,
            .pWaitSemaphores = null,
            .swapchainCount = 0,
            .pSwapchains = null,
            .pImageIndices = null,
            .pResults = null,
        };
        _ = &presentInfo;
        presentInfo.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
        presentInfo.waitSemaphoreCount = 1;
        presentInfo.pWaitSemaphores = &rendererData.*.renderingFinishedSemaphores[rendererData.*.currentCommandBufferIndex];
        presentInfo.swapchainCount = 1;
        presentInfo.pSwapchains = &rendererData.*.swapchain;
        presentInfo.pImageIndices = &rendererData.*.currentSwapchainImageIndex;
        result = vkQueuePresentKHR.?(rendererData.*.presentQueue, &presentInfo);
        if ((((result != VK_SUCCESS) and (result != VK_ERROR_OUT_OF_DATE_KHR)) and (result != VK_ERROR_SURFACE_LOST_KHR)) and (result != VK_SUBOPTIMAL_KHR)) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueuePresentKHR()"))), SDL_Vulkan_GetResultString(result));
                __builtin.debugtrap();
            }
            _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkQueuePresentKHR()"))), SDL_Vulkan_GetResultString(result));
            return @"false" != 0;
        }
        rendererData.*.currentCommandBufferIndex = (rendererData.*.currentCommandBufferIndex +% @as(u32, 1)) % rendererData.*.swapchainImageCount;
        result = vkWaitForFences.?(rendererData.*.device, 1, &rendererData.*.fences[rendererData.*.currentCommandBufferIndex], VK_TRUE, @as(c_ulong, 18446744073709551615));
        if (result != VK_SUCCESS) {
            if (result == VK_ERROR_DEVICE_LOST) {
                if (VULKAN_HandleDeviceLost(renderer)) {
                    _ = SDL_SetError_REAL("Present failed, device lost");
                } else {}
            } else {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_VULKAN_DEBUG", @"false" != 0)) {
                    SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkWaitForFences()"))), SDL_Vulkan_GetResultString(result));
                    __builtin.debugtrap();
                }
                _ = SDL_SetError_REAL("%s: %s", @as([*c]u8, @as([*c]u8, @constCast("vkWaitForFences()"))), SDL_Vulkan_GetResultString(result));
            }
            return @"false" != 0;
        }
        _ = VULKAN_AcquireNextSwapchainImage(renderer);
    }
    return @"true" != 0;
}
pub fn VULKAN_SetVSync(renderer: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &vsync;
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                rendererData = @ptrCast(@alignCast(renderer.*.internal));
                switch (vsync) {
                    -@as(c_int, 1) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 0) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                if (vsync != rendererData.*.vsync) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            6 => {
                rendererData.*.vsync = vsync;
                rendererData.*.recreateSwapchain = @"true" != 0;
                {
                    sdl_pc = 8;
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
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn VULKAN_TextureFormatSupported(physicalDevice: VkPhysicalDevice, format: VkFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var properties: VkImageFormatProperties = undefined;
    _ = &properties;
    if (vkGetPhysicalDeviceImageFormatProperties.?(physicalDevice, format, VK_IMAGE_TYPE_2D, VK_IMAGE_TILING_OPTIMAL, @bitCast(@as(c_int, VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT)), 0, &properties) == VK_SUCCESS) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn VULKAN_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rendererData: [*c]VULKAN_RenderData = undefined;
    _ = &rendererData;
    var flags: SDL_WindowFlags = SDL_GetWindowFlags_REAL(window);
    _ = &flags;
    if ((flags & @as(c_ulong, 2)) != 0) {
        flags &= ~@as(c_ulong, 2);
        _ = SDL_ReconfigureWindow(window, flags);
    }
    SDL_SetupRendererColorspace(renderer, create_props);
    if (((renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB)) and (renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR))) and (renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))) {
        return SDL_SetError_REAL("Unsupported output colorspace");
    }
    rendererData = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(rendererData.*)))));
    if (!(rendererData != null)) {
        return @"false" != 0;
    }
    rendererData.*.identity = MatrixIdentity();
    rendererData.*.identitySwizzle.r = VK_COMPONENT_SWIZZLE_IDENTITY;
    rendererData.*.identitySwizzle.g = VK_COMPONENT_SWIZZLE_IDENTITY;
    rendererData.*.identitySwizzle.b = VK_COMPONENT_SWIZZLE_IDENTITY;
    rendererData.*.identitySwizzle.a = VK_COMPONENT_SWIZZLE_IDENTITY;
    rendererData.*.create_props = SDL_CreateProperties_REAL();
    if (!SDL_CopyProperties_REAL(create_props, rendererData.*.create_props)) {
        SDL_free_REAL(@ptrCast(@alignCast(rendererData)));
        return @"false" != 0;
    }
    renderer.*.WindowEvent = VULKAN_WindowEvent;
    renderer.*.SupportsBlendMode = VULKAN_SupportsBlendMode;
    renderer.*.CreatePalette = VULKAN_CreatePalette;
    renderer.*.UpdatePalette = VULKAN_UpdatePalette;
    renderer.*.DestroyPalette = VULKAN_DestroyPalette;
    renderer.*.CreateTexture = VULKAN_CreateTexture;
    renderer.*.UpdateTexture = VULKAN_UpdateTexture;
    renderer.*.UpdateTextureYUV = VULKAN_UpdateTextureYUV;
    renderer.*.UpdateTextureNV = VULKAN_UpdateTextureNV;
    renderer.*.LockTexture = VULKAN_LockTexture;
    renderer.*.UnlockTexture = VULKAN_UnlockTexture;
    renderer.*.SetRenderTarget = VULKAN_SetRenderTarget;
    renderer.*.QueueSetViewport = VULKAN_QueueNoOp;
    renderer.*.QueueSetDrawColor = VULKAN_QueueNoOp;
    renderer.*.QueueDrawPoints = VULKAN_QueueDrawPoints;
    renderer.*.QueueDrawLines = VULKAN_QueueDrawPoints;
    renderer.*.QueueGeometry = VULKAN_QueueGeometry;
    renderer.*.InvalidateCachedState = VULKAN_InvalidateCachedState;
    renderer.*.RunCommandQueue = VULKAN_RunCommandQueue;
    renderer.*.RenderReadPixels = VULKAN_RenderReadPixels;
    renderer.*.AddVulkanRenderSemaphores = VULKAN_AddVulkanRenderSemaphores;
    renderer.*.RenderPresent = VULKAN_RenderPresent;
    renderer.*.DestroyTexture = VULKAN_DestroyTexture;
    renderer.*.DestroyRenderer = VULKAN_DestroyRenderer;
    renderer.*.SetVSync = VULKAN_SetVSync;
    renderer.*.internal = @ptrCast(@alignCast(rendererData));
    VULKAN_InvalidateCachedState(renderer);
    renderer.*.name = VULKAN_RenderDriver.name;
    _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", 16384);
    renderer.*.window = window;
    if (VULKAN_CreateDeviceResources(renderer, create_props) != VK_SUCCESS) {
        return @"false" != 0;
    }
    if (VULKAN_CreateWindowSizeDependentResources(renderer) != VK_SUCCESS) {
        return @"false" != 0;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(vk_format_map)) / @sizeOf(@TypeOf(vk_format_map[@as(c_int, 0)])))) : (i += 1) {
            if (!VULKAN_TextureFormatSupported(rendererData.*.physicalDevice, vk_format_map[@bitCast(@as(isize, @intCast(i)))].unorm)) {
                continue;
            }
            if (!VULKAN_TextureFormatSupported(rendererData.*.physicalDevice, vk_format_map[@bitCast(@as(isize, @intCast(i)))].srgb)) {
                continue;
            }
            _ = SDL_AddSupportedTextureFormat(renderer, vk_format_map[@bitCast(@as(isize, @intCast(i)))].sdl);
        }
    }
    if (VULKAN_TextureFormatSupported(rendererData.*.physicalDevice, VULKAN_GetVkImageFormat(SDL_PIXELFORMAT_INDEX8, renderer.*.output_colorspace)) and VULKAN_TextureFormatSupported(rendererData.*.physicalDevice, VULKAN_GetVkImageFormat(SDL_PIXELFORMAT_RGBA32, renderer.*.output_colorspace))) {
        _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_INDEX8);
    }
    const static_local_yuvFormats = struct {
        const yuvFormats: [8]SDL_PixelFormat = [8]SDL_PixelFormat{
            SDL_PIXELFORMAT_YV12,
            SDL_PIXELFORMAT_IYUV,
            SDL_PIXELFORMAT_I444,
            SDL_PIXELFORMAT_NV12,
            SDL_PIXELFORMAT_NV21,
            SDL_PIXELFORMAT_P010,
            SDL_PIXELFORMAT_I0FL,
            SDL_PIXELFORMAT_I4FL,
        };
    };
    _ = &static_local_yuvFormats;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_yuvFormats.yuvFormats)) / @sizeOf(@TypeOf(static_local_yuvFormats.yuvFormats[@as(c_int, 0)])))) : (i += 1) {
            var format: VkFormat = VULKAN_GetVkImageFormat(static_local_yuvFormats.yuvFormats[@bitCast(@as(isize, @intCast(i)))], renderer.*.output_colorspace);
            _ = &format;
            if (VULKAN_TextureFormatSupported(rendererData.*.physicalDevice, format)) {
                _ = SDL_AddSupportedTextureFormat(renderer, static_local_yuvFormats.yuvFormats[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
    }
    if (rendererData.*.supportsANDROIDExternalMemoryAndroidHardwareBuffer) {
        _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_EXTERNAL_OES);
    }
    return @"true" != 0;
}
pub export var VULKAN_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = VULKAN_CreateRenderer,
    .name = "vulkan",
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_VULKAN_FRAME_QUEUE_DEPTH = @as(c_int, 2);
pub const SDL_VULKAN_NUM_VERTEX_BUFFERS = @as(c_int, 256);
pub const SDL_VULKAN_VERTEX_BUFFER_DEFAULT_SIZE = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const SDL_VULKAN_CONSTANT_BUFFER_DEFAULT_SIZE = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const SDL_VULKAN_NUM_UPLOAD_BUFFERS = @as(c_int, 32);
pub const SDL_VULKAN_MAX_DESCRIPTOR_SETS = @as(c_int, 4096);
pub const SDL_VULKAN_NUM_TEXTURE_BINDINGS = @as(c_int, 3);
pub const VK_FALSE = @as(c_uint, 0);
pub const VK_TRUE = @as(c_uint, 1);
pub const SCRGB_NITS = @as(f32, 80.0);
pub const YCBCR_EXTENSION_OFFSET = @as(c_int, 1);
pub const YCBCR_EXTENSION_COUNT = @as(c_int, 5);
pub const ANDROID_EXTENSION_COUNT = @as(c_int, 0);
