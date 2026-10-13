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
pub extern fn y1(f64) f64;
pub const Uint8 = u8;
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
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_atan2f_REAL(y: f32, x: f32) f32;
pub extern fn SDL_cosf_REAL(x: f32) f32;
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
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
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
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX32: c_int = 370546692;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
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
pub extern fn SDL_GetPixelFormatName_REAL(format: SDL_PixelFormat) [*c]const u8;
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
pub const SDL_FLIP_VERTICAL: c_int = 2;
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
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_FlipSurface_REAL(surface: [*c]SDL_Surface, flip: SDL_FlipMode) bool;
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
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
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
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
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
pub const struct_SDL_GLContextState = opaque {
};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_GL_CONTEXT_MAJOR_VERSION: c_int = 17;
pub const SDL_GL_CONTEXT_MINOR_VERSION: c_int = 18;
pub const SDL_GL_CONTEXT_FLAGS: c_int = 19;
pub const SDL_GL_CONTEXT_PROFILE_MASK: c_int = 20;
pub const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE: c_int = 22;
pub const enum_SDL_GLAttr = c_uint;
pub const SDL_GLAttr = enum_SDL_GLAttr;
pub extern fn SDL_GetWindowFlags_REAL(window: [*c]SDL_Window) SDL_WindowFlags;
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_SyncWindow_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_GL_GetProcAddress_REAL(proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_GL_ExtensionSupported_REAL(extension: [*c]const u8) bool;
pub extern fn SDL_GL_SetAttribute_REAL(attr: SDL_GLAttr, value: c_int) bool;
pub extern fn SDL_GL_GetAttribute_REAL(attr: SDL_GLAttr, value: [*c]c_int) bool;
pub extern fn SDL_GL_CreateContext_REAL(window: [*c]SDL_Window) SDL_GLContext;
pub extern fn SDL_GL_MakeCurrent_REAL(window: [*c]SDL_Window, context: SDL_GLContext) bool;
pub extern fn SDL_GL_GetCurrentContext_REAL() SDL_GLContext;
pub extern fn SDL_GL_SetSwapInterval_REAL(interval: c_int) bool;
pub extern fn SDL_GL_GetSwapInterval_REAL(interval: [*c]c_int) bool;
pub extern fn SDL_GL_SwapWindow_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_GL_DestroyContext_REAL(context: SDL_GLContext) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetRenderOutputSize_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetTextureProperties_REAL(texture: [*c]SDL_Texture) SDL_PropertiesID;
pub extern fn SDL_powerof2(x: c_int) c_int;
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
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_RecreateWindow(window: [*c]SDL_Window, flags: SDL_WindowFlags) bool;
pub extern fn SDL_ReconfigureWindow(window: [*c]SDL_Window, flags: SDL_WindowFlags) bool;
pub const GLenum = c_uint;
pub const GLbitfield = c_uint;
pub const GLvoid = anyopaque;
pub const GLint = c_int;
pub const GLubyte = u8;
pub const GLuint = c_uint;
pub const GLsizei = c_int;
pub const GLfloat = f32;
pub const GLclampf = f32;
pub const GLdouble = f64;
pub extern fn glClearColor(red: GLclampf, green: GLclampf, blue: GLclampf, alpha: GLclampf) void;
pub extern fn glClear(mask: GLbitfield) void;
pub extern fn glPointSize(size: GLfloat) void;
pub extern fn glLineWidth(width: GLfloat) void;
pub extern fn glScissor(x: GLint, y: GLint, width: GLsizei, height: GLsizei) void;
pub extern fn glReadBuffer(mode: GLenum) void;
pub extern fn glEnable(cap: GLenum) void;
pub extern fn glDisable(cap: GLenum) void;
pub extern fn glEnableClientState(cap: GLenum) void;
pub extern fn glDisableClientState(cap: GLenum) void;
pub extern fn glGetFloatv(pname: GLenum, params: [*c]GLfloat) void;
pub extern fn glGetIntegerv(pname: GLenum, params: [*c]GLint) void;
pub extern fn glGetError() GLenum;
pub extern fn glGetString(name: GLenum) [*c]const GLubyte;
pub extern fn glDepthFunc(func: GLenum) void;
pub extern fn glMatrixMode(mode: GLenum) void;
pub extern fn glOrtho(left: GLdouble, right: GLdouble, bottom: GLdouble, top: GLdouble, near_val: GLdouble, far_val: GLdouble) void;
pub extern fn glViewport(x: GLint, y: GLint, width: GLsizei, height: GLsizei) void;
pub extern fn glLoadIdentity() void;
pub extern fn glRotatef(angle: GLfloat, x: GLfloat, y: GLfloat, z: GLfloat) void;
pub extern fn glBegin(mode: GLenum) void;
pub extern fn glEnd() void;
pub extern fn glVertex2f(x: GLfloat, y: GLfloat) void;
pub extern fn glVertex3fv(v: [*c]const GLfloat) void;
pub extern fn glColor4f(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat) void;
pub extern fn glColor4ub(red: GLubyte, green: GLubyte, blue: GLubyte, alpha: GLubyte) void;
pub extern fn glColor3fv(v: [*c]const GLfloat) void;
pub extern fn glTexCoord2f(s: GLfloat, t: GLfloat) void;
pub extern fn glRasterPos2i(x: GLint, y: GLint) void;
pub extern fn glRectf(x1: GLfloat, y1: GLfloat, x2: GLfloat, y2: GLfloat) void;
pub extern fn glVertexPointer(size: GLint, @"type": GLenum, stride: GLsizei, ptr: ?*const GLvoid) void;
pub extern fn glColorPointer(size: GLint, @"type": GLenum, stride: GLsizei, ptr: ?*const GLvoid) void;
pub extern fn glTexCoordPointer(size: GLint, @"type": GLenum, stride: GLsizei, ptr: ?*const GLvoid) void;
pub extern fn glGetPointerv(pname: GLenum, params: [*c]?*GLvoid) void;
pub extern fn glDrawArrays(mode: GLenum, first: GLint, count: GLsizei) void;
pub extern fn glShadeModel(mode: GLenum) void;
pub extern fn glPixelStorei(pname: GLenum, param: GLint) void;
pub extern fn glReadPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*GLvoid) void;
pub extern fn glDrawPixels(width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) void;
pub extern fn glTexEnvf(target: GLenum, pname: GLenum, param: GLfloat) void;
pub extern fn glTexParameteri(target: GLenum, pname: GLenum, param: GLint) void;
pub extern fn glTexImage2D(target: GLenum, level: GLint, internalFormat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) void;
pub extern fn glGenTextures(n: GLsizei, textures: [*c]GLuint) void;
pub extern fn glDeleteTextures(n: GLsizei, textures: [*c]const GLuint) void;
pub extern fn glBindTexture(target: GLenum, texture: GLuint) void;
pub extern fn glTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) void;
pub extern fn glBlendEquation(mode: GLenum) void;
pub extern fn glActiveTextureARB(texture: GLenum) void;
pub const PFNGLACTIVETEXTUREARBPROC = ?*const fn (texture: GLenum) callconv(.c) void;
pub const GLchar = u8;
pub const GLDEBUGPROCARB = ?*const fn (source: GLenum, @"type": GLenum, id: GLuint, severity: GLenum, length: GLsizei, message: [*c]const GLchar, userParam: ?*const anyopaque) callconv(.c) void;
pub const PFNGLDEBUGMESSAGECALLBACKARBPROC = ?*const fn (callback: GLDEBUGPROCARB, userParam: ?*const anyopaque) callconv(.c) void;
pub const PFNGLBINDFRAMEBUFFEREXTPROC = ?*const fn (target: GLenum, framebuffer: GLuint) callconv(.c) void;
pub const PFNGLDELETEFRAMEBUFFERSEXTPROC = ?*const fn (n: GLsizei, framebuffers: [*c]const GLuint) callconv(.c) void;
pub const PFNGLGENFRAMEBUFFERSEXTPROC = ?*const fn (n: GLsizei, framebuffers: [*c]GLuint) callconv(.c) void;
pub const PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC = ?*const fn (target: GLenum) callconv(.c) GLenum;
pub const PFNGLFRAMEBUFFERTEXTURE2DEXTPROC = ?*const fn (target: GLenum, attachment: GLenum, textarget: GLenum, texture: GLuint, level: GLint) callconv(.c) void;
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
pub extern fn SDL_GetBlendModeSrcColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeColorOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub extern fn SDL_GetBlendModeSrcAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeAlphaOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub extern fn SDL_AllocateRenderVertices(renderer: [*c]SDL_Renderer, numbytes: usize, alignment: usize, offset: [*c]usize) ?*anyopaque;
pub const SHADER_INVALID: c_int = -1;
pub const SHADER_SOLID: c_int = 1;
pub const SHADER_PALETTE_NEAREST: c_int = 2;
pub const SHADER_PALETTE_LINEAR: c_int = 3;
pub const SHADER_PALETTE_PIXELART: c_int = 4;
pub const SHADER_RGB: c_int = 5;
pub const SHADER_RGB_PIXELART: c_int = 6;
pub const SHADER_RGBA: c_int = 7;
pub const SHADER_RGBA_PIXELART: c_int = 8;
pub const SHADER_YUV: c_int = 9;
pub const SHADER_NV12_RA: c_int = 10;
pub const SHADER_NV12_RG: c_int = 11;
pub const SHADER_NV21_RA: c_int = 12;
pub const SHADER_NV21_RG: c_int = 13;
pub const GL_Shader = c_int;
pub const struct_GL_ShaderContext = opaque {
};
pub const GL_ShaderContext = struct_GL_ShaderContext;
pub extern fn GL_CreateShaderContext() ?*GL_ShaderContext;
pub extern fn GL_SupportsShader(ctx: ?*GL_ShaderContext, shader: GL_Shader) bool;
pub extern fn GL_SelectShader(ctx: ?*GL_ShaderContext, shader: GL_Shader, shader_params: [*c]const f32) void;
pub extern fn GL_DestroyShaderContext(ctx: ?*GL_ShaderContext) void;
pub extern fn SDL_GetYCbCRtoRGBConversionMatrix(colorspace: SDL_Colorspace, w: c_int, h: c_int, bits_per_pixel: c_int) [*c]const f32;
pub const GL_FBOList = struct_GL_FBOList;
pub const struct_GL_FBOList = extern struct {
    w: Uint32 = 0,
    h: Uint32 = 0,
    FBO: GLuint = 0,
    next: [*c]GL_FBOList = null,
};
pub const GL_DrawStateCache = extern struct {
    viewport_dirty: bool = false,
    viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    texture: [*c]SDL_Texture = null,
    target: [*c]SDL_Texture = null,
    drawablew: c_int = 0,
    drawableh: c_int = 0,
    blend: SDL_BlendMode = 0,
    shader: GL_Shader = @import("std").mem.zeroes(GL_Shader),
    texel_size: [4]f32 = @import("std").mem.zeroes([4]f32),
    shader_params: [*c]const f32 = null,
    cliprect_enabled_dirty: bool = false,
    cliprect_enabled: bool = false,
    cliprect_dirty: bool = false,
    cliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    texturing: bool = false,
    texturing_dirty: bool = false,
    vertex_array: bool = false,
    color_array: bool = false,
    texture_array: bool = false,
    color_dirty: bool = false,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    clear_color_dirty: bool = false,
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
pub const GL_RenderData = extern struct {
    context: SDL_GLContext = null,
    debug_enabled: bool = false,
    GL_ARB_debug_output_supported: bool = false,
    pixelart_supported: bool = false,
    errors: c_int = 0,
    error_messages: [*c][*c]u8 = null,
    next_error_callback: GLDEBUGPROCARB = null,
    next_error_userparam: ?*GLvoid = null,
    textype: GLenum = 0,
    GL_ARB_texture_non_power_of_two_supported: bool = false,
    GL_ARB_texture_rectangle_supported: bool = false,
    GL_EXT_framebuffer_object_supported: bool = false,
    framebuffers: [*c]GL_FBOList = null,
    glBegin: ?*const fn (GLenum) callconv(.c) void = null,
    glBindTexture: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glBlendEquation: ?*const fn (GLenum) callconv(.c) void = null,
    glBlendFuncSeparate: ?*const fn (GLenum, GLenum, GLenum, GLenum) callconv(.c) void = null,
    glClear: ?*const fn (GLbitfield) callconv(.c) void = null,
    glClearColor: ?*const fn (GLclampf, GLclampf, GLclampf, GLclampf) callconv(.c) void = null,
    glColor3fv: ?*const fn ([*c]const GLfloat) callconv(.c) void = null,
    glColor4f: ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glColor4ub: ?*const fn (red: GLubyte, green: GLubyte, blue: GLubyte, alpha: GLubyte) callconv(.c) void = null,
    glColorPointer: ?*const fn (size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const GLvoid) callconv(.c) void = null,
    glDeleteTextures: ?*const fn (n: GLsizei, textures: [*c]const GLuint) callconv(.c) void = null,
    glDepthFunc: ?*const fn (func: GLenum) callconv(.c) void = null,
    glDisable: ?*const fn (cap: GLenum) callconv(.c) void = null,
    glDisableClientState: ?*const fn (array: GLenum) callconv(.c) void = null,
    glDrawArrays: ?*const fn (mode: GLenum, first: GLint, count: GLsizei) callconv(.c) void = null,
    glDrawPixels: ?*const fn (width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) callconv(.c) void = null,
    glEnable: ?*const fn (cap: GLenum) callconv(.c) void = null,
    glEnableClientState: ?*const fn (array: GLenum) callconv(.c) void = null,
    glEnd: ?*const fn () callconv(.c) void = null,
    glGenTextures: ?*const fn (n: GLsizei, textures: [*c]GLuint) callconv(.c) void = null,
    glGetError: ?*const fn () callconv(.c) GLenum = null,
    glGetFloatv: ?*const fn (pname: GLenum, params: [*c]GLfloat) callconv(.c) void = null,
    glGetIntegerv: ?*const fn (pname: GLenum, params: [*c]GLint) callconv(.c) void = null,
    glGetPointerv: ?*const fn (pname: GLenum, params: [*c]?*GLvoid) callconv(.c) void = null,
    glGetString: ?*const fn (name: GLenum) callconv(.c) [*c]const GLubyte = null,
    glLineWidth: ?*const fn (width: GLfloat) callconv(.c) void = null,
    glLoadIdentity: ?*const fn () callconv(.c) void = null,
    glMatrixMode: ?*const fn (mode: GLenum) callconv(.c) void = null,
    glOrtho: ?*const fn (left: GLdouble, right: GLdouble, bottom: GLdouble, top: GLdouble, zNear: GLdouble, zFar: GLdouble) callconv(.c) void = null,
    glPixelStorei: ?*const fn (pname: GLenum, param: GLint) callconv(.c) void = null,
    glPointSize: ?*const fn (size: GLfloat) callconv(.c) void = null,
    glRasterPos2i: ?*const fn (x: GLint, y: GLint) callconv(.c) void = null,
    glReadBuffer: ?*const fn (mode: GLenum) callconv(.c) void = null,
    glReadPixels: ?*const fn (x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*GLvoid) callconv(.c) void = null,
    glRectf: ?*const fn (x1: GLfloat, y1: GLfloat, x2: GLfloat, y2: GLfloat) callconv(.c) void = null,
    glRotatef: ?*const fn (angle: GLfloat, x: GLfloat, y: GLfloat, z: GLfloat) callconv(.c) void = null,
    glScissor: ?*const fn (x: GLint, y: GLint, width: GLsizei, height: GLsizei) callconv(.c) void = null,
    glShadeModel: ?*const fn (mode: GLenum) callconv(.c) void = null,
    glTexCoord2f: ?*const fn (s: GLfloat, t: GLfloat) callconv(.c) void = null,
    glTexCoordPointer: ?*const fn (size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const GLvoid) callconv(.c) void = null,
    glTexEnvf: ?*const fn (target: GLenum, pname: GLenum, param: GLfloat) callconv(.c) void = null,
    glTexImage2D: ?*const fn (target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) callconv(.c) void = null,
    glTexParameteri: ?*const fn (target: GLenum, pname: GLenum, param: GLint) callconv(.c) void = null,
    glTexSubImage2D: ?*const fn (target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const GLvoid) callconv(.c) void = null,
    glVertex2f: ?*const fn (x: GLfloat, y: GLfloat) callconv(.c) void = null,
    glVertex3fv: ?*const fn (v: [*c]const GLfloat) callconv(.c) void = null,
    glVertexPointer: ?*const fn (size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const GLvoid) callconv(.c) void = null,
    glViewport: ?*const fn (x: GLint, y: GLint, width: GLsizei, height: GLsizei) callconv(.c) void = null,
    GL_ARB_multitexture_supported: bool = false,
    glActiveTextureARB: PFNGLACTIVETEXTUREARBPROC = null,
    num_texture_units: GLint = 0,
    glGenFramebuffersEXT: PFNGLGENFRAMEBUFFERSEXTPROC = null,
    glDeleteFramebuffersEXT: PFNGLDELETEFRAMEBUFFERSEXTPROC = null,
    glFramebufferTexture2DEXT: PFNGLFRAMEBUFFERTEXTURE2DEXTPROC = null,
    glBindFramebufferEXT: PFNGLBINDFRAMEBUFFEREXTPROC = null,
    glCheckFramebufferStatusEXT: PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC = null,
    shaders: ?*GL_ShaderContext = null,
    drawstate: GL_DrawStateCache = @import("std").mem.zeroes(GL_DrawStateCache),
};
pub const GL_PaletteData = extern struct {
    texture: GLuint = 0,
};
pub const GL_TextureData = extern struct {
    texture: GLuint = 0,
    texture_external: bool = false,
    texw: GLfloat = 0,
    texh: GLfloat = 0,
    format: GLenum = 0,
    formattype: GLenum = 0,
    shader: GL_Shader = @import("std").mem.zeroes(GL_Shader),
    texel_size: [4]f32 = @import("std").mem.zeroes([4]f32),
    shader_params: [*c]const f32 = null,
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    locked_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    yuv: bool = false,
    nv12: bool = false,
    utexture: GLuint = 0,
    utexture_external: bool = false,
    vtexture: GLuint = 0,
    vtexture_external: bool = false,
    texture_scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    fbo: [*c]GL_FBOList = null,
};
pub fn GL_TranslateError(arg_error: GLenum) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var @"error" = arg_error;
    _ = &@"error";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"error") {
                    @as(GLenum, GL_INVALID_ENUM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(GLenum, GL_INVALID_VALUE) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GLenum, GL_INVALID_OPERATION) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(GLenum, GL_OUT_OF_MEMORY) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(GLenum, GL_NO_ERROR) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(GLenum, GL_STACK_OVERFLOW) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(GLenum, GL_STACK_UNDERFLOW) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(GLenum, GL_TABLE_TOO_LARGE) => {
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
                return "GL_INVALID_ENUM";
            },
            3 => {
                return "GL_INVALID_VALUE";
            },
            4 => {
                return "GL_INVALID_OPERATION";
            },
            5 => {
                return "GL_OUT_OF_MEMORY";
            },
            6 => {
                return "GL_NO_ERROR";
            },
            7 => {
                return "GL_STACK_OVERFLOW";
            },
            8 => {
                return "GL_STACK_UNDERFLOW";
            },
            9 => {
                return "GL_TABLE_TOO_LARGE";
            },
            10 => {
                return "UNKNOWN";
            },
            else => unreachable,
        }
    }
}
pub fn GL_ClearErrors(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (!data.*.debug_enabled) {
        return;
    }
    if (data.*.GL_ARB_debug_output_supported) {
        if (data.*.errors != 0) {
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < data.*.errors) : (i += 1) {
                    SDL_free_REAL(@ptrCast(@alignCast(data.*.error_messages[@bitCast(@as(isize, @intCast(i)))])));
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(data.*.error_messages)));
            data.*.errors = 0;
            data.*.error_messages = null;
        }
    } else if (data.*.glGetError != null) {
        while (data.*.glGetError.?() != @as(GLenum, GL_NO_ERROR)) {}
    }
}
pub fn GL_CheckAllErrors(arg_prefix: [*c]const u8, renderer: [*c]SDL_Renderer, file: [*c]const u8, line: c_int, function: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prefix = arg_prefix;
    _ = &prefix;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var result: bool = @"true" != 0;
    _ = &result;
    if (!data.*.debug_enabled) {
        return @"true" != 0;
    }
    if (data.*.GL_ARB_debug_output_supported) {
        if (data.*.errors != 0) {
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < data.*.errors) : (i += 1) {
                    _ = SDL_SetError_REAL("%s: %s (%d): %s %s", prefix, file, line, function, data.*.error_messages[@bitCast(@as(isize, @intCast(i)))]);
                    result = @"false" != 0;
                }
            }
            GL_ClearErrors(renderer);
        }
    } else {
        while (true) {
            var @"error": GLenum = data.*.glGetError.?();
            _ = &@"error";
            if (@"error" != @as(GLenum, GL_NO_ERROR)) {
                if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(prefix)))) == @as(?*anyopaque, null)) or (@as(c_int, prefix[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
                    prefix = "generic";
                }
                _ = SDL_SetError_REAL("%s: %s (%d): %s %s (0x%X)", prefix, file, line, function, GL_TranslateError(@"error"), @"error");
                result = @"false" != 0;
            } else {
                break;
            }
        }
    }
    return result;
}
pub fn GL_LoadFunctions(data: [*c]GL_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    while (true) {
        data.*.glBegin = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBegin"))));
        if (!(data.*.glBegin != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBegin"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindTexture = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindTexture"))));
        if (!(data.*.glBindTexture != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindTexture"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendEquation = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendEquation"))));
        if (!(data.*.glBlendEquation != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBlendEquation"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendFuncSeparate = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendFuncSeparate"))));
        if (!(data.*.glBlendFuncSeparate != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBlendFuncSeparate"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glClear = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClear"))));
        if (!(data.*.glClear != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClear"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glClearColor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClearColor"))));
        if (!(data.*.glClearColor != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClearColor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColor3fv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColor3fv"))));
        if (!(data.*.glColor3fv != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColor3fv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColor4f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColor4f"))));
        if (!(data.*.glColor4f != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColor4f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColor4ub = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColor4ub"))));
        if (!(data.*.glColor4ub != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColor4ub"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColorPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColorPointer"))));
        if (!(data.*.glColorPointer != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColorPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteTextures"))));
        if (!(data.*.glDeleteTextures != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDepthFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDepthFunc"))));
        if (!(data.*.glDepthFunc != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDepthFunc"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisable"))));
        if (!(data.*.glDisable != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisableClientState = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisableClientState"))));
        if (!(data.*.glDisableClientState != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisableClientState"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDrawArrays = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDrawArrays"))));
        if (!(data.*.glDrawArrays != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDrawArrays"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDrawPixels = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDrawPixels"))));
        if (!(data.*.glDrawPixels != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDrawPixels"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnable"))));
        if (!(data.*.glEnable != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnableClientState = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnableClientState"))));
        if (!(data.*.glEnableClientState != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnableClientState"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnd = SDL_GL_GetProcAddress_REAL("glEnd");
        if (!(data.*.glEnd != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnd"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGenTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenTextures"))));
        if (!(data.*.glGenTextures != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGenTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetError = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetError"))));
        if (!(data.*.glGetError != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetError"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetFloatv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetFloatv"))));
        if (!(data.*.glGetFloatv != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetFloatv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetIntegerv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
        if (!(data.*.glGetIntegerv != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetIntegerv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetPointerv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetPointerv"))));
        if (!(data.*.glGetPointerv != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetPointerv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetString = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetString"))));
        if (!(data.*.glGetString != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetString"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glLineWidth = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glLineWidth"))));
        if (!(data.*.glLineWidth != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glLineWidth"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glLoadIdentity = SDL_GL_GetProcAddress_REAL("glLoadIdentity");
        if (!(data.*.glLoadIdentity != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glLoadIdentity"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glMatrixMode = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glMatrixMode"))));
        if (!(data.*.glMatrixMode != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glMatrixMode"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glOrtho = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glOrtho"))));
        if (!(data.*.glOrtho != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glOrtho"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glPixelStorei = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glPixelStorei"))));
        if (!(data.*.glPixelStorei != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glPixelStorei"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glPointSize = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glPointSize"))));
        if (!(data.*.glPointSize != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glPointSize"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glRasterPos2i = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glRasterPos2i"))));
        if (!(data.*.glRasterPos2i != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glRasterPos2i"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glReadBuffer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glReadBuffer"))));
        if (!(data.*.glReadBuffer != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glReadBuffer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glReadPixels = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glReadPixels"))));
        if (!(data.*.glReadPixels != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glReadPixels"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glRectf = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glRectf"))));
        if (!(data.*.glRectf != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glRectf"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glRotatef = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glRotatef"))));
        if (!(data.*.glRotatef != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glRotatef"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glScissor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glScissor"))));
        if (!(data.*.glScissor != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glScissor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glShadeModel = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glShadeModel"))));
        if (!(data.*.glShadeModel != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glShadeModel"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexCoord2f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexCoord2f"))));
        if (!(data.*.glTexCoord2f != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexCoord2f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexCoordPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexCoordPointer"))));
        if (!(data.*.glTexCoordPointer != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexCoordPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexEnvf = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexEnvf"))));
        if (!(data.*.glTexEnvf != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexEnvf"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexImage2D"))));
        if (!(data.*.glTexImage2D != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexParameteri = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexParameteri"))));
        if (!(data.*.glTexParameteri != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexParameteri"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexSubImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexSubImage2D"))));
        if (!(data.*.glTexSubImage2D != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexSubImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glVertex2f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glVertex2f"))));
        if (!(data.*.glVertex2f != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glVertex2f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glVertex3fv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glVertex3fv"))));
        if (!(data.*.glVertex3fv != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glVertex3fv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glVertexPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glVertexPointer"))));
        if (!(data.*.glVertexPointer != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glVertexPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glViewport = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glViewport"))));
        if (!(data.*.glViewport != null)) {
            result = SDL_SetError_REAL("Couldn't load GL function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glViewport"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    return result;
}
pub fn GL_ActivateRenderer(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (SDL_GL_GetCurrentContext_REAL() != data.*.context) {
        if (!SDL_GL_MakeCurrent_REAL(renderer.*.window, data.*.context)) {
            return @"false" != 0;
        }
    }
    GL_ClearErrors(renderer);
    return @"true" != 0;
}
pub fn GL_HandleDebugMessage(source: GLenum, arg_type: GLenum, id: GLuint, severity: GLenum, length: GLsizei, message: [*c]const u8, userParam: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var renderer: [*c]SDL_Renderer = @ptrCast(@alignCast(@constCast(userParam)));
    _ = &renderer;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (@"type" == @as(GLenum, GL_DEBUG_TYPE_ERROR_ARB)) {
        var errors: c_int = data.*.errors + @as(c_int, 1);
        _ = &errors;
        var error_messages: [*c][*c]u8 = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(data.*.error_messages)), @as(c_ulong, @bitCast(@as(c_long, errors))) *% @sizeOf(@TypeOf(data.*.error_messages.*)))));
        _ = &error_messages;
        if (error_messages != null) {
            data.*.errors = errors;
            data.*.error_messages = error_messages;
            data.*.error_messages[@bitCast(@as(isize, @intCast(data.*.errors - @as(c_int, 1))))] = SDL_strdup_REAL(message);
        }
    }
    if (data.*.next_error_callback != null) {
        data.*.next_error_callback.?(source, @"type", id, severity, length, message, data.*.next_error_userparam);
    } else {
        if (@"type" == @as(GLenum, GL_DEBUG_TYPE_ERROR_ARB)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "%s", message);
        } else {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "%s", message);
        }
    }
}
pub fn GL_GetFBO(data: [*c]GL_RenderData, w: Uint32, h: Uint32) callconv(.c) [*c]GL_FBOList {
    @setEvalBranchQuota(100000);
    var result: [*c]GL_FBOList = data.*.framebuffers;
    _ = &result;
    while ((result != null) and ((result.*.w != w) or (result.*.h != h))) {
        result = result.*.next;
    }
    if (!(result != null)) {
        result = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(GL_FBOList))));
        if (result != null) {
            result.*.w = w;
            result.*.h = h;
            data.*.glGenFramebuffersEXT.?(1, &result.*.FBO);
            result.*.next = data.*.framebuffers;
            data.*.framebuffers = result;
        }
    }
    return result;
}
pub fn GL_WindowEvent(renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_RESIZED)) or (event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_MOVED))) {
        var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
        _ = &data;
        data.*.drawstate.viewport_dirty = @"true" != 0;
    }
}
pub fn GetBlendFunc(factor: SDL_BlendFactor) callconv(.c) GLenum {
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
                return GL_ZERO;
            },
            3 => {
                return GL_ONE;
            },
            4 => {
                return GL_SRC_COLOR;
            },
            5 => {
                return GL_ONE_MINUS_SRC_COLOR;
            },
            6 => {
                return GL_SRC_ALPHA;
            },
            7 => {
                return GL_ONE_MINUS_SRC_ALPHA;
            },
            8 => {
                return GL_DST_COLOR;
            },
            9 => {
                return GL_ONE_MINUS_DST_COLOR;
            },
            10 => {
                return GL_DST_ALPHA;
            },
            11 => {
                return GL_ONE_MINUS_DST_ALPHA;
            },
            12 => {
                return GL_INVALID_ENUM;
            },
            else => unreachable,
        }
    }
}
pub fn GetBlendEquation(operation: SDL_BlendOperation) callconv(.c) GLenum {
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
                return GL_FUNC_ADD;
            },
            3 => {
                return GL_FUNC_SUBTRACT;
            },
            4 => {
                return GL_FUNC_REVERSE_SUBTRACT;
            },
            5 => {
                return GL_MIN;
            },
            6 => {
                return GL_MAX;
            },
            7 => {
                return GL_INVALID_ENUM;
            },
            else => unreachable,
        }
    }
}
pub fn GL_SupportsBlendMode(_: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
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
    if ((((((GetBlendFunc(srcColorFactor) == @as(GLenum, GL_INVALID_ENUM)) or (GetBlendFunc(srcAlphaFactor) == @as(GLenum, GL_INVALID_ENUM))) or (GetBlendEquation(colorOperation) == @as(GLenum, GL_INVALID_ENUM))) or (GetBlendFunc(dstColorFactor) == @as(GLenum, GL_INVALID_ENUM))) or (GetBlendFunc(dstAlphaFactor) == @as(GLenum, GL_INVALID_ENUM))) or (GetBlendEquation(alphaOperation) == @as(GLenum, GL_INVALID_ENUM))) {
        return @"false" != 0;
    }
    if (colorOperation != alphaOperation) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn convert_format(pixel_format: Uint32, internalFormat: [*c]GLint, format: [*c]GLenum, arg_type: [*c]GLenum) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (pixel_format) {
                    @as(Uint32, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(Uint32, SDL_PIXELFORMAT_NV21) => {
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
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                internalFormat.* = GL_RGBA8;
                format.* = GL_BGRA;
                @"type".* = GL_UNSIGNED_BYTE;
                {
                    sdl_pc = 1;
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
                internalFormat.* = GL_RGBA8;
                format.* = GL_RGBA;
                @"type".* = GL_UNSIGNED_BYTE;
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 10;
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
                internalFormat.* = GL_LUMINANCE;
                format.* = GL_LUMINANCE;
                @"type".* = GL_UNSIGNED_BYTE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn SetTextureScaleMode(data: [*c]GL_RenderData, textype: GLenum, format: SDL_PixelFormat, scaleMode: SDL_ScaleMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (scaleMode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
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
                return @"true" != 0;
            },
            2 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                if (!data.*.pixelart_supported) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
                {
                    sdl_pc = 1;
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
                if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                return SDL_SetError_REAL("Unknown texture scale mode: %d", scaleMode);
            },
            else => unreachable,
        }
    }
}
pub fn TranslateAddressMode(addressMode: SDL_TextureAddressMode) callconv(.c) GLint {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "TranslateAddressMode".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unknown texture address mode\"",
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
                switch (addressMode) {
                    SDL_TEXTURE_ADDRESS_CLAMP => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_TEXTURE_ADDRESS_WRAP => {
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
                return GL_CLAMP_TO_EDGE;
            },
            3 => {
                return GL_REPEAT;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                return GL_CLAMP_TO_EDGE;
            },
            8 => {
                if (!!(@intFromPtr("Unknown texture address mode") != 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gl.c", 494);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 16;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SetTextureAddressMode(data: [*c]GL_RenderData, textype: GLenum, addressModeU: SDL_TextureAddressMode, addressModeV: SDL_TextureAddressMode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_S, TranslateAddressMode(addressModeU));
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_T, TranslateAddressMode(addressModeV));
}
pub fn GL_CreatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "GL_CreatePalette".*;
    };
    _ = &static_local___func__;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GL_PaletteData = undefined;
    palettedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(palettedata.*)))));
    _ = &palettedata;
    if (!(palettedata != null)) {
        return @"false" != 0;
    }
    palette.*.internal = @ptrCast(@alignCast(palettedata));
    data.*.drawstate.texture = null;
    const textype: GLenum = data.*.textype;
    _ = &textype;
    data.*.glGenTextures.?(1, &palettedata.*.texture);
    data.*.glBindTexture.?(textype, palettedata.*.texture);
    data.*.glTexImage2D.?(textype, 0, GL_RGBA8, 256, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
    if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gl.c", 520, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        return @"false" != 0;
    }
    _ = SetTextureScaleMode(data, textype, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST);
    SetTextureAddressMode(data, textype, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
    return @"true" != 0;
}
pub fn GL_UpdatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "GL_UpdatePalette".*;
    };
    _ = &static_local___func__;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GL_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    _ = GL_ActivateRenderer(renderer);
    data.*.drawstate.texture = null;
    const textype: GLenum = data.*.textype;
    _ = &textype;
    data.*.glBindTexture.?(textype, palettedata.*.texture);
    data.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
    data.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, ncolors);
    data.*.glTexSubImage2D.?(textype, 0, 0, 0, ncolors, 1, GL_RGBA, GL_UNSIGNED_BYTE, @ptrCast(@alignCast(colors)));
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gl.c", 543, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GL_DestroyPalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GL_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    if (palettedata != null) {
        data.*.glDeleteTextures.?(1, &palettedata.*.texture);
        SDL_free_REAL(@ptrCast(@alignCast(palettedata)));
    }
}
pub fn GL_CreateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "GL_CreateTexture".*;
    };
    _ = &static_local___func__;
    var renderdata: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    const textype: GLenum = renderdata.*.textype;
    _ = &textype;
    var data: [*c]GL_TextureData = undefined;
    _ = &data;
    var internalFormat: GLint = undefined;
    _ = &internalFormat;
    var format: GLenum = undefined;
    _ = &format;
    var @"type": GLenum = undefined;
    _ = &@"type";
    var texture_w: c_int = undefined;
    _ = &texture_w;
    var texture_h: c_int = undefined;
    _ = &texture_h;
    _ = GL_ActivateRenderer(renderer);
    renderdata.*.drawstate.texture = null;
    renderdata.*.drawstate.texturing_dirty = @"true" != 0;
    if ((texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) and !renderdata.*.GL_EXT_framebuffer_object_supported) {
        return SDL_SetError_REAL("Render targets not supported by OpenGL");
    }
    if (!convert_format(texture.*.format, &internalFormat, &format, &@"type")) {
        return SDL_SetError_REAL("Texture format %s not supported by OpenGL", SDL_GetPixelFormatName_REAL(texture.*.format));
    }
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    if (!(data != null)) {
        return @"false" != 0;
    }
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        var size: usize = undefined;
        _ = &size;
        data.*.pitch = texture.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
        size = @as(usize, @bitCast(@as(c_long, texture.*.h))) *% @as(usize, @bitCast(@as(c_long, data.*.pitch)));
        if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) {
            size +%= @bitCast(@as(c_long, (@as(c_int, 2) * @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(data.*.pitch + @as(c_int, 1), @as(c_int, 2))));
        }
        if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
            size +%= @bitCast(@as(c_long, (@as(c_int, 2) * texture.*.h) * data.*.pitch));
        }
        if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
            size +%= @bitCast(@as(c_long, (@as(c_int, 2) * @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(data.*.pitch + @as(c_int, 1), @as(c_int, 2))));
        }
        data.*.pixels = SDL_calloc_REAL(1, size);
        if (!(data.*.pixels != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(data)));
            return @"false" != 0;
        }
    }
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
        data.*.fbo = GL_GetFBO(renderdata, @bitCast(@as(c_int, texture.*.w)), @bitCast(@as(c_int, texture.*.h)));
    } else {
        data.*.fbo = null;
    }
    data.*.texture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture", 0))));
    if (data.*.texture != 0) {
        data.*.texture_external = @"true" != 0;
    } else {
        _ = GL_CheckAllErrors("", renderer, "SDL_render_gl.c", 621, @ptrCast(@alignCast(&static_local___func__.__func__)));
        renderdata.*.glGenTextures.?(1, &data.*.texture);
        if (!GL_CheckAllErrors("glGenTextures()", renderer, "SDL_render_gl.c", 623, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
            SDL_free_REAL(data.*.pixels);
            SDL_free_REAL(@ptrCast(@alignCast(data)));
            return @"false" != 0;
        }
    }
    texture.*.internal = @ptrCast(@alignCast(data));
    if (renderdata.*.GL_ARB_texture_non_power_of_two_supported) {
        texture_w = texture.*.w;
        texture_h = texture.*.h;
        data.*.texw = 1.0;
        data.*.texh = 1.0;
    } else if (renderdata.*.GL_ARB_texture_rectangle_supported) {
        texture_w = texture.*.w;
        texture_h = texture.*.h;
        data.*.texw = @floatFromInt(texture_w);
        data.*.texh = @floatFromInt(texture_h);
    } else {
        texture_w = SDL_powerof2(texture.*.w);
        texture_h = SDL_powerof2(texture.*.h);
        data.*.texw = @as(GLfloat, @floatFromInt(texture.*.w)) / @as(GLfloat, @floatFromInt(texture_w));
        data.*.texh = @as(GLfloat, @floatFromInt(texture.*.h)) / @as(GLfloat, @floatFromInt(texture_h));
    }
    var props: SDL_PropertiesID = SDL_GetTextureProperties_REAL(texture);
    _ = &props;
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture", data.*.texture);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.target", textype);
    _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.opengl.tex_w", data.*.texw);
    _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.opengl.tex_h", data.*.texh);
    data.*.format = format;
    data.*.formattype = @"type";
    data.*.texture_scale_mode = texture.*.scaleMode;
    data.*.texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
    data.*.texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
    renderdata.*.glEnable.?(textype);
    renderdata.*.glBindTexture.?(textype, data.*.texture);
    {
        renderdata.*.glTexImage2D.?(textype, 0, internalFormat, texture_w, texture_h, 0, format, @"type", null);
    }
    if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gl.c", 691, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        return @"false" != 0;
    }
    _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
    SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
    if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) {
        data.*.yuv = @"true" != 0;
        data.*.utexture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture_u", 0))));
        if (data.*.utexture != 0) {
            data.*.utexture_external = @"true" != 0;
        } else {
            renderdata.*.glGenTextures.?(1, &data.*.utexture);
        }
        data.*.vtexture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture_v", 0))));
        if (data.*.vtexture != 0) {
            data.*.vtexture_external = @"true" != 0;
        } else {
            renderdata.*.glGenTextures.?(1, &data.*.vtexture);
        }
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexImage2D.?(textype, 0, internalFormat, @divTrunc(texture_w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(texture_h + @as(c_int, 1), @as(c_int, 2)), 0, format, @"type", null);
        _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
        SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture_u", data.*.utexture);
        renderdata.*.glBindTexture.?(textype, data.*.vtexture);
        renderdata.*.glTexImage2D.?(textype, 0, internalFormat, @divTrunc(texture_w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(texture_h + @as(c_int, 1), @as(c_int, 2)), 0, format, @"type", null);
        _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
        SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture_v", data.*.vtexture);
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
        data.*.yuv = @"true" != 0;
        data.*.utexture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture_u", 0))));
        if (data.*.utexture != 0) {
            data.*.utexture_external = @"true" != 0;
        } else {
            renderdata.*.glGenTextures.?(1, &data.*.utexture);
        }
        data.*.vtexture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture_v", 0))));
        if (data.*.vtexture != 0) {
            data.*.vtexture_external = @"true" != 0;
        } else {
            renderdata.*.glGenTextures.?(1, &data.*.vtexture);
        }
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexImage2D.?(textype, 0, internalFormat, texture_w, texture_h, 0, format, @"type", null);
        _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
        SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture_u", data.*.utexture);
        renderdata.*.glBindTexture.?(textype, data.*.vtexture);
        renderdata.*.glTexImage2D.?(textype, 0, internalFormat, texture_w, texture_h, 0, format, @"type", null);
        _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
        SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture_v", data.*.vtexture);
    }
    if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
        data.*.nv12 = @"true" != 0;
        data.*.utexture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengl.texture_uv", 0))));
        if (data.*.utexture != 0) {
            data.*.utexture_external = @"true" != 0;
        } else {
            renderdata.*.glGenTextures.?(1, &data.*.utexture);
        }
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexImage2D.?(textype, 0, GL_LUMINANCE_ALPHA, @divTrunc(texture_w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(texture_h + @as(c_int, 1), @as(c_int, 2)), 0, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, null);
        _ = SetTextureScaleMode(renderdata, textype, texture.*.format, data.*.texture_scale_mode);
        SetTextureAddressMode(renderdata, textype, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
        _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.opengl.texture_uv", data.*.utexture);
    }
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
        data.*.shader = SHADER_PALETTE_NEAREST;
    } else if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32))) {
        data.*.shader = SHADER_RGBA;
    } else {
        data.*.shader = SHADER_RGB;
    }
    data.*.texel_size[@as(c_int, 0)] = @as(f32, 1.0) / @as(f32, @floatFromInt(texture.*.w));
    data.*.texel_size[@as(c_int, 1)] = @as(f32, 1.0) / @as(f32, @floatFromInt(texture.*.h));
    data.*.texel_size[@as(c_int, 2)] = @floatFromInt(texture.*.w);
    data.*.texel_size[@as(c_int, 3)] = @floatFromInt(texture.*.h);
    if (data.*.yuv or data.*.nv12) {
        if (data.*.yuv) {
            data.*.shader = SHADER_YUV;
        } else if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_OPENGL_NV12_RG_SHADER", @"false" != 0)) {
                data.*.shader = SHADER_NV12_RG;
            } else {
                data.*.shader = SHADER_NV12_RA;
            }
        } else {
            if (SDL_GetHintBoolean_REAL("SDL_RENDER_OPENGL_NV12_RG_SHADER", @"false" != 0)) {
                data.*.shader = SHADER_NV21_RG;
            } else {
                data.*.shader = SHADER_NV21_RA;
            }
        }
        data.*.shader_params = SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, 8);
        if (!(data.*.shader_params != null)) {
            return SDL_SetError_REAL("Unsupported YUV colorspace");
        }
    }
    renderdata.*.glDisable.?(textype);
    return GL_CheckAllErrors("", renderer, "SDL_render_gl.c", 813, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GL_UpdateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, arg_pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "GL_UpdateTexture".*;
    };
    _ = &static_local___func__;
    var renderdata: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    const textype: GLenum = renderdata.*.textype;
    _ = &textype;
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    const texturebpp: c_int = if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &texturebpp;
    while (true) {
        while (!(texturebpp != @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "texturebpp != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gl.c", 824);
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
    _ = GL_ActivateRenderer(renderer);
    renderdata.*.drawstate.texture = null;
    renderdata.*.glBindTexture.?(textype, data.*.texture);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, @divTrunc(pitch, texturebpp));
    renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, pixels);
    if (data.*.yuv) {
        if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            renderdata.*.glBindTexture.?(textype, data.*.utexture);
            renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, pixels);
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            renderdata.*.glBindTexture.?(textype, data.*.vtexture);
            renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, pixels);
        } else {
            renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2)));
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                renderdata.*.glBindTexture.?(textype, data.*.vtexture);
            } else {
                renderdata.*.glBindTexture.?(textype, data.*.utexture);
            }
            renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), data.*.format, data.*.formattype, pixels);
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2))))))));
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                renderdata.*.glBindTexture.?(textype, data.*.utexture);
            } else {
                renderdata.*.glBindTexture.?(textype, data.*.vtexture);
            }
            renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), data.*.format, data.*.formattype, pixels);
        }
    }
    if (data.*.nv12) {
        renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2)));
        pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, pixels);
    }
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gl.c", 886, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GL_UpdateTextureYUV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GL_UpdateTextureYUV".*;
    };
    _ = &static_local___func__;
    var renderdata: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    const textype: GLenum = renderdata.*.textype;
    _ = &textype;
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    _ = GL_ActivateRenderer(renderer);
    renderdata.*.drawstate.texture = null;
    renderdata.*.glBindTexture.?(textype, data.*.texture);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Ypitch);
    renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, @ptrCast(@alignCast(Yplane)));
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
        renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Upitch);
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, @ptrCast(@alignCast(Uplane)));
        renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Vpitch);
        renderdata.*.glBindTexture.?(textype, data.*.vtexture);
        renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, @ptrCast(@alignCast(Vplane)));
    } else {
        renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Upitch);
        renderdata.*.glBindTexture.?(textype, data.*.utexture);
        renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), data.*.format, data.*.formattype, @ptrCast(@alignCast(Uplane)));
        renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Vpitch);
        renderdata.*.glBindTexture.?(textype, data.*.vtexture);
        renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), data.*.format, data.*.formattype, @ptrCast(@alignCast(Vplane)));
    }
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gl.c", 934, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GL_UpdateTextureNV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "GL_UpdateTextureNV".*;
    };
    _ = &static_local___func__;
    var renderdata: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    const textype: GLenum = renderdata.*.textype;
    _ = &textype;
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    _ = GL_ActivateRenderer(renderer);
    renderdata.*.drawstate.texture = null;
    renderdata.*.glBindTexture.?(textype, data.*.texture);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, Ypitch);
    renderdata.*.glTexSubImage2D.?(textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, @ptrCast(@alignCast(Yplane)));
    renderdata.*.glPixelStorei.?(GL_UNPACK_ROW_LENGTH, @divTrunc(UVpitch, @as(c_int, 2)));
    renderdata.*.glBindTexture.?(textype, data.*.utexture);
    renderdata.*.glTexSubImage2D.?(textype, 0, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, @ptrCast(@alignCast(UVplane)));
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gl.c", 963, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GL_LockTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    data.*.locked_rect = rect.*;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    pitch.* = data.*.pitch;
    return @"true" != 0;
}
pub fn GL_UnlockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var pixels: ?*anyopaque = undefined;
    _ = &pixels;
    rect = &data.*.locked_rect;
    pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    _ = GL_UpdateTexture(renderer, texture, rect, pixels, data.*.pitch);
}
pub fn GL_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var texturedata: [*c]GL_TextureData = undefined;
    _ = &texturedata;
    var status: GLenum = undefined;
    _ = &status;
    _ = GL_ActivateRenderer(renderer);
    if (!data.*.GL_EXT_framebuffer_object_supported) {
        return SDL_SetError_REAL("Render targets not supported by OpenGL");
    }
    data.*.drawstate.viewport_dirty = @"true" != 0;
    if (!(texture != null)) {
        data.*.glBindFramebufferEXT.?(GL_FRAMEBUFFER_EXT, 0);
        return @"true" != 0;
    }
    texturedata = @ptrCast(@alignCast(texture.*.internal));
    data.*.glBindFramebufferEXT.?(GL_FRAMEBUFFER_EXT, texturedata.*.fbo.*.FBO);
    data.*.glFramebufferTexture2DEXT.?(GL_FRAMEBUFFER_EXT, GL_COLOR_ATTACHMENT0_EXT, data.*.textype, texturedata.*.texture, 0);
    status = data.*.glCheckFramebufferStatusEXT.?(GL_FRAMEBUFFER_EXT);
    if (status != @as(GLenum, GL_FRAMEBUFFER_COMPLETE_EXT)) {
        return SDL_SetError_REAL("glFramebufferTexture2DEXT() failed");
    }
    return @"true" != 0;
}
pub fn GL_QueueNoOp(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GL_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var verts: [*c]GLfloat = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count * @as(c_int, 2)))) *% @sizeOf(GLfloat), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var i: c_int = undefined;
    _ = &i;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    {
        i = 0;
        while (i < count) : (i += 1) {
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = @as(f32, 0.5) + points[@bitCast(@as(isize, @intCast(i)))].x;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = @as(f32, 0.5) + points[@bitCast(@as(isize, @intCast(i)))].y;
        }
    }
    return @"true" != 0;
}
pub fn GL_QueueDrawLines(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var prevx: GLfloat = undefined;
    _ = &prevx;
    var prevy: GLfloat = undefined;
    _ = &prevy;
    const vertlen: usize = (@sizeOf(GLfloat) *% @as(c_ulong, 2)) *% @as(c_ulong, @bitCast(@as(c_long, count)));
    _ = &vertlen;
    var verts: [*c]GLfloat = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, vertlen, 0, &cmd.*.data.draw.first)));
    _ = &verts;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    prevx = @as(f32, 0.5) + points.*.x;
    prevy = @as(f32, 0.5) + points.*.y;
    (blk: {
        const ref = &verts;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = prevx;
    (blk: {
        const ref = &verts;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = prevy;
    {
        i = 1;
        while (i < count) : (i += 1) {
            const xstart: GLfloat = prevx;
            _ = &xstart;
            const ystart: GLfloat = prevy;
            _ = &ystart;
            const xend: GLfloat = points[@bitCast(@as(isize, @intCast(i)))].x + @as(f32, 0.5);
            _ = &xend;
            const yend: GLfloat = points[@bitCast(@as(isize, @intCast(i)))].y + @as(f32, 0.5);
            _ = &yend;
            const deltax: GLfloat = xend - xstart;
            _ = &deltax;
            const deltay: GLfloat = yend - ystart;
            _ = &deltay;
            const angle: GLfloat = SDL_atan2f_REAL(deltay, deltax);
            _ = &angle;
            prevx = xend + (SDL_cosf_REAL(angle) * @as(f32, 0.25));
            prevy = yend + (SDL_sinf_REAL(angle) * @as(f32, 0.25));
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = prevx;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = prevy;
        }
    }
    return @"true" != 0;
}
pub fn GL_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var texturedata: [*c]GL_TextureData = null;
    _ = &texturedata;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    var verts: [*c]GLfloat = undefined;
    _ = &verts;
    var sz: usize = ((@as(c_ulong, 2) *% @sizeOf(GLfloat)) +% (@as(c_ulong, 4) *% @sizeOf(GLfloat))) +% (@as(c_ulong, @bitCast(@as(c_long, if (texture != null) @as(c_int, 2) else @as(c_int, 0)))) *% @sizeOf(GLfloat));
    _ = &sz;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(usize, @bitCast(@as(c_long, count))) *% sz, 0, &cmd.*.data.draw.first)));
    if (!(verts != null)) {
        return @"false" != 0;
    }
    if (texture != null) {
        texturedata = @ptrCast(@alignCast(texture.*.internal));
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
            var col_: [*c]SDL_FColor = undefined;
            _ = &col_;
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
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = xy_[@as(c_int, 0)] * scale_x;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = xy_[@as(c_int, 1)] * scale_y;
            col_ = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))));
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.*.r * color_scale;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.*.g * color_scale;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.*.b * color_scale;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.*.a;
            if (texture != null) {
                var uv_: [*c]f32 = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(uv)))) + @as(usize, @bitCast(@as(isize, @intCast(j * uv_stride))))));
                _ = &uv_;
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = uv_[@as(c_int, 0)] * texturedata.*.texw;
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = uv_[@as(c_int, 1)] * texturedata.*.texh;
            }
        }
    }
    return @"true" != 0;
}
pub fn SetDrawState(data: [*c]GL_RenderData, cmd: [*c]const SDL_RenderCommand, shader: GL_Shader, shader_params: [*c]const f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &shader;
    const blend: SDL_BlendMode = cmd.*.data.draw.blend;
    _ = &blend;
    var vertex_array: bool = undefined;
    _ = &vertex_array;
    var color_array: bool = undefined;
    _ = &color_array;
    var texture_array: bool = undefined;
    _ = &texture_array;
    if (data.*.drawstate.viewport_dirty) {
        const istarget: bool = @as(?*anyopaque, @ptrCast(@alignCast(data.*.drawstate.target))) != @as(?*anyopaque, null);
        _ = &istarget;
        var viewport: [*c]const SDL_Rect = &data.*.drawstate.viewport;
        _ = &viewport;
        data.*.glMatrixMode.?(GL_PROJECTION);
        data.*.glLoadIdentity.?();
        data.*.glViewport.?(viewport.*.x, if (istarget) viewport.*.y else (data.*.drawstate.drawableh - viewport.*.y) - viewport.*.h, viewport.*.w, viewport.*.h);
        if ((viewport.*.w != 0) and (viewport.*.h != 0)) {
            data.*.glOrtho.?(@floatFromInt(@as(c_int, 0)), @floatFromInt(viewport.*.w), @floatFromInt(if (istarget) @as(c_int, 0) else viewport.*.h), @floatFromInt(if (istarget) viewport.*.h else @as(c_int, 0)), 0.0, 1.0);
        }
        data.*.glMatrixMode.?(GL_MODELVIEW);
        data.*.drawstate.viewport_dirty = @"false" != 0;
    }
    if (data.*.drawstate.cliprect_enabled_dirty) {
        if (!data.*.drawstate.cliprect_enabled) {
            data.*.glDisable.?(GL_SCISSOR_TEST);
        } else {
            data.*.glEnable.?(GL_SCISSOR_TEST);
        }
        data.*.drawstate.cliprect_enabled_dirty = @"false" != 0;
    }
    if (data.*.drawstate.cliprect_enabled and data.*.drawstate.cliprect_dirty) {
        var viewport: [*c]const SDL_Rect = &data.*.drawstate.viewport;
        _ = &viewport;
        var rect: [*c]const SDL_Rect = &data.*.drawstate.cliprect;
        _ = &rect;
        data.*.glScissor.?(viewport.*.x + rect.*.x, if (data.*.drawstate.target != null) viewport.*.y + rect.*.y else ((data.*.drawstate.drawableh - viewport.*.y) - rect.*.y) - rect.*.h, rect.*.w, rect.*.h);
        data.*.drawstate.cliprect_dirty = @"false" != 0;
    }
    if (blend != data.*.drawstate.blend) {
        if (blend == SDL_BLENDMODE_NONE) {
            data.*.glDisable.?(GL_BLEND);
        } else {
            data.*.glEnable.?(GL_BLEND);
            data.*.glBlendFuncSeparate.?(GetBlendFunc(SDL_GetBlendModeSrcColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeSrcAlphaFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstAlphaFactor(blend)));
            data.*.glBlendEquation.?(GetBlendEquation(SDL_GetBlendModeColorOperation(blend)));
        }
        data.*.drawstate.blend = blend;
    }
    if ((data.*.shaders != null) and ((shader != data.*.drawstate.shader) or (shader_params != data.*.drawstate.shader_params))) {
        GL_SelectShader(data.*.shaders, shader, shader_params);
        data.*.drawstate.shader = shader;
        data.*.drawstate.shader_params = shader_params;
    }
    if (data.*.drawstate.texturing_dirty or (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(cmd.*.data.draw.texture))) != @as(?*anyopaque, null)) != @as(c_int, @intFromBool(data.*.drawstate.texturing)))) {
        if (!(cmd.*.data.draw.texture != null)) {
            data.*.glDisable.?(data.*.textype);
            data.*.drawstate.texturing = @"false" != 0;
        } else {
            data.*.glEnable.?(data.*.textype);
            data.*.drawstate.texturing = @"true" != 0;
        }
        data.*.drawstate.texturing_dirty = @"false" != 0;
    }
    vertex_array = ((cmd.*.command == @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS)) or (cmd.*.command == @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES))) or (cmd.*.command == @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY));
    color_array = cmd.*.command == @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY);
    texture_array = @as(?*anyopaque, @ptrCast(@alignCast(cmd.*.data.draw.texture))) != @as(?*anyopaque, null);
    if (@as(c_int, @intFromBool(vertex_array)) != @as(c_int, @intFromBool(data.*.drawstate.vertex_array))) {
        if (vertex_array) {
            data.*.glEnableClientState.?(GL_VERTEX_ARRAY);
        } else {
            data.*.glDisableClientState.?(GL_VERTEX_ARRAY);
        }
        data.*.drawstate.vertex_array = vertex_array;
    }
    if (@as(c_int, @intFromBool(color_array)) != @as(c_int, @intFromBool(data.*.drawstate.color_array))) {
        if (color_array) {
            data.*.glEnableClientState.?(GL_COLOR_ARRAY);
        } else {
            data.*.glDisableClientState.?(GL_COLOR_ARRAY);
        }
        data.*.drawstate.color_array = color_array;
    }
    if (@as(c_int, @intFromBool(texture_array)) != @as(c_int, @intFromBool(data.*.drawstate.texture_array))) {
        if (texture_array) {
            data.*.glEnableClientState.?(GL_TEXTURE_COORD_ARRAY);
        } else {
            data.*.glDisableClientState.?(GL_TEXTURE_COORD_ARRAY);
        }
        data.*.drawstate.texture_array = texture_array;
    }
    return @"true" != 0;
}
pub fn SetCopyState(data: [*c]GL_RenderData, cmd: [*c]const SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var texturedata: [*c]GL_TextureData = undefined;
    _ = &texturedata;
    var textype: GLenum = undefined;
    _ = &textype;
    var shader: GL_Shader = undefined;
    _ = &shader;
    var shader_params: [*c]const f32 = undefined;
    _ = &shader_params;
    var palette: [*c]GL_PaletteData = undefined;
    _ = &palette;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                texture = cmd.*.data.draw.texture;
                texturedata = @ptrCast(@alignCast(texture.*.internal));
                textype = data.*.textype;
                shader = texturedata.*.shader;
                shader_params = texturedata.*.shader_params;
                switch (shader) {
                    SHADER_PALETTE_NEAREST => {
                        sdl_pc = 2;
                        continue;
                    },
                    SHADER_RGB => {
                        sdl_pc = 9;
                        continue;
                    },
                    SHADER_RGBA => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            1 => {
                _ = SetDrawState(data, cmd, shader, shader_params);
                if (texture != data.*.drawstate.texture) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            2 => {
                if (cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_LINEAR) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                shader = SHADER_PALETTE_LINEAR;
                shader_params = @ptrCast(@alignCast(&texturedata.*.texel_size));
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if ((cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_PIXELART) and data.*.pixelart_supported) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                shader = SHADER_PALETTE_PIXELART;
                shader_params = @ptrCast(@alignCast(&texturedata.*.texel_size));
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
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                if ((cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_PIXELART) and data.*.pixelart_supported) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                shader = SHADER_RGB_PIXELART;
                shader_params = @ptrCast(@alignCast(&texturedata.*.texel_size));
                {
                    sdl_pc = 12;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                if ((cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_PIXELART) and data.*.pixelart_supported) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                shader = SHADER_RGBA_PIXELART;
                shader_params = @ptrCast(@alignCast(&texturedata.*.texel_size));
                {
                    sdl_pc = 16;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                if (texturedata.*.yuv) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (cmd.*.data.draw.texture_scale_mode != texturedata.*.texture_scale_mode) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            21 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE2_ARB);
                data.*.glBindTexture.?(textype, texturedata.*.vtexture);
                data.*.glActiveTextureARB.?(GL_TEXTURE1_ARB);
                data.*.glBindTexture.?(textype, texturedata.*.utexture);
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (texturedata.*.nv12) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1_ARB);
                data.*.glBindTexture.?(textype, texturedata.*.utexture);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (texture.*.palette != null) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                palette = @ptrCast(@alignCast(texture.*.palette.*.internal));
                data.*.glActiveTextureARB.?(GL_TEXTURE1_ARB);
                data.*.glBindTexture.?(textype, palette.*.texture);
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
                if (data.*.GL_ARB_multitexture_supported) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE0_ARB);
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
                data.*.glBindTexture.?(textype, texturedata.*.texture);
                data.*.drawstate.texture = texture;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            33 => {
                if (texturedata.*.yuv) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                if ((cmd.*.data.draw.texture_address_mode_u != texturedata.*.texture_address_mode_u) or (cmd.*.data.draw.texture_address_mode_v != texturedata.*.texture_address_mode_v)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            36 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE2);
                if (!SetTextureScaleMode(data, textype, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            37 => {
                if (texturedata.*.nv12) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            38 => {
                if (texture.*.palette != null) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            39 => {
                return @"false" != 0;
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, textype, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                return @"false" != 0;
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE0);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            45 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, textype, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            48 => {
                return @"false" != 0;
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE0);
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            51 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, textype, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (!SetTextureScaleMode(data, textype, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
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
                data.*.glActiveTextureARB.?(GL_TEXTURE0);
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            57 => {
                return @"false" != 0;
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                texturedata.*.texture_scale_mode = cmd.*.data.draw.texture_scale_mode;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            60 => {
                if (texturedata.*.yuv) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                return @"true" != 0;
            },
            63 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE2);
                SetTextureAddressMode(data, textype, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                SetTextureAddressMode(data, textype, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTextureARB.?(GL_TEXTURE0_ARB);
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if (texturedata.*.nv12) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                if (texture.*.palette != null) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            66 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                SetTextureAddressMode(data, textype, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTextureARB.?(GL_TEXTURE0);
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            69 => {
                data.*.glActiveTextureARB.?(GL_TEXTURE1);
                SetTextureAddressMode(data, textype, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
                data.*.glActiveTextureARB.?(GL_TEXTURE0);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                SetTextureAddressMode(data, textype, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                texturedata.*.texture_address_mode_u = cmd.*.data.draw.texture_address_mode_u;
                texturedata.*.texture_address_mode_v = cmd.*.data.draw.texture_address_mode_v;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GL_InvalidateCachedState(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cache: [*c]GL_DrawStateCache = &@as([*c]GL_RenderData, @ptrCast(@alignCast(renderer.*.internal))).*.drawstate;
    _ = &cache;
    cache.*.viewport_dirty = @"true" != 0;
    cache.*.texture = null;
    cache.*.drawablew = 0;
    cache.*.drawableh = 0;
    cache.*.blend = SDL_BLENDMODE_INVALID;
    cache.*.shader = SHADER_INVALID;
    cache.*.cliprect_enabled_dirty = @"true" != 0;
    cache.*.cliprect_dirty = @"true" != 0;
    cache.*.texturing_dirty = @"true" != 0;
    cache.*.vertex_array = @"false" != 0;
    cache.*.color_array = @"false" != 0;
    cache.*.texture_array = @"false" != 0;
    cache.*.color_dirty = @"true" != 0;
    cache.*.clear_color_dirty = @"true" != 0;
}
pub fn GL_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, _: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "GL_RunCommandQueue".*;
    };
    _ = &static_local___func__;
    var data: [*c]GL_RenderData = undefined;
    _ = &data;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var r: f32 = undefined;
    _ = &r;
    var g: f32 = undefined;
    _ = &g;
    var b: f32 = undefined;
    _ = &b;
    var a: f32 = undefined;
    _ = &a;
    var viewport: [*c]SDL_Rect = undefined;
    _ = &viewport;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var r_1: f32 = undefined;
    _ = &r_1;
    var g_2: f32 = undefined;
    _ = &g_2;
    var b_3: f32 = undefined;
    _ = &b_3;
    var a_4: f32 = undefined;
    _ = &a_4;
    var count: usize = undefined;
    _ = &count;
    var verts: [*c]const GLfloat = undefined;
    _ = &verts;
    var finalcmd: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd;
    var nextcmd: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd;
    var thisblend: SDL_BlendMode = undefined;
    _ = &thisblend;
    var nextcmdtype: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype;
    var thistexture: [*c]SDL_Texture = undefined;
    _ = &thistexture;
    var thisblend_5: SDL_BlendMode = undefined;
    _ = &thisblend_5;
    var thisscalemode: SDL_ScaleMode = undefined;
    _ = &thisscalemode;
    var thisaddressmode_u: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_u;
    var thisaddressmode_v: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_v;
    var thiscmdtype: SDL_RenderCommandType = undefined;
    _ = &thiscmdtype;
    var finalcmd_6: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd_6;
    var nextcmd_7: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd_7;
    var count_8: usize = undefined;
    _ = &count_8;
    var ret: c_int = undefined;
    _ = &ret;
    var nextcmdtype_9: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype_9;
    var verts_10: [*c]const GLfloat = undefined;
    _ = &verts_10;
    var op: c_int = undefined;
    _ = &op;
    var r_11: f32 = undefined;
    _ = &r_11;
    var g_12: f32 = undefined;
    _ = &g_12;
    var b_13: f32 = undefined;
    _ = &b_13;
    var a_14: f32 = undefined;
    _ = &a_14;
    comptime {
        if (!(@sizeOf(@TypeOf(viewport.*)) == @sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)))) @compileError("static assertion failed \"sizeof (*(viewport)) == sizeof (*( &cmd->data.viewport.rect))\"");
    }
    comptime {
        if (!(@sizeOf(@TypeOf((&data.*.drawstate.cliprect).*)) == @sizeOf(@TypeOf(rect.*)))) @compileError("static assertion failed \"sizeof (*(&data->drawstate.cliprect)) == sizeof (*( rect))\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = @ptrCast(@alignCast(renderer.*.internal));
                if (!GL_ActivateRenderer(renderer)) {
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
                data.*.drawstate.target = renderer.*.target;
                if (!(data.*.drawstate.target != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_GetWindowSizeInPixels_REAL(renderer.*.window, &w, &h);
                if ((w != data.*.drawstate.drawablew) or (h != data.*.drawstate.drawableh)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                data.*.drawstate.viewport_dirty = @"true" != 0;
                data.*.drawstate.cliprect_dirty = @"true" != 0;
                data.*.drawstate.drawablew = w;
                data.*.drawstate.drawableh = h;
                {
                    sdl_pc = 9;
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                if (cmd != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                switch (cmd.*.command) {
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETVIEWPORT) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETCLIPRECT) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_CLEAR) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 87;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            12 => {
                if (data.*.drawstate.vertex_array) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            13 => {
                cmd = cmd.*.next;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                r = cmd.*.data.color.color.r * cmd.*.data.color.color_scale;
                g = cmd.*.data.color.color.g * cmd.*.data.color.color_scale;
                b = cmd.*.data.color.color.b * cmd.*.data.color.color_scale;
                a = cmd.*.data.color.color.a;
                if ((((data.*.drawstate.color_dirty or (r != data.*.drawstate.color.r)) or (g != data.*.drawstate.color.g)) or (b != data.*.drawstate.color.b)) or (a != data.*.drawstate.color.a)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                data.*.glColor4f.?(r, g, b, a);
                data.*.drawstate.color.r = r;
                data.*.drawstate.color.g = g;
                data.*.drawstate.color.b = b;
                data.*.drawstate.color.a = a;
                data.*.drawstate.color_dirty = @"false" != 0;
                {
                    sdl_pc = 17;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                viewport = &data.*.drawstate.viewport;
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf(cmd.*.data.viewport.rect))) != @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                _ = memcpy(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)));
                data.*.drawstate.viewport_dirty = @"true" != 0;
                data.*.drawstate.cliprect_dirty = @"true" != 0;
                {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            22 => {
                rect = &cmd.*.data.cliprect.rect;
                if (@as(c_int, @intFromBool(data.*.drawstate.cliprect_enabled)) != @as(c_int, @intFromBool(cmd.*.data.cliprect.enabled))) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                data.*.drawstate.cliprect_enabled = cmd.*.data.cliprect.enabled;
                data.*.drawstate.cliprect_enabled_dirty = @"true" != 0;
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
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(&data.*.drawstate.cliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*))) != @as(c_int, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                _ = memcpy(@ptrCast(@alignCast(&data.*.drawstate.cliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
                data.*.drawstate.cliprect_dirty = @"true" != 0;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            29 => {
                r_1 = cmd.*.data.color.color.r * cmd.*.data.color.color_scale;
                g_2 = cmd.*.data.color.color.g * cmd.*.data.color.color_scale;
                b_3 = cmd.*.data.color.color.b * cmd.*.data.color.color_scale;
                a_4 = cmd.*.data.color.color.a;
                if ((((data.*.drawstate.clear_color_dirty or (r_1 != data.*.drawstate.clear_color.r)) or (g_2 != data.*.drawstate.clear_color.g)) or (b_3 != data.*.drawstate.clear_color.b)) or (a_4 != data.*.drawstate.clear_color.a)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                data.*.glClearColor.?(r_1, g_2, b_3, a_4);
                data.*.drawstate.clear_color.r = r_1;
                data.*.drawstate.clear_color.g = g_2;
                data.*.drawstate.clear_color.b = b_3;
                data.*.drawstate.clear_color.a = a_4;
                data.*.drawstate.clear_color_dirty = @"false" != 0;
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
                if (data.*.drawstate.cliprect_enabled or data.*.drawstate.cliprect_enabled_dirty) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                data.*.glDisable.?(GL_SCISSOR_TEST);
                data.*.drawstate.cliprect_enabled_dirty = data.*.drawstate.cliprect_enabled;
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
                data.*.glClear.?(GL_COLOR_BUFFER_BIT);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            39 => {
                if (SetDrawState(data, cmd, SHADER_SOLID, null)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                count = cmd.*.data.draw.count;
                verts = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                data.*.glVertexPointer.?(2, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 2)))), @ptrCast(@alignCast(verts)));
                if (count > @as(usize, 2)) {
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            43 => {
                data.*.glDrawArrays.?(GL_LINE_STRIP, 0, @bitCast(@as(c_uint, @truncate(count))));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                finalcmd = cmd;
                nextcmd = cmd.*.next;
                thisblend = cmd.*.data.draw.blend;
                {
                    sdl_pc = 46;
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
                if (nextcmd != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                nextcmdtype = nextcmd.*.command;
                if (nextcmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                data.*.glDrawArrays.?(GL_LINES, 0, @bitCast(@as(c_uint, @truncate(count))));
                cmd = finalcmd;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            50 => {
                if (nextcmd.*.data.draw.count != @as(usize, 2)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                nextcmd = nextcmd.*.next;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            53 => {
                if (nextcmd.*.data.draw.blend != thisblend) {
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            56 => {
                finalcmd = nextcmd;
                count +%= nextcmd.*.data.draw.count;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                thistexture = cmd.*.data.draw.texture;
                thisblend_5 = cmd.*.data.draw.blend;
                thisscalemode = cmd.*.data.draw.texture_scale_mode;
                thisaddressmode_u = cmd.*.data.draw.texture_address_mode_u;
                thisaddressmode_v = cmd.*.data.draw.texture_address_mode_v;
                thiscmdtype = cmd.*.command;
                finalcmd_6 = cmd;
                nextcmd_7 = cmd.*.next;
                count_8 = cmd.*.data.draw.count;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if (nextcmd_7 != null) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                nextcmdtype_9 = nextcmd_7.*.command;
                if (nextcmdtype_9 != thiscmdtype) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                if (thistexture != null) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            64 => {
                if (((((nextcmd_7.*.data.draw.texture != thistexture) or (nextcmd_7.*.data.draw.texture_scale_mode != thisscalemode)) or (nextcmd_7.*.data.draw.texture_address_mode_u != thisaddressmode_u)) or (nextcmd_7.*.data.draw.texture_address_mode_v != thisaddressmode_v)) or (nextcmd_7.*.data.draw.blend != thisblend_5)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                nextcmd_7 = nextcmd_7.*.next;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            67 => {
                finalcmd_6 = nextcmd_7;
                count_8 +%= nextcmd_7.*.data.draw.count;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            69 => {
                ret = @intFromBool(SetCopyState(data, cmd));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                ret = @intFromBool(SetDrawState(data, cmd, SHADER_SOLID, null));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                if (ret != 0) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                verts_10 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                op = GL_TRIANGLES;
                if (thiscmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS)) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                cmd = finalcmd_6;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            75 => {
                op = GL_POINTS;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                if (thiscmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                data.*.glVertexPointer.?(2, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 2)))), @ptrCast(@alignCast(verts_10)));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                if (thistexture != null) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            80 => {
                data.*.glDrawArrays.?(@bitCast(@as(c_int, op)), 0, @bitCast(@as(c_uint, @truncate(count_8))));
                if (thiscmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            81 => {
                data.*.glVertexPointer.?(2, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 8)))), @ptrCast(@alignCast(verts_10 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0))))))));
                data.*.glColorPointer.?(4, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 8)))), @ptrCast(@alignCast(verts_10 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))));
                data.*.glTexCoordPointer.?(2, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 8)))), @ptrCast(@alignCast(verts_10 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6))))))));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                data.*.glVertexPointer.?(2, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 6)))), @ptrCast(@alignCast(verts_10 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0))))))));
                data.*.glColorPointer.?(4, GL_FLOAT, @bitCast(@as(c_uint, @truncate(@sizeOf(f32) *% @as(c_ulong, 6)))), @ptrCast(@alignCast(verts_10 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            84 => {
                r_11 = data.*.drawstate.color.r;
                g_12 = data.*.drawstate.color.g;
                b_13 = data.*.drawstate.color.b;
                a_14 = data.*.drawstate.color.a;
                data.*.glColor4f.?(r_11, g_12, b_13, a_14);
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            88 => {
                data.*.glDisableClientState.?(GL_VERTEX_ARRAY);
                data.*.drawstate.vertex_array = @"false" != 0;
                {
                    sdl_pc = 90;
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
                if (data.*.drawstate.color_array) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                data.*.glDisableClientState.?(GL_COLOR_ARRAY);
                data.*.drawstate.color_array = @"false" != 0;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                if (data.*.drawstate.texture_array) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                data.*.glDisableClientState.?(GL_TEXTURE_COORD_ARRAY);
                data.*.drawstate.texture_array = @"false" != 0;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                return GL_CheckAllErrors("", renderer, "SDL_render_gl.c", 1659, @ptrCast(@alignCast(&static_local___func__.__func__)));
            },
            else => unreachable,
        }
    }
}
pub fn GL_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GL_RenderReadPixels".*;
    };
    _ = &static_local___func__;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var format: SDL_PixelFormat = if (renderer.*.target != null) renderer.*.target.*.format else @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32);
    _ = &format;
    var internalFormat: GLint = undefined;
    _ = &internalFormat;
    var targetFormat: GLenum = undefined;
    _ = &targetFormat;
    var @"type": GLenum = undefined;
    _ = &@"type";
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    _ = GL_ActivateRenderer(renderer);
    if (!convert_format(format, &internalFormat, &targetFormat, &@"type")) {
        _ = SDL_SetError_REAL("Texture format %s not supported by OpenGL", SDL_GetPixelFormatName_REAL(format));
        return null;
    }
    surface = SDL_CreateSurfaceUninitialized(rect.*.w, rect.*.h, format);
    if (!(surface != null)) {
        return null;
    }
    var y: c_int = rect.*.y;
    _ = &y;
    if (!(renderer.*.target != null)) {
        var w: c_int = undefined;
        _ = &w;
        var h: c_int = undefined;
        _ = &h;
        _ = SDL_GetRenderOutputSize_REAL(renderer, &w, &h);
        y = (h - y) - rect.*.h;
    }
    data.*.glPixelStorei.?(GL_PACK_ALIGNMENT, 1);
    data.*.glPixelStorei.?(GL_PACK_ROW_LENGTH, @divTrunc(surface.*.pitch, if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))));
    data.*.glReadPixels.?(rect.*.x, y, rect.*.w, rect.*.h, targetFormat, @"type", surface.*.pixels);
    if (!GL_CheckAllErrors("glReadPixels()", renderer, "SDL_render_gl.c", 1693, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        SDL_DestroySurface_REAL(surface);
        return null;
    }
    if (!(renderer.*.target != null)) {
        _ = SDL_FlipSurface_REAL(surface, SDL_FLIP_VERTICAL);
    }
    return surface;
}
pub fn GL_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = GL_ActivateRenderer(renderer);
    return SDL_GL_SwapWindow_REAL(renderer.*.window);
}
pub fn GL_DestroyTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GL_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    _ = GL_ActivateRenderer(renderer);
    if (renderdata.*.drawstate.texture == texture) {
        renderdata.*.drawstate.texture = null;
        renderdata.*.drawstate.shader_params = null;
    }
    if (renderdata.*.drawstate.target == texture) {
        renderdata.*.drawstate.target = null;
    }
    if (!(data != null)) {
        return;
    }
    if ((data.*.texture != 0) and (@as(GLuint, @bitCast(@as(c_int, @intFromBool(!data.*.texture_external)))) != 0)) {
        renderdata.*.glDeleteTextures.?(1, &data.*.texture);
    }
    if (data.*.yuv) {
        if (!data.*.utexture_external) {
            renderdata.*.glDeleteTextures.?(1, &data.*.utexture);
        }
        if (!data.*.vtexture_external) {
            renderdata.*.glDeleteTextures.?(1, &data.*.vtexture);
        }
    }
    if (data.*.nv12) {
        if (!data.*.utexture_external) {
            renderdata.*.glDeleteTextures.?(1, &data.*.utexture);
        }
    }
    SDL_free_REAL(data.*.pixels);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    texture.*.internal = null;
}
pub fn GL_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "GL_DestroyRenderer".*;
    };
    _ = &static_local___func__;
    var data: [*c]GL_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (data != null) {
        if (data.*.context != null) {
            _ = GL_ActivateRenderer(renderer);
        }
        GL_ClearErrors(renderer);
        if (data.*.GL_ARB_debug_output_supported) {
            var glDebugMessageCallbackARBFunc: PFNGLDEBUGMESSAGECALLBACKARBPROC = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDebugMessageCallbackARB"))));
            _ = &glDebugMessageCallbackARBFunc;
            glDebugMessageCallbackARBFunc.?(data.*.next_error_callback, data.*.next_error_userparam);
        }
        if (data.*.shaders != null) {
            GL_DestroyShaderContext(data.*.shaders);
        }
        if (data.*.context != null) {
            while (data.*.framebuffers != null) {
                var nextnode: [*c]GL_FBOList = data.*.framebuffers.*.next;
                _ = &nextnode;
                data.*.glDeleteFramebuffersEXT.?(1, &data.*.framebuffers.*.FBO);
                _ = GL_CheckAllErrors("", renderer, "SDL_render_gl.c", 1777, @ptrCast(@alignCast(&static_local___func__.__func__)));
                SDL_free_REAL(@ptrCast(@alignCast(data.*.framebuffers)));
                data.*.framebuffers = nextnode;
            }
            _ = SDL_GL_DestroyContext_REAL(data.*.context);
        }
        SDL_free_REAL(@ptrCast(@alignCast(data)));
    }
}
pub fn GL_SetVSync(_: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &vsync;
    var interval: c_int = 0;
    _ = &interval;
    if (!SDL_GL_SetSwapInterval_REAL(vsync)) {
        return @"false" != 0;
    }
    if (!SDL_GL_GetSwapInterval_REAL(&interval)) {
        return @"false" != 0;
    }
    if (interval != vsync) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return @"true" != 0;
}
pub fn GL_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GL_RenderData = undefined;
    _ = &data;
    var value: GLint = undefined;
    _ = &value;
    var window_flags: SDL_WindowFlags = undefined;
    _ = &window_flags;
    var profile_mask: c_int = undefined;
    _ = &profile_mask;
    var major: c_int = undefined;
    _ = &major;
    var minor: c_int = undefined;
    _ = &minor;
    var real_major: c_int = undefined;
    _ = &real_major;
    var real_minor: c_int = undefined;
    _ = &real_minor;
    var changed_window: bool = undefined;
    _ = &changed_window;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var verstr: [*c]const u8 = undefined;
    _ = &verstr;
    var non_power_of_two_supported: bool = undefined;
    _ = &non_power_of_two_supported;
    var bgra_supported: bool = undefined;
    _ = &bgra_supported;
    var glDebugMessageCallbackARBFunc: PFNGLDEBUGMESSAGECALLBACKARBPROC = undefined;
    _ = &glDebugMessageCallbackARBFunc;
    var verbuf: [16]u8 = undefined;
    _ = &verbuf;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    var @"error": [*c]u8 = undefined;
    _ = &@"error";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = null;
                window_flags = 0;
                profile_mask = 0;
                major = 0;
                minor = 0;
                real_major = 0;
                real_minor = 0;
                changed_window = @"false" != 0;
                non_power_of_two_supported = @"false" != 0;
                bgra_supported = @"false" != 0;
                SDL_SetupRendererColorspace(renderer, create_props);
                if (renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (changed_window) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Unsupported output colorspace");
                {
                    sdl_pc = 1;
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
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, &profile_mask)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, &major)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, &minor)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
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
                _ = SDL_SyncWindow_REAL(window);
                window_flags = SDL_GetWindowFlags_REAL(window);
                if (((!((window_flags & @as(c_ulong, 2)) != 0) or (profile_mask == SDL_GL_CONTEXT_PROFILE_ES)) or (major != RENDERER_CONTEXT_MAJOR)) or (minor != RENDERER_CONTEXT_MINOR)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                changed_window = @"true" != 0;
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, 0);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, RENDERER_CONTEXT_MAJOR);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, RENDERER_CONTEXT_MINOR);
                if (!SDL_ReconfigureWindow(window, (window_flags & ~(@as(c_ulong, 268435456) | @as(c_ulong, 536870912))) | @as(c_ulong, 2))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
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
                renderer.*.WindowEvent = GL_WindowEvent;
                renderer.*.SupportsBlendMode = GL_SupportsBlendMode;
                renderer.*.CreatePalette = GL_CreatePalette;
                renderer.*.UpdatePalette = GL_UpdatePalette;
                renderer.*.DestroyPalette = GL_DestroyPalette;
                renderer.*.CreateTexture = GL_CreateTexture;
                renderer.*.UpdateTexture = GL_UpdateTexture;
                renderer.*.UpdateTextureYUV = GL_UpdateTextureYUV;
                renderer.*.UpdateTextureNV = GL_UpdateTextureNV;
                renderer.*.LockTexture = GL_LockTexture;
                renderer.*.UnlockTexture = GL_UnlockTexture;
                renderer.*.SetRenderTarget = GL_SetRenderTarget;
                renderer.*.QueueSetViewport = GL_QueueNoOp;
                renderer.*.QueueSetDrawColor = GL_QueueNoOp;
                renderer.*.QueueDrawPoints = GL_QueueDrawPoints;
                renderer.*.QueueDrawLines = GL_QueueDrawLines;
                renderer.*.QueueGeometry = GL_QueueGeometry;
                renderer.*.InvalidateCachedState = GL_InvalidateCachedState;
                renderer.*.RunCommandQueue = GL_RunCommandQueue;
                renderer.*.RenderReadPixels = GL_RenderReadPixels;
                renderer.*.RenderPresent = GL_RenderPresent;
                renderer.*.DestroyTexture = GL_DestroyTexture;
                renderer.*.DestroyRenderer = GL_DestroyRenderer;
                renderer.*.SetVSync = GL_SetVSync;
                renderer.*.internal = @ptrCast(@alignCast(data));
                GL_InvalidateCachedState(renderer);
                renderer.*.window = window;
                renderer.*.name = GL_RenderDriver.name;
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_FRAMEBUFFER_SRGB_CAPABLE, 0);
                data.*.context = SDL_GL_CreateContext_REAL(window);
                if (!(data.*.context != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_GL_MakeCurrent_REAL(window, data.*.context)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 1;
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
                if (!GL_LoadFunctions(data)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 1;
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
                if (SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_FLAGS, &value) and ((value & SDL_GL_CONTEXT_DEBUG_FLAG) != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                data.*.debug_enabled = @"true" != 0;
                {
                    sdl_pc = 34;
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
                if (data.*.debug_enabled and SDL_GL_ExtensionSupported_REAL("GL_ARB_debug_output")) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                glDebugMessageCallbackARBFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDebugMessageCallbackARB"))));
                data.*.GL_ARB_debug_output_supported = @"true" != 0;
                data.*.glGetPointerv.?(GL_DEBUG_CALLBACK_FUNCTION_ARB, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&data.*.next_error_callback))))));
                data.*.glGetPointerv.?(GL_DEBUG_CALLBACK_USER_PARAM_ARB, &data.*.next_error_userparam);
                glDebugMessageCallbackARBFunc.?(GL_HandleDebugMessage, @ptrCast(@alignCast(renderer)));
                data.*.glEnable.?(GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB);
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
                verstr = @ptrCast(@alignCast(data.*.glGetString.?(GL_VERSION)));
                if (verstr != null) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&verbuf)), verstr, @sizeOf(@TypeOf(verbuf)));
                ptr = SDL_strchr_REAL(@ptrCast(@alignCast(&verbuf)), '.');
                if (ptr != null) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                hint = SDL_GetHint_REAL("GL_ARB_texture_non_power_of_two");
                if (!(hint != null) or (@as(c_int, hint.*) != @as(c_int, '0'))) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                real_minor = SDL_atoi_REAL(ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
                ptr.* = '\x00';
                real_major = SDL_atoi_REAL(@ptrCast(@alignCast(&verbuf)));
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
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                if ((real_major >= @as(c_int, 2)) or SDL_GL_ExtensionSupported_REAL("GL_ARB_texture_non_power_of_two")) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                renderer.*.npot_texture_wrap_unsupported = !non_power_of_two_supported;
                data.*.textype = GL_TEXTURE_2D;
                if (non_power_of_two_supported) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                non_power_of_two_supported = @"true" != 0;
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                data.*.GL_ARB_texture_non_power_of_two_supported = @"true" != 0;
                data.*.glGetIntegerv.?(GL_MAX_TEXTURE_SIZE, &value);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", value);
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                if (SDL_GL_ExtensionSupported_REAL("GL_ARB_texture_rectangle") or SDL_GL_ExtensionSupported_REAL("GL_EXT_texture_rectangle")) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                if (SDL_GL_ExtensionSupported_REAL("GL_ARB_multitexture")) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            53 => {
                data.*.GL_ARB_texture_rectangle_supported = @"true" != 0;
                data.*.textype = GL_TEXTURE_RECTANGLE_ARB;
                data.*.glGetIntegerv.?(GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB, &value);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", value);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                data.*.glGetIntegerv.?(GL_MAX_TEXTURE_SIZE, &value);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", value);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                data.*.glActiveTextureARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glActiveTextureARB"))));
                if (data.*.glActiveTextureARB != null) {
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
                hint = SDL_GetHint_REAL("GL_EXT_bgra");
                if (!(hint != null) or (@as(c_int, hint.*) != @as(c_int, '0'))) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            59 => {
                data.*.GL_ARB_multitexture_supported = @"true" != 0;
                data.*.glGetIntegerv.?(GL_MAX_TEXTURE_UNITS_ARB, &data.*.num_texture_units);
                {
                    sdl_pc = 61;
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
                if (((real_major > @as(c_int, 1)) or ((real_major == @as(c_int, 1)) and (real_minor >= @as(c_int, 2)))) or SDL_GL_ExtensionSupported_REAL("GL_EXT_bgra")) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
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
                if (bgra_supported) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            65 => {
                bgra_supported = @"true" != 0;
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
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            68 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRA32);
                {
                    sdl_pc = 70;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBA32);
                data.*.shaders = GL_CreateShaderContext();
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL shaders: %s", if (data.*.shaders != null) @as([*c]u8, @as([*c]u8, @constCast("ENABLED"))) else @as([*c]u8, @as([*c]u8, @constCast("DISABLED"))));
                if (GL_SupportsShader(data.*.shaders, SHADER_RGB)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                if (bgra_supported) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            72 => {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL RGB shaders not supported");
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if (GL_SupportsShader(data.*.shaders, SHADER_RGB_PIXELART) and GL_SupportsShader(data.*.shaders, SHADER_RGBA_PIXELART)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            74 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRX32);
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBX32);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                data.*.pixelart_supported = @"true" != 0;
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL PIXELART shaders not supported");
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (((GL_SupportsShader(data.*.shaders, SHADER_PALETTE_NEAREST) and GL_SupportsShader(data.*.shaders, SHADER_PALETTE_LINEAR)) and (!data.*.pixelart_supported or GL_SupportsShader(data.*.shaders, SHADER_PALETTE_PIXELART))) and (data.*.num_texture_units >= @as(c_int, 2))) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_INDEX8);
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL palette shaders not supported");
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (GL_SupportsShader(data.*.shaders, SHADER_YUV) and (data.*.num_texture_units >= @as(c_int, 3))) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_YV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_IYUV);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_I444);
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL YUV not supported");
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if ((((GL_SupportsShader(data.*.shaders, SHADER_NV12_RA) and GL_SupportsShader(data.*.shaders, SHADER_NV12_RG)) and GL_SupportsShader(data.*.shaders, SHADER_NV21_RA)) and GL_SupportsShader(data.*.shaders, SHADER_NV21_RG)) and (data.*.num_texture_units >= @as(c_int, 2))) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV21);
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "OpenGL NV12/NV21 not supported");
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                if (SDL_GL_ExtensionSupported_REAL("GL_EXT_framebuffer_object")) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                data.*.GL_EXT_framebuffer_object_supported = @"true" != 0;
                data.*.glGenFramebuffersEXT = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenFramebuffersEXT"))));
                data.*.glDeleteFramebuffersEXT = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteFramebuffersEXT"))));
                data.*.glFramebufferTexture2DEXT = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glFramebufferTexture2DEXT"))));
                data.*.glBindFramebufferEXT = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindFramebufferEXT"))));
                data.*.glCheckFramebufferStatusEXT = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCheckFramebufferStatusEXT"))));
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                _ = SDL_SetError_REAL("Can't create render targets, GL_EXT_framebuffer_object not available");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            91 => {
                if (((real_major >= @as(c_int, 3)) or SDL_GL_ExtensionSupported_REAL("GL_EXT_framebuffer_sRGB")) or SDL_GL_ExtensionSupported_REAL("GL_ARB_framebuffer_sRGB")) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                data.*.glDisable.?(GL_FRAMEBUFFER_SRGB);
                {
                    sdl_pc = 94;
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
                data.*.glMatrixMode.?(GL_MODELVIEW);
                data.*.glLoadIdentity.?();
                data.*.glDisable.?(GL_DEPTH_TEST);
                data.*.glDisable.?(GL_CULL_FACE);
                data.*.glDisable.?(GL_SCISSOR_TEST);
                data.*.glDisable.?(data.*.textype);
                data.*.glClearColor.?(1.0, 1.0, 1.0, 1.0);
                data.*.glColor4f.?(1.0, 1.0, 1.0, 1.0);
                data.*.drawstate.color.r = 1.0;
                data.*.drawstate.color.g = 1.0;
                data.*.drawstate.color.b = 1.0;
                data.*.drawstate.color.a = 1.0;
                data.*.drawstate.clear_color.r = 1.0;
                data.*.drawstate.clear_color.g = 1.0;
                data.*.drawstate.clear_color.b = 1.0;
                data.*.drawstate.clear_color.a = 1.0;
                return @"true" != 0;
            },
            95 => {
                @"error" = SDL_strdup_REAL(SDL_GetError_REAL());
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, profile_mask);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, major);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, minor);
                _ = SDL_RecreateWindow(window, window_flags);
                _ = SDL_SetError_REAL("%s", @"error");
                SDL_free_REAL(@ptrCast(@alignCast(@"error")));
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export var GL_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = GL_CreateRenderer,
    .name = "opengl",
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_FUNCTION = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_assert.h:181:12
pub const SDL_LINE = @compileError("unable to translate macro: undefined identifier `__LINE__`");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_assert.h:237:9
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_INVALID = __helpers.promoteIntLiteral(c_uint, 0x7FFFFFFF, .hex);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_DEBUG_FLAG = @as(c_int, 0x0001);
pub const GL_UNSIGNED_BYTE = @as(c_int, 0x1401);
pub const GL_FLOAT = @as(c_int, 0x1406);
pub const GL_POINTS = @as(c_int, 0x0000);
pub const GL_LINES = @as(c_int, 0x0001);
pub const GL_LINE_STRIP = @as(c_int, 0x0003);
pub const GL_TRIANGLES = @as(c_int, 0x0004);
pub const GL_VERTEX_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8074, .hex);
pub const GL_COLOR_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8076, .hex);
pub const GL_TEXTURE_COORD_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8078, .hex);
pub const GL_MODELVIEW = @as(c_int, 0x1700);
pub const GL_PROJECTION = @as(c_int, 0x1701);
pub const GL_CULL_FACE = @as(c_int, 0x0B44);
pub const GL_DEPTH_TEST = @as(c_int, 0x0B71);
pub const GL_BLEND = @as(c_int, 0x0BE2);
pub const GL_ZERO = @as(c_int, 0);
pub const GL_ONE = @as(c_int, 1);
pub const GL_SRC_COLOR = @as(c_int, 0x0300);
pub const GL_ONE_MINUS_SRC_COLOR = @as(c_int, 0x0301);
pub const GL_SRC_ALPHA = @as(c_int, 0x0302);
pub const GL_ONE_MINUS_SRC_ALPHA = @as(c_int, 0x0303);
pub const GL_DST_ALPHA = @as(c_int, 0x0304);
pub const GL_ONE_MINUS_DST_ALPHA = @as(c_int, 0x0305);
pub const GL_DST_COLOR = @as(c_int, 0x0306);
pub const GL_ONE_MINUS_DST_COLOR = @as(c_int, 0x0307);
pub const GL_LINEAR = @as(c_int, 0x2601);
pub const GL_LUMINANCE = @as(c_int, 0x1909);
pub const GL_LUMINANCE_ALPHA = @as(c_int, 0x190A);
pub const GL_RGBA = @as(c_int, 0x1908);
pub const GL_MAX_TEXTURE_SIZE = @as(c_int, 0x0D33);
pub const GL_SCISSOR_TEST = @as(c_int, 0x0C11);
pub const GL_PACK_ALIGNMENT = @as(c_int, 0x0D05);
pub const GL_PACK_ROW_LENGTH = @as(c_int, 0x0D02);
pub const GL_UNPACK_ALIGNMENT = @as(c_int, 0x0CF5);
pub const GL_UNPACK_ROW_LENGTH = @as(c_int, 0x0CF2);
pub const GL_TEXTURE_2D = @as(c_int, 0x0DE1);
pub const GL_TEXTURE_WRAP_S = @as(c_int, 0x2802);
pub const GL_TEXTURE_WRAP_T = @as(c_int, 0x2803);
pub const GL_TEXTURE_MAG_FILTER = @as(c_int, 0x2800);
pub const GL_TEXTURE_MIN_FILTER = @as(c_int, 0x2801);
pub const GL_NEAREST = @as(c_int, 0x2600);
pub const GL_REPEAT = @as(c_int, 0x2901);
pub const GL_VERSION = @as(c_int, 0x1F02);
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_INVALID_ENUM = @as(c_int, 0x0500);
pub const GL_INVALID_VALUE = @as(c_int, 0x0501);
pub const GL_INVALID_OPERATION = @as(c_int, 0x0502);
pub const GL_STACK_OVERFLOW = @as(c_int, 0x0503);
pub const GL_STACK_UNDERFLOW = @as(c_int, 0x0504);
pub const GL_OUT_OF_MEMORY = @as(c_int, 0x0505);
pub const GL_COLOR_BUFFER_BIT = @as(c_int, 0x00004000);
pub const GL_RGBA8 = __helpers.promoteIntLiteral(c_int, 0x8058, .hex);
pub const GL_CLAMP_TO_EDGE = __helpers.promoteIntLiteral(c_int, 0x812F, .hex);
pub const GL_BGRA = __helpers.promoteIntLiteral(c_int, 0x80E1, .hex);
pub const GL_TABLE_TOO_LARGE = __helpers.promoteIntLiteral(c_int, 0x8031, .hex);
pub const GL_MIN = __helpers.promoteIntLiteral(c_int, 0x8007, .hex);
pub const GL_MAX = __helpers.promoteIntLiteral(c_int, 0x8008, .hex);
pub const GL_FUNC_ADD = __helpers.promoteIntLiteral(c_int, 0x8006, .hex);
pub const GL_FUNC_SUBTRACT = __helpers.promoteIntLiteral(c_int, 0x800A, .hex);
pub const GL_FUNC_REVERSE_SUBTRACT = __helpers.promoteIntLiteral(c_int, 0x800B, .hex);
pub const GL_TEXTURE0 = __helpers.promoteIntLiteral(c_int, 0x84C0, .hex);
pub const GL_TEXTURE1 = __helpers.promoteIntLiteral(c_int, 0x84C1, .hex);
pub const GL_TEXTURE2 = __helpers.promoteIntLiteral(c_int, 0x84C2, .hex);
pub const GL_TEXTURE0_ARB = __helpers.promoteIntLiteral(c_int, 0x84C0, .hex);
pub const GL_TEXTURE1_ARB = __helpers.promoteIntLiteral(c_int, 0x84C1, .hex);
pub const GL_TEXTURE2_ARB = __helpers.promoteIntLiteral(c_int, 0x84C2, .hex);
pub const GL_MAX_TEXTURE_UNITS_ARB = __helpers.promoteIntLiteral(c_int, 0x84E2, .hex);
pub const GL_FRAMEBUFFER_SRGB = __helpers.promoteIntLiteral(c_int, 0x8DB9, .hex);
pub const GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB = __helpers.promoteIntLiteral(c_int, 0x8242, .hex);
pub const GL_DEBUG_CALLBACK_FUNCTION_ARB = __helpers.promoteIntLiteral(c_int, 0x8244, .hex);
pub const GL_DEBUG_CALLBACK_USER_PARAM_ARB = __helpers.promoteIntLiteral(c_int, 0x8245, .hex);
pub const GL_DEBUG_TYPE_ERROR_ARB = __helpers.promoteIntLiteral(c_int, 0x824C, .hex);
pub const GL_TEXTURE_RECTANGLE_ARB = __helpers.promoteIntLiteral(c_int, 0x84F5, .hex);
pub const GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB = __helpers.promoteIntLiteral(c_int, 0x84F8, .hex);
pub const GL_FRAMEBUFFER_COMPLETE_EXT = __helpers.promoteIntLiteral(c_int, 0x8CD5, .hex);
pub const GL_COLOR_ATTACHMENT0_EXT = __helpers.promoteIntLiteral(c_int, 0x8CE0, .hex);
pub const GL_FRAMEBUFFER_EXT = __helpers.promoteIntLiteral(c_int, 0x8D40, .hex);
pub const RENDERER_CONTEXT_MAJOR = @as(c_int, 2);
pub const RENDERER_CONTEXT_MINOR = @as(c_int, 1);
pub inline fn GL_CheckError(prefix: anytype, renderer: anytype) @TypeOf(GL_CheckAllErrors(prefix, renderer, "SDL_render_gl.c", SDL_LINE, SDL_FUNCTION)) {
    @setEvalBranchQuota(100000);
    _ = &prefix;
    _ = &renderer;
    return GL_CheckAllErrors(prefix, renderer, "SDL_render_gl.c", SDL_LINE, SDL_FUNCTION);
}
