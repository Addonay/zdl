//! Lookup tables from SDL's Vulkan backend (SDL_gpu_vulkan.c) that map GPU API
//! enums to Vulkan values. Each table is indexed by `@backingInt` of the Zig
//! enum; the generated entries follow SDL's order, which the enums in
//! `../types.zig` reproduce. Private to the Vulkan backend.
//!
//! Upstream comment note: SDL labels `VK_FORMAT_BC2_SRGB_BLOCK` as "BC3_UNORM_SRGB"
//! in SDLToVK_TextureFormat. The value is correct for the BC2 sRGB slot, which is
//! the position used here; only the comment is wrong.

const vk = @import("binding.zig");
const types = @import("../types.zig");

pub const texture_formats = [_]vk.Format{
    vk.VK_FORMAT_UNDEFINED, // INVALID
    vk.VK_FORMAT_R8_UNORM, // A8_UNORM
    vk.VK_FORMAT_R8_UNORM, // R8_UNORM
    vk.VK_FORMAT_R8G8_UNORM, // R8G8_UNORM
    vk.VK_FORMAT_R8G8B8A8_UNORM, // R8G8B8A8_UNORM
    vk.VK_FORMAT_R16_UNORM, // R16_UNORM
    vk.VK_FORMAT_R16G16_UNORM, // R16G16_UNORM
    vk.VK_FORMAT_R16G16B16A16_UNORM, // R16G16B16A16_UNORM
    vk.VK_FORMAT_A2B10G10R10_UNORM_PACK32, // R10G10B10A2_UNORM
    vk.VK_FORMAT_R5G6B5_UNORM_PACK16, // B5G6R5_UNORM
    vk.VK_FORMAT_A1R5G5B5_UNORM_PACK16, // B5G5R5A1_UNORM
    vk.VK_FORMAT_B4G4R4A4_UNORM_PACK16, // B4G4R4A4_UNORM
    vk.VK_FORMAT_B8G8R8A8_UNORM, // B8G8R8A8_UNORM
    vk.VK_FORMAT_BC1_RGBA_UNORM_BLOCK, // BC1_UNORM
    vk.VK_FORMAT_BC2_UNORM_BLOCK, // BC2_UNORM
    vk.VK_FORMAT_BC3_UNORM_BLOCK, // BC3_UNORM
    vk.VK_FORMAT_BC4_UNORM_BLOCK, // BC4_UNORM
    vk.VK_FORMAT_BC5_UNORM_BLOCK, // BC5_UNORM
    vk.VK_FORMAT_BC7_UNORM_BLOCK, // BC7_UNORM
    vk.VK_FORMAT_BC6H_SFLOAT_BLOCK, // BC6H_FLOAT
    vk.VK_FORMAT_BC6H_UFLOAT_BLOCK, // BC6H_UFLOAT
    vk.VK_FORMAT_R8_SNORM, // R8_SNORM
    vk.VK_FORMAT_R8G8_SNORM, // R8G8_SNORM
    vk.VK_FORMAT_R8G8B8A8_SNORM, // R8G8B8A8_SNORM
    vk.VK_FORMAT_R16_SNORM, // R16_SNORM
    vk.VK_FORMAT_R16G16_SNORM, // R16G16_SNORM
    vk.VK_FORMAT_R16G16B16A16_SNORM, // R16G16B16A16_SNORM
    vk.VK_FORMAT_R16_SFLOAT, // R16_FLOAT
    vk.VK_FORMAT_R16G16_SFLOAT, // R16G16_FLOAT
    vk.VK_FORMAT_R16G16B16A16_SFLOAT, // R16G16B16A16_FLOAT
    vk.VK_FORMAT_R32_SFLOAT, // R32_FLOAT
    vk.VK_FORMAT_R32G32_SFLOAT, // R32G32_FLOAT
    vk.VK_FORMAT_R32G32B32A32_SFLOAT, // R32G32B32A32_FLOAT
    vk.VK_FORMAT_B10G11R11_UFLOAT_PACK32, // R11G11B10_UFLOAT
    vk.VK_FORMAT_R8_UINT, // R8_UINT
    vk.VK_FORMAT_R8G8_UINT, // R8G8_UINT
    vk.VK_FORMAT_R8G8B8A8_UINT, // R8G8B8A8_UINT
    vk.VK_FORMAT_R16_UINT, // R16_UINT
    vk.VK_FORMAT_R16G16_UINT, // R16G16_UINT
    vk.VK_FORMAT_R16G16B16A16_UINT, // R16G16B16A16_UINT
    vk.VK_FORMAT_R32_UINT, // R32_UINT
    vk.VK_FORMAT_R32G32_UINT, // R32G32_UINT
    vk.VK_FORMAT_R32G32B32A32_UINT, // R32G32B32A32_UINT
    vk.VK_FORMAT_R8_SINT, // R8_INT
    vk.VK_FORMAT_R8G8_SINT, // R8G8_INT
    vk.VK_FORMAT_R8G8B8A8_SINT, // R8G8B8A8_INT
    vk.VK_FORMAT_R16_SINT, // R16_INT
    vk.VK_FORMAT_R16G16_SINT, // R16G16_INT
    vk.VK_FORMAT_R16G16B16A16_SINT, // R16G16B16A16_INT
    vk.VK_FORMAT_R32_SINT, // R32_INT
    vk.VK_FORMAT_R32G32_SINT, // R32G32_INT
    vk.VK_FORMAT_R32G32B32A32_SINT, // R32G32B32A32_INT
    vk.VK_FORMAT_R8G8B8A8_SRGB, // R8G8B8A8_UNORM_SRGB
    vk.VK_FORMAT_B8G8R8A8_SRGB, // B8G8R8A8_UNORM_SRGB
    vk.VK_FORMAT_BC1_RGBA_SRGB_BLOCK, // BC1_UNORM_SRGB
    vk.VK_FORMAT_BC2_SRGB_BLOCK, // BC3_UNORM_SRGB
    vk.VK_FORMAT_BC3_SRGB_BLOCK, // BC3_UNORM_SRGB
    vk.VK_FORMAT_BC7_SRGB_BLOCK, // BC7_UNORM_SRGB
    vk.VK_FORMAT_D16_UNORM, // D16_UNORM
    vk.VK_FORMAT_X8_D24_UNORM_PACK32, // D24_UNORM
    vk.VK_FORMAT_D32_SFLOAT, // D32_FLOAT
    vk.VK_FORMAT_D24_UNORM_S8_UINT, // D24_UNORM_S8_UINT
    vk.VK_FORMAT_D32_SFLOAT_S8_UINT, // D32_FLOAT_S8_UINT
    vk.VK_FORMAT_ASTC_4x4_UNORM_BLOCK, // ASTC_4x4_UNORM
    vk.VK_FORMAT_ASTC_5x4_UNORM_BLOCK, // ASTC_5x4_UNORM
    vk.VK_FORMAT_ASTC_5x5_UNORM_BLOCK, // ASTC_5x5_UNORM
    vk.VK_FORMAT_ASTC_6x5_UNORM_BLOCK, // ASTC_6x5_UNORM
    vk.VK_FORMAT_ASTC_6x6_UNORM_BLOCK, // ASTC_6x6_UNORM
    vk.VK_FORMAT_ASTC_8x5_UNORM_BLOCK, // ASTC_8x5_UNORM
    vk.VK_FORMAT_ASTC_8x6_UNORM_BLOCK, // ASTC_8x6_UNORM
    vk.VK_FORMAT_ASTC_8x8_UNORM_BLOCK, // ASTC_8x8_UNORM
    vk.VK_FORMAT_ASTC_10x5_UNORM_BLOCK, // ASTC_10x5_UNORM
    vk.VK_FORMAT_ASTC_10x6_UNORM_BLOCK, // ASTC_10x6_UNORM
    vk.VK_FORMAT_ASTC_10x8_UNORM_BLOCK, // ASTC_10x8_UNORM
    vk.VK_FORMAT_ASTC_10x10_UNORM_BLOCK, // ASTC_10x10_UNORM
    vk.VK_FORMAT_ASTC_12x10_UNORM_BLOCK, // ASTC_12x10_UNORM
    vk.VK_FORMAT_ASTC_12x12_UNORM_BLOCK, // ASTC_12x12_UNORM
    vk.VK_FORMAT_ASTC_4x4_SRGB_BLOCK, // ASTC_4x4_UNORM_SRGB
    vk.VK_FORMAT_ASTC_5x4_SRGB_BLOCK, // ASTC_5x4_UNORM_SRGB
    vk.VK_FORMAT_ASTC_5x5_SRGB_BLOCK, // ASTC_5x5_UNORM_SRGB
    vk.VK_FORMAT_ASTC_6x5_SRGB_BLOCK, // ASTC_6x5_UNORM_SRGB
    vk.VK_FORMAT_ASTC_6x6_SRGB_BLOCK, // ASTC_6x6_UNORM_SRGB
    vk.VK_FORMAT_ASTC_8x5_SRGB_BLOCK, // ASTC_8x5_UNORM_SRGB
    vk.VK_FORMAT_ASTC_8x6_SRGB_BLOCK, // ASTC_8x6_UNORM_SRGB
    vk.VK_FORMAT_ASTC_8x8_SRGB_BLOCK, // ASTC_8x8_UNORM_SRGB
    vk.VK_FORMAT_ASTC_10x5_SRGB_BLOCK, // ASTC_10x5_UNORM_SRGB
    vk.VK_FORMAT_ASTC_10x6_SRGB_BLOCK, // ASTC_10x6_UNORM_SRGB
    vk.VK_FORMAT_ASTC_10x8_SRGB_BLOCK, // ASTC_10x8_UNORM_SRGB
    vk.VK_FORMAT_ASTC_10x10_SRGB_BLOCK, // ASTC_10x10_UNORM_SRGB
    vk.VK_FORMAT_ASTC_12x10_SRGB_BLOCK, // ASTC_12x10_UNORM_SRGB
    vk.VK_FORMAT_ASTC_12x12_SRGB_BLOCK, // ASTC_12x12_UNORM_SRGB
    vk.VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT, // ASTC_4x4_FLOAT
    vk.VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT, // ASTC_5x4_FLOAT
    vk.VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT, // ASTC_5x5_FLOAT
    vk.VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT, // ASTC_6x5_FLOAT
    vk.VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT, // ASTC_6x6_FLOAT
    vk.VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT, // ASTC_8x5_FLOAT
    vk.VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT, // ASTC_8x6_FLOAT
    vk.VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT, // ASTC_8x8_FLOAT
    vk.VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT, // ASTC_10x5_FLOAT
    vk.VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT, // ASTC_10x6_FLOAT
    vk.VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT, // ASTC_10x8_FLOAT
    vk.VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT, // ASTC_10x10_FLOAT
    vk.VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT, // ASTC_12x10_FLOAT
    vk.VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK, // ASTC_12x12_FLOAT
};
/// `VkFormat` for each `types.VertexElementFormat`, in enum order.
pub const vertex_formats = [_]vk.Format{
    vk.VK_FORMAT_UNDEFINED, // INVALID
    vk.VK_FORMAT_R32_SINT, // INT
    vk.VK_FORMAT_R32G32_SINT, // INT2
    vk.VK_FORMAT_R32G32B32_SINT, // INT3
    vk.VK_FORMAT_R32G32B32A32_SINT, // INT4
    vk.VK_FORMAT_R32_UINT, // UINT
    vk.VK_FORMAT_R32G32_UINT, // UINT2
    vk.VK_FORMAT_R32G32B32_UINT, // UINT3
    vk.VK_FORMAT_R32G32B32A32_UINT, // UINT4
    vk.VK_FORMAT_R32_SFLOAT, // FLOAT
    vk.VK_FORMAT_R32G32_SFLOAT, // FLOAT2
    vk.VK_FORMAT_R32G32B32_SFLOAT, // FLOAT3
    vk.VK_FORMAT_R32G32B32A32_SFLOAT, // FLOAT4
    vk.VK_FORMAT_R8G8_SINT, // BYTE2
    vk.VK_FORMAT_R8G8B8A8_SINT, // BYTE4
    vk.VK_FORMAT_R8G8_UINT, // UBYTE2
    vk.VK_FORMAT_R8G8B8A8_UINT, // UBYTE4
    vk.VK_FORMAT_R8G8_SNORM, // BYTE2_NORM
    vk.VK_FORMAT_R8G8B8A8_SNORM, // BYTE4_NORM
    vk.VK_FORMAT_R8G8_UNORM, // UBYTE2_NORM
    vk.VK_FORMAT_R8G8B8A8_UNORM, // UBYTE4_NORM
    vk.VK_FORMAT_R16G16_SINT, // SHORT2
    vk.VK_FORMAT_R16G16B16A16_SINT, // SHORT4
    vk.VK_FORMAT_R16G16_UINT, // USHORT2
    vk.VK_FORMAT_R16G16B16A16_UINT, // USHORT4
    vk.VK_FORMAT_R16G16_SNORM, // SHORT2_NORM
    vk.VK_FORMAT_R16G16B16A16_SNORM, // SHORT4_NORM
    vk.VK_FORMAT_R16G16_UNORM, // USHORT2_NORM
    vk.VK_FORMAT_R16G16B16A16_UNORM, // USHORT4_NORM
    vk.VK_FORMAT_R16G16_SFLOAT, // HALF2
    vk.VK_FORMAT_R16G16B16A16_SFLOAT, // HALF4
};

/// Swapchain composition to the preferred swapchain format.
pub const composition_format = [_]vk.Format{
    vk.VK_FORMAT_B8G8R8A8_UNORM, // sdr
    vk.VK_FORMAT_B8G8R8A8_SRGB, // sdr_linear
    vk.VK_FORMAT_R16G16B16A16_SFLOAT, // hdr_extended_linear
    vk.VK_FORMAT_A2B10G10R10_UNORM_PACK32, // hdr10_st2084
};

/// Fallback when the surface lacks the preferred format; `undefined` has no fallback.
pub const composition_fallback_format = [_]vk.Format{
    vk.VK_FORMAT_R8G8B8A8_UNORM,
    vk.VK_FORMAT_R8G8B8A8_SRGB,
    vk.VK_FORMAT_UNDEFINED,
    vk.VK_FORMAT_UNDEFINED,
};

pub const composition_color_space = [_]i32{
    vk.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
    vk.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
    vk.VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT,
    vk.VK_COLOR_SPACE_HDR10_ST2084_EXT,
};

/// Swapchain format the texture API reports for each composition and fallback.
pub fn composition_texture_format(composition: types.SwapchainComposition, fallback: bool) types.TextureFormat {
    return switch (composition) {
        .sdr => if (fallback) .r8g8b8a8_unorm else .b8g8r8a8_unorm,
        .sdr_linear => if (fallback) .r8g8b8a8_unorm_srgb else .b8g8r8a8_unorm_srgb,
        .hdr_extended_linear => .r16g16b16a16_float,
        .hdr10_st2084 => .r10g10b10a2_unorm,
    };
}

/// Present mode to `VkPresentModeKHR`.
pub const present_mode = [_]i32{
    vk.VK_PRESENT_MODE_FIFO_KHR, // vsync
    vk.VK_PRESENT_MODE_IMMEDIATE_KHR, // immediate
    vk.VK_PRESENT_MODE_MAILBOX_KHR, // mailbox
};

pub const primitive_topology = [_]i32{
    vk.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
    vk.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP,
    vk.VK_PRIMITIVE_TOPOLOGY_LINE_LIST,
    vk.VK_PRIMITIVE_TOPOLOGY_LINE_STRIP,
    vk.VK_PRIMITIVE_TOPOLOGY_POINT_LIST,
};

pub const vertex_input_rate = [_]i32{ vk.VK_VERTEX_INPUT_RATE_VERTEX, vk.VK_VERTEX_INPUT_RATE_INSTANCE };
pub const sample_count_bits = [_]vk.Flags{ vk.VK_SAMPLE_COUNT_1_BIT, vk.VK_SAMPLE_COUNT_2_BIT, vk.VK_SAMPLE_COUNT_4_BIT, vk.VK_SAMPLE_COUNT_8_BIT };
pub const filter = [_]i32{ vk.VK_FILTER_NEAREST, vk.VK_FILTER_LINEAR };
pub const mipmap_mode = [_]i32{ vk.VK_SAMPLER_MIPMAP_MODE_NEAREST, vk.VK_SAMPLER_MIPMAP_MODE_LINEAR };
pub const address_mode = [_]i32{
    vk.VK_SAMPLER_ADDRESS_MODE_REPEAT,
    vk.VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT,
    vk.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
};
pub const compare_op = [_]i32{
    vk.VK_COMPARE_OP_NEVER,
    vk.VK_COMPARE_OP_LESS,
    vk.VK_COMPARE_OP_EQUAL,
    vk.VK_COMPARE_OP_LESS_OR_EQUAL,
    vk.VK_COMPARE_OP_GREATER,
    vk.VK_COMPARE_OP_NOT_EQUAL,
    vk.VK_COMPARE_OP_GREATER_OR_EQUAL,
    vk.VK_COMPARE_OP_ALWAYS,
};
pub const stencil_op = [_]i32{
    vk.VK_STENCIL_OP_KEEP,
    vk.VK_STENCIL_OP_ZERO,
    vk.VK_STENCIL_OP_REPLACE,
    vk.VK_STENCIL_OP_INCREMENT_AND_CLAMP,
    vk.VK_STENCIL_OP_DECREMENT_AND_CLAMP,
    vk.VK_STENCIL_OP_INVERT,
    vk.VK_STENCIL_OP_INCREMENT_AND_WRAP,
    vk.VK_STENCIL_OP_DECREMENT_AND_WRAP,
};
pub const blend_op = [_]i32{ vk.VK_BLEND_OP_ADD, vk.VK_BLEND_OP_SUBTRACT, vk.VK_BLEND_OP_REVERSE_SUBTRACT, vk.VK_BLEND_OP_MIN, vk.VK_BLEND_OP_MAX };
pub const blend_factor = [_]i32{
    vk.VK_BLEND_FACTOR_ZERO,
    vk.VK_BLEND_FACTOR_ONE,
    vk.VK_BLEND_FACTOR_SRC_COLOR,
    vk.VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR,
    vk.VK_BLEND_FACTOR_DST_COLOR,
    vk.VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR,
    vk.VK_BLEND_FACTOR_SRC_ALPHA,
    vk.VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA,
    vk.VK_BLEND_FACTOR_DST_ALPHA,
    vk.VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA,
    vk.VK_BLEND_FACTOR_CONSTANT_COLOR,
    vk.VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR,
    vk.VK_BLEND_FACTOR_SRC_ALPHA_SATURATE,
};

/// Component swizzle SDL applies to a format. A8 keeps its value in alpha on
/// the `R8_UNORM` image; B4G4R4A4 is stored ARGB and swaps into BGRA order.
pub fn format_swizzle(format: types.TextureFormat) vk.ComponentMapping {
    return switch (format) {
        .a8_unorm => .{ .r = vk.VK_COMPONENT_SWIZZLE_ZERO, .g = vk.VK_COMPONENT_SWIZZLE_ZERO, .b = vk.VK_COMPONENT_SWIZZLE_ZERO, .a = vk.VK_COMPONENT_SWIZZLE_R },
        .b4g4r4a4_unorm => .{ .r = vk.VK_COMPONENT_SWIZZLE_G, .g = vk.VK_COMPONENT_SWIZZLE_R, .b = vk.VK_COMPONENT_SWIZZLE_A, .a = vk.VK_COMPONENT_SWIZZLE_B },
        else => identity_swizzle,
    };
}

pub const identity_swizzle: vk.ComponentMapping = .{
    .r = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
    .g = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
    .b = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
    .a = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
};

/// `VkFormat` for a texture format, `VK_FORMAT_UNDEFINED` for `invalid`.
pub fn texture_format(format: types.TextureFormat) vk.Format {
    return texture_formats[@backingInt(format)];
}

pub fn vertex_format(format: types.VertexElementFormat) vk.Format {
    return vertex_formats[@backingInt(format)];
}

/// `VkPolygonMode` for `FillMode` (fill, line).
pub const polygon_mode = [_]i32{ vk.VK_POLYGON_MODE_FILL, vk.VK_POLYGON_MODE_LINE };
/// `VkCullModeFlags` for `CullMode` (none, front, back).
pub const cull_mode = [_]vk.Flags{ vk.VK_CULL_MODE_NONE, vk.VK_CULL_MODE_FRONT_BIT, vk.VK_CULL_MODE_BACK_BIT };
/// `VkFrontFace` for `FrontFace` (counter-clockwise, clockwise).
pub const front_face = [_]i32{ vk.VK_FRONT_FACE_COUNTER_CLOCKWISE, vk.VK_FRONT_FACE_CLOCKWISE };
/// `VkAttachmentLoadOp` for `LoadOp` (load, clear, dont-care).
pub const load_op = [_]i32{ vk.VK_ATTACHMENT_LOAD_OP_LOAD, vk.VK_ATTACHMENT_LOAD_OP_CLEAR, vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE };
/// `VkAttachmentStoreOp` for `StoreOp` (store, dont-care).
pub const store_op = [_]i32{ vk.VK_ATTACHMENT_STORE_OP_STORE, vk.VK_ATTACHMENT_STORE_OP_DONT_CARE };
/// `VkIndexType` for `IndexElementSize` (16-bit, 32-bit).
pub const index_type = [_]i32{ vk.VK_INDEX_TYPE_UINT16, vk.VK_INDEX_TYPE_UINT32 };
/// Byte size of one index for `IndexElementSize`.
pub const index_size = [_]u32{ 2, 4 };
