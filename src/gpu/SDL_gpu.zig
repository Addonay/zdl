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
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_ABGR2101010: c_int = 376905732;
pub const SDL_PIXELFORMAT_RGBA64: c_int = 404766728;
pub const SDL_PIXELFORMAT_RGBA64_FLOAT: c_int = 438321160;
pub const SDL_PIXELFORMAT_RGBA128_FLOAT: c_int = 455114768;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBX32: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX32: c_int = 370546692;
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
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
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
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const enum_SDL_SystemTheme = c_uint;
pub const SDL_SystemTheme = enum_SDL_SystemTheme;
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
pub const enum_SDL_DisplayOrientation = c_uint;
pub const SDL_DisplayOrientation = enum_SDL_DisplayOrientation;
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const struct_SDL_Renderer = opaque {
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
    renderers: [*c]?*SDL_Renderer = null,
    internal: ?*SDL_WindowData = null,
    keyboard_focus: [*c]SDL_Window = null,
    prev: [*c]SDL_Window = null,
    next: [*c]SDL_Window = null,
    parent: [*c]SDL_Window = null,
    first_child: [*c]SDL_Window = null,
    prev_sibling: [*c]SDL_Window = null,
    next_sibling: [*c]SDL_Window = null,
};
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const struct_SDL_GLContextState = opaque {
};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;
pub const SDL_EGLAttrib = isize;
pub const SDL_EGLint = c_int;
pub const SDL_EGLAttribArrayCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (userdata: ?*anyopaque, display: SDL_EGLDisplay, config: SDL_EGLConfig) callconv(.c) [*c]SDL_EGLint;
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPURenderer = opaque {};
pub const SDL_GPURenderer = struct_SDL_GPURenderer;
pub const XrSwapchain = Uint64;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const XR_ERROR_HANDLE_INVALID: c_int = -12;
pub const enum_XrResult = c_int;
pub const XrResult = enum_XrResult;
pub const SDL_GPUShaderFormat = Uint32;
pub const struct_SDL_GPUComputePipelineCreateInfo = extern struct {
    code_size: usize = 0,
    code: [*c]const Uint8 = null,
    entrypoint: [*c]const u8 = null,
    format: SDL_GPUShaderFormat = 0,
    num_samplers: Uint32 = 0,
    num_readonly_storage_textures: Uint32 = 0,
    num_readonly_storage_buffers: Uint32 = 0,
    num_readwrite_storage_textures: Uint32 = 0,
    num_readwrite_storage_buffers: Uint32 = 0,
    num_uniform_buffers: Uint32 = 0,
    threadcount_x: Uint32 = 0,
    threadcount_y: Uint32 = 0,
    threadcount_z: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUComputePipelineCreateInfo = struct_SDL_GPUComputePipelineCreateInfo;
pub const struct_SDL_GPUComputePipeline = opaque {};
pub const SDL_GPUComputePipeline = struct_SDL_GPUComputePipeline;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const enum_SDL_GPUVertexInputRate = c_uint;
pub const SDL_GPUVertexInputRate = enum_SDL_GPUVertexInputRate;
pub const struct_SDL_GPUVertexBufferDescription = extern struct {
    slot: Uint32 = 0,
    pitch: Uint32 = 0,
    input_rate: SDL_GPUVertexInputRate = @import("std").mem.zeroes(SDL_GPUVertexInputRate),
    instance_step_rate: Uint32 = 0,
};
pub const SDL_GPUVertexBufferDescription = struct_SDL_GPUVertexBufferDescription;
pub const SDL_GPU_VERTEXELEMENTFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_VERTEXELEMENTFORMAT_HALF4: c_int = 30;
pub const enum_SDL_GPUVertexElementFormat = c_uint;
pub const SDL_GPUVertexElementFormat = enum_SDL_GPUVertexElementFormat;
pub const struct_SDL_GPUVertexAttribute = extern struct {
    location: Uint32 = 0,
    buffer_slot: Uint32 = 0,
    format: SDL_GPUVertexElementFormat = @import("std").mem.zeroes(SDL_GPUVertexElementFormat),
    offset: Uint32 = 0,
};
pub const SDL_GPUVertexAttribute = struct_SDL_GPUVertexAttribute;
pub const struct_SDL_GPUVertexInputState = extern struct {
    vertex_buffer_descriptions: [*c]const SDL_GPUVertexBufferDescription = null,
    num_vertex_buffers: Uint32 = 0,
    vertex_attributes: [*c]const SDL_GPUVertexAttribute = null,
    num_vertex_attributes: Uint32 = 0,
};
pub const SDL_GPUVertexInputState = struct_SDL_GPUVertexInputState;
pub const SDL_GPU_PRIMITIVETYPE_TRIANGLELIST: c_int = 0;
pub const enum_SDL_GPUPrimitiveType = c_uint;
pub const SDL_GPUPrimitiveType = enum_SDL_GPUPrimitiveType;
pub const enum_SDL_GPUFillMode = c_uint;
pub const SDL_GPUFillMode = enum_SDL_GPUFillMode;
pub const enum_SDL_GPUCullMode = c_uint;
pub const SDL_GPUCullMode = enum_SDL_GPUCullMode;
pub const enum_SDL_GPUFrontFace = c_uint;
pub const SDL_GPUFrontFace = enum_SDL_GPUFrontFace;
pub const struct_SDL_GPURasterizerState = extern struct {
    fill_mode: SDL_GPUFillMode = @import("std").mem.zeroes(SDL_GPUFillMode),
    cull_mode: SDL_GPUCullMode = @import("std").mem.zeroes(SDL_GPUCullMode),
    front_face: SDL_GPUFrontFace = @import("std").mem.zeroes(SDL_GPUFrontFace),
    depth_bias_constant_factor: f32 = 0,
    depth_bias_clamp: f32 = 0,
    depth_bias_slope_factor: f32 = 0,
    enable_depth_bias: bool = false,
    enable_depth_clip: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPURasterizerState = struct_SDL_GPURasterizerState;
pub const SDL_GPU_SAMPLECOUNT_1: c_int = 0;
pub const enum_SDL_GPUSampleCount = c_uint;
pub const SDL_GPUSampleCount = enum_SDL_GPUSampleCount;
pub const struct_SDL_GPUMultisampleState = extern struct {
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    sample_mask: Uint32 = 0,
    enable_mask: bool = false,
    enable_alpha_to_coverage: bool = false,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUMultisampleState = struct_SDL_GPUMultisampleState;
pub const SDL_GPU_COMPAREOP_INVALID: c_int = 0;
pub const SDL_GPU_COMPAREOP_ALWAYS: c_int = 8;
pub const enum_SDL_GPUCompareOp = c_uint;
pub const SDL_GPUCompareOp = enum_SDL_GPUCompareOp;
pub const SDL_GPU_STENCILOP_INVALID: c_int = 0;
pub const SDL_GPU_STENCILOP_DECREMENT_AND_WRAP: c_int = 8;
pub const enum_SDL_GPUStencilOp = c_uint;
pub const SDL_GPUStencilOp = enum_SDL_GPUStencilOp;
pub const struct_SDL_GPUStencilOpState = extern struct {
    fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    pass_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    depth_fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
};
pub const SDL_GPUStencilOpState = struct_SDL_GPUStencilOpState;
pub const struct_SDL_GPUDepthStencilState = extern struct {
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
    back_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    front_stencil_state: SDL_GPUStencilOpState = @import("std").mem.zeroes(SDL_GPUStencilOpState),
    compare_mask: Uint8 = 0,
    write_mask: Uint8 = 0,
    enable_depth_test: bool = false,
    enable_depth_write: bool = false,
    enable_stencil_test: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUDepthStencilState = struct_SDL_GPUDepthStencilState;
pub const SDL_GPU_TEXTUREFORMAT_INVALID: c_int = 0;
pub const SDL_GPU_TEXTUREFORMAT_A8_UNORM: c_int = 1;
pub const SDL_GPU_TEXTUREFORMAT_R8_UNORM: c_int = 2;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_UNORM: c_int = 3;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM: c_int = 4;
pub const SDL_GPU_TEXTUREFORMAT_R16_UNORM: c_int = 5;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_UNORM: c_int = 6;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM: c_int = 7;
pub const SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM: c_int = 8;
pub const SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM: c_int = 9;
pub const SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM: c_int = 10;
pub const SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM: c_int = 11;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM: c_int = 12;
pub const SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM: c_int = 13;
pub const SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM: c_int = 14;
pub const SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM: c_int = 15;
pub const SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM: c_int = 16;
pub const SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM: c_int = 17;
pub const SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM: c_int = 18;
pub const SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT: c_int = 19;
pub const SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT: c_int = 20;
pub const SDL_GPU_TEXTUREFORMAT_R8_SNORM: c_int = 21;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_SNORM: c_int = 22;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM: c_int = 23;
pub const SDL_GPU_TEXTUREFORMAT_R16_SNORM: c_int = 24;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_SNORM: c_int = 25;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM: c_int = 26;
pub const SDL_GPU_TEXTUREFORMAT_R16_FLOAT: c_int = 27;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT: c_int = 28;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT: c_int = 29;
pub const SDL_GPU_TEXTUREFORMAT_R32_FLOAT: c_int = 30;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT: c_int = 31;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT: c_int = 32;
pub const SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT: c_int = 33;
pub const SDL_GPU_TEXTUREFORMAT_R8_UINT: c_int = 34;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_UINT: c_int = 35;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT: c_int = 36;
pub const SDL_GPU_TEXTUREFORMAT_R16_UINT: c_int = 37;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_UINT: c_int = 38;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT: c_int = 39;
pub const SDL_GPU_TEXTUREFORMAT_R32_UINT: c_int = 40;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_UINT: c_int = 41;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT: c_int = 42;
pub const SDL_GPU_TEXTUREFORMAT_R8_INT: c_int = 43;
pub const SDL_GPU_TEXTUREFORMAT_R8G8_INT: c_int = 44;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT: c_int = 45;
pub const SDL_GPU_TEXTUREFORMAT_R16_INT: c_int = 46;
pub const SDL_GPU_TEXTUREFORMAT_R16G16_INT: c_int = 47;
pub const SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT: c_int = 48;
pub const SDL_GPU_TEXTUREFORMAT_R32_INT: c_int = 49;
pub const SDL_GPU_TEXTUREFORMAT_R32G32_INT: c_int = 50;
pub const SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT: c_int = 51;
pub const SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB: c_int = 52;
pub const SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB: c_int = 53;
pub const SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB: c_int = 54;
pub const SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB: c_int = 55;
pub const SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB: c_int = 56;
pub const SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB: c_int = 57;
pub const SDL_GPU_TEXTUREFORMAT_D16_UNORM: c_int = 58;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM: c_int = 59;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT: c_int = 60;
pub const SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT: c_int = 61;
pub const SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT: c_int = 62;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM: c_int = 63;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM: c_int = 64;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM: c_int = 65;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM: c_int = 66;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM: c_int = 67;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM: c_int = 68;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM: c_int = 69;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM: c_int = 70;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM: c_int = 71;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM: c_int = 72;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM: c_int = 73;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM: c_int = 74;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM: c_int = 75;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM: c_int = 76;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB: c_int = 77;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB: c_int = 78;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB: c_int = 79;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB: c_int = 80;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB: c_int = 81;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB: c_int = 82;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB: c_int = 83;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB: c_int = 84;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB: c_int = 85;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB: c_int = 86;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB: c_int = 87;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB: c_int = 88;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB: c_int = 89;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB: c_int = 90;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT: c_int = 91;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT: c_int = 92;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT: c_int = 93;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT: c_int = 94;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT: c_int = 95;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT: c_int = 96;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT: c_int = 97;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT: c_int = 98;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT: c_int = 99;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT: c_int = 100;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT: c_int = 101;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT: c_int = 102;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT: c_int = 103;
pub const SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT: c_int = 104;
pub const enum_SDL_GPUTextureFormat = c_uint;
pub const SDL_GPUTextureFormat = enum_SDL_GPUTextureFormat;
pub const SDL_GPU_BLENDFACTOR_INVALID: c_int = 0;
pub const SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE: c_int = 13;
pub const enum_SDL_GPUBlendFactor = c_uint;
pub const SDL_GPUBlendFactor = enum_SDL_GPUBlendFactor;
pub const SDL_GPU_BLENDOP_INVALID: c_int = 0;
pub const SDL_GPU_BLENDOP_MAX: c_int = 5;
pub const enum_SDL_GPUBlendOp = c_uint;
pub const SDL_GPUBlendOp = enum_SDL_GPUBlendOp;
pub const SDL_GPUColorComponentFlags = Uint8;
pub const struct_SDL_GPUColorTargetBlendState = extern struct {
    src_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_color_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    color_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    src_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    dst_alpha_blendfactor: SDL_GPUBlendFactor = @import("std").mem.zeroes(SDL_GPUBlendFactor),
    alpha_blend_op: SDL_GPUBlendOp = @import("std").mem.zeroes(SDL_GPUBlendOp),
    color_write_mask: SDL_GPUColorComponentFlags = 0,
    enable_blend: bool = false,
    enable_color_write_mask: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GPUColorTargetBlendState = struct_SDL_GPUColorTargetBlendState;
pub const struct_SDL_GPUColorTargetDescription = extern struct {
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    blend_state: SDL_GPUColorTargetBlendState = @import("std").mem.zeroes(SDL_GPUColorTargetBlendState),
};
pub const SDL_GPUColorTargetDescription = struct_SDL_GPUColorTargetDescription;
pub const struct_SDL_GPUGraphicsPipelineTargetInfo = extern struct {
    color_target_descriptions: [*c]const SDL_GPUColorTargetDescription = null,
    num_color_targets: Uint32 = 0,
    depth_stencil_format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    has_depth_stencil_target: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUGraphicsPipelineTargetInfo = struct_SDL_GPUGraphicsPipelineTargetInfo;
pub const struct_SDL_GPUGraphicsPipelineCreateInfo = extern struct {
    vertex_shader: ?*SDL_GPUShader = null,
    fragment_shader: ?*SDL_GPUShader = null,
    vertex_input_state: SDL_GPUVertexInputState = @import("std").mem.zeroes(SDL_GPUVertexInputState),
    primitive_type: SDL_GPUPrimitiveType = @import("std").mem.zeroes(SDL_GPUPrimitiveType),
    rasterizer_state: SDL_GPURasterizerState = @import("std").mem.zeroes(SDL_GPURasterizerState),
    multisample_state: SDL_GPUMultisampleState = @import("std").mem.zeroes(SDL_GPUMultisampleState),
    depth_stencil_state: SDL_GPUDepthStencilState = @import("std").mem.zeroes(SDL_GPUDepthStencilState),
    target_info: SDL_GPUGraphicsPipelineTargetInfo = @import("std").mem.zeroes(SDL_GPUGraphicsPipelineTargetInfo),
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUGraphicsPipelineCreateInfo = struct_SDL_GPUGraphicsPipelineCreateInfo;
pub const struct_SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = struct_SDL_GPUGraphicsPipeline;
pub const SDL_GPU_FILTER_NEAREST: c_int = 0;
pub const enum_SDL_GPUFilter = c_uint;
pub const SDL_GPUFilter = enum_SDL_GPUFilter;
pub const enum_SDL_GPUSamplerMipmapMode = c_uint;
pub const SDL_GPUSamplerMipmapMode = enum_SDL_GPUSamplerMipmapMode;
pub const enum_SDL_GPUSamplerAddressMode = c_uint;
pub const SDL_GPUSamplerAddressMode = enum_SDL_GPUSamplerAddressMode;
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
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const enum_SDL_GPUShaderStage = c_uint;
pub const SDL_GPUShaderStage = enum_SDL_GPUShaderStage;
pub const struct_SDL_GPUShaderCreateInfo = extern struct {
    code_size: usize = 0,
    code: [*c]const Uint8 = null,
    entrypoint: [*c]const u8 = null,
    format: SDL_GPUShaderFormat = 0,
    stage: SDL_GPUShaderStage = @import("std").mem.zeroes(SDL_GPUShaderStage),
    num_samplers: Uint32 = 0,
    num_storage_textures: Uint32 = 0,
    num_storage_buffers: Uint32 = 0,
    num_uniform_buffers: Uint32 = 0,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPUShaderCreateInfo = struct_SDL_GPUShaderCreateInfo;
pub const SDL_GPU_TEXTURETYPE_2D: c_int = 0;
pub const SDL_GPU_TEXTURETYPE_2D_ARRAY: c_int = 1;
pub const SDL_GPU_TEXTURETYPE_3D: c_int = 2;
pub const SDL_GPU_TEXTURETYPE_CUBE: c_int = 3;
pub const SDL_GPU_TEXTURETYPE_CUBE_ARRAY: c_int = 4;
pub const enum_SDL_GPUTextureType = c_uint;
pub const SDL_GPUTextureType = enum_SDL_GPUTextureType;
pub const SDL_GPUTextureUsageFlags = Uint32;
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
pub const SDL_GPUBufferUsageFlags = Uint32;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD: c_int = 0;
pub const SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD: c_int = 1;
pub const enum_SDL_GPUTransferBufferUsage = c_uint;
pub const SDL_GPUTransferBufferUsage = enum_SDL_GPUTransferBufferUsage;
pub const struct_SDL_GPUTransferBuffer = opaque {};
pub const SDL_GPUTransferBuffer = struct_SDL_GPUTransferBuffer;
pub const XrSession = Uint64;
pub const struct_SDL_GPUCommandBuffer = opaque {
};
pub const SDL_GPUCommandBuffer = struct_SDL_GPUCommandBuffer;
pub const SDL_GPU_LOADOP_LOAD: c_int = 0;
pub const enum_SDL_GPULoadOp = c_uint;
pub const SDL_GPULoadOp = enum_SDL_GPULoadOp;
pub const SDL_GPU_STOREOP_STORE: c_int = 0;
pub const SDL_GPU_STOREOP_RESOLVE: c_int = 2;
pub const SDL_GPU_STOREOP_RESOLVE_AND_STORE: c_int = 3;
pub const enum_SDL_GPUStoreOp = c_uint;
pub const SDL_GPUStoreOp = enum_SDL_GPUStoreOp;
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
pub const struct_SDL_GPUViewport = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
    min_depth: f32 = 0,
    max_depth: f32 = 0,
};
pub const SDL_GPUViewport = struct_SDL_GPUViewport;
pub const struct_SDL_GPUBufferBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUBufferBinding = struct_SDL_GPUBufferBinding;
pub const enum_SDL_GPUIndexElementSize = c_uint;
pub const SDL_GPUIndexElementSize = enum_SDL_GPUIndexElementSize;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    sampler: ?*SDL_GPUSampler = null,
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub const struct_SDL_GPUStorageTextureReadWriteBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUStorageTextureReadWriteBinding = struct_SDL_GPUStorageTextureReadWriteBinding;
pub const struct_SDL_GPUStorageBufferReadWriteBinding = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    cycle: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUStorageBufferReadWriteBinding = struct_SDL_GPUStorageBufferReadWriteBinding;
pub const struct_SDL_GPUTextureTransferInfo = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
    pixels_per_row: Uint32 = 0,
    rows_per_layer: Uint32 = 0,
};
pub const SDL_GPUTextureTransferInfo = struct_SDL_GPUTextureTransferInfo;
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
pub const struct_SDL_GPUTransferBufferLocation = extern struct {
    transfer_buffer: ?*SDL_GPUTransferBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUTransferBufferLocation = struct_SDL_GPUTransferBufferLocation;
pub const struct_SDL_GPUBufferRegion = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
    size: Uint32 = 0,
};
pub const SDL_GPUBufferRegion = struct_SDL_GPUBufferRegion;
pub const struct_SDL_GPUTextureLocation = extern struct {
    texture: ?*SDL_GPUTexture = null,
    mip_level: Uint32 = 0,
    layer: Uint32 = 0,
    x: Uint32 = 0,
    y: Uint32 = 0,
    z: Uint32 = 0,
};
pub const SDL_GPUTextureLocation = struct_SDL_GPUTextureLocation;
pub const struct_SDL_GPUBufferLocation = extern struct {
    buffer: ?*SDL_GPUBuffer = null,
    offset: Uint32 = 0,
};
pub const SDL_GPUBufferLocation = struct_SDL_GPUBufferLocation;
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
pub const SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084: c_int = 3;
pub const enum_SDL_GPUSwapchainComposition = c_uint;
pub const SDL_GPUSwapchainComposition = enum_SDL_GPUSwapchainComposition;
pub const SDL_GPU_PRESENTMODE_MAILBOX: c_int = 2;
pub const enum_SDL_GPUPresentMode = c_uint;
pub const SDL_GPUPresentMode = enum_SDL_GPUPresentMode;
pub const struct_SDL_GPUFence = opaque {};
pub const SDL_GPUFence = struct_SDL_GPUFence;
pub const struct_SDL_GPUDevice = extern struct {
    DestroyDevice: ?*const fn (device: [*c]SDL_GPUDevice) callconv(.c) void = null,
    DestroyXRSwapchain: ?*const fn (device: ?*SDL_GPURenderer, swapchain: XrSwapchain, swapchainImages: [*c]?*SDL_GPUTexture) callconv(.c) XrResult = null,
    GetDeviceProperties: ?*const fn (device: [*c]SDL_GPUDevice) callconv(.c) SDL_PropertiesID = null,
    CreateComputePipeline: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) callconv(.c) ?*SDL_GPUComputePipeline = null,
    CreateGraphicsPipeline: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) callconv(.c) ?*SDL_GPUGraphicsPipeline = null,
    CreateSampler: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUSamplerCreateInfo) callconv(.c) ?*SDL_GPUSampler = null,
    CreateShader: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUShaderCreateInfo) callconv(.c) ?*SDL_GPUShader = null,
    CreateTexture: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const SDL_GPUTextureCreateInfo) callconv(.c) ?*SDL_GPUTexture = null,
    CreateBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, usageFlags: SDL_GPUBufferUsageFlags, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUBuffer = null,
    CreateTransferBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, usage: SDL_GPUTransferBufferUsage, size: Uint32, debugName: [*c]const u8) callconv(.c) ?*SDL_GPUTransferBuffer = null,
    CreateXRSession: ?*const fn (driverData: ?*SDL_GPURenderer, createinfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) callconv(.c) XrResult = null,
    GetXRSwapchainFormats: ?*const fn (driverData: ?*SDL_GPURenderer, session: XrSession, num_formats: [*c]c_int) callconv(.c) [*c]SDL_GPUTextureFormat = null,
    CreateXRSwapchain: ?*const fn (driverData: ?*SDL_GPURenderer, session: XrSession, createinfo: [*c]const XrSwapchainCreateInfo, format: SDL_GPUTextureFormat, swapchain: [*c]XrSwapchain, textures: [*c][*c]?*SDL_GPUTexture) callconv(.c) XrResult = null,
    SetBufferName: ?*const fn (driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer, text: [*c]const u8) callconv(.c) void = null,
    SetTextureName: ?*const fn (driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture, text: [*c]const u8) callconv(.c) void = null,
    InsertDebugLabel: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, text: [*c]const u8) callconv(.c) void = null,
    PushDebugGroup: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, name: [*c]const u8) callconv(.c) void = null,
    PopDebugGroup: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    ReleaseTexture: ?*const fn (driverData: ?*SDL_GPURenderer, texture: ?*SDL_GPUTexture) callconv(.c) void = null,
    ReleaseSampler: ?*const fn (driverData: ?*SDL_GPURenderer, sampler: ?*SDL_GPUSampler) callconv(.c) void = null,
    ReleaseBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, buffer: ?*SDL_GPUBuffer) callconv(.c) void = null,
    ReleaseTransferBuffer: ?*const fn (driverData: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void = null,
    ReleaseShader: ?*const fn (driverData: ?*SDL_GPURenderer, shader: ?*SDL_GPUShader) callconv(.c) void = null,
    ReleaseComputePipeline: ?*const fn (driverData: ?*SDL_GPURenderer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void = null,
    ReleaseGraphicsPipeline: ?*const fn (driverData: ?*SDL_GPURenderer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void = null,
    BeginRenderPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, colorTargetInfos: [*c]const SDL_GPUColorTargetInfo, numColorTargets: Uint32, depthStencilTargetInfo: [*c]const SDL_GPUDepthStencilTargetInfo) callconv(.c) void = null,
    BindGraphicsPipeline: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, graphicsPipeline: ?*SDL_GPUGraphicsPipeline) callconv(.c) void = null,
    SetViewport: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, viewport: [*c]const SDL_GPUViewport) callconv(.c) void = null,
    SetScissor: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, scissor: [*c]const SDL_Rect) callconv(.c) void = null,
    SetBlendConstants: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, blendConstants: SDL_FColor) callconv(.c) void = null,
    SetStencilReference: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, reference: Uint8) callconv(.c) void = null,
    BindVertexBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, bindings: [*c]const SDL_GPUBufferBinding, numBindings: Uint32) callconv(.c) void = null,
    BindIndexBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, binding: [*c]const SDL_GPUBufferBinding, indexElementSize: SDL_GPUIndexElementSize) callconv(.c) void = null,
    BindVertexSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindVertexStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindVertexStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindFragmentStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    PushVertexUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    PushFragmentUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    DrawIndexedPrimitives: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, numIndices: Uint32, numInstances: Uint32, firstIndex: Uint32, vertexOffset: Sint32, firstInstance: Uint32) callconv(.c) void = null,
    DrawPrimitives: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, numVertices: Uint32, numInstances: Uint32, firstVertex: Uint32, firstInstance: Uint32) callconv(.c) void = null,
    DrawPrimitivesIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void = null,
    DrawIndexedPrimitivesIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32, drawCount: Uint32) callconv(.c) void = null,
    EndRenderPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    BeginComputePass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, storageTextureBindings: [*c]const SDL_GPUStorageTextureReadWriteBinding, numStorageTextureBindings: Uint32, storageBufferBindings: [*c]const SDL_GPUStorageBufferReadWriteBinding, numStorageBufferBindings: Uint32) callconv(.c) void = null,
    BindComputePipeline: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, computePipeline: ?*SDL_GPUComputePipeline) callconv(.c) void = null,
    BindComputeSamplers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, textureSamplerBindings: [*c]const SDL_GPUTextureSamplerBinding, numBindings: Uint32) callconv(.c) void = null,
    BindComputeStorageTextures: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageTextures: [*c]const ?*SDL_GPUTexture, numBindings: Uint32) callconv(.c) void = null,
    BindComputeStorageBuffers: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, firstSlot: Uint32, storageBuffers: [*c]const ?*SDL_GPUBuffer, numBindings: Uint32) callconv(.c) void = null,
    PushComputeUniformData: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, slotIndex: Uint32, data: ?*const anyopaque, length: Uint32) callconv(.c) void = null,
    DispatchCompute: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, groupcountX: Uint32, groupcountY: Uint32, groupcountZ: Uint32) callconv(.c) void = null,
    DispatchComputeIndirect: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, buffer: ?*SDL_GPUBuffer, offset: Uint32) callconv(.c) void = null,
    EndComputePass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    MapTransferBuffer: ?*const fn (device: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer, cycle: bool) callconv(.c) ?*anyopaque = null,
    UnmapTransferBuffer: ?*const fn (device: ?*SDL_GPURenderer, transferBuffer: ?*SDL_GPUTransferBuffer) callconv(.c) void = null,
    BeginCopyPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    UploadToTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) callconv(.c) void = null,
    UploadToBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) callconv(.c) void = null,
    CopyTextureToTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureLocation, destination: [*c]const SDL_GPUTextureLocation, w: Uint32, h: Uint32, d: Uint32, cycle: bool) callconv(.c) void = null,
    CopyBufferToBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferLocation, destination: [*c]const SDL_GPUBufferLocation, size: Uint32, cycle: bool) callconv(.c) void = null,
    GenerateMipmaps: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) callconv(.c) void = null,
    DownloadFromTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) callconv(.c) void = null,
    DownloadFromBuffer: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, source: [*c]const SDL_GPUBufferRegion, destination: [*c]const SDL_GPUTransferBufferLocation) callconv(.c) void = null,
    EndCopyPass: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) void = null,
    Blit: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) callconv(.c) void = null,
    SupportsSwapchainComposition: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition) callconv(.c) bool = null,
    SupportsPresentMode: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, presentMode: SDL_GPUPresentMode) callconv(.c) bool = null,
    ClaimWindow: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool = null,
    ReleaseWindow: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) void = null,
    SetSwapchainParameters: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window, swapchainComposition: SDL_GPUSwapchainComposition, presentMode: SDL_GPUPresentMode) callconv(.c) bool = null,
    SetAllowedFramesInFlight: ?*const fn (driverData: ?*SDL_GPURenderer, allowedFramesInFlight: Uint32) callconv(.c) bool = null,
    GetSwapchainTextureFormat: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) SDL_GPUTextureFormat = null,
    AcquireCommandBuffer: ?*const fn (driverData: ?*SDL_GPURenderer) callconv(.c) ?*SDL_GPUCommandBuffer = null,
    AcquireSwapchainTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchainTexture: [*c]?*SDL_GPUTexture, swapchainTextureWidth: [*c]Uint32, swapchainTextureHeight: [*c]Uint32) callconv(.c) bool = null,
    WaitForSwapchain: ?*const fn (driverData: ?*SDL_GPURenderer, window: [*c]SDL_Window) callconv(.c) bool = null,
    WaitAndAcquireSwapchainTexture: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchainTexture: [*c]?*SDL_GPUTexture, swapchainTextureWidth: [*c]Uint32, swapchainTextureHeight: [*c]Uint32) callconv(.c) bool = null,
    Submit: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool = null,
    SubmitAndAcquireFence: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) ?*SDL_GPUFence = null,
    Cancel: ?*const fn (commandBuffer: ?*SDL_GPUCommandBuffer) callconv(.c) bool = null,
    Wait: ?*const fn (driverData: ?*SDL_GPURenderer) callconv(.c) bool = null,
    WaitForFences: ?*const fn (driverData: ?*SDL_GPURenderer, waitAll: bool, fences: [*c]const ?*SDL_GPUFence, numFences: Uint32) callconv(.c) bool = null,
    QueryFence: ?*const fn (driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) bool = null,
    ReleaseFence: ?*const fn (driverData: ?*SDL_GPURenderer, fence: ?*SDL_GPUFence) callconv(.c) void = null,
    SupportsTextureFormat: ?*const fn (driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, @"type": SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) callconv(.c) bool = null,
    SupportsSampleCount: ?*const fn (driverData: ?*SDL_GPURenderer, format: SDL_GPUTextureFormat, desiredSampleCount: SDL_GPUSampleCount) callconv(.c) bool = null,
    driverData: ?*SDL_GPURenderer = null,
    backend: [*c]const u8 = null,
    shader_formats: SDL_GPUShaderFormat = 0,
    debug_mode: bool = false,
    default_enable_depth_clip: bool = false,
    validate_feature_depth_clamp_disabled: bool = false,
    validate_feature_anisotropy_disabled: bool = false,
    max_viewport_width: Uint32 = 0,
    max_viewport_height: Uint32 = 0,
};
pub const struct_SDL_GPURenderPass = opaque {
};
pub const SDL_GPURenderPass = struct_SDL_GPURenderPass;
pub const struct_SDL_GPUComputePass = opaque {
};
pub const SDL_GPUComputePass = struct_SDL_GPUComputePass;
pub const struct_SDL_GPUCopyPass = opaque {
};
pub const SDL_GPUCopyPass = struct_SDL_GPUCopyPass;
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
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = 0,
    buttonID: c_int = 0,
    text: [*c]const u8 = null,
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = 0,
    window: [*c]SDL_Window = null,
    title: [*c]const u8 = null,
    message: [*c]const u8 = null,
    numbuttons: c_int = 0,
    buttons: [*c]const SDL_MessageBoxButtonData = null,
    colorScheme: [*c]const SDL_MessageBoxColorScheme = null,
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub const SDL_MetalView = ?*anyopaque;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const struct_VkAllocationCallbacks = opaque {};
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
pub const SDL_VideoDisplay = struct_SDL_VideoDisplay;
const struct_unnamed_14 = extern struct {
    red_size: c_int = 0,
    green_size: c_int = 0,
    blue_size: c_int = 0,
    alpha_size: c_int = 0,
    depth_size: c_int = 0,
    buffer_size: c_int = 0,
    stencil_size: c_int = 0,
    double_buffer: c_int = 0,
    accum_red_size: c_int = 0,
    accum_green_size: c_int = 0,
    accum_blue_size: c_int = 0,
    accum_alpha_size: c_int = 0,
    stereo: c_int = 0,
    multisamplebuffers: c_int = 0,
    multisamplesamples: c_int = 0,
    floatbuffers: c_int = 0,
    accelerated: c_int = 0,
    major_version: c_int = 0,
    minor_version: c_int = 0,
    flags: c_int = 0,
    profile_mask: c_int = 0,
    share_with_current_context: c_int = 0,
    release_behavior: c_int = 0,
    reset_notification: c_int = 0,
    framebuffer_srgb_capable: c_int = 0,
    no_error: c_int = 0,
    retained_backing: c_int = 0,
    egl_platform: c_int = 0,
    driver_loaded: c_int = 0,
    HAS_GL_ARB_color_buffer_float: c_int = 0,
    driver_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    dll_handle: ?*SDL_SharedObject = null,
};
const struct_unnamed_15 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_VideoData = opaque {};
pub const SDL_VideoData = struct_SDL_VideoData;
pub const struct_SDL_GLDriverData_16 = opaque {};
pub const struct_SDL_EGL_VideoData_17 = opaque {};
pub const struct_SDL_PrivateGLESData_18 = opaque {};
pub const struct_SDL_VideoDevice = extern struct {
    name: [*c]const u8 = null,
    VideoInit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    VideoQuit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    ResetTouch: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    RefreshDisplays: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GetDisplayBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayUsableBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayModes: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) callconv(.c) bool = null,
    SetDisplayMode: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) callconv(.c) bool = null,
    CreateSDLWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool = null,
    SetWindowTitle: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowIcon: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) callconv(.c) bool = null,
    SetWindowPosition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMinimumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMaximumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowAspectRatio: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    GetWindowBordersSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) callconv(.c) bool = null,
    GetWindowContentScale: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) f32 = null,
    GetWindowSizeInPixels: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) callconv(.c) void = null,
    SetWindowOpacity: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) callconv(.c) bool = null,
    SetWindowParent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowModal: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) callconv(.c) bool = null,
    ShowWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    HideWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RaiseWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MaximizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MinimizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RestoreWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowBordered: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) callconv(.c) void = null,
    SetWindowResizable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, resizable: bool) callconv(.c) void = null,
    SetWindowAlwaysOnTop: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, on_top: bool) callconv(.c) void = null,
    SetWindowFullscreen: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) callconv(.c) SDL_FullscreenResult = null,
    GetWindowICCProfile: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    GetDisplayForWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_DisplayID = null,
    SetWindowMouseRect: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowMouseGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    SetWindowKeyboardGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    DestroyWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    CreateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, format: [*c]SDL_PixelFormat, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool = null,
    SetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: c_int) callconv(.c) bool = null,
    GetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: [*c]c_int) callconv(.c) bool = null,
    UpdateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) callconv(.c) bool = null,
    DestroyWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    OnWindowEnter: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    UpdateWindowShape: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, shape: [*c]SDL_Surface) callconv(.c) bool = null,
    FlashWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) callconv(.c) bool = null,
    ApplyWindowProgress: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowFocusable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) callconv(.c) bool = null,
    SetWindowFillDocument: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, fill: bool) callconv(.c) bool = null,
    SyncWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ReconfigureWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) bool = null,
    GL_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    GL_GetProcAddress: ?*const fn (_this: [*c]SDL_VideoDevice, proc: [*c]const u8) callconv(.c) SDL_FunctionPointer = null,
    GL_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GL_CreateContext: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_GLContext = null,
    GL_MakeCurrent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) callconv(.c) bool = null,
    GL_GetEGLSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_EGLSurface = null,
    GL_SetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: c_int) callconv(.c) bool = null,
    GL_GetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: [*c]c_int) callconv(.c) bool = null,
    GL_SwapWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    GL_DestroyContext: ?*const fn (_this: [*c]SDL_VideoDevice, context: SDL_GLContext) callconv(.c) bool = null,
    GL_SetDefaultProfileConfig: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    Vulkan_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_GetInstanceExtensions: ?*const fn (_this: [*c]SDL_VideoDevice, count: [*c]Uint32) callconv(.c) [*c]const [*c]const u8 = null,
    Vulkan_CreateSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) callconv(.c) bool = null,
    Vulkan_DestroySurface: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) callconv(.c) void = null,
    Vulkan_GetPresentationSupport: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) callconv(.c) bool = null,
    Metal_CreateView: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_MetalView = null,
    Metal_DestroyView: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) void = null,
    Metal_GetLayer: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) ?*anyopaque = null,
    WaitEventTimeout: ?*const fn (_this: [*c]SDL_VideoDevice, timeoutNS: Sint64) callconv(.c) c_int = null,
    SendWakeupEvent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    PumpEvents: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    SuspendScreenSaver: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    StartTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) bool = null,
    StopTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    UpdateTextInputArea: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ClearComposition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    HasScreenKeyboardSupport: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    HideScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetTextInputProperties: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    GetTextMimeTypes: ?*const fn (_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) callconv(.c) [*c]const [*c]const u8 = null,
    SetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    GetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    HasClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8) callconv(.c) bool = null,
    SetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    SetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowMessageBox: ?*const fn (_this: [*c]SDL_VideoDevice, messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) callconv(.c) bool = null,
    SetWindowHitTest: ?*const fn (window: [*c]SDL_Window, enabled: bool) callconv(.c) bool = null,
    AcceptDragAndDrop: ?*const fn (window: [*c]SDL_Window, accept: bool) callconv(.c) void = null,
    ShowWindowSystemMenu: ?*const fn (window: [*c]SDL_Window, x: c_int, y: c_int) callconv(.c) void = null,
    thread: SDL_ThreadID = 0,
    checked_texture_framebuffer: bool = false,
    suspend_screensaver: bool = false,
    wakeup_window: ?*anyopaque = null,
    num_displays: c_int = 0,
    displays: [*c][*c]SDL_VideoDisplay = null,
    desktop_bounds: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    windows: [*c]SDL_Window = null,
    grabbed_window: [*c]SDL_Window = null,
    clipboard_sequence: Uint32 = 0,
    clipboard_callback: SDL_ClipboardDataCallback = null,
    clipboard_cleanup: SDL_ClipboardCleanupCallback = null,
    clipboard_userdata: ?*anyopaque = null,
    clipboard_mime_types: [*c][*c]u8 = null,
    num_clipboard_mime_types: usize = 0,
    primary_selection_text: [*c]u8 = null,
    setting_display_mode: bool = false,
    device_caps: Uint32 = 0,
    system_theme: SDL_SystemTheme = @import("std").mem.zeroes(SDL_SystemTheme),
    screen_keyboard_shown: bool = false,
    is_quitting: bool = false,
    gl_config: struct_unnamed_14 = @import("std").mem.zeroes(struct_unnamed_14),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_15 = @import("std").mem.zeroes(struct_unnamed_15),
    internal: ?*SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_16 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_17 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_18 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const struct_SDL_DisplayData = opaque {};
pub const SDL_DisplayData = struct_SDL_DisplayData;
pub const struct_SDL_VideoDisplay = extern struct {
    id: SDL_DisplayID = 0,
    name: [*c]u8 = null,
    max_fullscreen_modes: c_int = 0,
    num_fullscreen_modes: c_int = 0,
    fullscreen_modes: [*c]SDL_DisplayMode = null,
    desktop_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_mode: [*c]const SDL_DisplayMode = null,
    natural_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    current_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    content_scale: f32 = 0,
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    fullscreen_active: bool = false,
    fullscreen_window: [*c]SDL_Window = null,
    device: [*c]SDL_VideoDevice = null,
    props: SDL_PropertiesID = 0,
    internal: ?*SDL_DisplayData = null,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub const enum_XrStructureType = c_uint;
pub const XrStructureType = enum_XrStructureType;
pub const XrSessionCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
};
pub const XrSwapchainCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
};
pub const struct_Pass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
};
pub const Pass = struct_Pass;
pub const struct_ComputePass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
    compute_pipeline: ?*SDL_GPUComputePipeline = null,
    sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    read_only_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_only_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_write_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    read_write_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
};
pub const ComputePass = struct_ComputePass;
pub const struct_RenderPass = extern struct {
    command_buffer: ?*SDL_GPUCommandBuffer = null,
    in_progress: bool = false,
    color_targets: [8]?*SDL_GPUTexture = @import("std").mem.zeroes([8]?*SDL_GPUTexture),
    num_color_targets: Uint32 = 0,
    depth_stencil_target: ?*SDL_GPUTexture = null,
    graphics_pipeline: ?*SDL_GPUGraphicsPipeline = null,
    vertex_sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    vertex_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    vertex_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    fragment_sampler_bound: [16]bool = @import("std").mem.zeroes([16]bool),
    fragment_storage_texture_bound: [8]bool = @import("std").mem.zeroes([8]bool),
    fragment_storage_buffer_bound: [8]bool = @import("std").mem.zeroes([8]bool),
};
pub const RenderPass = struct_RenderPass;
pub const struct_CommandBufferCommonHeader = extern struct {
    device: [*c]SDL_GPUDevice = null,
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    compute_pass: ComputePass = @import("std").mem.zeroes(ComputePass),
    copy_pass: Pass = @import("std").mem.zeroes(Pass),
    swapchain_texture_acquired: bool = false,
    submitted: bool = false,
    ignore_render_pass_texture_validation: bool = false,
};
pub const CommandBufferCommonHeader = struct_CommandBufferCommonHeader;
pub const struct_TextureCommonHeader = extern struct {
    info: SDL_GPUTextureCreateInfo = @import("std").mem.zeroes(SDL_GPUTextureCreateInfo),
};
pub const TextureCommonHeader = struct_TextureCommonHeader;
pub const struct_GraphicsPipelineCommonHeader = extern struct {
    num_vertex_samplers: Uint32 = 0,
    num_vertex_storage_textures: Uint32 = 0,
    num_vertex_storage_buffers: Uint32 = 0,
    num_vertex_uniform_buffers: Uint32 = 0,
    num_fragment_samplers: Uint32 = 0,
    num_fragment_storage_textures: Uint32 = 0,
    num_fragment_storage_buffers: Uint32 = 0,
    num_fragment_uniform_buffers: Uint32 = 0,
};
pub const GraphicsPipelineCommonHeader = struct_GraphicsPipelineCommonHeader;
pub const struct_ComputePipelineCommonHeader = extern struct {
    numSamplers: Uint32 = 0,
    numReadonlyStorageTextures: Uint32 = 0,
    numReadonlyStorageBuffers: Uint32 = 0,
    numReadWriteStorageTextures: Uint32 = 0,
    numReadWriteStorageBuffers: Uint32 = 0,
    numUniformBuffers: Uint32 = 0,
};
pub const ComputePipelineCommonHeader = struct_ComputePipelineCommonHeader;
pub const struct_BlitFragmentUniforms = extern struct {
    left: f32 = 0,
    top: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,
    mip_level: Uint32 = 0,
    layer_or_depth: f32 = 0,
};
pub const BlitFragmentUniforms = struct_BlitFragmentUniforms;
pub const struct_BlitPipelineCacheEntry = extern struct {
    type: SDL_GPUTextureType = @import("std").mem.zeroes(SDL_GPUTextureType),
    format: SDL_GPUTextureFormat = @import("std").mem.zeroes(SDL_GPUTextureFormat),
    pipeline: ?*SDL_GPUGraphicsPipeline = null,
};
pub const BlitPipelineCacheEntry = struct_BlitPipelineCacheEntry;
pub fn Texture_GetBlockWidth(format: SDL_GPUTextureFormat) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "Texture_GetBlockWidth".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unrecognized TextureFormat!\"",
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
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UNORM) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UNORM) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UNORM) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UNORM) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_A8_UNORM) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_SNORM) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_SNORM) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_SNORM) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_SNORM) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_FLOAT) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_FLOAT) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UINT) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UINT) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UINT) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UINT) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_UINT) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_UINT) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_INT) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_INT) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_INT) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_INT) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_INT) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_INT) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D16_UNORM) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
                        sdl_pc = 105;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                return 12;
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
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                return 10;
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
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                return 8;
            },
            29 => {
                {
                    sdl_pc = 30;
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
                return 6;
            },
            35 => {
                {
                    sdl_pc = 36;
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
                    sdl_pc = 38;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                return 5;
            },
            41 => {
                {
                    sdl_pc = 42;
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
                    sdl_pc = 44;
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
                    sdl_pc = 46;
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
                {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 51;
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
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
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
                return 4;
            },
            56 => {
                {
                    sdl_pc = 57;
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
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
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
                    sdl_pc = 62;
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
                {
                    sdl_pc = 64;
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
                {
                    sdl_pc = 66;
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
                    sdl_pc = 68;
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
                    sdl_pc = 70;
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
                {
                    sdl_pc = 72;
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
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
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
                    sdl_pc = 77;
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
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
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
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
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
                    sdl_pc = 85;
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
                    sdl_pc = 87;
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
                {
                    sdl_pc = 89;
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
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
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
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
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
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
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
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
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
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                return 1;
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                return 0;
            },
            110 => {
                if (!!(@intFromPtr("Unrecognized TextureFormat!") != 0)) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysgpu.h", 273);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            114 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Texture_GetBlockHeight(format: SDL_GPUTextureFormat) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "Texture_GetBlockHeight".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unrecognized TextureFormat!\"",
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
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UNORM) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UNORM) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UNORM) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UNORM) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_A8_UNORM) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_SNORM) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_SNORM) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_SNORM) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_SNORM) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_FLOAT) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_FLOAT) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UINT) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UINT) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UINT) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UINT) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_UINT) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_UINT) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_INT) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_INT) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_INT) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_INT) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_INT) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_INT) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D16_UNORM) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
                        sdl_pc = 105;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
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
                return 12;
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
                return 10;
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
                {
                    sdl_pc = 14;
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
                return 8;
            },
            17 => {
                {
                    sdl_pc = 18;
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
                    sdl_pc = 20;
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
                {
                    sdl_pc = 23;
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
                return 6;
            },
            26 => {
                {
                    sdl_pc = 27;
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
                    sdl_pc = 29;
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
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
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
                return 5;
            },
            38 => {
                {
                    sdl_pc = 39;
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
                {
                    sdl_pc = 41;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
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
                    sdl_pc = 46;
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
                {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 51;
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
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
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
                return 4;
            },
            56 => {
                {
                    sdl_pc = 57;
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
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
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
                    sdl_pc = 62;
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
                {
                    sdl_pc = 64;
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
                {
                    sdl_pc = 66;
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
                    sdl_pc = 68;
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
                    sdl_pc = 70;
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
                {
                    sdl_pc = 72;
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
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
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
                    sdl_pc = 77;
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
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
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
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
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
                    sdl_pc = 85;
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
                    sdl_pc = 87;
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
                {
                    sdl_pc = 89;
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
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
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
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
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
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
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
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
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
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                return 1;
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                return 0;
            },
            110 => {
                if (!!(@intFromPtr("Unrecognized TextureFormat!") != 0)) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysgpu.h", 394);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            114 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn IsDepthFormat(format: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D16_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
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
                return @"true" != 0;
            },
            7 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn IsIntegerFormat(format: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UINT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UINT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UINT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UINT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_INT) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_INT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_INT) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_INT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
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
                return @"true" != 0;
            },
            14 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn FormatHasAlpha(format: SDL_GPUTextureFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_A8_UNORM) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB) => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 71;
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
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 19;
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
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 28;
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
                {
                    sdl_pc = 30;
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
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
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
                    sdl_pc = 38;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                return @"true" != 0;
            },
            44 => {
                {
                    sdl_pc = 45;
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
                {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 51;
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
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
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
                    sdl_pc = 56;
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
                    sdl_pc = 58;
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
                {
                    sdl_pc = 60;
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
                    sdl_pc = 62;
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
                {
                    sdl_pc = 64;
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
                {
                    sdl_pc = 66;
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
                    sdl_pc = 68;
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
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                return @"true" != 0;
            },
            71 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub const struct_SDL_GPUBootstrap = extern struct {
    name: [*c]const u8 = null,
    PrepareDriver: ?*const fn (_this: [*c]SDL_VideoDevice, props: SDL_PropertiesID) callconv(.c) bool = null,
    CreateDevice: ?*const fn (debug_mode: bool, prefer_low_power: bool, props: SDL_PropertiesID) callconv(.c) [*c]SDL_GPUDevice = null,
};
pub const SDL_GPUBootstrap = struct_SDL_GPUBootstrap;
pub extern var VulkanDriver: SDL_GPUBootstrap;
pub var TextureFormatIsComputeWritable: [105]bool = [105]bool{
    @"false" != 0,
    @"false" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"true" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
    @"false" != 0,
};
pub var backends: [2][*c]const SDL_GPUBootstrap = [2][*c]const SDL_GPUBootstrap{
    &VulkanDriver,
    null,
};
pub export fn SDL_GPU_FetchBlitPipeline(device: [*c]SDL_GPUDevice, source_texture_type: SDL_GPUTextureType, destination_format: SDL_GPUTextureFormat, blit_vertex_shader: ?*SDL_GPUShader, blit_from_2d_shader: ?*SDL_GPUShader, blit_from_2d_array_shader: ?*SDL_GPUShader, blit_from_3d_shader: ?*SDL_GPUShader, blit_from_cube_shader: ?*SDL_GPUShader, blit_from_cube_array_shader: ?*SDL_GPUShader, blit_pipelines: [*c][*c]BlitPipelineCacheEntry, blit_pipeline_count: [*c]Uint32, blit_pipeline_capacity: [*c]Uint32) ?*SDL_GPUGraphicsPipeline {
    @setEvalBranchQuota(100000);
    var blit_pipeline_create_info: SDL_GPUGraphicsPipelineCreateInfo = undefined;
    _ = &blit_pipeline_create_info;
    var color_target_desc: SDL_GPUColorTargetDescription = undefined;
    _ = &color_target_desc;
    var pipeline: ?*SDL_GPUGraphicsPipeline = undefined;
    _ = &pipeline;
    if (@as(?*anyopaque, @ptrCast(@alignCast(blit_pipeline_count))) == @as(?*anyopaque, null)) {
        return blit_pipelines.*[source_texture_type].pipeline;
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < blit_pipeline_count.*) : (i +%= 1) {
            if ((blit_pipelines.*[i].type == source_texture_type) and (blit_pipelines.*[i].format == destination_format)) {
                return blit_pipelines.*[i].pipeline;
            }
        }
    }
    _ = memset(@ptrCast(@alignCast(&blit_pipeline_create_info)), 0, @sizeOf(@TypeOf(blit_pipeline_create_info)));
    _ = memset(@ptrCast(@alignCast(&color_target_desc)), 0, @sizeOf(@TypeOf(color_target_desc)));
    color_target_desc.blend_state.color_write_mask = 15;
    color_target_desc.format = destination_format;
    blit_pipeline_create_info.target_info.color_target_descriptions = &color_target_desc;
    blit_pipeline_create_info.target_info.num_color_targets = 1;
    blit_pipeline_create_info.target_info.depth_stencil_format = SDL_GPU_TEXTUREFORMAT_D16_UNORM;
    blit_pipeline_create_info.target_info.has_depth_stencil_target = @"false" != 0;
    blit_pipeline_create_info.vertex_shader = blit_vertex_shader;
    if (source_texture_type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE)) {
        blit_pipeline_create_info.fragment_shader = blit_from_cube_shader;
    } else if (source_texture_type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE_ARRAY)) {
        blit_pipeline_create_info.fragment_shader = blit_from_cube_array_shader;
    } else if (source_texture_type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_2D_ARRAY)) {
        blit_pipeline_create_info.fragment_shader = blit_from_2d_array_shader;
    } else if (source_texture_type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
        blit_pipeline_create_info.fragment_shader = blit_from_3d_shader;
    } else {
        blit_pipeline_create_info.fragment_shader = blit_from_2d_shader;
    }
    blit_pipeline_create_info.rasterizer_state.enable_depth_clip = device.*.default_enable_depth_clip;
    blit_pipeline_create_info.multisample_state.sample_count = SDL_GPU_SAMPLECOUNT_1;
    blit_pipeline_create_info.multisample_state.enable_mask = @"false" != 0;
    blit_pipeline_create_info.primitive_type = SDL_GPU_PRIMITIVETYPE_TRIANGLELIST;
    pipeline = SDL_CreateGPUGraphicsPipeline_REAL(device, &blit_pipeline_create_info);
    if (@as(?*anyopaque, @ptrCast(@alignCast(pipeline))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Failed to create GPU pipeline for blit");
        return null;
    }
    while (true) {
        if ((blit_pipeline_count.* +% @as(Uint32, 1)) >= blit_pipeline_capacity.*) {
            blit_pipeline_capacity.* = blit_pipeline_capacity.* *% @as(Uint32, 2);
            blit_pipelines.* = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(blit_pipelines.*)), @sizeOf(BlitPipelineCacheEntry) *% @as(c_ulong, blit_pipeline_capacity.*))));
        }
        if (!false) break;
    }
    blit_pipelines.*[blit_pipeline_count.*].pipeline = pipeline;
    blit_pipelines.*[blit_pipeline_count.*].type = source_texture_type;
    blit_pipelines.*[blit_pipeline_count.*].format = destination_format;
    blit_pipeline_count.* +%= 1;
    return pipeline;
}
pub export fn SDL_GPU_BlitCommon(command_buffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo, blit_linear_sampler: ?*SDL_GPUSampler, blit_nearest_sampler: ?*SDL_GPUSampler, blit_vertex_shader: ?*SDL_GPUShader, blit_from_2d_shader: ?*SDL_GPUShader, blit_from_2d_array_shader: ?*SDL_GPUShader, blit_from_3d_shader: ?*SDL_GPUShader, blit_from_cube_shader: ?*SDL_GPUShader, blit_from_cube_array_shader: ?*SDL_GPUShader, blit_pipelines: [*c][*c]BlitPipelineCacheEntry, blit_pipeline_count: [*c]Uint32, blit_pipeline_capacity: [*c]Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_GPU_BlitCommon".*;
    };
    _ = &static_local___func__;
    var cmdbufHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &cmdbufHeader;
    var render_pass: ?*SDL_GPURenderPass = undefined;
    _ = &render_pass;
    var src_header: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.source.texture));
    _ = &src_header;
    var dst_header: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.destination.texture));
    _ = &dst_header;
    var blit_pipeline: ?*SDL_GPUGraphicsPipeline = undefined;
    _ = &blit_pipeline;
    var color_target_info: SDL_GPUColorTargetInfo = undefined;
    _ = &color_target_info;
    var viewport: SDL_GPUViewport = undefined;
    _ = &viewport;
    var texture_sampler_binding: SDL_GPUTextureSamplerBinding = undefined;
    _ = &texture_sampler_binding;
    var blit_fragment_uniforms: BlitFragmentUniforms = undefined;
    _ = &blit_fragment_uniforms;
    var layer_divisor: Uint32 = undefined;
    _ = &layer_divisor;
    blit_pipeline = SDL_GPU_FetchBlitPipeline(cmdbufHeader.*.device, src_header.*.info.type, dst_header.*.info.format, blit_vertex_shader, blit_from_2d_shader, blit_from_2d_array_shader, blit_from_3d_shader, blit_from_cube_shader, blit_from_cube_array_shader, blit_pipelines, blit_pipeline_count, blit_pipeline_capacity);
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(blit_pipeline))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "blit_pipeline != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 463);
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
    color_target_info.load_op = info.*.load_op;
    color_target_info.clear_color = info.*.clear_color;
    color_target_info.store_op = SDL_GPU_STOREOP_STORE;
    color_target_info.texture = info.*.destination.texture;
    color_target_info.mip_level = info.*.destination.mip_level;
    color_target_info.layer_or_depth_plane = info.*.destination.layer_or_depth_plane;
    color_target_info.cycle = info.*.cycle;
    render_pass = SDL_BeginGPURenderPass_REAL(command_buffer, &color_target_info, 1, null);
    viewport.x = @floatFromInt(info.*.destination.x);
    viewport.y = @floatFromInt(info.*.destination.y);
    viewport.w = @floatFromInt(info.*.destination.w);
    viewport.h = @floatFromInt(info.*.destination.h);
    viewport.min_depth = @floatFromInt(@as(c_int, 0));
    viewport.max_depth = @floatFromInt(@as(c_int, 1));
    SDL_SetGPUViewport_REAL(render_pass, &viewport);
    SDL_BindGPUGraphicsPipeline_REAL(render_pass, blit_pipeline);
    texture_sampler_binding.texture = info.*.source.texture;
    texture_sampler_binding.sampler = if (info.*.filter == @as(SDL_GPUFilter, SDL_GPU_FILTER_NEAREST)) blit_nearest_sampler else blit_linear_sampler;
    SDL_BindGPUFragmentSamplers_REAL(render_pass, 0, &texture_sampler_binding, 1);
    blit_fragment_uniforms.left = @as(f32, @floatFromInt(info.*.source.x)) / @as(f32, @floatFromInt(src_header.*.info.width >> @intCast(info.*.source.mip_level)));
    blit_fragment_uniforms.top = @as(f32, @floatFromInt(info.*.source.y)) / @as(f32, @floatFromInt(src_header.*.info.height >> @intCast(info.*.source.mip_level)));
    blit_fragment_uniforms.width = @as(f32, @floatFromInt(info.*.source.w)) / @as(f32, @floatFromInt(src_header.*.info.width >> @intCast(info.*.source.mip_level)));
    blit_fragment_uniforms.height = @as(f32, @floatFromInt(info.*.source.h)) / @as(f32, @floatFromInt(src_header.*.info.height >> @intCast(info.*.source.mip_level)));
    blit_fragment_uniforms.mip_level = info.*.source.mip_level;
    layer_divisor = if (src_header.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) src_header.*.info.layer_count_or_depth else @as(Uint32, 1);
    blit_fragment_uniforms.layer_or_depth = @as(f32, @floatFromInt(info.*.source.layer_or_depth_plane)) / @as(f32, @floatFromInt(layer_divisor));
    if ((info.*.flip_mode & @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL)) != 0) {
        blit_fragment_uniforms.left += blit_fragment_uniforms.width;
        blit_fragment_uniforms.width *= @floatFromInt(-@as(c_int, 1));
    }
    if ((info.*.flip_mode & @as(SDL_FlipMode, SDL_FLIP_VERTICAL)) != 0) {
        blit_fragment_uniforms.top += blit_fragment_uniforms.height;
        blit_fragment_uniforms.height *= @floatFromInt(-@as(c_int, 1));
    }
    SDL_PushGPUFragmentUniformData_REAL(command_buffer, 0, @ptrCast(@alignCast(&blit_fragment_uniforms)), @truncate(@sizeOf(@TypeOf(blit_fragment_uniforms))));
    SDL_DrawGPUPrimitives_REAL(render_pass, 3, 1, 0, 0);
    SDL_EndGPURenderPass_REAL(render_pass);
}
pub fn SDL_GPU_CheckGraphicsBindings(render_pass: ?*SDL_GPURenderPass) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_GPU_CheckGraphicsBindings".*;
    };
    _ = &static_local___func__;
    var rp: [*c]RenderPass = @ptrCast(@alignCast(render_pass));
    _ = &rp;
    var pipeline: [*c]GraphicsPipelineCommonHeader = @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline));
    _ = &pipeline;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_vertex_samplers) : (i +%= 1) {
            if (!rp.*.vertex_sampler_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing vertex sampler binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing vertex sampler binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 540);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_vertex_storage_textures) : (i +%= 1) {
            if (!rp.*.vertex_storage_texture_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing vertex storage texture binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing vertex storage texture binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 545);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_vertex_storage_buffers) : (i +%= 1) {
            if (!rp.*.vertex_storage_buffer_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing vertex storage buffer binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing vertex storage buffer binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 550);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_fragment_samplers) : (i +%= 1) {
            if (!rp.*.fragment_sampler_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing fragment sampler binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing fragment sampler binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 555);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_fragment_storage_textures) : (i +%= 1) {
            if (!rp.*.fragment_storage_texture_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing fragment storage texture binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing fragment storage texture binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 560);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.num_fragment_storage_buffers) : (i +%= 1) {
            if (!rp.*.fragment_storage_buffer_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing fragment storage buffer binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing fragment storage buffer binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 565);
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
            }
        }
    }
}
pub fn SDL_GPU_CheckComputeBindings(compute_pass: ?*SDL_GPUComputePass) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "SDL_GPU_CheckComputeBindings".*;
    };
    _ = &static_local___func__;
    var cp: [*c]ComputePass = @ptrCast(@alignCast(compute_pass));
    _ = &cp;
    var pipeline: [*c]ComputePipelineCommonHeader = @ptrCast(@alignCast(@as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.compute_pipeline));
    _ = &pipeline;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.numSamplers) : (i +%= 1) {
            if (!cp.*.sampler_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing compute sampler binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing compute sampler binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 576);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.numReadonlyStorageTextures) : (i +%= 1) {
            if (!cp.*.read_only_storage_texture_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing compute readonly storage texture binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing compute readonly storage texture binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 581);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.numReadonlyStorageBuffers) : (i +%= 1) {
            if (!cp.*.read_only_storage_buffer_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing compute readonly storage buffer binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing compute readonly storage buffer binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 586);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.numReadWriteStorageTextures) : (i +%= 1) {
            if (!cp.*.read_write_storage_texture_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing compute read-write storage texture binding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing compute read-write storage texture binding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 591);
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
            }
        }
    }
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < pipeline.*.numReadWriteStorageBuffers) : (i +%= 1) {
            if (!cp.*.read_write_storage_buffer_bound[i]) {
                while (true) {
                    while (!!(@intFromPtr("Missing compute read-write storage buffer bbinding!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Missing compute read-write storage buffer bbinding!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 596);
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
            }
        }
    }
}
pub fn SDL_GPUSelectBackend(props: SDL_PropertiesID) callconv(.c) [*c]const SDL_GPUBootstrap {
    @setEvalBranchQuota(100000);
    var i: Uint32 = undefined;
    _ = &i;
    var gpudriver: [*c]const u8 = undefined;
    _ = &gpudriver;
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (@as(?*anyopaque, @ptrCast(@alignCast(_this))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Video subsystem not initialized");
        return null;
    }
    gpudriver = SDL_GetHint_REAL("SDL_GPU_DRIVER");
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(gpudriver)))) == @as(?*anyopaque, null)) {
        gpudriver = SDL_GetStringProperty_REAL(props, "SDL.gpu.device.create.name", null);
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(gpudriver)))) != @as(?*anyopaque, null)) {
        {
            i = 0;
            while (backends[i] != null) : (i +%= 1) {
                if (SDL_strcasecmp_REAL(gpudriver, backends[i].*.name) == @as(c_int, 0)) {
                    if (backends[i].*.PrepareDriver.?(_this, props)) {
                        return backends[i];
                    }
                }
            }
        }
        _ = SDL_SetError_REAL("SDL_HINT_GPU_DRIVER %s unsupported!", gpudriver);
        return null;
    }
    {
        i = 0;
        while (backends[i] != null) : (i +%= 1) {
            if (backends[i].*.PrepareDriver.?(_this, props)) {
                return backends[i];
            }
        }
    }
    _ = SDL_SetError_REAL("No supported SDL_GPU backend found!");
    return null;
}
pub fn SDL_GPU_FillProperties(props: SDL_PropertiesID, format_flags: SDL_GPUShaderFormat, debug_mode: bool, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.private", @"true" != 0);
    }
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.spirv", @"true" != 0);
    }
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.dxbc", @"true" != 0);
    }
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.dxil", @"true" != 0);
    }
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.msl", @"true" != 0);
    }
    if ((format_flags & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) {
        _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.shaders.metallib", @"true" != 0);
    }
    _ = SDL_SetBooleanProperty_REAL(props, "SDL.gpu.device.create.debugmode", debug_mode);
    _ = SDL_SetStringProperty_REAL(props, "SDL.gpu.device.create.name", name);
}
pub export fn SDL_GPUSupportsShaderFormats_REAL(format_flags: SDL_GPUShaderFormat, name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    SDL_GPU_FillProperties(props, format_flags, @"false" != 0, name);
    result = SDL_GPUSupportsProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return result;
}
pub export fn SDL_GPUSupportsProperties_REAL(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    return @as(?*anyopaque, @ptrCast(@alignCast(@constCast(SDL_GPUSelectBackend(props))))) != @as(?*anyopaque, null);
}
pub export fn SDL_CreateGPUDevice_REAL(format_flags: SDL_GPUShaderFormat, debug_mode: bool, name: [*c]const u8) [*c]SDL_GPUDevice {
    @setEvalBranchQuota(100000);
    var result: [*c]SDL_GPUDevice = undefined;
    _ = &result;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    SDL_GPU_FillProperties(props, format_flags, debug_mode, name);
    result = SDL_CreateGPUDeviceWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return result;
}
pub export fn SDL_CreateGPUDeviceWithProperties_REAL(props: SDL_PropertiesID) [*c]SDL_GPUDevice {
    @setEvalBranchQuota(100000);
    var debug_mode: bool = undefined;
    _ = &debug_mode;
    var preferLowPower: bool = undefined;
    _ = &preferLowPower;
    var result: [*c]SDL_GPUDevice = null;
    _ = &result;
    var selectedBackend: [*c]const SDL_GPUBootstrap = undefined;
    _ = &selectedBackend;
    selectedBackend = SDL_GPUSelectBackend(props);
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(selectedBackend)))) != @as(?*anyopaque, null)) {
        SDL_DebugLogBackend("gpu", selectedBackend.*.name);
        debug_mode = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.debugmode", @"true" != 0);
        preferLowPower = SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.preferlowpower", @"false" != 0);
        result = selectedBackend.*.CreateDevice.?(debug_mode, preferLowPower, props);
        if (@as(?*anyopaque, @ptrCast(@alignCast(result))) != @as(?*anyopaque, null)) {
            result.*.backend = selectedBackend.*.name;
            result.*.debug_mode = debug_mode;
            if (SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.depth_clamping", @"true" != 0)) {
                result.*.default_enable_depth_clip = @"false" != 0;
            } else {
                result.*.default_enable_depth_clip = @"true" != 0;
                result.*.validate_feature_depth_clamp_disabled = @"true" != 0;
            }
            if (!SDL_GetBooleanProperty_REAL(props, "SDL.gpu.device.create.feature.anisotropy", @"true" != 0)) {
                result.*.validate_feature_anisotropy_disabled = @"true" != 0;
            }
            if (result.*.debug_mode) {
                result.*.max_viewport_width = @as(c_uint, 4294967295);
                result.*.max_viewport_height = @as(c_uint, 4294967295);
            }
        }
    }
    return result;
}
pub export fn SDL_DestroyGPUDevice_REAL(device: [*c]SDL_GPUDevice) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.DestroyDevice.?(device);
}
pub export fn SDL_DestroyGPUXRSwapchain_REAL(device: [*c]SDL_GPUDevice, swapchain: XrSwapchain, swapchainImages: [*c]?*SDL_GPUTexture) XrResult {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return XR_ERROR_HANDLE_INVALID;
    }
    return device.*.DestroyXRSwapchain.?(device.*.driverData, swapchain, swapchainImages);
}
pub export fn SDL_GetNumGPUDrivers_REAL() c_int {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(backends)) / @sizeOf(@TypeOf(backends[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
}
pub export fn SDL_GetGPUDriver_REAL(arg_index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var index_1 = arg_index_1;
    _ = &index_1;
    if ((index_1 < @as(c_int, 0)) or (index_1 >= SDL_GetNumGPUDrivers_REAL())) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("index"))));
        return null;
    }
    return backends[@bitCast(@as(isize, @intCast(index_1)))].*.name;
}
pub export fn SDL_GetGPUDeviceDriver_REAL(device: [*c]SDL_GPUDevice) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    return device.*.backend;
}
pub export fn SDL_GetGPUShaderFormats_REAL(device: [*c]SDL_GPUDevice) SDL_GPUShaderFormat {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return SDL_GPU_SHADERFORMAT_INVALID;
    }
    return device.*.shader_formats;
}
pub export fn SDL_GetGPUDeviceProperties_REAL(device: [*c]SDL_GPUDevice) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return 0;
    }
    return device.*.GetDeviceProperties.?(device);
}
pub export fn SDL_GPUTextureFormatTexelBlockSize_REAL(format: SDL_GPUTextureFormat) Uint32 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [39:0]u8 = "SDL_GPUTextureFormatTexelBlockSize_REAL".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unrecognized TextureFormat!\"",
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
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UNORM) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_SNORM) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_A8_UNORM) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_UINT) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8_INT) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_FLOAT) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_SNORM) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UNORM) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_UINT) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8_INT) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UNORM) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_SNORM) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_UINT) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16_INT) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D16_UNORM) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_FLOAT) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UINT) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_INT) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_UNORM) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16_SNORM) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_UINT) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32_INT) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_UINT) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32_INT) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT) => {
                        sdl_pc = 105;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
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
                return 8;
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
                {
                    sdl_pc = 11;
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
                return 16;
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
                return 1;
            },
            19 => {
                {
                    sdl_pc = 20;
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
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 26;
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
                {
                    sdl_pc = 28;
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
                {
                    sdl_pc = 30;
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
                return 2;
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
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
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
                    sdl_pc = 38;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
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
                    sdl_pc = 46;
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
                {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                return 4;
            },
            52 => {
                return 5;
            },
            53 => {
                {
                    sdl_pc = 54;
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
                    sdl_pc = 56;
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
                    sdl_pc = 58;
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
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                return 8;
            },
            61 => {
                {
                    sdl_pc = 62;
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
                return 16;
            },
            64 => {
                {
                    sdl_pc = 65;
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
                    sdl_pc = 67;
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
                    sdl_pc = 69;
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
                {
                    sdl_pc = 71;
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
                    sdl_pc = 73;
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
                {
                    sdl_pc = 75;
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
                    sdl_pc = 77;
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
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
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
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
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
                    sdl_pc = 85;
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
                    sdl_pc = 87;
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
                {
                    sdl_pc = 89;
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
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
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
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
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
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
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
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
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
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                return 16;
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                return 0;
            },
            110 => {
                if (!!(@intFromPtr("Unrecognized TextureFormat!") != 0)) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 936);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            114 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GPUTextureSupportsFormat_REAL(device: [*c]SDL_GPUDevice, arg_format: SDL_GPUTextureFormat, arg_type: SDL_GPUTextureType, usage: SDL_GPUTextureUsageFlags) bool {
    @setEvalBranchQuota(100000);
    var format = arg_format;
    _ = &format;
    var @"type" = arg_type;
    _ = &@"type";
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_GPUTextureSupportsFormat_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (device.*.debug_mode) {
        if ((format <= @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) or (format >= @as(SDL_GPUTextureFormat, @bitCast(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid texture format enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid texture format enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 950);
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
            return @"false" != 0;
        }
    }
    if (((usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) or ((usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0)) {
        if (!TextureFormatIsComputeWritable[format]) {
            return @"false" != 0;
        }
    }
    return device.*.SupportsTextureFormat.?(device.*.driverData, format, @"type", usage);
}
pub export fn SDL_GPUTextureSupportsSampleCount_REAL(device: [*c]SDL_GPUDevice, arg_format: SDL_GPUTextureFormat, sample_count: SDL_GPUSampleCount) bool {
    @setEvalBranchQuota(100000);
    var format = arg_format;
    _ = &format;
    const static_local___func__ = struct {
        const __func__: [38:0]u8 = "SDL_GPUTextureSupportsSampleCount_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @as(c_int, 0) != 0;
    }
    if (device.*.debug_mode) {
        if ((format <= @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) or (format >= @as(SDL_GPUTextureFormat, @bitCast(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid texture format enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid texture format enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 975);
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
            return @as(c_int, 0) != 0;
        }
    }
    return device.*.SupportsSampleCount.?(device.*.driverData, format, sample_count);
}
pub export fn SDL_CreateGPUComputePipeline_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUComputePipelineCreateInfo) ?*SDL_GPUComputePipeline {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_CreateGPUComputePipeline_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if (createinfo.*.format == @as(SDL_GPUShaderFormat, SDL_GPU_SHADERFORMAT_INVALID)) {
            while (true) {
                while (!!(@intFromPtr("Shader format cannot be INVALID!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader format cannot be INVALID!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 999);
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
            return null;
        }
        if (!((createinfo.*.format & device.*.shader_formats) != 0)) {
            while (true) {
                while (!!(@intFromPtr("Incompatible shader format for GPU backend") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Incompatible shader format for GPU backend\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1003);
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
            return null;
        }
        if (createinfo.*.num_readwrite_storage_textures > @as(Uint32, MAX_COMPUTE_WRITE_TEXTURES)) {
            comptime {
                if (!(MAX_COMPUTE_WRITE_TEXTURES == @as(c_int, 8))) @compileError("static assertion failed \"MAX_COMPUTE_WRITE_TEXTURES == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline write-only texture count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline write-only texture count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1008);
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
            return null;
        }
        if (createinfo.*.num_readwrite_storage_buffers > @as(Uint32, MAX_COMPUTE_WRITE_BUFFERS)) {
            comptime {
                if (!(MAX_COMPUTE_WRITE_BUFFERS == @as(c_int, 8))) @compileError("static assertion failed \"MAX_COMPUTE_WRITE_BUFFERS == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline write-only buffer count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline write-only buffer count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1013);
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
            return null;
        }
        if (createinfo.*.num_samplers > @as(Uint32, MAX_TEXTURE_SAMPLERS_PER_STAGE)) {
            comptime {
                if (!(MAX_TEXTURE_SAMPLERS_PER_STAGE == @as(c_int, 16))) @compileError("static assertion failed \"MAX_TEXTURE_SAMPLERS_PER_STAGE == 16\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline sampler count cannot be higher than 16!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline sampler count cannot be higher than 16!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1018);
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
            return null;
        }
        if (createinfo.*.num_readonly_storage_textures > @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) {
            comptime {
                if (!(MAX_STORAGE_TEXTURES_PER_STAGE == @as(c_int, 8))) @compileError("static assertion failed \"MAX_STORAGE_TEXTURES_PER_STAGE == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline readonly storage texture count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline readonly storage texture count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1023);
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
            return null;
        }
        if (createinfo.*.num_readonly_storage_buffers > @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) {
            comptime {
                if (!(MAX_STORAGE_BUFFERS_PER_STAGE == @as(c_int, 8))) @compileError("static assertion failed \"MAX_STORAGE_BUFFERS_PER_STAGE == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline readonly storage buffer count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline readonly storage buffer count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1028);
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
            return null;
        }
        if (createinfo.*.num_uniform_buffers > @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) {
            comptime {
                if (!(MAX_UNIFORM_BUFFERS_PER_STAGE == @as(c_int, 4))) @compileError("static assertion failed \"MAX_UNIFORM_BUFFERS_PER_STAGE == 4\"");
            }
            while (true) {
                while (!!(@intFromPtr("Compute pipeline uniform buffer count cannot be higher than 4!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline uniform buffer count cannot be higher than 4!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1033);
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
            return null;
        }
        if (((createinfo.*.threadcount_x == @as(Uint32, 0)) or (createinfo.*.threadcount_y == @as(Uint32, 0))) or (createinfo.*.threadcount_z == @as(Uint32, 0))) {
            while (true) {
                while (!!(@intFromPtr("Compute pipeline threadCount dimensions must be at least 1!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline threadCount dimensions must be at least 1!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1039);
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
            return null;
        }
    }
    return device.*.CreateComputePipeline.?(device.*.driverData, createinfo);
}
pub export fn SDL_CreateGPUGraphicsPipeline_REAL(device: [*c]SDL_GPUDevice, graphicsPipelineCreateInfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) ?*SDL_GPUGraphicsPipeline {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_CreateGPUGraphicsPipeline_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(graphicsPipelineCreateInfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("graphicsPipelineCreateInfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(graphicsPipelineCreateInfo.*.vertex_shader))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Vertex shader cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Vertex shader cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1062);
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
            return null;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(graphicsPipelineCreateInfo.*.fragment_shader))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Fragment shader cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Fragment shader cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1066);
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
            return null;
        }
        if ((graphicsPipelineCreateInfo.*.target_info.num_color_targets > @as(Uint32, 0)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(graphicsPipelineCreateInfo.*.target_info.color_target_descriptions)))) == @as(?*anyopaque, null))) {
            while (true) {
                while (!!(@intFromPtr("Color target descriptions array pointer cannot be NULL if num_color_targets is greater than zero!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Color target descriptions array pointer cannot be NULL if num_color_targets is greater than zero!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1070);
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
            return null;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < graphicsPipelineCreateInfo.*.target_info.num_color_targets) : (i +%= 1) {
                if ((graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].format <= @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) or (graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].format >= @as(SDL_GPUTextureFormat, @bitCast(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1))))) {
                    while (true) {
                        while (!!(@intFromPtr("Invalid texture format enum!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Invalid texture format enum!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1074);
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
                    return null;
                }
                if (IsDepthFormat(graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].format)) {
                    while (true) {
                        while (!!(@intFromPtr("Color target formats cannot be a depth format!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Color target formats cannot be a depth format!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1076);
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
                    return null;
                }
                if (!SDL_GPUTextureSupportsFormat_REAL(device, graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].format, SDL_GPU_TEXTURETYPE_2D, @as(c_uint, 1) << @intCast(@as(c_uint, 1)))) {
                    while (true) {
                        while (!!(@intFromPtr("Format is not supported for color targets on this device!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Format is not supported for color targets on this device!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1080);
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
                    return null;
                }
                if (graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].blend_state.enable_blend) {
                    var blend_state: [*c]const SDL_GPUColorTargetBlendState = &graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[i].blend_state;
                    _ = &blend_state;
                    if ((blend_state.*.src_color_blendfactor <= @as(SDL_GPUBlendFactor, SDL_GPU_BLENDFACTOR_INVALID)) or (blend_state.*.src_color_blendfactor >= @as(SDL_GPUBlendFactor, @bitCast(SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend factor enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend factor enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1085);
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
                        return null;
                    }
                    if ((blend_state.*.dst_color_blendfactor <= @as(SDL_GPUBlendFactor, SDL_GPU_BLENDFACTOR_INVALID)) or (blend_state.*.dst_color_blendfactor >= @as(SDL_GPUBlendFactor, @bitCast(SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend factor enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend factor enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1086);
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
                        return null;
                    }
                    if ((blend_state.*.color_blend_op <= @as(SDL_GPUBlendOp, SDL_GPU_BLENDOP_INVALID)) or (blend_state.*.color_blend_op >= @as(SDL_GPUBlendOp, @bitCast(SDL_GPU_BLENDOP_MAX + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend op enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend op enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1087);
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
                        return null;
                    }
                    if ((blend_state.*.src_alpha_blendfactor <= @as(SDL_GPUBlendFactor, SDL_GPU_BLENDFACTOR_INVALID)) or (blend_state.*.src_alpha_blendfactor >= @as(SDL_GPUBlendFactor, @bitCast(SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend factor enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend factor enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1088);
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
                        return null;
                    }
                    if ((blend_state.*.dst_alpha_blendfactor <= @as(SDL_GPUBlendFactor, SDL_GPU_BLENDFACTOR_INVALID)) or (blend_state.*.dst_alpha_blendfactor >= @as(SDL_GPUBlendFactor, @bitCast(SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend factor enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend factor enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1089);
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
                        return null;
                    }
                    if ((blend_state.*.alpha_blend_op <= @as(SDL_GPUBlendOp, SDL_GPU_BLENDOP_INVALID)) or (blend_state.*.alpha_blend_op >= @as(SDL_GPUBlendOp, @bitCast(SDL_GPU_BLENDOP_MAX + @as(c_int, 1))))) {
                        while (true) {
                            while (!!(@intFromPtr("Invalid blend op enum!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Invalid blend op enum!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1090);
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
                        return null;
                    }
                }
            }
        }
        if (graphicsPipelineCreateInfo.*.target_info.has_depth_stencil_target) {
            if ((graphicsPipelineCreateInfo.*.target_info.depth_stencil_format <= @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) or (graphicsPipelineCreateInfo.*.target_info.depth_stencil_format >= @as(SDL_GPUTextureFormat, @bitCast(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid texture format enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid texture format enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1096);
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
                return null;
            }
            if (!IsDepthFormat(graphicsPipelineCreateInfo.*.target_info.depth_stencil_format)) {
                while (true) {
                    while (!!(@intFromPtr("Depth-stencil target format must be a depth format!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Depth-stencil target format must be a depth format!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1098);
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
                return null;
            }
            if (!SDL_GPUTextureSupportsFormat_REAL(device, graphicsPipelineCreateInfo.*.target_info.depth_stencil_format, SDL_GPU_TEXTURETYPE_2D, @as(c_uint, 1) << @intCast(@as(c_uint, 2)))) {
                while (true) {
                    while (!!(@intFromPtr("Format is not supported for depth targets on this device!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Format is not supported for depth targets on this device!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1102);
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
                return null;
            }
        }
        if (graphicsPipelineCreateInfo.*.multisample_state.enable_alpha_to_coverage) {
            if (graphicsPipelineCreateInfo.*.target_info.num_color_targets < @as(Uint32, 1)) {
                while (true) {
                    while (!!(@intFromPtr("Alpha-to-coverage enabled but no color targets present!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Alpha-to-coverage enabled but no color targets present!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1108);
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
                return null;
            }
            if (!FormatHasAlpha(graphicsPipelineCreateInfo.*.target_info.color_target_descriptions[@as(c_int, 0)].format)) {
                while (true) {
                    while (!!(@intFromPtr("Format is not compatible with alpha-to-coverage!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Format is not compatible with alpha-to-coverage!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1112);
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
                return null;
            }
        }
        if ((graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_buffers > @as(Uint32, 0)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(graphicsPipelineCreateInfo.*.vertex_input_state.vertex_buffer_descriptions)))) == @as(?*anyopaque, null))) {
            while (true) {
                while (!!(@intFromPtr("Vertex buffer descriptions array pointer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Vertex buffer descriptions array pointer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1119);
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
            return null;
        }
        if (graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_buffers > @as(Uint32, MAX_VERTEX_BUFFERS)) {
            comptime {
                if (!(MAX_VERTEX_BUFFERS == @as(c_int, 16))) @compileError("static assertion failed \"MAX_VERTEX_BUFFERS == 16\"");
            }
            while (true) {
                while (!!(@intFromPtr("The number of vertex buffer descriptions in a vertex input state must not exceed 16!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"The number of vertex buffer descriptions in a vertex input state must not exceed 16!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1124);
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
            return null;
        }
        if ((graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_attributes > @as(Uint32, 0)) and (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(graphicsPipelineCreateInfo.*.vertex_input_state.vertex_attributes)))) == @as(?*anyopaque, null))) {
            while (true) {
                while (!!(@intFromPtr("Vertex attributes array pointer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Vertex attributes array pointer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1128);
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
            return null;
        }
        if (graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_attributes > @as(Uint32, MAX_VERTEX_ATTRIBUTES)) {
            comptime {
                if (!(MAX_VERTEX_ATTRIBUTES == @as(c_int, 16))) @compileError("static assertion failed \"MAX_VERTEX_ATTRIBUTES == 16\"");
            }
            while (true) {
                while (!!(@intFromPtr("The number of vertex attributes in a vertex input state must not exceed 16!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"The number of vertex attributes in a vertex input state must not exceed 16!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1133);
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
            return null;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_buffers) : (i +%= 1) {
                if (graphicsPipelineCreateInfo.*.vertex_input_state.vertex_buffer_descriptions[i].instance_step_rate != @as(Uint32, 0)) {
                    while (true) {
                        while (!!(@intFromPtr("For all vertex buffer descriptions, instance_step_rate must be 0!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"For all vertex buffer descriptions, instance_step_rate must be 0!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1138);
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
                    return null;
                }
            }
        }
        var locations: [16]Uint32 = undefined;
        _ = &locations;
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < graphicsPipelineCreateInfo.*.vertex_input_state.num_vertex_attributes) : (i +%= 1) {
                if ((graphicsPipelineCreateInfo.*.vertex_input_state.vertex_attributes[i].format <= @as(SDL_GPUVertexElementFormat, SDL_GPU_VERTEXELEMENTFORMAT_INVALID)) or (graphicsPipelineCreateInfo.*.vertex_input_state.vertex_attributes[i].format >= @as(SDL_GPUVertexElementFormat, @bitCast(SDL_GPU_VERTEXELEMENTFORMAT_HALF4 + @as(c_int, 1))))) {
                    while (true) {
                        while (!!(@intFromPtr("Invalid vertex format enum!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Invalid vertex format enum!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1144);
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
                    return null;
                }
                locations[i] = graphicsPipelineCreateInfo.*.vertex_input_state.vertex_attributes[i].location;
                {
                    var j: Uint32 = 0;
                    _ = &j;
                    while (j < i) : (j +%= 1) {
                        if (locations[j] == locations[i]) {
                            while (true) {
                                while (!!(@intFromPtr("Each vertex attribute location in a vertex input state must be unique!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Each vertex attribute location in a vertex input state must be unique!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1149);
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
                            return null;
                        }
                    }
                }
            }
        }
        if (graphicsPipelineCreateInfo.*.multisample_state.enable_mask) {
            while (true) {
                while (!!(@intFromPtr("For multisample states, enable_mask must be false!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For multisample states, enable_mask must be false!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1155);
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
            return null;
        }
        if (graphicsPipelineCreateInfo.*.multisample_state.sample_mask != @as(Uint32, 0)) {
            while (true) {
                while (!!(@intFromPtr("For multisample states, sample_mask must be 0!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For multisample states, sample_mask must be 0!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1159);
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
            return null;
        }
        if (graphicsPipelineCreateInfo.*.depth_stencil_state.enable_depth_test) {
            if ((graphicsPipelineCreateInfo.*.depth_stencil_state.compare_op <= @as(SDL_GPUCompareOp, SDL_GPU_COMPAREOP_INVALID)) or (graphicsPipelineCreateInfo.*.depth_stencil_state.compare_op >= @as(SDL_GPUCompareOp, @bitCast(SDL_GPU_COMPAREOP_ALWAYS + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid compare op enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid compare op enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1163);
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
                return null;
            }
        }
        if (graphicsPipelineCreateInfo.*.depth_stencil_state.enable_stencil_test) {
            var stencil_state: [*c]const SDL_GPUStencilOpState = &graphicsPipelineCreateInfo.*.depth_stencil_state.back_stencil_state;
            _ = &stencil_state;
            if ((stencil_state.*.compare_op <= @as(SDL_GPUCompareOp, SDL_GPU_COMPAREOP_INVALID)) or (stencil_state.*.compare_op >= @as(SDL_GPUCompareOp, @bitCast(SDL_GPU_COMPAREOP_ALWAYS + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid compare op enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid compare op enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1167);
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
                return null;
            }
            if ((stencil_state.*.fail_op <= @as(SDL_GPUStencilOp, SDL_GPU_STENCILOP_INVALID)) or (stencil_state.*.fail_op >= @as(SDL_GPUStencilOp, @bitCast(SDL_GPU_STENCILOP_DECREMENT_AND_WRAP + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid stencil op enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid stencil op enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1168);
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
                return null;
            }
            if ((stencil_state.*.pass_op <= @as(SDL_GPUStencilOp, SDL_GPU_STENCILOP_INVALID)) or (stencil_state.*.pass_op >= @as(SDL_GPUStencilOp, @bitCast(SDL_GPU_STENCILOP_DECREMENT_AND_WRAP + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid stencil op enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid stencil op enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1169);
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
                return null;
            }
            if ((stencil_state.*.depth_fail_op <= @as(SDL_GPUStencilOp, SDL_GPU_STENCILOP_INVALID)) or (stencil_state.*.depth_fail_op >= @as(SDL_GPUStencilOp, @bitCast(SDL_GPU_STENCILOP_DECREMENT_AND_WRAP + @as(c_int, 1))))) {
                while (true) {
                    while (!!(@intFromPtr("Invalid stencil op enum!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Invalid stencil op enum!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1170);
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
                return null;
            }
        }
        if (device.*.validate_feature_depth_clamp_disabled and !graphicsPipelineCreateInfo.*.rasterizer_state.enable_depth_clip) {
            while (true) {
                while (!!(@intFromPtr("Rasterizer state enable_depth_clip must be set to true (FEATURE_DEPTH_CLAMPING disabled)") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Rasterizer state enable_depth_clip must be set to true (FEATURE_DEPTH_CLAMPING disabled)\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1175);
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
            return null;
        }
    }
    return device.*.CreateGraphicsPipeline.?(device.*.driverData, graphicsPipelineCreateInfo);
}
pub export fn SDL_CreateGPUSampler_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUSamplerCreateInfo) ?*SDL_GPUSampler {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_CreateGPUSampler_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if (device.*.validate_feature_anisotropy_disabled and createinfo.*.enable_anisotropy) {
            while (true) {
                while (!!(@intFromPtr("enable_anisotropy must be set to false (FEATURE_ANISOTROPY disabled)") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"enable_anisotropy must be set to false (FEATURE_ANISOTROPY disabled)\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1199);
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
            return null;
        }
    }
    return device.*.CreateSampler.?(device.*.driverData, createinfo);
}
pub export fn SDL_CreateGPUShader_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUShaderCreateInfo) ?*SDL_GPUShader {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_CreateGPUShader_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if (createinfo.*.format == @as(SDL_GPUShaderFormat, SDL_GPU_SHADERFORMAT_INVALID)) {
            while (true) {
                while (!!(@intFromPtr("Shader format cannot be INVALID!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader format cannot be INVALID!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1222);
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
            return null;
        }
        if (!((createinfo.*.format & device.*.shader_formats) != 0)) {
            while (true) {
                while (!!(@intFromPtr("Incompatible shader format for GPU backend") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Incompatible shader format for GPU backend\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1226);
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
            return null;
        }
        if (createinfo.*.num_samplers > @as(Uint32, MAX_TEXTURE_SAMPLERS_PER_STAGE)) {
            comptime {
                if (!(MAX_TEXTURE_SAMPLERS_PER_STAGE == @as(c_int, 16))) @compileError("static assertion failed \"MAX_TEXTURE_SAMPLERS_PER_STAGE == 16\"");
            }
            while (true) {
                while (!!(@intFromPtr("Shader sampler count cannot be higher than 16!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader sampler count cannot be higher than 16!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1231);
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
            return null;
        }
        if (createinfo.*.num_storage_textures > @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) {
            comptime {
                if (!(MAX_STORAGE_TEXTURES_PER_STAGE == @as(c_int, 8))) @compileError("static assertion failed \"MAX_STORAGE_TEXTURES_PER_STAGE == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Shader storage texture count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader storage texture count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1236);
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
            return null;
        }
        if (createinfo.*.num_storage_buffers > @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) {
            comptime {
                if (!(MAX_STORAGE_BUFFERS_PER_STAGE == @as(c_int, 8))) @compileError("static assertion failed \"MAX_STORAGE_BUFFERS_PER_STAGE == 8\"");
            }
            while (true) {
                while (!!(@intFromPtr("Shader storage buffer count cannot be higher than 8!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader storage buffer count cannot be higher than 8!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1241);
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
            return null;
        }
        if (createinfo.*.num_uniform_buffers > @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) {
            comptime {
                if (!(MAX_UNIFORM_BUFFERS_PER_STAGE == @as(c_int, 4))) @compileError("static assertion failed \"MAX_UNIFORM_BUFFERS_PER_STAGE == 4\"");
            }
            while (true) {
                while (!!(@intFromPtr("Shader uniform buffer count cannot be higher than 4!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Shader uniform buffer count cannot be higher than 4!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1246);
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
            return null;
        }
    }
    return device.*.CreateShader.?(device.*.driverData, createinfo);
}
pub export fn SDL_CreateGPUTexture_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUTextureCreateInfo) ?*SDL_GPUTexture {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_CreateGPUTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        var failed: bool = @"false" != 0;
        _ = &failed;
        const MAX_2D_DIMENSION: Uint32 = 16384;
        _ = &MAX_2D_DIMENSION;
        const MAX_3D_DIMENSION: Uint32 = 2048;
        _ = &MAX_3D_DIMENSION;
        if ((createinfo.*.format <= @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_INVALID)) or (createinfo.*.format >= @as(SDL_GPUTextureFormat, @bitCast(SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid texture format enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid texture format enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1274);
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
            return null;
        }
        if (((createinfo.*.width <= @as(Uint32, 0)) or (createinfo.*.height <= @as(Uint32, 0))) or (createinfo.*.layer_count_or_depth <= @as(Uint32, 0))) {
            while (true) {
                while (!!(@intFromPtr("For any texture: width, height, and layer_count_or_depth must be >= 1") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For any texture: width, height, and layer_count_or_depth must be >= 1\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1277);
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
            failed = @"true" != 0;
        }
        if (createinfo.*.num_levels <= @as(Uint32, 0)) {
            while (true) {
                while (!!(@intFromPtr("For any texture: num_levels must be >= 1") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For any texture: num_levels must be >= 1\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1281);
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
            failed = @"true" != 0;
        }
        if ((createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_2D)) and (createinfo.*.layer_count_or_depth != @as(Uint32, 1))) {
            while (true) {
                while (!!(@intFromPtr("2D textures must have a layer count of 1") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"2D textures must have a layer count of 1\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1286);
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
            failed = @"true" != 0;
        }
        if (((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) != 0) and ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0)) {
            while (true) {
                while (!!(@intFromPtr("For any texture: usage cannot contain both GRAPHICS_STORAGE_READ and SAMPLER") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For any texture: usage cannot contain both GRAPHICS_STORAGE_READ and SAMPLER\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1290);
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
            failed = @"true" != 0;
        }
        if ((@as(SDL_GPUTextureUsageFlags, @bitCast(@as(c_int, @intFromBool(createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1))))) != 0) and ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0)) {
            while (true) {
                while (!!(@intFromPtr("For multisample textures: usage cannot contain COMPUTE_STORAGE_WRITE flag") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For multisample textures: usage cannot contain COMPUTE_STORAGE_WRITE flag\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1295);
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
            failed = @"true" != 0;
        }
        if ((@as(SDL_GPUTextureUsageFlags, @bitCast(@as(c_int, @as(c_int, @intFromBool(IsDepthFormat(createinfo.*.format)))))) != 0) and ((createinfo.*.usage & ~((@as(c_uint, 1) << @intCast(@as(c_uint, 2))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 0))))) != 0)) {
            while (true) {
                while (!!(@intFromPtr("For depth textures: usage cannot contain any flags except for DEPTH_STENCIL_TARGET and SAMPLER") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For depth textures: usage cannot contain any flags except for DEPTH_STENCIL_TARGET and SAMPLER\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1299);
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
            failed = @"true" != 0;
        }
        if ((@as(SDL_GPUTextureUsageFlags, @bitCast(@as(c_int, @as(c_int, @intFromBool(IsIntegerFormat(createinfo.*.format)))))) != 0) and ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0)) {
            while (true) {
                while (!!(@intFromPtr("For any texture: usage cannot contain SAMPLER for textures with an integer format") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"For any texture: usage cannot contain SAMPLER for textures with an integer format\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1303);
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
            failed = @"true" != 0;
        }
        if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE)) {
            if (createinfo.*.width != createinfo.*.height) {
                while (true) {
                    while (!!(@intFromPtr("For cube textures: width and height must be identical") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube textures: width and height must be identical\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1310);
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
                failed = @"true" != 0;
            }
            if ((createinfo.*.width > MAX_2D_DIMENSION) or (createinfo.*.height > MAX_2D_DIMENSION)) {
                while (true) {
                    while (!!(@intFromPtr("For cube textures: width and height must be <= 16384") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube textures: width and height must be <= 16384\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1314);
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
                failed = @"true" != 0;
            }
            if (createinfo.*.layer_count_or_depth != @as(Uint32, 6)) {
                while (true) {
                    while (!!(@intFromPtr("For cube textures: layer_count_or_depth must be 6") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube textures: layer_count_or_depth must be 6\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1318);
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
                failed = @"true" != 0;
            }
            if (createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                while (true) {
                    while (!!(@intFromPtr("For cube textures: sample_count must be SDL_GPU_SAMPLECOUNT_1") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube textures: sample_count must be SDL_GPU_SAMPLECOUNT_1\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1322);
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
                failed = @"true" != 0;
            }
            if (!SDL_GPUTextureSupportsFormat_REAL(device, createinfo.*.format, SDL_GPU_TEXTURETYPE_CUBE, createinfo.*.usage)) {
                while (true) {
                    while (!!(@intFromPtr("For cube textures: the format is unsupported for the given usage") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube textures: the format is unsupported for the given usage\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1326);
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
                failed = @"true" != 0;
            }
        } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_CUBE_ARRAY)) {
            if (createinfo.*.width != createinfo.*.height) {
                while (true) {
                    while (!!(@intFromPtr("For cube array textures: width and height must be identical") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube array textures: width and height must be identical\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1332);
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
                failed = @"true" != 0;
            }
            if ((createinfo.*.width > MAX_2D_DIMENSION) or (createinfo.*.height > MAX_2D_DIMENSION)) {
                while (true) {
                    while (!!(@intFromPtr("For cube array textures: width and height must be <= 16384") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube array textures: width and height must be <= 16384\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1336);
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
                failed = @"true" != 0;
            }
            if ((createinfo.*.layer_count_or_depth % @as(Uint32, 6)) != @as(Uint32, 0)) {
                while (true) {
                    while (!!(@intFromPtr("For cube array textures: layer_count_or_depth must be a multiple of 6") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube array textures: layer_count_or_depth must be a multiple of 6\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1340);
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
                failed = @"true" != 0;
            }
            if (createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                while (true) {
                    while (!!(@intFromPtr("For cube array textures: sample_count must be SDL_GPU_SAMPLECOUNT_1") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube array textures: sample_count must be SDL_GPU_SAMPLECOUNT_1\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1344);
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
                failed = @"true" != 0;
            }
            if (!SDL_GPUTextureSupportsFormat_REAL(device, createinfo.*.format, SDL_GPU_TEXTURETYPE_CUBE_ARRAY, createinfo.*.usage)) {
                while (true) {
                    while (!!(@intFromPtr("For cube array textures: the format is unsupported for the given usage") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For cube array textures: the format is unsupported for the given usage\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1348);
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
                failed = @"true" != 0;
            }
        } else if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
            if (((createinfo.*.width > MAX_3D_DIMENSION) or (createinfo.*.height > MAX_3D_DIMENSION)) or (createinfo.*.layer_count_or_depth > MAX_3D_DIMENSION)) {
                while (true) {
                    while (!!(@intFromPtr("For 3D textures: width, height, and layer_count_or_depth must be <= 2048") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 3D textures: width, height, and layer_count_or_depth must be <= 2048\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1354);
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
                failed = @"true" != 0;
            }
            if ((createinfo.*.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0) {
                while (true) {
                    while (!!(@intFromPtr("For 3D textures: usage must not contain DEPTH_STENCIL_TARGET") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 3D textures: usage must not contain DEPTH_STENCIL_TARGET\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1358);
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
                failed = @"true" != 0;
            }
            if (createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                while (true) {
                    while (!!(@intFromPtr("For 3D textures: sample_count must be SDL_GPU_SAMPLECOUNT_1") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 3D textures: sample_count must be SDL_GPU_SAMPLECOUNT_1\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1362);
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
                failed = @"true" != 0;
            }
            if (!SDL_GPUTextureSupportsFormat_REAL(device, createinfo.*.format, SDL_GPU_TEXTURETYPE_3D, createinfo.*.usage)) {
                while (true) {
                    while (!!(@intFromPtr("For 3D textures: the format is unsupported for the given usage") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 3D textures: the format is unsupported for the given usage\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1366);
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
                failed = @"true" != 0;
            }
        } else {
            if (createinfo.*.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_2D_ARRAY)) {
                if (createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                    while (true) {
                        while (!!(@intFromPtr("For array textures: sample_count must be SDL_GPU_SAMPLECOUNT_1") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"For array textures: sample_count must be SDL_GPU_SAMPLECOUNT_1\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1373);
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
                    failed = @"true" != 0;
                }
            }
            if ((createinfo.*.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) and (createinfo.*.num_levels > @as(Uint32, 1))) {
                while (true) {
                    while (!!(@intFromPtr("For 2D multisample textures: num_levels must be 1") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 2D multisample textures: num_levels must be 1\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1378);
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
                failed = @"true" != 0;
            }
            if (!SDL_GPUTextureSupportsFormat_REAL(device, createinfo.*.format, SDL_GPU_TEXTURETYPE_2D, createinfo.*.usage)) {
                while (true) {
                    while (!!(@intFromPtr("For 2D textures: the format is unsupported for the given usage") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"For 2D textures: the format is unsupported for the given usage\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1382);
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
                failed = @"true" != 0;
            }
        }
        if (failed) {
            return null;
        }
    }
    return device.*.CreateTexture.?(device.*.driverData, createinfo);
}
pub export fn SDL_CreateGPUBuffer_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUBufferCreateInfo) ?*SDL_GPUBuffer {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_CreateGPUBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if (createinfo.*.size < @as(Uint32, 4)) {
            while (true) {
                while (!!(@intFromPtr("Cannot create a buffer with size less than 4 bytes!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot create a buffer with size less than 4 bytes!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1410);
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
        }
    }
    var debugName: [*c]const u8 = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.buffer.create.name", null);
    _ = &debugName;
    return device.*.CreateBuffer.?(device.*.driverData, createinfo.*.usage, createinfo.*.size, debugName);
}
pub export fn SDL_CreateGPUTransferBuffer_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const SDL_GPUTransferBufferCreateInfo) ?*SDL_GPUTransferBuffer {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_CreateGPUTransferBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(createinfo)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (device.*.debug_mode) {
        if ((createinfo.*.usage != @as(SDL_GPUTransferBufferUsage, SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD)) and (createinfo.*.usage != @as(SDL_GPUTransferBufferUsage, SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD))) {
            while (true) {
                while (!!(@intFromPtr("Invalid transfer buffer usage!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid transfer buffer usage!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1437);
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
        }
    }
    var debugName: [*c]const u8 = SDL_GetStringProperty_REAL(createinfo.*.props, "SDL.gpu.transferbuffer.create.name", null);
    _ = &debugName;
    return device.*.CreateTransferBuffer.?(device.*.driverData, createinfo.*.usage, createinfo.*.size, debugName);
}
pub export fn SDL_SetGPUBufferName_REAL(device: [*c]SDL_GPUDevice, buffer: ?*SDL_GPUBuffer, text: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buffer"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(text)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("text"))));
    }
    device.*.SetBufferName.?(device.*.driverData, buffer, text);
}
pub export fn SDL_SetGPUTextureName_REAL(device: [*c]SDL_GPUDevice, texture: ?*SDL_GPUTexture, text: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(texture))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(text)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("text"))));
    }
    device.*.SetTextureName.?(device.*.driverData, texture, text);
}
pub export fn SDL_InsertGPUDebugLabel_REAL(command_buffer: ?*SDL_GPUCommandBuffer, text: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "SDL_InsertGPUDebugLabel_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(text)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("text"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1508);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.InsertDebugLabel.?(command_buffer, text);
}
pub export fn SDL_PushGPUDebugGroup_REAL(command_buffer: ?*SDL_GPUCommandBuffer, name: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "SDL_PushGPUDebugGroup_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(name)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("name"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1530);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.PushDebugGroup.?(command_buffer, name);
}
pub export fn SDL_PopGPUDebugGroup_REAL(command_buffer: ?*SDL_GPUCommandBuffer) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_PopGPUDebugGroup_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1547);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.PopDebugGroup.?(command_buffer);
}
pub export fn SDL_ReleaseGPUTexture_REAL(device: [*c]SDL_GPUDevice, texture: ?*SDL_GPUTexture) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(texture))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseTexture.?(device.*.driverData, texture);
}
pub export fn SDL_ReleaseGPUSampler_REAL(device: [*c]SDL_GPUDevice, sampler: ?*SDL_GPUSampler) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(sampler))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseSampler.?(device.*.driverData, sampler);
}
pub export fn SDL_ReleaseGPUBuffer_REAL(device: [*c]SDL_GPUDevice, buffer: ?*SDL_GPUBuffer) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseBuffer.?(device.*.driverData, buffer);
}
pub export fn SDL_ReleaseGPUTransferBuffer_REAL(device: [*c]SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(transfer_buffer))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseTransferBuffer.?(device.*.driverData, transfer_buffer);
}
pub export fn SDL_ReleaseGPUShader_REAL(device: [*c]SDL_GPUDevice, shader: ?*SDL_GPUShader) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(shader))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseShader.?(device.*.driverData, shader);
}
pub export fn SDL_ReleaseGPUComputePipeline_REAL(device: [*c]SDL_GPUDevice, compute_pipeline: ?*SDL_GPUComputePipeline) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pipeline))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseComputePipeline.?(device.*.driverData, compute_pipeline);
}
pub export fn SDL_ReleaseGPUGraphicsPipeline_REAL(device: [*c]SDL_GPUDevice, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(graphics_pipeline))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseGraphicsPipeline.?(device.*.driverData, graphics_pipeline);
}
pub export fn SDL_AcquireGPUCommandBuffer_REAL(device: [*c]SDL_GPUDevice) ?*SDL_GPUCommandBuffer {
    @setEvalBranchQuota(100000);
    var command_buffer: ?*SDL_GPUCommandBuffer = undefined;
    _ = &command_buffer;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    command_buffer = device.*.AcquireCommandBuffer.?(device.*.driverData);
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        return null;
    }
    commandBufferHeader = @ptrCast(@alignCast(command_buffer));
    commandBufferHeader.*.device = device;
    commandBufferHeader.*.render_pass.command_buffer = command_buffer;
    commandBufferHeader.*.compute_pass.command_buffer = command_buffer;
    commandBufferHeader.*.copy_pass.command_buffer = command_buffer;
    if (device.*.debug_mode) {
        commandBufferHeader.*.render_pass.in_progress = @"false" != 0;
        commandBufferHeader.*.render_pass.graphics_pipeline = null;
        commandBufferHeader.*.compute_pass.in_progress = @"false" != 0;
        commandBufferHeader.*.compute_pass.compute_pipeline = null;
        commandBufferHeader.*.copy_pass.in_progress = @"false" != 0;
        commandBufferHeader.*.swapchain_texture_acquired = @"false" != 0;
        commandBufferHeader.*.submitted = @"false" != 0;
        commandBufferHeader.*.ignore_render_pass_texture_validation = @"false" != 0;
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.vertex_sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.vertex_sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.vertex_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.vertex_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.vertex_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.vertex_storage_buffer_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.fragment_sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.fragment_sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.fragment_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.fragment_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.render_pass.fragment_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.render_pass.fragment_storage_buffer_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass.sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.compute_pass.sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass.read_only_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.compute_pass.read_only_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass.read_only_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.compute_pass.read_only_storage_buffer_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass.read_write_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.compute_pass.read_write_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass.read_write_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferHeader.*.compute_pass.read_write_storage_buffer_bound)));
    }
    return command_buffer;
}
pub export fn SDL_PushGPUVertexUniformData_REAL(command_buffer: ?*SDL_GPUCommandBuffer, arg_slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void {
    @setEvalBranchQuota(100000);
    var slot_index = arg_slot_index;
    _ = &slot_index;
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_PushGPUVertexUniformData_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (data == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("data"))));
        return;
    }
    if (slot_index >= @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("slot_index exceeds MAX_UNIFORM_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1731);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.PushVertexUniformData.?(command_buffer, slot_index, data, length);
}
pub export fn SDL_PushGPUFragmentUniformData_REAL(command_buffer: ?*SDL_GPUCommandBuffer, arg_slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void {
    @setEvalBranchQuota(100000);
    var slot_index = arg_slot_index;
    _ = &slot_index;
    const static_local___func__ = struct {
        const __func__: [35:0]u8 = "SDL_PushGPUFragmentUniformData_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (data == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("data"))));
        return;
    }
    if (slot_index >= @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("slot_index exceeds MAX_UNIFORM_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1761);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.PushFragmentUniformData.?(command_buffer, slot_index, data, length);
}
pub export fn SDL_PushGPUComputeUniformData_REAL(command_buffer: ?*SDL_GPUCommandBuffer, arg_slot_index: Uint32, data: ?*const anyopaque, length: Uint32) void {
    @setEvalBranchQuota(100000);
    var slot_index = arg_slot_index;
    _ = &slot_index;
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_PushGPUComputeUniformData_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (data == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("data"))));
        return;
    }
    if (slot_index >= @as(Uint32, MAX_UNIFORM_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("slot_index exceeds MAX_UNIFORM_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1791);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.PushComputeUniformData.?(command_buffer, slot_index, data, length);
}
pub export fn SDL_BeginGPURenderPass_REAL(command_buffer: ?*SDL_GPUCommandBuffer, color_target_infos: [*c]const SDL_GPUColorTargetInfo, num_color_targets: Uint32, depth_stencil_target_info: [*c]const SDL_GPUDepthStencilTargetInfo) ?*SDL_GPURenderPass {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_BeginGPURenderPass_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(color_target_infos)))) == @as(?*anyopaque, null)) and (num_color_targets > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("color_target_infos"))));
        return null;
    }
    if (num_color_targets > @as(Uint32, MAX_COLOR_TARGET_BINDINGS)) {
        _ = SDL_SetError_REAL("num_color_targets exceeds MAX_COLOR_TARGET_BINDINGS");
        return null;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1826);
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
            return null;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot begin render pass during another pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot begin render pass during another pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1827);
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
            return null;
        }
        @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_width = @as(c_uint, 4294967295);
        @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_height = @as(c_uint, 4294967295);
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_color_targets) : (i +%= 1) {
                var textureHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(color_target_infos[i].texture));
                _ = &textureHeader;
                @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_width = if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_width < textureHeader.*.info.width) @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_width else textureHeader.*.info.width;
                @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_height = if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_height < textureHeader.*.info.height) @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.max_viewport_height else textureHeader.*.info.height;
                if (color_target_infos[i].cycle and (color_target_infos[i].load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_LOAD))) {
                    while (true) {
                        while (!!(@intFromPtr("Cannot cycle color target when load op is LOAD!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Cannot cycle color target when load op is LOAD!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1839);
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
                    return null;
                }
                if ((color_target_infos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (color_target_infos[i].store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                    if (@as(?*anyopaque, @ptrCast(@alignCast(color_target_infos[i].resolve_texture))) == @as(?*anyopaque, null)) {
                        while (true) {
                            while (!!(@intFromPtr("Store op is RESOLVE or RESOLVE_AND_STORE but resolve_texture is NULL!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Store op is RESOLVE or RESOLVE_AND_STORE but resolve_texture is NULL!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1845);
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
                        return null;
                    } else {
                        var resolveTextureHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(color_target_infos[i].resolve_texture));
                        _ = &resolveTextureHeader;
                        if (textureHeader.*.info.sample_count == @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                            while (true) {
                                while (!!(@intFromPtr("Store op is RESOLVE or RESOLVE_AND_STORE but texture is not multisample!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Store op is RESOLVE or RESOLVE_AND_STORE but texture is not multisample!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1850);
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
                            return null;
                        }
                        if (resolveTextureHeader.*.info.sample_count != @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                            while (true) {
                                while (!!(@intFromPtr("Resolve texture must have a sample count of 1!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Resolve texture must have a sample count of 1!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1854);
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
                            return null;
                        }
                        if (resolveTextureHeader.*.info.format != textureHeader.*.info.format) {
                            while (true) {
                                while (!!(@intFromPtr("Resolve texture must have the same format as its corresponding color target!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Resolve texture must have the same format as its corresponding color target!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1858);
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
                            return null;
                        }
                        if (resolveTextureHeader.*.info.type == @as(SDL_GPUTextureType, SDL_GPU_TEXTURETYPE_3D)) {
                            while (true) {
                                while (!!(@intFromPtr("Resolve texture must not be of TEXTURETYPE_3D!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Resolve texture must not be of TEXTURETYPE_3D!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1862);
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
                            return null;
                        }
                        if (!((resolveTextureHeader.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0)) {
                            while (true) {
                                while (!!(@intFromPtr("Resolve texture usage must include COLOR_TARGET!") != 0)) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "!\"Resolve texture usage must include COLOR_TARGET!\"",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1866);
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
                            return null;
                        }
                    }
                }
                if (color_target_infos[i].layer_or_depth_plane >= textureHeader.*.info.layer_count_or_depth) {
                    while (true) {
                        while (!!(@intFromPtr("Color target layer index must be less than the texture's layer count!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Color target layer index must be less than the texture's layer count!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1873);
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
                    return null;
                }
                if (color_target_infos[i].mip_level >= textureHeader.*.info.num_levels) {
                    while (true) {
                        while (!!(@intFromPtr("Color target mip level must be less than the texture's level count!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Color target mip level must be less than the texture's level count!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1878);
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
                    return null;
                }
            }
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depth_stencil_target_info)))) != @as(?*anyopaque, null)) {
            var textureHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(depth_stencil_target_info.*.texture));
            _ = &textureHeader;
            if (!((textureHeader.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) != 0)) {
                while (true) {
                    while (!!(@intFromPtr("Depth target must have been created with the DEPTH_STENCIL_TARGET usage flag!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Depth target must have been created with the DEPTH_STENCIL_TARGET usage flag!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1886);
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
                return null;
            }
            if (textureHeader.*.info.layer_count_or_depth > @as(Uint32, 255)) {
                while (true) {
                    while (!!(@intFromPtr("Cannot bind a depth texture with more than 255 layers!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Cannot bind a depth texture with more than 255 layers!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1891);
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
                return null;
            }
            if (depth_stencil_target_info.*.cycle and ((depth_stencil_target_info.*.load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_LOAD)) or (depth_stencil_target_info.*.stencil_load_op == @as(SDL_GPULoadOp, SDL_GPU_LOADOP_LOAD)))) {
                while (true) {
                    while (!!(@intFromPtr("Cannot cycle depth target when load op or stencil load op is LOAD!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"Cannot cycle depth target when load op or stencil load op is LOAD!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1896);
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
                return null;
            }
            if ((((depth_stencil_target_info.*.store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE)) or (depth_stencil_target_info.*.stencil_store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE))) or (depth_stencil_target_info.*.store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) or (depth_stencil_target_info.*.stencil_store_op == @as(SDL_GPUStoreOp, SDL_GPU_STOREOP_RESOLVE_AND_STORE))) {
                while (true) {
                    while (!!(@intFromPtr("RESOLVE store ops are not supported for depth-stencil targets!") != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "!\"RESOLVE store ops are not supported for depth-stencil targets!\"",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1904);
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
                return null;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.BeginRenderPass.?(command_buffer, color_target_infos, num_color_targets, depth_stencil_target_info);
    commandBufferHeader = @ptrCast(@alignCast(command_buffer));
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        commandBufferHeader.*.render_pass.in_progress = @"true" != 0;
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_color_targets) : (i +%= 1) {
                commandBufferHeader.*.render_pass.color_targets[i] = color_target_infos[i].texture;
            }
        }
        commandBufferHeader.*.render_pass.num_color_targets = num_color_targets;
        if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(depth_stencil_target_info)))) != @as(?*anyopaque, null)) {
            commandBufferHeader.*.render_pass.depth_stencil_target = depth_stencil_target_info.*.texture;
        } else {
            commandBufferHeader.*.render_pass.depth_stencil_target = null;
        }
    }
    return @ptrCast(@alignCast(&commandBufferHeader.*.render_pass));
}
pub export fn SDL_BindGPUGraphicsPipeline_REAL(render_pass: ?*SDL_GPURenderPass, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(graphics_pipeline))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("graphics_pipeline"))));
        return;
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindGraphicsPipeline.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, graphics_pipeline);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline = graphics_pipeline;
    }
}
pub export fn SDL_SetGPUViewport_REAL(render_pass: ?*SDL_GPURenderPass, viewport: [*c]const SDL_GPUViewport) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_SetGPUViewport_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(viewport)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("viewport"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1971);
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
            return;
        }
        if (((viewport.*.x + viewport.*.w) > @as(f32, @floatFromInt(@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.max_viewport_width))) or ((viewport.*.y + viewport.*.h) > @as(f32, @floatFromInt(@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.max_viewport_height)))) {
            while (true) {
                while (!!(@intFromPtr("Viewport size exceeds current render target dimensions") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Viewport size exceeds current render target dimensions\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1975);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.SetViewport.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, viewport);
}
pub export fn SDL_SetGPUScissor_REAL(render_pass: ?*SDL_GPURenderPass, scissor: [*c]const SDL_Rect) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_SetGPUScissor_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(scissor)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scissor"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 1999);
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
            return;
        }
        if ((@as(Uint32, @bitCast(@as(c_int, scissor.*.x + scissor.*.w))) > @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.max_viewport_width) or (@as(Uint32, @bitCast(@as(c_int, scissor.*.y + scissor.*.h))) > @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.max_viewport_height)) {
            while (true) {
                while (!!(@intFromPtr("Scissor rectangle size exceeds current render target dimensions") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Scissor rectangle size exceeds current render target dimensions\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2003);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.SetScissor.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, scissor);
}
pub export fn SDL_SetGPUBlendConstants_REAL(render_pass: ?*SDL_GPURenderPass, blend_constants: SDL_FColor) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_SetGPUBlendConstants_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2023);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.SetBlendConstants.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, blend_constants);
}
pub export fn SDL_SetGPUStencilReference_REAL(render_pass: ?*SDL_GPURenderPass, reference: Uint8) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_SetGPUStencilReference_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2041);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.SetStencilReference.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, reference);
}
pub export fn SDL_BindGPUVertexBuffers_REAL(render_pass: ?*SDL_GPURenderPass, first_binding: Uint32, bindings: [*c]const SDL_GPUBufferBinding, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_BindGPUVertexBuffers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(bindings)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("bindings"))));
        return;
    }
    if ((first_binding +% num_bindings) > @as(Uint32, MAX_VERTEX_BUFFERS)) {
        _ = SDL_SetError_REAL("first_binding + num_bindings exceeds MAX_VERTEX_BUFFERS");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2069);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindVertexBuffers.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_binding, bindings, num_bindings);
}
pub export fn SDL_BindGPUIndexBuffer_REAL(render_pass: ?*SDL_GPURenderPass, binding: [*c]const SDL_GPUBufferBinding, index_element_size: SDL_GPUIndexElementSize) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_BindGPUIndexBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(binding)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("binding"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2094);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindIndexBuffer.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, binding, index_element_size);
}
pub export fn SDL_BindGPUVertexSamplers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_BindGPUVertexSamplers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(texture_sampler_bindings)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture_sampler_bindings"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_TEXTURE_SAMPLERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_TEXTURE_SAMPLERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2123);
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
            return;
        }
        if (!@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.ignore_render_pass_texture_validation) {
            {
                var i: Uint32 = 0;
                _ = &i;
                while (i < num_bindings) : (i +%= 1) {
                    var texture_header: [*c]TextureCommonHeader = @ptrCast(@alignCast(texture_sampler_bindings[i].texture));
                    _ = &texture_header;
                    if (texture_header.*.info.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                        while (true) {
                            while (!!(@intFromPtr("Multisample textures cannot be bound as samplers!") != 0)) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "!\"Multisample textures cannot be bound as samplers!\"",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2133);
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
                    }
                }
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.vertex_sampler_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    if (num_bindings == @as(Uint32, 0)) {
        return;
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindVertexSamplers.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, texture_sampler_bindings, num_bindings);
}
pub export fn SDL_BindGPUVertexStorageTextures_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "SDL_BindGPUVertexStorageTextures_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_textures)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_textures"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_TEXTURES_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2174);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.vertex_storage_texture_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindVertexStorageTextures.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, storage_textures, num_bindings);
}
pub export fn SDL_BindGPUVertexStorageBuffers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [36:0]u8 = "SDL_BindGPUVertexStorageBuffers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_buffers)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_buffers"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2209);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.vertex_storage_buffer_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindVertexStorageBuffers.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, storage_buffers, num_bindings);
}
pub export fn SDL_BindGPUFragmentSamplers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_BindGPUFragmentSamplers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(texture_sampler_bindings)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture_sampler_bindings"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_TEXTURE_SAMPLERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_TEXTURE_SAMPLERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2243);
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
            return;
        }
        if (!@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.ignore_render_pass_texture_validation) {}
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                var texture_header: [*c]TextureCommonHeader = @ptrCast(@alignCast(texture_sampler_bindings[i].texture));
                _ = &texture_header;
                if (texture_header.*.info.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                    while (true) {
                        while (!!(@intFromPtr("Multisample textures cannot be bound as samplers!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Multisample textures cannot be bound as samplers!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2253);
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
                }
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.fragment_sampler_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    if (num_bindings == @as(Uint32, 0)) {
        return;
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindFragmentSamplers.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, texture_sampler_bindings, num_bindings);
}
pub export fn SDL_BindGPUFragmentStorageTextures_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [39:0]u8 = "SDL_BindGPUFragmentStorageTextures_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_textures)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_textures"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_TEXTURES_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2293);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.fragment_storage_texture_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindFragmentStorageTextures.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, storage_textures, num_bindings);
}
pub export fn SDL_BindGPUFragmentStorageBuffers_REAL(render_pass: ?*SDL_GPURenderPass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [38:0]u8 = "SDL_BindGPUFragmentStorageBuffers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_buffers)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_buffers"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2328);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.fragment_storage_buffer_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.BindFragmentStorageBuffers.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, first_slot, storage_buffers, num_bindings);
}
pub export fn SDL_DrawGPUIndexedPrimitives_REAL(render_pass: ?*SDL_GPURenderPass, num_indices: Uint32, num_instances: Uint32, first_index: Uint32, vertex_offset: Sint32, first_instance: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_DrawGPUIndexedPrimitives_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2356);
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
            return;
        }
        if (!(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Graphics pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Graphics pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2357);
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
            return;
        }
        SDL_GPU_CheckGraphicsBindings(render_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.DrawIndexedPrimitives.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, num_indices, num_instances, first_index, vertex_offset, first_instance);
}
pub export fn SDL_DrawGPUPrimitives_REAL(render_pass: ?*SDL_GPURenderPass, num_vertices: Uint32, num_instances: Uint32, first_vertex: Uint32, first_instance: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "SDL_DrawGPUPrimitives_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2383);
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
            return;
        }
        if (!(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Graphics pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Graphics pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2384);
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
            return;
        }
        SDL_GPU_CheckGraphicsBindings(render_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.DrawPrimitives.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, num_vertices, num_instances, first_vertex, first_instance);
}
pub export fn SDL_DrawGPUPrimitivesIndirect_REAL(render_pass: ?*SDL_GPURenderPass, buffer: ?*SDL_GPUBuffer, offset: Uint32, draw_count: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_DrawGPUPrimitivesIndirect_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buffer"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2412);
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
            return;
        }
        if (!(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Graphics pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Graphics pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2413);
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
            return;
        }
        SDL_GPU_CheckGraphicsBindings(render_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.DrawPrimitivesIndirect.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, buffer, offset, draw_count);
}
pub export fn SDL_DrawGPUIndexedPrimitivesIndirect_REAL(render_pass: ?*SDL_GPURenderPass, buffer: ?*SDL_GPUBuffer, offset: Uint32, draw_count: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [41:0]u8 = "SDL_DrawGPUIndexedPrimitivesIndirect_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("buffer"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2440);
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
            return;
        }
        if (!(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.graphics_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Graphics pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Graphics pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2441);
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
            return;
        }
        SDL_GPU_CheckGraphicsBindings(render_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.DrawIndexedPrimitivesIndirect.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer, buffer, offset, draw_count);
}
pub export fn SDL_EndGPURenderPass_REAL(render_pass: ?*SDL_GPURenderPass) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_EndGPURenderPass_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(render_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("render_pass"))));
        return;
    }
    var commandBufferCommonHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferCommonHeader;
    commandBufferCommonHeader = @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer));
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Render pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Render pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2464);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.EndRenderPass.?(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]RenderPass, @ptrCast(@alignCast(render_pass))).*.command_buffer))).*.device.*.debug_mode) {
        commandBufferCommonHeader.*.render_pass.in_progress = @"false" != 0;
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < @as(Uint32, MAX_COLOR_TARGET_BINDINGS)) : (i +%= 1) {
                commandBufferCommonHeader.*.render_pass.color_targets[i] = null;
            }
        }
        commandBufferCommonHeader.*.render_pass.num_color_targets = 0;
        commandBufferCommonHeader.*.render_pass.depth_stencil_target = null;
        commandBufferCommonHeader.*.render_pass.graphics_pipeline = null;
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.vertex_sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.vertex_sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.vertex_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.vertex_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.vertex_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.vertex_storage_buffer_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.fragment_sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.fragment_sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.fragment_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.fragment_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.render_pass.fragment_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.render_pass.fragment_storage_buffer_bound)));
    }
}
pub export fn SDL_BeginGPUComputePass_REAL(command_buffer: ?*SDL_GPUCommandBuffer, storage_texture_bindings: [*c]const SDL_GPUStorageTextureReadWriteBinding, num_storage_texture_bindings: Uint32, storage_buffer_bindings: [*c]const SDL_GPUStorageBufferReadWriteBinding, num_storage_buffer_bindings: Uint32) ?*SDL_GPUComputePass {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "SDL_BeginGPUComputePass_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_texture_bindings)))) == @as(?*anyopaque, null)) and (num_storage_texture_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_texture_bindings"))));
        return null;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_buffer_bindings)))) == @as(?*anyopaque, null)) and (num_storage_buffer_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_buffer_bindings"))));
        return null;
    }
    if (num_storage_texture_bindings > @as(Uint32, MAX_COMPUTE_WRITE_TEXTURES)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("num_storage_texture_bindings"))));
        return null;
    }
    if (num_storage_buffer_bindings > @as(Uint32, MAX_COMPUTE_WRITE_BUFFERS)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("num_storage_buffer_bindings"))));
        return null;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2521);
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
            return null;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot begin compute pass during another pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot begin compute pass during another pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2522);
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
            return null;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_storage_texture_bindings) : (i +%= 1) {
                var header: [*c]TextureCommonHeader = @ptrCast(@alignCast(storage_texture_bindings[i].texture));
                _ = &header;
                if (!((header.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) != 0) and !((header.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) != 0)) {
                    while (true) {
                        while (!!(@intFromPtr("Texture must be created with COMPUTE_STORAGE_WRITE or COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE flag") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Texture must be created with COMPUTE_STORAGE_WRITE or COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE flag\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2527);
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
                    return null;
                }
                if (storage_texture_bindings[i].layer >= header.*.info.layer_count_or_depth) {
                    while (true) {
                        while (!!(@intFromPtr("Storage texture layer index must be less than the texture's layer count!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Storage texture layer index must be less than the texture's layer count!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2532);
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
                    return null;
                }
                if (storage_texture_bindings[i].mip_level >= header.*.info.num_levels) {
                    while (true) {
                        while (!!(@intFromPtr("Storage texture mip level must be less than the texture's level count!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Storage texture mip level must be less than the texture's level count!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2537);
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
                    return null;
                }
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.BeginComputePass.?(command_buffer, storage_texture_bindings, num_storage_texture_bindings, storage_buffer_bindings, num_storage_buffer_bindings);
    commandBufferHeader = @ptrCast(@alignCast(command_buffer));
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        commandBufferHeader.*.compute_pass.in_progress = @"true" != 0;
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_storage_texture_bindings) : (i +%= 1) {
                commandBufferHeader.*.compute_pass.read_write_storage_texture_bound[i] = @"true" != 0;
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_storage_buffer_bindings) : (i +%= 1) {
                commandBufferHeader.*.compute_pass.read_write_storage_buffer_bound[i] = @"true" != 0;
            }
        }
    }
    return @ptrCast(@alignCast(&commandBufferHeader.*.compute_pass));
}
pub export fn SDL_BindGPUComputePipeline_REAL(compute_pass: ?*SDL_GPUComputePass, compute_pipeline: ?*SDL_GPUComputePipeline) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_BindGPUComputePipeline_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pipeline))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pipeline"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2583);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.BindComputePipeline.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, compute_pipeline);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        @as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.compute_pipeline = compute_pipeline;
    }
}
pub export fn SDL_BindGPUComputeSamplers_REAL(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, texture_sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_BindGPUComputeSamplers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(texture_sampler_bindings)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture_sampler_bindings"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_TEXTURE_SAMPLERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_TEXTURE_SAMPLERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2616);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                var texture_header: [*c]TextureCommonHeader = @ptrCast(@alignCast(texture_sampler_bindings[i].texture));
                _ = &texture_header;
                if (texture_header.*.info.sample_count > @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
                    while (true) {
                        while (!!(@intFromPtr("Multisample textures cannot be bound as samplers!") != 0)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "!\"Multisample textures cannot be bound as samplers!\"",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2622);
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
                }
            }
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.sampler_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.BindComputeSamplers.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, first_slot, texture_sampler_bindings, num_bindings);
}
pub export fn SDL_BindGPUComputeStorageTextures_REAL(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_textures: [*c]const ?*SDL_GPUTexture, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [38:0]u8 = "SDL_BindGPUComputeStorageTextures_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_textures)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_textures"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_TEXTURES_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_TEXTURES_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2658);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.read_only_storage_texture_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.BindComputeStorageTextures.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, first_slot, storage_textures, num_bindings);
}
pub export fn SDL_BindGPUComputeStorageBuffers_REAL(compute_pass: ?*SDL_GPUComputePass, first_slot: Uint32, storage_buffers: [*c]const ?*SDL_GPUBuffer, num_bindings: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "SDL_BindGPUComputeStorageBuffers_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(storage_buffers)))) == @as(?*anyopaque, null)) and (num_bindings > @as(Uint32, 0))) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("storage_buffers"))));
        return;
    }
    if ((first_slot +% num_bindings) > @as(Uint32, MAX_STORAGE_BUFFERS_PER_STAGE)) {
        _ = SDL_SetError_REAL("first_slot + num_bindings exceeds MAX_STORAGE_BUFFERS_PER_STAGE");
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2692);
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
            return;
        }
        {
            var i: Uint32 = 0;
            _ = &i;
            while (i < num_bindings) : (i +%= 1) {
                @as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.read_only_storage_buffer_bound[first_slot +% i] = @"true" != 0;
            }
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.BindComputeStorageBuffers.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, first_slot, storage_buffers, num_bindings);
}
pub export fn SDL_DispatchGPUCompute_REAL(compute_pass: ?*SDL_GPUComputePass, groupcount_x: Uint32, groupcount_y: Uint32, groupcount_z: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_DispatchGPUCompute_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2718);
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
            return;
        }
        if (!(@as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.compute_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Compute pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2719);
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
            return;
        }
        SDL_GPU_CheckComputeBindings(compute_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.DispatchCompute.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, groupcount_x, groupcount_y, groupcount_z);
}
pub export fn SDL_DispatchGPUComputeIndirect_REAL(compute_pass: ?*SDL_GPUComputePass, buffer: ?*SDL_GPUBuffer, offset: Uint32) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [35:0]u8 = "SDL_DispatchGPUComputeIndirect_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2741);
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
            return;
        }
        if (!(@as([*c]ComputePass, @ptrCast(@alignCast(compute_pass))).*.compute_pipeline != null)) {
            while (true) {
                while (!!(@intFromPtr("Compute pipeline not bound!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pipeline not bound!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2742);
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
            return;
        }
        SDL_GPU_CheckComputeBindings(compute_pass);
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.DispatchComputeIndirect.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer, buffer, offset);
}
pub export fn SDL_EndGPUComputePass_REAL(compute_pass: ?*SDL_GPUComputePass) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "SDL_EndGPUComputePass_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferCommonHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferCommonHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(compute_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("compute_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Compute pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Compute pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2763);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.EndComputePass.?(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer))).*.device.*.debug_mode) {
        commandBufferCommonHeader = @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(compute_pass))).*.command_buffer));
        commandBufferCommonHeader.*.compute_pass.in_progress = @"false" != 0;
        commandBufferCommonHeader.*.compute_pass.compute_pipeline = null;
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.compute_pass.sampler_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.compute_pass.sampler_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.compute_pass.read_only_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.compute_pass.read_only_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.compute_pass.read_only_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.compute_pass.read_only_storage_buffer_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.compute_pass.read_write_storage_texture_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.compute_pass.read_write_storage_texture_bound)));
        _ = memset(@ptrCast(@alignCast(@as([*c]bool, @ptrCast(@alignCast(&commandBufferCommonHeader.*.compute_pass.read_write_storage_buffer_bound))))), 0, @sizeOf(@TypeOf(commandBufferCommonHeader.*.compute_pass.read_write_storage_buffer_bound)));
    }
}
pub export fn SDL_MapGPUTransferBuffer_REAL(device: [*c]SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer, cycle: bool) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(transfer_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("transfer_buffer"))));
        return null;
    }
    return device.*.MapTransferBuffer.?(device.*.driverData, transfer_buffer, cycle);
}
pub export fn SDL_UnmapGPUTransferBuffer_REAL(device: [*c]SDL_GPUDevice, transfer_buffer: ?*SDL_GPUTransferBuffer) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(transfer_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("transfer_buffer"))));
        return;
    }
    device.*.UnmapTransferBuffer.?(device.*.driverData, transfer_buffer);
}
pub export fn SDL_BeginGPUCopyPass_REAL(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUCopyPass {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_BeginGPUCopyPass_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = undefined;
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return null;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2830);
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
            return null;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot begin copy pass during another pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot begin copy pass during another pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2831);
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
            return null;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.BeginCopyPass.?(command_buffer);
    commandBufferHeader = @ptrCast(@alignCast(command_buffer));
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        commandBufferHeader.*.copy_pass.in_progress = @"true" != 0;
    }
    return @ptrCast(@alignCast(&commandBufferHeader.*.copy_pass));
}
pub export fn SDL_UploadToGPUTexture_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureTransferInfo, destination: [*c]const SDL_GPUTextureRegion, cycle: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_UploadToGPUTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2866);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.transfer_buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source transfer buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source transfer buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2868);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.texture))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination texture cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination texture cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2872);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.UploadToTexture.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination, cycle);
}
pub export fn SDL_UploadToGPUBuffer_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTransferBufferLocation, destination: [*c]const SDL_GPUBufferRegion, cycle: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "SDL_UploadToGPUBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2904);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.transfer_buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source transfer buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source transfer buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2906);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2910);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.UploadToBuffer.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination, cycle);
}
pub export fn SDL_CopyGPUTextureToTexture_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureLocation, destination: [*c]const SDL_GPUTextureLocation, w: Uint32, h: Uint32, d: Uint32, cycle: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [32:0]u8 = "SDL_CopyGPUTextureToTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2945);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.texture))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source texture cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source texture cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2947);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.texture))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination texture cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination texture cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2951);
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
            return;
        }
        var srcHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(source.*.texture));
        _ = &srcHeader;
        var dstHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(destination.*.texture));
        _ = &dstHeader;
        if (srcHeader.*.info.format != dstHeader.*.info.format) {
            while (true) {
                while (!!(@intFromPtr("Source and destination textures must have the same format!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source and destination textures must have the same format!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2958);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.CopyTextureToTexture.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination, w, h, d, cycle);
}
pub export fn SDL_CopyGPUBufferToBuffer_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUBufferLocation, destination: [*c]const SDL_GPUBufferLocation, size: Uint32, cycle: bool) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_CopyGPUBufferToBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2994);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 2996);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3000);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.CopyBufferToBuffer.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination, size, cycle);
}
pub export fn SDL_DownloadFromGPUTexture_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUTextureRegion, destination: [*c]const SDL_GPUTextureTransferInfo) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_DownloadFromGPUTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3032);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.texture))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source texture cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source texture cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3034);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.transfer_buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination transfer buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination transfer buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3038);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.DownloadFromTexture.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination);
}
pub export fn SDL_DownloadFromGPUBuffer_REAL(copy_pass: ?*SDL_GPUCopyPass, source: [*c]const SDL_GPUBufferRegion, destination: [*c]const SDL_GPUTransferBufferLocation) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "SDL_DownloadFromGPUBuffer_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(source)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("source"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(destination)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("destination"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3068);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(source.*.buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Source buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Source buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3070);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(destination.*.transfer_buffer))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Destination transfer buffer cannot be NULL!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Destination transfer buffer cannot be NULL!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3074);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.DownloadFromBuffer.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer, source, destination);
}
pub export fn SDL_EndGPUCopyPass_REAL(copy_pass: ?*SDL_GPUCopyPass) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_EndGPUCopyPass_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(copy_pass))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("copy_pass"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        if (!@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Copy pass not in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Copy pass not in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3094);
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
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.EndCopyPass.?(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.device.*.debug_mode) {
        @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(@as([*c]Pass, @ptrCast(@alignCast(copy_pass))).*.command_buffer))).*.copy_pass.in_progress = @"false" != 0;
    }
}
pub export fn SDL_GenerateMipmapsForGPUTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, texture: ?*SDL_GPUTexture) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "SDL_GenerateMipmapsForGPUTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(texture))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3119);
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
            return;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot generate mipmaps during a pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot generate mipmaps during a pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3120);
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
            return;
        }
        var header: [*c]TextureCommonHeader = @ptrCast(@alignCast(texture));
        _ = &header;
        if (header.*.info.num_levels <= @as(Uint32, 1)) {
            while (true) {
                while (!!(@intFromPtr("Cannot generate mipmaps for texture with num_levels <= 1!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot generate mipmaps for texture with num_levels <= 1!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3124);
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
            return;
        }
        if (!((header.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0) or !((header.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) != 0)) {
            while (true) {
                while (!!(@intFromPtr("GenerateMipmaps texture must be created with SAMPLER and COLOR_TARGET usage flags!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"GenerateMipmaps texture must be created with SAMPLER and COLOR_TARGET usage flags!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3129);
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
            return;
        }
        var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
        _ = &commandBufferHeader;
        commandBufferHeader.*.ignore_render_pass_texture_validation = @"true" != 0;
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.GenerateMipmaps.?(command_buffer, texture);
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
        _ = &commandBufferHeader;
        commandBufferHeader.*.ignore_render_pass_texture_validation = @"false" != 0;
    }
}
pub export fn SDL_BlitGPUTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, info: [*c]const SDL_GPUBlitInfo) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_BlitGPUTexture_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(info)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("info"))));
        return;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3161);
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
            return;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot blit during a pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot blit during a pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3162);
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
            return;
        }
        var failed: bool = @"false" != 0;
        _ = &failed;
        var srcHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.source.texture));
        _ = &srcHeader;
        var dstHeader: [*c]TextureCommonHeader = @ptrCast(@alignCast(info.*.destination.texture));
        _ = &dstHeader;
        if (@as(?*anyopaque, @ptrCast(@alignCast(srcHeader))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Blit source texture must be non-NULL") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit source texture must be non-NULL\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3170);
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
            return;
        }
        if (@as(?*anyopaque, @ptrCast(@alignCast(dstHeader))) == @as(?*anyopaque, null)) {
            while (true) {
                while (!!(@intFromPtr("Blit destination texture must be non-NULL") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit destination texture must be non-NULL\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3174);
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
            return;
        }
        if (srcHeader.*.info.sample_count != @as(SDL_GPUSampleCount, SDL_GPU_SAMPLECOUNT_1)) {
            while (true) {
                while (!!(@intFromPtr("Blit source texture must have a sample count of 1") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit source texture must have a sample count of 1\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3178);
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
            failed = @"true" != 0;
        }
        if ((srcHeader.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) == @as(SDL_GPUTextureUsageFlags, 0)) {
            while (true) {
                while (!!(@intFromPtr("Blit source texture must be created with the SAMPLER usage flag") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit source texture must be created with the SAMPLER usage flag\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3182);
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
            failed = @"true" != 0;
        }
        if ((dstHeader.*.info.usage & (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) == @as(SDL_GPUTextureUsageFlags, 0)) {
            while (true) {
                while (!!(@intFromPtr("Blit destination texture must be created with the COLOR_TARGET usage flag") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit destination texture must be created with the COLOR_TARGET usage flag\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3186);
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
            failed = @"true" != 0;
        }
        if (IsDepthFormat(srcHeader.*.info.format)) {
            while (true) {
                while (!!(@intFromPtr("Blit source texture cannot have a depth format") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit source texture cannot have a depth format\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3190);
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
            failed = @"true" != 0;
        }
        if ((((info.*.source.w == @as(Uint32, 0)) or (info.*.source.h == @as(Uint32, 0))) or (info.*.destination.w == @as(Uint32, 0))) or (info.*.destination.h == @as(Uint32, 0))) {
            while (true) {
                while (!!(@intFromPtr("Blit source/destination regions must have non-zero width, height, and depth") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Blit source/destination regions must have non-zero width, height, and depth\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3194);
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
            failed = @"true" != 0;
        }
        if (failed) {
            return;
        }
    }
    @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.Blit.?(command_buffer, info);
}
pub export fn SDL_WindowSupportsGPUSwapchainComposition_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window, arg_swapchain_composition: SDL_GPUSwapchainComposition) bool {
    @setEvalBranchQuota(100000);
    var swapchain_composition = arg_swapchain_composition;
    _ = &swapchain_composition;
    const static_local___func__ = struct {
        const __func__: [46:0]u8 = "SDL_WindowSupportsGPUSwapchainComposition_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
        return @"false" != 0;
    }
    if (device.*.debug_mode) {
        if ((swapchain_composition < @as(SDL_GPUSwapchainComposition, 0)) or (swapchain_composition >= @as(SDL_GPUSwapchainComposition, @bitCast(SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid swapchain composition enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid swapchain composition enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3223);
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
            return @"false" != 0;
        }
    }
    return device.*.SupportsSwapchainComposition.?(device.*.driverData, window, swapchain_composition);
}
pub export fn SDL_WindowSupportsGPUPresentMode_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window, arg_present_mode: SDL_GPUPresentMode) bool {
    @setEvalBranchQuota(100000);
    var present_mode = arg_present_mode;
    _ = &present_mode;
    const static_local___func__ = struct {
        const __func__: [37:0]u8 = "SDL_WindowSupportsGPUPresentMode_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
        return @"false" != 0;
    }
    if (device.*.debug_mode) {
        if ((present_mode < @as(SDL_GPUPresentMode, 0)) or (present_mode >= @as(SDL_GPUPresentMode, @bitCast(SDL_GPU_PRESENTMODE_MAILBOX + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid present mode enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid present mode enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3245);
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
            return @"false" != 0;
        }
    }
    return device.*.SupportsPresentMode.?(device.*.driverData, window, present_mode);
}
pub export fn SDL_ClaimWindowForGPUDevice_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
    }
    if ((window.*.flags & @as(c_ulong, 1073741824)) != @as(SDL_WindowFlags, 0)) {
        return SDL_SetError_REAL("The GPU API doesn't support transparent windows");
    }
    return device.*.ClaimWindow.?(device.*.driverData, window);
}
pub export fn SDL_ReleaseWindowFromGPUDevice_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
        return;
    }
    device.*.ReleaseWindow.?(device.*.driverData, window);
}
pub export fn SDL_SetGPUSwapchainParameters_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window, arg_swapchain_composition: SDL_GPUSwapchainComposition, arg_present_mode: SDL_GPUPresentMode) bool {
    @setEvalBranchQuota(100000);
    var swapchain_composition = arg_swapchain_composition;
    _ = &swapchain_composition;
    var present_mode = arg_present_mode;
    _ = &present_mode;
    const static_local___func__ = struct {
        const __func__: [34:0]u8 = "SDL_SetGPUSwapchainParameters_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
        return @"false" != 0;
    }
    if (device.*.debug_mode) {
        if ((swapchain_composition < @as(SDL_GPUSwapchainComposition, 0)) or (swapchain_composition >= @as(SDL_GPUSwapchainComposition, @bitCast(SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid swapchain composition enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid swapchain composition enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3303);
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
            return @"false" != 0;
        }
        if ((present_mode < @as(SDL_GPUPresentMode, 0)) or (present_mode >= @as(SDL_GPUPresentMode, @bitCast(SDL_GPU_PRESENTMODE_MAILBOX + @as(c_int, 1))))) {
            while (true) {
                while (!!(@intFromPtr("Invalid present mode enum!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Invalid present mode enum!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3304);
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
            return @"false" != 0;
        }
    }
    return device.*.SetSwapchainParameters.?(device.*.driverData, window, swapchain_composition, present_mode);
}
pub export fn SDL_SetGPUAllowedFramesInFlight_REAL(device: [*c]SDL_GPUDevice, arg_allowed_frames_in_flight: Uint32) bool {
    @setEvalBranchQuota(100000);
    var allowed_frames_in_flight = arg_allowed_frames_in_flight;
    _ = &allowed_frames_in_flight;
    const static_local___func__ = struct {
        const __func__: [36:0]u8 = "SDL_SetGPUAllowedFramesInFlight_REAL".*;
    };
    _ = &static_local___func__;
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (device.*.debug_mode) {
        if ((allowed_frames_in_flight < @as(Uint32, 1)) or (allowed_frames_in_flight > @as(Uint32, 3))) {
            comptime {
                if (!(MAX_FRAMES_IN_FLIGHT == @as(c_int, 3))) @compileError("static assertion failed \"MAX_FRAMES_IN_FLIGHT == 3\"");
            }
            while (true) {
                while (!!(@intFromPtr("allowed_frames_in_flight value must be between 1 and 3!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"allowed_frames_in_flight value must be between 1 and 3!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3324);
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
        }
    }
    allowed_frames_in_flight = if (allowed_frames_in_flight < @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1))))) @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) else if (allowed_frames_in_flight > @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3))))) @as(Uint32, @bitCast(@as(c_int, @as(c_int, 3)))) else allowed_frames_in_flight;
    return device.*.SetAllowedFramesInFlight.?(device.*.driverData, allowed_frames_in_flight);
}
pub export fn SDL_GetGPUSwapchainTextureFormat_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window) SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return SDL_GPU_TEXTUREFORMAT_INVALID;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
        return SDL_GPU_TEXTUREFORMAT_INVALID;
    }
    return device.*.GetSwapchainTextureFormat.?(device.*.driverData, window);
}
pub export fn SDL_AcquireGPUSwapchainTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [35:0]u8 = "SDL_AcquireGPUSwapchainTexture_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchain_texture))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("swapchain_texture"))));
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3370);
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
            return @"false" != 0;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot acquire a swapchain texture during a pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot acquire a swapchain texture during a pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3371);
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
            return @"false" != 0;
        }
    }
    var result: bool = @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.AcquireSwapchainTexture.?(command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height);
    _ = &result;
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchain_texture.*))) != @as(?*anyopaque, null)) {
        commandBufferHeader.*.swapchain_texture_acquired = @"true" != 0;
    }
    return result;
}
pub export fn SDL_WaitForGPUSwapchain_REAL(device: [*c]SDL_GPUDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
    }
    return device.*.WaitForSwapchain.?(device.*.driverData, window);
}
pub export fn SDL_WaitAndAcquireGPUSwapchainTexture_REAL(command_buffer: ?*SDL_GPUCommandBuffer, window: [*c]SDL_Window, swapchain_texture: [*c]?*SDL_GPUTexture, swapchain_texture_width: [*c]Uint32, swapchain_texture_height: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [42:0]u8 = "SDL_WaitAndAcquireGPUSwapchainTexture_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(window))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchain_texture))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("swapchain_texture"))));
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3423);
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
            return @"false" != 0;
        }
        if ((@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.render_pass.in_progress or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.compute_pass.in_progress) or @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot acquire a swapchain texture during a pass!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot acquire a swapchain texture during a pass!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3424);
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
            return @"false" != 0;
        }
    }
    var result: bool = @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.WaitAndAcquireSwapchainTexture.?(command_buffer, window, swapchain_texture, swapchain_texture_width, swapchain_texture_height);
    _ = &result;
    if (@as(?*anyopaque, @ptrCast(@alignCast(swapchain_texture.*))) != @as(?*anyopaque, null)) {
        commandBufferHeader.*.swapchain_texture_acquired = @"true" != 0;
    }
    return result;
}
pub export fn SDL_SubmitGPUCommandBuffer_REAL(command_buffer: ?*SDL_GPUCommandBuffer) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_SubmitGPUCommandBuffer_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return @"false" != 0;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3452);
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
            return @"false" != 0;
        }
        if ((commandBufferHeader.*.render_pass.in_progress or commandBufferHeader.*.compute_pass.in_progress) or commandBufferHeader.*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot submit command buffer while a pass is in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot submit command buffer while a pass is in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3457);
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
            return @"false" != 0;
        }
    }
    commandBufferHeader.*.submitted = @"true" != 0;
    return @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.Submit.?(command_buffer);
}
pub export fn SDL_SubmitGPUCommandBufferAndAcquireFence_REAL(command_buffer: ?*SDL_GPUCommandBuffer) ?*SDL_GPUFence {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [46:0]u8 = "SDL_SubmitGPUCommandBufferAndAcquireFence_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return null;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.submitted) {
            while (true) {
                while (!!(@intFromPtr("Command buffer already submitted!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Command buffer already submitted!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3479);
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
            return null;
        }
        if ((commandBufferHeader.*.render_pass.in_progress or commandBufferHeader.*.compute_pass.in_progress) or commandBufferHeader.*.copy_pass.in_progress) {
            while (true) {
                while (!!(@intFromPtr("Cannot submit command buffer while a pass is in progress!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot submit command buffer while a pass is in progress!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3484);
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
            return null;
        }
    }
    commandBufferHeader.*.submitted = @"true" != 0;
    return @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.SubmitAndAcquireFence.?(command_buffer);
}
pub export fn SDL_CancelGPUCommandBuffer_REAL(command_buffer: ?*SDL_GPUCommandBuffer) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "SDL_CancelGPUCommandBuffer_REAL".*;
    };
    _ = &static_local___func__;
    var commandBufferHeader: [*c]CommandBufferCommonHeader = @ptrCast(@alignCast(command_buffer));
    _ = &commandBufferHeader;
    if (@as(?*anyopaque, @ptrCast(@alignCast(command_buffer))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("command_buffer"))));
        return @"false" != 0;
    }
    if (@as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.debug_mode) {
        if (commandBufferHeader.*.swapchain_texture_acquired) {
            while (true) {
                while (!!(@intFromPtr("Cannot cancel command buffer after a swapchain texture has been acquired!") != 0)) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "!\"Cannot cancel command buffer after a swapchain texture has been acquired!\"",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_gpu.c", 3507);
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
            return @"false" != 0;
        }
    }
    return @as([*c]CommandBufferCommonHeader, @ptrCast(@alignCast(command_buffer))).*.device.*.Cancel.?(command_buffer);
}
pub export fn SDL_WaitForGPUIdle_REAL(device: [*c]SDL_GPUDevice) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    return device.*.Wait.?(device.*.driverData);
}
pub export fn SDL_WaitForGPUFences_REAL(device: [*c]SDL_GPUDevice, wait_all: bool, fences: [*c]const ?*SDL_GPUFence, num_fences: Uint32) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (!(num_fences != 0)) {
        return @"true" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(fences)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("fences"))));
        return @"false" != 0;
    }
    return device.*.WaitForFences.?(device.*.driverData, wait_all, fences, num_fences);
}
pub export fn SDL_QueryGPUFence_REAL(device: [*c]SDL_GPUDevice, fence: ?*SDL_GPUFence) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return @"false" != 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(fence))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("fence"))));
        return @"false" != 0;
    }
    return device.*.QueryFence.?(device.*.driverData, fence);
}
pub export fn SDL_ReleaseGPUFence_REAL(device: [*c]SDL_GPUDevice, fence: ?*SDL_GPUFence) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(fence))) == @as(?*anyopaque, null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return;
    }
    device.*.ReleaseFence.?(device.*.driverData, fence);
}
pub export fn SDL_CalculateGPUTextureFormatSize_REAL(format: SDL_GPUTextureFormat, width: Uint32, height: Uint32, depth_or_layer_count: Uint32) Uint32 {
    @setEvalBranchQuota(100000);
    var blockWidth: Uint32 = @bitCast(@as(c_int, if (Texture_GetBlockWidth(format) > @as(c_int, 1)) Texture_GetBlockWidth(format) else @as(c_int, 1)));
    _ = &blockWidth;
    var blockHeight: Uint32 = @bitCast(@as(c_int, if (Texture_GetBlockHeight(format) > @as(c_int, 1)) Texture_GetBlockHeight(format) else @as(c_int, 1)));
    _ = &blockHeight;
    var blocksPerRow: Uint32 = ((width +% blockWidth) -% @as(Uint32, 1)) / blockWidth;
    _ = &blocksPerRow;
    var blocksPerColumn: Uint32 = ((height +% blockHeight) -% @as(Uint32, 1)) / blockHeight;
    _ = &blocksPerColumn;
    return ((depth_or_layer_count *% blocksPerRow) *% blocksPerColumn) *% SDL_GPUTextureFormatTexelBlockSize_REAL(format);
}
pub export fn SDL_GetPixelFormatFromGPUTextureFormat_REAL(format: SDL_GPUTextureFormat) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GPUTextureFormat, SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SDL_PIXELFORMAT_ARGB4444;
            },
            3 => {
                return SDL_PIXELFORMAT_RGB565;
            },
            4 => {
                return SDL_PIXELFORMAT_ARGB1555;
            },
            5 => {
                return SDL_PIXELFORMAT_RGBA32;
            },
            6 => {
                return SDL_PIXELFORMAT_RGBA32;
            },
            7 => {
                return SDL_PIXELFORMAT_RGBA32;
            },
            8 => {
                return SDL_PIXELFORMAT_RGBA32;
            },
            9 => {
                return SDL_PIXELFORMAT_BGRA32;
            },
            10 => {
                return SDL_PIXELFORMAT_BGRA32;
            },
            11 => {
                return SDL_PIXELFORMAT_ABGR2101010;
            },
            12 => {
                return SDL_PIXELFORMAT_RGBA64;
            },
            13 => {
                return SDL_PIXELFORMAT_RGBA64;
            },
            14 => {
                return SDL_PIXELFORMAT_RGBA64_FLOAT;
            },
            15 => {
                return SDL_PIXELFORMAT_RGBA128_FLOAT;
            },
            16 => {
                return SDL_PIXELFORMAT_UNKNOWN;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetGPUTextureFormatFromPixelFormat_REAL(format: SDL_PixelFormat) SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB4444) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB1555) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX32) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX32) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA64) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA64_FLOAT) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA128_FLOAT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM;
            },
            3 => {
                return SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM;
            },
            4 => {
                return SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                return SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
            },
            9 => {
                return SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM;
            },
            10 => {
                return SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM;
            },
            11 => {
                return SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT;
            },
            12 => {
                return SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT;
            },
            13 => {
                return SDL_GPU_TEXTUREFORMAT_INVALID;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_CreateGPUXRSession_REAL(device: [*c]SDL_GPUDevice, createinfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) XrResult {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return XR_ERROR_HANDLE_INVALID;
    }
    return device.*.CreateXRSession.?(device.*.driverData, createinfo, session);
}
pub export fn SDL_GetGPUXRSwapchainFormats_REAL(device: [*c]SDL_GPUDevice, session: XrSession, num_formats: [*c]c_int) [*c]SDL_GPUTextureFormat {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return null;
    }
    return device.*.GetXRSwapchainFormats.?(device.*.driverData, session, num_formats);
}
pub export fn SDL_CreateGPUXRSwapchain_REAL(device: [*c]SDL_GPUDevice, session: XrSession, createinfo: [*c]const XrSwapchainCreateInfo, format: SDL_GPUTextureFormat, swapchain: [*c]XrSwapchain, textures: [*c][*c]?*SDL_GPUTexture) XrResult {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(device))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("Invalid GPU device");
        return XR_ERROR_HANDLE_INVALID;
    }
    return device.*.CreateXRSwapchain.?(device.*.driverData, session, createinfo, format, swapchain, textures);
}

pub const SDL_AcquireGPUCommandBuffer = SDL_AcquireGPUCommandBuffer_REAL;
pub const SDL_AcquireGPUSwapchainTexture = SDL_AcquireGPUSwapchainTexture_REAL;
pub const SDL_BeginGPUComputePass = SDL_BeginGPUComputePass_REAL;
pub const SDL_BeginGPUCopyPass = SDL_BeginGPUCopyPass_REAL;
pub const SDL_BeginGPURenderPass = SDL_BeginGPURenderPass_REAL;
pub const SDL_BindGPUComputePipeline = SDL_BindGPUComputePipeline_REAL;
pub const SDL_BindGPUComputeSamplers = SDL_BindGPUComputeSamplers_REAL;
pub const SDL_BindGPUComputeStorageBuffers = SDL_BindGPUComputeStorageBuffers_REAL;
pub const SDL_BindGPUComputeStorageTextures = SDL_BindGPUComputeStorageTextures_REAL;
pub const SDL_BindGPUFragmentSamplers = SDL_BindGPUFragmentSamplers_REAL;
pub const SDL_BindGPUFragmentStorageBuffers = SDL_BindGPUFragmentStorageBuffers_REAL;
pub const SDL_BindGPUFragmentStorageTextures = SDL_BindGPUFragmentStorageTextures_REAL;
pub const SDL_BindGPUGraphicsPipeline = SDL_BindGPUGraphicsPipeline_REAL;
pub const SDL_BindGPUIndexBuffer = SDL_BindGPUIndexBuffer_REAL;
pub const SDL_BindGPUVertexBuffers = SDL_BindGPUVertexBuffers_REAL;
pub const SDL_BindGPUVertexSamplers = SDL_BindGPUVertexSamplers_REAL;
pub const SDL_BindGPUVertexStorageBuffers = SDL_BindGPUVertexStorageBuffers_REAL;
pub const SDL_BindGPUVertexStorageTextures = SDL_BindGPUVertexStorageTextures_REAL;
pub const SDL_BlitGPUTexture = SDL_BlitGPUTexture_REAL;
pub const SDL_ClaimWindowForGPUDevice = SDL_ClaimWindowForGPUDevice_REAL;
pub const SDL_CopyGPUBufferToBuffer = SDL_CopyGPUBufferToBuffer_REAL;
pub const SDL_CopyGPUTextureToTexture = SDL_CopyGPUTextureToTexture_REAL;
pub const SDL_CreateGPUBuffer = SDL_CreateGPUBuffer_REAL;
pub const SDL_CreateGPUComputePipeline = SDL_CreateGPUComputePipeline_REAL;
pub const SDL_CreateGPUDevice = SDL_CreateGPUDevice_REAL;
pub const SDL_CreateGPUDeviceWithProperties = SDL_CreateGPUDeviceWithProperties_REAL;
pub const SDL_CreateGPUGraphicsPipeline = SDL_CreateGPUGraphicsPipeline_REAL;
pub const SDL_CreateGPUSampler = SDL_CreateGPUSampler_REAL;
pub const SDL_CreateGPUShader = SDL_CreateGPUShader_REAL;
pub const SDL_CreateGPUTexture = SDL_CreateGPUTexture_REAL;
pub const SDL_CreateGPUTransferBuffer = SDL_CreateGPUTransferBuffer_REAL;
pub const SDL_DestroyGPUDevice = SDL_DestroyGPUDevice_REAL;
pub const SDL_DispatchGPUCompute = SDL_DispatchGPUCompute_REAL;
pub const SDL_DispatchGPUComputeIndirect = SDL_DispatchGPUComputeIndirect_REAL;
pub const SDL_DownloadFromGPUBuffer = SDL_DownloadFromGPUBuffer_REAL;
pub const SDL_DownloadFromGPUTexture = SDL_DownloadFromGPUTexture_REAL;
pub const SDL_DrawGPUIndexedPrimitives = SDL_DrawGPUIndexedPrimitives_REAL;
pub const SDL_DrawGPUIndexedPrimitivesIndirect = SDL_DrawGPUIndexedPrimitivesIndirect_REAL;
pub const SDL_DrawGPUPrimitives = SDL_DrawGPUPrimitives_REAL;
pub const SDL_DrawGPUPrimitivesIndirect = SDL_DrawGPUPrimitivesIndirect_REAL;
pub const SDL_EndGPUComputePass = SDL_EndGPUComputePass_REAL;
pub const SDL_EndGPUCopyPass = SDL_EndGPUCopyPass_REAL;
pub const SDL_EndGPURenderPass = SDL_EndGPURenderPass_REAL;
pub const SDL_GPUSupportsProperties = SDL_GPUSupportsProperties_REAL;
pub const SDL_GPUSupportsShaderFormats = SDL_GPUSupportsShaderFormats_REAL;
pub const SDL_GPUTextureFormatTexelBlockSize = SDL_GPUTextureFormatTexelBlockSize_REAL;
pub const SDL_GPUTextureSupportsFormat = SDL_GPUTextureSupportsFormat_REAL;
pub const SDL_GPUTextureSupportsSampleCount = SDL_GPUTextureSupportsSampleCount_REAL;
pub const SDL_GenerateMipmapsForGPUTexture = SDL_GenerateMipmapsForGPUTexture_REAL;
pub const SDL_GetGPUDeviceDriver = SDL_GetGPUDeviceDriver_REAL;
pub const SDL_GetGPUDriver = SDL_GetGPUDriver_REAL;
pub const SDL_GetGPUShaderFormats = SDL_GetGPUShaderFormats_REAL;
pub const SDL_GetGPUSwapchainTextureFormat = SDL_GetGPUSwapchainTextureFormat_REAL;
pub const SDL_GetNumGPUDrivers = SDL_GetNumGPUDrivers_REAL;
pub const SDL_InsertGPUDebugLabel = SDL_InsertGPUDebugLabel_REAL;
pub const SDL_MapGPUTransferBuffer = SDL_MapGPUTransferBuffer_REAL;
pub const SDL_PopGPUDebugGroup = SDL_PopGPUDebugGroup_REAL;
pub const SDL_PushGPUComputeUniformData = SDL_PushGPUComputeUniformData_REAL;
pub const SDL_PushGPUDebugGroup = SDL_PushGPUDebugGroup_REAL;
pub const SDL_PushGPUFragmentUniformData = SDL_PushGPUFragmentUniformData_REAL;
pub const SDL_PushGPUVertexUniformData = SDL_PushGPUVertexUniformData_REAL;
pub const SDL_QueryGPUFence = SDL_QueryGPUFence_REAL;
pub const SDL_ReleaseGPUBuffer = SDL_ReleaseGPUBuffer_REAL;
pub const SDL_ReleaseGPUComputePipeline = SDL_ReleaseGPUComputePipeline_REAL;
pub const SDL_ReleaseGPUFence = SDL_ReleaseGPUFence_REAL;
pub const SDL_ReleaseGPUGraphicsPipeline = SDL_ReleaseGPUGraphicsPipeline_REAL;
pub const SDL_ReleaseGPUSampler = SDL_ReleaseGPUSampler_REAL;
pub const SDL_ReleaseGPUShader = SDL_ReleaseGPUShader_REAL;
pub const SDL_ReleaseGPUTexture = SDL_ReleaseGPUTexture_REAL;
pub const SDL_ReleaseGPUTransferBuffer = SDL_ReleaseGPUTransferBuffer_REAL;
pub const SDL_ReleaseWindowFromGPUDevice = SDL_ReleaseWindowFromGPUDevice_REAL;
pub const SDL_SetGPUBlendConstants = SDL_SetGPUBlendConstants_REAL;
pub const SDL_SetGPUBufferName = SDL_SetGPUBufferName_REAL;
pub const SDL_SetGPUScissor = SDL_SetGPUScissor_REAL;
pub const SDL_SetGPUStencilReference = SDL_SetGPUStencilReference_REAL;
pub const SDL_SetGPUSwapchainParameters = SDL_SetGPUSwapchainParameters_REAL;
pub const SDL_SetGPUTextureName = SDL_SetGPUTextureName_REAL;
pub const SDL_SetGPUViewport = SDL_SetGPUViewport_REAL;
pub const SDL_SubmitGPUCommandBuffer = SDL_SubmitGPUCommandBuffer_REAL;
pub const SDL_SubmitGPUCommandBufferAndAcquireFence = SDL_SubmitGPUCommandBufferAndAcquireFence_REAL;
pub const SDL_UnmapGPUTransferBuffer = SDL_UnmapGPUTransferBuffer_REAL;
pub const SDL_UploadToGPUBuffer = SDL_UploadToGPUBuffer_REAL;
pub const SDL_UploadToGPUTexture = SDL_UploadToGPUTexture_REAL;
pub const SDL_WaitForGPUFences = SDL_WaitForGPUFences_REAL;
pub const SDL_WaitForGPUIdle = SDL_WaitForGPUIdle_REAL;
pub const SDL_WindowSupportsGPUPresentMode = SDL_WindowSupportsGPUPresentMode_REAL;
pub const SDL_WindowSupportsGPUSwapchainComposition = SDL_WindowSupportsGPUSwapchainComposition_REAL;
pub const SDL_CalculateGPUTextureFormatSize = SDL_CalculateGPUTextureFormatSize_REAL;
pub const SDL_CancelGPUCommandBuffer = SDL_CancelGPUCommandBuffer_REAL;
pub const SDL_SetGPUAllowedFramesInFlight = SDL_SetGPUAllowedFramesInFlight_REAL;
pub const SDL_WaitForGPUSwapchain = SDL_WaitForGPUSwapchain_REAL;
pub const SDL_WaitAndAcquireGPUSwapchainTexture = SDL_WaitAndAcquireGPUSwapchainTexture_REAL;
pub const SDL_GetGPUDeviceProperties = SDL_GetGPUDeviceProperties_REAL;
pub const SDL_GetPixelFormatFromGPUTextureFormat = SDL_GetPixelFormatFromGPUTextureFormat_REAL;
pub const SDL_GetGPUTextureFormatFromPixelFormat = SDL_GetGPUTextureFormatFromPixelFormat_REAL;
pub const SDL_CreateGPUXRSession = SDL_CreateGPUXRSession_REAL;
pub const SDL_GetGPUXRSwapchainFormats = SDL_GetGPUXRSwapchainFormats_REAL;
pub const SDL_CreateGPUXRSwapchain = SDL_CreateGPUXRSwapchain_REAL;
pub const SDL_DestroyGPUXRSwapchain = SDL_DestroyGPUXRSwapchain_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_GPU_SHADERFORMAT_INVALID = @as(c_int, 0);
pub const MAX_TEXTURE_SAMPLERS_PER_STAGE = @as(c_int, 16);
pub const MAX_STORAGE_TEXTURES_PER_STAGE = @as(c_int, 8);
pub const MAX_STORAGE_BUFFERS_PER_STAGE = @as(c_int, 8);
pub const MAX_UNIFORM_BUFFERS_PER_STAGE = @as(c_int, 4);
pub const MAX_COMPUTE_WRITE_TEXTURES = @as(c_int, 8);
pub const MAX_COMPUTE_WRITE_BUFFERS = @as(c_int, 8);
pub const MAX_VERTEX_BUFFERS = @as(c_int, 16);
pub const MAX_VERTEX_ATTRIBUTES = @as(c_int, 16);
pub const MAX_COLOR_TARGET_BINDINGS = @as(c_int, 8);
pub const MAX_FRAMES_IN_FLIGHT = @as(c_int, 3);
