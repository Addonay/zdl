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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub inline fn SDL_size_mul_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.mul_overflow(a, b, ret))) == @as(c_int, 0);
}
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
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
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
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
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
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX32: c_int = 370546692;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
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
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
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
pub extern fn SDL_GetWindowFlags_REAL(window: [*c]SDL_Window) SDL_WindowFlags;
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub const struct_SDL_GPUDevice = opaque {
};
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPUTransferBuffer = opaque {};
pub const SDL_GPUTransferBuffer = struct_SDL_GPUTransferBuffer;
pub const struct_SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = struct_SDL_GPUGraphicsPipeline;
pub const struct_SDL_GPUCommandBuffer = opaque {
};
pub const SDL_GPUCommandBuffer = struct_SDL_GPUCommandBuffer;
pub const struct_SDL_GPURenderPass = opaque {
};
pub const SDL_GPURenderPass = struct_SDL_GPURenderPass;
pub const struct_SDL_GPUCopyPass = opaque {
};
pub const SDL_GPUCopyPass = struct_SDL_GPUCopyPass;
pub const struct_SDL_GPUFence = opaque {};
pub const SDL_GPUFence = struct_SDL_GPUFence;
pub const SDL_GPU_PRIMITIVETYPE_TRIANGLELIST: c_int = 0;
pub const SDL_GPU_PRIMITIVETYPE_LINELIST: c_int = 2;
pub const SDL_GPU_PRIMITIVETYPE_LINESTRIP: c_int = 3;
pub const SDL_GPU_PRIMITIVETYPE_POINTLIST: c_int = 4;
pub const enum_SDL_GPUPrimitiveType = c_uint;
pub const SDL_GPUPrimitiveType = enum_SDL_GPUPrimitiveType;
pub const SDL_GPU_LOADOP_LOAD: c_int = 0;
pub const SDL_GPU_LOADOP_CLEAR: c_int = 1;
pub const SDL_GPU_LOADOP_DONT_CARE: c_int = 2;
pub const enum_SDL_GPULoadOp = c_uint;
pub const SDL_GPULoadOp = enum_SDL_GPULoadOp;
pub const enum_SDL_GPUStoreOp = c_uint;
pub const SDL_GPUStoreOp = enum_SDL_GPUStoreOp;
pub const SDL_GPU_TEXTUREFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_TEXTUREFORMAT_R8_UNORM: c_int = 2;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_UNORM: c_int = 3;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM: c_int = 4;
pub const SDL_GPU_TEXTUREFORMAT_R16_UNORM: c_int = 5;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_UNORM: c_int = 6;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM: c_int = 12;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB: c_int = 52;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB: c_int = 53;
pub const enum_SDL_GPUTextureFormat = c_uint;
pub const SDL_GPUTextureFormat = enum_SDL_GPUTextureFormat;
pub const SDL_GPUTextureUsageFlags = Uint32;
pub const SDL_GPU_TEXTURETYPE_2D: c_int = 0;
pub const enum_SDL_GPUTextureType = c_uint;
pub const SDL_GPUTextureType = enum_SDL_GPUTextureType;
pub const SDL_GPU_SAMPLECOUNT_1: c_int = 0;
pub const enum_SDL_GPUSampleCount = c_uint;
pub const SDL_GPUSampleCount = enum_SDL_GPUSampleCount;
pub const SDL_GPUBufferUsageFlags = Uint32;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD: c_int = 0;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD: c_int = 1;
pub const enum_SDL_GPUTransferBufferUsage = c_uint;
pub const SDL_GPUTransferBufferUsage = enum_SDL_GPUTransferBufferUsage;
pub const enum_SDL_GPUCompareOp = c_uint;
pub const SDL_GPUCompareOp = enum_SDL_GPUCompareOp;
pub const SDL_GPU_BLENDOP_ADD: c_int = 1;
pub const SDL_GPU_BLENDOP_SUBTRACT: c_int = 2;
pub const SDL_GPU_BLENDOP_REVERSE_SUBTRACT: c_int = 3;
pub const SDL_GPU_BLENDOP_MIN: c_int = 4;
pub const SDL_GPU_BLENDOP_MAX: c_int = 5;
pub const enum_SDL_GPUBlendOp = c_uint;
pub const SDL_GPUBlendOp = enum_SDL_GPUBlendOp;
pub const SDL_GPU_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_GPU_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_GPU_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR: c_int = 4;
pub const SDL_GPU_BLENDFACTOR_DST_COLOR: c_int = 5;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR: c_int = 6;
pub const SDL_GPU_BLENDFACTOR_SRC_ALPHA: c_int = 7;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 8;
pub const SDL_GPU_BLENDFACTOR_DST_ALPHA: c_int = 9;
pub const SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA: c_int = 10;
pub const enum_SDL_GPUBlendFactor = c_uint;
pub const SDL_GPUBlendFactor = enum_SDL_GPUBlendFactor;
pub const SDL_GPU_FILTER_NEAREST: c_int = 0;
pub const SDL_GPU_FILTER_LINEAR: c_int = 1;
pub const enum_SDL_GPUFilter = c_uint;
pub const SDL_GPUFilter = enum_SDL_GPUFilter;
pub const SDL_GPU_SAMPLERMIPMAPMODE_NEAREST: c_int = 0;
pub const SDL_GPU_SAMPLERMIPMAPMODE_LINEAR: c_int = 1;
pub const enum_SDL_GPUSamplerMipmapMode = c_uint;
pub const SDL_GPUSamplerMipmapMode = enum_SDL_GPUSamplerMipmapMode;
pub const SDL_GPU_SAMPLERADDRESSMODE_REPEAT: c_int = 0;
pub const SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE: c_int = 2;
pub const enum_SDL_GPUSamplerAddressMode = c_uint;
pub const SDL_GPUSamplerAddressMode = enum_SDL_GPUSamplerAddressMode;
pub const SDL_GPU_PRESENTMODE_VSYNC: c_int = 0;
pub const SDL_GPU_PRESENTMODE_IMMEDIATE: c_int = 1;
pub const SDL_GPU_PRESENTMODE_MAILBOX: c_int = 2;
pub const enum_SDL_GPUPresentMode = c_uint;
pub const SDL_GPUPresentMode = enum_SDL_GPUPresentMode;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_SDR: c_int = 0;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR: c_int = 2;
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084: c_int = 3;
pub const enum_SDL_GPUSwapchainComposition = c_uint;
pub const SDL_GPUSwapchainComposition = enum_SDL_GPUSwapchainComposition;
pub const struct_SDL_GPUViewport = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
    min_depth: f32 = 0,
    max_depth: f32 = 0,
};
pub const SDL_GPUViewport = struct_SDL_GPUViewport;
pub const struct_SDL_GPUTextureTransferInfo = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
    pixels_per_row: Uint32 = 0,
    rows_per_layer: Uint32 = 0,
};
pub const SDL_GPUTextureTransferInfo = struct_SDL_GPUTextureTransferInfo;
pub const struct_SDL_GPUTransferBufferLocation = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUTransferBufferLocation = struct_SDL_GPUTransferBufferLocation;
pub const struct_SDL_GPUTextureRegion = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    z: Uint32 = 0,
    w: Uint32 = 0,
    h: Uint32 = 0,
    d: Uint32 = 0,
};
pub const SDL_GPUTextureRegion = struct_SDL_GPUTextureRegion;
pub const struct_SDL_GPUBlitRegion = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer_or_depth_plane: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    w: Uint32 = 0,
    h: Uint32 = 0,
};
pub const SDL_GPUBlitRegion = struct_SDL_GPUBlitRegion;
pub const struct_SDL_GPUBufferRegion = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
    size: Uint32 = 0,
};
pub const SDL_GPUBufferRegion = struct_SDL_GPUBufferRegion;
pub const struct_SDL_GPUSamplerCreateInfo = extern struct {
    min_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mag_filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    mipmap_mode: SDL_GPUSamplerMipmapMode = @import("std").mem.zeroes(SDL_GPUSamplerMipmapMode),
    address_mode_u: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_v: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    address_mode_w: SDL_GPUSamplerAddressMode = @import("std").mem.zeroes(SDL_GPUSamplerAddressMode),
    mip_lod_bias: f32 = 0,
    max_anisotropy: f32 = 0,
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    min_lod: f32 = 0,
    max_lod: f32 = 0,
    enable_anisotropy: bool = false,
    enable_compare: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUSamplerCreateInfo = struct_SDL_GPUSamplerCreateInfo;
pub const struct_SDL_GPUTextureCreateInfo = extern struct {
    type: SDL_GPUTextureType = @import("std").mem.zeroes(SDL_GPUTextureType),
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    usage: SDL_GPUTextureUsageFlags = 0,
    width: Uint32 = 0,
    height: Uint32 = 0,
    layer_count_or_depth: Uint32 = 0,
    num_levels: Uint32 = 0,
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUTextureCreateInfo = struct_SDL_GPUTextureCreateInfo;
pub const struct_SDL_GPUBufferCreateInfo = extern struct {
    usage: SDL_GPUBufferUsageFlags = 0,
    size: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUBufferCreateInfo = struct_SDL_GPUBufferCreateInfo;
pub const struct_SDL_GPUTransferBufferCreateInfo = extern struct {
    usage: SDL_GPUTransferBufferUsage = @import("std").mem.zeroes(SDL_GPUTransferBufferUsage),
    size: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUTransferBufferCreateInfo = struct_SDL_GPUTransferBufferCreateInfo;
pub const struct_SDL_GPUColorTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer_or_depth_plane: Uint32 = 0,
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    resolve_texture: ?*SDL_GPUTexture = null,
    resolve_mip_level: Uint32 = 0,
    resolve_layer: Uint32 = 0,
    cycle: bool = false,
    cycle_resolve_texture: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPUColorTargetInfo = struct_SDL_GPUColorTargetInfo;
pub const struct_SDL_GPUDepthStencilTargetInfo = extern struct {
    texture: ?*SDL_GPUTexture = null,
    clear_depth: f32 = 0,
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    stencil_load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    stencil_store_op: SDL_GPUStoreOp = @import("std").mem.zeroes(SDL_GPUStoreOp),
    cycle: bool = false,
    clear_stencil: Uint8 = 0,
    mip_level: Uint8 = 0,
    layer: Uint8 = 0,
};
pub const SDL_GPUDepthStencilTargetInfo = struct_SDL_GPUDepthStencilTargetInfo;
pub const struct_SDL_GPUBlitInfo = extern struct {
    source: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    destination: SDL_GPUBlitRegion = @import("std").mem.zeroes(SDL_GPUBlitRegion),
    load_op: SDL_GPULoadOp = @import("std").mem.zeroes(SDL_GPULoadOp),
    clear_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    flip_mode: SDL_FlipMode = @import("std").mem.zeroes(SDL_FlipMode),
    filter: SDL_GPUFilter = @import("std").mem.zeroes(SDL_GPUFilter),
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUBlitInfo = struct_SDL_GPUBlitInfo;
pub const struct_SDL_GPUBufferBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUBufferBinding = struct_SDL_GPUBufferBinding;
pub extern fn SDL_CreateGPUDeviceWithProperties_REAL(props: SDL_PropertiesID) ?*SDL_GPUDevice;
pub extern fn SDL_DestroyGPUDevice_REAL(device: ?*SDL_GPUDevice) void;
pub extern fn SDL_CreateGPUSampler_REAL(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUSamplerCreateInfo) ?*SDL_GPUSampler;
pub extern fn SDL_CreateGPUTexture_REAL(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUTextureCreateInfo) ?*SDL_GPUTexture;
pub extern fn SDL_CreateGPUBuffer_REAL(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer;
pub extern fn SDL_CreateGPUTransferBuffer_REAL(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUTransferBufferCreateInfo) ?*SDL_GPUTransferBuffer;
pub extern fn SDL_ReleaseGPUTexture_REAL(device: ?*SDL_GPUDevice, texture: ?*SDL_GPUTexture) void;
pub extern fn SDL_ReleaseGPUSampler_REAL(device: ?*SDL_GPUDevice, sampler: ?*SDL_GPUSampler) void;
pub extern fn SDL_ReleaseGPUBuffer_REAL(device: ?*SDL_GPUDevice, buffer: ?*SDL_GPUBuffer) void;
pub extern fn SDL_ReleaseGPUTransferBuffer_REAL(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;
pub extern fn SDL_AcquireGPUCommandBuffer_REAL(device: ?*SDL_GPUDevice) ?*SDL_GPUCommandBuffer;
pub extern fn SDL_PushGPUVertexUniformData_REAL(command_buffer: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
pub extern fn SDL_PushGPUFragmentUniformData_REAL(command_buffer: ?*SDL_GPUCommandBuffer, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void;
pub extern fn SDL_BeginGPURenderPass_REAL(command_buffer: ?*SDL_GPUCommandBuffer, color_target_infos: [*c]const SDL_GPUColorTargetInfo, num_color_targets: Uint32, depth_stencil_target_info: [*c]const SDL_GPUDepthStencilTargetInfo) ?*SDL_GPURenderPass;
pub extern fn SDL_BindGPUGraphicsPipeline_REAL(render_pass: ?*SDL_GPURenderPass, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
pub extern fn SDL_SetGPUViewport_REAL(render_pass: ?*SDL_GPURenderPass, viewport: [*c]const SDL_GPUViewport) void;
pub extern fn SDL_SetGPUScissor_REAL(render_pass: ?*SDL_GPURenderPass, scissor: [*c]const SDL_Rect) void;
pub extern fn SDL_BindGPUVertexBuffers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, bindings: [*c]const SDL_GPUBufferBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentSamplers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentStorageTextures_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void;
pub extern fn SDL_BindGPUFragmentStorageBuffers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void;
pub extern fn SDL_DrawGPUPrimitives_REAL(render_pass: ?*SDL_GPURenderPass, num_vertices: Uint32, num_instances: Uint32, first_vertex: Uint32, first_instance: Uint32) void;
pub extern fn SDL_EndGPURenderPass_REAL(render_pass: ?*SDL_GPURenderPass) void;
pub extern fn SDL_MapGPUTransferBuffer_REAL(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer, cycle: bool) ?*anyopaque;
pub extern fn SDL_UnmapGPUTransferBuffer_REAL(device: ?*SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void;
pub extern fn SDL_BeginGPUCopyPass_REAL(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUCopyPass;
pub extern fn SDL_UploadToGPUTexture_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) void;
pub extern fn SDL_UploadToGPUBuffer_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) void;
pub extern fn SDL_DownloadFromGPUTexture_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) void;
pub extern fn SDL_EndGPUCopyPass_REAL(copy_pass: ?*SDL_GPUCopyPass) void;
pub extern fn SDL_BlitGPUTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) void;
pub extern fn SDL_WindowSupportsGPUPresentMode_REAL(device: ?*SDL_GPUDevice, window: [*c]SDL_Window, present_mode: SDL_GPUPresentMode) bool;
pub extern fn SDL_ClaimWindowForGPUDevice_REAL(device: ?*SDL_GPUDevice, window: [*c]SDL_Window) bool;
pub extern fn SDL_ReleaseWindowFromGPUDevice_REAL(device: ?*SDL_GPUDevice, window: [*c]SDL_Window) void;
pub extern fn SDL_SetGPUSwapchainParameters_REAL(device: ?*SDL_GPUDevice, window: [*c]SDL_Window, swapchain_composition: SDL_GPUSwapchainComposition, present_mode: SDL_GPUPresentMode) bool;
pub extern fn SDL_SetGPUAllowedFramesInFlight_REAL(device: ?*SDL_GPUDevice, allowed_frames_in_flight: Uint32) bool;
pub extern fn SDL_GetGPUSwapchainTextureFormat_REAL(device: ?*SDL_GPUDevice, window: [*c]SDL_Window) SDL_GPUTextureFormat;
pub extern fn SDL_WaitAndAcquireGPUSwapchainTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) bool;
pub extern fn SDL_SubmitGPUCommandBuffer_REAL(command_buffer: ?*SDL_GPUCommandBuffer) bool;
pub extern fn SDL_SubmitGPUCommandBufferAndAcquireFence_REAL(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUFence;
pub extern fn SDL_CancelGPUCommandBuffer_REAL(command_buffer: ?*SDL_GPUCommandBuffer) bool;
pub extern fn SDL_WaitForGPUFences_REAL(device: ?*SDL_GPUDevice, wait_all: bool, fences: [*c]const ?*SDL_GPUFence, num_fences: Uint32) bool;
pub extern fn SDL_ReleaseGPUFence_REAL(device: ?*SDL_GPUDevice, fence: ?*SDL_GPUFence) void;
pub extern fn SDL_GPUTextureSupportsFormat_REAL(device: ?*SDL_GPUDevice, format: SDL_GPUTextureFormat, @"type": SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) bool;
pub extern fn SDL_GetPixelFormatFromGPUTextureFormat_REAL(format: SDL_GPUTextureFormat) SDL_PixelFormat;
pub extern fn SDL_GetGPUTextureFormatFromPixelFormat_REAL(format: SDL_PixelFormat) SDL_GPUTextureFormat;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_GetTextureProperties_REAL(texture: [*c]SDL_Texture) SDL_PropertiesID;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
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
pub extern fn SDL_GetYCbCRtoRGBConversionMatrix(colorspace: SDL_Colorspace, w: c_int, h: c_int, bits_per_pixel: c_int) [*c]const f32;
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_ReconfigureWindow(window: [*c]SDL_Window, flags: SDL_WindowFlags) bool;
pub extern fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool;
const struct_unnamed_25 = extern struct {
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
const union_unnamed_24 = extern union {
    v: struct_unnamed_25,
    m: [4][4]f32,
};
pub const Float4X4 = extern struct {
    unnamed_0: union_unnamed_24 = @import("std").mem.zeroes(union_unnamed_24),
};
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
pub fn GPU_ConvertBlendFactor(factor: SDL_BlendFactor) callconv(.c) SDL_GPUBlendFactor {
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
                return SDL_GPU_BLENDFACTOR_ZERO;
            },
            3 => {
                return SDL_GPU_BLENDFACTOR_ONE;
            },
            4 => {
                return SDL_GPU_BLENDFACTOR_SRC_COLOR;
            },
            5 => {
                return SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR;
            },
            6 => {
                return SDL_GPU_BLENDFACTOR_SRC_ALPHA;
            },
            7 => {
                return SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA;
            },
            8 => {
                return SDL_GPU_BLENDFACTOR_DST_COLOR;
            },
            9 => {
                return SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR;
            },
            10 => {
                return SDL_GPU_BLENDFACTOR_DST_ALPHA;
            },
            11 => {
                return SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA;
            },
            12 => {
                return @as(SDL_GPUBlendFactor, @bitCast(@as(c_int, 2147483647)));
            },
            else => unreachable,
        }
    }
}
pub fn GPU_ConvertBlendOperation(operation: SDL_BlendOperation) callconv(.c) SDL_GPUBlendOp {
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
                return SDL_GPU_BLENDOP_ADD;
            },
            3 => {
                return SDL_GPU_BLENDOP_SUBTRACT;
            },
            4 => {
                return SDL_GPU_BLENDOP_REVERSE_SUBTRACT;
            },
            5 => {
                return SDL_GPU_BLENDOP_MIN;
            },
            6 => {
                return SDL_GPU_BLENDOP_MAX;
            },
            7 => {
                return @as(SDL_GPUBlendOp, @bitCast(@as(c_int, 2147483647)));
            },
            else => unreachable,
        }
    }
}
pub const VERT_SHADER_LINEPOINT: c_int = 0;
pub const VERT_SHADER_TRI_COLOR: c_int = 1;
pub const VERT_SHADER_TRI_TEXTURE: c_int = 2;
pub const GPU_VertexShaderID = c_int;
pub const FRAG_SHADER_COLOR: c_int = 0;
pub const FRAG_SHADER_TEXTURE_RGB: c_int = 1;
pub const FRAG_SHADER_TEXTURE_RGBA: c_int = 2;
pub const FRAG_SHADER_TEXTURE_ADVANCED: c_int = 3;
pub const FRAG_SHADER_TEXTURE_CUSTOM: c_int = 4;
pub const GPU_FragmentShaderID = c_int;
pub const struct_GPU_Shaders = extern struct {
    vert_shaders: [3]?*SDL_GPUShader = @import("std").mem.zeroes([3]?*SDL_GPUShader),
    frag_shaders: [5]?*SDL_GPUShader = @import("std").mem.zeroes([5]?*SDL_GPUShader),
};
pub const GPU_Shaders = struct_GPU_Shaders;
pub extern fn GPU_FillSupportedShaderFormats(props: SDL_PropertiesID) void;
pub extern fn GPU_InitShaders(shaders: [*c]GPU_Shaders, device: ?*SDL_GPUDevice) bool;
pub extern fn GPU_ReleaseShaders(shaders: [*c]GPU_Shaders, device: ?*SDL_GPUDevice) void;
pub const struct_GPU_PipelineParameters = extern struct {
    blend_mode: SDL_BlendMode = 0,
    frag_shader: GPU_FragmentShaderID = @import("std").mem.zeroes(GPU_FragmentShaderID),
    vert_shader: GPU_VertexShaderID = @import("std").mem.zeroes(GPU_VertexShaderID),
    attachment_format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    primitive_type: SDL_GPUPrimitiveType = @import("std").mem.zeroes(SDL_GPUPrimitiveType),
    custom_frag_shader: ?*SDL_GPUShader = null,
};
pub const GPU_PipelineParameters = struct_GPU_PipelineParameters;
pub const struct_GPU_PipelineCache = extern struct {
    table: ?*SDL_HashTable = null,
};
pub const GPU_PipelineCache = struct_GPU_PipelineCache;
pub extern fn GPU_InitPipelineCache(cache: [*c]GPU_PipelineCache, device: ?*SDL_GPUDevice) bool;
pub extern fn GPU_DestroyPipelineCache(cache: [*c]GPU_PipelineCache) void;
pub extern fn GPU_GetPipeline(cache: [*c]GPU_PipelineCache, shaders: [*c]GPU_Shaders, device: ?*SDL_GPUDevice, params: [*c]const GPU_PipelineParameters) ?*SDL_GPUGraphicsPipeline;
pub const struct_GPU_VertexShaderUniformData = extern struct {
    mvp: Float4X4 = @import("std").mem.zeroes(Float4X4),
};
pub const GPU_VertexShaderUniformData = struct_GPU_VertexShaderUniformData;
pub const struct_GPU_SimpleFragmentShaderUniformData = extern struct {
    color_scale: f32 = 0,
};
pub const GPU_SimpleFragmentShaderUniformData = struct_GPU_SimpleFragmentShaderUniformData;
pub const struct_GPU_AdvancedFragmentShaderUniformData = extern struct {
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
pub const GPU_AdvancedFragmentShaderUniformData = struct_GPU_AdvancedFragmentShaderUniformData;
pub const TONEMAP_NONE: f32 = @floatFromInt(@as(c_int, 0));
pub const TONEMAP_CHROME: f32 = @floatFromInt(@as(c_int, 2));
pub const TEXTURETYPE_RGB: f32 = @floatFromInt(@as(c_int, 1));
pub const TEXTURETYPE_RGB_PIXELART: f32 = @floatFromInt(@as(c_int, 2));
pub const TEXTURETYPE_RGBA: f32 = @floatFromInt(@as(c_int, 3));
pub const TEXTURETYPE_RGBA_PIXELART: f32 = @floatFromInt(@as(c_int, 4));
pub const TEXTURETYPE_PALETTE_NEAREST: f32 = @floatFromInt(@as(c_int, 5));
pub const TEXTURETYPE_PALETTE_LINEAR: f32 = @floatFromInt(@as(c_int, 6));
pub const TEXTURETYPE_PALETTE_PIXELART: f32 = @floatFromInt(@as(c_int, 7));
pub const TEXTURETYPE_NV12: f32 = @floatFromInt(@as(c_int, 8));
pub const TEXTURETYPE_NV21: f32 = @floatFromInt(@as(c_int, 9));
pub const TEXTURETYPE_YUV: f32 = @floatFromInt(@as(c_int, 10));
pub const INPUTTYPE_UNSPECIFIED: f32 = @floatFromInt(@as(c_int, 0));
pub const INPUTTYPE_SRGB: f32 = @floatFromInt(@as(c_int, 1));
pub const INPUTTYPE_SCRGB: f32 = @floatFromInt(@as(c_int, 2));
pub const INPUTTYPE_HDR10: f32 = @floatFromInt(@as(c_int, 3));
const struct_unnamed_26 = extern struct {
    texture: ?*SDL_GPUTexture = null,
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    width: Uint32 = 0,
    height: Uint32 = 0,
};
const struct_unnamed_27 = extern struct {
    composition: SDL_GPUSwapchainComposition = @import("std").mem.zeroes(SDL_GPUSwapchainComposition),
    present_mode: SDL_GPUPresentMode = @import("std").mem.zeroes(SDL_GPUPresentMode),
};
const struct_unnamed_28 = extern struct {
    transfer_buf: ?*SDL_GPUTransferBuffer = null,
    buffer: ?*SDL_GPUBuffer = null,
    buffer_size: Uint32 = 0,
};
const struct_unnamed_29 = extern struct {
    render_pass: ?*SDL_GPURenderPass = null,
    render_target: [*c]SDL_Texture = null,
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    color_attachment: SDL_GPUColorTargetInfo = @import("std").mem.zeroes(SDL_GPUColorTargetInfo),
    viewport: SDL_GPUViewport = @import("std").mem.zeroes(SDL_GPUViewport),
    scissor: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    scissor_enabled: bool = false,
    scissor_was_enabled: bool = false,
};
pub const struct_GPU_RenderData = extern struct {
    external_device: bool = false,
    device: ?*SDL_GPUDevice = null,
    shaders: GPU_Shaders = @import("std").mem.zeroes(GPU_Shaders),
    pipeline_cache: GPU_PipelineCache = @import("std").mem.zeroes(GPU_PipelineCache),
    backbuffer: struct_unnamed_26 = @import("std").mem.zeroes(struct_unnamed_26),
    swapchain: struct_unnamed_27 = @import("std").mem.zeroes(struct_unnamed_27),
    vertices: struct_unnamed_28 = @import("std").mem.zeroes(struct_unnamed_28),
    state: struct_unnamed_29 = @import("std").mem.zeroes(struct_unnamed_29),
    samplers: [8]?*SDL_GPUSampler = @import("std").mem.zeroes([8]?*SDL_GPUSampler),
};
pub const GPU_RenderData = struct_GPU_RenderData;
pub const struct_GPU_PaletteData = extern struct {
    texture: ?*SDL_GPUTexture = null,
};
pub const GPU_PaletteData = struct_GPU_PaletteData;
pub const struct_GPU_TextureData = extern struct {
    external_texture: bool = false,
    texture: ?*SDL_GPUTexture = null,
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    locked_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    YCbCr_matrix: [*c]const f32 = null,
    yuv: bool = false,
    external_texture_u: bool = false,
    external_texture_v: bool = false,
    textureU: ?*SDL_GPUTexture = null,
    textureV: ?*SDL_GPUTexture = null,
    nv12: bool = false,
    external_texture_nv: bool = false,
    textureNV: ?*SDL_GPUTexture = null,
};
pub const GPU_TextureData = struct_GPU_TextureData;
pub const supported_formats: [9]SDL_PixelFormat = [9]SDL_PixelFormat{
    SDL_PIXELFORMAT_BGRA32,
    SDL_PIXELFORMAT_RGBA32,
    SDL_PIXELFORMAT_BGRX32,
    SDL_PIXELFORMAT_RGBX32,
    SDL_PIXELFORMAT_ABGR2101010,
    SDL_PIXELFORMAT_RGBA64_FLOAT,
    SDL_PIXELFORMAT_RGB565,
    SDL_PIXELFORMAT_ARGB1555,
    SDL_PIXELFORMAT_ARGB4444,
};
pub fn GPU_SupportsBlendMode(_: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
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
    if ((((((GPU_ConvertBlendFactor(srcColorFactor) == @as(SDL_GPUBlendFactor, @bitCast(@as(c_int, 2147483647)))) or (GPU_ConvertBlendFactor(srcAlphaFactor) == @as(SDL_GPUBlendFactor, @bitCast(@as(c_int, 2147483647))))) or (GPU_ConvertBlendOperation(colorOperation) == @as(SDL_GPUBlendOp, @bitCast(@as(c_int, 2147483647))))) or (GPU_ConvertBlendFactor(dstColorFactor) == @as(SDL_GPUBlendFactor, @bitCast(@as(c_int, 2147483647))))) or (GPU_ConvertBlendFactor(dstAlphaFactor) == @as(SDL_GPUBlendFactor, @bitCast(@as(c_int, 2147483647))))) or (GPU_ConvertBlendOperation(alphaOperation) == @as(SDL_GPUBlendOp, @bitCast(@as(c_int, 2147483647))))) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn GPU_CreatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GPU_PaletteData = undefined;
    palettedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(palettedata.*)))));
    _ = &palettedata;
    if (!(palettedata != null)) {
        return @"false" != 0;
    }
    palette.*.internal = @ptrCast(@alignCast(palettedata));
    var tci: SDL_GPUTextureCreateInfo = undefined;
    _ = &tci;
    _ = memset(@ptrCast(@alignCast(&tci)), 0, @sizeOf(@TypeOf(tci)));
    tci.format = SDL_GetGPUTextureFormatFromPixelFormat_REAL(SDL_PIXELFORMAT_RGBA32);
    tci.layer_count_or_depth = 1;
    tci.num_levels = 1;
    tci.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 0));
    tci.width = 256;
    tci.height = 1;
    tci.sample_count = SDL_GPU_SAMPLECOUNT_1;
    palettedata.*.texture = SDL_CreateGPUTexture_REAL(data.*.device, &tci);
    if (!(palettedata.*.texture != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn GPU_UpdatePalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GPU_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    const data_size: Uint32 = @truncate(@as(c_ulong, @bitCast(@as(c_long, ncolors))) *% @sizeOf(@TypeOf(colors.*)));
    _ = &data_size;
    var tbci: SDL_GPUTransferBufferCreateInfo = undefined;
    _ = &tbci;
    _ = memset(@ptrCast(@alignCast(&tbci)), 0, @sizeOf(@TypeOf(tbci)));
    tbci.size = data_size;
    tbci.usage = SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD;
    var tbuf: ?*SDL_GPUTransferBuffer = SDL_CreateGPUTransferBuffer_REAL(data.*.device, &tbci);
    _ = &tbuf;
    if (@as(?*anyopaque, @ptrCast(@alignCast(tbuf))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    var output: [*c]Uint8 = @ptrCast(@alignCast(SDL_MapGPUTransferBuffer_REAL(data.*.device, tbuf, @"false" != 0)));
    _ = &output;
    _ = memcpy(@ptrCast(@alignCast(output)), @ptrCast(@alignCast(colors)), data_size);
    SDL_UnmapGPUTransferBuffer_REAL(data.*.device, tbuf);
    var cbuf: ?*SDL_GPUCommandBuffer = data.*.state.command_buffer;
    _ = &cbuf;
    var cpass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(cbuf);
    _ = &cpass;
    var tex_src: SDL_GPUTextureTransferInfo = undefined;
    _ = &tex_src;
    _ = memset(@ptrCast(@alignCast(&tex_src)), 0, @sizeOf(@TypeOf(tex_src)));
    tex_src.transfer_buffer = tbuf;
    tex_src.rows_per_layer = 1;
    tex_src.pixels_per_row = @bitCast(@as(c_int, ncolors));
    var tex_dst: SDL_GPUTextureRegion = undefined;
    _ = &tex_dst;
    _ = memset(@ptrCast(@alignCast(&tex_dst)), 0, @sizeOf(@TypeOf(tex_dst)));
    tex_dst.texture = palettedata.*.texture;
    tex_dst.x = 0;
    tex_dst.y = 0;
    tex_dst.w = @bitCast(@as(c_int, ncolors));
    tex_dst.h = 1;
    tex_dst.d = 1;
    SDL_UploadToGPUTexture_REAL(cpass, &tex_src, &tex_dst, @"false" != 0);
    SDL_EndGPUCopyPass_REAL(cpass);
    SDL_ReleaseGPUTransferBuffer_REAL(data.*.device, tbuf);
    return @"true" != 0;
}
pub fn GPU_DestroyPalette(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var palettedata: [*c]GPU_PaletteData = @ptrCast(@alignCast(palette.*.internal));
    _ = &palettedata;
    if (palettedata != null) {
        SDL_ReleaseGPUTexture_REAL(data.*.device, palettedata.*.texture);
        SDL_free_REAL(@ptrCast(@alignCast(palettedata)));
    }
}
pub fn GPU_CreateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GPU_RenderData = undefined;
    _ = &renderdata;
    var data: [*c]GPU_TextureData = undefined;
    _ = &data;
    var format: SDL_GPUTextureFormat = undefined;
    _ = &format;
    var usage: SDL_GPUTextureUsageFlags = undefined;
    _ = &usage;
    var size: usize = undefined;
    _ = &size;
    var pitch: usize = undefined;
    _ = &pitch;
    var tci: SDL_GPUTextureCreateInfo = undefined;
    _ = &tci;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var bits_per_pixel: c_int = undefined;
    _ = &bits_per_pixel;
    var bits_per_pixel_1: c_int = undefined;
    _ = &bits_per_pixel_1;
    var bits_per_pixel_2: c_int = undefined;
    _ = &bits_per_pixel_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                renderdata = @ptrCast(@alignCast(renderer.*.internal));
                usage = @as(c_uint, 1) << @intCast(@as(c_uint, 0));
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
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
                texture.*.internal = @ptrCast(@alignCast(data));
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            4 => {
                if (renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                format = SDL_GPU_TEXTUREFORMAT_R8_UNORM;
                {
                    sdl_pc = 4;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                format = SDL_GPU_TEXTUREFORMAT_R16_UNORM;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                format = SDL_GetGPUTextureFormatFromPixelFormat_REAL(texture.*.format);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            15 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if (format == @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            19 => {
                format = SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            20 => {
                format = SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB;
                {
                    sdl_pc = 18;
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
                return SDL_SetError_REAL("Texture format %s not supported by SDL_GPU", SDL_GetPixelFormatName_REAL(texture.*.format));
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                data.*.format = format;
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
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
                if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            28 => {
                if (!SDL_CalculateYUVSize(texture.*.format, texture.*.w, texture.*.h, &size, &pitch)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                data.*.pitch = texture.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
                size = @as(usize, @bitCast(@as(c_long, texture.*.h))) *% @as(usize, @bitCast(@as(c_long, data.*.pitch)));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                data.*.pixels = SDL_calloc_REAL(1, size);
                if (!(data.*.pixels != null)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            31 => {
                return @"false" != 0;
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                data.*.pitch = @bitCast(@as(c_uint, @truncate(pitch)));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                return @"false" != 0;
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            37 => {
                usage |= @as(c_uint, 1) << @intCast(@as(c_uint, 1));
                {
                    sdl_pc = 39;
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
                _ = memset(@ptrCast(@alignCast(&tci)), 0, @sizeOf(@TypeOf(tci)));
                tci.format = format;
                tci.layer_count_or_depth = 1;
                tci.num_levels = 1;
                tci.usage = usage;
                tci.width = @bitCast(@as(c_int, texture.*.w));
                tci.height = @bitCast(@as(c_int, texture.*.h));
                tci.sample_count = SDL_GPU_SAMPLECOUNT_1;
                tci.props = create_props;
                data.*.texture = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture", null)));
                if (data.*.texture != null) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                data.*.external_texture = @"true" != 0;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                data.*.texture = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.texture != null)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            42 => {
                props = SDL_GetTextureProperties_REAL(texture);
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture", @ptrCast(@alignCast(data.*.texture)));
                if (((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            43 => {
                return @"false" != 0;
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
                data.*.yuv = @"true" != 0;
                tci.width = (tci.width +% @as(Uint32, 1)) / @as(Uint32, 2);
                tci.height = (tci.height +% @as(Uint32, 1)) / @as(Uint32, 2);
                data.*.textureU = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture_u", null)));
                if (data.*.textureU != null) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            49 => {
                data.*.external_texture_u = @"true" != 0;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                data.*.textureU = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.textureU != null)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture_u", @ptrCast(@alignCast(data.*.textureU)));
                data.*.textureV = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture_v", null)));
                if (data.*.textureV != null) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            52 => {
                return @"false" != 0;
            },
            53 => {
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
                data.*.external_texture_v = @"true" != 0;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                data.*.textureV = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.textureV != null)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture_v", @ptrCast(@alignCast(data.*.textureV)));
                bits_per_pixel = if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL)) @as(c_int, 16) else @as(c_int, 8);
                data.*.YCbCr_matrix = SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, bits_per_pixel);
                if (!(data.*.YCbCr_matrix != null)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            58 => {
                return @"false" != 0;
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            61 => {
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            64 => {
                data.*.yuv = @"true" != 0;
                data.*.textureU = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture_u", null)));
                if (data.*.textureU != null) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
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
                if (((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            67 => {
                data.*.external_texture_u = @"true" != 0;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                data.*.textureU = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.textureU != null)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture_u", @ptrCast(@alignCast(data.*.textureU)));
                data.*.textureV = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture_v", null)));
                if (data.*.textureV != null) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            70 => {
                return @"false" != 0;
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
                data.*.external_texture_v = @"true" != 0;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                data.*.textureV = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.textureV != null)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture_v", @ptrCast(@alignCast(data.*.textureU)));
                bits_per_pixel_1 = if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL)) @as(c_int, 16) else @as(c_int, 8);
                data.*.YCbCr_matrix = SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, bits_per_pixel_1);
                if (!(data.*.YCbCr_matrix != null)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            76 => {
                return @"false" != 0;
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
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            82 => {
                data.*.nv12 = @"true" != 0;
                data.*.textureNV = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.texture.create.gpu.texture_uv", null)));
                if (data.*.textureNV != null) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
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
                return @"true" != 0;
            },
            85 => {
                data.*.external_texture_nv = @"true" != 0;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                tci.width = (tci.width +% @as(Uint32, 1)) / @as(Uint32, 2);
                tci.height = (tci.height +% @as(Uint32, 1)) / @as(Uint32, 2);
                if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            87 => {
                _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.gpu.texture_uv", @ptrCast(@alignCast(data.*.textureNV)));
                bits_per_pixel_2 = if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) @as(c_int, 10) else @as(c_int, 8);
                data.*.YCbCr_matrix = SDL_GetYCbCRtoRGBConversionMatrix(texture.*.colorspace, texture.*.w, texture.*.h, bits_per_pixel_2);
                if (!(data.*.YCbCr_matrix != null)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            88 => {
                tci.format = SDL_GPU_TEXTUREFORMAT_R16G16_UNORM;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                tci.format = SDL_GPU_TEXTUREFORMAT_R8G8_UNORM;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                data.*.textureNV = SDL_CreateGPUTexture_REAL(renderdata.*.device, &tci);
                if (!(data.*.textureNV != null)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                return @"false" != 0;
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            94 => {
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GPU_UpdateTextureInternal(renderdata: [*c]GPU_RenderData, cpass: ?*SDL_GPUCopyPass, texture: ?*SDL_GPUTexture, bpp: c_int, x: c_int, y: c_int, w: c_int, h: c_int, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var row_size: usize = undefined;
    _ = &row_size;
    var data_size: usize = undefined;
    _ = &data_size;
    if (!SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, w)), @bitCast(@as(c_long, bpp)), &row_size) or !SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, h)), row_size, &data_size)) {
        return SDL_SetError_REAL("update size overflow");
    }
    var tbci: SDL_GPUTransferBufferCreateInfo = undefined;
    _ = &tbci;
    _ = memset(@ptrCast(@alignCast(&tbci)), 0, @sizeOf(@TypeOf(tbci)));
    tbci.size = @truncate(data_size);
    tbci.usage = SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD;
    var tbuf: ?*SDL_GPUTransferBuffer = SDL_CreateGPUTransferBuffer_REAL(renderdata.*.device, &tbci);
    _ = &tbuf;
    if (@as(?*anyopaque, @ptrCast(@alignCast(tbuf))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    var output: [*c]Uint8 = @ptrCast(@alignCast(SDL_MapGPUTransferBuffer_REAL(renderdata.*.device, tbuf, @"false" != 0)));
    _ = &output;
    if (!(output != null)) {
        return @"false" != 0;
    }
    if (@as(usize, @bitCast(@as(c_long, pitch))) == row_size) {
        _ = memcpy(@ptrCast(@alignCast(output)), pixels, data_size);
    } else {
        var input: [*c]const Uint8 = @ptrCast(@alignCast(pixels));
        _ = &input;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < h) : (i += 1) {
                _ = memcpy(@ptrCast(@alignCast(output)), @ptrCast(@alignCast(input)), row_size);
                output += row_size;
                input += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    }
    SDL_UnmapGPUTransferBuffer_REAL(renderdata.*.device, tbuf);
    var tex_src: SDL_GPUTextureTransferInfo = undefined;
    _ = &tex_src;
    _ = memset(@ptrCast(@alignCast(&tex_src)), 0, @sizeOf(@TypeOf(tex_src)));
    tex_src.transfer_buffer = tbuf;
    tex_src.rows_per_layer = @bitCast(@as(c_int, h));
    tex_src.pixels_per_row = @bitCast(@as(c_int, w));
    var tex_dst: SDL_GPUTextureRegion = undefined;
    _ = &tex_dst;
    _ = memset(@ptrCast(@alignCast(&tex_dst)), 0, @sizeOf(@TypeOf(tex_dst)));
    tex_dst.texture = texture;
    tex_dst.x = @bitCast(@as(c_int, x));
    tex_dst.y = @bitCast(@as(c_int, y));
    tex_dst.w = @bitCast(@as(c_int, w));
    tex_dst.h = @bitCast(@as(c_int, h));
    tex_dst.d = 1;
    SDL_UploadToGPUTexture_REAL(cpass, &tex_src, &tex_dst, @"false" != 0);
    SDL_ReleaseGPUTransferBuffer_REAL(renderdata.*.device, tbuf);
    return @"true" != 0;
}
pub fn GPU_UpdateTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var retval: bool = @"true" != 0;
    _ = &retval;
    var cbuf: ?*SDL_GPUCommandBuffer = renderdata.*.state.command_buffer;
    _ = &cbuf;
    var cpass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(cbuf);
    _ = &cpass;
    var bpp: c_int = if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &bpp;
    retval = GPU_UpdateTextureInternal(renderdata, cpass, data.*.texture, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, pixels, pitch);
    if (data.*.nv12) {
        var Yplane: [*c]const Uint8 = @ptrCast(@alignCast(pixels));
        _ = &Yplane;
        var UVplane: [*c]const Uint8 = Yplane + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))));
        _ = &UVplane;
        var UVpitch: c_int = undefined;
        _ = &UVpitch;
        bpp *= 2;
        if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) {
            UVpitch = (pitch + @as(c_int, 3)) & ~@as(c_int, 3);
        } else {
            UVpitch = (pitch + @as(c_int, 1)) & ~@as(c_int, 1);
        }
        {
            const ref = &retval;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureNV, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(UVplane)), UVpitch)))) != 0;
        }
    } else if (data.*.yuv) {
        if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
            var Yplane: [*c]const Uint8 = @ptrCast(@alignCast(pixels));
            _ = &Yplane;
            var Uplane: [*c]const Uint8 = Yplane + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))));
            _ = &Uplane;
            var Vplane: [*c]const Uint8 = Uplane + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))));
            _ = &Vplane;
            {
                const ref = &retval;
                ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureU, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Uplane)), pitch)))) != 0;
            }
            {
                const ref = &retval;
                ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureV, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Vplane)), pitch)))) != 0;
            }
        } else {
            const Ypitch: c_int = pitch;
            _ = &Ypitch;
            const UVpitch: c_int = @divTrunc(@divTrunc(Ypitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * bpp;
            _ = &UVpitch;
            var Yplane: [*c]const Uint8 = @ptrCast(@alignCast(pixels));
            _ = &Yplane;
            var Uplane: [*c]const Uint8 = Yplane + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * Ypitch))));
            _ = &Uplane;
            var Vplane: [*c]const Uint8 = Uplane + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * UVpitch))));
            _ = &Vplane;
            if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
                {
                    const ref = &retval;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureV, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Uplane)), UVpitch)))) != 0;
                }
                {
                    const ref = &retval;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureU, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Vplane)), UVpitch)))) != 0;
                }
            } else {
                {
                    const ref = &retval;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureU, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Uplane)), UVpitch)))) != 0;
                }
                {
                    const ref = &retval;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureV, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Vplane)), UVpitch)))) != 0;
                }
            }
        }
    }
    SDL_EndGPUCopyPass_REAL(cpass);
    return retval;
}
pub fn GPU_UpdateTextureYUV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var bpp: c_int = if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &bpp;
    var retval: bool = @"true" != 0;
    _ = &retval;
    var cbuf: ?*SDL_GPUCommandBuffer = renderdata.*.state.command_buffer;
    _ = &cbuf;
    var cpass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(cbuf);
    _ = &cpass;
    {
        const ref = &retval;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.texture, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Yplane)), Ypitch)))) != 0;
    }
    if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
        {
            const ref = &retval;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureU, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Uplane)), Upitch)))) != 0;
        }
        {
            const ref = &retval;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureV, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Vplane)), Vpitch)))) != 0;
        }
    } else {
        {
            const ref = &retval;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureU, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Uplane)), Upitch)))) != 0;
        }
        {
            const ref = &retval;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureV, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(Vplane)), Vpitch)))) != 0;
        }
    }
    SDL_EndGPUCopyPass_REAL(cpass);
    return retval;
}
pub fn GPU_UpdateTextureNV(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var bpp: c_int = if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &bpp;
    var retval: bool = @"true" != 0;
    _ = &retval;
    var cbuf: ?*SDL_GPUCommandBuffer = renderdata.*.state.command_buffer;
    _ = &cbuf;
    var cpass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(cbuf);
    _ = &cpass;
    {
        const ref = &retval;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.texture, bpp, rect.*.x, rect.*.y, rect.*.w, rect.*.h, @ptrCast(@alignCast(Yplane)), Ypitch)))) != 0;
    }
    bpp *= 2;
    {
        const ref = &retval;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(GPU_UpdateTextureInternal(renderdata, cpass, data.*.textureNV, bpp, @divTrunc(rect.*.x, @as(c_int, 2)), @divTrunc(rect.*.y, @as(c_int, 2)), @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)), @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)), @ptrCast(@alignCast(UVplane)), UVpitch)))) != 0;
    }
    SDL_EndGPUCopyPass_REAL(cpass);
    return retval;
}
pub fn GPU_LockTexture(_: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    data.*.locked_rect = rect.*;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    pitch.* = data.*.pitch;
    return @"true" != 0;
}
pub fn GPU_UnlockTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var pixels: ?*anyopaque = undefined;
    _ = &pixels;
    rect = &data.*.locked_rect;
    pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    _ = GPU_UpdateTexture(renderer, texture, rect, pixels, data.*.pitch);
}
pub fn GPU_SetRenderTarget(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    data.*.state.render_target = texture;
    return @"true" != 0;
}
pub fn GPU_QueueNoOp(_: [*c]SDL_Renderer, _: [*c]SDL_RenderCommand) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GPU_QueueDrawPoints(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var verts: [*c]f32 = undefined;
    _ = &verts;
    var sz: usize = (@as(c_ulong, 2) *% @sizeOf(f32)) +% (@as(c_ulong, 4) *% @sizeOf(f32));
    _ = &sz;
    var color: SDL_FColor = cmd.*.data.draw.color;
    _ = &color;
    var convert_color: bool = (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10));
    _ = &convert_color;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(usize, @bitCast(@as(c_long, count))) *% sz, 0, &cmd.*.data.draw.first)));
    if (!(verts != null)) {
        return @"false" != 0;
    }
    if (convert_color) {
        SDL_ConvertToLinear(renderer, &color);
    }
    cmd.*.data.draw.count = @bitCast(@as(c_long, count));
    {
        var i: c_int = 0;
        _ = &i;
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
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = color.r;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = color.g;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = color.b;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = color.a;
        }
    }
    return @"true" != 0;
}
pub fn GPU_QueueGeometry(renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, _: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    var verts: [*c]f32 = undefined;
    _ = &verts;
    var sz: usize = ((@as(c_ulong, 2) *% @sizeOf(f32)) +% (@as(c_ulong, 4) *% @sizeOf(f32))) +% (@as(c_ulong, 2) *% @sizeOf(f32));
    _ = &sz;
    var convert_color: bool = (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10));
    _ = &convert_color;
    verts = @ptrCast(@alignCast(SDL_AllocateRenderVertices(renderer, @as(usize, @bitCast(@as(c_long, count))) *% sz, 0, &cmd.*.data.draw.first)));
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
            col_ = @as([*c]SDL_FColor, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(color)))) + @as(usize, @bitCast(@as(isize, @intCast(j * color_stride))))))).*;
            if (convert_color) {
                SDL_ConvertToLinear(renderer, &col_);
            }
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.r;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.g;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.b;
            (blk: {
                const ref = &verts;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = col_.a;
            if (uv != null) {
                var uv_: [*c]f32 = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(@constCast(uv)))) + @as(usize, @bitCast(@as(isize, @intCast(j * uv_stride))))));
                _ = &uv_;
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = uv_[@as(c_int, 0)];
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = uv_[@as(c_int, 1)];
            } else {
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = 0.0;
                (blk: {
                    const ref = &verts;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = 0.0;
            }
        }
    }
    return @"true" != 0;
}
pub fn GPU_InvalidateCachedState(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    data.*.state.scissor_enabled = @"false" != 0;
}
pub fn RestartRenderPass(data: [*c]GPU_RenderData) callconv(.c) ?*SDL_GPURenderPass {
    @setEvalBranchQuota(100000);
    if (data.*.state.render_pass != null) {
        SDL_EndGPURenderPass_REAL(data.*.state.render_pass);
    }
    data.*.state.render_pass = SDL_BeginGPURenderPass_REAL(data.*.state.command_buffer, &data.*.state.color_attachment, 1, null);
    data.*.state.color_attachment.load_op = SDL_GPU_LOADOP_LOAD;
    data.*.state.scissor_was_enabled = @"false" != 0;
    return data.*.state.render_pass;
}
pub fn PushVertexUniforms(data: [*c]GPU_RenderData, _: [*c]SDL_RenderCommand) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var uniforms: GPU_VertexShaderUniformData = undefined;
    _ = &uniforms;
    _ = memset(@ptrCast(@alignCast(&uniforms)), 0, @sizeOf(@TypeOf(uniforms)));
    uniforms.mvp.unnamed_0.m[@as(c_int, 0)][@as(c_int, 0)] = @as(f32, 2.0) / data.*.state.viewport.w;
    uniforms.mvp.unnamed_0.m[@as(c_int, 1)][@as(c_int, 1)] = -@as(f32, 2.0) / data.*.state.viewport.h;
    uniforms.mvp.unnamed_0.m[@as(c_int, 2)][@as(c_int, 2)] = 1.0;
    uniforms.mvp.unnamed_0.m[@as(c_int, 3)][@as(c_int, 0)] = -@as(f32, 1.0);
    uniforms.mvp.unnamed_0.m[@as(c_int, 3)][@as(c_int, 1)] = 1.0;
    uniforms.mvp.unnamed_0.m[@as(c_int, 3)][@as(c_int, 3)] = 1.0;
    SDL_PushGPUVertexUniformData_REAL(data.*.state.command_buffer, 0, @ptrCast(@alignCast(&uniforms)), @truncate(@sizeOf(@TypeOf(uniforms))));
}
pub fn SetViewportAndScissor(data: [*c]GPU_RenderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_SetGPUViewport_REAL(data.*.state.render_pass, &data.*.state.viewport);
    if (data.*.state.scissor_enabled) {
        SDL_SetGPUScissor_REAL(data.*.state.render_pass, &data.*.state.scissor);
        data.*.state.scissor_was_enabled = @"true" != 0;
    } else if (data.*.state.scissor_was_enabled) {
        var r: SDL_Rect = undefined;
        _ = &r;
        r.x = @intFromFloat(data.*.state.viewport.x);
        r.y = @intFromFloat(data.*.state.viewport.y);
        r.w = @intFromFloat(data.*.state.viewport.w);
        r.h = @intFromFloat(data.*.state.viewport.h);
        SDL_SetGPUScissor_REAL(data.*.state.render_pass, &r);
        data.*.state.scissor_was_enabled = @"false" != 0;
    }
}
pub fn GetSampler(data: [*c]GPU_RenderData, format: SDL_PixelFormat, arg_scale_mode: SDL_ScaleMode, address_u: SDL_TextureAddressMode, address_v: SDL_TextureAddressMode) callconv(.c) ?*SDL_GPUSampler {
    @setEvalBranchQuota(100000);
    var scale_mode = arg_scale_mode;
    _ = &scale_mode;
    const static_local___func__ = struct {
        const __func__: [10:0]u8 = "GetSampler".*;
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
    var sci: SDL_GPUSamplerCreateInfo = undefined;
    _ = &sci;
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
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gpu.c", 829);
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
                _ = memset(@ptrCast(@alignCast(&sci)), 0, @sizeOf(@TypeOf(sci)));
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
                sci.min_filter = SDL_GPU_FILTER_NEAREST;
                sci.mag_filter = SDL_GPU_FILTER_NEAREST;
                sci.mipmap_mode = SDL_GPU_SAMPLERMIPMAPMODE_NEAREST;
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
                sci.min_filter = SDL_GPU_FILTER_LINEAR;
                sci.mag_filter = SDL_GPU_FILTER_LINEAR;
                sci.mipmap_mode = SDL_GPU_SAMPLERMIPMAPMODE_LINEAR;
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
                sci.address_mode_u = SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                sci.address_mode_u = SDL_GPU_SAMPLERADDRESSMODE_REPEAT;
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
                sci.address_mode_w = SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
                data.*.samplers[key] = SDL_CreateGPUSampler_REAL(data.*.device, &sci);
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            29 => {
                sci.address_mode_v = SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            30 => {
                sci.address_mode_v = SDL_GPU_SAMPLERADDRESSMODE_REPEAT;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                _ = SDL_SetError_REAL("Unknown texture address mode: %d", address_v);
                return null;
            },
            else => unreachable,
        }
    }
}
pub fn CalculateAdvancedShaderConstants(renderer: [*c]SDL_Renderer, cmd: [*c]const SDL_RenderCommand, texture: [*c]const SDL_Texture, constants: [*c]GPU_AdvancedFragmentShaderUniformData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "CalculateAdvancedShaderConstants".*;
    };
    _ = &static_local___func__;
    var output_headroom: f32 = undefined;
    _ = &output_headroom;
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
    var data: [*c]GPU_TextureData = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memset(@ptrCast(@alignCast(constants)), 0, @sizeOf(@TypeOf(constants.*)));
                constants.*.scRGB_output = @floatFromInt(@intFromBool((renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))));
                constants.*.color_scale = cmd.*.data.draw.color_scale;
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            1 => {
                if ((((constants.*.texture_type == TEXTURETYPE_PALETTE_LINEAR) or (constants.*.texture_type == TEXTURETYPE_PALETTE_PIXELART)) or (constants.*.texture_type == TEXTURETYPE_RGB_PIXELART)) or (constants.*.texture_type == TEXTURETYPE_RGBA_PIXELART)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            2 => {
                switch (cmd.*.data.draw.texture_scale_mode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            3 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_NEAREST;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_LINEAR;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                constants.*.texture_type = TEXTURETYPE_PALETTE_PIXELART;
                {
                    sdl_pc = 3;
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
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            11 => {
                if (!!(@intFromPtr("Unknown scale mode") != 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render_gpu.c", 900);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 19;
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
                constants.*.texture_type = TEXTURETYPE_YUV;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            23 => {
                constants.*.texture_type = TEXTURETYPE_NV12;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                constants.*.texture_type = TEXTURETYPE_NV21;
                constants.*.input_type = INPUTTYPE_SRGB;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                constants.*.texture_type = TEXTURETYPE_NV12;
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 1;
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
                constants.*.texture_type = TEXTURETYPE_YUV;
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            28 => {
                switch (texture.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            29 => {
                if (texture.*.colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            35 => {
                if (cmd.*.data.draw.texture_scale_mode == SDL_SCALEMODE_PIXELART) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                constants.*.texture_type = TEXTURETYPE_RGBA_PIXELART;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                constants.*.texture_type = TEXTURETYPE_RGBA;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            39 => {
                constants.*.input_type = INPUTTYPE_SCRGB;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                if (texture.*.colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
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
                constants.*.input_type = INPUTTYPE_HDR10;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                constants.*.input_type = INPUTTYPE_UNSPECIFIED;
                {
                    sdl_pc = 44;
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
                constants.*.texture_width = @floatFromInt(texture.*.w);
                constants.*.texture_height = @floatFromInt(texture.*.h);
                constants.*.texel_width = @as(f32, 1.0) / constants.*.texture_width;
                constants.*.texel_height = @as(f32, 1.0) / constants.*.texture_height;
                {
                    sdl_pc = 47;
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
                constants.*.sdr_white_point = texture.*.SDR_white_point;
                if (renderer.*.target != null) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                output_headroom = renderer.*.target.*.HDR_headroom;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                output_headroom = renderer.*.HDR_headroom;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if ((texture.*.HDR_headroom > output_headroom) and (output_headroom > @as(f32, 0.0))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                constants.*.tonemap_method = TONEMAP_CHROME;
                constants.*.tonemap_factor1 = output_headroom / (texture.*.HDR_headroom * texture.*.HDR_headroom);
                constants.*.tonemap_factor2 = @as(f32, 1.0) / output_headroom;
                {
                    sdl_pc = 53;
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
                data = @ptrCast(@alignCast(texture.*.internal));
                if (data.*.yuv or data.*.nv12) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&constants.*.YCbCr_matrix))))), @ptrCast(@alignCast(data.*.YCbCr_matrix)), @sizeOf(@TypeOf(constants.*.YCbCr_matrix)));
                {
                    sdl_pc = 56;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn Draw(data: [*c]GPU_RenderData, cmd: [*c]SDL_RenderCommand, num_verts: Uint32, offset: Uint32, prim: SDL_GPUPrimitiveType) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(data.*.state.render_pass != null) or (data.*.state.color_attachment.load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_CLEAR))) {
        _ = RestartRenderPass(data);
    }
    var pass: ?*SDL_GPURenderPass = data.*.state.render_pass;
    _ = &pass;
    var custom_state: [*c]SDL_GPURenderState = cmd.*.data.draw.gpu_render_state;
    _ = &custom_state;
    var custom_frag_shader: ?*SDL_GPUShader = @ptrCast(@alignCast(if (custom_state != null) @as(?*anyopaque, @ptrCast(@alignCast(custom_state.*.fragment_shader))) else @as(?*anyopaque, null)));
    _ = &custom_frag_shader;
    var v_shader: GPU_VertexShaderID = undefined;
    _ = &v_shader;
    var f_shader: GPU_FragmentShaderID = undefined;
    _ = &f_shader;
    var simple_constants: GPU_SimpleFragmentShaderUniformData = GPU_SimpleFragmentShaderUniformData{
        .color_scale = cmd.*.data.draw.color_scale,
    };
    _ = &simple_constants;
    var advanced_constants: GPU_AdvancedFragmentShaderUniformData = undefined;
    _ = &advanced_constants;
    if (prim == @as(SDL_GPUPrimitiveType, SDL_GPU_PRIMITIVETYPE_TRIANGLELIST)) {
        var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
        _ = &texture;
        if (texture != null) {
            v_shader = VERT_SHADER_TRI_TEXTURE;
            CalculateAdvancedShaderConstants(texture.*.renderer, cmd, texture, &advanced_constants);
            if ((((advanced_constants.texture_type == TEXTURETYPE_RGB) or (advanced_constants.texture_type == TEXTURETYPE_RGBA)) and (advanced_constants.input_type == INPUTTYPE_UNSPECIFIED)) and (advanced_constants.tonemap_method == TONEMAP_NONE)) {
                if ((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32))) {
                    f_shader = FRAG_SHADER_TEXTURE_RGBA;
                } else {
                    f_shader = FRAG_SHADER_TEXTURE_RGB;
                }
            } else {
                f_shader = FRAG_SHADER_TEXTURE_ADVANCED;
            }
        } else {
            v_shader = VERT_SHADER_TRI_COLOR;
            f_shader = FRAG_SHADER_COLOR;
        }
    } else {
        v_shader = VERT_SHADER_LINEPOINT;
        f_shader = FRAG_SHADER_COLOR;
    }
    if (custom_frag_shader != null) {
        f_shader = FRAG_SHADER_TEXTURE_CUSTOM;
        data.*.shaders.frag_shaders[FRAG_SHADER_TEXTURE_CUSTOM] = custom_frag_shader;
    }
    var pipe_params: GPU_PipelineParameters = undefined;
    _ = &pipe_params;
    _ = memset(@ptrCast(@alignCast(&pipe_params)), 0, @sizeOf(@TypeOf(pipe_params)));
    pipe_params.blend_mode = cmd.*.data.draw.blend;
    pipe_params.vert_shader = v_shader;
    pipe_params.frag_shader = f_shader;
    pipe_params.primitive_type = prim;
    pipe_params.custom_frag_shader = custom_frag_shader;
    if (data.*.state.render_target != null) {
        pipe_params.attachment_format = @as([*c]GPU_TextureData, @ptrCast(@alignCast(data.*.state.render_target.*.internal))).*.format;
    } else {
        pipe_params.attachment_format = data.*.backbuffer.format;
    }
    var pipe: ?*SDL_GPUGraphicsPipeline = GPU_GetPipeline(&data.*.pipeline_cache, &data.*.shaders, data.*.device, &pipe_params);
    _ = &pipe;
    if (!(pipe != null)) {
        return;
    }
    SDL_BindGPUGraphicsPipeline_REAL(pass, pipe);
    var sampler_slot: Uint32 = 0;
    _ = &sampler_slot;
    if (cmd.*.data.draw.texture != null) {
        var texture: [*c]SDL_Texture = cmd.*.data.draw.texture;
        _ = &texture;
        var tdata: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
        _ = &tdata;
        var sampler_bind: SDL_GPUTextureSamplerBinding = undefined;
        _ = &sampler_bind;
        _ = memset(@ptrCast(@alignCast(&sampler_bind)), 0, @sizeOf(@TypeOf(sampler_bind)));
        sampler_bind.sampler = GetSampler(data, texture.*.format, cmd.*.data.draw.texture_scale_mode, cmd.*.data.draw.texture_address_mode_u, cmd.*.data.draw.texture_address_mode_v);
        sampler_bind.texture = tdata.*.texture;
        SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
            const ref = &sampler_slot;
            const tmp = ref.*;
            ref.* +%= 1;
            break :blk tmp;
        }, &sampler_bind, 1);
        if (f_shader == FRAG_SHADER_TEXTURE_ADVANCED) {
            if (texture.*.palette != null) {
                var palette: [*c]GPU_PaletteData = @ptrCast(@alignCast(texture.*.palette.*.internal));
                _ = &palette;
                sampler_bind.sampler = GetSampler(data, SDL_PIXELFORMAT_UNKNOWN, SDL_SCALEMODE_NEAREST, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
                sampler_bind.texture = palette.*.texture;
                SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
                    const ref = &sampler_slot;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, &sampler_bind, 1);
            } else if (tdata.*.yuv) {
                sampler_bind.texture = tdata.*.textureU;
                SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
                    const ref = &sampler_slot;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, &sampler_bind, 1);
                sampler_bind.texture = tdata.*.textureV;
                SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
                    const ref = &sampler_slot;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, &sampler_bind, 1);
            } else if (tdata.*.nv12) {
                sampler_bind.texture = tdata.*.textureNV;
                SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
                    const ref = &sampler_slot;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, &sampler_bind, 1);
            }
            while (sampler_slot < @as(Uint32, 3)) {
                SDL_BindGPUFragmentSamplers_REAL(pass, blk: {
                    const ref = &sampler_slot;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }, &sampler_bind, 1);
            }
        }
    }
    if (custom_state != null) {
        if (custom_state.*.num_sampler_bindings > @as(c_int, 0)) {
            SDL_BindGPUFragmentSamplers_REAL(pass, sampler_slot, custom_state.*.sampler_bindings, @bitCast(@as(c_int, custom_state.*.num_sampler_bindings)));
        }
        if (custom_state.*.num_storage_textures > @as(c_int, 0)) {
            SDL_BindGPUFragmentStorageTextures_REAL(pass, 0, custom_state.*.storage_textures, @bitCast(@as(c_int, custom_state.*.num_storage_textures)));
        }
        if (custom_state.*.num_storage_buffers > @as(c_int, 0)) {
            SDL_BindGPUFragmentStorageBuffers_REAL(pass, 0, custom_state.*.storage_buffers, @bitCast(@as(c_int, custom_state.*.num_storage_buffers)));
        }
        if (custom_state.*.num_uniform_buffers > @as(c_int, 0)) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < custom_state.*.num_uniform_buffers) : (i += 1) {
                    var ub: [*c]SDL_GPURenderStateUniformBuffer = &custom_state.*.uniform_buffers[@bitCast(@as(isize, @intCast(i)))];
                    _ = &ub;
                    SDL_PushGPUFragmentUniformData_REAL(data.*.state.command_buffer, ub.*.slot_index, ub.*.data, ub.*.length);
                }
            }
        }
    } else {
        if (f_shader == FRAG_SHADER_TEXTURE_ADVANCED) {
            SDL_PushGPUFragmentUniformData_REAL(data.*.state.command_buffer, 0, @ptrCast(@alignCast(&advanced_constants)), @truncate(@sizeOf(@TypeOf(advanced_constants))));
        } else {
            SDL_PushGPUFragmentUniformData_REAL(data.*.state.command_buffer, 0, @ptrCast(@alignCast(&simple_constants)), @truncate(@sizeOf(@TypeOf(simple_constants))));
        }
    }
    var buffer_bind: SDL_GPUBufferBinding = undefined;
    _ = &buffer_bind;
    _ = memset(@ptrCast(@alignCast(&buffer_bind)), 0, @sizeOf(@TypeOf(buffer_bind)));
    buffer_bind.buffer = data.*.vertices.buffer;
    buffer_bind.offset = offset;
    SDL_BindGPUVertexBuffers_REAL(pass, 0, &buffer_bind, 1);
    PushVertexUniforms(data, cmd);
    SetViewportAndScissor(data);
    SDL_DrawGPUPrimitives_REAL(pass, num_verts, 1, 0, 0);
}
pub fn ReleaseVertexBuffer(data: [*c]GPU_RenderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.vertices.buffer != null) {
        SDL_ReleaseGPUBuffer_REAL(data.*.device, data.*.vertices.buffer);
    }
    if (data.*.vertices.transfer_buf != null) {
        SDL_ReleaseGPUTransferBuffer_REAL(data.*.device, data.*.vertices.transfer_buf);
    }
    data.*.vertices.buffer_size = 0;
}
pub fn InitVertexBuffer(data: [*c]GPU_RenderData, size: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var bci: SDL_GPUBufferCreateInfo = undefined;
    _ = &bci;
    _ = memset(@ptrCast(@alignCast(&bci)), 0, @sizeOf(@TypeOf(bci)));
    bci.size = size;
    bci.usage = @as(c_uint, 1) << @intCast(@as(c_uint, 0));
    data.*.vertices.buffer = SDL_CreateGPUBuffer_REAL(data.*.device, &bci);
    if (!(data.*.vertices.buffer != null)) {
        return @"false" != 0;
    }
    var tbci: SDL_GPUTransferBufferCreateInfo = undefined;
    _ = &tbci;
    _ = memset(@ptrCast(@alignCast(&tbci)), 0, @sizeOf(@TypeOf(tbci)));
    tbci.size = size;
    tbci.usage = SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD;
    data.*.vertices.transfer_buf = SDL_CreateGPUTransferBuffer_REAL(data.*.device, &tbci);
    if (!(data.*.vertices.transfer_buf != null)) {
        return @"false" != 0;
    }
    data.*.vertices.buffer_size = size;
    return @"true" != 0;
}
pub fn UploadVertices(data: [*c]GPU_RenderData, vertices: ?*anyopaque, vertsize: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (vertsize == @as(usize, 0)) {
        return @"true" != 0;
    }
    if (vertsize > @as(usize, data.*.vertices.buffer_size)) {
        ReleaseVertexBuffer(data);
        if (!InitVertexBuffer(data, @truncate(vertsize))) {
            return @"false" != 0;
        }
    }
    var staging_buf: ?*anyopaque = SDL_MapGPUTransferBuffer_REAL(data.*.device, data.*.vertices.transfer_buf, @"true" != 0);
    _ = &staging_buf;
    _ = memcpy(staging_buf, vertices, vertsize);
    SDL_UnmapGPUTransferBuffer_REAL(data.*.device, data.*.vertices.transfer_buf);
    var pass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(data.*.state.command_buffer);
    _ = &pass;
    if (!(pass != null)) {
        return @"false" != 0;
    }
    var src: SDL_GPUTransferBufferLocation = undefined;
    _ = &src;
    _ = memset(@ptrCast(@alignCast(&src)), 0, @sizeOf(@TypeOf(src)));
    src.transfer_buffer = data.*.vertices.transfer_buf;
    var dst: SDL_GPUBufferRegion = undefined;
    _ = &dst;
    _ = memset(@ptrCast(@alignCast(&dst)), 0, @sizeOf(@TypeOf(dst)));
    dst.buffer = data.*.vertices.buffer;
    dst.size = @truncate(vertsize);
    SDL_UploadToGPUBuffer_REAL(pass, &src, &dst, @"true" != 0);
    SDL_EndGPUCopyPass_REAL(pass);
    return @"true" != 0;
}
pub fn GPU_RunCommandQueue(renderer: [*c]SDL_Renderer, arg_cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, vertsize: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd = arg_cmd;
    _ = &cmd;
    var data: [*c]GPU_RenderData = undefined;
    _ = &data;
    var tdata: [*c]GPU_TextureData = undefined;
    _ = &tdata;
    var viewport: [*c]SDL_Rect = undefined;
    _ = &viewport;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var convert_color: bool = undefined;
    _ = &convert_color;
    var color: SDL_FColor = undefined;
    _ = &color;
    var count: Uint32 = undefined;
    _ = &count;
    var offset: Uint32 = undefined;
    _ = &offset;
    var finalcmd: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd;
    var nextcmd: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd;
    var thiscolorscale: f32 = undefined;
    _ = &thiscolorscale;
    var thisblend: SDL_BlendMode = undefined;
    _ = &thisblend;
    var thisrenderstate: [*c]SDL_GPURenderState = undefined;
    _ = &thisrenderstate;
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
    var thisrenderstate_3: [*c]SDL_GPURenderState = undefined;
    _ = &thisrenderstate_3;
    var thiscmdtype: SDL_RenderCommandType = undefined;
    _ = &thiscmdtype;
    var finalcmd_4: [*c]SDL_RenderCommand = undefined;
    _ = &finalcmd_4;
    var nextcmd_5: [*c]SDL_RenderCommand = undefined;
    _ = &nextcmd_5;
    var count_6: Uint32 = undefined;
    _ = &count_6;
    var offset_7: Uint32 = undefined;
    _ = &offset_7;
    var nextcmdtype_8: SDL_RenderCommandType = undefined;
    _ = &nextcmdtype_8;
    var prim: SDL_GPUPrimitiveType = undefined;
    _ = &prim;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = @ptrCast(@alignCast(renderer.*.internal));
                if (!UploadVertices(data, vertices, vertsize)) {
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
                data.*.state.color_attachment.load_op = SDL_GPU_LOADOP_LOAD;
                if (renderer.*.target != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                tdata = @ptrCast(@alignCast(renderer.*.target.*.internal));
                data.*.state.color_attachment.texture = tdata.*.texture;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                data.*.state.color_attachment.texture = data.*.backbuffer.texture;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!(data.*.state.color_attachment.texture != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("Render target texture is NULL");
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
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_CLEAR) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_FILL_RECTS) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_COPY_EX) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_POINTS) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_RenderCommandType, SDL_RENDERCMD_NO_OP) => {
                        sdl_pc = 62;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            12 => {
                if (data.*.state.color_attachment.load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_CLEAR)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                viewport = &cmd.*.data.viewport.rect;
                data.*.state.viewport.x = @floatFromInt(viewport.*.x);
                data.*.state.viewport.y = @floatFromInt(viewport.*.y);
                data.*.state.viewport.w = @floatFromInt(viewport.*.w);
                data.*.state.viewport.h = @floatFromInt(viewport.*.h);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                rect = &cmd.*.data.cliprect.rect;
                data.*.state.scissor.x = @as(c_int, @intFromFloat(data.*.state.viewport.x)) + rect.*.x;
                data.*.state.scissor.y = @as(c_int, @intFromFloat(data.*.state.viewport.y)) + rect.*.y;
                data.*.state.scissor.w = rect.*.w;
                data.*.state.scissor.h = rect.*.h;
                data.*.state.scissor_enabled = cmd.*.data.cliprect.enabled;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                convert_color = (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10));
                color = cmd.*.data.color.color;
                if (convert_color) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                SDL_ConvertToLinear(renderer, &color);
                {
                    sdl_pc = 20;
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
                color.r *= cmd.*.data.color.color_scale;
                color.g *= cmd.*.data.color.color_scale;
                color.b *= cmd.*.data.color.color_scale;
                data.*.state.color_attachment.clear_color = color;
                data.*.state.color_attachment.load_op = SDL_GPU_LOADOP_CLEAR;
                {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            24 => {
                count = @truncate(cmd.*.data.draw.count);
                offset = @truncate(cmd.*.data.draw.first);
                if (count > @as(Uint32, 2)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                Draw(data, cmd, count, offset, SDL_GPU_PRIMITIVETYPE_LINESTRIP);
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                finalcmd = cmd;
                thiscolorscale = cmd.*.data.draw.color_scale;
                thisblend = cmd.*.data.draw.blend;
                thisrenderstate = cmd.*.data.draw.gpu_render_state;
                nextcmd = cmd.*.next;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            28 => {
                if (nextcmd != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                nextcmdtype = nextcmd.*.command;
                if (nextcmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_DRAW_LINES)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                nextcmd = nextcmd.*.next;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                Draw(data, cmd, count, offset, SDL_GPU_PRIMITIVETYPE_LINELIST);
                cmd = finalcmd;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            32 => {
                if (nextcmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (nextcmd.*.data.draw.count != @as(usize, 2)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 30;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            39 => {
                if (((nextcmd.*.data.draw.blend != thisblend) or (nextcmd.*.data.draw.color_scale != thiscolorscale)) or (nextcmd.*.data.draw.gpu_render_state != thisrenderstate)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            42 => {
                finalcmd = nextcmd;
                count +%= @truncate(nextcmd.*.data.draw.count);
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                thiscolorscale_1 = cmd.*.data.draw.color_scale;
                thistexture = cmd.*.data.draw.texture;
                thisblend_2 = cmd.*.data.draw.blend;
                thisscalemode = cmd.*.data.draw.texture_scale_mode;
                thisaddressmode_u = cmd.*.data.draw.texture_address_mode_u;
                thisaddressmode_v = cmd.*.data.draw.texture_address_mode_v;
                thisrenderstate_3 = cmd.*.data.draw.gpu_render_state;
                thiscmdtype = cmd.*.command;
                finalcmd_4 = cmd;
                count_6 = @truncate(cmd.*.data.draw.count);
                offset_7 = @truncate(cmd.*.data.draw.first);
                nextcmd_5 = cmd.*.next;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (nextcmd_5 != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                nextcmdtype_8 = nextcmd_5.*.command;
                if (nextcmdtype_8 != thiscmdtype) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                nextcmd_5 = nextcmd_5.*.next;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                if (thiscmdtype == @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            50 => {
                if (nextcmdtype_8 == @as(SDL_RenderCommandType, SDL_RENDERCMD_SETDRAWCOLOR)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                if (((((((nextcmd_5.*.data.draw.texture != thistexture) or (nextcmd_5.*.data.draw.texture_scale_mode != thisscalemode)) or (nextcmd_5.*.data.draw.texture_address_mode_u != thisaddressmode_u)) or (nextcmd_5.*.data.draw.texture_address_mode_v != thisaddressmode_v)) or (nextcmd_5.*.data.draw.blend != thisblend_2)) or (nextcmd_5.*.data.draw.color_scale != thiscolorscale_1)) or (nextcmd_5.*.data.draw.gpu_render_state != thisrenderstate_3)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
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
                {
                    sdl_pc = 48;
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
                    sdl_pc = 49;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            57 => {
                finalcmd_4 = nextcmd_5;
                count_6 +%= @truncate(nextcmd_5.*.data.draw.count);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            59 => {
                prim = SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                prim = SDL_GPU_PRIMITIVETYPE_POINTLIST;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                Draw(data, cmd, count_6, offset_7, prim);
                cmd = finalcmd_4;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            63 => {
                _ = RestartRenderPass(data);
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (data.*.state.render_pass != null) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                SDL_EndGPURenderPass_REAL(data.*.state.render_pass);
                data.*.state.render_pass = null;
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
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn GPU_RenderReadPixels(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var gpu_tex: ?*SDL_GPUTexture = undefined;
    _ = &gpu_tex;
    var pixfmt: SDL_PixelFormat = undefined;
    _ = &pixfmt;
    if (data.*.state.render_target != null) {
        var texture: [*c]SDL_Texture = data.*.state.render_target;
        _ = &texture;
        var texdata: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
        _ = &texdata;
        gpu_tex = texdata.*.texture;
        pixfmt = texture.*.format;
    } else {
        gpu_tex = data.*.backbuffer.texture;
        pixfmt = SDL_GetPixelFormatFromGPUTextureFormat_REAL(data.*.backbuffer.format);
        if (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
            _ = SDL_SetError_REAL("Unsupported backbuffer format");
            return null;
        }
    }
    var bpp: Uint32 = @bitCast(@as(c_int, if ((pixfmt != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((pixfmt >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (pixfmt == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((pixfmt >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))));
    _ = &bpp;
    var row_size: usize = undefined;
    _ = &row_size;
    var image_size: usize = undefined;
    _ = &image_size;
    if (!SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, rect.*.w)), bpp, &row_size) or !SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, rect.*.h)), row_size, &image_size)) {
        _ = SDL_SetError_REAL("read size overflow");
        return null;
    }
    var surface: [*c]SDL_Surface = SDL_CreateSurfaceUninitialized(rect.*.w, rect.*.h, pixfmt);
    _ = &surface;
    if (!(surface != null)) {
        return null;
    }
    var tbci: SDL_GPUTransferBufferCreateInfo = undefined;
    _ = &tbci;
    _ = memset(@ptrCast(@alignCast(&tbci)), 0, @sizeOf(@TypeOf(tbci)));
    tbci.size = @truncate(image_size);
    tbci.usage = SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD;
    var tbuf: ?*SDL_GPUTransferBuffer = SDL_CreateGPUTransferBuffer_REAL(data.*.device, &tbci);
    _ = &tbuf;
    if (!(tbuf != null)) {
        return null;
    }
    var pass: ?*SDL_GPUCopyPass = SDL_BeginGPUCopyPass_REAL(data.*.state.command_buffer);
    _ = &pass;
    var src: SDL_GPUTextureRegion = undefined;
    _ = &src;
    _ = memset(@ptrCast(@alignCast(&src)), 0, @sizeOf(@TypeOf(src)));
    src.texture = gpu_tex;
    src.x = @bitCast(@as(c_int, rect.*.x));
    src.y = @bitCast(@as(c_int, rect.*.y));
    src.w = @bitCast(@as(c_int, rect.*.w));
    src.h = @bitCast(@as(c_int, rect.*.h));
    src.d = 1;
    var dst: SDL_GPUTextureTransferInfo = undefined;
    _ = &dst;
    _ = memset(@ptrCast(@alignCast(&dst)), 0, @sizeOf(@TypeOf(dst)));
    dst.transfer_buffer = tbuf;
    dst.rows_per_layer = @bitCast(@as(c_int, rect.*.h));
    dst.pixels_per_row = @bitCast(@as(c_int, rect.*.w));
    SDL_DownloadFromGPUTexture_REAL(pass, &src, &dst);
    SDL_EndGPUCopyPass_REAL(pass);
    var fence: ?*SDL_GPUFence = SDL_SubmitGPUCommandBufferAndAcquireFence_REAL(data.*.state.command_buffer);
    _ = &fence;
    _ = SDL_WaitForGPUFences_REAL(data.*.device, @"true" != 0, &fence, 1);
    SDL_ReleaseGPUFence_REAL(data.*.device, fence);
    data.*.state.command_buffer = SDL_AcquireGPUCommandBuffer_REAL(data.*.device);
    var mapped_tbuf: ?*anyopaque = SDL_MapGPUTransferBuffer_REAL(data.*.device, tbuf, @"false" != 0);
    _ = &mapped_tbuf;
    if (@as(usize, @bitCast(@as(c_long, surface.*.pitch))) == row_size) {
        _ = memcpy(surface.*.pixels, mapped_tbuf, image_size);
    } else {
        var input: [*c]Uint8 = @ptrCast(@alignCast(mapped_tbuf));
        _ = &input;
        var output: [*c]Uint8 = @ptrCast(@alignCast(surface.*.pixels));
        _ = &output;
        {
            var row: c_int = 0;
            _ = &row;
            while (row < rect.*.h) : (row += 1) {
                _ = memcpy(@ptrCast(@alignCast(output)), @ptrCast(@alignCast(input)), row_size);
                output += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
                input += row_size;
            }
        }
    }
    SDL_UnmapGPUTransferBuffer_REAL(data.*.device, tbuf);
    SDL_ReleaseGPUTransferBuffer_REAL(data.*.device, tbuf);
    return surface;
}
pub fn CreateBackbuffer(data: [*c]GPU_RenderData, w: Uint32, h: Uint32, fmt: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var tci: SDL_GPUTextureCreateInfo = undefined;
    _ = &tci;
    _ = memset(@ptrCast(@alignCast(&tci)), 0, @sizeOf(@TypeOf(tci)));
    tci.width = w;
    tci.height = h;
    tci.format = fmt;
    tci.layer_count_or_depth = 1;
    tci.num_levels = 1;
    tci.sample_count = SDL_GPU_SAMPLECOUNT_1;
    tci.usage = (@as(c_uint, 1) << @intCast(@as(c_uint, 1))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 0)));
    SDL_ReleaseGPUTexture_REAL(data.*.device, data.*.backbuffer.texture);
    data.*.backbuffer.texture = SDL_CreateGPUTexture_REAL(data.*.device, &tci);
    data.*.backbuffer.width = w;
    data.*.backbuffer.height = h;
    data.*.backbuffer.format = fmt;
    if (!(data.*.backbuffer.texture != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn GPU_RenderPresent(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (renderer.*.window != null) {
        var swapchain: ?*SDL_GPUTexture = undefined;
        _ = &swapchain;
        var swapchain_texture_width: Uint32 = undefined;
        _ = &swapchain_texture_width;
        var swapchain_texture_height: Uint32 = undefined;
        _ = &swapchain_texture_height;
        var result: bool = SDL_WaitAndAcquireGPUSwapchainTexture_REAL(data.*.state.command_buffer, renderer.*.window, &swapchain, &swapchain_texture_width, &swapchain_texture_height);
        _ = &result;
        if (!result) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_RENDER, "Failed to acquire swapchain texture: %s", SDL_GetError_REAL());
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(swapchain))) != @as(?*anyopaque, null)) {
            var blit_info: SDL_GPUBlitInfo = undefined;
            _ = &blit_info;
            _ = memset(@ptrCast(@alignCast(&blit_info)), 0, @sizeOf(@TypeOf(blit_info)));
            blit_info.source.texture = data.*.backbuffer.texture;
            blit_info.source.w = data.*.backbuffer.width;
            blit_info.source.h = data.*.backbuffer.height;
            blit_info.destination.texture = swapchain;
            blit_info.destination.w = swapchain_texture_width;
            blit_info.destination.h = swapchain_texture_height;
            blit_info.load_op = SDL_GPU_LOADOP_DONT_CARE;
            blit_info.filter = SDL_GPU_FILTER_LINEAR;
            SDL_BlitGPUTexture_REAL(data.*.state.command_buffer, &blit_info);
            _ = SDL_SubmitGPUCommandBuffer_REAL(data.*.state.command_buffer);
            if ((swapchain_texture_width != data.*.backbuffer.width) or (swapchain_texture_height != data.*.backbuffer.height)) {
                _ = CreateBackbuffer(data, swapchain_texture_width, swapchain_texture_height, SDL_GetGPUSwapchainTextureFormat_REAL(data.*.device, renderer.*.window));
                _ = SDL_SendWindowEvent(renderer.*.window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
            }
        } else {
            _ = SDL_SubmitGPUCommandBuffer_REAL(data.*.state.command_buffer);
        }
    } else {
        _ = SDL_SubmitGPUCommandBuffer_REAL(data.*.state.command_buffer);
    }
    data.*.state.command_buffer = SDL_AcquireGPUCommandBuffer_REAL(data.*.device);
    return @"true" != 0;
}
pub fn GPU_DestroyTexture(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderdata: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &renderdata;
    var data: [*c]GPU_TextureData = @ptrCast(@alignCast(texture.*.internal));
    _ = &data;
    if (renderdata.*.state.render_target == texture) {
        renderdata.*.state.render_target = null;
    }
    if (!(data != null)) {
        return;
    }
    if (!data.*.external_texture) {
        SDL_ReleaseGPUTexture_REAL(renderdata.*.device, data.*.texture);
    }
    if (!data.*.external_texture_u) {
        SDL_ReleaseGPUTexture_REAL(renderdata.*.device, data.*.textureU);
    }
    if (!data.*.external_texture_v) {
        SDL_ReleaseGPUTexture_REAL(renderdata.*.device, data.*.textureV);
    }
    if (!data.*.external_texture_nv) {
        SDL_ReleaseGPUTexture_REAL(renderdata.*.device, data.*.textureNV);
    }
    SDL_free_REAL(data.*.pixels);
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    texture.*.internal = null;
}
pub fn GPU_DestroyRenderer(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    if (!(data != null)) {
        return;
    }
    if (data.*.state.command_buffer != null) {
        _ = SDL_CancelGPUCommandBuffer_REAL(data.*.state.command_buffer);
        data.*.state.command_buffer = null;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(data.*.samplers)) / @sizeOf(@TypeOf(data.*.samplers[@as(c_int, 0)])))) : (i +%= 1) {
            if (data.*.samplers[i] != null) {
                SDL_ReleaseGPUSampler_REAL(data.*.device, data.*.samplers[i]);
            }
        }
    }
    if (data.*.backbuffer.texture != null) {
        SDL_ReleaseGPUTexture_REAL(data.*.device, data.*.backbuffer.texture);
    }
    if ((renderer.*.window != null) and (data.*.device != null)) {
        SDL_ReleaseWindowFromGPUDevice_REAL(data.*.device, renderer.*.window);
    }
    ReleaseVertexBuffer(data);
    GPU_DestroyPipelineCache(&data.*.pipeline_cache);
    if (data.*.device != null) {
        GPU_ReleaseShaders(&data.*.shaders, data.*.device);
        if (!data.*.external_device) {
            SDL_DestroyGPUDevice_REAL(data.*.device);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(data)));
}
pub fn ChoosePresentMode(device: ?*SDL_GPUDevice, window: [*c]SDL_Window, vsync: c_int, out_mode: [*c]SDL_GPUPresentMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &vsync;
    var mode: SDL_GPUPresentMode = undefined;
    _ = &mode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (vsync) {
                    @as(c_int, 0) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 1) => {
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
                out_mode.* = mode;
                return @"true" != 0;
            },
            2 => {
                mode = SDL_GPU_PRESENTMODE_MAILBOX;
                if (!SDL_WindowSupportsGPUPresentMode_REAL(device, window, mode)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                mode = SDL_GPU_PRESENTMODE_IMMEDIATE;
                if (!SDL_WindowSupportsGPUPresentMode_REAL(device, window, mode)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                mode = SDL_GPU_PRESENTMODE_VSYNC;
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
                mode = SDL_GPU_PRESENTMODE_VSYNC;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub fn GPU_SetVSync(renderer: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &vsync;
    var data: [*c]GPU_RenderData = @ptrCast(@alignCast(renderer.*.internal));
    _ = &data;
    var mode: SDL_GPUPresentMode = SDL_GPU_PRESENTMODE_VSYNC;
    _ = &mode;
    if (!(renderer.*.window != null)) {
        if (!(vsync != 0)) {
            return @"true" != 0;
        } else {
            return SDL_SetError_REAL("That operation is not supported");
        }
    }
    if (!ChoosePresentMode(data.*.device, renderer.*.window, vsync, &mode)) {
        return @"false" != 0;
    }
    if (mode != data.*.swapchain.present_mode) {
        if (SDL_SetGPUSwapchainParameters_REAL(data.*.device, renderer.*.window, data.*.swapchain.composition, mode)) {
            data.*.swapchain.present_mode = mode;
            return @"true" != 0;
        } else {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn GPU_CreateRenderer(renderer: [*c]SDL_Renderer, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]GPU_RenderData = undefined;
    _ = &data;
    var flags: SDL_WindowFlags = undefined;
    _ = &flags;
    var debug: bool = undefined;
    _ = &debug;
    var lowpower: bool = undefined;
    _ = &lowpower;
    var vsync: c_int = undefined;
    _ = &vsync;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var i: c_int = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = null;
                flags = if (window != null) SDL_GetWindowFlags_REAL(window) else @as(SDL_WindowFlags, 0);
                if ((flags & @as(c_ulong, 2)) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                flags &= ~@as(c_ulong, 2);
                _ = SDL_ReconfigureWindow(window, flags);
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
                SDL_SetupRendererColorspace(renderer, create_props);
                if ((renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB)) and (renderer.*.output_colorspace != @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Unsupported output colorspace");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
                if (!(data != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                renderer.*.SupportsBlendMode = GPU_SupportsBlendMode;
                renderer.*.CreatePalette = GPU_CreatePalette;
                renderer.*.UpdatePalette = GPU_UpdatePalette;
                renderer.*.DestroyPalette = GPU_DestroyPalette;
                renderer.*.CreateTexture = GPU_CreateTexture;
                renderer.*.UpdateTexture = GPU_UpdateTexture;
                renderer.*.UpdateTextureYUV = GPU_UpdateTextureYUV;
                renderer.*.UpdateTextureNV = GPU_UpdateTextureNV;
                renderer.*.LockTexture = GPU_LockTexture;
                renderer.*.UnlockTexture = GPU_UnlockTexture;
                renderer.*.SetRenderTarget = GPU_SetRenderTarget;
                renderer.*.QueueSetViewport = GPU_QueueNoOp;
                renderer.*.QueueSetDrawColor = GPU_QueueNoOp;
                renderer.*.QueueDrawPoints = GPU_QueueDrawPoints;
                renderer.*.QueueDrawLines = GPU_QueueDrawPoints;
                renderer.*.QueueGeometry = GPU_QueueGeometry;
                renderer.*.InvalidateCachedState = GPU_InvalidateCachedState;
                renderer.*.RunCommandQueue = GPU_RunCommandQueue;
                renderer.*.RenderReadPixels = GPU_RenderReadPixels;
                renderer.*.RenderPresent = GPU_RenderPresent;
                renderer.*.DestroyTexture = GPU_DestroyTexture;
                renderer.*.DestroyRenderer = GPU_DestroyRenderer;
                renderer.*.SetVSync = GPU_SetVSync;
                renderer.*.internal = @ptrCast(@alignCast(data));
                renderer.*.window = window;
                renderer.*.name = GPU_RenderDriver.name;
                data.*.device = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.renderer.create.gpu.device", null)));
                if (data.*.device != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                data.*.external_device = @"true" != 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                debug = SDL_GetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.debugmode", @"false" != 0);
                lowpower = SDL_GetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.preferlowpower", @"false" != 0);
                debug = SDL_GetHintBoolean_REAL("SDL_RENDER_GPU_DEBUG", debug);
                lowpower = SDL_GetHintBoolean_REAL("SDL_RENDER_GPU_LOW_POWER", lowpower);
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.debugmode", debug);
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.preferlowpower", lowpower);
                if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.name"))))) != 0) and ((SDL_GetWindowFlags_REAL(window) & @as(c_ulong, 268435456)) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (!GPU_InitShaders(&data.*.shaders, data.*.device)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            13 => {
                _ = SDL_SetStringProperty_REAL(create_props, "SDL.gpu.device.create.name", "vulkan");
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.d3d12.allowtier1resourcebinding")) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.d3d12.allowtier1resourcebinding", @"true" != 0);
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.feature.clip_distance")) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.feature.clip_distance", @"false" != 0);
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.feature.depth_clamping")) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.feature.depth_clamping", @"false" != 0);
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.feature.indirect_draw_first_instance")) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.feature.indirect_draw_first_instance", @"false" != 0);
                {
                    sdl_pc = 27;
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.feature.anisotropy")) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.feature.anisotropy", @"false" != 0);
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
                if (!SDL_HasProperty_REAL(create_props, "SDL.gpu.device.create.metal.allowmacfamily1")) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                _ = SDL_SetBooleanProperty_REAL(create_props, "SDL.gpu.device.create.metal.allowmacfamily1", @"false" != 0);
                {
                    sdl_pc = 33;
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
                GPU_FillSupportedShaderFormats(create_props);
                data.*.device = SDL_CreateGPUDeviceWithProperties_REAL(create_props);
                if (!(data.*.device != null)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                return @"false" != 0;
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            37 => {
                return @"false" != 0;
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (!GPU_InitPipelineCache(&data.*.pipeline_cache, data.*.device)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                return @"false" != 0;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (!InitVertexBuffer(data, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 16)))))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                return @"false" != 0;
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (window != null) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                if (!SDL_ClaimWindowForGPUDevice_REAL(data.*.device, window)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                i = 0;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            49 => {
                return @"false" != 0;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                switch (renderer.*.output_colorspace) {
                    @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_Colorspace, SDL_COLORSPACE_HDR10) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_Colorspace, SDL_COLORSPACE_SRGB) => {
                        sdl_pc = 55;
                        continue;
                    },
                    else => {
                        sdl_pc = 56;
                        continue;
                    },
                }
            },
            52 => {
                data.*.swapchain.present_mode = SDL_GPU_PRESENTMODE_VSYNC;
                vsync = @truncate(SDL_GetNumberProperty_REAL(create_props, "SDL.renderer.create.present_vsync", 0));
                _ = ChoosePresentMode(data.*.device, window, vsync, &data.*.swapchain.present_mode);
                _ = SDL_SetGPUSwapchainParameters_REAL(data.*.device, window, data.*.swapchain.composition, data.*.swapchain.present_mode);
                _ = SDL_SetGPUAllowedFramesInFlight_REAL(data.*.device, 1);
                _ = SDL_GetWindowSizeInPixels_REAL(window, &w, &h);
                if (!CreateBackbuffer(data, @bitCast(@as(c_int, w)), @bitCast(@as(c_int, h)), SDL_GetGPUSwapchainTextureFormat_REAL(data.*.device, window))) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            53 => {
                data.*.swapchain.composition = SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            54 => {
                data.*.swapchain.composition = SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084;
                {
                    sdl_pc = 52;
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
                data.*.swapchain.composition = SDL_GPU_SWAPCHAINCOMPOSITION_SDR;
                {
                    sdl_pc = 52;
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            60 => {
                if (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(supported_formats)) / @sizeOf(@TypeOf(supported_formats[@as(c_int, 0)])))) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                if (SDL_GPUTextureSupportsFormat_REAL(data.*.device, SDL_GetGPUTextureFormatFromPixelFormat_REAL(supported_formats[@bitCast(@as(isize, @intCast(i)))]), SDL_GPU_TEXTURETYPE_2D, @as(c_uint, 1) << @intCast(@as(c_uint, 0)))) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            62 => {
                i += 1;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_INDEX8);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_YV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_IYUV);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_I444);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV12);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_NV21);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_P010);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_I0FL);
                _ = SDL_AddSupportedTextureFormat(renderer, SDL_PIXELFORMAT_I4FL);
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", 16384);
                data.*.state.viewport.min_depth = @floatFromInt(@as(c_int, 0));
                data.*.state.viewport.max_depth = @floatFromInt(@as(c_int, 1));
                data.*.state.command_buffer = SDL_AcquireGPUCommandBuffer_REAL(data.*.device);
                _ = SDL_SetPointerProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.gpu.device", @ptrCast(@alignCast(data.*.device)));
                return @"true" != 0;
            },
            64 => {
                _ = SDL_AddSupportedTextureFormat(renderer, supported_formats[@bitCast(@as(isize, @intCast(i)))]);
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
                    sdl_pc = 62;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export var GPU_RenderDriver: SDL_RenderDriver = SDL_RenderDriver{
    .CreateRenderer = GPU_CreateRenderer,
    .name = "gpu",
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
