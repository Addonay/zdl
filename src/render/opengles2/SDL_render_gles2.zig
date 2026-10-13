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
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
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
pub const SDL_PIXELFORMAT_EXTERNAL_OES: c_int = 542328143;
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
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
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
pub const SDL_TEXTUREACCESS_STATIC: c_int = 0;
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
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_Vertex = extern struct {
    position: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    tex_coord: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
};
pub const SDL_Vertex = struct_SDL_Vertex;
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetRenderOutputSize_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetTextureProperties_REAL(texture: [*c]SDL_Texture) SDL_PropertiesID;
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
pub const khronos_uint8_t = u8;
pub const khronos_intptr_t = c_long;
pub const khronos_ssize_t = c_long;
pub const khronos_float_t = f32;
pub const GLclampf = khronos_float_t;
pub const GLvoid = anyopaque;
pub const GLenum = c_uint;
pub const GLuint = c_uint;
pub const GLchar = u8;
pub const GLfloat = khronos_float_t;
pub const GLsizeiptr = khronos_ssize_t;
pub const GLintptr = khronos_intptr_t;
pub const GLbitfield = c_uint;
pub const GLint = c_int;
pub const GLboolean = u8;
pub const GLsizei = c_int;
pub const GLubyte = khronos_uint8_t;
pub extern fn glActiveTexture(texture: GLenum) void;
pub extern fn glAttachShader(program: GLuint, shader: GLuint) void;
pub extern fn glBindAttribLocation(program: GLuint, index: GLuint, name: [*c]const GLchar) void;
pub extern fn glBindBuffer(target: GLenum, buffer: GLuint) void;
pub extern fn glBindFramebuffer(target: GLenum, framebuffer: GLuint) void;
pub extern fn glBindTexture(target: GLenum, texture: GLuint) void;
pub extern fn glBlendEquationSeparate(modeRGB: GLenum, modeAlpha: GLenum) void;
pub extern fn glBlendFuncSeparate(sfactorRGB: GLenum, dfactorRGB: GLenum, sfactorAlpha: GLenum, dfactorAlpha: GLenum) void;
pub extern fn glBufferData(target: GLenum, size: GLsizeiptr, data: ?*const anyopaque, usage: GLenum) void;
pub extern fn glBufferSubData(target: GLenum, offset: GLintptr, size: GLsizeiptr, data: ?*const anyopaque) void;
pub extern fn glCheckFramebufferStatus(target: GLenum) GLenum;
pub extern fn glClear(mask: GLbitfield) void;
pub extern fn glClearColor(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat) void;
pub extern fn glCompileShader(shader: GLuint) void;
pub extern fn glCreateProgram() GLuint;
pub extern fn glCreateShader(@"type": GLenum) GLuint;
pub extern fn glDeleteBuffers(n: GLsizei, buffers: [*c]const GLuint) void;
pub extern fn glDeleteFramebuffers(n: GLsizei, framebuffers: [*c]const GLuint) void;
pub extern fn glDeleteProgram(program: GLuint) void;
pub extern fn glDeleteShader(shader: GLuint) void;
pub extern fn glDeleteTextures(n: GLsizei, textures: [*c]const GLuint) void;
pub extern fn glDisable(cap: GLenum) void;
pub extern fn glDisableVertexAttribArray(index: GLuint) void;
pub extern fn glDrawArrays(mode: GLenum, first: GLint, count: GLsizei) void;
pub extern fn glEnable(cap: GLenum) void;
pub extern fn glEnableVertexAttribArray(index: GLuint) void;
pub extern fn glFinish() void;
pub extern fn glFramebufferTexture2D(target: GLenum, attachment: GLenum, textarget: GLenum, texture: GLuint, level: GLint) void;
pub extern fn glGenBuffers(n: GLsizei, buffers: [*c]GLuint) void;
pub extern fn glGenFramebuffers(n: GLsizei, framebuffers: [*c]GLuint) void;
pub extern fn glGenTextures(n: GLsizei, textures: [*c]GLuint) void;
pub extern fn glGetAttribLocation(program: GLuint, name: [*c]const GLchar) GLint;
pub extern fn glGetError() GLenum;
pub extern fn glGetIntegerv(pname: GLenum, data: [*c]GLint) void;
pub extern fn glGetProgramiv(program: GLuint, pname: GLenum, params: [*c]GLint) void;
pub extern fn glGetProgramInfoLog(program: GLuint, bufSize: GLsizei, length: [*c]GLsizei, infoLog: [*c]GLchar) void;
pub extern fn glGetShaderiv(shader: GLuint, pname: GLenum, params: [*c]GLint) void;
pub extern fn glGetShaderInfoLog(shader: GLuint, bufSize: GLsizei, length: [*c]GLsizei, infoLog: [*c]GLchar) void;
pub extern fn glGetString(name: GLenum) [*c]const GLubyte;
pub extern fn glGetUniformLocation(program: GLuint, name: [*c]const GLchar) GLint;
pub extern fn glLinkProgram(program: GLuint) void;
pub extern fn glPixelStorei(pname: GLenum, param: GLint) void;
pub extern fn glReadPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*anyopaque) void;
pub extern fn glScissor(x: GLint, y: GLint, width: GLsizei, height: GLsizei) void;
pub extern fn glShaderBinary(count: GLsizei, shaders: [*c]const GLuint, binaryFormat: GLenum, binary: ?*const anyopaque, length: GLsizei) void;
pub extern fn glShaderSource(shader: GLuint, count: GLsizei, string: [*c]const [*c]const GLchar, length: [*c]const GLint) void;
pub extern fn glTexImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, @"type": GLenum, pixels: ?*const anyopaque) void;
pub extern fn glTexParameteri(target: GLenum, pname: GLenum, param: GLint) void;
pub extern fn glTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const anyopaque) void;
pub extern fn glUniform1i(location: GLint, v0: GLint) void;
pub extern fn glUniform3f(location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat) void;
pub extern fn glUniform4f(location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat, v3: GLfloat) void;
pub extern fn glUniformMatrix3fv(location: GLint, count: GLsizei, transpose: GLboolean, value: [*c]const GLfloat) void;
pub extern fn glUniformMatrix4fv(location: GLint, count: GLsizei, transpose: GLboolean, value: [*c]const GLfloat) void;
pub extern fn glUseProgram(program: GLuint) void;
pub extern fn glVertexAttribPointer(index: GLuint, size: GLint, @"type": GLenum, normalized: GLboolean, stride: GLsizei, pointer: ?*const anyopaque) void;
pub extern fn glViewport(x: GLint, y: GLint, width: GLsizei, height: GLsizei) void;
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
pub const struct_SDL_VertexSolid = extern struct {
    position: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
pub const SDL_VertexSolid = struct_SDL_VertexSolid;
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
pub extern fn SDL_GetYCbCRtoRGBConversionMatrix(colorspace: SDL_Colorspace, w: c_int, h: c_int, bits_per_pixel: c_int) [*c]const f32;
pub const GLES2_SHADER_FRAGMENT_INCLUDE_UNDEF_PRECISION: c_int = 4;
pub const GLES2_ShaderIncludeType = c_uint;
pub const GLES2_SHADER_VERTEX_DEFAULT: c_int = 0;
pub const GLES2_SHADER_FRAGMENT_SOLID: c_int = 1;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST: c_int = 2;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR: c_int = 3;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART: c_int = 4;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST_COLORSWAP: c_int = 5;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR_COLORSWAP: c_int = 6;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART_COLORSWAP: c_int = 7;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_RGB: c_int = 8;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_RGB_PIXELART: c_int = 9;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_BGR: c_int = 10;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_BGR_PIXELART: c_int = 11;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ARGB: c_int = 12;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ARGB_PIXELART: c_int = 13;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ABGR: c_int = 14;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ABGR_PIXELART: c_int = 15;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_YUV: c_int = 16;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RA: c_int = 17;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RG: c_int = 18;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RA: c_int = 19;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RG: c_int = 20;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES: c_int = 21;
pub const GLES2_SHADER_COUNT: c_int = 22;
pub const GLES2_ShaderType = c_uint;
pub extern fn GLES2_GetShaderPrologue(@"type": GLES2_ShaderType) [*c]const u8;
pub extern fn GLES2_GetShaderInclude(@"type": GLES2_ShaderIncludeType) [*c]const u8;
pub extern fn GLES2_GetShader(@"type": GLES2_ShaderType) [*c]const u8;
pub extern fn GLES2_GetTexCoordPrecisionEnumFromHint() GLES2_ShaderIncludeType;
pub const GLES2_PaletteData = extern struct {
    texture: GLuint = 0,
};
pub const GLES2_TextureData = extern struct {
    texture: GLuint = 0,
    fbo: GLuint = 0,
    texture_external: bool = false,
    texture_type: GLenum = 0,
    pixel_format: GLenum = 0,
    pixel_type: GLenum = 0,
    pixel_data: ?*anyopaque = null,
    pitch: c_int = 0,
    yuv: bool = false,
    nv12: bool = false,
    texture_v: GLuint = 0,
    texture_v_external: GLuint = 0,
    texture_u: GLuint = 0,
    texture_u_external: GLuint = 0,
    texel_size: [4]GLfloat = @import("std").mem.zeroes([4]GLfloat),
    texture_scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
};
pub const GLES2_ATTRIBUTE_POSITION: c_int = 0;
pub const GLES2_ATTRIBUTE_COLOR: c_int = 1;
pub const GLES2_ATTRIBUTE_TEXCOORD: c_int = 2;
pub const GLES2_UNIFORM_PROJECTION: c_int = 0;
pub const GLES2_UNIFORM_TEXTURE: c_int = 1;
pub const GLES2_UNIFORM_TEXTURE_U: c_int = 2;
pub const GLES2_UNIFORM_TEXTURE_V: c_int = 3;
pub const GLES2_UNIFORM_PALETTE: c_int = 4;
pub const GLES2_UNIFORM_TEXEL_SIZE: c_int = 5;
pub const GLES2_UNIFORM_OFFSET: c_int = 6;
pub const GLES2_UNIFORM_MATRIX: c_int = 7;
pub const NUM_GLES2_UNIFORMS: c_int = 8;
pub var GLES2_UniformNames: [8][*c]const u8 = [8][*c]const u8{
    "u_projection",
    "u_texture",
    "u_texture_u",
    "u_texture_v",
    "u_palette",
    "u_texel_size",
    "u_offset",
    "u_matrix",
};
comptime {
    if (!((@sizeOf(@TypeOf(GLES2_UniformNames)) / @sizeOf(@TypeOf(GLES2_UniformNames[@as(c_int, 0)]))) == @as(c_ulong, NUM_GLES2_UNIFORMS))) @compileError("static assertion failed \"SDL_arraysize(GLES2_UniformNames) == NUM_GLES2_UNIFORMS\"");
}
pub const struct_GLES2_ProgramCacheEntry = extern struct {
    id: GLuint = 0,
    vertex_shader: GLuint = 0,
    fragment_shader: GLuint = 0,
    uniform_locations: [8]GLuint = @import("std").mem.zeroes([8]GLuint),
    projection: [4][4]GLfloat = @import("std").mem.zeroes([4][4]GLfloat),
    shader_params: [*c]f32 = null,
    prev: [*c]struct_GLES2_ProgramCacheEntry = null,
    next: [*c]struct_GLES2_ProgramCacheEntry = null,
};
pub const GLES2_ProgramCacheEntry = struct_GLES2_ProgramCacheEntry;
pub const struct_GLES2_ProgramCache = extern struct {
    count: c_int = 0,
    head: [*c]GLES2_ProgramCacheEntry = null,
    tail: [*c]GLES2_ProgramCacheEntry = null,
};
pub const GLES2_ProgramCache = struct_GLES2_ProgramCache;
pub const GLES2_IMAGESOURCE_SOLID: c_int = 1;
pub const GLES2_IMAGESOURCE_TEXTURE_INDEX8: c_int = 2;
pub const GLES2_IMAGESOURCE_TEXTURE_ABGR: c_int = 3;
pub const GLES2_IMAGESOURCE_TEXTURE_ARGB: c_int = 4;
pub const GLES2_IMAGESOURCE_TEXTURE_RGB: c_int = 5;
pub const GLES2_IMAGESOURCE_TEXTURE_BGR: c_int = 6;
pub const GLES2_IMAGESOURCE_TEXTURE_YUV: c_int = 7;
pub const GLES2_IMAGESOURCE_TEXTURE_NV12: c_int = 8;
pub const GLES2_IMAGESOURCE_TEXTURE_NV21: c_int = 9;
pub const GLES2_IMAGESOURCE_TEXTURE_EXTERNAL_OES: c_int = 10;
pub const GLES2_ImageSource = c_uint;
pub const GLES2_DrawStateCache = extern struct {
    viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    viewport_dirty: bool = false,
    texture: [*c]SDL_Texture = null,
    target: [*c]SDL_Texture = null,
    blend: SDL_BlendMode = 0,
    cliprect_enabled_dirty: bool = false,
    cliprect_enabled: bool = false,
    cliprect_dirty: bool = false,
    cliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    texturing: bool = false,
    texturing_dirty: bool = false,
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    clear_color_dirty: bool = false,
    drawablew: c_int = 0,
    drawableh: c_int = 0,
    program: [*c]GLES2_ProgramCacheEntry = null,
    shader_params: [*c]const f32 = null,
    projection: [4][4]GLfloat = @import("std").mem.zeroes([4][4]GLfloat),
};
pub const struct_GLES2_RenderData = extern struct {
    context: SDL_GLContext = null,
    debug_enabled: bool = false,
    GL_OES_EGL_image_external_supported: bool = false,
    GL_EXT_blend_minmax_supported: bool = false,
    glActiveTexture: ?*const fn (GLenum) callconv(.c) void = null,
    glAttachShader: ?*const fn (GLuint, GLuint) callconv(.c) void = null,
    glBindAttribLocation: ?*const fn (GLuint, GLuint, [*c]const u8) callconv(.c) void = null,
    glBindTexture: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glBlendEquationSeparate: ?*const fn (GLenum, GLenum) callconv(.c) void = null,
    glBlendFuncSeparate: ?*const fn (GLenum, GLenum, GLenum, GLenum) callconv(.c) void = null,
    glClear: ?*const fn (GLbitfield) callconv(.c) void = null,
    glClearColor: ?*const fn (GLclampf, GLclampf, GLclampf, GLclampf) callconv(.c) void = null,
    glCompileShader: ?*const fn (GLuint) callconv(.c) void = null,
    glCreateProgram: ?*const fn () callconv(.c) GLuint = null,
    glCreateShader: ?*const fn (GLenum) callconv(.c) GLuint = null,
    glDeleteProgram: ?*const fn (GLuint) callconv(.c) void = null,
    glDeleteShader: ?*const fn (GLuint) callconv(.c) void = null,
    glDeleteTextures: ?*const fn (GLsizei, [*c]const GLuint) callconv(.c) void = null,
    glDisable: ?*const fn (GLenum) callconv(.c) void = null,
    glDisableVertexAttribArray: ?*const fn (GLuint) callconv(.c) void = null,
    glDrawArrays: ?*const fn (GLenum, GLint, GLsizei) callconv(.c) void = null,
    glEnable: ?*const fn (GLenum) callconv(.c) void = null,
    glEnableVertexAttribArray: ?*const fn (GLuint) callconv(.c) void = null,
    glFinish: ?*const fn () callconv(.c) void = null,
    glGenFramebuffers: ?*const fn (GLsizei, [*c]GLuint) callconv(.c) void = null,
    glGenTextures: ?*const fn (GLsizei, [*c]GLuint) callconv(.c) void = null,
    glGetString: ?*const fn (GLenum) callconv(.c) [*c]const GLubyte = null,
    glGetError: ?*const fn () callconv(.c) GLenum = null,
    glGetIntegerv: ?*const fn (GLenum, [*c]GLint) callconv(.c) void = null,
    glGetProgramiv: ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.c) void = null,
    glGetShaderInfoLog: ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]u8) callconv(.c) void = null,
    glGetShaderiv: ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.c) void = null,
    glGetUniformLocation: ?*const fn (GLuint, [*c]const u8) callconv(.c) GLint = null,
    glLinkProgram: ?*const fn (GLuint) callconv(.c) void = null,
    glPixelStorei: ?*const fn (GLenum, GLint) callconv(.c) void = null,
    glReadPixels: ?*const fn (GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*GLvoid) callconv(.c) void = null,
    glScissor: ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.c) void = null,
    glShaderBinary: ?*const fn (GLsizei, [*c]const GLuint, GLenum, ?*const anyopaque, GLsizei) callconv(.c) void = null,
    glShaderSource: ?*const fn (GLuint, GLsizei, [*c]const [*c]const GLchar, [*c]const GLint) callconv(.c) void = null,
    glTexImage2D: ?*const fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const anyopaque) callconv(.c) void = null,
    glTexParameteri: ?*const fn (GLenum, GLenum, GLint) callconv(.c) void = null,
    glTexSubImage2D: ?*const fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*const GLvoid) callconv(.c) void = null,
    glUniform1i: ?*const fn (GLint, GLint) callconv(.c) void = null,
    glUniform3f: ?*const fn (GLint, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glUniform4f: ?*const fn (GLint, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glUniformMatrix3fv: ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.c) void = null,
    glUniformMatrix4fv: ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.c) void = null,
    glUseProgram: ?*const fn (GLuint) callconv(.c) void = null,
    glVertexAttribPointer: ?*const fn (GLuint, GLint, GLenum, GLboolean, GLsizei, ?*const anyopaque) callconv(.c) void = null,
    glViewport: ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.c) void = null,
    glBindFramebuffer: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glFramebufferTexture2D: ?*const fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.c) void = null,
    glCheckFramebufferStatus: ?*const fn (GLenum) callconv(.c) GLenum = null,
    glDeleteFramebuffers: ?*const fn (GLsizei, [*c]const GLuint) callconv(.c) void = null,
    glGetAttribLocation: ?*const fn (GLuint, [*c]const GLchar) callconv(.c) GLint = null,
    glGetProgramInfoLog: ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.c) void = null,
    glGenBuffers: ?*const fn (GLsizei, [*c]GLuint) callconv(.c) void = null,
    glDeleteBuffers: ?*const fn (GLsizei, [*c]const GLuint) callconv(.c) void = null,
    glBindBuffer: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glBufferData: ?*const fn (GLenum, GLsizeiptr, ?*const GLvoid, GLenum) callconv(.c) void = null,
    glBufferSubData: ?*const fn (GLenum, GLintptr, GLsizeiptr, ?*const GLvoid) callconv(.c) void = null,
    window_framebuffer: GLuint = 0,
    shader_id_cache: [22]GLuint = @import("std").mem.zeroes([22]GLuint),
    program_cache: GLES2_ProgramCache = @import("std").mem.zeroes(GLES2_ProgramCache),
    clear_r: Uint8 = 0,
    clear_g: Uint8 = 0,
    clear_b: Uint8 = 0,
    clear_a: Uint8 = 0,
    drawstate: GLES2_DrawStateCache = @import("std").mem.zeroes(GLES2_DrawStateCache),
    texcoord_precision_hint: GLES2_ShaderIncludeType = @import("std").mem.zeroes(GLES2_ShaderIncludeType),
};
pub const GLES2_RenderData = struct_GLES2_RenderData;
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
                return "UNKNOWN";
            },
            else => unreachable,
        }
    }
}
pub fn GL_ClearErrors(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (!data.*.debug_enabled) {
        return;
    }
    while (data.*.glGetError.?() != @as(GLenum, GL_NO_ERROR)) {}
}
pub fn GL_CheckAllErrors(arg_prefix: [*c]const u8, renderer: [*c]SDL_Renderer, file: [*c]const u8, line: c_int, function: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var prefix = arg_prefix;
    _ = &prefix;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var result: bool = @"true" != 0;
    _ = &result;
    if (!data.*.debug_enabled) {
        return @"true" != 0;
    }
    while (true) {
        var @"error": GLenum = data.*.glGetError.?();
        _ = &@"error";
        if (@"error" != @as(GLenum, GL_NO_ERROR)) {
            if (!(prefix != null) or (@as(c_int, prefix[@as(c_int, 0)]) == @as(c_int, '\x00'))) {
                prefix = "generic";
            }
            _ = SDL_SetError_REAL("%s: %s (%d): %s %s (0x%X)", prefix, file, line, function, GL_TranslateError(@"error"), @"error");
            result = @"false" != 0;
        } else {
            break;
        }
    }
    return result;
}
pub fn GLES2_LoadFunctions(data: [*c]GLES2_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    while (true) {
        data.*.glActiveTexture = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glActiveTexture"))));
        if (!(data.*.glActiveTexture != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glActiveTexture"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glAttachShader = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glAttachShader"))));
        if (!(data.*.glAttachShader != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glAttachShader"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindAttribLocation = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindAttribLocation"))));
        if (!(data.*.glBindAttribLocation != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindAttribLocation"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindTexture = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindTexture"))));
        if (!(data.*.glBindTexture != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindTexture"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendEquationSeparate = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendEquationSeparate"))));
        if (!(data.*.glBlendEquationSeparate != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBlendEquationSeparate"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendFuncSeparate = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendFuncSeparate"))));
        if (!(data.*.glBlendFuncSeparate != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBlendFuncSeparate"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glClear = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClear"))));
        if (!(data.*.glClear != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClear"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glClearColor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClearColor"))));
        if (!(data.*.glClearColor != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClearColor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glCompileShader = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCompileShader"))));
        if (!(data.*.glCompileShader != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glCompileShader"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glCreateProgram = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCreateProgram"))));
        if (!(data.*.glCreateProgram != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glCreateProgram"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glCreateShader = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCreateShader"))));
        if (!(data.*.glCreateShader != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glCreateShader"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteProgram = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteProgram"))));
        if (!(data.*.glDeleteProgram != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteProgram"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteShader = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteShader"))));
        if (!(data.*.glDeleteShader != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteShader"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteTextures"))));
        if (!(data.*.glDeleteTextures != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisable"))));
        if (!(data.*.glDisable != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisableVertexAttribArray = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisableVertexAttribArray"))));
        if (!(data.*.glDisableVertexAttribArray != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisableVertexAttribArray"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDrawArrays = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDrawArrays"))));
        if (!(data.*.glDrawArrays != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDrawArrays"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnable"))));
        if (!(data.*.glEnable != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnableVertexAttribArray = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnableVertexAttribArray"))));
        if (!(data.*.glEnableVertexAttribArray != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnableVertexAttribArray"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glFinish = SDL_GL_GetProcAddress_REAL("glFinish");
        if (!(data.*.glFinish != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glFinish"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGenFramebuffers = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenFramebuffers"))));
        if (!(data.*.glGenFramebuffers != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGenFramebuffers"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGenTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenTextures"))));
        if (!(data.*.glGenTextures != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGenTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetString = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetString"))));
        if (!(data.*.glGetString != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetString"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetError = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetError"))));
        if (!(data.*.glGetError != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetError"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetIntegerv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
        if (!(data.*.glGetIntegerv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetIntegerv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetProgramiv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetProgramiv"))));
        if (!(data.*.glGetProgramiv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetProgramiv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetShaderInfoLog = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetShaderInfoLog"))));
        if (!(data.*.glGetShaderInfoLog != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetShaderInfoLog"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetShaderiv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetShaderiv"))));
        if (!(data.*.glGetShaderiv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetShaderiv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetUniformLocation = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetUniformLocation"))));
        if (!(data.*.glGetUniformLocation != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetUniformLocation"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glLinkProgram = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glLinkProgram"))));
        if (!(data.*.glLinkProgram != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glLinkProgram"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glPixelStorei = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glPixelStorei"))));
        if (!(data.*.glPixelStorei != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glPixelStorei"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glReadPixels = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glReadPixels"))));
        if (!(data.*.glReadPixels != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glReadPixels"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glScissor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glScissor"))));
        if (!(data.*.glScissor != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glScissor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glShaderBinary = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glShaderBinary"))));
        if (!(data.*.glShaderBinary != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glShaderBinary"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glShaderSource = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glShaderSource"))));
        if (!(data.*.glShaderSource != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glShaderSource"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexImage2D"))));
        if (!(data.*.glTexImage2D != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexParameteri = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexParameteri"))));
        if (!(data.*.glTexParameteri != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexParameteri"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexSubImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexSubImage2D"))));
        if (!(data.*.glTexSubImage2D != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexSubImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUniform1i = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform1i"))));
        if (!(data.*.glUniform1i != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUniform1i"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUniform3f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform3f"))));
        if (!(data.*.glUniform3f != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUniform3f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUniform4f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform4f"))));
        if (!(data.*.glUniform4f != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUniform4f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUniformMatrix3fv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniformMatrix3fv"))));
        if (!(data.*.glUniformMatrix3fv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUniformMatrix3fv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUniformMatrix4fv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniformMatrix4fv"))));
        if (!(data.*.glUniformMatrix4fv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUniformMatrix4fv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glUseProgram = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUseProgram"))));
        if (!(data.*.glUseProgram != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glUseProgram"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glVertexAttribPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glVertexAttribPointer"))));
        if (!(data.*.glVertexAttribPointer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glVertexAttribPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glViewport = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glViewport"))));
        if (!(data.*.glViewport != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glViewport"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindFramebuffer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindFramebuffer"))));
        if (!(data.*.glBindFramebuffer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindFramebuffer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glFramebufferTexture2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glFramebufferTexture2D"))));
        if (!(data.*.glFramebufferTexture2D != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glFramebufferTexture2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glCheckFramebufferStatus = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCheckFramebufferStatus"))));
        if (!(data.*.glCheckFramebufferStatus != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glCheckFramebufferStatus"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteFramebuffers = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteFramebuffers"))));
        if (!(data.*.glDeleteFramebuffers != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteFramebuffers"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetAttribLocation = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetAttribLocation"))));
        if (!(data.*.glGetAttribLocation != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetAttribLocation"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetProgramInfoLog = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetProgramInfoLog"))));
        if (!(data.*.glGetProgramInfoLog != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetProgramInfoLog"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGenBuffers = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenBuffers"))));
        if (!(data.*.glGenBuffers != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGenBuffers"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteBuffers = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteBuffers"))));
        if (!(data.*.glDeleteBuffers != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteBuffers"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindBuffer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindBuffer"))));
        if (!(data.*.glBindBuffer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindBuffer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBufferData = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBufferData"))));
        if (!(data.*.glBufferData != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBufferData"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBufferSubData = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBufferSubData"))));
        if (!(data.*.glBufferSubData != null)) {
            return SDL_SetError_REAL("Couldn't load GLES2 function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBufferSubData"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    return @"true" != 0;
}
pub fn GLES2_ActivateRenderer(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (SDL_GL_GetCurrentContext_REAL() != data.*.context) {
        data.*.drawstate.program = null;
        if (!SDL_GL_MakeCurrent_REAL(renderer.*.window, data.*.context)) {
            return @"false" != 0;
        }
    }
    GL_ClearErrors(renderer);
    return @"true" != 0;
}
pub fn GLES2_WindowEvent(renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_MINIMIZED)) {
        data.*.glFinish.?();
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
                return GL_MIN_EXT;
            },
            6 => {
                return GL_MAX_EXT;
            },
            7 => {
                return GL_INVALID_ENUM;
            },
            else => unreachable,
        }
    }
}
pub fn GLES2_SupportsBlendMode(renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
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
    if ((colorOperation == @as(SDL_BlendOperation, SDL_BLENDOPERATION_MINIMUM)) and !data.*.GL_EXT_blend_minmax_supported) {
        return @"false" != 0;
    }
    if ((colorOperation == @as(SDL_BlendOperation, SDL_BLENDOPERATION_MAXIMUM)) and !data.*.GL_EXT_blend_minmax_supported) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn GLES2_CacheProgram(data: [*c]GLES2_RenderData, vertex: GLuint, fragment: GLuint) callconv(.c) [*c]GLES2_ProgramCacheEntry {
    @setEvalBranchQuota(100000);
    var entry: [*c]GLES2_ProgramCacheEntry = undefined;
    _ = &entry;
    var linkSuccessful: GLint = undefined;
    _ = &linkSuccessful;
    var i: c_int = undefined;
    _ = &i;
    entry = data.*.program_cache.head;
    while (entry != null) {
        if ((entry.*.vertex_shader == vertex) and (entry.*.fragment_shader == fragment)) {
            break;
        }
        entry = entry.*.next;
    }
    if (entry != null) {
        if (data.*.program_cache.head != entry) {
            if (entry.*.next != null) {
                entry.*.next.*.prev = entry.*.prev;
            }
            if (entry.*.prev != null) {
                entry.*.prev.*.next = entry.*.next;
            }
            entry.*.prev = null;
            entry.*.next = data.*.program_cache.head;
            data.*.program_cache.head.*.prev = entry;
            data.*.program_cache.head = entry;
        }
        return entry;
    }
    entry = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(GLES2_ProgramCacheEntry))));
    if (!(entry != null)) {
        return null;
    }
    entry.*.vertex_shader = vertex;
    entry.*.fragment_shader = fragment;
    entry.*.id = data.*.glCreateProgram.?();
    data.*.glAttachShader.?(entry.*.id, vertex);
    data.*.glAttachShader.?(entry.*.id, fragment);
    data.*.glBindAttribLocation.?(entry.*.id, GLES2_ATTRIBUTE_POSITION, "a_position");
    data.*.glBindAttribLocation.?(entry.*.id, GLES2_ATTRIBUTE_COLOR, "a_color");
    data.*.glBindAttribLocation.?(entry.*.id, GLES2_ATTRIBUTE_TEXCOORD, "a_texCoord");
    data.*.glLinkProgram.?(entry.*.id);
    data.*.glGetProgramiv.?(entry.*.id, GL_LINK_STATUS, &linkSuccessful);
    if (!(linkSuccessful != 0)) {
        data.*.glDeleteProgram.?(entry.*.id);
        SDL_free_REAL(@ptrCast(@alignCast(entry.*.shader_params)));
        SDL_free_REAL(@ptrCast(@alignCast(entry)));
        _ = SDL_SetError_REAL("Failed to link shader program");
        return null;
    }
    {
        i = 0;
        while (i < NUM_GLES2_UNIFORMS) : (i += 1) {
            entry.*.uniform_locations[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(c_int, data.*.glGetUniformLocation.?(entry.*.id, GLES2_UniformNames[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    data.*.glUseProgram.?(entry.*.id);
    if (entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE_V] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        data.*.glUniform1i.?(@bitCast(@as(c_uint, @truncate(entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE_V]))), 2);
    }
    if (entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE_U] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        data.*.glUniform1i.?(@bitCast(@as(c_uint, @truncate(entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE_U]))), 1);
    }
    if (entry.*.uniform_locations[GLES2_UNIFORM_PALETTE] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        data.*.glUniform1i.?(@bitCast(@as(c_uint, @truncate(entry.*.uniform_locations[GLES2_UNIFORM_PALETTE]))), 1);
    }
    if (entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        data.*.glUniform1i.?(@bitCast(@as(c_uint, @truncate(entry.*.uniform_locations[GLES2_UNIFORM_TEXTURE]))), 0);
    }
    if (entry.*.uniform_locations[GLES2_UNIFORM_PROJECTION] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        data.*.glUniformMatrix4fv.?(@bitCast(@as(c_uint, @truncate(entry.*.uniform_locations[GLES2_UNIFORM_PROJECTION]))), 1, GL_FALSE, @ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&entry.*.projection))))));
    }
    if (data.*.program_cache.head != null) {
        entry.*.next = data.*.program_cache.head;
        data.*.program_cache.head.*.prev = entry;
    } else {
        data.*.program_cache.tail = entry;
    }
    data.*.program_cache.head = entry;
    data.*.program_cache.count += 1;
    if (data.*.program_cache.count > GLES2_MAX_CACHED_PROGRAMS) {
        var oldest: [*c]GLES2_ProgramCacheEntry = data.*.program_cache.tail;
        _ = &oldest;
        data.*.program_cache.tail = oldest.*.prev;
        data.*.glDeleteProgram.?(oldest.*.id);
        SDL_free_REAL(@ptrCast(@alignCast(oldest.*.shader_params)));
        SDL_free_REAL(@ptrCast(@alignCast(oldest)));
        data.*.program_cache.count -= 1;
    }
    return entry;
}
pub fn GLES2_CacheShader(data: [*c]GLES2_RenderData, arg_type: GLES2_ShaderType, shader_type: GLenum) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "GLES2_CacheShader".*;
    };
    _ = &static_local___func__;
    var id: GLuint = 0;
    _ = &id;
    var compileSuccessful: GLint = GL_FALSE;
    _ = &compileSuccessful;
    var attempt: c_int = undefined;
    _ = &attempt;
    var num_src: c_int = undefined;
    _ = &num_src;
    var shader_src_list: [4][*c]const GLchar = undefined;
    _ = &shader_src_list;
    var shader_body: [*c]const GLchar = GLES2_GetShader(@"type");
    _ = &shader_body;
    if (!(shader_body != null)) {
        return SDL_SetError_REAL("No shader body src");
    }
    {
        attempt = 0;
        while ((attempt < @as(c_int, 2)) and !(compileSuccessful != 0)) : (attempt += 1) {
            num_src = 0;
            shader_src_list[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &num_src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = GLES2_GetShaderPrologue(@"type");
            if (shader_type == @as(GLenum, GL_FRAGMENT_SHADER)) {
                if (attempt == @as(c_int, 0)) {
                    shader_src_list[
                        @bitCast(@as(isize, @intCast(blk: {
                            const ref = &num_src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        })))
                    ] = GLES2_GetShaderInclude(data.*.texcoord_precision_hint);
                } else {
                    shader_src_list[
                        @bitCast(@as(isize, @intCast(blk: {
                            const ref = &num_src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        })))
                    ] = GLES2_GetShaderInclude(GLES2_SHADER_FRAGMENT_INCLUDE_UNDEF_PRECISION);
                }
            }
            shader_src_list[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &num_src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = shader_body;
            while (true) {
                while (!(@as(c_ulong, @bitCast(@as(c_long, num_src))) <= (@sizeOf(@TypeOf(shader_src_list)) / @sizeOf(@TypeOf(shader_src_list[@as(c_int, 0)]))))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "num_src <= (sizeof(shader_src_list)/sizeof(shader_src_list[0]))",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 525);
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
            id = data.*.glCreateShader.?(shader_type);
            data.*.glShaderSource.?(id, num_src, @ptrCast(@alignCast(&shader_src_list)), null);
            data.*.glCompileShader.?(id);
            data.*.glGetShaderiv.?(id, GL_COMPILE_STATUS, &compileSuccessful);
        }
    }
    if (!(compileSuccessful != 0)) {
        var info: [*c]u8 = null;
        _ = &info;
        var length: c_int = 0;
        _ = &length;
        data.*.glGetShaderiv.?(id, GL_INFO_LOG_LENGTH, &length);
        if (length > @as(c_int, 0)) {
            info = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, length)))));
            if (info != null) {
                data.*.glGetShaderInfoLog.?(id, length, &length, info);
            }
        }
        if (info != null) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "Failed to load the shader %d: %s", @"type", info);
            SDL_free_REAL(@ptrCast(@alignCast(info)));
        } else {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "Failed to load the shader %d", @"type");
        }
        data.*.glDeleteShader.?(id);
        return SDL_SetError_REAL("Failed to load the shader %d", @"type");
    }
    data.*.shader_id_cache[@"type"] = id;
    return @"true" != 0;
}
pub fn GLES2_CacheShaders(data: [*c]GLES2_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var shader: c_int = undefined;
    _ = &shader;
    data.*.texcoord_precision_hint = GLES2_GetTexCoordPrecisionEnumFromHint();
    {
        shader = 0;
        while (shader < GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES) : (shader += 1) {
            var shader_type: GLenum = undefined;
            _ = &shader_type;
            if (shader == GLES2_SHADER_VERTEX_DEFAULT) {
                shader_type = GL_VERTEX_SHADER;
            } else {
                shader_type = GL_FRAGMENT_SHADER;
            }
            if (!GLES2_CacheShader(data, @bitCast(shader), shader_type)) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn GLES2_SelectProgram(data: [*c]GLES2_RenderData, texture: [*c]SDL_Texture, source: GLES2_ImageSource, scale_mode: SDL_ScaleMode, colorspace: SDL_Colorspace) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GLES2_SelectProgram".*;
    };
    _ = &static_local___func__;
    var vertex: GLuint = undefined;
    _ = &vertex;
    var fragment: GLuint = undefined;
    _ = &fragment;
    var vtype: GLES2_ShaderType = undefined;
    _ = &vtype;
    var ftype: GLES2_ShaderType = undefined;
    _ = &ftype;
    var program: [*c]GLES2_ProgramCacheEntry = undefined;
    _ = &program;
    var tdata: [*c]GLES2_TextureData = undefined;
    _ = &tdata;
    var colorswap: bool = undefined;
    _ = &colorswap;
    var shader_params: [*c]const f32 = undefined;
    _ = &shader_params;
    var shader_params_len: c_int = undefined;
    _ = &shader_params_len;
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
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unknown image source\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    const static_local_sdl_assert_data_3 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!shader_params || shader_params_len > 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_3;
    var sdl_assert_state_4: SDL_AssertState = undefined;
    _ = &sdl_assert_state_4;
    var matrix: [9]GLfloat = undefined;
    _ = &matrix;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                tdata = @ptrCast(@alignCast(if (texture != null) @as(?*anyopaque, @ptrCast(@alignCast(@as([*c]GLES2_TextureData, @ptrCast(@alignCast(texture.*.internal)))))) else @as(?*anyopaque, null)));
                colorswap = (data.*.drawstate.target != null) and ((data.*.drawstate.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) or (data.*.drawstate.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32)));
                shader_params = null;
                shader_params_len = 0;
                vtype = GLES2_SHADER_VERTEX_DEFAULT;
                switch (source) {
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_SOLID) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_INDEX8) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_ABGR) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_ARGB) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_RGB) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_BGR) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_YUV) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_NV12) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_NV21) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(GLES2_ImageSource, GLES2_IMAGESOURCE_TEXTURE_EXTERNAL_OES) => {
                        sdl_pc = 65;
                        continue;
                    },
                    else => {
                        sdl_pc = 66;
                        continue;
                    },
                }
            },
            1 => {
                data.*.drawstate.program = null;
                return @"false" != 0;
            },
            2 => {
                vertex = data.*.shader_id_cache[vtype];
                if (!(vertex != 0)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            3 => {
                ftype = GLES2_SHADER_FRAGMENT_SOLID;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            4 => {
                switch (scale_mode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            6 => {
                if (colorswap) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST_COLORSWAP;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST;
                {
                    sdl_pc = 9;
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
                if (colorswap) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR_COLORSWAP;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            14 => {
                if (colorswap) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART_COLORSWAP;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 5;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            22 => {
                if (!!(@intFromPtr("Unknown scale mode") != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 645);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 30;
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
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                if (scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_ABGR_PIXELART;
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_ABGR;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            35 => {
                if (scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_ARGB_PIXELART;
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_ARGB;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            39 => {
                if (scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_RGB_PIXELART;
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_RGB;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            43 => {
                if (scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_BGR_PIXELART;
                shader_params = @ptrCast(@alignCast(&tdata.*.texel_size));
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_BGR;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            47 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_YUV;
                shader_params = SDL_GetYCbCRtoRGBConversionMatrix(colorspace, 0, 0, 8);
                if (!(shader_params != null)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                _ = SDL_SetError_REAL("Unsupported YUV colorspace");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 16) *% @sizeOf(f32))));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            51 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_OPENGL_NV12_RG_SHADER", @"false" != 0)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RG;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RA;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                shader_params = SDL_GetYCbCRtoRGBConversionMatrix(colorspace, 0, 0, 8);
                if (!(shader_params != null)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                _ = SDL_SetError_REAL("Unsupported YUV colorspace");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 16) *% @sizeOf(f32))));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            58 => {
                if (SDL_GetHintBoolean_REAL("SDL_RENDER_OPENGL_NV12_RG_SHADER", @"false" != 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RG;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RA;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                shader_params = SDL_GetYCbCRtoRGBConversionMatrix(colorspace, 0, 0, 8);
                if (!(shader_params != null)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                _ = SDL_SetError_REAL("Unsupported YUV colorspace");
                {
                    sdl_pc = 1;
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
                shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 16) *% @sizeOf(f32))));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            65 => {
                ftype = GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES;
                {
                    sdl_pc = 2;
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
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            70 => {
                if (!!(@intFromPtr("Unknown image source") != 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 724);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
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
                vertex = @intFromBool(GLES2_CacheShader(data, vtype, GL_VERTEX_SHADER));
                if (!(vertex != 0)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                fragment = data.*.shader_id_cache[ftype];
                if (!(fragment != 0)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            85 => {
                fragment = @intFromBool(GLES2_CacheShader(data, ftype, GL_FRAGMENT_SHADER));
                if (!(fragment != 0)) {
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
                if ((((data.*.drawstate.program != null) and (data.*.drawstate.program.*.vertex_shader == vertex)) and (data.*.drawstate.program.*.fragment_shader == fragment)) and (!(shader_params != null) or ((data.*.drawstate.program.*.shader_params != null) and (SDL_memcmp_REAL(@ptrCast(@alignCast(shader_params)), @ptrCast(@alignCast(data.*.drawstate.program.*.shader_params)), @bitCast(@as(c_long, shader_params_len))) == @as(c_int, 0))))) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 1;
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
                return @"true" != 0;
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                program = GLES2_CacheProgram(data, vertex, fragment);
                if (!(program != null)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 1;
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
                data.*.glUseProgram.?(program.*.id);
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            98 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                if ((shader_params != null) and (!(program.*.shader_params != null) or (SDL_memcmp_REAL(@ptrCast(@alignCast(shader_params)), @ptrCast(@alignCast(program.*.shader_params)), @bitCast(@as(c_long, shader_params_len))) != @as(c_int, 0)))) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            100 => {
                if (!(!(shader_params != null) or (shader_params_len > @as(c_int, 0)))) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                sdl_assert_state_4 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_3.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 764);
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            104 => {
                if (sdl_assert_state_4 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
                {
                    sdl_pc = 108;
                    continue;
                }
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
                if (ftype >= @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_YUV)) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                data.*.drawstate.program = program;
                return @"true" != 0;
            },
            112 => {
                if (program.*.uniform_locations[GLES2_UNIFORM_OFFSET] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            113 => {
                data.*.glUniform4f.?(@bitCast(@as(c_uint, @truncate(program.*.uniform_locations[GLES2_UNIFORM_TEXEL_SIZE]))), shader_params[@as(c_int, 0)], shader_params[@as(c_int, 1)], shader_params[@as(c_int, 2)], shader_params[@as(c_int, 3)]);
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                if (!(program.*.shader_params != null)) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            115 => {
                data.*.glUniform3f.?(@bitCast(@as(c_uint, @truncate(program.*.uniform_locations[GLES2_UNIFORM_OFFSET]))), shader_params[@as(c_int, 0)], shader_params[@as(c_int, 1)], shader_params[@as(c_int, 2)]);
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                if (program.*.uniform_locations[GLES2_UNIFORM_MATRIX] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 0)] = shader_params[@as(c_int, 4)];
                matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 1)] = shader_params[@as(c_int, 5)];
                matrix[(@as(c_int, 0) * @as(c_int, 3)) + @as(c_int, 2)] = shader_params[@as(c_int, 6)];
                matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 0)] = shader_params[@as(c_int, 8)];
                matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 1)] = shader_params[@as(c_int, 9)];
                matrix[(@as(c_int, 1) * @as(c_int, 3)) + @as(c_int, 2)] = shader_params[@as(c_int, 10)];
                matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 0)] = shader_params[@as(c_int, 12)];
                matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 1)] = shader_params[@as(c_int, 13)];
                matrix[(@as(c_int, 2) * @as(c_int, 3)) + @as(c_int, 2)] = shader_params[@as(c_int, 14)];
                data.*.glUniformMatrix3fv.?(@bitCast(@as(c_uint, @truncate(program.*.uniform_locations[GLES2_UNIFORM_MATRIX]))), 1, GL_FALSE, @ptrCast(@alignCast(&matrix)));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            121 => {
                program.*.shader_params = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, shader_params_len)))));
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                if (program.*.shader_params != null) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                _ = memcpy(@ptrCast(@alignCast(program.*.shader_params)), @ptrCast(@alignCast(shader_params)), @bitCast(@as(c_long, shader_params_len)));
                {
                    sdl_pc = 126;
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
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GLES2_QueueNoOp(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GLES2_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const colorswap: bool = (renderer.*.target != null) and ((renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) or (renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32)));
    _ = &colorswap;
    var verts: [*c]SDL_VertexSolid = undefined;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(@TypeOf(verts.*)), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var i: c_int = undefined;
    _ = &i;
    var color: SDL_FColor = cmd.*.data.draw.color;
    _ = &color;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    color.r *= color_scale;
    color.g *= color_scale;
    color.b *= color_scale;
    if (colorswap) {
        var r: f32 = color.r;
        _ = &r;
        color.r = color.b;
        color.b = r;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    {
        i = 0;
        while (i < count) : (i += 1) {
            verts.*.position.x = @as(f32, 0.5) + points[@bitCast(@as(isize, @intCast(i)))].x;
            verts.*.position.y = @as(f32, 0.5) + points[@bitCast(@as(isize, @intCast(i)))].y;
            verts.*.color = color;
            verts += 1;
        }
    }
    return @"true" != 0;
}
pub fn GLES2_QueueDrawLines(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const colorswap: bool = (renderer.*.target != null) and ((renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) or (renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32)));
    _ = &colorswap;
    var i: c_int = undefined;
    _ = &i;
    var prevx: GLfloat = undefined;
    _ = &prevx;
    var prevy: GLfloat = undefined;
    _ = &prevy;
    var verts: [*c]SDL_VertexSolid = undefined;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(@TypeOf(verts.*)), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var color: SDL_FColor = cmd.*.data.draw.color;
    _ = &color;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    color.r *= color_scale;
    color.g *= color_scale;
    color.b *= color_scale;
    if (colorswap) {
        var r: f32 = color.r;
        _ = &r;
        color.r = color.b;
        color.b = r;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    prevx = @as(f32, 0.5) + points.*.x;
    prevy = @as(f32, 0.5) + points.*.y;
    verts.*.position.x = prevx;
    verts.*.position.y = prevy;
    verts.*.color = color;
    verts += 1;
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
            verts.*.position.x = prevx;
            verts.*.position.y = prevy;
            verts.*.color = color;
            verts += 1;
        }
    }
    return @"true" != 0;
}
pub fn GLES2_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    const colorswap: bool = (renderer.*.target != null) and ((renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) or (renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32)));
    _ = &colorswap;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    size_indices = if (indices != null) size_indices else @as(c_int, 0);
    if (texture != null) {
        var verts: [*c]SDL_Vertex = undefined;
        verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(@TypeOf(verts.*)), 0, &cmd.*.data.draw.first)));
        _ = &verts;
        if (!(verts != null)) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                var j: c_int = undefined;
                _ = &j;
                var xy_: [*c]f32 = undefined;
                _ = &xy_;
                var col_: SDL_FColor = undefined;
                _ = &col_;
                var uv_: [*c]f32 = undefined;
                _ = &uv_;
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
                col_ = @as([*c]SDL_FColor, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))))).*;
                uv_ = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(uv)))) + @as(usize, @bitCast(@as(isize, @intCast(j * uv_stride))))));
                verts.*.position.x = xy_[@as(c_int, 0)] * scale_x;
                verts.*.position.y = xy_[@as(c_int, 1)] * scale_y;
                col_.r *= color_scale;
                col_.g *= color_scale;
                col_.b *= color_scale;
                if (colorswap) {
                    var r: f32 = col_.r;
                    _ = &r;
                    col_.r = col_.b;
                    col_.b = r;
                }
                verts.*.color = col_;
                verts.*.tex_coord.x = uv_[@as(c_int, 0)];
                verts.*.tex_coord.y = uv_[@as(c_int, 1)];
                verts += 1;
            }
        }
    } else {
        var verts: [*c]SDL_VertexSolid = undefined;
        verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(@TypeOf(verts.*)), 0, &cmd.*.data.draw.first)));
        _ = &verts;
        if (!(verts != null)) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                var j: c_int = undefined;
                _ = &j;
                var xy_: [*c]f32 = undefined;
                _ = &xy_;
                var col_: SDL_FColor = undefined;
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
                col_ = @as([*c]SDL_FColor, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))))).*;
                verts.*.position.x = xy_[@as(c_int, 0)] * scale_x;
                verts.*.position.y = xy_[@as(c_int, 1)] * scale_y;
                col_.r *= color_scale;
                col_.g *= color_scale;
                col_.b *= color_scale;
                if (colorswap) {
                    var r: f32 = col_.r;
                    _ = &r;
                    col_.r = col_.b;
                    col_.b = r;
                }
                verts.*.color = col_;
                verts += 1;
            }
        }
    }
    return @"true" != 0;
}
pub fn SetDrawState(data: [*c]GLES2_RenderData, cmd: [*c]const SDL_RenderCommand, imgsrc: GLES2_ImageSource, vertices: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &imgsrc;
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SetDrawState".*;
    };
    _ = &static_local___func__;
    var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
    _ = &texture;
    const blend: SDL_BlendMode = cmd.*.data.draw.blend;
    _ = &blend;
    var program: [*c]GLES2_ProgramCacheEntry = undefined;
    _ = &program;
    var stride: c_int = undefined;
    _ = &stride;
    while (true) {
        while (!(@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(texture))) != @as(?*anyopaque, null)) == @intFromBool(imgsrc != @as(GLES2_ImageSource, GLES2_IMAGESOURCE_SOLID)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(texture != ((void*)0)) == (imgsrc != GLES2_IMAGESOURCE_SOLID)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 1016);
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
    if (data.*.drawstate.viewport_dirty) {
        var viewport: [*c]const SDL_Rect = &data.*.drawstate.viewport;
        _ = &viewport;
        data.*.glViewport.?(viewport.*.x, if (data.*.drawstate.target != null) viewport.*.y else (data.*.drawstate.drawableh - viewport.*.y) - viewport.*.h, viewport.*.w, viewport.*.h);
        if ((viewport.*.w != 0) and (viewport.*.h != 0)) {
            data.*.drawstate.projection[@as(c_int, 0)][@as(c_int, 0)] = @as(f32, 2.0) / @as(f32, @floatFromInt(viewport.*.w));
            data.*.drawstate.projection[@as(c_int, 1)][@as(c_int, 1)] = (if (data.*.drawstate.target != null) @as(f32, 2.0) else -@as(f32, 2.0)) / @as(f32, @floatFromInt(viewport.*.h));
            data.*.drawstate.projection[@as(c_int, 3)][@as(c_int, 1)] = if (data.*.drawstate.target != null) -@as(f32, 1.0) else @as(f32, 1.0);
        }
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
    if (data.*.drawstate.texturing_dirty or (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(texture))) != @as(?*anyopaque, null)) != @as(c_int, @intFromBool(data.*.drawstate.texturing)))) {
        if (!(texture != null)) {
            data.*.glDisableVertexAttribArray.?(@bitCast(@as(c_int, GLES2_ATTRIBUTE_TEXCOORD)));
            data.*.drawstate.texturing = @"false" != 0;
        } else {
            data.*.glEnableVertexAttribArray.?(@bitCast(@as(c_int, GLES2_ATTRIBUTE_TEXCOORD)));
            data.*.drawstate.texturing = @"true" != 0;
        }
        data.*.drawstate.texturing_dirty = @"false" != 0;
    }
    if (texture != null) {
        stride = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_Vertex))));
    } else {
        stride = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_VertexSolid))));
    }
    if (texture != null) {
        var base: usize = @as(usize, @intCast(@intFromPtr(vertices))) +% cmd.*.data.draw.first;
        _ = &base;
        data.*.glVertexAttribPointer.?(GLES2_ATTRIBUTE_TEXCOORD, 2, GL_FLOAT, GL_FALSE, stride, @ptrFromInt(base +% @intFromPtr(&@as(*allowzero SDL_Vertex, @ptrFromInt(0)).tex_coord)));
    }
    var colorspace: SDL_Colorspace = if (texture != null) texture.*.colorspace else @as(SDL_Colorspace, SDL_COLORSPACE_SRGB);
    _ = &colorspace;
    if (!GLES2_SelectProgram(data, texture, imgsrc, cmd.*.data.draw.texture_scale_mode, colorspace)) {
        return @"false" != 0;
    }
    program = data.*.drawstate.program;
    if (program.*.uniform_locations[GLES2_UNIFORM_PROJECTION] != @as(GLuint, @bitCast(@as(c_int, -@as(c_int, 1))))) {
        if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&program.*.projection))))), @ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&data.*.drawstate.projection))))), @sizeOf(@TypeOf(data.*.drawstate.projection))) != @as(c_int, 0)) {
            data.*.glUniformMatrix4fv.?(@bitCast(@as(c_uint, @truncate(program.*.uniform_locations[GLES2_UNIFORM_PROJECTION]))), 1, GL_FALSE, @ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&data.*.drawstate.projection))))));
            _ = memcpy(@ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&program.*.projection))))), @ptrCast(@alignCast(@as([*c][4]GLfloat, @ptrCast(@alignCast(&data.*.drawstate.projection))))), @sizeOf(@TypeOf(data.*.drawstate.projection)));
        }
    }
    if (blend != data.*.drawstate.blend) {
        if (blend == SDL_BLENDMODE_NONE) {
            data.*.glDisable.?(GL_BLEND);
        } else {
            data.*.glEnable.?(GL_BLEND);
            data.*.glBlendFuncSeparate.?(GetBlendFunc(SDL_GetBlendModeSrcColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeSrcAlphaFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstAlphaFactor(blend)));
            data.*.glBlendEquationSeparate.?(GetBlendEquation(SDL_GetBlendModeColorOperation(blend)), GetBlendEquation(SDL_GetBlendModeAlphaOperation(blend)));
        }
        data.*.drawstate.blend = blend;
    }
    {
        var base: usize = @as(usize, @intCast(@intFromPtr(vertices))) +% cmd.*.data.draw.first;
        _ = &base;
        data.*.glVertexAttribPointer.?(GLES2_ATTRIBUTE_POSITION, 2, GL_FLOAT, GL_FALSE, stride, @ptrFromInt(base +% @intFromPtr(&@as(*allowzero SDL_VertexSolid, @ptrFromInt(0)).position)));
        data.*.glVertexAttribPointer.?(GLES2_ATTRIBUTE_COLOR, 4, GL_FLOAT, GL_TRUE, stride, @ptrFromInt(base +% @intFromPtr(&@as(*allowzero SDL_VertexSolid, @ptrFromInt(0)).color)));
    }
    return @"true" != 0;
}
pub fn SetTextureScaleMode(data: [*c]GLES2_RenderData, textype: GLenum, format: SDL_PixelFormat, scaleMode: SDL_ScaleMode) callconv(.c) bool {
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
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
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
                if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
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
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
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
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles2.c", 1156);
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
pub fn SetTextureAddressMode(data: [*c]GLES2_RenderData, textype: GLenum, addressModeU: SDL_TextureAddressMode, addressModeV: SDL_TextureAddressMode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_S, TranslateAddressMode(addressModeU));
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_T, TranslateAddressMode(addressModeV));
}
pub fn SetCopyState(renderer: [*c]SDL_Renderer, cmd: [*c]const SDL_RenderCommand, vertices: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = undefined;
    _ = &data;
    var sourceType: GLES2_ImageSource = undefined;
    _ = &sourceType;
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var tdata: [*c]GLES2_TextureData = undefined;
    _ = &tdata;
    var ret: c_int = undefined;
    _ = &ret;
    var palette: [*c]GLES2_PaletteData = undefined;
    _ = &palette;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = @ptrCast(@alignCast(renderer.*.internal));
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ABGR;
                texture = cmd.*.data.draw.texture;
                tdata = @ptrCast(@alignCast(texture.*.internal));
                if (renderer.*.target != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (renderer.*.target.*.format != texture.*.format) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES) => {
                        sdl_pc = 51;
                        continue;
                    },
                    else => {
                        sdl_pc = 52;
                        continue;
                    },
                }
            },
            3 => {
                ret = @intFromBool(SetDrawState(data, cmd, sourceType, vertices));
                if (texture != data.*.drawstate.texture) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            4 => {
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            5 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ABGR;
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_INDEX8;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                switch (renderer.*.target.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 7;
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
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ABGR;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                switch (renderer.*.target.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            16 => {
                {
                    sdl_pc = 7;
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
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ABGR;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                switch (renderer.*.target.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            22 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            23 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_BGR;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 22;
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
                switch (renderer.*.target.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            28 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            29 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_BGR;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            30 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_RGB;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 28;
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
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_YUV;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            36 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_NV12;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            37 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_NV21;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            38 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_EXTERNAL_OES;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            39 => {
                return SDL_SetError_REAL("Unsupported texture format");
            },
            40 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            41 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_INDEX8;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            42 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ARGB;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_ABGR;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_RGB;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_BGR;
                {
                    sdl_pc = 40;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_YUV;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            49 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_NV12;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            50 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_NV21;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            51 => {
                sourceType = GLES2_IMAGESOURCE_TEXTURE_EXTERNAL_OES;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            52 => {
                return SDL_SetError_REAL("Unsupported texture format");
            },
            53 => {
                if (tdata.*.yuv) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
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
                if (cmd.*.data.draw.texture_scale_mode != tdata.*.texture_scale_mode) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            56 => {
                data.*.glActiveTexture.?(GL_TEXTURE2);
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
                data.*.glActiveTexture.?(GL_TEXTURE1);
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                if (tdata.*.nv12) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                if (texture.*.palette != null) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            59 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
                data.*.glActiveTexture.?(GL_TEXTURE0);
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
                palette = @ptrCast(@alignCast(texture.*.palette.*.internal));
                data.*.glActiveTexture.?(GL_TEXTURE1);
                data.*.glBindTexture.?(tdata.*.texture_type, palette.*.texture);
                data.*.glActiveTexture.?(GL_TEXTURE0);
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
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture);
                data.*.drawstate.texture = texture;
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            65 => {
                if (tdata.*.yuv) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
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
                if ((cmd.*.data.draw.texture_address_mode_u != tdata.*.texture_address_mode_u) or (cmd.*.data.draw.texture_address_mode_v != tdata.*.texture_address_mode_v)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            68 => {
                data.*.glActiveTexture.?(GL_TEXTURE2);
                if (!SetTextureScaleMode(data, tdata.*.texture_type, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                if (tdata.*.nv12) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            70 => {
                if (texture.*.palette != null) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            71 => {
                return @"false" != 0;
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, tdata.*.texture_type, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                return @"false" != 0;
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            77 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, tdata.*.texture_type, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
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
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            80 => {
                return @"false" != 0;
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            83 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                if (!SetTextureScaleMode(data, tdata.*.texture_type, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (!SetTextureScaleMode(data, tdata.*.texture_type, texture.*.format, cmd.*.data.draw.texture_scale_mode)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            86 => {
                return @"false" != 0;
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                return @"false" != 0;
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                tdata.*.texture_scale_mode = cmd.*.data.draw.texture_scale_mode;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            92 => {
                if (tdata.*.yuv) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
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
                return ret != 0;
            },
            95 => {
                data.*.glActiveTexture.?(GL_TEXTURE2);
                SetTextureAddressMode(data, tdata.*.texture_type, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTexture.?(GL_TEXTURE1);
                SetTextureAddressMode(data, tdata.*.texture_type, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                if (tdata.*.nv12) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            97 => {
                if (texture.*.palette != null) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            98 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                SetTextureAddressMode(data, tdata.*.texture_type, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            101 => {
                data.*.glActiveTexture.?(GL_TEXTURE1);
                SetTextureAddressMode(data, tdata.*.texture_type, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
                data.*.glActiveTexture.?(GL_TEXTURE0);
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                SetTextureAddressMode(data, tdata.*.texture_type, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                tdata.*.texture_address_mode_u = cmd.*.data.draw.texture_address_mode_u;
                tdata.*.texture_address_mode_v = cmd.*.data.draw.texture_address_mode_v;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GLES2_InvalidateCachedState(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cache: [*c]GLES2_DrawStateCache = &@as([*c]GLES2_RenderData, @ptrCast(@alignCast(renderer.*.internal))).*.drawstate;
    _ = &cache;
    cache.*.viewport_dirty = @"true" != 0;
    cache.*.texture = null;
    cache.*.blend = SDL_BLENDMODE_INVALID;
    cache.*.cliprect_enabled_dirty = @"true" != 0;
    cache.*.cliprect_dirty = @"true" != 0;
    cache.*.texturing_dirty = @"true" != 0;
    cache.*.clear_color_dirty = @"true" != 0;
    cache.*.drawablew = 0;
    cache.*.drawableh = 0;
    cache.*.program = null;
}
pub fn GLES2_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, _: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "GLES2_RunCommandQueue".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = undefined;
    _ = &data;
    var colorswap: bool = undefined;
    _ = &colorswap;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var viewport: [*c]SDL_Rect = undefined;
    _ = &viewport;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var r: f32 = undefined;
    _ = &r;
    var g: f32 = undefined;
    _ = &g;
    var b: f32 = undefined;
    _ = &b;
    var a: f32 = undefined;
    _ = &a;
    var count: usize = undefined;
    _ = &count;
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
    var thisblend_1: SDL_BlendMode = undefined;
    _ = &thisblend_1;
    var thisscalemode: SDL_ScaleMode = undefined;
    _ = &thisscalemode;
    var thisaddressmode_u: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_u;
    var thisaddressmode_v: SDL_TextureAddressMode = undefined;
    _ = &thisaddressmode_v;
    var thiscmdtype: SDL_RenderCommandType = undefined;
    _ = &thiscmdtype;
    var finalcmd_2: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd_2;
    var nextcmd_3: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd_3;
    var count_4: usize = undefined;
    _ = &count_4;
    var ret: c_int = undefined;
    _ = &ret;
    var nextcmdtype_5: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype_5;
    var op: c_int = undefined;
    _ = &op;
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
                colorswap = (renderer.*.target != null) and ((renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) or (renderer.*.target.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32)));
                if (!GLES2_ActivateRenderer(renderer)) {
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
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETCLIPRECT) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_CLEAR) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 75;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            12 => {
                return GL_CheckAllErrors("", renderer, "SDL_render_gles2.c", 1613, @ptrCast(@alignCast(&static_local___func__.__func__)));
            },
            13 => {
                cmd = cmd.*.next;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                viewport = &data.*.drawstate.viewport;
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf(cmd.*.data.viewport.rect))) != @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                _ = memcpy(@ptrCast(@alignCast(viewport)), @ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)));
                data.*.drawstate.viewport_dirty = @"true" != 0;
                data.*.drawstate.cliprect_dirty = @"true" != 0;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                rect = &cmd.*.data.cliprect.rect;
                if (@as(c_int, @intFromBool(data.*.drawstate.cliprect_enabled)) != @as(c_int, @intFromBool(cmd.*.data.cliprect.enabled))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                data.*.drawstate.cliprect_enabled = cmd.*.data.cliprect.enabled;
                data.*.drawstate.cliprect_enabled_dirty = @"true" != 0;
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
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(&data.*.drawstate.cliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*))) != @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                _ = memcpy(@ptrCast(@alignCast(&data.*.drawstate.cliprect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
                data.*.drawstate.cliprect_dirty = @"true" != 0;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            26 => {
                r = (if (colorswap) cmd.*.data.color.color.b else cmd.*.data.color.color.r) * cmd.*.data.color.color_scale;
                g = cmd.*.data.color.color.g * cmd.*.data.color.color_scale;
                b = (if (colorswap) cmd.*.data.color.color.r else cmd.*.data.color.color.b) * cmd.*.data.color.color_scale;
                a = cmd.*.data.color.color.a;
                if ((((data.*.drawstate.clear_color_dirty or (r != data.*.drawstate.clear_color.r)) or (g != data.*.drawstate.clear_color.g)) or (b != data.*.drawstate.clear_color.b)) or (a != data.*.drawstate.clear_color.a)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                data.*.glClearColor.?(r, g, b, a);
                data.*.drawstate.clear_color.r = r;
                data.*.drawstate.clear_color.g = g;
                data.*.drawstate.clear_color.b = b;
                data.*.drawstate.clear_color.a = a;
                data.*.drawstate.clear_color_dirty = @"false" != 0;
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
                if (data.*.drawstate.cliprect_enabled or data.*.drawstate.cliprect_enabled_dirty) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                data.*.glDisable.?(GL_SCISSOR_TEST);
                data.*.drawstate.cliprect_enabled_dirty = data.*.drawstate.cliprect_enabled;
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
                data.*.glClear.?(GL_COLOR_BUFFER_BIT);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            36 => {
                if (SetDrawState(data, cmd, GLES2_IMAGESOURCE_SOLID, vertices)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                count = cmd.*.data.draw.count;
                if (count > @as(usize, 2)) {
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            40 => {
                data.*.glDrawArrays.?(GL_LINE_STRIP, 0, @bitCast(@as(c_uint, @truncate(count))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                finalcmd = cmd;
                nextcmd = cmd.*.next;
                thisblend = cmd.*.data.draw.blend;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            43 => {
                if (nextcmd != null) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                nextcmdtype = nextcmd.*.command;
                if (nextcmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                data.*.glDrawArrays.?(GL_LINES, 0, @bitCast(@as(c_uint, @truncate(count))));
                cmd = finalcmd;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                if (nextcmd.*.data.draw.count != @as(usize, 2)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                nextcmd = nextcmd.*.next;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            50 => {
                if (nextcmd.*.data.draw.blend != thisblend) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            53 => {
                finalcmd = nextcmd;
                count +%= nextcmd.*.data.draw.count;
                {
                    sdl_pc = 54;
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
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                thistexture = cmd.*.data.draw.texture;
                thisblend_1 = cmd.*.data.draw.blend;
                thisscalemode = cmd.*.data.draw.texture_scale_mode;
                thisaddressmode_u = cmd.*.data.draw.texture_address_mode_u;
                thisaddressmode_v = cmd.*.data.draw.texture_address_mode_v;
                thiscmdtype = cmd.*.command;
                finalcmd_2 = cmd;
                nextcmd_3 = cmd.*.next;
                count_4 = cmd.*.data.draw.count;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                if (nextcmd_3 != null) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                nextcmdtype_5 = nextcmd_3.*.command;
                if (nextcmdtype_5 != thiscmdtype) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                if (thistexture != null) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            61 => {
                if (((((nextcmd_3.*.data.draw.texture != thistexture) or (nextcmd_3.*.data.draw.texture_scale_mode != thisscalemode)) or (nextcmd_3.*.data.draw.texture_address_mode_u != thisaddressmode_u)) or (nextcmd_3.*.data.draw.texture_address_mode_v != thisaddressmode_v)) or (nextcmd_3.*.data.draw.blend != thisblend_1)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                nextcmd_3 = nextcmd_3.*.next;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            64 => {
                finalcmd_2 = nextcmd_3;
                count_4 +%= nextcmd_3.*.data.draw.count;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            66 => {
                ret = @intFromBool(SetCopyState(renderer, cmd, vertices));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                ret = @intFromBool(SetDrawState(data, cmd, GLES2_IMAGESOURCE_SOLID, vertices));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (ret != 0) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                op = GL_TRIANGLES;
                if (thiscmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
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
                cmd = finalcmd_2;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            72 => {
                op = GL_POINTS;
                {
                    sdl_pc = 74;
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
                data.*.glDrawArrays.?(@bitCast(@as(c_int, op)), 0, @bitCast(@as(c_uint, @truncate(count_4))));
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GLES2_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (data != null) {
        _ = GLES2_ActivateRenderer(renderer);
        {
            var i: c_int = undefined;
            _ = &i;
            {
                i = 0;
                while (i < GLES2_SHADER_COUNT) : (i += 1) {
                    var id: GLuint = data.*.shader_id_cache[@bitCast(@as(isize, @intCast(i)))];
                    _ = &id;
                    if (id != 0) {
                        data.*.glDeleteShader.?(id);
                    }
                }
            }
        }
        {
            var entry: [*c]GLES2_ProgramCacheEntry = undefined;
            _ = &entry;
            var next: [*c]GLES2_ProgramCacheEntry = undefined;
            _ = &next;
            entry = data.*.program_cache.head;
            while (entry != null) {
                next = entry.*.next;
                data.*.glDeleteProgram.?(entry.*.id);
                SDL_free_REAL(@ptrCast(@alignCast(entry.*.shader_params)));
                SDL_free_REAL(@ptrCast(@alignCast(entry)));
                entry = next;
            }
        }
        if (data.*.context != null) {
            _ = SDL_GL_DestroyContext_REAL(data.*.context);
        }
        SDL_free_REAL(@ptrCast(@alignCast(data)));
    }
}
pub fn GLES2_CreatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GLES2_CreatePalette".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GLES2_PaletteData = undefined;
    palettedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(palettedata.*)))));
    _ = &palettedata;
    if (!(palettedata != null)) {
        return @"false" != 0;
    }
    palette.*.internal = @ptrCast(@alignCast(palettedata));
    data.*.drawstate.texture = null;
    data.*.glGenTextures.?(1, &palettedata.*.texture);
    if (!GL_CheckAllErrors("glGenTexures()", renderer, "SDL_render_gles2.c", 1671, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        return @"false" != 0;
    }
    data.*.glBindTexture.?(GL_TEXTURE_2D, palettedata.*.texture);
    data.*.glTexImage2D.?(GL_TEXTURE_2D, 0, GL_RGBA, 256, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
    if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gles2.c", 1676, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        return @"false" != 0;
    }
    _ = SetTextureScaleMode(data, GL_TEXTURE_2D, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST);
    SetTextureAddressMode(data, GL_TEXTURE_2D, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
    return @"true" != 0;
}
pub fn GLES2_UpdatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GLES2_UpdatePalette".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GLES2_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    _ = GLES2_ActivateRenderer(renderer);
    data.*.drawstate.texture = null;
    data.*.glBindTexture.?(GL_TEXTURE_2D, palettedata.*.texture);
    data.*.glTexSubImage2D.?(GL_TEXTURE_2D, 0, 0, 0, ncolors, 1, GL_RGBA, GL_UNSIGNED_BYTE, @ptrCast(@alignCast(colors)));
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gles2.c", 1696, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GLES2_DestroyPalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GLES2_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    if (palettedata != null) {
        data.*.glDeleteTextures.?(1, &palettedata.*.texture);
        SDL_free_REAL(@ptrCast(@alignCast(palettedata)));
    }
}
pub fn GLES2_CreateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GLES2_CreateTexture".*;
    };
    _ = &static_local___func__;
    var renderdata: [*c]GLES2_RenderData = undefined;
    _ = &renderdata;
    var data: [*c]GLES2_TextureData = undefined;
    _ = &data;
    var format: GLenum = undefined;
    _ = &format;
    var @"type": GLenum = undefined;
    _ = &@"type";
    var size: usize = undefined;
    _ = &size;
    var yuv_texture_w: c_int = undefined;
    _ = &yuv_texture_w;
    var yuv_texture_h: c_int = undefined;
    _ = &yuv_texture_h;
    var status: GLenum = undefined;
    _ = &status;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                renderdata = @ptrCast(@alignCast(renderer.*.internal));
                _ = GLES2_ActivateRenderer(renderer);
                renderdata.*.drawstate.texture = null;
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            1 => {
                if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) and (texture.*.access != @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STATIC))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                format = GL_RGBA;
                @"type" = GL_UNSIGNED_BYTE;
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
                format = GL_LUMINANCE;
                @"type" = GL_UNSIGNED_BYTE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                if (renderdata.*.GL_OES_EGL_image_external_supported) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                format = GL_NONE;
                @"type" = GL_NONE;
                {
                    sdl_pc = 1;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                return SDL_SetError_REAL("Texture format not supported");
            },
            17 => {
                return SDL_SetError_REAL("Unsupported texture access for SDL_PIXELFORMAT_EXTERNAL_OES");
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(GLES2_TextureData))));
                if (!(data != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                return @"false" != 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                data.*.texture = 0;
                data.*.texture_type = @bitCast(@as(c_int, if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) GL_TEXTURE_EXTERNAL_OES else GL_TEXTURE_2D));
                data.*.pixel_format = format;
                data.*.pixel_type = @"type";
                data.*.yuv = ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444));
                data.*.nv12 = (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21));
                data.*.texture_scale_mode = texture.*.scaleMode;
                data.*.texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
                data.*.texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                data.*.pitch = texture.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
                size = @as(usize, @bitCast(@as(c_long, texture.*.h))) *% @as(usize, @bitCast(@as(c_long, data.*.pitch)));
                if (data.*.yuv) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                _ = GL_CheckAllErrors("", renderer, "SDL_render_gles2.c", 1800, @ptrCast(@alignCast(&static_local___func__.__func__)));
                data.*.texel_size[@as(c_int, 0)] = @as(f32, 1.0) / @as(f32, @floatFromInt(texture.*.w));
                data.*.texel_size[@as(c_int, 1)] = @as(f32, 1.0) / @as(f32, @floatFromInt(texture.*.h));
                data.*.texel_size[@as(c_int, 2)] = @floatFromInt(texture.*.w);
                data.*.texel_size[@as(c_int, 3)] = @floatFromInt(texture.*.h);
                if (data.*.yuv) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            26 => {
                if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                if (data.*.nv12) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            28 => {
                data.*.pixel_data = SDL_calloc_REAL(1, size);
                if (!(data.*.pixel_data != null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            29 => {
                size +%= @bitCast(@as(c_long, (@as(c_int, 2) * texture.*.h) * data.*.pitch));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                size +%= @bitCast(@as(c_long, (@as(c_int, 2) * @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(data.*.pitch + @as(c_int, 1), @as(c_int, 2))));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                size +%= @bitCast(@as(c_long, (@as(c_int, 2) * @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(data.*.pitch + @as(c_int, 1), @as(c_int, 2))));
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            35 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            38 => {
                if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            39 => {
                if (data.*.nv12) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            40 => {
                data.*.texture = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengles2.texture", 0))));
                if (data.*.texture != 0) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            41 => {
                yuv_texture_w = texture.*.w;
                yuv_texture_h = texture.*.h;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                yuv_texture_w = @divTrunc(texture.*.w + @as(c_int, 1), @as(c_int, 2));
                yuv_texture_h = @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                data.*.texture_v = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengles2.texture_v", 0))));
                if (data.*.texture_v != 0) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                data.*.texture_v_external = @"true";
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                renderdata.*.glGenTextures.?(1, &data.*.texture_v);
                if (!GL_CheckAllErrors("glGenTexures()", renderer, "SDL_render_gles2.c", 1822, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                renderdata.*.glActiveTexture.?(GL_TEXTURE2);
                renderdata.*.glBindTexture.?(data.*.texture_type, data.*.texture_v);
                renderdata.*.glTexImage2D.?(data.*.texture_type, 0, @bitCast(@as(c_uint, @truncate(format))), yuv_texture_w, yuv_texture_h, 0, format, @"type", null);
                if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gles2.c", 1831, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
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
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                _ = SetTextureScaleMode(renderdata, data.*.texture_type, texture.*.format, data.*.texture_scale_mode);
                SetTextureAddressMode(renderdata, data.*.texture_type, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
                _ = SDL_SetNumberProperty_REAL(SDL_GetTextureProperties_REAL(texture), "SDL.texture.opengles2.texture_v", data.*.texture_v);
                data.*.texture_u = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengles2.texture_u", 0))));
                if (data.*.texture_u != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                data.*.texture_u_external = @"true";
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                renderdata.*.glGenTextures.?(1, &data.*.texture_u);
                if (!GL_CheckAllErrors("glGenTexures()", renderer, "SDL_render_gles2.c", 1845, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                renderdata.*.glActiveTexture.?(GL_TEXTURE1);
                renderdata.*.glBindTexture.?(data.*.texture_type, data.*.texture_u);
                renderdata.*.glTexImage2D.?(data.*.texture_type, 0, @bitCast(@as(c_uint, @truncate(format))), yuv_texture_w, yuv_texture_h, 0, format, @"type", null);
                if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gles2.c", 1854, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            56 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                _ = SetTextureScaleMode(renderdata, data.*.texture_type, texture.*.format, data.*.texture_scale_mode);
                SetTextureAddressMode(renderdata, data.*.texture_type, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
                _ = SDL_SetNumberProperty_REAL(SDL_GetTextureProperties_REAL(texture), "SDL.texture.opengles2.texture_u", data.*.texture_u);
                if (!(SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, 8) != null)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            65 => {
                data.*.texture_u = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.texture.create.opengles2.texture_uv", 0))));
                if (data.*.texture_u != 0) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            68 => {
                data.*.texture_u_external = @"true";
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                renderdata.*.glGenTextures.?(1, &data.*.texture_u);
                if (!GL_CheckAllErrors("glGenTexures()", renderer, "SDL_render_gles2.c", 1874, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                renderdata.*.glActiveTexture.?(GL_TEXTURE1);
                renderdata.*.glBindTexture.?(data.*.texture_type, data.*.texture_u);
                renderdata.*.glTexImage2D.?(data.*.texture_type, 0, GL_LUMINANCE_ALPHA, @divTrunc(texture.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(texture.*.h + @as(c_int, 1), @as(c_int, 2)), 0, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, null);
                if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gles2.c", 1883, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            71 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                _ = SetTextureScaleMode(renderdata, data.*.texture_type, texture.*.format, data.*.texture_scale_mode);
                SetTextureAddressMode(renderdata, data.*.texture_type, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
                _ = SDL_SetNumberProperty_REAL(SDL_GetTextureProperties_REAL(texture), "SDL.texture.opengles2.texture_uv", data.*.texture_u);
                if (!(SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, 8) != null)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            80 => {
                data.*.texture_external = @"true" != 0;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                renderdata.*.glGenTextures.?(1, &data.*.texture);
                if (!GL_CheckAllErrors("glGenTexures()", renderer, "SDL_render_gles2.c", 1904, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                texture.*.internal = @ptrCast(@alignCast(data));
                renderdata.*.glActiveTexture.?(GL_TEXTURE0);
                renderdata.*.glBindTexture.?(data.*.texture_type, data.*.texture);
                if (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_EXTERNAL_OES)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            83 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            86 => {
                renderdata.*.glTexImage2D.?(data.*.texture_type, 0, @bitCast(@as(c_uint, @truncate(format))), texture.*.w, texture.*.h, 0, format, @"type", null);
                if (!GL_CheckAllErrors("glTexImage2D()", renderer, "SDL_render_gles2.c", 1915, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                _ = SetTextureScaleMode(renderdata, data.*.texture_type, texture.*.format, data.*.texture_scale_mode);
                SetTextureAddressMode(renderdata, data.*.texture_type, data.*.texture_address_mode_u, data.*.texture_address_mode_v);
                _ = SDL_SetNumberProperty_REAL(SDL_GetTextureProperties_REAL(texture), "SDL.texture.opengles2.texture", data.*.texture);
                _ = SDL_SetNumberProperty_REAL(SDL_GetTextureProperties_REAL(texture), "SDL.texture.opengles2.target", data.*.texture_type);
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            89 => {
                if (!data.*.texture_external) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                renderdata.*.glDeleteTextures.?(1, &data.*.texture);
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
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @"false" != 0;
            },
            95 => {
                renderdata.*.glGenFramebuffers.?(1, &data.*.fbo);
                renderdata.*.glBindFramebuffer.?(GL_FRAMEBUFFER, data.*.fbo);
                renderdata.*.glFramebufferTexture2D.?(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, data.*.texture_type, data.*.texture, 0);
                status = renderdata.*.glCheckFramebufferStatus.?(GL_FRAMEBUFFER);
                renderdata.*.glBindFramebuffer.?(GL_FRAMEBUFFER, if (renderer.*.target != null) @as([*c]GLES2_TextureData, @ptrCast(@alignCast(renderer.*.target.*.internal))).*.fbo else renderdata.*.window_framebuffer);
                if (status != @as(GLenum, GL_FRAMEBUFFER_COMPLETE)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
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
                return GL_CheckAllErrors("", renderer, "SDL_render_gles2.c", 1946, @ptrCast(@alignCast(&static_local___func__.__func__)));
            },
            98 => {
                renderdata.*.glDeleteFramebuffers.?(1, &data.*.fbo);
                if (!data.*.texture_external) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            101 => {
                renderdata.*.glDeleteTextures.?(1, &data.*.texture);
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                SDL_free_REAL(data.*.pixel_data);
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return SDL_SetError_REAL("Texture framebuffer was incomplete");
            },
            else => unreachable,
        }
    }
}
pub fn GLES2_TexSubImage2D(data: [*c]GLES2_RenderData, target: GLenum, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, arg_type: GLenum, arg_pixels: ?*const GLvoid, pitch: GLint, bpp: GLint) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var pixels = arg_pixels;
    _ = &pixels;
    var blob: [*c]Uint8 = null;
    _ = &blob;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var src_pitch: usize = undefined;
    _ = &src_pitch;
    var y: c_int = undefined;
    _ = &y;
    if (((width == @as(c_int, 0)) or (height == @as(c_int, 0))) or (bpp == @as(c_int, 0))) {
        return @"true" != 0;
    }
    src_pitch = @as(usize, @bitCast(@as(c_long, width))) *% @as(usize, @bitCast(@as(c_long, bpp)));
    src = @ptrCast(@alignCast(@constCast(pixels)));
    if (@as(usize, @bitCast(@as(c_long, pitch))) != src_pitch) {
        blob = @ptrCast(@alignCast(SDL_malloc_REAL(src_pitch *% @as(usize, @bitCast(@as(c_long, height))))));
        if (!(blob != null)) {
            return @"false" != 0;
        }
        src = blob;
        {
            y = 0;
            while (y < height) : (y += 1) {
                _ = memcpy(@ptrCast(@alignCast(src)), pixels, src_pitch);
                src += src_pitch;
                pixels = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(pixels)))) + @as(usize, @bitCast(@as(isize, @intCast(pitch))))));
            }
        }
        src = blob;
    }
    data.*.glTexSubImage2D.?(target, 0, xoffset, yoffset, width, height, format, @"type", @ptrCast(@alignCast(src)));
    SDL_free_REAL(@ptrCast(@alignCast(blob)));
    return @"true" != 0;
}
pub fn GLES2_UpdateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, arg_pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "GLES2_UpdateTexture".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    _ = GLES2_ActivateRenderer(renderer);
    if ((rect.*.w <= @as(c_int, 0)) or (rect.*.h <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    data.*.drawstate.texture = null;
    data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture);
    _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, pixels, pitch, if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
    if (tdata.*.yuv) {
        if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
            _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, pixels, pitch, 1);
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
            _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, pixels, pitch, 1);
        } else {
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
            } else {
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
            }
            _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), tdata.*.pixel_format, tdata.*.pixel_type, pixels, @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2)), 1);
            pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2))))))));
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
            } else {
                data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
            }
            _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), tdata.*.pixel_format, tdata.*.pixel_type, pixels, @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2)), 1);
        }
    } else if (tdata.*.nv12) {
        pixels = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))));
        data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
        _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, pixels, @as(c_int, 2) * @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2)), 2);
    }
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gles2.c", 2076, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GLES2_UpdateTextureYUV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "GLES2_UpdateTextureYUV".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    _ = GLES2_ActivateRenderer(renderer);
    if ((rect.*.w <= @as(c_int, 0)) or (rect.*.h <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    data.*.drawstate.texture = null;
    if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
        data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
        _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Vplane)), Vpitch, 1);
        data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
        _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Uplane)), Upitch, 1);
    } else {
        data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_v);
        _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Vplane)), Vpitch, 1);
        data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
        _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Uplane)), Upitch, 1);
    }
    data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture);
    _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Yplane)), Ypitch, 1);
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gles2.c", 2145, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GLES2_UpdateTextureNV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "GLES2_UpdateTextureNV".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    _ = GLES2_ActivateRenderer(renderer);
    if ((rect.*.w <= @as(c_int, 0)) or (rect.*.h <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    data.*.drawstate.texture = null;
    data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture_u);
    _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, @ptrCast(@alignCast(UVplane)), UVpitch, 2);
    data.*.glBindTexture.?(tdata.*.texture_type, tdata.*.texture);
    _ = GLES2_TexSubImage2D(data, tdata.*.texture_type, rect.*.x, rect.*.y, rect.*.w, rect.*.h, tdata.*.pixel_format, tdata.*.pixel_type, @ptrCast(@alignCast(Yplane)), Ypitch, 1);
    return GL_CheckAllErrors("glTexSubImage2D()", renderer, "SDL_render_gles2.c", 2185, @ptrCast(@alignCast(&static_local___func__.__func__)));
}
pub fn GLES2_LockTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(tdata.*.pixel_data))) + @as(usize, @bitCast(@as(isize, @intCast(tdata.*.pitch * rect.*.y))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    pitch.* = tdata.*.pitch;
    return @"true" != 0;
}
pub fn GLES2_UnlockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    rect.x = 0;
    rect.y = 0;
    rect.w = texture.*.w;
    rect.h = texture.*.h;
    _ = GLES2_UpdateTexture(renderer, texture, &rect, tdata.*.pixel_data, tdata.*.pitch);
}
pub fn GLES2_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    data.*.drawstate.viewport_dirty = @"true" != 0;
    data.*.glBindFramebuffer.?(GL_FRAMEBUFFER, if (texture != null) @as([*c]GLES2_TextureData, @ptrCast(@alignCast(texture.*.internal))).*.fbo else data.*.window_framebuffer);
    return @"true" != 0;
}
pub fn GLES2_DestroyTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var tdata: [*c]GLES2_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &tdata;
    _ = GLES2_ActivateRenderer(renderer);
    if (data.*.drawstate.texture == texture) {
        data.*.drawstate.texture = null;
        data.*.drawstate.shader_params = null;
    }
    if (data.*.drawstate.target == texture) {
        data.*.drawstate.target = null;
    }
    if (tdata != null) {
        if (tdata.*.fbo != 0) {
            data.*.glDeleteFramebuffers.?(1, &tdata.*.fbo);
        }
        if ((tdata.*.texture != 0) and (@as(GLuint, @bitCast(@as(c_int, @intFromBool(!tdata.*.texture_external)))) != 0)) {
            data.*.glDeleteTextures.?(1, &tdata.*.texture);
        }
        if ((tdata.*.texture_v != 0) and (@as(GLuint, @bitCast(@as(c_int, @intFromBool(!(tdata.*.texture_v_external != 0))))) != 0)) {
            data.*.glDeleteTextures.?(1, &tdata.*.texture_v);
        }
        if ((tdata.*.texture_u != 0) and (@as(GLuint, @bitCast(@as(c_int, @intFromBool(!(tdata.*.texture_u_external != 0))))) != 0)) {
            data.*.glDeleteTextures.?(1, &tdata.*.texture_u);
        }
        SDL_free_REAL(tdata.*.pixel_data);
        SDL_free_REAL(@ptrCast(@alignCast(tdata)));
        texture.*.internal = null;
    }
}
pub fn GLES2_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "GLES2_RenderReadPixels".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var format: SDL_PixelFormat = if (renderer.*.target != null) renderer.*.target.*.format else @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32);
    _ = &format;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
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
    data.*.glReadPixels.?(rect.*.x, y, rect.*.w, rect.*.h, GL_RGBA, GL_UNSIGNED_BYTE, surface.*.pixels);
    if (!GL_CheckAllErrors("glReadPixels()", renderer, "SDL_render_gles2.c", 2277, @ptrCast(@alignCast(&static_local___func__.__func__)))) {
        SDL_DestroySurface_REAL(surface);
        return null;
    }
    if (!(renderer.*.target != null)) {
        _ = SDL_FlipSurface_REAL(surface, SDL_FLIP_VERTICAL);
    }
    return surface;
}
pub fn GLES2_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_GL_SwapWindow_REAL(renderer.*.window);
}
pub fn GLES2_SetVSync(_: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool {
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
pub fn GLES2_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "GLES2_CreateRenderer".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES2_RenderData = undefined;
    _ = &data;
    var window_flags: SDL_WindowFlags = undefined;
    _ = &window_flags;
    var window_framebuffer: GLint = undefined;
    _ = &window_framebuffer;
    var value: GLint = undefined;
    _ = &value;
    var profile_mask: c_int = undefined;
    _ = &profile_mask;
    var major: c_int = undefined;
    _ = &major;
    var minor: c_int = undefined;
    _ = &minor;
    var changed_window: bool = undefined;
    _ = &changed_window;
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
                changed_window = @"false" != 0;
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
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                if ((!((window_flags & @as(c_ulong, 2)) != 0) or (profile_mask != SDL_GL_CONTEXT_PROFILE_ES)) or (major < RENDERER_CONTEXT_MAJOR)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                changed_window = @"true" != 0;
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
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
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(GLES2_RenderData))));
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
                renderer.*.internal = @ptrCast(@alignCast(data));
                GLES2_InvalidateCachedState(renderer);
                renderer.*.window = window;
                renderer.*.WindowEvent = GLES2_WindowEvent;
                renderer.*.SupportsBlendMode = GLES2_SupportsBlendMode;
                renderer.*.CreatePalette = GLES2_CreatePalette;
                renderer.*.UpdatePalette = GLES2_UpdatePalette;
                renderer.*.DestroyPalette = GLES2_DestroyPalette;
                renderer.*.CreateTexture = GLES2_CreateTexture;
                renderer.*.UpdateTexture = GLES2_UpdateTexture;
                renderer.*.UpdateTextureYUV = GLES2_UpdateTextureYUV;
                renderer.*.UpdateTextureNV = GLES2_UpdateTextureNV;
                renderer.*.LockTexture = GLES2_LockTexture;
                renderer.*.UnlockTexture = GLES2_UnlockTexture;
                renderer.*.SetRenderTarget = GLES2_SetRenderTarget;
                renderer.*.QueueSetViewport = GLES2_QueueNoOp;
                renderer.*.QueueSetDrawColor = GLES2_QueueNoOp;
                renderer.*.QueueDrawPoints = GLES2_QueueDrawPoints;
                renderer.*.QueueDrawLines = GLES2_QueueDrawLines;
                renderer.*.QueueGeometry = GLES2_QueueGeometry;
                renderer.*.InvalidateCachedState = GLES2_InvalidateCachedState;
                renderer.*.RunCommandQueue = GLES2_RunCommandQueue;
                renderer.*.RenderReadPixels = GLES2_RenderReadPixels;
                renderer.*.RenderPresent = GLES2_RenderPresent;
                renderer.*.DestroyTexture = GLES2_DestroyTexture;
                renderer.*.DestroyRenderer = GLES2_DestroyRenderer;
                renderer.*.SetVSync = GLES2_SetVSync;
                renderer.*.name = GLES2_RenderDriver.name;
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
                if (!GLES2_LoadFunctions(data)) {
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
                if (!GLES2_CacheShaders(data)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 1;
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
                if (SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_FLAGS, &value) and ((value & SDL_GL_CONTEXT_DEBUG_FLAG) != 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                data.*.debug_enabled = @"true" != 0;
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
                value = 0;
                data.*.glGetIntegerv.?(GL_MAX_TEXTURE_SIZE, &value);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", value);
                data.*.glGetIntegerv.?(GL_FRAMEBUFFER_BINDING, &window_framebuffer);
                data.*.window_framebuffer = @bitCast(@as(c_int, window_framebuffer));
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRA32);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBA32);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRX32);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBX32);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_INDEX8);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_YV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_IYUV);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_I444);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV21);
                if (SDL_GL_ExtensionSupported_REAL("GL_OES_EGL_image_external")) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                data.*.GL_OES_EGL_image_external_supported = @"true" != 0;
                if (!GLES2_CacheShader(data, GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES, GL_FRAGMENT_SHADER)) {
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
                if (SDL_GL_ExtensionSupported_REAL("GL_EXT_blend_minmax")) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 1;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_EXTERNAL_OES);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                data.*.GL_EXT_blend_minmax_supported = @"true" != 0;
                {
                    sdl_pc = 46;
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
                if (((major < @as(c_int, 3)) and !SDL_GL_ExtensionSupported_REAL("GL_ARB_texture_non_power_of_two")) and !SDL_GL_ExtensionSupported_REAL("GL_OES_texture_npot")) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                renderer.*.npot_texture_wrap_unsupported = @"true" != 0;
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
                if (SDL_GL_ExtensionSupported_REAL("GL_EXT_sRGB_write_control")) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                data.*.glDisable.?(GL_FRAMEBUFFER_SRGB);
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
                data.*.glDisable.?(GL_DEPTH_TEST);
                data.*.glDisable.?(GL_CULL_FACE);
                data.*.glActiveTexture.?(GL_TEXTURE0);
                data.*.glPixelStorei.?(GL_PACK_ALIGNMENT, 1);
                data.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
                data.*.glEnableVertexAttribArray.?(GLES2_ATTRIBUTE_POSITION);
                data.*.glEnableVertexAttribArray.?(GLES2_ATTRIBUTE_COLOR);
                data.*.glDisableVertexAttribArray.?(GLES2_ATTRIBUTE_TEXCOORD);
                data.*.glClearColor.?(1.0, 1.0, 1.0, 1.0);
                data.*.drawstate.clear_color.r = 1.0;
                data.*.drawstate.clear_color.g = 1.0;
                data.*.drawstate.clear_color.b = 1.0;
                data.*.drawstate.clear_color.a = 1.0;
                data.*.drawstate.projection[@as(c_int, 3)][@as(c_int, 0)] = -@as(f32, 1.0);
                data.*.drawstate.projection[@as(c_int, 3)][@as(c_int, 3)] = 1.0;
                _ = GL_CheckAllErrors("", renderer, "SDL_render_gles2.c", 2487, @ptrCast(@alignCast(&static_local___func__.__func__)));
                return @"true" != 0;
            },
            53 => {
                @"error" = SDL_strdup_REAL(SDL_GetError_REAL());
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, profile_mask);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, major);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, minor);
                _ = SDL_RecreateWindow(window, window_flags);
                _ = SDL_SetError_REAL("%s", @"error");
                SDL_free_REAL(@ptrCast(@alignCast(@"error")));
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export var GLES2_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = GLES2_CreateRenderer,
    .name = "opengles2",
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
pub const GL_COLOR_BUFFER_BIT = @as(c_int, 0x00004000);
pub const GL_FALSE = @as(c_int, 0);
pub const GL_TRUE = @as(c_int, 1);
pub const GL_POINTS = @as(c_int, 0x0000);
pub const GL_LINES = @as(c_int, 0x0001);
pub const GL_LINE_STRIP = @as(c_int, 0x0003);
pub const GL_TRIANGLES = @as(c_int, 0x0004);
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
pub const GL_FUNC_ADD = __helpers.promoteIntLiteral(c_int, 0x8006, .hex);
pub const GL_FUNC_SUBTRACT = __helpers.promoteIntLiteral(c_int, 0x800A, .hex);
pub const GL_FUNC_REVERSE_SUBTRACT = __helpers.promoteIntLiteral(c_int, 0x800B, .hex);
pub const GL_TEXTURE_2D = @as(c_int, 0x0DE1);
pub const GL_CULL_FACE = @as(c_int, 0x0B44);
pub const GL_BLEND = @as(c_int, 0x0BE2);
pub const GL_DEPTH_TEST = @as(c_int, 0x0B71);
pub const GL_SCISSOR_TEST = @as(c_int, 0x0C11);
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_INVALID_ENUM = @as(c_int, 0x0500);
pub const GL_INVALID_VALUE = @as(c_int, 0x0501);
pub const GL_INVALID_OPERATION = @as(c_int, 0x0502);
pub const GL_OUT_OF_MEMORY = @as(c_int, 0x0505);
pub const GL_UNPACK_ALIGNMENT = @as(c_int, 0x0CF5);
pub const GL_PACK_ALIGNMENT = @as(c_int, 0x0D05);
pub const GL_MAX_TEXTURE_SIZE = @as(c_int, 0x0D33);
pub const GL_UNSIGNED_BYTE = @as(c_int, 0x1401);
pub const GL_FLOAT = @as(c_int, 0x1406);
pub const GL_RGBA = @as(c_int, 0x1908);
pub const GL_LUMINANCE = @as(c_int, 0x1909);
pub const GL_LUMINANCE_ALPHA = @as(c_int, 0x190A);
pub const GL_FRAGMENT_SHADER = __helpers.promoteIntLiteral(c_int, 0x8B30, .hex);
pub const GL_VERTEX_SHADER = __helpers.promoteIntLiteral(c_int, 0x8B31, .hex);
pub const GL_LINK_STATUS = __helpers.promoteIntLiteral(c_int, 0x8B82, .hex);
pub const GL_NEAREST = @as(c_int, 0x2600);
pub const GL_LINEAR = @as(c_int, 0x2601);
pub const GL_TEXTURE_MAG_FILTER = @as(c_int, 0x2800);
pub const GL_TEXTURE_MIN_FILTER = @as(c_int, 0x2801);
pub const GL_TEXTURE_WRAP_S = @as(c_int, 0x2802);
pub const GL_TEXTURE_WRAP_T = @as(c_int, 0x2803);
pub const GL_TEXTURE0 = __helpers.promoteIntLiteral(c_int, 0x84C0, .hex);
pub const GL_TEXTURE1 = __helpers.promoteIntLiteral(c_int, 0x84C1, .hex);
pub const GL_TEXTURE2 = __helpers.promoteIntLiteral(c_int, 0x84C2, .hex);
pub const GL_REPEAT = @as(c_int, 0x2901);
pub const GL_CLAMP_TO_EDGE = __helpers.promoteIntLiteral(c_int, 0x812F, .hex);
pub const GL_COMPILE_STATUS = __helpers.promoteIntLiteral(c_int, 0x8B81, .hex);
pub const GL_INFO_LOG_LENGTH = __helpers.promoteIntLiteral(c_int, 0x8B84, .hex);
pub const GL_FRAMEBUFFER = __helpers.promoteIntLiteral(c_int, 0x8D40, .hex);
pub const GL_COLOR_ATTACHMENT0 = __helpers.promoteIntLiteral(c_int, 0x8CE0, .hex);
pub const GL_NONE = @as(c_int, 0);
pub const GL_FRAMEBUFFER_COMPLETE = __helpers.promoteIntLiteral(c_int, 0x8CD5, .hex);
pub const GL_FRAMEBUFFER_BINDING = __helpers.promoteIntLiteral(c_int, 0x8CA6, .hex);
pub const GL_TEXTURE_EXTERNAL_OES = __helpers.promoteIntLiteral(c_int, 0x8D65, .hex);
pub const GL_MIN_EXT = __helpers.promoteIntLiteral(c_int, 0x8007, .hex);
pub const GL_MAX_EXT = __helpers.promoteIntLiteral(c_int, 0x8008, .hex);
pub const RENDERER_CONTEXT_MAJOR = @as(c_int, 2);
pub const RENDERER_CONTEXT_MINOR = @as(c_int, 0);
pub const GL_FRAMEBUFFER_SRGB = __helpers.promoteIntLiteral(c_int, 0x8DB9, .hex);
pub const GLES2_MAX_CACHED_PROGRAMS = @as(c_int, 8);
pub inline fn GL_CheckError(prefix: anytype, renderer: anytype) @TypeOf(GL_CheckAllErrors(prefix, renderer, "SDL_render_gles2.c", SDL_LINE, SDL_FUNCTION)) {
    @setEvalBranchQuota(100000);
    _ = &prefix;
    _ = &renderer;
    return GL_CheckAllErrors(prefix, renderer, "SDL_render_gles2.c", SDL_LINE, SDL_FUNCTION);
}
