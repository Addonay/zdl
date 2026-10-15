//! Public GPU API types from SDL_gpu.h, plus the format and validation helpers
//! SDL_gpu.c uses before a backend sees a request.
//!
//! Altered native port of SDL_gpu.h / SDL_gpu.c / SDL_sysgpu.h helpers. The
//! declarations are plain Zig values: enums use snake_case variants in SDL's
//! order, usage and mask flags are packed structs whose bit positions equal the
//! SDL flag values, and create infos hold slices instead of pointer-and-count
//! pairs. No device, window or global state lives here; backends in
//! `vulkan/device.zig` consume these values.
//!
//! Numeric conventions: the texel and texture size helpers return `u64` byte
//! counts, not SDL's 32-bit `Uint32`, so large 3D or array textures cannot wrap.
//! Sizes that do fit in SDL's `Uint32` are numerically identical to SDL.

const std = @import("std");

// ---------------------------------------------------------------------------
// Enumerations (order matches SDL_gpu.h so backing values stay interchangeable)
// ---------------------------------------------------------------------------

/// Texture pixel formats (`SDL_GPUTextureFormat`). `invalid` is SDL's
/// `SDL_GPU_TEXTUREFORMAT_INVALID`.
pub const TextureFormat = enum(u8) {
    invalid,
    a8_unorm,
    r8_unorm,
    r8g8_unorm,
    r8g8b8a8_unorm,
    r16_unorm,
    r16g16_unorm,
    r16g16b16a16_unorm,
    r10g10b10a2_unorm,
    b5g6r5_unorm,
    b5g5r5a1_unorm,
    b4g4r4a4_unorm,
    b8g8r8a8_unorm,
    bc1_rgba_unorm,
    bc2_rgba_unorm,
    bc3_rgba_unorm,
    bc4_r_unorm,
    bc5_rg_unorm,
    bc7_rgba_unorm,
    bc6h_rgb_float,
    bc6h_rgb_ufloat,
    r8_snorm,
    r8g8_snorm,
    r8g8b8a8_snorm,
    r16_snorm,
    r16g16_snorm,
    r16g16b16a16_snorm,
    r16_float,
    r16g16_float,
    r16g16b16a16_float,
    r32_float,
    r32g32_float,
    r32g32b32a32_float,
    r11g11b10_ufloat,
    r8_uint,
    r8g8_uint,
    r8g8b8a8_uint,
    r16_uint,
    r16g16_uint,
    r16g16b16a16_uint,
    r32_uint,
    r32g32_uint,
    r32g32b32a32_uint,
    r8_int,
    r8g8_int,
    r8g8b8a8_int,
    r16_int,
    r16g16_int,
    r16g16b16a16_int,
    r32_int,
    r32g32_int,
    r32g32b32a32_int,
    r8g8b8a8_unorm_srgb,
    b8g8r8a8_unorm_srgb,
    bc1_rgba_unorm_srgb,
    bc2_rgba_unorm_srgb,
    bc3_rgba_unorm_srgb,
    bc7_rgba_unorm_srgb,
    d16_unorm,
    d24_unorm,
    d32_float,
    d24_unorm_s8_uint,
    d32_float_s8_uint,
    astc_4x4_unorm,
    astc_5x4_unorm,
    astc_5x5_unorm,
    astc_6x5_unorm,
    astc_6x6_unorm,
    astc_8x5_unorm,
    astc_8x6_unorm,
    astc_8x8_unorm,
    astc_10x5_unorm,
    astc_10x6_unorm,
    astc_10x8_unorm,
    astc_10x10_unorm,
    astc_12x10_unorm,
    astc_12x12_unorm,
    astc_4x4_unorm_srgb,
    astc_5x4_unorm_srgb,
    astc_5x5_unorm_srgb,
    astc_6x5_unorm_srgb,
    astc_6x6_unorm_srgb,
    astc_8x5_unorm_srgb,
    astc_8x6_unorm_srgb,
    astc_8x8_unorm_srgb,
    astc_10x5_unorm_srgb,
    astc_10x6_unorm_srgb,
    astc_10x8_unorm_srgb,
    astc_10x10_unorm_srgb,
    astc_12x10_unorm_srgb,
    astc_12x12_unorm_srgb,
    astc_4x4_float,
    astc_5x4_float,
    astc_5x5_float,
    astc_6x5_float,
    astc_6x6_float,
    astc_8x5_float,
    astc_8x6_float,
    astc_8x8_float,
    astc_10x5_float,
    astc_10x6_float,
    astc_10x8_float,
    astc_10x10_float,
    astc_12x10_float,
    astc_12x12_float,
};

/// Vertex attribute element formats (`SDL_GPUVertexElementFormat`).
pub const VertexElementFormat = enum(u8) {
    invalid,
    int,
    int2,
    int3,
    int4,
    uint,
    uint2,
    uint3,
    uint4,
    float,
    float2,
    float3,
    float4,
    byte2,
    byte4,
    ubyte2,
    ubyte4,
    byte2_norm,
    byte4_norm,
    ubyte2_norm,
    ubyte4_norm,
    short2,
    short4,
    ushort2,
    ushort4,
    short2_norm,
    short4_norm,
    ushort2_norm,
    ushort4_norm,
    half2,
    half4,
};

pub const PrimitiveType = enum(u8) { triangle_list, triangle_strip, line_list, line_strip, point_list };
pub const LoadOp = enum(u8) { load, clear, dont_care };
pub const StoreOp = enum(u8) { store, dont_care };
pub const IndexElementSize = enum(u8) { bits16, bits32 };
pub const TextureType = enum(u8) { @"2d", @"2d_array", @"3d", cube, cube_array };
pub const SampleCount = enum(u8) { @"1", @"2", @"4", @"8" };
pub const CubeMapFace = enum(u8) { positive_x, negative_x, positive_y, negative_y, positive_z, negative_z };
pub const TransferBufferUsage = enum(u8) { upload, download };
pub const ShaderStage = enum(u8) { vertex, fragment };
pub const VertexInputRate = enum(u8) { vertex, instance };
pub const FillMode = enum(u8) { fill, line };
pub const CullMode = enum(u8) { none, front, back };
pub const FrontFace = enum(u8) { counter_clockwise, clockwise };

/// Comparison operators. SDL's `SDL_GPU_COMPAREOP_INVALID` is not representable;
/// callers choose one of the eight real operators.
pub const CompareOp = enum(u8) { never, less, equal, less_or_equal, greater, not_equal, greater_or_equal, always };

pub const StencilOp = enum(u8) {
    keep,
    zero,
    replace,
    increment_and_clamp,
    decrement_and_clamp,
    invert,
    increment_and_wrap,
    decrement_and_wrap,
};

pub const BlendOp = enum(u8) { add, subtract, reverse_subtract, min, max };

pub const BlendFactor = enum(u8) {
    zero,
    one,
    src_color,
    one_minus_src_color,
    dst_color,
    one_minus_dst_color,
    src_alpha,
    one_minus_src_alpha,
    dst_alpha,
    one_minus_dst_alpha,
    constant_color,
    one_minus_constant_color,
    src_alpha_saturate,
};

pub const Filter = enum(u8) { nearest, linear };
pub const SamplerMipmapMode = enum(u8) { nearest, linear };
pub const SamplerAddressMode = enum(u8) { repeat, mirrored_repeat, clamp_to_edge };

/// Presentation policy: `vsync` is FIFO, `immediate` never waits, `mailbox`
/// keeps the newest frame (requests at least three swapchain images).
pub const PresentMode = enum(u8) { vsync, immediate, mailbox };

pub const SwapchainComposition = enum(u8) { sdr, sdr_linear, hdr_extended_linear, hdr10_st2084 };

// ---------------------------------------------------------------------------
// Flags (packed so the bit positions equal SDL's `(1u << n)` values)
// ---------------------------------------------------------------------------

/// `SDL_GPUTextureUsageFlags`.
pub const TextureUsage = packed struct(u32) {
    sampler: bool = false,
    color_target: bool = false,
    depth_stencil_target: bool = false,
    graphics_storage_read: bool = false,
    compute_storage_read: bool = false,
    compute_storage_write: bool = false,
    /// Reads and writes in the same compute shader. Not equivalent to read|write.
    compute_storage_simultaneous_read_write: bool = false,
    _reserved: u25 = 0,

    pub const none: TextureUsage = .{};

    pub fn bits(self: TextureUsage) u32 {
        return @backingInt(self);
    }
    pub fn from_bits(value: u32) TextureUsage {
        return @fromBackingInt(value);
    }
    pub fn any_storage_write(self: TextureUsage) bool {
        return self.compute_storage_write or self.compute_storage_simultaneous_read_write;
    }
};

/// `SDL_GPUBufferUsageFlags`.
pub const BufferUsage = packed struct(u32) {
    vertex: bool = false,
    index: bool = false,
    indirect: bool = false,
    graphics_storage_read: bool = false,
    compute_storage_read: bool = false,
    compute_storage_write: bool = false,
    _reserved: u26 = 0,

    pub const none: BufferUsage = .{};

    pub fn bits(self: BufferUsage) u32 {
        return @backingInt(self);
    }
    pub fn from_bits(value: u32) BufferUsage {
        return @fromBackingInt(value);
    }
};

/// `SDL_GPUShaderFormat`. An empty set is `SDL_GPU_SHADERFORMAT_INVALID`.
pub const ShaderFormat = packed struct(u32) {
    private: bool = false,
    spirv: bool = false,
    dxbc: bool = false,
    dxil: bool = false,
    msl: bool = false,
    metallib: bool = false,
    _reserved: u26 = 0,

    pub const invalid: ShaderFormat = .{};
};

/// `SDL_GPUColorComponentFlags`.
pub const ColorComponents = packed struct(u8) {
    r: bool = false,
    g: bool = false,
    b: bool = false,
    a: bool = false,
    _reserved: u4 = 0,

    pub const all: ColorComponents = .{ .r = true, .g = true, .b = true, .a = true };
};

// ---------------------------------------------------------------------------
// Small value structs
// ---------------------------------------------------------------------------

/// Float color, equivalent to `SDL_FColor`.
pub const FColor = struct {
    r: f32 = 0,
    g: f32 = 0,
    b: f32 = 0,
    a: f32 = 0,
};

pub const Viewport = struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
    min_depth: f32 = 0,
    max_depth: f32 = 1,
};

/// Texture-side location of a copy: mip, layer and offsets.
pub const TextureLocation = struct {
    mip_level: u32 = 0,
    layer: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    z: u32 = 0,
};

/// A texture-side copy region including its extent.
pub const TextureRegion = struct {
    mip_level: u32 = 0,
    layer: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    z: u32 = 0,
    w: u32,
    h: u32,
    d: u32 = 1,
};

/// Layout of a texture inside a transfer buffer. `pixels_per_row` and
/// `rows_per_layer` describe the tightly packed source image, as in SDL.
pub const TextureTransferInfo = struct {
    offset: u32 = 0,
    pixels_per_row: u32 = 0,
    rows_per_layer: u32 = 0,
};

pub const TransferBufferLocation = struct {
    offset: u32 = 0,
};

pub const BufferLocation = struct {
    offset: u32 = 0,
};

pub const BufferRegion = struct {
    offset: u32 = 0,
    size: u32,
};

pub const BufferBinding = struct {
    offset: u32 = 0,
};

pub const TextureSamplerBinding = struct {
    /// Backend texture and sampler references are bound by the pending pass API.
    texture: *const anyopaque,
    sampler: *const anyopaque,
};

/// `SDL_GPUIndirectDrawCommand`; field order matches the Vulkan indirect struct.
pub const IndirectDrawCommand = struct {
    num_vertices: u32,
    num_instances: u32,
    first_vertex: u32,
    first_instance: u32,
};

pub const IndexedIndirectDrawCommand = struct {
    num_indices: u32,
    num_instances: u32,
    first_index: u32,
    vertex_offset: i32,
    first_instance: u32,
};

pub const IndirectDispatchCommand = struct {
    groupcount_x: u32,
    groupcount_y: u32,
    groupcount_z: u32,
};

// ---------------------------------------------------------------------------
// Create infos
// ---------------------------------------------------------------------------

pub const SamplerCreateInfo = struct {
    min_filter: Filter = .nearest,
    mag_filter: Filter = .nearest,
    mipmap_mode: SamplerMipmapMode = .nearest,
    address_mode_u: SamplerAddressMode = .repeat,
    address_mode_v: SamplerAddressMode = .repeat,
    address_mode_w: SamplerAddressMode = .repeat,
    mip_lod_bias: f32 = 0,
    max_anisotropy: f32 = 1,
    compare_op: CompareOp = .never,
    min_lod: f32 = 0,
    max_lod: f32 = 1000,
    enable_anisotropy: bool = false,
    enable_compare: bool = false,
};

pub const VertexBufferDescription = struct {
    slot: u32,
    pitch: u32,
    input_rate: VertexInputRate = .vertex,
    instance_step_rate: u32 = 0,
};

pub const VertexAttribute = struct {
    location: u32,
    buffer_slot: u32,
    format: VertexElementFormat,
    offset: u32,
};

/// Borrowed vertex layout; slices must outlive pipeline creation only.
pub const VertexInputState = struct {
    vertex_buffer_descriptions: []const VertexBufferDescription = &.{},
    vertex_attributes: []const VertexAttribute = &.{},
};

pub const StencilOpState = struct {
    fail_op: StencilOp = .keep,
    pass_op: StencilOp = .keep,
    depth_fail_op: StencilOp = .keep,
    compare_op: CompareOp = .always,
};

pub const ColorTargetBlendState = struct {
    src_color_blendfactor: BlendFactor = .one,
    dst_color_blendfactor: BlendFactor = .zero,
    color_blend_op: BlendOp = .add,
    src_alpha_blendfactor: BlendFactor = .one,
    dst_alpha_blendfactor: BlendFactor = .zero,
    alpha_blend_op: BlendOp = .add,
    color_write_mask: ColorComponents = ColorComponents.all,
    enable_blend: bool = false,
    enable_color_write_mask: bool = false,
};

/// Shader creation parameters. `code` is the borrowed SPIR-V (or other format)
/// byte stream; the Vulkan backend copies what it needs at creation.
pub const ShaderCreateInfo = struct {
    code: []const u8,
    entrypoint: []const u8 = "main",
    format: ShaderFormat,
    stage: ShaderStage,
    num_samplers: u32 = 0,
    num_storage_textures: u32 = 0,
    num_storage_buffers: u32 = 0,
    num_uniform_buffers: u32 = 0,
};

pub const TextureCreateInfo = struct {
    texture_type: TextureType = .@"2d",
    format: TextureFormat,
    usage: TextureUsage,
    width: u32,
    height: u32,
    /// Layer count for array/cube textures, depth for 3D textures, 1 otherwise.
    layer_count_or_depth: u32 = 1,
    num_levels: u32 = 1,
    sample_count: SampleCount = .@"1",
};

pub const BufferCreateInfo = struct {
    usage: BufferUsage,
    size: u32,
};

pub const TransferBufferCreateInfo = struct {
    usage: TransferBufferUsage,
    size: u32,
};

pub const RasterizerState = struct {
    fill_mode: FillMode = .fill,
    cull_mode: CullMode = .none,
    front_face: FrontFace = .counter_clockwise,
    depth_bias_constant_factor: f32 = 0,
    depth_bias_clamp: f32 = 0,
    depth_bias_slope_factor: f32 = 0,
    enable_depth_bias: bool = false,
    enable_depth_clip: bool = false,
};

pub const MultisampleState = struct {
    sample_count: SampleCount = .@"1",
    sample_mask: u32 = 0,
    enable_mask: bool = false,
    enable_alpha_to_coverage: bool = false,
};

pub const DepthStencilState = struct {
    compare_op: CompareOp = .always,
    back_stencil_state: StencilOpState = .{},
    front_stencil_state: StencilOpState = .{},
    compare_mask: u8 = 0,
    write_mask: u8 = 0,
    enable_depth_test: bool = false,
    enable_depth_write: bool = false,
    enable_stencil_test: bool = false,
};

pub const ColorTargetDescription = struct {
    format: TextureFormat,
    blend_state: ColorTargetBlendState = .{},
};

pub const GraphicsPipelineTargetInfo = struct {
    color_target_descriptions: []const ColorTargetDescription = &.{},
    depth_stencil_format: ?TextureFormat = null,
};

/// Borrowed graphics pipeline description. Shaders are backend handles.
pub const GraphicsPipelineCreateInfo = struct {
    /// Untyped placeholders kept for compatibility. The Vulkan backend takes
    /// typed shaders through `pipeline.GraphicsPipelineInfo`.
    vertex_shader: *const anyopaque,
    fragment_shader: *const anyopaque,
    vertex_input_state: VertexInputState = .{},
    primitive_type: PrimitiveType = .triangle_list,
    rasterizer_state: RasterizerState = .{},
    multisample_state: MultisampleState = .{},
    depth_stencil_state: DepthStencilState = .{},
    target_info: GraphicsPipelineTargetInfo = .{},
};

pub const ComputePipelineCreateInfo = struct {
    code: []const u8,
    entrypoint: []const u8 = "main",
    format: ShaderFormat,
    num_samplers: u32 = 0,
    num_readonly_storage_textures: u32 = 0,
    num_readonly_storage_buffers: u32 = 0,
    num_readwrite_storage_textures: u32 = 0,
    num_readwrite_storage_buffers: u32 = 0,
    num_uniform_buffers: u32 = 0,
    threadcount_x: u32,
    threadcount_y: u32,
    threadcount_z: u32,
};

/// A render-pass color attachment. A null `resolve_texture` disables resolve.
pub const ColorTargetInfo = struct {
    /// Untyped placeholder kept for compatibility. The Vulkan backend takes
    /// typed targets through `pass.ColorTarget`.
    texture: *const anyopaque,
    mip_level: u32 = 0,
    layer_or_depth_plane: u32 = 0,
    clear_color: FColor = .{},
    load_op: LoadOp = .load,
    store_op: StoreOp = .store,
    resolve_texture: ?*const anyopaque = null,
    resolve_mip_level: u32 = 0,
    resolve_layer: u32 = 0,
    cycle: bool = false,
    cycle_resolve_texture: bool = false,
};

pub const DepthStencilTargetInfo = struct {
    /// Untyped placeholder kept for compatibility. The Vulkan backend takes
    /// typed targets through `pass.DepthTarget`.
    texture: *const anyopaque,
    clear_depth: f32 = 1,
    load_op: LoadOp = .load,
    store_op: StoreOp = .store,
    stencil_load_op: LoadOp = .load,
    stencil_store_op: StoreOp = .store,
    cycle: bool = false,
    clear_stencil: u8 = 0,
    mip_level: u8 = 0,
    layer: u8 = 0,
};

// ---------------------------------------------------------------------------
// Format helpers (SDL_gpu.c / SDL_sysgpu.h)
// ---------------------------------------------------------------------------

/// Error from `validate_texture_create_info`, mirroring the debug checks of
/// `SDL_CreateGPUTexture` as typed errors instead of assertions.
pub const ValidationError = error{
    InvalidFormat,
    ZeroDimension,
    ZeroLevels,
    TwoDimensionalLayerCount,
    StorageReadWithSampler,
    MultisampleStorageWrite,
    DepthFormatUsage,
    IntegerFormatSampler,
    DimensionTooLarge,
    CubeNotSquare,
    CubeLayerCount,
    CubeArrayLayerCount,
    CubeMultisample,
    ThreeDimensionalMultisample,
    ThreeDimensionalDepthStencil,
    ArrayMultisample,
    MultisampleMipLevels,
    StorageWriteUnsupported,
};

/// Block footprint in texels. Uncompressed formats are 1x1.
pub const BlockDimensions = struct { width: u32, height: u32 };

/// Returns the texel block footprint (`Texture_GetBlockWidth/Height`). BC
/// formats are 4x4; ASTC formats carry their footprint in the name.
pub fn block_dimensions(format: TextureFormat) BlockDimensions {
    return switch (format) {
        .astc_4x4_unorm, .astc_4x4_unorm_srgb, .astc_4x4_float => .{ .width = 4, .height = 4 },
        .astc_5x4_unorm, .astc_5x4_unorm_srgb, .astc_5x4_float => .{ .width = 5, .height = 4 },
        .astc_5x5_unorm, .astc_5x5_unorm_srgb, .astc_5x5_float => .{ .width = 5, .height = 5 },
        .astc_6x5_unorm, .astc_6x5_unorm_srgb, .astc_6x5_float => .{ .width = 6, .height = 5 },
        .astc_6x6_unorm, .astc_6x6_unorm_srgb, .astc_6x6_float => .{ .width = 6, .height = 6 },
        .astc_8x5_unorm, .astc_8x5_unorm_srgb, .astc_8x5_float => .{ .width = 8, .height = 5 },
        .astc_8x6_unorm, .astc_8x6_unorm_srgb, .astc_8x6_float => .{ .width = 8, .height = 6 },
        .astc_8x8_unorm, .astc_8x8_unorm_srgb, .astc_8x8_float => .{ .width = 8, .height = 8 },
        .astc_10x5_unorm, .astc_10x5_unorm_srgb, .astc_10x5_float => .{ .width = 10, .height = 5 },
        .astc_10x6_unorm, .astc_10x6_unorm_srgb, .astc_10x6_float => .{ .width = 10, .height = 6 },
        .astc_10x8_unorm, .astc_10x8_unorm_srgb, .astc_10x8_float => .{ .width = 10, .height = 8 },
        .astc_10x10_unorm, .astc_10x10_unorm_srgb, .astc_10x10_float => .{ .width = 10, .height = 10 },
        .astc_12x10_unorm, .astc_12x10_unorm_srgb, .astc_12x10_float => .{ .width = 12, .height = 10 },
        .astc_12x12_unorm, .astc_12x12_unorm_srgb, .astc_12x12_float => .{ .width = 12, .height = 12 },
        .bc1_rgba_unorm,
        .bc2_rgba_unorm,
        .bc3_rgba_unorm,
        .bc4_r_unorm,
        .bc5_rg_unorm,
        .bc7_rgba_unorm,
        .bc6h_rgb_float,
        .bc6h_rgb_ufloat,
        .bc1_rgba_unorm_srgb,
        .bc2_rgba_unorm_srgb,
        .bc3_rgba_unorm_srgb,
        .bc7_rgba_unorm_srgb,
        => .{ .width = 4, .height = 4 },
        else => .{ .width = 1, .height = 1 },
    };
}

/// Bytes per texel block (`SDL_GPUTextureFormatTexelBlockSize`). The table
/// matches SDL's switch, including the 5-byte `D32_FLOAT_S8_UINT` entry, which
/// reflects the packed depth+stencil layout rather than a Vulkan texel size.
pub fn texel_block_size(format: TextureFormat) u32 {
    return switch (format) {
        .bc1_rgba_unorm, .bc1_rgba_unorm_srgb, .bc4_r_unorm => 8,
        .bc2_rgba_unorm,
        .bc3_rgba_unorm,
        .bc5_rg_unorm,
        .bc7_rgba_unorm,
        .bc6h_rgb_float,
        .bc6h_rgb_ufloat,
        .bc2_rgba_unorm_srgb,
        .bc3_rgba_unorm_srgb,
        .bc7_rgba_unorm_srgb,
        => 16,
        .r8_unorm, .r8_snorm, .a8_unorm, .r8_uint, .r8_int => 1,
        .b5g6r5_unorm,
        .b4g4r4a4_unorm,
        .b5g5r5a1_unorm,
        .r16_float,
        .r8g8_snorm,
        .r8g8_unorm,
        .r8g8_uint,
        .r8g8_int,
        .r16_unorm,
        .r16_snorm,
        .r16_uint,
        .r16_int,
        .d16_unorm,
        => 2,
        .r8g8b8a8_unorm,
        .b8g8r8a8_unorm,
        .r8g8b8a8_unorm_srgb,
        .b8g8r8a8_unorm_srgb,
        .r32_float,
        .r16g16_float,
        .r11g11b10_ufloat,
        .r8g8b8a8_snorm,
        .r10g10b10a2_unorm,
        .r8g8b8a8_uint,
        .r8g8b8a8_int,
        .r16g16_uint,
        .r16g16_int,
        .r16g16_unorm,
        .r16g16_snorm,
        .d24_unorm,
        .d32_float,
        .r32_uint,
        .r32_int,
        .d24_unorm_s8_uint,
        => 4,
        .d32_float_s8_uint => 5,
        .r16g16b16a16_float,
        .r16g16b16a16_unorm,
        .r16g16b16a16_snorm,
        .r16g16b16a16_uint,
        .r16g16b16a16_int,
        .r32g32_float,
        .r32g32_uint,
        .r32g32_int,
        => 8,
        .r32g32b32a32_float, .r32g32b32a32_int, .r32g32b32a32_uint => 16,
        .invalid => 0,
        // Every ASTC block is 16 bytes regardless of footprint.
        .astc_4x4_unorm,
        .astc_5x4_unorm,
        .astc_5x5_unorm,
        .astc_6x5_unorm,
        .astc_6x6_unorm,
        .astc_8x5_unorm,
        .astc_8x6_unorm,
        .astc_8x8_unorm,
        .astc_10x5_unorm,
        .astc_10x6_unorm,
        .astc_10x8_unorm,
        .astc_10x10_unorm,
        .astc_12x10_unorm,
        .astc_12x12_unorm,
        .astc_4x4_unorm_srgb,
        .astc_5x4_unorm_srgb,
        .astc_5x5_unorm_srgb,
        .astc_6x5_unorm_srgb,
        .astc_6x6_unorm_srgb,
        .astc_8x5_unorm_srgb,
        .astc_8x6_unorm_srgb,
        .astc_8x8_unorm_srgb,
        .astc_10x5_unorm_srgb,
        .astc_10x6_unorm_srgb,
        .astc_10x8_unorm_srgb,
        .astc_10x10_unorm_srgb,
        .astc_12x10_unorm_srgb,
        .astc_12x12_unorm_srgb,
        .astc_4x4_float,
        .astc_5x4_float,
        .astc_5x5_float,
        .astc_6x5_float,
        .astc_6x6_float,
        .astc_8x5_float,
        .astc_8x6_float,
        .astc_8x8_float,
        .astc_10x5_float,
        .astc_10x6_float,
        .astc_10x8_float,
        .astc_10x10_float,
        .astc_12x10_float,
        .astc_12x12_float,
        => 16,
    };
}

/// Byte size of a texture subresource (`SDL_CalculateGPUTextureFormatSize`).
/// Partial blocks at the edges occupy a full block, as in SDL. Result is `u64`.
pub fn calculate_texture_size(format: TextureFormat, width: u32, height: u32, depth_or_layer_count: u32) u64 {
    const block = block_dimensions(format);
    const blocks_per_row: u64 = (@as(u64, width) + block.width - 1) / block.width;
    const blocks_per_column: u64 = (@as(u64, height) + block.height - 1) / block.height;
    return @as(u64, depth_or_layer_count) * blocks_per_row * blocks_per_column * texel_block_size(format);
}

/// True for depth and depth-stencil formats (`IsDepthFormat`).
pub fn is_depth_format(format: TextureFormat) bool {
    return switch (format) {
        .d16_unorm, .d24_unorm, .d32_float, .d24_unorm_s8_uint, .d32_float_s8_uint => true,
        else => false,
    };
}

/// True for formats with a stencil component.
pub fn is_stencil_format(format: TextureFormat) bool {
    return switch (format) {
        .d24_unorm_s8_uint, .d32_float_s8_uint => true,
        else => false,
    };
}

/// True for the 8- and 16-bit integer color formats (`IsIntegerFormat`).
///
/// Confirmed upstream omission, preserved: SDL does not list the 32-bit integer
/// formats here, so a 32-bit integer texture passes the "no sampler on integer
/// formats" check. Vulkan still rejects some of those combinations later.
pub fn is_integer_format(format: TextureFormat) bool {
    return switch (format) {
        .r8_uint,
        .r8g8_uint,
        .r8g8b8a8_uint,
        .r16_uint,
        .r16g16_uint,
        .r16g16b16a16_uint,
        .r8_int,
        .r8g8_int,
        .r8g8b8a8_int,
        .r16_int,
        .r16g16_int,
        .r16g16b16a16_int,
        => true,
        else => false,
    };
}

/// True for BC and ASTC block-compressed formats (`IsCompressedFormat`). Only
/// those formats have a texel footprint larger than 1x1.
pub fn is_block_compressed(format: TextureFormat) bool {
    const block = block_dimensions(format);
    return block.width > 1 or block.height > 1;
}

/// Whether compute shaders may write the format (`TextureFormatIsComputeWritable`).
/// Matches SDL's table: UNORM 8/16 and float/int/uint color formats write; sRGB,
/// packed 16-bit BGR formats, block-compressed, depth and ASTC formats do not.
pub fn is_compute_writable(format: TextureFormat) bool {
    return switch (format) {
        .invalid,
        .a8_unorm,
        .b5g6r5_unorm,
        .b5g5r5a1_unorm,
        .b4g4r4a4_unorm,
        .b8g8r8a8_unorm,
        .bc1_rgba_unorm,
        .bc2_rgba_unorm,
        .bc3_rgba_unorm,
        .bc4_r_unorm,
        .bc5_rg_unorm,
        .bc7_rgba_unorm,
        .bc6h_rgb_float,
        .bc6h_rgb_ufloat,
        .r8g8b8a8_unorm_srgb,
        .b8g8r8a8_unorm_srgb,
        .bc1_rgba_unorm_srgb,
        .bc2_rgba_unorm_srgb,
        .bc3_rgba_unorm_srgb,
        .bc7_rgba_unorm_srgb,
        .d16_unorm,
        .d24_unorm,
        .d32_float,
        .d24_unorm_s8_uint,
        .d32_float_s8_uint,
        => false,
        .astc_4x4_unorm,
        .astc_5x4_unorm,
        .astc_5x5_unorm,
        .astc_6x5_unorm,
        .astc_6x6_unorm,
        .astc_8x5_unorm,
        .astc_8x6_unorm,
        .astc_8x8_unorm,
        .astc_10x5_unorm,
        .astc_10x6_unorm,
        .astc_10x8_unorm,
        .astc_10x10_unorm,
        .astc_12x10_unorm,
        .astc_12x12_unorm,
        .astc_4x4_unorm_srgb,
        .astc_5x4_unorm_srgb,
        .astc_5x5_unorm_srgb,
        .astc_6x5_unorm_srgb,
        .astc_6x6_unorm_srgb,
        .astc_8x5_unorm_srgb,
        .astc_8x6_unorm_srgb,
        .astc_8x8_unorm_srgb,
        .astc_10x5_unorm_srgb,
        .astc_10x6_unorm_srgb,
        .astc_10x8_unorm_srgb,
        .astc_10x10_unorm_srgb,
        .astc_12x10_unorm_srgb,
        .astc_12x12_unorm_srgb,
        .astc_4x4_float,
        .astc_5x4_float,
        .astc_5x5_float,
        .astc_6x5_float,
        .astc_6x6_float,
        .astc_8x5_float,
        .astc_8x6_float,
        .astc_8x8_float,
        .astc_10x5_float,
        .astc_10x6_float,
        .astc_10x8_float,
        .astc_10x10_float,
        .astc_12x10_float,
        .astc_12x12_float,
        => false,
        else => true,
    };
}

/// Number of samples per texel.
pub fn sample_count_value(count: SampleCount) u32 {
    return switch (count) {
        .@"1" => 1,
        .@"2" => 2,
        .@"4" => 4,
        .@"8" => 8,
    };
}

/// Full mip chain length for a texture extent: `1 + floor(log2(max extent))`.
/// SDL has no such helper; it is provided for callers that size chains.
pub fn max_mip_levels(width: u32, height: u32, depth: u32) u32 {
    const largest = @max(width, @max(height, depth));
    if (largest == 0) return 0;
    return @as(u32, std.math.log2_int(u32, largest)) + 1;
}

/// Checks the structural rules `SDL_CreateGPUTexture` asserts in debug builds.
/// Device-dependent support (`SDL_GPUTextureSupportsFormat`) is checked by the
/// backend, after this returns.
pub fn validate_texture_create_info(info: TextureCreateInfo) ValidationError!void {
    if (info.format == .invalid) return error.InvalidFormat;
    if (info.width == 0 or info.height == 0 or info.layer_count_or_depth == 0) return error.ZeroDimension;
    if (info.num_levels == 0) return error.ZeroLevels;
    const samples = sample_count_value(info.sample_count);
    const usage = info.usage;

    if (info.texture_type == .@"2d" and info.layer_count_or_depth != 1) return error.TwoDimensionalLayerCount;
    if (usage.graphics_storage_read and usage.sampler) return error.StorageReadWithSampler;
    if (samples > 1 and usage.compute_storage_write) return error.MultisampleStorageWrite;
    if (usage.any_storage_write() and !is_compute_writable(info.format)) return error.StorageWriteUnsupported;
    if (is_depth_format(info.format)) {
        const allowed: u32 = (TextureUsage{ .depth_stencil_target = true, .sampler = true }).bits();
        if (usage.bits() & ~allowed != 0) return error.DepthFormatUsage;
    }
    if (is_integer_format(info.format) and usage.sampler) return error.IntegerFormatSampler;

    switch (info.texture_type) {
        .cube, .cube_array => {
            if (info.width != info.height) return error.CubeNotSquare;
            if (info.width > 16384 or info.height > 16384) return error.DimensionTooLarge;
            if (info.texture_type == .cube and info.layer_count_or_depth != 6) return error.CubeLayerCount;
            if (info.texture_type == .cube_array and info.layer_count_or_depth % 6 != 0) return error.CubeArrayLayerCount;
            if (samples > 1) return error.CubeMultisample;
        },
        .@"3d" => {
            if (info.width > 2048 or info.height > 2048 or info.layer_count_or_depth > 2048) return error.DimensionTooLarge;
            if (usage.depth_stencil_target) return error.ThreeDimensionalDepthStencil;
            if (samples > 1) return error.ThreeDimensionalMultisample;
        },
        .@"2d", .@"2d_array" => {
            if (info.texture_type == .@"2d_array" and samples > 1) return error.ArrayMultisample;
            if (info.width > 16384 or info.height > 16384) return error.DimensionTooLarge;
            if (samples > 1 and info.num_levels > 1) return error.MultisampleMipLevels;
        },
    }
}
