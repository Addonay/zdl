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
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_roundf_REAL(x: f32) f32;
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
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const SDL_BlendMode = Uint32;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PACKEDORDER_XRGB: c_int = 1;
pub const SDL_PACKEDORDER_RGBX: c_int = 2;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_XBGR: c_int = 5;
pub const SDL_PACKEDORDER_BGRX: c_int = 6;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_XRGB4444: c_int = 353504258;
pub const SDL_PIXELFORMAT_XBGR4444: c_int = 357698562;
pub const SDL_PIXELFORMAT_XRGB1555: c_int = 353570562;
pub const SDL_PIXELFORMAT_XBGR1555: c_int = 357764866;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_ABGR4444: c_int = 359796738;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_ABGR1555: c_int = 359862274;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
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
pub extern fn SDL_CreatePalette_REAL(ncolors: c_int) [*c]SDL_Palette;
pub extern fn SDL_SetPaletteColors_REAL(palette: [*c]SDL_Palette, colors: [*c]const SDL_Color, firstcolor: c_int, ncolors: c_int) bool;
pub extern fn SDL_DestroyPalette_REAL(palette: [*c]SDL_Palette) void;
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
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_PIXELART: c_int = 2;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
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
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SetSurfacePalette_REAL(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) bool;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SetSurfaceRLE_REAL(surface: [*c]SDL_Surface, enabled: bool) bool;
pub extern fn SDL_SurfaceHasRLE_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_SetSurfaceColorMod_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8) bool;
pub extern fn SDL_GetSurfaceColorMod_REAL(surface: [*c]SDL_Surface, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool;
pub extern fn SDL_SetSurfaceAlphaMod_REAL(surface: [*c]SDL_Surface, alpha: Uint8) bool;
pub extern fn SDL_GetSurfaceAlphaMod_REAL(surface: [*c]SDL_Surface, alpha: [*c]Uint8) bool;
pub extern fn SDL_SetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_SetSurfaceClipRect_REAL(surface: [*c]SDL_Surface, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_FillSurfaceRect_REAL(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: Uint32) bool;
pub extern fn SDL_FillSurfaceRects_REAL(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, color: Uint32) bool;
pub extern fn SDL_BlitSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_BlitSurfaceScaled_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_MapSurfaceRGBA_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
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
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetWindowSurface_REAL(window: [*c]SDL_Window) [*c]SDL_Surface;
pub extern fn SDL_UpdateWindowSurface_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_DestroyWindowSurface_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_SetHint_REAL(name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
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
pub extern fn SDL_SurfaceValid(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_CreateSurfaceZeroed(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
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
pub extern fn SDL_AllocateRenderVertices(renderer: [*c]SDL_Renderer, numbytes: usize, alignment: usize, offset: [*c]usize) ?*anyopaque;
pub extern fn SDL_BlendFillRects(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
pub extern fn SDL_BlendLines(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
pub extern fn SDL_BlendPoints(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool;
pub extern fn SDL_DrawLines(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, color: Uint32) bool;
pub extern fn SDL_DrawPoints(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, color: Uint32) bool;
pub extern fn SDL_SW_FillTriangle(dst: [*c]SDL_Surface, d0: [*c]SDL_Point, d1: [*c]SDL_Point, d2: [*c]SDL_Point, blend: SDL_BlendMode, c0: SDL_Color, c1: SDL_Color, c2: SDL_Color) bool;
pub extern fn SDL_SW_BlitTriangle(src: [*c]SDL_Surface, s0: [*c]SDL_Point, s1: [*c]SDL_Point, s2: [*c]SDL_Point, dst: [*c]SDL_Surface, d0: [*c]SDL_Point, d1: [*c]SDL_Point, d2: [*c]SDL_Point, c0: SDL_Color, c1: SDL_Color, c2: SDL_Color, texture_address_mode_u: SDL_TextureAddressMode, texture_address_mode_v: SDL_TextureAddressMode) bool;
pub extern fn trianglepoint_2_fixedpoint(a: [*c]SDL_Point) void;
pub extern fn SDL_DuplicatePixels(width: c_int, height: c_int, format: SDL_PixelFormat, colorspace: SDL_Colorspace, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDLgfx_rotateSurface(src: [*c]SDL_Surface, angle: f64, smooth: c_int, flipx: c_int, flipy: c_int, rect_dest: [*c]const SDL_Rect, cangle: f64, sangle: f64, center: [*c]const SDL_FPoint) [*c]SDL_Surface;
pub extern fn SDLgfx_rotozoomSurfaceSizeTrig(width: c_int, height: c_int, angle: f64, center: [*c]const SDL_FPoint, rect_dest: [*c]SDL_Rect, cangle: [*c]f64, sangle: [*c]f64) void;
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SW_DrawStateCache = extern struct {
    viewport: [*c]const SDL_Rect = null,
    cliprect: [*c]const SDL_Rect = null,
    surface_cliprect_dirty: bool = false,
    color: SDL_Color = @import("std").mem.zeroes(SDL_Color),
};
pub const SW_RenderData = extern struct {
    surface: [*c]SDL_Surface = null,
    window: [*c]SDL_Surface = null,
};
pub fn SW_ActivateRenderer(renderer: [*c]SDL_Renderer) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var window: [*c]SDL_Window = renderer.*.window;
    _ = &window;
    if (!(data.*.surface != null)) {
        data.*.surface = data.*.window;
    }
    if ((window != null) and (!(data.*.surface != null) or !window.*.surface_valid)) {
        var surface: [*c]SDL_Surface = SDL_GetWindowSurface_REAL(window);
        _ = &surface;
        if (surface != null) {
            data.*.surface = blk: {
                const tmp = surface;
                data.*.window = tmp;
                break :blk tmp;
            };
        }
    }
    return data.*.surface;
}
pub fn SW_WindowEvent(renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (event.*.type == @as(SDL_EventType, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED)) {
        data.*.surface = null;
        data.*.window = null;
    }
}
pub fn SW_GetOutputSize(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (data.*.surface != null) {
        if (w != null) {
            w.* = data.*.surface.*.w;
        }
        if (h != null) {
            h.* = data.*.surface.*.h;
        }
        return @"true" != 0;
    }
    if (renderer.*.window != null) {
        _ = SDL_GetWindowSizeInPixels_REAL(renderer.*.window, w, h);
        return @"true" != 0;
    }
    return SDL_SetError_REAL("Software renderer doesn't have an output surface");
}
pub fn SW_CreatePalette(_: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface_palette: [*c]SDL_Palette = SDL_CreatePalette_REAL(256);
    _ = &surface_palette;
    if (!(surface_palette != null)) {
        return @"false" != 0;
    }
    palette.*.internal = @ptrCast(@alignCast(surface_palette));
    return @"true" != 0;
}
pub fn SW_UpdatePalette(_: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface_palette: [*c]SDL_Palette = @ptrCast(@alignCast(palette.*.internal));
    _ = &surface_palette;
    return SDL_SetPaletteColors_REAL(surface_palette, colors, 0, ncolors);
}
pub fn SW_DestroyPalette(_: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var surface_palette: [*c]SDL_Palette = @ptrCast(@alignCast(palette.*.internal));
    _ = &surface_palette;
    SDL_DestroyPalette_REAL(surface_palette);
}
pub fn SW_ChangeTexturePalette(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &surface;
    var surface_palette: [*c]SDL_Palette = null;
    _ = &surface_palette;
    if (texture.*.palette != null) {
        surface_palette = @ptrCast(@alignCast(texture.*.palette.*.internal));
    }
    return SDL_SetSurfacePalette_REAL(surface, surface_palette);
}
pub fn SW_CreateTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, _: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = SDL_CreateSurfaceUninitialized(texture.*.w, texture.*.h, texture.*.format);
    _ = &surface;
    if (!(surface != null)) {
        return SDL_SetError_REAL("Can't create surface");
    }
    texture.*.internal = @ptrCast(@alignCast(surface));
    var r: Uint8 = @intFromFloat(SDL_roundf_REAL((if (texture.*.color.r < @as(f32, 0.0)) @as(f32, 0.0) else if (texture.*.color.r > @as(f32, 1.0)) @as(f32, 1.0) else texture.*.color.r) * @as(f32, 255.0)));
    _ = &r;
    var g: Uint8 = @intFromFloat(SDL_roundf_REAL((if (texture.*.color.g < @as(f32, 0.0)) @as(f32, 0.0) else if (texture.*.color.g > @as(f32, 1.0)) @as(f32, 1.0) else texture.*.color.g) * @as(f32, 255.0)));
    _ = &g;
    var b: Uint8 = @intFromFloat(SDL_roundf_REAL((if (texture.*.color.b < @as(f32, 0.0)) @as(f32, 0.0) else if (texture.*.color.b > @as(f32, 1.0)) @as(f32, 1.0) else texture.*.color.b) * @as(f32, 255.0)));
    _ = &b;
    var a: Uint8 = @intFromFloat(SDL_roundf_REAL((if (texture.*.color.a < @as(f32, 0.0)) @as(f32, 0.0) else if (texture.*.color.a > @as(f32, 1.0)) @as(f32, 1.0) else texture.*.color.a) * @as(f32, 255.0)));
    _ = &a;
    _ = SDL_SetSurfaceColorMod_REAL(surface, r, g, b);
    _ = SDL_SetSurfaceAlphaMod_REAL(surface, a);
    _ = SDL_SetSurfaceBlendMode_REAL(surface, texture.*.blendMode);
    if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        surface.*.palette = SDL_CreatePalette_REAL(@as(c_int, 1) << @intCast(if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))));
        if (!(surface.*.palette != null)) {
            return SDL_SetError_REAL("Can't create palette");
        }
    }
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STATIC)) {
        _ = SDL_SetSurfaceRLE_REAL(surface, @"true" != 0);
    }
    return @"true" != 0;
}
pub fn SW_UpdateTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &surface;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var row: c_int = undefined;
    _ = &row;
    var length: usize = undefined;
    _ = &length;
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(surface)) {
            return @"false" != 0;
        }
    }
    src = @ptrCast(@alignCast(@constCast(pixels)));
    dst = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * @as(c_int, surface.*.fmt.*.bytes_per_pixel)))));
    length = @as(usize, @bitCast(@as(c_long, rect.*.w))) *% @as(usize, @bitCast(@as(c_long, @as(c_int, surface.*.fmt.*.bytes_per_pixel))));
    {
        row = 0;
        while (row < rect.*.h) : (row += 1) {
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
            src += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
        }
    }
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        SDL_UnlockSurface_REAL(surface);
    }
    return @"true" != 0;
}
pub fn SW_LockTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &surface;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * @as(c_int, surface.*.fmt.*.bytes_per_pixel)))))));
    pitch.* = surface.*.pitch;
    return @"true" != 0;
}
pub fn SW_UnlockTexture(_: [*c]SDL_Renderer, _: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SW_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (texture != null) {
        data.*.surface = @ptrCast(@alignCast(texture.*.internal));
    } else {
        data.*.surface = data.*.window;
    }
    return @"true" != 0;
}
pub fn SW_QueueNoOp(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SW_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, arg_points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var points = arg_points;
    _ = &points;
    var verts: [*c]SDL_Point = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(SDL_Point), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var i: c_int = undefined;
    _ = &i;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    {
        i = 0;
        while (i < count) : ({
            i += 1;
            verts += 1;
            points += 1;
        }) {
            verts.*.x = @intFromFloat(points.*.x);
            verts.*.y = @intFromFloat(points.*.y);
        }
    }
    return @"true" != 0;
}
pub fn SW_QueueFillRects(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, arg_rects: [*c]const SDL_FRect, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rects = arg_rects;
    _ = &rects;
    var verts: [*c]SDL_Rect = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(SDL_Rect), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    var i: c_int = undefined;
    _ = &i;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    {
        i = 0;
        while (i < count) : ({
            i += 1;
            verts += 1;
            rects += 1;
        }) {
            verts.*.x = @intFromFloat(rects.*.x);
            verts.*.w = @intFromFloat(rects.*.w);
            if (verts.*.w < @as(c_int, 0)) {
                verts.*.w = -verts.*.w;
                verts.*.x -= verts.*.w;
            }
            verts.*.y = @intFromFloat(rects.*.y);
            verts.*.h = @intFromFloat(rects.*.h);
            if (verts.*.h < @as(c_int, 0)) {
                verts.*.h = -verts.*.h;
                verts.*.y -= verts.*.h;
            }
        }
    }
    return @"true" != 0;
}
pub fn SW_QueueCopy(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, _: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var verts: [*c]SDL_Rect = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(c_ulong, 2) *% @sizeOf(SDL_Rect), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = 1;
    verts.*.x = @intFromFloat(srcrect.*.x);
    verts.*.y = @intFromFloat(srcrect.*.y);
    verts.*.w = @intFromFloat(srcrect.*.w);
    verts.*.h = @intFromFloat(srcrect.*.h);
    verts += 1;
    verts.*.x = @intFromFloat(dstrect.*.x);
    verts.*.y = @intFromFloat(dstrect.*.y);
    verts.*.w = @intFromFloat(dstrect.*.w);
    verts.*.h = @intFromFloat(dstrect.*.h);
    return @"true" != 0;
}
pub const struct_CopyExData = extern struct {
    srcrect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    dstrect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    angle: f64 = 0,
    center: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    flip: SDL_FlipMode = @import("std").mem.zeroes(SDL_FlipMode),
    scale_x: f32 = 0,
    scale_y: f32 = 0,
};
pub const CopyExData = struct_CopyExData;
pub fn SW_QueueCopyEx(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, _: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &angle;
    _ = &flip;
    var verts: [*c]CopyExData = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @sizeOf(CopyExData), 0, &cmd.*.data.draw.first)));
    _ = &verts;
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = 1;
    verts.*.srcrect.x = @intFromFloat(srcrect.*.x);
    verts.*.srcrect.y = @intFromFloat(srcrect.*.y);
    verts.*.srcrect.w = @intFromFloat(srcrect.*.w);
    verts.*.srcrect.h = @intFromFloat(srcrect.*.h);
    verts.*.dstrect.x = @intFromFloat(dstrect.*.x);
    verts.*.dstrect.y = @intFromFloat(dstrect.*.y);
    verts.*.dstrect.w = @intFromFloat(dstrect.*.w);
    verts.*.dstrect.h = @intFromFloat(dstrect.*.h);
    verts.*.angle = angle;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&verts.*.center).*)) == @sizeOf(@TypeOf(center.*)))) @compileError("static assertion failed \"sizeof (*(&verts->center)) == sizeof (*( center))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&verts.*.center)), @ptrCast(@alignCast(center)), @sizeOf(@TypeOf(center.*)));
    verts.*.flip = flip;
    verts.*.scale_x = scale_x;
    verts.*.scale_y = scale_y;
    return @"true" != 0;
}
pub fn Blit_to_Screen(src: [*c]SDL_Surface, srcrect: [*c]SDL_Rect, surface: [*c]SDL_Surface, dstrect: [*c]SDL_Rect, scale_x: f32, scale_y: f32, scaleMode: SDL_ScaleMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if ((scale_x != @as(f32, 1.0)) or (scale_y != @as(f32, 1.0))) {
        var r: SDL_Rect = undefined;
        _ = &r;
        r.x = @intFromFloat(@as(f32, @floatFromInt(dstrect.*.x)) * scale_x);
        r.y = @intFromFloat(@as(f32, @floatFromInt(dstrect.*.y)) * scale_y);
        r.w = @intFromFloat(@as(f32, @floatFromInt(dstrect.*.w)) * scale_x);
        r.h = @intFromFloat(@as(f32, @floatFromInt(dstrect.*.h)) * scale_y);
        result = SDL_BlitSurfaceScaled_REAL(src, srcrect, surface, &r, scaleMode);
    } else {
        result = SDL_BlitSurface_REAL(src, srcrect, surface, dstrect);
    }
    return result;
}
pub fn SW_RenderCopyEx(_: [*c]SDL_Renderer, surface: [*c]SDL_Surface, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_Rect, final_rect: [*c]const SDL_Rect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode, scale_x: f32, scale_y: f32, scaleMode: SDL_ScaleMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &angle;
    _ = &flip;
    _ = &scaleMode;
    var src: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &src;
    var tmp_rect: SDL_Rect = undefined;
    _ = &tmp_rect;
    var src_clone: [*c]SDL_Surface = undefined;
    _ = &src_clone;
    var src_rotated: [*c]SDL_Surface = undefined;
    _ = &src_rotated;
    var src_scaled: [*c]SDL_Surface = undefined;
    _ = &src_scaled;
    var mask: [*c]SDL_Surface = null;
    _ = &mask;
    var mask_rotated: [*c]SDL_Surface = null;
    _ = &mask_rotated;
    var result: bool = @"true" != 0;
    _ = &result;
    var blendmode: SDL_BlendMode = undefined;
    _ = &blendmode;
    var alphaMod: Uint8 = undefined;
    _ = &alphaMod;
    var rMod: Uint8 = undefined;
    _ = &rMod;
    var gMod: Uint8 = undefined;
    _ = &gMod;
    var bMod: Uint8 = undefined;
    _ = &bMod;
    var applyModulation: c_int = @"false";
    _ = &applyModulation;
    var blitRequired: c_int = @"false";
    _ = &blitRequired;
    var isOpaque: c_int = @"false";
    _ = &isOpaque;
    if (!SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    tmp_rect.x = 0;
    tmp_rect.y = 0;
    tmp_rect.w = final_rect.*.w;
    tmp_rect.h = final_rect.*.h;
    if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(src)) {
            return @"false" != 0;
        }
    }
    src_clone = SDL_CreateSurfaceFrom_REAL(src.*.w, src.*.h, src.*.format, src.*.pixels, src.*.pitch);
    if (!(src_clone != null)) {
        if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            SDL_UnlockSurface_REAL(src);
        }
        return @"false" != 0;
    }
    if (src.*.palette != null) {
        _ = SDL_SetSurfacePalette_REAL(src_clone, src.*.palette);
    }
    _ = SDL_GetSurfaceBlendMode_REAL(src, &blendmode);
    _ = SDL_GetSurfaceAlphaMod_REAL(src, &alphaMod);
    _ = SDL_GetSurfaceColorMod_REAL(src, &rMod, &gMod, &bMod);
    if (!(((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 32)) and (((src.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888)))) {
        blitRequired = @"true";
    }
    if (!((((srcrect.*.w == final_rect.*.w) and (srcrect.*.h == final_rect.*.h)) and (srcrect.*.x == @as(c_int, 0))) and (srcrect.*.y == @as(c_int, 0)))) {
        blitRequired = @"true";
    }
    if (!((((srcrect.*.w == src.*.w) and (srcrect.*.h == src.*.h)) and (srcrect.*.x == @as(c_int, 0))) and (srcrect.*.y == @as(c_int, 0)))) {
        blitRequired = @"true";
    }
    if ((((blendmode == SDL_BLENDMODE_NONE) or (blendmode == SDL_BLENDMODE_MOD)) or (blendmode == SDL_BLENDMODE_MUL)) and ((((@as(c_int, alphaMod) & @as(c_int, rMod)) & @as(c_int, gMod)) & @as(c_int, bMod)) != @as(c_int, 255))) {
        applyModulation = @"true";
        _ = SDL_SetSurfaceAlphaMod_REAL(src_clone, alphaMod);
        _ = SDL_SetSurfaceColorMod_REAL(src_clone, rMod, gMod, bMod);
    }
    if (((blendmode == SDL_BLENDMODE_NONE) and !(((!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) and (@as(c_int, alphaMod) == @as(c_int, 255))) {
        isOpaque = @"true";
    }
    if ((blendmode == SDL_BLENDMODE_NONE) and !(isOpaque != 0)) {
        mask = SDL_CreateSurfaceZeroed(final_rect.*.w, final_rect.*.h, SDL_PIXELFORMAT_ARGB8888);
        if (!(mask != null)) {
            result = @"false" != 0;
        } else {
            _ = SDL_SetSurfaceBlendMode_REAL(mask, SDL_BLENDMODE_MOD);
        }
    }
    if (result and ((blitRequired != 0) or (applyModulation != 0))) {
        var scale_rect: SDL_Rect = tmp_rect;
        _ = &scale_rect;
        src_scaled = SDL_CreateSurfaceUninitialized(final_rect.*.w, final_rect.*.h, SDL_PIXELFORMAT_ARGB8888);
        if (!(src_scaled != null)) {
            result = @"false" != 0;
        } else {
            _ = SDL_SetSurfaceBlendMode_REAL(src_clone, SDL_BLENDMODE_NONE);
            result = SDL_BlitSurfaceScaled_REAL(src_clone, srcrect, src_scaled, &scale_rect, scaleMode);
            SDL_DestroySurface_REAL(src_clone);
            src_clone = src_scaled;
            src_scaled = null;
        }
    }
    _ = SDL_SetSurfaceBlendMode_REAL(src_clone, blendmode);
    if (result) {
        var rect_dest: SDL_Rect = undefined;
        _ = &rect_dest;
        var cangle: f64 = undefined;
        _ = &cangle;
        var sangle: f64 = undefined;
        _ = &sangle;
        SDLgfx_rotozoomSurfaceSizeTrig(tmp_rect.w, tmp_rect.h, angle, center, &rect_dest, &cangle, &sangle);
        src_rotated = SDLgfx_rotateSurface(src_clone, angle, if ((scaleMode == SDL_SCALEMODE_NEAREST) or (scaleMode == SDL_SCALEMODE_PIXELART)) @as(c_int, 0) else @as(c_int, 1), @bitCast(flip & @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL)), @bitCast(flip & @as(SDL_FlipMode, SDL_FLIP_VERTICAL)), &rect_dest, cangle, sangle, center);
        if (!(src_rotated != null)) {
            result = @"false" != 0;
        }
        if (result and (mask != null)) {
            mask_rotated = SDLgfx_rotateSurface(mask, angle, @"false", 0, 0, &rect_dest, cangle, sangle, center);
            if (!(mask_rotated != null)) {
                result = @"false" != 0;
            }
        }
        if (result) {
            tmp_rect.x = final_rect.*.x + rect_dest.x;
            tmp_rect.y = final_rect.*.y + rect_dest.y;
            tmp_rect.w = rect_dest.w;
            tmp_rect.h = rect_dest.h;
            if ((blendmode != SDL_BLENDMODE_NONE) or (isOpaque != 0)) {
                if (applyModulation == @"false") {
                    _ = SDL_SetSurfaceAlphaMod_REAL(src_rotated, alphaMod);
                    _ = SDL_SetSurfaceColorMod_REAL(src_rotated, rMod, gMod, bMod);
                }
                result = Blit_to_Screen(src_rotated, null, surface, &tmp_rect, scale_x, scale_y, scaleMode);
            } else {
                var mask_rect: SDL_Rect = tmp_rect;
                _ = &mask_rect;
                _ = SDL_SetSurfaceBlendMode_REAL(mask_rotated, SDL_BLENDMODE_NONE);
                result = Blit_to_Screen(mask_rotated, null, surface, &mask_rect, scale_x, scale_y, scaleMode);
                if (result) {
                    _ = SDL_SetSurfaceColorMod_REAL(src_rotated, 0, 0, 0);
                    mask_rect = tmp_rect;
                    result = Blit_to_Screen(src_rotated, null, surface, &mask_rect, scale_x, scale_y, scaleMode);
                    if (result) {
                        var src_rotated_rgb: [*c]SDL_Surface = SDL_CreateSurfaceFrom_REAL(src_rotated.*.w, src_rotated.*.h, src_rotated.*.format, src_rotated.*.pixels, src_rotated.*.pitch);
                        _ = &src_rotated_rgb;
                        if (!(src_rotated_rgb != null)) {
                            result = @"false" != 0;
                        } else {
                            _ = SDL_SetSurfaceBlendMode_REAL(src_rotated_rgb, SDL_BLENDMODE_ADD);
                            result = Blit_to_Screen(src_rotated_rgb, null, surface, &tmp_rect, scale_x, scale_y, scaleMode);
                            SDL_DestroySurface_REAL(src_rotated_rgb);
                        }
                    }
                }
                SDL_DestroySurface_REAL(mask_rotated);
            }
            if (src_rotated != null) {
                SDL_DestroySurface_REAL(src_rotated);
            }
        }
    }
    if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        SDL_UnlockSurface_REAL(src);
    }
    if (mask != null) {
        SDL_DestroySurface_REAL(mask);
    }
    if (src_clone != null) {
        SDL_DestroySurface_REAL(src_clone);
    }
    return result;
}
pub const struct_GeometryFillData = extern struct {
    dst: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    color: SDL_Color = @import("std").mem.zeroes(SDL_Color),
};
pub const GeometryFillData = struct_GeometryFillData;
pub const struct_GeometryCopyData = extern struct {
    src: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    dst: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    color: SDL_Color = @import("std").mem.zeroes(SDL_Color),
};
pub const GeometryCopyData = struct_GeometryCopyData;
pub fn SW_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    var verts: ?*anyopaque = undefined;
    _ = &verts;
    var sz: usize = if (texture != null) @sizeOf(GeometryCopyData) else @sizeOf(GeometryFillData);
    _ = &sz;
    const color_scale: f32 = cmd.*.data.draw.color_scale;
    _ = &color_scale;
    verts = SDL_AllocateRenderVertices(renderer, @as(usize, @bitCast(@as(c_long, count))) *% sz, 0, &cmd.*.data.draw.first);
    if (!(verts != null)) {
        return @"false" != 0;
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    size_indices = if (indices != null) size_indices else @as(c_int, 0);
    if (texture != null) {
        var ptr: [*c]GeometryCopyData = @ptrCast(@alignCast(verts));
        _ = &ptr;
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
                ptr.*.src.x = @intFromFloat(uv_[@as(c_int, 0)] * @as(f32, @floatFromInt(texture.*.w)));
                ptr.*.src.y = @intFromFloat(uv_[@as(c_int, 1)] * @as(f32, @floatFromInt(texture.*.h)));
                ptr.*.dst.x = @intFromFloat(xy_[@as(c_int, 0)] * scale_x);
                ptr.*.dst.y = @intFromFloat(xy_[@as(c_int, 1)] * scale_y);
                trianglepoint_2_fixedpoint(&ptr.*.dst);
                ptr.*.color.r = @intFromFloat(SDL_roundf_REAL((if ((col_.r * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.r * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.r * color_scale) * @as(f32, 255.0)));
                ptr.*.color.g = @intFromFloat(SDL_roundf_REAL((if ((col_.g * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.g * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.g * color_scale) * @as(f32, 255.0)));
                ptr.*.color.b = @intFromFloat(SDL_roundf_REAL((if ((col_.b * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.b * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.b * color_scale) * @as(f32, 255.0)));
                ptr.*.color.a = @intFromFloat(SDL_roundf_REAL((if (col_.a < @as(f32, 0.0)) @as(f32, 0.0) else if (col_.a > @as(f32, 1.0)) @as(f32, 1.0) else col_.a) * @as(f32, 255.0)));
                ptr += 1;
            }
        }
    } else {
        var ptr: [*c]GeometryFillData = @ptrCast(@alignCast(verts));
        _ = &ptr;
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
                ptr.*.dst.x = @intFromFloat(xy_[@as(c_int, 0)] * scale_x);
                ptr.*.dst.y = @intFromFloat(xy_[@as(c_int, 1)] * scale_y);
                trianglepoint_2_fixedpoint(&ptr.*.dst);
                ptr.*.color.r = @intFromFloat(SDL_roundf_REAL((if ((col_.r * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.r * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.r * color_scale) * @as(f32, 255.0)));
                ptr.*.color.g = @intFromFloat(SDL_roundf_REAL((if ((col_.g * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.g * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.g * color_scale) * @as(f32, 255.0)));
                ptr.*.color.b = @intFromFloat(SDL_roundf_REAL((if ((col_.b * color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((col_.b * color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else col_.b * color_scale) * @as(f32, 255.0)));
                ptr.*.color.a = @intFromFloat(SDL_roundf_REAL((if (col_.a < @as(f32, 0.0)) @as(f32, 0.0) else if (col_.a > @as(f32, 1.0)) @as(f32, 1.0) else col_.a) * @as(f32, 255.0)));
                ptr += 1;
            }
        }
    }
    return @"true" != 0;
}
pub fn PrepTextureForCopy(cmd: [*c]const SDL_RenderCommand, drawstate: [*c]SW_DrawStateCache, srcrect: [*c]const SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const r: Uint8 = drawstate.*.color.r;
    _ = &r;
    const g: Uint8 = drawstate.*.color.g;
    _ = &g;
    const b: Uint8 = drawstate.*.color.b;
    _ = &b;
    const a: Uint8 = drawstate.*.color.a;
    _ = &a;
    const blend: SDL_BlendMode = cmd.*.data.draw.blend;
    _ = &blend;
    var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
    _ = &texture;
    var surface: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &surface;
    if ((((SDL_SurfaceHasRLE_REAL(surface) and (srcrect != null)) and (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STATIC))) and (((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) and ((((srcrect.*.x != @as(c_int, 0)) or (srcrect.*.y != @as(c_int, 0))) or (srcrect.*.w != surface.*.w)) or (srcrect.*.h != surface.*.h))) {
        _ = SDL_SetSurfaceRLE_REAL(surface, @"false" != 0);
    }
    _ = SDL_SetSurfaceColorMod_REAL(surface, r, g, b);
    _ = SDL_SetSurfaceAlphaMod_REAL(surface, a);
    _ = SDL_SetSurfaceBlendMode_REAL(surface, blend);
}
pub fn SetDrawState(surface: [*c]SDL_Surface, drawstate: [*c]SW_DrawStateCache) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SetDrawState".*;
    };
    _ = &static_local___func__;
    if (drawstate.*.surface_cliprect_dirty) {
        var viewport: [*c]const SDL_Rect = drawstate.*.viewport;
        _ = &viewport;
        var cliprect: [*c]const SDL_Rect = drawstate.*.cliprect;
        _ = &cliprect;
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(viewport)))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "viewport != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_sw.c", 696);
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
        if ((cliprect != null) and (viewport != null)) {
            var clip_rect: SDL_Rect = undefined;
            _ = &clip_rect;
            clip_rect.x = cliprect.*.x + viewport.*.x;
            clip_rect.y = cliprect.*.y + viewport.*.y;
            clip_rect.w = cliprect.*.w;
            clip_rect.h = cliprect.*.h;
            _ = SDL_GetRectIntersection_REAL(viewport, &clip_rect, &clip_rect);
            _ = SDL_SetSurfaceClipRect_REAL(surface, &clip_rect);
        } else {
            _ = SDL_SetSurfaceClipRect_REAL(surface, drawstate.*.viewport);
        }
        drawstate.*.surface_cliprect_dirty = @"false" != 0;
    }
}
pub fn SW_InvalidateCachedState(_: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SW_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, _: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var drawstate: SW_DrawStateCache = undefined;
    _ = &drawstate;
    var r: Uint8 = undefined;
    _ = &r;
    var g: Uint8 = undefined;
    _ = &g;
    var b: Uint8 = undefined;
    _ = &b;
    var a: Uint8 = undefined;
    _ = &a;
    var r_1: Uint8 = undefined;
    _ = &r_1;
    var g_2: Uint8 = undefined;
    _ = &g_2;
    var b_3: Uint8 = undefined;
    _ = &b_3;
    var a_4: Uint8 = undefined;
    _ = &a_4;
    var count: c_int = undefined;
    _ = &count;
    var verts: [*c]SDL_Point = undefined;
    _ = &verts;
    var blend: SDL_BlendMode = undefined;
    _ = &blend;
    var i: c_int = undefined;
    _ = &i;
    var r_5: Uint8 = undefined;
    _ = &r_5;
    var g_6: Uint8 = undefined;
    _ = &g_6;
    var b_7: Uint8 = undefined;
    _ = &b_7;
    var a_8: Uint8 = undefined;
    _ = &a_8;
    var count_9: c_int = undefined;
    _ = &count_9;
    var verts_10: [*c]SDL_Point = undefined;
    _ = &verts_10;
    var blend_11: SDL_BlendMode = undefined;
    _ = &blend_11;
    var i_12: c_int = undefined;
    _ = &i_12;
    var r_13: Uint8 = undefined;
    _ = &r_13;
    var g_14: Uint8 = undefined;
    _ = &g_14;
    var b_15: Uint8 = undefined;
    _ = &b_15;
    var a_16: Uint8 = undefined;
    _ = &a_16;
    var count_17: c_int = undefined;
    _ = &count_17;
    var verts_18: [*c]SDL_Rect = undefined;
    _ = &verts_18;
    var blend_19: SDL_BlendMode = undefined;
    _ = &blend_19;
    var i_20: c_int = undefined;
    _ = &i_20;
    var verts_21: [*c]SDL_Rect = undefined;
    _ = &verts_21;
    var srcrect: [*c]const SDL_Rect = undefined;
    _ = &srcrect;
    var dstrect: [*c]SDL_Rect = undefined;
    _ = &dstrect;
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var src: [*c]SDL_Surface = undefined;
    _ = &src;
    var tmp_format: SDL_PixelFormat = undefined;
    _ = &tmp_format;
    var tmp: [*c]SDL_Surface = undefined;
    _ = &tmp;
    var r_22: SDL_Rect = undefined;
    _ = &r_22;
    var blendmode: SDL_BlendMode = undefined;
    _ = &blendmode;
    var alphaMod: Uint8 = undefined;
    _ = &alphaMod;
    var rMod: Uint8 = undefined;
    _ = &rMod;
    var gMod: Uint8 = undefined;
    _ = &gMod;
    var bMod: Uint8 = undefined;
    _ = &bMod;
    var copydata: [*c]CopyExData = undefined;
    _ = &copydata;
    var i_23: c_int = undefined;
    _ = &i_23;
    var verts_24: [*c]SDL_Rect = undefined;
    _ = &verts_24;
    var count_25: c_int = undefined;
    _ = &count_25;
    var texture_26: [*c]SDL_Texture = undefined;
    _ = &texture_26;
    var blend_27: SDL_BlendMode = undefined;
    _ = &blend_27;
    var src_28: [*c]SDL_Surface = undefined;
    _ = &src_28;
    var ptr: [*c]GeometryCopyData = undefined;
    _ = &ptr;
    var vp: SDL_Point = undefined;
    _ = &vp;
    var ptr_29: [*c]GeometryFillData = undefined;
    _ = &ptr_29;
    var vp_30: SDL_Point = undefined;
    _ = &vp_30;
    i_23 += 3;
    i_23 += 3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                surface = SW_ActivateRenderer(renderer);
                if (!SDL_SurfaceValid(surface)) {
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
                drawstate.viewport = null;
                drawstate.cliprect = null;
                drawstate.surface_cliprect_dirty = @"true" != 0;
                drawstate.color.r = 0;
                drawstate.color.g = 0;
                drawstate.color.b = 0;
                drawstate.color.a = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (cmd != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                switch (cmd.*.command) {
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETVIEWPORT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_SETCLIPRECT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_CLEAR) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            6 => {
                return @"true" != 0;
            },
            7 => {
                cmd = cmd.*.next;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                drawstate.color.r = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.r * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.r * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.r * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                drawstate.color.g = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.g * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.g * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.g * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                drawstate.color.b = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.b * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.b * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.b * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                drawstate.color.a = @intFromFloat(SDL_roundf_REAL((if (cmd.*.data.color.color.a < @as(f32, 0.0)) @as(f32, 0.0) else if (cmd.*.data.color.color.a > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.a) * @as(f32, 255.0)));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                drawstate.viewport = &cmd.*.data.viewport.rect;
                drawstate.surface_cliprect_dirty = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                drawstate.cliprect = @ptrCast(@alignCast(if (cmd.*.data.cliprect.enabled) @as(?*anyopaque, @ptrCast(@alignCast(&cmd.*.data.cliprect.rect))) else @as(?*anyopaque, null)));
                drawstate.surface_cliprect_dirty = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                r = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.r * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.r * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.r * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                g = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.g * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.g * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.g * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                b = @intFromFloat(SDL_roundf_REAL((if ((cmd.*.data.color.color.b * cmd.*.data.color.color_scale) < @as(f32, 0.0)) @as(f32, 0.0) else if ((cmd.*.data.color.color.b * cmd.*.data.color.color_scale) > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.b * cmd.*.data.color.color_scale) * @as(f32, 255.0)));
                a = @intFromFloat(SDL_roundf_REAL((if (cmd.*.data.color.color.a < @as(f32, 0.0)) @as(f32, 0.0) else if (cmd.*.data.color.color.a > @as(f32, 1.0)) @as(f32, 1.0) else cmd.*.data.color.color.a) * @as(f32, 255.0)));
                _ = SDL_SetSurfaceClipRect_REAL(surface, null);
                _ = SDL_FillSurfaceRect_REAL(surface, null, SDL_MapSurfaceRGBA_REAL(surface, r, g, b, a));
                drawstate.surface_cliprect_dirty = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                r_1 = drawstate.color.r;
                g_2 = drawstate.color.g;
                b_3 = drawstate.color.b;
                a_4 = drawstate.color.a;
                count = @bitCast(@as(c_uint, @truncate(cmd.*.data.draw.count)));
                verts = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                blend = cmd.*.data.draw.blend;
                SetDrawState(surface, &drawstate);
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                i = 0;
                {
                    sdl_pc = 16;
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
                if (blend == SDL_BLENDMODE_NONE) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            16 => {
                if (i < count) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                verts[@bitCast(@as(isize, @intCast(i)))].x += drawstate.viewport.*.x;
                verts[@bitCast(@as(isize, @intCast(i)))].y += drawstate.viewport.*.y;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                i += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                _ = SDL_DrawPoints(surface, verts, count, SDL_MapSurfaceRGBA_REAL(surface, r_1, g_2, b_3, a_4));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                _ = SDL_BlendPoints(surface, verts, count, blend, r_1, g_2, b_3, a_4);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            23 => {
                r_5 = drawstate.color.r;
                g_6 = drawstate.color.g;
                b_7 = drawstate.color.b;
                a_8 = drawstate.color.a;
                count_9 = @bitCast(@as(c_uint, @truncate(cmd.*.data.draw.count)));
                verts_10 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                blend_11 = cmd.*.data.draw.blend;
                SetDrawState(surface, &drawstate);
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                i_12 = 0;
                {
                    sdl_pc = 27;
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
                if (blend_11 == SDL_BLENDMODE_NONE) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            27 => {
                if (i_12 < count_9) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                verts_10[@bitCast(@as(isize, @intCast(i_12)))].x += drawstate.viewport.*.x;
                verts_10[@bitCast(@as(isize, @intCast(i_12)))].y += drawstate.viewport.*.y;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                i_12 += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            31 => {
                _ = SDL_DrawLines(surface, verts_10, count_9, SDL_MapSurfaceRGBA_REAL(surface, r_5, g_6, b_7, a_8));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                _ = SDL_BlendLines(surface, verts_10, count_9, blend_11, r_5, g_6, b_7, a_8);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            34 => {
                r_13 = drawstate.color.r;
                g_14 = drawstate.color.g;
                b_15 = drawstate.color.b;
                a_16 = drawstate.color.a;
                count_17 = @bitCast(@as(c_uint, @truncate(cmd.*.data.draw.count)));
                verts_18 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                blend_19 = cmd.*.data.draw.blend;
                SetDrawState(surface, &drawstate);
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                i_20 = 0;
                {
                    sdl_pc = 38;
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
                if (blend_19 == SDL_BLENDMODE_NONE) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            38 => {
                if (i_20 < count_17) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                verts_18[@bitCast(@as(isize, @intCast(i_20)))].x += drawstate.viewport.*.x;
                verts_18[@bitCast(@as(isize, @intCast(i_20)))].y += drawstate.viewport.*.y;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                i_20 += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                _ = SDL_FillSurfaceRects_REAL(surface, verts_18, count_17, SDL_MapSurfaceRGBA_REAL(surface, r_13, g_14, b_15, a_16));
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                _ = SDL_BlendFillRects(surface, verts_18, count_17, blend_19, r_13, g_14, b_15, a_16);
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            45 => {
                verts_21 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                srcrect = verts_21;
                dstrect = verts_21 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                texture = cmd.*.data.draw.texture;
                src = @ptrCast(@alignCast(texture.*.internal));
                SetDrawState(surface, &drawstate);
                PrepTextureForCopy(cmd, &drawstate, srcrect);
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                dstrect.*.x += drawstate.viewport.*.x;
                dstrect.*.y += drawstate.viewport.*.y;
                {
                    sdl_pc = 48;
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
                if ((srcrect.*.w == dstrect.*.w) and (srcrect.*.h == dstrect.*.h)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                _ = SDL_BlitSurface_REAL(src, srcrect, surface, dstrect);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                if ((((dstrect.*.x < @as(c_int, 0)) or (dstrect.*.y < @as(c_int, 0))) or ((dstrect.*.x + dstrect.*.w) > surface.*.w)) or ((dstrect.*.y + dstrect.*.h) > surface.*.h)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            52 => {
                tmp_format = @bitCast(if (((!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) SDL_PIXELFORMAT_ARGB8888 else @as(c_int, @bitCast(surface.*.format)));
                tmp = SDL_CreateSurfaceUninitialized(dstrect.*.w, dstrect.*.h, tmp_format);
                if (tmp != null) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                _ = SDL_BlitSurfaceScaled_REAL(src, srcrect, surface, dstrect, cmd.*.data.draw.texture_scale_mode);
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
                _ = SDL_GetSurfaceBlendMode_REAL(src, &blendmode);
                _ = SDL_GetSurfaceAlphaMod_REAL(src, &alphaMod);
                _ = SDL_GetSurfaceColorMod_REAL(src, &rMod, &gMod, &bMod);
                r_22.x = 0;
                r_22.y = 0;
                r_22.w = dstrect.*.w;
                r_22.h = dstrect.*.h;
                _ = SDL_SetSurfaceBlendMode_REAL(src, SDL_BLENDMODE_NONE);
                _ = SDL_SetSurfaceColorMod_REAL(src, 255, 255, 255);
                _ = SDL_SetSurfaceAlphaMod_REAL(src, 255);
                _ = SDL_BlitSurfaceScaled_REAL(src, srcrect, tmp, &r_22, cmd.*.data.draw.texture_scale_mode);
                _ = SDL_SetSurfaceColorMod_REAL(tmp, rMod, gMod, bMod);
                _ = SDL_SetSurfaceAlphaMod_REAL(tmp, alphaMod);
                _ = SDL_SetSurfaceBlendMode_REAL(tmp, blendmode);
                _ = SDL_BlitSurface_REAL(tmp, null, surface, dstrect);
                SDL_DestroySurface_REAL(tmp);
                {
                    sdl_pc = 57;
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
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                copydata = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                SetDrawState(surface, &drawstate);
                PrepTextureForCopy(cmd, &drawstate, &copydata.*.srcrect);
                if (((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) and ((copydata.*.scale_x > @as(f32, 0.0)) and (copydata.*.scale_y > @as(f32, 0.0)))) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                copydata.*.dstrect.x += @intFromFloat(@as(f32, @floatFromInt(drawstate.viewport.*.x)) / copydata.*.scale_x);
                copydata.*.dstrect.y += @intFromFloat(@as(f32, @floatFromInt(drawstate.viewport.*.y)) / copydata.*.scale_y);
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
                _ = SW_RenderCopyEx(renderer, surface, cmd.*.data.draw.texture, &copydata.*.srcrect, &copydata.*.dstrect, copydata.*.angle, &copydata.*.center, copydata.*.flip, copydata.*.scale_x, copydata.*.scale_y, cmd.*.data.draw.texture_scale_mode);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            62 => {
                verts_24 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(vertices))) + cmd.*.data.draw.first));
                count_25 = @bitCast(@as(c_uint, @truncate(cmd.*.data.draw.count)));
                texture_26 = cmd.*.data.draw.texture;
                blend_27 = cmd.*.data.draw.blend;
                SetDrawState(surface, &drawstate);
                if (texture_26 != null) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                src_28 = @ptrCast(@alignCast(texture_26.*.internal));
                ptr = @ptrCast(@alignCast(verts_24));
                PrepTextureForCopy(cmd, &drawstate, null);
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            64 => {
                ptr_29 = @ptrCast(@alignCast(verts_24));
                if ((drawstate.viewport != null) and ((drawstate.viewport.*.x != 0) or (drawstate.viewport.*.y != 0))) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            66 => {
                vp.x = drawstate.viewport.*.x;
                vp.y = drawstate.viewport.*.y;
                trianglepoint_2_fixedpoint(&vp);
                i_23 = 0;
                {
                    sdl_pc = 69;
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
                i_23 = 0;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            69 => {
                if (i_23 < count_25) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                ptr[@bitCast(@as(isize, @intCast(i_23)))].dst.x += vp.x;
                ptr[@bitCast(@as(isize, @intCast(i_23)))].dst.y += vp.y;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                i_23 += 1;
                {
                    sdl_pc = 69;
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
                if (i_23 < count_25) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                _ = SDL_SW_BlitTriangle(src_28, &ptr[@as(c_int, 0)].src, &ptr[@as(c_int, 1)].src, &ptr[@as(c_int, 2)].src, surface, &ptr[@as(c_int, 0)].dst, &ptr[@as(c_int, 1)].dst, &ptr[@as(c_int, 2)].dst, ptr[@as(c_int, 0)].color, ptr[@as(c_int, 1)].color, ptr[@as(c_int, 2)].color, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                ptr += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            77 => {
                vp_30.x = drawstate.viewport.*.x;
                vp_30.y = drawstate.viewport.*.y;
                trianglepoint_2_fixedpoint(&vp_30);
                i_23 = 0;
                {
                    sdl_pc = 80;
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
                i_23 = 0;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            80 => {
                if (i_23 < count_25) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                ptr_29[@bitCast(@as(isize, @intCast(i_23)))].dst.x += vp_30.x;
                ptr_29[@bitCast(@as(isize, @intCast(i_23)))].dst.y += vp_30.y;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                i_23 += 1;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            84 => {
                if (i_23 < count_25) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                _ = SDL_SW_FillTriangle(surface, &ptr_29[@as(c_int, 0)].dst, &ptr_29[@as(c_int, 1)].dst, &ptr_29[@as(c_int, 2)].dst, blend_27, ptr_29[@as(c_int, 0)].color, ptr_29[@as(c_int, 1)].color, ptr_29[@as(c_int, 2)].color);
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                ptr_29 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SW_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = SW_ActivateRenderer(renderer);
    _ = &surface;
    var pixels: ?*anyopaque = undefined;
    _ = &pixels;
    if (!SDL_SurfaceValid(surface)) {
        return null;
    }
    if ((((rect.*.x < @as(c_int, 0)) or ((rect.*.x + rect.*.w) > surface.*.w)) or (rect.*.y < @as(c_int, 0))) or ((rect.*.y + rect.*.h) > surface.*.h)) {
        _ = SDL_SetError_REAL("Tried to read outside of surface bounds");
        return null;
    }
    pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * @as(c_int, surface.*.fmt.*.bytes_per_pixel)))))));
    return SDL_DuplicatePixels(rect.*.w, rect.*.h, surface.*.format, SDL_COLORSPACE_SRGB, pixels, surface.*.pitch);
}
pub fn SW_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = renderer.*.window;
    _ = &window;
    if (!(window != null)) {
        return @"false" != 0;
    }
    return SDL_UpdateWindowSurface_REAL(window);
}
pub fn SW_DestroyTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = @ptrCast(@alignCast(texture.*.internal));
    _ = &surface;
    SDL_DestroySurface_REAL(surface);
}
pub fn SW_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = renderer.*.window;
    _ = &window;
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (window != null) {
        _ = SDL_DestroyWindowSurface_REAL(window);
    }
    SDL_free_REAL(@ptrCast(@alignCast(data)));
}
pub fn SW_SelectBestFormats(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = SDL_AddSupportedTextureFormat(renderer, format);
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB4444) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR4444) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB4444) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR4444) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB1555) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR1555) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB1555) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR1555) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            1 => {
                if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            2 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ARGB4444);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ABGR4444);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XRGB4444);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XBGR4444);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ARGB1555);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ABGR1555);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XRGB1555);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XBGR1555);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ARGB8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBA8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ABGR8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRA8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XRGB8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBX8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XBGR8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRX8888);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                if (((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XRGB8888);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ARGB8888);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_INDEX8);
                {}
            },
            22 => {
                switch ((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRX) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBX) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_XBGR) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_XRGB) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 34;
                        continue;
                    },
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
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 24;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRX8888);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_BGRA8888);
                {
                    sdl_pc = 25;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBX8888);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_RGBA8888);
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XBGR8888);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ABGR8888);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
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
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_XRGB8888);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_ARGB8888);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SW_UpdateRendererSurface(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (surface != null) {
        if (!SDL_SurfaceValid(surface)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        }
        if (((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) or ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 32))) {
            return SDL_SetError_REAL("Unsupported surface format");
        }
    }
    if (data.*.surface != surface) {
        data.*.surface = surface;
        data.*.window = surface;
        if (surface != null) {
            renderer.*.num_texture_formats = 0;
            SW_SelectBestFormats(renderer, surface.*.format);
        }
    }
    return @"true" != 0;
}
pub export fn SW_CreateRendererForSurface(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface, create_props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SW_RenderData = undefined;
    _ = &data;
    if (surface != null) {
        if (!SDL_SurfaceValid(surface)) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        }
        if (((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) or ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 32))) {
            return SDL_SetError_REAL("Unsupported surface format");
        }
    }
    SDL_SetupRendererColorspace(renderer, create_props);
    if (renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB)) {
        return SDL_SetError_REAL("Unsupported output colorspace");
    }
    renderer.*.software = @"true" != 0;
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    if (!(data != null)) {
        return @"false" != 0;
    }
    data.*.surface = surface;
    data.*.window = surface;
    renderer.*.WindowEvent = SW_WindowEvent;
    renderer.*.GetOutputSize = SW_GetOutputSize;
    renderer.*.CreatePalette = SW_CreatePalette;
    renderer.*.UpdatePalette = SW_UpdatePalette;
    renderer.*.DestroyPalette = SW_DestroyPalette;
    renderer.*.ChangeTexturePalette = SW_ChangeTexturePalette;
    renderer.*.CreateTexture = SW_CreateTexture;
    renderer.*.UpdateTexture = SW_UpdateTexture;
    renderer.*.LockTexture = SW_LockTexture;
    renderer.*.UnlockTexture = SW_UnlockTexture;
    renderer.*.SetRenderTarget = SW_SetRenderTarget;
    renderer.*.QueueSetViewport = SW_QueueNoOp;
    renderer.*.QueueSetDrawColor = SW_QueueNoOp;
    renderer.*.QueueDrawPoints = SW_QueueDrawPoints;
    renderer.*.QueueDrawLines = SW_QueueDrawPoints;
    renderer.*.QueueFillRects = SW_QueueFillRects;
    renderer.*.QueueCopy = SW_QueueCopy;
    renderer.*.QueueCopyEx = SW_QueueCopyEx;
    renderer.*.QueueGeometry = SW_QueueGeometry;
    renderer.*.InvalidateCachedState = SW_InvalidateCachedState;
    renderer.*.RunCommandQueue = SW_RunCommandQueue;
    renderer.*.RenderReadPixels = SW_RenderReadPixels;
    renderer.*.RenderPresent = SW_RenderPresent;
    renderer.*.DestroyTexture = SW_DestroyTexture;
    renderer.*.DestroyRenderer = SW_DestroyRenderer;
    renderer.*.internal = @ptrCast(@alignCast(data));
    SW_InvalidateCachedState(renderer);
    renderer.*.name = SW_RenderDriver.name;
    if (surface != null) {
        SW_SelectBestFormats(renderer, surface.*.format);
    }
    return @"true" != 0;
}
pub fn SW_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_RENDER_VSYNC");
    _ = &hint;
    const no_hint_set: bool = !(hint != null) or !(@as(c_int, hint.*) != 0);
    _ = &no_hint_set;
    if (no_hint_set) {
        if (SDL_GetBooleanProperty_REAL(create_props, "SDL.renderer.create.present_vsync", @as(c_int, 0) != 0)) {
            _ = SDL_SetHint_REAL("SDL_RENDER_VSYNC", "1");
        } else {
            _ = SDL_SetHint_REAL("SDL_RENDER_VSYNC", "0");
        }
    }
    var surface: [*c]SDL_Surface = null;
    _ = &surface;
    if (window != null) {
        surface = SDL_GetWindowSurface_REAL(window);
    }
    if (no_hint_set) {
        _ = SDL_SetHint_REAL("SDL_RENDER_VSYNC", "");
    }
    if ((window != null) and !SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    if (!SW_CreateRendererForSurface(renderer, surface, create_props)) {
        if (window != null) {
            _ = SDL_DestroyWindowSurface_REAL(window);
        }
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export var SW_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = SW_CreateRenderer,
    .name = "software",
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_ADD = @as(c_uint, 0x00000002);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_BLENDMODE_MUL = @as(c_uint, 0x00000008);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
