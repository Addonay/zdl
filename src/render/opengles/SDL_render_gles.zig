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
pub extern fn SDL_OutOfMemory_REAL() bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
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
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
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
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetRenderOutputSize_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool;
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
pub const khronos_float_t = f32;
pub const GLclampf = khronos_float_t;
pub const GLvoid = anyopaque;
pub const GLenum = c_uint;
pub const GLfloat = khronos_float_t;
pub const GLuint = c_uint;
pub const GLbitfield = c_uint;
pub const GLint = c_int;
pub const GLsizei = c_int;
pub extern fn glClearColor(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat) void;
pub extern fn glColor4f(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat) void;
pub extern fn glOrthof(l: GLfloat, r: GLfloat, b: GLfloat, t: GLfloat, n: GLfloat, f: GLfloat) void;
pub extern fn glTexEnvf(target: GLenum, pname: GLenum, param: GLfloat) void;
pub extern fn glBindTexture(target: GLenum, texture: GLuint) void;
pub extern fn glBlendFunc(sfactor: GLenum, dfactor: GLenum) void;
pub extern fn glClear(mask: GLbitfield) void;
pub extern fn glColorPointer(size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const anyopaque) void;
pub extern fn glDeleteTextures(n: GLsizei, textures: [*c]const GLuint) void;
pub extern fn glDisable(cap: GLenum) void;
pub extern fn glDisableClientState(array: GLenum) void;
pub extern fn glDrawArrays(mode: GLenum, first: GLint, count: GLsizei) void;
pub extern fn glEnable(cap: GLenum) void;
pub extern fn glEnableClientState(array: GLenum) void;
pub extern fn glFinish() void;
pub extern fn glGenTextures(n: GLsizei, textures: [*c]GLuint) void;
pub extern fn glGetError() GLenum;
pub extern fn glGetIntegerv(pname: GLenum, data: [*c]GLint) void;
pub extern fn glLoadIdentity() void;
pub extern fn glMatrixMode(mode: GLenum) void;
pub extern fn glPixelStorei(pname: GLenum, param: GLint) void;
pub extern fn glReadPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*anyopaque) void;
pub extern fn glScissor(x: GLint, y: GLint, width: GLsizei, height: GLsizei) void;
pub extern fn glTexCoordPointer(size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const anyopaque) void;
pub extern fn glTexImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, @"type": GLenum, pixels: ?*const anyopaque) void;
pub extern fn glTexParameteri(target: GLenum, pname: GLenum, param: GLint) void;
pub extern fn glTexParameteriv(target: GLenum, pname: GLenum, params: [*c]const GLint) void;
pub extern fn glTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, @"type": GLenum, pixels: ?*const anyopaque) void;
pub extern fn glVertexPointer(size: GLint, @"type": GLenum, stride: GLsizei, pointer: ?*const anyopaque) void;
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
pub const GLES_FBOList = struct_GLES_FBOList;
pub const struct_GLES_FBOList = extern struct {
    w: Uint32 = 0,
    h: Uint32 = 0,
    FBO: GLuint = 0,
    next: [*c]GLES_FBOList = null,
};
pub const GLES_DrawStateCache = extern struct {
    viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    viewport_dirty: bool = false,
    texture: [*c]SDL_Texture = null,
    target: [*c]SDL_Texture = null,
    drawablew: c_int = 0,
    drawableh: c_int = 0,
    blend: SDL_BlendMode = 0,
    cliprect_enabled_dirty: bool = false,
    cliprect_enabled: bool = false,
    cliprect_dirty: bool = false,
    cliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    texturing: bool = false,
    color_dirty: bool = false,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    clear_color_dirty: bool = false,
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
pub const GLES_RenderData = extern struct {
    context: SDL_GLContext = null,
    glBindTexture: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glBlendFunc: ?*const fn (GLenum, GLenum) callconv(.c) void = null,
    glBlendEquationOES: ?*const fn (GLenum) callconv(.c) void = null,
    glBlendEquationSeparateOES: ?*const fn (GLenum, GLenum) callconv(.c) void = null,
    glBlendFuncSeparateOES: ?*const fn (GLenum, GLenum, GLenum, GLenum) callconv(.c) void = null,
    glClear: ?*const fn (GLbitfield) callconv(.c) void = null,
    glClearColor: ?*const fn (GLclampf, GLclampf, GLclampf, GLclampf) callconv(.c) void = null,
    glColor4f: ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glColorPointer: ?*const fn (GLint, GLenum, GLsizei, ?*const GLvoid) callconv(.c) void = null,
    glDeleteTextures: ?*const fn (GLsizei, [*c]const GLuint) callconv(.c) void = null,
    glDisable: ?*const fn (GLenum) callconv(.c) void = null,
    glDisableClientState: ?*const fn (array: GLenum) callconv(.c) void = null,
    glDrawArrays: ?*const fn (GLenum, GLint, GLsizei) callconv(.c) void = null,
    glDrawTexfOES: ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glEnable: ?*const fn (GLenum) callconv(.c) void = null,
    glEnableClientState: ?*const fn (GLenum) callconv(.c) void = null,
    glFinish: ?*const fn () callconv(.c) void = null,
    glGenFramebuffersOES: ?*const fn (GLsizei, [*c]GLuint) callconv(.c) void = null,
    glGenTextures: ?*const fn (GLsizei, [*c]GLuint) callconv(.c) void = null,
    glGetError: ?*const fn () callconv(.c) GLenum = null,
    glGetIntegerv: ?*const fn (GLenum, [*c]GLint) callconv(.c) void = null,
    glLoadIdentity: ?*const fn () callconv(.c) void = null,
    glMatrixMode: ?*const fn (GLenum) callconv(.c) void = null,
    glOrthof: ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.c) void = null,
    glPixelStorei: ?*const fn (GLenum, GLint) callconv(.c) void = null,
    glReadPixels: ?*const fn (GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*GLvoid) callconv(.c) void = null,
    glScissor: ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.c) void = null,
    glTexCoordPointer: ?*const fn (GLint, GLenum, GLsizei, ?*const GLvoid) callconv(.c) void = null,
    glTexEnvf: ?*const fn (GLenum, GLenum, GLfloat) callconv(.c) void = null,
    glTexImage2D: ?*const fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const GLvoid) callconv(.c) void = null,
    glTexParameteri: ?*const fn (GLenum, GLenum, GLint) callconv(.c) void = null,
    glTexParameteriv: ?*const fn (GLenum, GLenum, [*c]const GLint) callconv(.c) void = null,
    glTexSubImage2D: ?*const fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*const GLvoid) callconv(.c) void = null,
    glVertexPointer: ?*const fn (GLint, GLenum, GLsizei, ?*const GLvoid) callconv(.c) void = null,
    glViewport: ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.c) void = null,
    glBindFramebufferOES: ?*const fn (GLenum, GLuint) callconv(.c) void = null,
    glFramebufferTexture2DOES: ?*const fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.c) void = null,
    glCheckFramebufferStatusOES: ?*const fn (GLenum) callconv(.c) GLenum = null,
    glDeleteFramebuffersOES: ?*const fn (GLsizei, [*c]const GLuint) callconv(.c) void = null,
    GL_OES_framebuffer_object_supported: bool = false,
    framebuffers: [*c]GLES_FBOList = null,
    window_framebuffer: GLuint = 0,
    GL_OES_blend_func_separate_supported: bool = false,
    GL_OES_blend_equation_separate_supported: bool = false,
    GL_OES_blend_subtract_supported: bool = false,
    GL_EXT_blend_minmax_supported: bool = false,
    drawstate: GLES_DrawStateCache = @import("std").mem.zeroes(GLES_DrawStateCache),
    textype: GLenum = 0,
    pixelart_supported: bool = false,
    debug_enabled: bool = false,
    errors: c_int = 0,
    error_messages: [*c][*c]u8 = null,
};
pub const GLES_TextureData = extern struct {
    texture: GLuint = 0,
    textype: GLenum = 0,
    texw: GLfloat = 0,
    texh: GLfloat = 0,
    format: GLenum = 0,
    formattype: GLenum = 0,
    texture_scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    texture_address_mode_u: GLenum = 0,
    texture_address_mode_v: GLenum = 0,
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    fbo: [*c]GLES_FBOList = null,
};
pub fn GLES_SetError(prefix: [*c]const u8, result: GLenum) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"error": [*c]const u8 = undefined;
    _ = &@"error";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (result) {
                    @as(GLenum, GL_NO_ERROR) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(GLenum, GL_INVALID_ENUM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GLenum, GL_INVALID_VALUE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(GLenum, GL_INVALID_OPERATION) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(GLenum, GL_STACK_OVERFLOW) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(GLenum, GL_STACK_UNDERFLOW) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(GLenum, GL_OUT_OF_MEMORY) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                return SDL_SetError_REAL("%s: %s", prefix, @"error");
            },
            2 => {
                @"error" = "GL_NO_ERROR";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                @"error" = "GL_INVALID_ENUM";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                @"error" = "GL_INVALID_VALUE";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                @"error" = "GL_INVALID_OPERATION";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                @"error" = "GL_STACK_OVERFLOW";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                @"error" = "GL_STACK_UNDERFLOW";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                @"error" = "GL_OUT_OF_MEMORY";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                @"error" = "UNKNOWN";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GLES_LoadFunctions(data: [*c]GLES_RenderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    while (true) {
        data.*.glBindTexture = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindTexture"))));
        if (!(data.*.glBindTexture != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBindTexture"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendFunc"))));
        if (!(data.*.glBlendFunc != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glBlendFunc"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBlendEquationOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendEquationOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glBlendEquationSeparateOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendEquationSeparateOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glBlendFuncSeparateOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBlendFuncSeparateOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glClear = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClear"))));
        if (!(data.*.glClear != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClear"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glClearColor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glClearColor"))));
        if (!(data.*.glClearColor != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glClearColor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColor4f = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColor4f"))));
        if (!(data.*.glColor4f != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColor4f"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glColorPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glColorPointer"))));
        if (!(data.*.glColorPointer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glColorPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteTextures"))));
        if (!(data.*.glDeleteTextures != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDeleteTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisable"))));
        if (!(data.*.glDisable != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDisableClientState = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDisableClientState"))));
        if (!(data.*.glDisableClientState != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDisableClientState"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDrawArrays = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDrawArrays"))));
        if (!(data.*.glDrawArrays != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glDrawArrays"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glDrawTexfOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDrawTexfOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glEnable = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnable"))));
        if (!(data.*.glEnable != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnable"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glEnableClientState = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glEnableClientState"))));
        if (!(data.*.glEnableClientState != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glEnableClientState"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glFinish = SDL_GL_GetProcAddress_REAL("glFinish");
        if (!(data.*.glFinish != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glFinish"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGenFramebuffersOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenFramebuffersOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glGenTextures = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGenTextures"))));
        if (!(data.*.glGenTextures != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGenTextures"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetError = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetError"))));
        if (!(data.*.glGetError != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetError"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glGetIntegerv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
        if (!(data.*.glGetIntegerv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glGetIntegerv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glLoadIdentity = SDL_GL_GetProcAddress_REAL("glLoadIdentity");
        if (!(data.*.glLoadIdentity != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glLoadIdentity"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glMatrixMode = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glMatrixMode"))));
        if (!(data.*.glMatrixMode != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glMatrixMode"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glOrthof = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glOrthof"))));
        if (!(data.*.glOrthof != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glOrthof"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glPixelStorei = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glPixelStorei"))));
        if (!(data.*.glPixelStorei != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glPixelStorei"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glReadPixels = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glReadPixels"))));
        if (!(data.*.glReadPixels != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glReadPixels"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glScissor = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glScissor"))));
        if (!(data.*.glScissor != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glScissor"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexCoordPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexCoordPointer"))));
        if (!(data.*.glTexCoordPointer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexCoordPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexEnvf = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexEnvf"))));
        if (!(data.*.glTexEnvf != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexEnvf"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexImage2D"))));
        if (!(data.*.glTexImage2D != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexParameteri = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexParameteri"))));
        if (!(data.*.glTexParameteri != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexParameteri"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexParameteriv = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexParameteriv"))));
        if (!(data.*.glTexParameteriv != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexParameteriv"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glTexSubImage2D = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glTexSubImage2D"))));
        if (!(data.*.glTexSubImage2D != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glTexSubImage2D"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glVertexPointer = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glVertexPointer"))));
        if (!(data.*.glVertexPointer != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glVertexPointer"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glViewport = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glViewport"))));
        if (!(data.*.glViewport != null)) {
            return SDL_SetError_REAL("Couldn't load GLES function %s: %s", @as([*c]u8, @as([*c]u8, @constCast("glViewport"))), SDL_GetError_REAL());
        }
        if (!false) break;
    }
    while (true) {
        data.*.glBindFramebufferOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindFramebufferOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glFramebufferTexture2DOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glFramebufferTexture2DOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glCheckFramebufferStatusOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCheckFramebufferStatusOES"))));
        if (!false) break;
    }
    while (true) {
        data.*.glDeleteFramebuffersOES = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteFramebuffersOES"))));
        if (!false) break;
    }
    return @"true" != 0;
}
pub fn GLES_GetFBO(data: [*c]GLES_RenderData, w: Uint32, h: Uint32) callconv(.c) [*c]GLES_FBOList {
    @setEvalBranchQuota(100000);
    var result: [*c]GLES_FBOList = data.*.framebuffers;
    _ = &result;
    while ((result != null) and ((result.*.w != w) or (result.*.h != h))) {
        result = result.*.next;
    }
    if (!(result != null)) {
        result = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(GLES_FBOList))));
        result.*.w = w;
        result.*.h = h;
        data.*.glGenFramebuffersOES.?(1, &result.*.FBO);
        result.*.next = data.*.framebuffers;
        data.*.framebuffers = result;
    }
    return result;
}
pub fn GLES_ActivateRenderer(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (SDL_GL_GetCurrentContext_REAL() != data.*.context) {
        if (!SDL_GL_MakeCurrent_REAL(renderer.*.window, data.*.context)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn GLES_WindowEvent(renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_MINIMIZED)) {
        data.*.glFinish.?();
    }
}
pub fn GLES_GetOutputSize(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = SDL_GetWindowSizeInPixels_REAL(renderer.*.window, w, h);
    return @"true" != 0;
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
                return GL_FUNC_ADD_OES;
            },
            3 => {
                return GL_FUNC_SUBTRACT_OES;
            },
            4 => {
                return GL_FUNC_REVERSE_SUBTRACT_OES;
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
pub fn GLES_SupportsBlendMode(renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
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
    if (((srcColorFactor != srcAlphaFactor) or (dstColorFactor != dstAlphaFactor)) and !data.*.GL_OES_blend_func_separate_supported) {
        return @"false" != 0;
    }
    if ((colorOperation != alphaOperation) and !data.*.GL_OES_blend_equation_separate_supported) {
        return @"false" != 0;
    }
    if ((colorOperation != @as(SDL_BlendOperation, SDL_BLENDOPERATION_ADD)) and !data.*.GL_OES_blend_subtract_supported) {
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
pub fn SetTextureScaleMode(data: [*c]GLES_RenderData, textype: GLenum, _: SDL_PixelFormat, scaleMode: SDL_ScaleMode) callconv(.c) bool {
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
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
                data.*.glTexParameteri.?(textype, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
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
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles.c", 333);
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
pub fn SetTextureAddressMode(data: [*c]GLES_RenderData, textype: GLenum, addressModeU: SDL_TextureAddressMode, addressModeV: SDL_TextureAddressMode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_S, TranslateAddressMode(addressModeU));
    data.*.glTexParameteri.?(textype, GL_TEXTURE_WRAP_T, TranslateAddressMode(addressModeV));
}
pub fn GLES_CreateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, _: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GLES_RenderData = undefined;
    _ = &renderdata;
    var data: [*c]GLES_TextureData = undefined;
    _ = &data;
    var internalFormat: GLint = undefined;
    _ = &internalFormat;
    var format: GLenum = undefined;
    _ = &format;
    var textype: GLenum = undefined;
    _ = &textype;
    var texture_w: c_int = undefined;
    _ = &texture_w;
    var texture_h: c_int = undefined;
    _ = &texture_h;
    var result: GLenum = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                renderdata = @ptrCast(@alignCast(renderer.*.internal));
                _ = GLES_ActivateRenderer(renderer);
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 2;
                        continue;
                    },
                    else => {
                        sdl_pc = 3;
                        continue;
                    },
                }
            },
            1 => {
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                internalFormat = GL_RGBA;
                format = GL_RGBA;
                textype = GL_UNSIGNED_BYTE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                return SDL_SetError_REAL("Texture format not supported");
            },
            4 => {
                return SDL_OutOfMemory_REAL();
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                data.*.pitch = texture.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
                data.*.pixels = SDL_calloc_REAL(1, @bitCast(@as(c_long, texture.*.h * data.*.pitch)));
                if (!(data.*.pixels != null)) {
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
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return SDL_OutOfMemory_REAL();
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
                if (!renderdata.*.GL_OES_framebuffer_object_supported) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                data.*.fbo = null;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                _ = renderdata.*.glGetError.?();
                renderdata.*.glEnable.?(GL_TEXTURE_2D);
                renderdata.*.glGenTextures.?(1, &data.*.texture);
                result = renderdata.*.glGetError.?();
                if (result != @as(GLenum, GL_NO_ERROR)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            16 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return SDL_SetError_REAL("GL_OES_framebuffer_object not supported");
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                data.*.fbo = GLES_GetFBO(@ptrCast(@alignCast(renderer.*.internal)), @bitCast(@as(c_int, texture.*.w)), @bitCast(@as(c_int, texture.*.h)));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
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
                data.*.textype = GL_TEXTURE_2D;
                texture_w = SDL_powerof2(texture.*.w);
                texture_h = SDL_powerof2(texture.*.h);
                data.*.texw = @as(GLfloat, @floatFromInt(texture.*.w)) / @as(GLfloat, @floatFromInt(texture_w));
                data.*.texh = @as(GLfloat, @floatFromInt(texture.*.h)) / @as(GLfloat, @floatFromInt(texture_h));
                data.*.format = format;
                data.*.formattype = textype;
                data.*.texture_scale_mode = texture.*.scaleMode;
                data.*.texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
                data.*.texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
                renderdata.*.glBindTexture.?(data.*.textype, data.*.texture);
                renderdata.*.glTexImage2D.?(data.*.textype, 0, internalFormat, texture_w, texture_h, 0, format, textype, null);
                _ = SetTextureScaleMode(renderdata, data.*.textype, texture.*.format, texture.*.scaleMode);
                renderdata.*.glDisable.?(GL_TEXTURE_2D);
                renderdata.*.drawstate.texture = texture;
                renderdata.*.drawstate.texturing = @"false" != 0;
                result = renderdata.*.glGetError.?();
                if (result != @as(GLenum, GL_NO_ERROR)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            22 => {
                SDL_free_REAL(data.*.pixels);
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
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return GLES_SetError("glGenTextures()", result);
            },
            25 => {
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                texture.*.internal = @ptrCast(@alignCast(data));
                return @"true" != 0;
            },
            28 => {
                SDL_free_REAL(data.*.pixels);
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
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return GLES_SetError("glTexImage2D()", result);
            },
            else => unreachable,
        }
    }
}
pub fn GLES_UpdateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, arg_pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var renderdata: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GLES_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var blob: [*c]Uint8 = null;
    _ = &blob;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcPitch: c_int = undefined;
    _ = &srcPitch;
    var y: c_int = undefined;
    _ = &y;
    _ = GLES_ActivateRenderer(renderer);
    if ((rect.*.w <= @as(c_int, 0)) or (rect.*.h <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    srcPitch = rect.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
    src = @ptrCast(@alignCast(@constCast(pixels)));
    if (pitch != srcPitch) {
        blob = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, srcPitch * rect.*.h)))));
        if (!(blob != null)) {
            return SDL_OutOfMemory_REAL();
        }
        src = blob;
        {
            y = 0;
            while (y < rect.*.h) : (y += 1) {
                _ = memcpy(@ptrCast(@alignCast(src)), pixels, @bitCast(@as(c_long, srcPitch)));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcPitch))));
                pixels = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(pixels)))) + @as(usize, @bitCast(@as(isize, @intCast(pitch))))));
            }
        }
        src = blob;
    }
    _ = renderdata.*.glGetError.?();
    renderdata.*.glEnable.?(data.*.textype);
    renderdata.*.glBindTexture.?(data.*.textype, data.*.texture);
    renderdata.*.glPixelStorei.?(GL_UNPACK_ALIGNMENT, 1);
    renderdata.*.glTexSubImage2D.?(data.*.textype, 0, rect.*.x, rect.*.y, rect.*.w, rect.*.h, data.*.format, data.*.formattype, @ptrCast(@alignCast(src)));
    renderdata.*.glDisable.?(data.*.textype);
    SDL_free_REAL(@ptrCast(@alignCast(blob)));
    renderdata.*.drawstate.texture = texture;
    renderdata.*.drawstate.texturing = @"false" != 0;
    if (renderdata.*.glGetError.?() != @as(GLenum, GL_NO_ERROR)) {
        return SDL_SetError_REAL("Failed to update texture");
    }
    return @"true" != 0;
}
pub fn GLES_LockTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    pitch.* = data.*.pitch;
    return @"true" != 0;
}
pub fn GLES_UnlockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    rect.x = 0;
    rect.y = 0;
    rect.w = texture.*.w;
    rect.h = texture.*.h;
    _ = GLES_UpdateTexture(renderer, texture, &rect, data.*.pixels, data.*.pitch);
}
pub fn GLES_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var texturedata: [*c]GLES_TextureData = null;
    _ = &texturedata;
    var status: GLenum = undefined;
    _ = &status;
    if (!data.*.GL_OES_framebuffer_object_supported) {
        return SDL_SetError_REAL("Can't enable render target support in this renderer");
    }
    data.*.drawstate.viewport_dirty = @"true" != 0;
    if (!(texture != null)) {
        data.*.glBindFramebufferOES.?(GL_FRAMEBUFFER_OES, data.*.window_framebuffer);
        return @"true" != 0;
    }
    texturedata = @ptrCast(@alignCast(texture.*.internal));
    data.*.glBindFramebufferOES.?(GL_FRAMEBUFFER_OES, texturedata.*.fbo.*.FBO);
    data.*.glFramebufferTexture2DOES.?(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, texturedata.*.textype, texturedata.*.texture, 0);
    status = data.*.glCheckFramebufferStatusOES.?(GL_FRAMEBUFFER_OES);
    if (status != @as(GLenum, GL_FRAMEBUFFER_COMPLETE_OES)) {
        return SDL_SetError_REAL("glFramebufferTexture2DOES() failed");
    }
    return @"true" != 0;
}
pub fn GLES_QueueSetViewport(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GLES_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
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
pub fn GLES_QueueDrawLines(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
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
pub fn GLES_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var texturedata: [*c]GLES_TextureData = null;
    _ = &texturedata;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    var verts: [*c]GLfloat = undefined;
    _ = &verts;
    var sz: c_int = (@as(c_int, 2) + @as(c_int, 4)) + (if (texture != null) @as(c_int, 2) else @as(c_int, 0));
    _ = &sz;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count * sz))) *% @sizeOf(GLfloat), 0, &cmd.*.data.draw.first)));
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
            col_ = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))));
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
pub fn SetDrawState(data: [*c]GLES_RenderData, cmd: [*c]const SDL_RenderCommand) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const blend: SDL_BlendMode = cmd.*.data.draw.blend;
    _ = &blend;
    if (data.*.drawstate.viewport_dirty) {
        var viewport: [*c]const SDL_Rect = &data.*.drawstate.viewport;
        _ = &viewport;
        const istarget: bool = @as(?*anyopaque, @ptrCast(@alignCast(data.*.drawstate.target))) != @as(?*anyopaque, null);
        _ = &istarget;
        data.*.glMatrixMode.?(GL_PROJECTION);
        data.*.glLoadIdentity.?();
        data.*.glViewport.?(viewport.*.x, if (istarget) viewport.*.y else (data.*.drawstate.drawableh - viewport.*.y) - viewport.*.h, viewport.*.w, viewport.*.h);
        if ((viewport.*.w != 0) and (viewport.*.h != 0)) {
            data.*.glOrthof.?(@floatFromInt(@as(c_int, 0)), @floatFromInt(viewport.*.w), @floatFromInt(if (istarget) @as(c_int, 0) else viewport.*.h), @floatFromInt(if (istarget) viewport.*.h else @as(c_int, 0)), @floatCast(@as(f64, 0.0)), @floatCast(@as(f64, 1.0)));
        }
        data.*.glMatrixMode.?(GL_MODELVIEW);
        data.*.drawstate.viewport_dirty = @"false" != 0;
    }
    if (data.*.drawstate.cliprect_enabled_dirty) {
        if (data.*.drawstate.cliprect_enabled) {
            data.*.glEnable.?(GL_SCISSOR_TEST);
        } else {
            data.*.glDisable.?(GL_SCISSOR_TEST);
        }
        data.*.drawstate.cliprect_enabled_dirty = @"false" != 0;
    }
    if (data.*.drawstate.cliprect_enabled and data.*.drawstate.cliprect_dirty) {
        var viewport: [*c]const SDL_Rect = &data.*.drawstate.viewport;
        _ = &viewport;
        var rect: [*c]const SDL_Rect = &data.*.drawstate.cliprect;
        _ = &rect;
        const istarget: bool = @as(?*anyopaque, @ptrCast(@alignCast(data.*.drawstate.target))) != @as(?*anyopaque, null);
        _ = &istarget;
        data.*.glScissor.?(viewport.*.x + rect.*.x, if (istarget) viewport.*.y + rect.*.y else ((data.*.drawstate.drawableh - viewport.*.y) - rect.*.y) - rect.*.h, rect.*.w, rect.*.h);
        data.*.drawstate.cliprect_dirty = @"false" != 0;
    }
    if (blend != data.*.drawstate.blend) {
        if (blend == SDL_BLENDMODE_NONE) {
            data.*.glDisable.?(GL_BLEND);
        } else {
            data.*.glEnable.?(GL_BLEND);
            if (data.*.GL_OES_blend_func_separate_supported) {
                data.*.glBlendFuncSeparateOES.?(GetBlendFunc(SDL_GetBlendModeSrcColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeSrcAlphaFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstAlphaFactor(blend)));
            } else {
                data.*.glBlendFunc.?(GetBlendFunc(SDL_GetBlendModeSrcColorFactor(blend)), GetBlendFunc(SDL_GetBlendModeDstColorFactor(blend)));
            }
            if (data.*.GL_OES_blend_equation_separate_supported) {
                data.*.glBlendEquationSeparateOES.?(GetBlendEquation(SDL_GetBlendModeColorOperation(blend)), GetBlendEquation(SDL_GetBlendModeAlphaOperation(blend)));
            } else if (data.*.GL_OES_blend_subtract_supported) {
                data.*.glBlendEquationOES.?(GetBlendEquation(SDL_GetBlendModeColorOperation(blend)));
            }
        }
        data.*.drawstate.blend = blend;
    }
    if (@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(cmd.*.data.draw.texture))) != @as(?*anyopaque, null)) != @as(c_int, @intFromBool(data.*.drawstate.texturing))) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(cmd.*.data.draw.texture))) == @as(?*anyopaque, null)) {
            data.*.glDisable.?(GL_TEXTURE_2D);
            data.*.glDisableClientState.?(GL_TEXTURE_COORD_ARRAY);
            data.*.drawstate.texturing = @"false" != 0;
        } else {
            data.*.glEnable.?(GL_TEXTURE_2D);
            data.*.glEnableClientState.?(GL_TEXTURE_COORD_ARRAY);
            data.*.drawstate.texturing = @"true" != 0;
        }
    }
}
pub fn SetCopyState(data: [*c]GLES_RenderData, cmd: [*c]const SDL_RenderCommand) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
    _ = &texture;
    var texturedata: [*c]GLES_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &texturedata;
    const textype: GLenum = data.*.textype;
    _ = &textype;
    SetDrawState(data, cmd);
    if (texture != data.*.drawstate.texture) {
        data.*.glBindTexture.?(GL_TEXTURE_2D, texturedata.*.texture);
        data.*.drawstate.texture = texture;
    }
    if (cmd.*.data.draw.texture_scale_mode != texturedata.*.texture_scale_mode) {
        _ = SetTextureScaleMode(data, textype, texture.*.format, cmd.*.data.draw.texture_scale_mode);
        texturedata.*.texture_scale_mode = cmd.*.data.draw.texture_scale_mode;
    }
    if ((@as(GLenum, @bitCast(@as(c_int, cmd.*.data.draw.texture_address_mode_u))) != texturedata.*.texture_address_mode_u) or (@as(GLenum, @bitCast(@as(c_int, cmd.*.data.draw.texture_address_mode_v))) != texturedata.*.texture_address_mode_v)) {
        SetTextureAddressMode(data, textype, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
        texturedata.*.texture_address_mode_u = @bitCast(@as(c_int, cmd.*.data.draw.texture_address_mode_u));
        texturedata.*.texture_address_mode_v = @bitCast(@as(c_int, cmd.*.data.draw.texture_address_mode_v));
    }
}
pub fn GLES_InvalidateCachedState(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cache: [*c]GLES_DrawStateCache = &@as([*c]GLES_RenderData, @ptrCast(@alignCast(renderer.*.internal))).*.drawstate;
    _ = &cache;
    cache.*.viewport_dirty = @"true" != 0;
    cache.*.texture = null;
    cache.*.drawablew = 0;
    cache.*.drawableh = 0;
    cache.*.blend = SDL_BLENDMODE_INVALID;
    cache.*.cliprect_enabled_dirty = @"true" != 0;
    cache.*.cliprect_dirty = @"true" != 0;
    cache.*.color_dirty = @"true" != 0;
    cache.*.clear_color_dirty = @"true" != 0;
}
pub fn GLES_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, _: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "GLES_RunCommandQueue".*;
    };
    _ = &static_local___func__;
    var data: [*c]GLES_RenderData = undefined;
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
    var verts_5: [*c]const GLfloat = undefined;
    _ = &verts_5;
    var count_6: usize = undefined;
    _ = &count_6;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "count >= 2",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var verts_7: [*c]const GLfloat = undefined;
    _ = &verts_7;
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var count_8: usize = undefined;
    _ = &count_8;
    var stride: c_int = undefined;
    _ = &stride;
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
                if (!GLES_ActivateRenderer(renderer)) {
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
                if (!(renderer.*.target != null)) {
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
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 60;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            12 => {
                return @"true" != 0;
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
                count = cmd.*.data.draw.count;
                verts = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                SetDrawState(data, cmd);
                data.*.glVertexPointer.?(2, GL_FLOAT, 0, @ptrCast(@alignCast(verts)));
                data.*.glDrawArrays.?(GL_POINTS, 0, @bitCast(@as(c_uint, @truncate(count))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            37 => {
                verts_5 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                count_6 = cmd.*.data.draw.count;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                SetDrawState(data, cmd);
                data.*.glVertexPointer.?(2, GL_FLOAT, 0, @ptrCast(@alignCast(verts_5)));
                data.*.glDrawArrays.?(GL_LINE_STRIP, 0, @bitCast(@as(c_uint, @truncate(count_6))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            41 => {
                if (!(count_6 >= @as(usize, 2))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gles.c", 902);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            47 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            53 => {
                verts_7 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                texture = cmd.*.data.draw.texture;
                count_8 = cmd.*.data.draw.count;
                stride = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 2) + @as(c_int, 4)) + (if (texture != null) @as(c_int, 2) else @as(c_int, 0))))) *% @sizeOf(f32))));
                if (texture != null) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                SetCopyState(data, cmd);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                SetDrawState(data, cmd);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                data.*.glEnableClientState.?(GL_COLOR_ARRAY);
                data.*.glVertexPointer.?(2, GL_FLOAT, stride, @ptrCast(@alignCast(verts_7)));
                data.*.glColorPointer.?(4, GL_FLOAT, stride, @ptrCast(@alignCast(verts_7 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))));
                if (texture != null) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                data.*.glTexCoordPointer.?(2, GL_FLOAT, stride, @ptrCast(@alignCast((verts_7 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))));
                {
                    sdl_pc = 59;
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
                data.*.glDrawArrays.?(GL_TRIANGLES, 0, @bitCast(@as(c_uint, @truncate(count_8))));
                data.*.glDisableClientState.?(GL_COLOR_ARRAY);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GLES_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
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
    data.*.glPixelStorei.?(GL_PACK_ALIGNMENT, 1);
    data.*.glReadPixels.?(rect.*.x, y, rect.*.w, rect.*.h, GL_RGBA, GL_UNSIGNED_BYTE, surface.*.pixels);
    if (!(renderer.*.target != null)) {
        _ = SDL_FlipSurface_REAL(surface, SDL_FLIP_VERTICAL);
    }
    return surface;
}
pub fn GLES_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = GLES_ActivateRenderer(renderer);
    return SDL_GL_SwapWindow_REAL(renderer.*.window);
}
pub fn GLES_DestroyTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GLES_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    _ = GLES_ActivateRenderer(renderer);
    if (renderdata.*.drawstate.texture == texture) {
        renderdata.*.drawstate.texture = null;
    }
    if (renderdata.*.drawstate.target == texture) {
        renderdata.*.drawstate.target = null;
    }
    if (!(data != null)) {
        return;
    }
    if (data.*.texture != 0) {
        renderdata.*.glDeleteTextures.?(1, &data.*.texture);
    }
    SDL_free_REAL(data.*.pixels);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    texture.*.internal = null;
}
pub fn GLES_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (data != null) {
        if (data.*.context != null) {
            while (data.*.framebuffers != null) {
                var nextnode: [*c]GLES_FBOList = data.*.framebuffers.*.next;
                _ = &nextnode;
                data.*.glDeleteFramebuffersOES.?(1, &data.*.framebuffers.*.FBO);
                SDL_free_REAL(@ptrCast(@alignCast(data.*.framebuffers)));
                data.*.framebuffers = nextnode;
            }
            _ = SDL_GL_DestroyContext_REAL(data.*.context);
        }
        SDL_free_REAL(@ptrCast(@alignCast(data)));
    }
}
pub fn GLES_SetVSync(_: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool {
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
pub fn GLES_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GLES_RenderData = undefined;
    _ = &data;
    var value: GLint = undefined;
    _ = &value;
    var window_flags: Uint32 = undefined;
    _ = &window_flags;
    var profile_mask: c_int = undefined;
    _ = &profile_mask;
    var major: c_int = undefined;
    _ = &major;
    var minor: c_int = undefined;
    _ = &minor;
    var changed_window: bool = undefined;
    _ = &changed_window;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = null;
                profile_mask = 0;
                major = 0;
                minor = 0;
                changed_window = @"false" != 0;
                SDL_SetupRendererColorspace(renderer, create_props);
                _ = SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, &profile_mask);
                _ = SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, &major);
                _ = SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, &minor);
                _ = SDL_SyncWindow_REAL(window);
                window_flags = @truncate(SDL_GetWindowFlags_REAL(window));
                if (((!((@as(c_ulong, window_flags) & @as(c_ulong, 2)) != 0) or (profile_mask != SDL_GL_CONTEXT_PROFILE_ES)) or (major != RENDERER_CONTEXT_MAJOR)) or (minor != RENDERER_CONTEXT_MINOR)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (changed_window) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            2 => {
                changed_window = @"true" != 0;
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, RENDERER_CONTEXT_MAJOR);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, RENDERER_CONTEXT_MINOR);
                if (!SDL_ReconfigureWindow(window, (@as(c_ulong, window_flags) & ~(@as(c_ulong, 268435456) | @as(c_ulong, 536870912))) | @as(c_ulong, 2))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                _ = SDL_OutOfMemory_REAL();
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
                renderer.*.WindowEvent = GLES_WindowEvent;
                renderer.*.GetOutputSize = GLES_GetOutputSize;
                renderer.*.SupportsBlendMode = GLES_SupportsBlendMode;
                renderer.*.CreateTexture = GLES_CreateTexture;
                renderer.*.UpdateTexture = GLES_UpdateTexture;
                renderer.*.LockTexture = GLES_LockTexture;
                renderer.*.UnlockTexture = GLES_UnlockTexture;
                renderer.*.SetRenderTarget = GLES_SetRenderTarget;
                renderer.*.QueueSetViewport = GLES_QueueSetViewport;
                renderer.*.QueueSetDrawColor = GLES_QueueSetViewport;
                renderer.*.QueueDrawPoints = GLES_QueueDrawPoints;
                renderer.*.QueueDrawLines = GLES_QueueDrawLines;
                renderer.*.QueueGeometry = GLES_QueueGeometry;
                renderer.*.InvalidateCachedState = GLES_InvalidateCachedState;
                renderer.*.RunCommandQueue = GLES_RunCommandQueue;
                renderer.*.RenderReadPixels = GLES_RenderReadPixels;
                renderer.*.RenderPresent = GLES_RenderPresent;
                renderer.*.DestroyTexture = GLES_DestroyTexture;
                renderer.*.DestroyRenderer = GLES_DestroyRenderer;
                renderer.*.SetVSync = GLES_SetVSync;
                renderer.*.internal = @ptrCast(@alignCast(data));
                GLES_InvalidateCachedState(renderer);
                renderer.*.window = window;
                renderer.*.name = GLES_RenderDriver.name;
                data.*.context = SDL_GL_CreateContext_REAL(window);
                if (!(data.*.context != null)) {
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
                if (!SDL_GL_MakeCurrent_REAL(window, data.*.context)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
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
                if (!GLES_LoadFunctions(data)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBA32);
                if (SDL_GL_GetAttribute_REAL(SDL_GL_CONTEXT_FLAGS, &value) and ((value & SDL_GL_CONTEXT_DEBUG_FLAG) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                data.*.debug_enabled = @"true" != 0;
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
                value = 0;
                data.*.glGetIntegerv.?(GL_MAX_TEXTURE_SIZE, &value);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", value);
                if (SDL_GL_ExtensionSupported_REAL("GL_OES_framebuffer_object") or (data.*.glGenFramebuffersOES != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                data.*.GL_OES_framebuffer_object_supported = @"true" != 0;
                value = 0;
                data.*.glGetIntegerv.?(GL_FRAMEBUFFER_BINDING_OES, &value);
                data.*.window_framebuffer = @bitCast(@as(c_int, value));
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
                data.*.framebuffers = null;
                if (SDL_GL_ExtensionSupported_REAL("GL_OES_blend_func_separate")) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                data.*.GL_OES_blend_func_separate_supported = @"true" != 0;
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
                if (SDL_GL_ExtensionSupported_REAL("GL_OES_blend_equation_separate")) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                data.*.GL_OES_blend_equation_separate_supported = @"true" != 0;
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
                if (SDL_GL_ExtensionSupported_REAL("GL_OES_blend_subtract")) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                data.*.GL_OES_blend_subtract_supported = @"true" != 0;
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
                if (SDL_GL_ExtensionSupported_REAL("GL_EXT_blend_minmax")) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                data.*.GL_EXT_blend_minmax_supported = @"true" != 0;
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
                data.*.textype = GL_TEXTURE_2D;
                data.*.glDisable.?(GL_DEPTH_TEST);
                data.*.glDisable.?(GL_CULL_FACE);
                data.*.glMatrixMode.?(GL_MODELVIEW);
                data.*.glLoadIdentity.?();
                data.*.glEnableClientState.?(GL_VERTEX_ARRAY);
                data.*.glDisableClientState.?(GL_TEXTURE_COORD_ARRAY);
                data.*.glClearColor.?(1.0, 1.0, 1.0, 1.0);
                data.*.drawstate.blend = SDL_BLENDMODE_INVALID;
                return @"true" != 0;
            },
            38 => {
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_PROFILE_MASK, profile_mask);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MAJOR_VERSION, major);
                _ = SDL_GL_SetAttribute_REAL(SDL_GL_CONTEXT_MINOR_VERSION, minor);
                _ = SDL_RecreateWindow(window, window_flags);
                {
                    sdl_pc = 40;
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export var GLES_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = GLES_CreateRenderer,
    .name = "opengles",
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_INVALID = __helpers.promoteIntLiteral(c_uint, 0x7FFFFFFF, .hex);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_DEBUG_FLAG = @as(c_int, 0x0001);
pub const GL_COLOR_BUFFER_BIT = @as(c_int, 0x00004000);
pub const GL_POINTS = @as(c_int, 0x0000);
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
pub const GL_TEXTURE_2D = @as(c_int, 0x0DE1);
pub const GL_CULL_FACE = @as(c_int, 0x0B44);
pub const GL_BLEND = @as(c_int, 0x0BE2);
pub const GL_DEPTH_TEST = @as(c_int, 0x0B71);
pub const GL_SCISSOR_TEST = @as(c_int, 0x0C11);
pub const GL_VERTEX_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8074, .hex);
pub const GL_COLOR_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8076, .hex);
pub const GL_TEXTURE_COORD_ARRAY = __helpers.promoteIntLiteral(c_int, 0x8078, .hex);
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_INVALID_ENUM = @as(c_int, 0x0500);
pub const GL_INVALID_VALUE = @as(c_int, 0x0501);
pub const GL_INVALID_OPERATION = @as(c_int, 0x0502);
pub const GL_STACK_OVERFLOW = @as(c_int, 0x0503);
pub const GL_STACK_UNDERFLOW = @as(c_int, 0x0504);
pub const GL_OUT_OF_MEMORY = @as(c_int, 0x0505);
pub const GL_MAX_TEXTURE_SIZE = @as(c_int, 0x0D33);
pub const GL_UNSIGNED_BYTE = @as(c_int, 0x1401);
pub const GL_FLOAT = @as(c_int, 0x1406);
pub const GL_MODELVIEW = @as(c_int, 0x1700);
pub const GL_PROJECTION = @as(c_int, 0x1701);
pub const GL_RGBA = @as(c_int, 0x1908);
pub const GL_UNPACK_ALIGNMENT = @as(c_int, 0x0CF5);
pub const GL_PACK_ALIGNMENT = @as(c_int, 0x0D05);
pub const GL_NEAREST = @as(c_int, 0x2600);
pub const GL_LINEAR = @as(c_int, 0x2601);
pub const GL_TEXTURE_MAG_FILTER = @as(c_int, 0x2800);
pub const GL_TEXTURE_MIN_FILTER = @as(c_int, 0x2801);
pub const GL_TEXTURE_WRAP_S = @as(c_int, 0x2802);
pub const GL_TEXTURE_WRAP_T = @as(c_int, 0x2803);
pub const GL_REPEAT = @as(c_int, 0x2901);
pub const GL_CLAMP_TO_EDGE = __helpers.promoteIntLiteral(c_int, 0x812F, .hex);
pub const GL_FUNC_ADD_OES = __helpers.promoteIntLiteral(c_int, 0x8006, .hex);
pub const GL_FUNC_SUBTRACT_OES = __helpers.promoteIntLiteral(c_int, 0x800A, .hex);
pub const GL_FUNC_REVERSE_SUBTRACT_OES = __helpers.promoteIntLiteral(c_int, 0x800B, .hex);
pub const GL_FRAMEBUFFER_OES = __helpers.promoteIntLiteral(c_int, 0x8D40, .hex);
pub const GL_COLOR_ATTACHMENT0_OES = __helpers.promoteIntLiteral(c_int, 0x8CE0, .hex);
pub const GL_FRAMEBUFFER_COMPLETE_OES = __helpers.promoteIntLiteral(c_int, 0x8CD5, .hex);
pub const GL_FRAMEBUFFER_BINDING_OES = __helpers.promoteIntLiteral(c_int, 0x8CA6, .hex);
pub const GL_MIN_EXT = __helpers.promoteIntLiteral(c_int, 0x8007, .hex);
pub const GL_MAX_EXT = __helpers.promoteIntLiteral(c_int, 0x8008, .hex);
pub const RENDERER_CONTEXT_MAJOR = @as(c_int, 1);
pub const RENDERER_CONTEXT_MINOR = @as(c_int, 1);
