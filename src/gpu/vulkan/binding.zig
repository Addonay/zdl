//! Private Vulkan binding. This is the only file in `src/gpu/` that declares C
//! types, calls C function pointers or loads a shared library. Every other GPU
//! module uses the idiomatic API built in `device.zig`.
//!
//! `libvulkan.so.1` is opened at runtime with `std.DynLib`, following the ALSA
//! and libdbus loaders, so zdl links nothing at build time and a missing loader
//! fails with an error instead of aborting the process. Only the entry points the
//! Vulkan backend calls are declared. Functions are resolved in two levels:
//! `vkGetInstanceProcAddr(null, ...)` for global functions, then
//! `vkGetInstanceProcAddr(instance, ...)` and `vkGetDeviceProcAddr(device, ...)`
//! for the rest, so device calls dispatch straight to the driver.
//!
//! The C-layout records are transcribed from the Vulkan header in
//! `/usr/include/vulkan/vulkan_core.h`. The large records (`PhysicalDeviceFeatures`,
//! `PhysicalDeviceLimits`, the memory-property and surface records) are generated
//! mechanically from that header, so field order and size match it. Names keep
//! the C spelling because layout is the contract. No type here leaves the
//! `vulkan` backend.
//!
//! Handles: dispatchable handles (instance, physical device, device, queue,
//! command buffer) are opaque pointers; non-dispatchable handles are 64-bit
//! integers, as in the Vulkan ABI on 64-bit targets.

const std = @import("std");

/// `VkBool32`.
pub const Bool32 = u32;
/// `VkFlags`.
pub const Flags = u32;
/// `VkDeviceSize`.
pub const DeviceSize = u64;
/// `VkResult` as its raw C value; negative values are errors.
pub const Result = i32;

pub const Instance = ?*anyopaque;
pub const PhysicalDevice = ?*anyopaque;
pub const Device = ?*anyopaque;
pub const Queue = ?*anyopaque;
pub const CommandBuffer = ?*anyopaque;
/// Non-dispatchable handles: buffers, images, views, samplers, shader modules,
/// pools, fences, semaphores, memory and swapchains. `0` is `VK_NULL_HANDLE`.
pub const Handle = u64;

/// Generic `PFN_vkVoidFunction`.
pub const PfnVoid = *const fn () callconv(.c) void;

// ---------------------------------------------------------------------------
// Result codes and error mapping
// ---------------------------------------------------------------------------

pub const VK_SUCCESS: Result = 0;
pub const VK_NOT_READY: Result = 1;
pub const VK_TIMEOUT: Result = 2;
pub const VK_EVENT_SET: Result = 3;
pub const VK_EVENT_RESET: Result = 4;
pub const VK_INCOMPLETE: Result = 5;
pub const VK_ERROR_OUT_OF_HOST_MEMORY: Result = -1;
pub const VK_ERROR_OUT_OF_DEVICE_MEMORY: Result = -2;
pub const VK_ERROR_INITIALIZATION_FAILED: Result = -3;
pub const VK_ERROR_DEVICE_LOST: Result = -4;
pub const VK_ERROR_MEMORY_MAP_FAILED: Result = -5;
pub const VK_ERROR_LAYER_NOT_PRESENT: Result = -6;
pub const VK_ERROR_EXTENSION_NOT_PRESENT: Result = -7;
pub const VK_ERROR_FEATURE_NOT_PRESENT: Result = -8;
pub const VK_ERROR_INCOMPATIBLE_DRIVER: Result = -9;
pub const VK_ERROR_TOO_MANY_OBJECTS: Result = -10;
pub const VK_ERROR_FORMAT_NOT_SUPPORTED: Result = -11;
pub const VK_ERROR_FRAGMENTED_POOL: Result = -12;
pub const VK_ERROR_UNKNOWN: Result = -13;
pub const VK_ERROR_VALIDATION_FAILED: Result = -1000011001;
pub const VK_ERROR_SURFACE_LOST_KHR: Result = -1000000000;
pub const VK_ERROR_NATIVE_WINDOW_IN_USE_KHR: Result = -1000000001;
pub const VK_SUBOPTIMAL_KHR: Result = 1000001003;
pub const VK_ERROR_OUT_OF_DATE_KHR: Result = -1000001004;
pub const VK_ERROR_INCOMPATIBLE_DISPLAY_KHR: Result = -1000003001;
pub const VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT: Result = -1000255000;

/// Errors surfaced from negative `VkResult` codes.
pub const VulkanError = error{
    OutOfHostMemory,
    OutOfDeviceMemory,
    InitializationFailed,
    DeviceLost,
    MemoryMapFailed,
    LayerNotPresent,
    ExtensionNotPresent,
    FeatureNotPresent,
    IncompatibleDriver,
    TooManyObjects,
    FormatNotSupported,
    FragmentedPool,
    Unknown,
    ValidationFailed,
    SurfaceLost,
    NativeWindowInUse,
    IncompatibleDisplay,
    FullScreenExclusiveModeLost,
    UnexpectedResult,
};

/// Converts a `VkResult` into an error. Non-negative codes, including
/// `VK_NOT_READY`, `VK_TIMEOUT` and `VK_SUBOPTIMAL_KHR`, return unchanged so the
/// caller can act on them.
pub fn check(result: Result) VulkanError!Result {
    if (result >= 0) return result;
    return switch (result) {
        VK_ERROR_OUT_OF_HOST_MEMORY => error.OutOfHostMemory,
        VK_ERROR_OUT_OF_DEVICE_MEMORY => error.OutOfDeviceMemory,
        VK_ERROR_INITIALIZATION_FAILED => error.InitializationFailed,
        VK_ERROR_DEVICE_LOST => error.DeviceLost,
        VK_ERROR_MEMORY_MAP_FAILED => error.MemoryMapFailed,
        VK_ERROR_LAYER_NOT_PRESENT => error.LayerNotPresent,
        VK_ERROR_EXTENSION_NOT_PRESENT => error.ExtensionNotPresent,
        VK_ERROR_FEATURE_NOT_PRESENT => error.FeatureNotPresent,
        VK_ERROR_INCOMPATIBLE_DRIVER => error.IncompatibleDriver,
        VK_ERROR_TOO_MANY_OBJECTS => error.TooManyObjects,
        VK_ERROR_FORMAT_NOT_SUPPORTED => error.FormatNotSupported,
        VK_ERROR_FRAGMENTED_POOL => error.FragmentedPool,
        VK_ERROR_UNKNOWN => error.Unknown,
        VK_ERROR_VALIDATION_FAILED => error.ValidationFailed,
        VK_ERROR_SURFACE_LOST_KHR => error.SurfaceLost,
        VK_ERROR_NATIVE_WINDOW_IN_USE_KHR => error.NativeWindowInUse,
        VK_ERROR_INCOMPATIBLE_DISPLAY_KHR => error.IncompatibleDisplay,
        VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT => error.FullScreenExclusiveModeLost,
        else => error.UnexpectedResult,
    };
}

// ---------------------------------------------------------------------------
// Enumerations and flags used by the backend (raw values)
// ---------------------------------------------------------------------------

pub const VK_STRUCTURE_TYPE_APPLICATION_INFO: i32 = 0;
pub const VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO: i32 = 1;
pub const VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO: i32 = 2;
pub const VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO: i32 = 3;
pub const VK_STRUCTURE_TYPE_SUBMIT_INFO: i32 = 4;
pub const VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO: i32 = 5;
pub const VK_STRUCTURE_TYPE_FENCE_CREATE_INFO: i32 = 8;
pub const VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO: i32 = 9;
pub const VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO: i32 = 12;
pub const VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO: i32 = 14;
pub const VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO: i32 = 15;
pub const VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO: i32 = 16;
pub const VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO: i32 = 31;
pub const VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO: i32 = 39;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO: i32 = 40;
pub const VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO: i32 = 42;
pub const VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER: i32 = 44;
pub const VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER: i32 = 45;
pub const VK_STRUCTURE_TYPE_MEMORY_BARRIER: i32 = 46;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2: i32 = 1000059001;
pub const VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES: i32 = 1000196000;
pub const VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR: i32 = 1000001000;
pub const VK_STRUCTURE_TYPE_PRESENT_INFO_KHR: i32 = 1000001001;

pub const VK_IMAGE_LAYOUT_UNDEFINED: i32 = 0;
pub const VK_IMAGE_LAYOUT_GENERAL: i32 = 1;
pub const VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL: i32 = 2;
pub const VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL: i32 = 3;
pub const VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL: i32 = 4;
pub const VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL: i32 = 5;
pub const VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL: i32 = 6;
pub const VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL: i32 = 7;
pub const VK_IMAGE_LAYOUT_PRESENT_SRC_KHR: i32 = 1000001002;

pub const VK_IMAGE_USAGE_TRANSFER_SRC_BIT: Flags = 0x1;
pub const VK_IMAGE_USAGE_TRANSFER_DST_BIT: Flags = 0x2;
pub const VK_IMAGE_USAGE_SAMPLED_BIT: Flags = 0x4;
pub const VK_IMAGE_USAGE_STORAGE_BIT: Flags = 0x8;
pub const VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT: Flags = 0x10;
pub const VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT: Flags = 0x20;

pub const VK_BUFFER_USAGE_TRANSFER_SRC_BIT: Flags = 0x1;
pub const VK_BUFFER_USAGE_TRANSFER_DST_BIT: Flags = 0x2;
pub const VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT: Flags = 0x10;
pub const VK_BUFFER_USAGE_STORAGE_BUFFER_BIT: Flags = 0x20;
pub const VK_BUFFER_USAGE_INDEX_BUFFER_BIT: Flags = 0x40;
pub const VK_BUFFER_USAGE_VERTEX_BUFFER_BIT: Flags = 0x80;
pub const VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT: Flags = 0x100;

pub const VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT: Flags = 0x1;
pub const VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT: Flags = 0x2;
pub const VK_MEMORY_PROPERTY_HOST_COHERENT_BIT: Flags = 0x4;
pub const VK_MEMORY_PROPERTY_HOST_CACHED_BIT: Flags = 0x8;
pub const VK_MEMORY_HEAP_DEVICE_LOCAL_BIT: Flags = 0x1;

pub const VK_QUEUE_GRAPHICS_BIT: Flags = 0x1;
pub const VK_QUEUE_COMPUTE_BIT: Flags = 0x2;
pub const VK_QUEUE_TRANSFER_BIT: Flags = 0x4;

pub const VK_IMAGE_ASPECT_COLOR_BIT: Flags = 0x1;
pub const VK_IMAGE_ASPECT_DEPTH_BIT: Flags = 0x2;
pub const VK_IMAGE_ASPECT_STENCIL_BIT: Flags = 0x4;

pub const VK_IMAGE_TYPE_2D: i32 = 1;
pub const VK_IMAGE_TYPE_3D: i32 = 2;
pub const VK_IMAGE_VIEW_TYPE_2D: i32 = 1;
pub const VK_IMAGE_VIEW_TYPE_3D: i32 = 2;
pub const VK_IMAGE_VIEW_TYPE_CUBE: i32 = 3;
pub const VK_IMAGE_VIEW_TYPE_2D_ARRAY: i32 = 5;
pub const VK_IMAGE_VIEW_TYPE_CUBE_ARRAY: i32 = 6;
pub const VK_IMAGE_TILING_OPTIMAL: i32 = 0;
pub const VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT: Flags = 0x10;
pub const VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT: Flags = 0x20;
pub const VK_SAMPLE_COUNT_1_BIT: Flags = 0x1;
pub const VK_SAMPLE_COUNT_2_BIT: Flags = 0x2;
pub const VK_SAMPLE_COUNT_4_BIT: Flags = 0x4;
pub const VK_SAMPLE_COUNT_8_BIT: Flags = 0x8;
pub const VK_SHARING_MODE_EXCLUSIVE: i32 = 0;

pub const VK_FILTER_NEAREST: i32 = 0;
pub const VK_FILTER_LINEAR: i32 = 1;
pub const VK_SAMPLER_MIPMAP_MODE_NEAREST: i32 = 0;
pub const VK_SAMPLER_MIPMAP_MODE_LINEAR: i32 = 1;
pub const VK_SAMPLER_ADDRESS_MODE_REPEAT: i32 = 0;
pub const VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT: i32 = 1;
pub const VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE: i32 = 2;
pub const VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK: i32 = 0;

pub const VK_COMPARE_OP_NEVER: i32 = 0;
pub const VK_COMPARE_OP_LESS: i32 = 1;
pub const VK_COMPARE_OP_EQUAL: i32 = 2;
pub const VK_COMPARE_OP_LESS_OR_EQUAL: i32 = 3;
pub const VK_COMPARE_OP_GREATER: i32 = 4;
pub const VK_COMPARE_OP_NOT_EQUAL: i32 = 5;
pub const VK_COMPARE_OP_GREATER_OR_EQUAL: i32 = 6;
pub const VK_COMPARE_OP_ALWAYS: i32 = 7;

pub const VK_STENCIL_OP_KEEP: i32 = 0;
pub const VK_STENCIL_OP_ZERO: i32 = 1;
pub const VK_STENCIL_OP_REPLACE: i32 = 2;
pub const VK_STENCIL_OP_INCREMENT_AND_CLAMP: i32 = 3;
pub const VK_STENCIL_OP_DECREMENT_AND_CLAMP: i32 = 4;
pub const VK_STENCIL_OP_INVERT: i32 = 5;
pub const VK_STENCIL_OP_INCREMENT_AND_WRAP: i32 = 6;
pub const VK_STENCIL_OP_DECREMENT_AND_WRAP: i32 = 7;

pub const VK_BLEND_FACTOR_ZERO: i32 = 0;
pub const VK_BLEND_FACTOR_ONE: i32 = 1;
pub const VK_BLEND_FACTOR_SRC_COLOR: i32 = 2;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR: i32 = 3;
pub const VK_BLEND_FACTOR_DST_COLOR: i32 = 4;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR: i32 = 5;
pub const VK_BLEND_FACTOR_SRC_ALPHA: i32 = 6;
pub const VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA: i32 = 7;
pub const VK_BLEND_FACTOR_DST_ALPHA: i32 = 8;
pub const VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA: i32 = 9;
pub const VK_BLEND_FACTOR_CONSTANT_COLOR: i32 = 10;
pub const VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR: i32 = 11;
pub const VK_BLEND_FACTOR_SRC_ALPHA_SATURATE: i32 = 14;

pub const VK_BLEND_OP_ADD: i32 = 0;
pub const VK_BLEND_OP_SUBTRACT: i32 = 1;
pub const VK_BLEND_OP_REVERSE_SUBTRACT: i32 = 2;
pub const VK_BLEND_OP_MIN: i32 = 3;
pub const VK_BLEND_OP_MAX: i32 = 4;

pub const VK_COLOR_COMPONENT_R_BIT: Flags = 0x1;
pub const VK_COLOR_COMPONENT_G_BIT: Flags = 0x2;
pub const VK_COLOR_COMPONENT_B_BIT: Flags = 0x4;
pub const VK_COLOR_COMPONENT_A_BIT: Flags = 0x8;

pub const VK_PRIMITIVE_TOPOLOGY_POINT_LIST: i32 = 0;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_LIST: i32 = 1;
pub const VK_PRIMITIVE_TOPOLOGY_LINE_STRIP: i32 = 2;
pub const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST: i32 = 3;
pub const VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP: i32 = 4;

pub const VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT: Flags = 0x1;
pub const VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT: Flags = 0x2;
pub const VK_PIPELINE_STAGE_VERTEX_INPUT_BIT: Flags = 0x4;
pub const VK_PIPELINE_STAGE_VERTEX_SHADER_BIT: Flags = 0x8;
pub const VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT: Flags = 0x80;
pub const VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT: Flags = 0x400;
pub const VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT: Flags = 0x800;
pub const VK_PIPELINE_STAGE_TRANSFER_BIT: Flags = 0x1000;
pub const VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT: Flags = 0x2000;
pub const VK_PIPELINE_STAGE_HOST_BIT: Flags = 0x4000;
pub const VK_PIPELINE_STAGE_ALL_COMMANDS_BIT: Flags = 0x10000;
pub const VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT: Flags = 0x100;
pub const VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT: Flags = 0x200;

pub const VK_ACCESS_INDIRECT_COMMAND_READ_BIT: Flags = 0x1;
pub const VK_ACCESS_INDEX_READ_BIT: Flags = 0x2;
pub const VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT: Flags = 0x4;
pub const VK_ACCESS_UNIFORM_READ_BIT: Flags = 0x8;
pub const VK_ACCESS_SHADER_READ_BIT: Flags = 0x20;
pub const VK_ACCESS_SHADER_WRITE_BIT: Flags = 0x40;
pub const VK_ACCESS_COLOR_ATTACHMENT_READ_BIT: Flags = 0x80;
pub const VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT: Flags = 0x100;
pub const VK_ACCESS_TRANSFER_READ_BIT: Flags = 0x800;
pub const VK_ACCESS_TRANSFER_WRITE_BIT: Flags = 0x1000;
pub const VK_ACCESS_HOST_READ_BIT: Flags = 0x2000;
pub const VK_ACCESS_HOST_WRITE_BIT: Flags = 0x4000;
pub const VK_ACCESS_MEMORY_READ_BIT: Flags = 0x8000;
pub const VK_ACCESS_MEMORY_WRITE_BIT: Flags = 0x10000;
pub const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT: Flags = 0x200;
pub const VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT: Flags = 0x400;

pub const VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT: Flags = 0x2;
pub const VK_COMMAND_BUFFER_LEVEL_PRIMARY: i32 = 0;
pub const VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT: Flags = 0x1;
pub const VK_FENCE_CREATE_SIGNALED_BIT: Flags = 0x1;

/// `VK_TRUE` and `VK_FALSE` as raw `VkBool32` values.
pub const VK_TRUE: Bool32 = 1;
pub const VK_FALSE: Bool32 = 0;
/// `VK_MAX_MEMORY_TYPES`, the size of the memory-type array in a physical device.
pub const VK_MAX_MEMORY_TYPES: usize = 32;
/// `VK_QUEUE_FAMILY_IGNORED`: barriers that do not transfer queue ownership.
pub const VK_QUEUE_FAMILY_IGNORED: u32 = 0xffffffff;
/// `VK_WHOLE_SIZE`: maps or ranges to the end of the allocation.
pub const VK_WHOLE_SIZE: u64 = 0xffffffffffffffff;
/// `VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR`.
pub const VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR: Flags = 0x1;
/// `UINT64_MAX`: an infinite fence or semaphore timeout.
pub const VK_TIMEOUT_INFINITE: u64 = 0xffffffffffffffff;

pub const VK_PHYSICAL_DEVICE_TYPE_OTHER: i32 = 0;
pub const VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU: i32 = 1;
pub const VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU: i32 = 2;
pub const VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU: i32 = 3;
pub const VK_PHYSICAL_DEVICE_TYPE_CPU: i32 = 4;

pub const VK_COLOR_SPACE_SRGB_NONLINEAR_KHR: i32 = 0;
pub const VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT: i32 = 1000104002;
pub const VK_COLOR_SPACE_HDR10_ST2084_EXT: i32 = 1000104008;

pub const VK_PRESENT_MODE_IMMEDIATE_KHR: i32 = 0;
pub const VK_PRESENT_MODE_MAILBOX_KHR: i32 = 1;
pub const VK_PRESENT_MODE_FIFO_KHR: i32 = 2;

pub const VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR: Flags = 0x1;
pub const VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR: Flags = 0x2;
pub const VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR: Flags = 0x4;
pub const VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR: Flags = 0x8;

pub const VK_COMPONENT_SWIZZLE_IDENTITY: i32 = 0;
pub const VK_COMPONENT_SWIZZLE_ZERO: i32 = 1;
pub const VK_COMPONENT_SWIZZLE_ONE: i32 = 2;
pub const VK_COMPONENT_SWIZZLE_R: i32 = 3;
pub const VK_COMPONENT_SWIZZLE_G: i32 = 4;
pub const VK_COMPONENT_SWIZZLE_B: i32 = 5;
pub const VK_COMPONENT_SWIZZLE_A: i32 = 6;

pub const VK_INDEX_TYPE_UINT16: i32 = 0;
pub const VK_INDEX_TYPE_UINT32: i32 = 1;
pub const VK_VERTEX_INPUT_RATE_VERTEX: i32 = 0;
pub const VK_VERTEX_INPUT_RATE_INSTANCE: i32 = 1;
pub const VK_POLYGON_MODE_FILL: i32 = 0;
pub const VK_POLYGON_MODE_LINE: i32 = 1;
pub const VK_FRONT_FACE_COUNTER_CLOCKWISE: i32 = 0;
pub const VK_FRONT_FACE_CLOCKWISE: i32 = 1;

// Extension names requested at instance and device creation.
pub const VK_KHR_SURFACE_EXTENSION_NAME = "VK_KHR_surface";
pub const VK_KHR_SWAPCHAIN_EXTENSION_NAME = "VK_KHR_swapchain";
pub const VK_KHR_MAINTENANCE_1_EXTENSION_NAME = "VK_KHR_maintenance1";
pub const VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME = "VK_KHR_driver_properties";
pub const VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME = "VK_KHR_get_physical_device_properties2";
pub const VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME = "VK_EXT_swapchain_colorspace";
pub const VK_EXT_DEBUG_UTILS_EXTENSION_NAME = "VK_EXT_debug_utils";
pub const VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME = "VK_KHR_portability_enumeration";
pub const VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME = "VK_KHR_portability_subset";
pub const VK_KHR_XLIB_SURFACE_EXTENSION_NAME = "VK_KHR_xlib_surface";
pub const VK_KHR_XCB_SURFACE_EXTENSION_NAME = "VK_KHR_xcb_surface";
pub const VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME = "VK_KHR_wayland_surface";
pub const VK_EXT_TEXTURE_COMPRESSION_ASTC_HDR_EXTENSION_NAME = "VK_EXT_texture_compression_astc_hdr";
pub const VK_LAYER_KHRONOS_VALIDATION_NAME = "VK_LAYER_KHRONOS_validation";

/// `VK_MAKE_API_VERSION(0, major, minor, patch)`.
pub fn make_version(major: u32, minor: u32, patch: u32) u32 {
    return (major << 22) | (minor << 12) | patch;
}
pub const VK_API_VERSION_1_0 = make_version(1, 0, 0);
pub const VK_API_VERSION_1_1 = make_version(1, 1, 0);

// ---------------------------------------------------------------------------
// Structures (hand-transcribed; field order is the C ABI)
// ---------------------------------------------------------------------------

pub const ApplicationInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    pApplicationName: ?[*:0]const u8,
    applicationVersion: u32,
    pEngineName: ?[*:0]const u8,
    engineVersion: u32,
    apiVersion: u32,
};

pub const InstanceCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    pApplicationInfo: ?*const ApplicationInfo,
    enabledLayerCount: u32,
    ppEnabledLayerNames: ?[*]const [*:0]const u8,
    enabledExtensionCount: u32,
    ppEnabledExtensionNames: ?[*]const [*:0]const u8,
};

pub const DeviceQueueCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    queueFamilyIndex: u32,
    queueCount: u32,
    pQueuePriorities: ?[*]const f32,
};

pub const DeviceCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    queueCreateInfoCount: u32,
    pQueueCreateInfos: ?[*]const DeviceQueueCreateInfo,
    enabledLayerCount: u32,
    ppEnabledLayerNames: ?[*]const [*:0]const u8,
    enabledExtensionCount: u32,
    ppEnabledExtensionNames: ?[*]const [*:0]const u8,
    pEnabledFeatures: ?*const PhysicalDeviceFeatures,
};

pub const PhysicalDeviceDriverProperties = extern struct {
    sType: i32,
    pNext: ?*anyopaque,
    driverID: i32,
    driverName: [256]u8,
    driverInfo: [256]u8,
    conformanceVersion: extern struct { major: u8, minor: u8, subminor: u8, patch: u8 },
};

pub const PhysicalDeviceProperties2 = extern struct {
    sType: i32,
    pNext: ?*anyopaque,
    properties: PhysicalDeviceProperties,
};

pub const CommandPoolCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    queueFamilyIndex: u32,
};

pub const CommandBufferAllocateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    commandPool: Handle,
    level: i32,
    commandBufferCount: u32,
};

pub const CommandBufferBeginInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    pInheritanceInfo: ?*const anyopaque,
};

pub const SubmitInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    waitSemaphoreCount: u32,
    pWaitSemaphores: ?[*]const Handle,
    pWaitDstStageMask: ?[*]const Flags,
    commandBufferCount: u32,
    pCommandBuffers: ?[*]const CommandBuffer,
    signalSemaphoreCount: u32,
    pSignalSemaphores: ?[*]const Handle,
};

pub const FenceCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
};

pub const SemaphoreCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
};

pub const MemoryAllocateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    allocationSize: DeviceSize,
    memoryTypeIndex: u32,
};

pub const BufferCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    size: DeviceSize,
    usage: Flags,
    sharingMode: i32,
    queueFamilyIndexCount: u32,
    pQueueFamilyIndices: ?[*]const u32,
};

pub const ImageCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    imageType: i32,
    format: Format,
    extent: Extent3D,
    mipLevels: u32,
    arrayLayers: u32,
    samples: Flags,
    tiling: i32,
    usage: Flags,
    sharingMode: i32,
    queueFamilyIndexCount: u32,
    pQueueFamilyIndices: ?[*]const u32,
    initialLayout: i32,
};

pub const ComponentMapping = extern struct {
    r: i32,
    g: i32,
    b: i32,
    a: i32,
};

pub const ImageSubresourceRange = extern struct {
    aspectMask: Flags,
    baseMipLevel: u32,
    levelCount: u32,
    baseArrayLayer: u32,
    layerCount: u32,
};

pub const ImageSubresourceLayers = extern struct {
    aspectMask: Flags,
    mipLevel: u32,
    baseArrayLayer: u32,
    layerCount: u32,
};

pub const ImageViewCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    image: Handle,
    viewType: i32,
    format: Format,
    components: ComponentMapping,
    subresourceRange: ImageSubresourceRange,
};

pub const SamplerCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    magFilter: i32,
    minFilter: i32,
    mipmapMode: i32,
    addressModeU: i32,
    addressModeV: i32,
    addressModeW: i32,
    mipLodBias: f32,
    anisotropyEnable: Bool32,
    maxAnisotropy: f32,
    compareEnable: Bool32,
    compareOp: i32,
    minLod: f32,
    maxLod: f32,
    borderColor: i32,
    unnormalizedCoordinates: Bool32,
};

pub const ShaderModuleCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    codeSize: usize,
    pCode: [*]const u32,
};

pub const MemoryBarrier = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    srcAccessMask: Flags,
    dstAccessMask: Flags,
};

pub const BufferMemoryBarrier = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    srcAccessMask: Flags,
    dstAccessMask: Flags,
    srcQueueFamilyIndex: u32,
    dstQueueFamilyIndex: u32,
    buffer: Handle,
    offset: DeviceSize,
    size: DeviceSize,
};

pub const ImageMemoryBarrier = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    srcAccessMask: Flags,
    dstAccessMask: Flags,
    oldLayout: i32,
    newLayout: i32,
    srcQueueFamilyIndex: u32,
    dstQueueFamilyIndex: u32,
    image: Handle,
    subresourceRange: ImageSubresourceRange,
};

pub const BufferCopy = extern struct {
    srcOffset: DeviceSize,
    dstOffset: DeviceSize,
    size: DeviceSize,
};

pub const Offset3D = extern struct {
    x: i32,
    y: i32,
    z: i32,
};

pub const BufferImageCopy = extern struct {
    bufferOffset: DeviceSize,
    bufferRowLength: u32,
    bufferImageHeight: u32,
    imageSubresource: ImageSubresourceLayers,
    imageOffset: Offset3D,
    imageExtent: Extent3D,
};

pub const SwapchainCreateInfoKHR = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    surface: Handle,
    minImageCount: u32,
    imageFormat: Format,
    imageColorSpace: i32,
    imageExtent: Extent2D,
    imageArrayLayers: u32,
    imageUsage: Flags,
    imageSharingMode: i32,
    queueFamilyIndexCount: u32,
    pQueueFamilyIndices: ?[*]const u32,
    preTransform: Flags,
    compositeAlpha: Flags,
    presentMode: i32,
    clipped: Bool32,
    oldSwapchain: Handle,
};

pub const PresentInfoKHR = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    waitSemaphoreCount: u32,
    pWaitSemaphores: ?[*]const Handle,
    swapchainCount: u32,
    pSwapchains: [*]const Handle,
    pImageIndices: [*]const u32,
    pResults: ?[*]Result,
};

// VkFormat values referenced by the SDL format tables (raw values).
pub const Format = i32;
pub const VK_FORMAT_A1R5G5B5_UNORM_PACK16: Format = 8;
pub const VK_FORMAT_A2B10G10R10_UNORM_PACK32: Format = 64;
pub const VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT: Format = 1000066011;
pub const VK_FORMAT_ASTC_10x10_SRGB_BLOCK: Format = 180;
pub const VK_FORMAT_ASTC_10x10_UNORM_BLOCK: Format = 179;
pub const VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT: Format = 1000066008;
pub const VK_FORMAT_ASTC_10x5_SRGB_BLOCK: Format = 174;
pub const VK_FORMAT_ASTC_10x5_UNORM_BLOCK: Format = 173;
pub const VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT: Format = 1000066009;
pub const VK_FORMAT_ASTC_10x6_SRGB_BLOCK: Format = 176;
pub const VK_FORMAT_ASTC_10x6_UNORM_BLOCK: Format = 175;
pub const VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT: Format = 1000066010;
pub const VK_FORMAT_ASTC_10x8_SRGB_BLOCK: Format = 178;
pub const VK_FORMAT_ASTC_10x8_UNORM_BLOCK: Format = 177;
pub const VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT: Format = 1000066012;
pub const VK_FORMAT_ASTC_12x10_SRGB_BLOCK: Format = 182;
pub const VK_FORMAT_ASTC_12x10_UNORM_BLOCK: Format = 181;
pub const VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK: Format = 1000066013;
pub const VK_FORMAT_ASTC_12x12_SRGB_BLOCK: Format = 184;
pub const VK_FORMAT_ASTC_12x12_UNORM_BLOCK: Format = 183;
pub const VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT: Format = 1000066000;
pub const VK_FORMAT_ASTC_4x4_SRGB_BLOCK: Format = 158;
pub const VK_FORMAT_ASTC_4x4_UNORM_BLOCK: Format = 157;
pub const VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT: Format = 1000066001;
pub const VK_FORMAT_ASTC_5x4_SRGB_BLOCK: Format = 160;
pub const VK_FORMAT_ASTC_5x4_UNORM_BLOCK: Format = 159;
pub const VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT: Format = 1000066002;
pub const VK_FORMAT_ASTC_5x5_SRGB_BLOCK: Format = 162;
pub const VK_FORMAT_ASTC_5x5_UNORM_BLOCK: Format = 161;
pub const VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT: Format = 1000066003;
pub const VK_FORMAT_ASTC_6x5_SRGB_BLOCK: Format = 164;
pub const VK_FORMAT_ASTC_6x5_UNORM_BLOCK: Format = 163;
pub const VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT: Format = 1000066004;
pub const VK_FORMAT_ASTC_6x6_SRGB_BLOCK: Format = 166;
pub const VK_FORMAT_ASTC_6x6_UNORM_BLOCK: Format = 165;
pub const VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT: Format = 1000066005;
pub const VK_FORMAT_ASTC_8x5_SRGB_BLOCK: Format = 168;
pub const VK_FORMAT_ASTC_8x5_UNORM_BLOCK: Format = 167;
pub const VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT: Format = 1000066006;
pub const VK_FORMAT_ASTC_8x6_SRGB_BLOCK: Format = 170;
pub const VK_FORMAT_ASTC_8x6_UNORM_BLOCK: Format = 169;
pub const VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT: Format = 1000066007;
pub const VK_FORMAT_ASTC_8x8_SRGB_BLOCK: Format = 172;
pub const VK_FORMAT_ASTC_8x8_UNORM_BLOCK: Format = 171;
pub const VK_FORMAT_B10G11R11_UFLOAT_PACK32: Format = 122;
pub const VK_FORMAT_B4G4R4A4_UNORM_PACK16: Format = 3;
pub const VK_FORMAT_B8G8R8A8_SRGB: Format = 50;
pub const VK_FORMAT_B8G8R8A8_UNORM: Format = 44;
pub const VK_FORMAT_BC1_RGBA_SRGB_BLOCK: Format = 134;
pub const VK_FORMAT_BC1_RGBA_UNORM_BLOCK: Format = 133;
pub const VK_FORMAT_BC2_SRGB_BLOCK: Format = 136;
pub const VK_FORMAT_BC2_UNORM_BLOCK: Format = 135;
pub const VK_FORMAT_BC3_SRGB_BLOCK: Format = 138;
pub const VK_FORMAT_BC3_UNORM_BLOCK: Format = 137;
pub const VK_FORMAT_BC4_UNORM_BLOCK: Format = 139;
pub const VK_FORMAT_BC5_UNORM_BLOCK: Format = 141;
pub const VK_FORMAT_BC6H_SFLOAT_BLOCK: Format = 144;
pub const VK_FORMAT_BC6H_UFLOAT_BLOCK: Format = 143;
pub const VK_FORMAT_BC7_SRGB_BLOCK: Format = 146;
pub const VK_FORMAT_BC7_UNORM_BLOCK: Format = 145;
pub const VK_FORMAT_D16_UNORM: Format = 124;
pub const VK_FORMAT_D24_UNORM_S8_UINT: Format = 129;
pub const VK_FORMAT_D32_SFLOAT: Format = 126;
pub const VK_FORMAT_D32_SFLOAT_S8_UINT: Format = 130;
pub const VK_FORMAT_R16G16B16A16_SFLOAT: Format = 97;
pub const VK_FORMAT_R16G16B16A16_SINT: Format = 96;
pub const VK_FORMAT_R16G16B16A16_SNORM: Format = 92;
pub const VK_FORMAT_R16G16B16A16_UINT: Format = 95;
pub const VK_FORMAT_R16G16B16A16_UNORM: Format = 91;
pub const VK_FORMAT_R16G16_SFLOAT: Format = 83;
pub const VK_FORMAT_R16G16_SINT: Format = 82;
pub const VK_FORMAT_R16G16_SNORM: Format = 78;
pub const VK_FORMAT_R16G16_UINT: Format = 81;
pub const VK_FORMAT_R16G16_UNORM: Format = 77;
pub const VK_FORMAT_R16_SFLOAT: Format = 76;
pub const VK_FORMAT_R16_SINT: Format = 75;
pub const VK_FORMAT_R16_SNORM: Format = 71;
pub const VK_FORMAT_R16_UINT: Format = 74;
pub const VK_FORMAT_R16_UNORM: Format = 70;
pub const VK_FORMAT_R32G32B32A32_SFLOAT: Format = 109;
pub const VK_FORMAT_R32G32B32A32_SINT: Format = 108;
pub const VK_FORMAT_R32G32B32A32_UINT: Format = 107;
pub const VK_FORMAT_R32G32B32_SFLOAT: Format = 106;
pub const VK_FORMAT_R32G32B32_SINT: Format = 105;
pub const VK_FORMAT_R32G32B32_UINT: Format = 104;
pub const VK_FORMAT_R32G32_SFLOAT: Format = 103;
pub const VK_FORMAT_R32G32_SINT: Format = 102;
pub const VK_FORMAT_R32G32_UINT: Format = 101;
pub const VK_FORMAT_R32_SFLOAT: Format = 100;
pub const VK_FORMAT_R32_SINT: Format = 99;
pub const VK_FORMAT_R32_UINT: Format = 98;
pub const VK_FORMAT_R5G6B5_UNORM_PACK16: Format = 4;
pub const VK_FORMAT_R8G8B8A8_SINT: Format = 42;
pub const VK_FORMAT_R8G8B8A8_SNORM: Format = 38;
pub const VK_FORMAT_R8G8B8A8_SRGB: Format = 43;
pub const VK_FORMAT_R8G8B8A8_UINT: Format = 41;
pub const VK_FORMAT_R8G8B8A8_UNORM: Format = 37;
pub const VK_FORMAT_R8G8_SINT: Format = 21;
pub const VK_FORMAT_R8G8_SNORM: Format = 17;
pub const VK_FORMAT_R8G8_UINT: Format = 20;
pub const VK_FORMAT_R8G8_UNORM: Format = 16;
pub const VK_FORMAT_R8_SINT: Format = 14;
pub const VK_FORMAT_R8_SNORM: Format = 10;
pub const VK_FORMAT_R8_UINT: Format = 13;
pub const VK_FORMAT_R8_UNORM: Format = 9;
pub const VK_FORMAT_UNDEFINED: Format = 0;
pub const VK_FORMAT_X8_D24_UNORM_PACK32: Format = 125;

// Generated C-layout records (see header comment).
pub const PhysicalDeviceFeatures = extern struct {
    robustBufferAccess: u32,
    fullDrawIndexUint32: u32,
    imageCubeArray: u32,
    independentBlend: u32,
    geometryShader: u32,
    tessellationShader: u32,
    sampleRateShading: u32,
    dualSrcBlend: u32,
    logicOp: u32,
    multiDrawIndirect: u32,
    drawIndirectFirstInstance: u32,
    depthClamp: u32,
    depthBiasClamp: u32,
    fillModeNonSolid: u32,
    depthBounds: u32,
    wideLines: u32,
    largePoints: u32,
    alphaToOne: u32,
    multiViewport: u32,
    samplerAnisotropy: u32,
    textureCompressionETC2: u32,
    textureCompressionASTC_LDR: u32,
    textureCompressionBC: u32,
    occlusionQueryPrecise: u32,
    pipelineStatisticsQuery: u32,
    vertexPipelineStoresAndAtomics: u32,
    fragmentStoresAndAtomics: u32,
    shaderTessellationAndGeometryPointSize: u32,
    shaderImageGatherExtended: u32,
    shaderStorageImageExtendedFormats: u32,
    shaderStorageImageMultisample: u32,
    shaderStorageImageReadWithoutFormat: u32,
    shaderStorageImageWriteWithoutFormat: u32,
    shaderUniformBufferArrayDynamicIndexing: u32,
    shaderSampledImageArrayDynamicIndexing: u32,
    shaderStorageBufferArrayDynamicIndexing: u32,
    shaderStorageImageArrayDynamicIndexing: u32,
    shaderClipDistance: u32,
    shaderCullDistance: u32,
    shaderFloat64: u32,
    shaderInt64: u32,
    shaderInt16: u32,
    shaderResourceResidency: u32,
    shaderResourceMinLod: u32,
    sparseBinding: u32,
    sparseResidencyBuffer: u32,
    sparseResidencyImage2D: u32,
    sparseResidencyImage3D: u32,
    sparseResidency2Samples: u32,
    sparseResidency4Samples: u32,
    sparseResidency8Samples: u32,
    sparseResidency16Samples: u32,
    sparseResidencyAliased: u32,
    variableMultisampleRate: u32,
    inheritedQueries: u32,
};

pub const PhysicalDeviceSparseProperties = extern struct {
    residencyStandard2DBlockShape: u32,
    residencyStandard2DMultisampleBlockShape: u32,
    residencyStandard3DBlockShape: u32,
    residencyAlignedMipSize: u32,
    residencyNonResidentStrict: u32,
};

pub const PhysicalDeviceLimits = extern struct {
    maxImageDimension1D: u32,
    maxImageDimension2D: u32,
    maxImageDimension3D: u32,
    maxImageDimensionCube: u32,
    maxImageArrayLayers: u32,
    maxTexelBufferElements: u32,
    maxUniformBufferRange: u32,
    maxStorageBufferRange: u32,
    maxPushConstantsSize: u32,
    maxMemoryAllocationCount: u32,
    maxSamplerAllocationCount: u32,
    bufferImageGranularity: u64,
    sparseAddressSpaceSize: u64,
    maxBoundDescriptorSets: u32,
    maxPerStageDescriptorSamplers: u32,
    maxPerStageDescriptorUniformBuffers: u32,
    maxPerStageDescriptorStorageBuffers: u32,
    maxPerStageDescriptorSampledImages: u32,
    maxPerStageDescriptorStorageImages: u32,
    maxPerStageDescriptorInputAttachments: u32,
    maxPerStageResources: u32,
    maxDescriptorSetSamplers: u32,
    maxDescriptorSetUniformBuffers: u32,
    maxDescriptorSetUniformBuffersDynamic: u32,
    maxDescriptorSetStorageBuffers: u32,
    maxDescriptorSetStorageBuffersDynamic: u32,
    maxDescriptorSetSampledImages: u32,
    maxDescriptorSetStorageImages: u32,
    maxDescriptorSetInputAttachments: u32,
    maxVertexInputAttributes: u32,
    maxVertexInputBindings: u32,
    maxVertexInputAttributeOffset: u32,
    maxVertexInputBindingStride: u32,
    maxVertexOutputComponents: u32,
    maxTessellationGenerationLevel: u32,
    maxTessellationPatchSize: u32,
    maxTessellationControlPerVertexInputComponents: u32,
    maxTessellationControlPerVertexOutputComponents: u32,
    maxTessellationControlPerPatchOutputComponents: u32,
    maxTessellationControlTotalOutputComponents: u32,
    maxTessellationEvaluationInputComponents: u32,
    maxTessellationEvaluationOutputComponents: u32,
    maxGeometryShaderInvocations: u32,
    maxGeometryInputComponents: u32,
    maxGeometryOutputComponents: u32,
    maxGeometryOutputVertices: u32,
    maxGeometryTotalOutputComponents: u32,
    maxFragmentInputComponents: u32,
    maxFragmentOutputAttachments: u32,
    maxFragmentDualSrcAttachments: u32,
    maxFragmentCombinedOutputResources: u32,
    maxComputeSharedMemorySize: u32,
    maxComputeWorkGroupCount: [3]u32,
    maxComputeWorkGroupInvocations: u32,
    maxComputeWorkGroupSize: [3]u32,
    subPixelPrecisionBits: u32,
    subTexelPrecisionBits: u32,
    mipmapPrecisionBits: u32,
    maxDrawIndexedIndexValue: u32,
    maxDrawIndirectCount: u32,
    maxSamplerLodBias: f32,
    maxSamplerAnisotropy: f32,
    maxViewports: u32,
    maxViewportDimensions: [2]u32,
    viewportBoundsRange: [2]f32,
    viewportSubPixelBits: u32,
    minMemoryMapAlignment: usize,
    minTexelBufferOffsetAlignment: u64,
    minUniformBufferOffsetAlignment: u64,
    minStorageBufferOffsetAlignment: u64,
    minTexelOffset: i32,
    maxTexelOffset: u32,
    minTexelGatherOffset: i32,
    maxTexelGatherOffset: u32,
    minInterpolationOffset: f32,
    maxInterpolationOffset: f32,
    subPixelInterpolationOffsetBits: u32,
    maxFramebufferWidth: u32,
    maxFramebufferHeight: u32,
    maxFramebufferLayers: u32,
    framebufferColorSampleCounts: u32,
    framebufferDepthSampleCounts: u32,
    framebufferStencilSampleCounts: u32,
    framebufferNoAttachmentsSampleCounts: u32,
    maxColorAttachments: u32,
    sampledImageColorSampleCounts: u32,
    sampledImageIntegerSampleCounts: u32,
    sampledImageDepthSampleCounts: u32,
    sampledImageStencilSampleCounts: u32,
    storageImageSampleCounts: u32,
    maxSampleMaskWords: u32,
    timestampComputeAndGraphics: u32,
    timestampPeriod: f32,
    maxClipDistances: u32,
    maxCullDistances: u32,
    maxCombinedClipAndCullDistances: u32,
    discreteQueuePriorities: u32,
    pointSizeRange: [2]f32,
    lineWidthRange: [2]f32,
    pointSizeGranularity: f32,
    lineWidthGranularity: f32,
    strictLines: u32,
    standardSampleLocations: u32,
    optimalBufferCopyOffsetAlignment: u64,
    optimalBufferCopyRowPitchAlignment: u64,
    nonCoherentAtomSize: u64,
};

pub const PhysicalDeviceMemoryProperties = extern struct {
    memoryTypeCount: u32,
    memoryTypes: [32]MemoryType,
    memoryHeapCount: u32,
    memoryHeaps: [16]MemoryHeap,
};

pub const MemoryType = extern struct {
    propertyFlags: u32,
    heapIndex: u32,
};

pub const MemoryHeap = extern struct {
    size: u64,
    flags: u32,
};

pub const PhysicalDeviceProperties = extern struct {
    apiVersion: u32,
    driverVersion: u32,
    vendorID: u32,
    deviceID: u32,
    deviceType: i32,
    device_name: [256]u8,
    pipelineCacheUUID: [16]u8,
    limits: PhysicalDeviceLimits,
    sparseProperties: PhysicalDeviceSparseProperties,
};

pub const Extent2D = extern struct {
    width: u32,
    height: u32,
};

pub const Extent3D = extern struct {
    width: u32,
    height: u32,
    depth: u32,
};

pub const SurfaceFormatKHR = extern struct {
    format: i32,
    colorSpace: i32,
};

pub const ImageFormatProperties = extern struct {
    maxExtent: Extent3D,
    max_mip_levels: u32,
    maxArrayLayers: u32,
    sampleCounts: u32,
    maxResourceSize: u64,
};

pub const SurfaceCapabilitiesKHR = extern struct {
    minImageCount: u32,
    maxImageCount: u32,
    currentExtent: Extent2D,
    minImageExtent: Extent2D,
    maxImageExtent: Extent2D,
    maxImageArrayLayers: u32,
    supportedTransforms: u32,
    currentTransform: i32,
    supportedCompositeAlpha: u32,
    supportedUsageFlags: u32,
};

pub const QueueFamilyProperties = extern struct {
    queueFlags: u32,
    queueCount: u32,
    timestampValidBits: u32,
    minImageTransferGranularity: Extent3D,
};

pub const MemoryRequirements = extern struct {
    size: u64,
    alignment: u64,
    memoryTypeBits: u32,
};

pub const ExtensionProperties = extern struct {
    extensionName: [256]u8,
    specVersion: u32,
};

pub const LayerProperties = extern struct {
    layerName: [256]u8,
    specVersion: u32,
    implementationVersion: u32,
    description: [256]u8,
};

// ---------------------------------------------------------------------------
// Function tables. Field names are the C entry-point names; each field is a C
// function pointer. Optional fields are extension entry points that may be
// absent; required fields make `Library` loading fail with MissingFunction.
// ---------------------------------------------------------------------------

pub const GetInstanceProcAddr = *const fn (Instance, [*:0]const u8) callconv(.c) ?PfnVoid;

/// Global functions, resolved with a null instance.
pub const GlobalFns = struct {
    vkCreateInstance: *const fn (*const InstanceCreateInfo, ?*const anyopaque, *Instance) callconv(.c) Result,
    vkEnumerateInstanceExtensionProperties: *const fn (?[*:0]const u8, *u32, ?[*]ExtensionProperties) callconv(.c) Result,
    vkEnumerateInstanceLayerProperties: *const fn (*u32, ?[*]LayerProperties) callconv(.c) Result,
};

/// Instance-level functions. `vkGetDeviceProcAddr` is the entry point used to
/// resolve device tables.
pub const InstanceFns = struct {
    vkDestroyInstance: *const fn (Instance, ?*const anyopaque) callconv(.c) void,
    vkEnumeratePhysicalDevices: *const fn (Instance, *u32, ?[*]PhysicalDevice) callconv(.c) Result,
    vkGetPhysicalDeviceProperties: *const fn (PhysicalDevice, *PhysicalDeviceProperties) callconv(.c) void,
    vkGetPhysicalDeviceProperties2KHR: ?*const fn (PhysicalDevice, *PhysicalDeviceProperties2) callconv(.c) void,
    vkGetPhysicalDeviceMemoryProperties: *const fn (PhysicalDevice, *PhysicalDeviceMemoryProperties) callconv(.c) void,
    vkGetPhysicalDeviceImageFormatProperties: *const fn (PhysicalDevice, Format, i32, i32, Flags, Flags, *ImageFormatProperties) callconv(.c) Result,
    vkGetPhysicalDeviceFeatures: *const fn (PhysicalDevice, *PhysicalDeviceFeatures) callconv(.c) void,
    vkGetPhysicalDeviceQueueFamilyProperties: *const fn (PhysicalDevice, *u32, ?[*]QueueFamilyProperties) callconv(.c) void,
    vkEnumerateDeviceExtensionProperties: *const fn (PhysicalDevice, ?[*:0]const u8, *u32, ?[*]ExtensionProperties) callconv(.c) Result,
    vkCreateDevice: *const fn (PhysicalDevice, *const DeviceCreateInfo, ?*const anyopaque, *Device) callconv(.c) Result,
    vkGetDeviceProcAddr: *const fn (Device, [*:0]const u8) callconv(.c) ?PfnVoid,
    vkDestroySurfaceKHR: ?*const fn (Instance, Handle, ?*const anyopaque) callconv(.c) void,
    vkGetPhysicalDeviceSurfaceSupportKHR: ?*const fn (PhysicalDevice, u32, Handle, *Bool32) callconv(.c) Result,
    vkGetPhysicalDeviceSurfaceCapabilitiesKHR: ?*const fn (PhysicalDevice, Handle, *SurfaceCapabilitiesKHR) callconv(.c) Result,
    vkGetPhysicalDeviceSurfaceFormatsKHR: ?*const fn (PhysicalDevice, Handle, *u32, ?[*]SurfaceFormatKHR) callconv(.c) Result,
    vkGetPhysicalDeviceSurfacePresentModesKHR: ?*const fn (PhysicalDevice, Handle, *u32, ?[*]i32) callconv(.c) Result,
};

/// Device-level functions, resolved with `vkGetDeviceProcAddr`. Swapchain and
/// present entry points come from VK_KHR_swapchain and are optional so a device
/// without it still loads for headless use.
pub const DeviceFns = struct {
    vkDestroyDevice: *const fn (Device, ?*const anyopaque) callconv(.c) void,
    vkGetDeviceQueue: *const fn (Device, u32, u32, *Queue) callconv(.c) void,
    vkDeviceWaitIdle: *const fn (Device) callconv(.c) Result,
    vkQueueSubmit: *const fn (Queue, u32, ?[*]const SubmitInfo, Handle) callconv(.c) Result,
    vkQueueWaitIdle: *const fn (Queue) callconv(.c) Result,
    vkCreateCommandPool: *const fn (Device, *const CommandPoolCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyCommandPool: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkAllocateCommandBuffers: *const fn (Device, *const CommandBufferAllocateInfo, [*]CommandBuffer) callconv(.c) Result,
    vkFreeCommandBuffers: *const fn (Device, Handle, u32, [*]const CommandBuffer) callconv(.c) void,
    vkResetCommandBuffer: *const fn (CommandBuffer, Flags) callconv(.c) Result,
    vkBeginCommandBuffer: *const fn (CommandBuffer, *const CommandBufferBeginInfo) callconv(.c) Result,
    vkEndCommandBuffer: *const fn (CommandBuffer) callconv(.c) Result,
    vkCreateFence: *const fn (Device, *const FenceCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyFence: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkResetFences: *const fn (Device, u32, [*]const Handle) callconv(.c) Result,
    vkGetFenceStatus: *const fn (Device, Handle) callconv(.c) Result,
    vkWaitForFences: *const fn (Device, u32, [*]const Handle, Bool32, u64) callconv(.c) Result,
    vkCreateSemaphore: *const fn (Device, *const SemaphoreCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroySemaphore: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateBuffer: *const fn (Device, *const BufferCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyBuffer: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkGetBufferMemoryRequirements: *const fn (Device, Handle, *MemoryRequirements) callconv(.c) void,
    vkBindBufferMemory: *const fn (Device, Handle, Handle, DeviceSize) callconv(.c) Result,
    vkCreateImage: *const fn (Device, *const ImageCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyImage: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkGetImageMemoryRequirements: *const fn (Device, Handle, *MemoryRequirements) callconv(.c) void,
    vkBindImageMemory: *const fn (Device, Handle, Handle, DeviceSize) callconv(.c) Result,
    vkCreateImageView: *const fn (Device, *const ImageViewCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyImageView: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateSampler: *const fn (Device, *const SamplerCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroySampler: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateShaderModule: *const fn (Device, *const ShaderModuleCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyShaderModule: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkAllocateMemory: *const fn (Device, *const MemoryAllocateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkFreeMemory: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkMapMemory: *const fn (Device, Handle, DeviceSize, DeviceSize, Flags, *?*anyopaque) callconv(.c) Result,
    vkUnmapMemory: *const fn (Device, Handle) callconv(.c) void,
    vkCmdPipelineBarrier: *const fn (CommandBuffer, Flags, Flags, Flags, u32, ?[*]const MemoryBarrier, u32, ?[*]const BufferMemoryBarrier, u32, ?[*]const ImageMemoryBarrier) callconv(.c) void,
    vkCmdCopyBuffer: *const fn (CommandBuffer, Handle, Handle, u32, [*]const BufferCopy) callconv(.c) void,
    vkCmdCopyBufferToImage: *const fn (CommandBuffer, Handle, Handle, i32, u32, [*]const BufferImageCopy) callconv(.c) void,
    vkCmdCopyImageToBuffer: *const fn (CommandBuffer, Handle, i32, Handle, u32, [*]const BufferImageCopy) callconv(.c) void,
    vkCreateSwapchainKHR: ?*const fn (Device, *const SwapchainCreateInfoKHR, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroySwapchainKHR: ?*const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkGetSwapchainImagesKHR: ?*const fn (Device, Handle, *u32, ?[*]Handle) callconv(.c) Result,
    vkAcquireNextImageKHR: ?*const fn (Device, Handle, u64, Handle, Handle, *u32) callconv(.c) Result,
    vkQueuePresentKHR: ?*const fn (Queue, *const PresentInfoKHR) callconv(.c) Result,
    vkCreateRenderPass: *const fn (Device, *const RenderPassCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyRenderPass: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateFramebuffer: *const fn (Device, *const FramebufferCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyFramebuffer: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateGraphicsPipelines: *const fn (Device, Handle, u32, [*]const GraphicsPipelineCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkCreateComputePipelines: *const fn (Device, Handle, u32, [*]const ComputePipelineCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyPipeline: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreatePipelineLayout: *const fn (Device, *const PipelineLayoutCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyPipelineLayout: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateDescriptorSetLayout: *const fn (Device, *const DescriptorSetLayoutCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyDescriptorSetLayout: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkCreateDescriptorPool: *const fn (Device, *const DescriptorPoolCreateInfo, ?*const anyopaque, *Handle) callconv(.c) Result,
    vkDestroyDescriptorPool: *const fn (Device, Handle, ?*const anyopaque) callconv(.c) void,
    vkResetDescriptorPool: *const fn (Device, Handle, Flags) callconv(.c) Result,
    vkAllocateDescriptorSets: *const fn (Device, *const DescriptorSetAllocateInfo, [*]Handle) callconv(.c) Result,
    vkUpdateDescriptorSets: *const fn (Device, u32, [*]const WriteDescriptorSet, u32, ?*const anyopaque) callconv(.c) void,
    vkCmdBeginRenderPass: *const fn (CommandBuffer, *const RenderPassBeginInfo, i32) callconv(.c) void,
    vkCmdEndRenderPass: *const fn (CommandBuffer) callconv(.c) void,
    vkCmdBindPipeline: *const fn (CommandBuffer, i32, Handle) callconv(.c) void,
    vkCmdBindVertexBuffers: *const fn (CommandBuffer, u32, u32, [*]const Handle, [*]const DeviceSize) callconv(.c) void,
    vkCmdBindIndexBuffer: *const fn (CommandBuffer, Handle, DeviceSize, i32) callconv(.c) void,
    vkCmdBindDescriptorSets: *const fn (CommandBuffer, i32, Handle, u32, u32, [*]const Handle, u32, ?[*]const u32) callconv(.c) void,
    vkCmdSetViewport: *const fn (CommandBuffer, u32, u32, [*]const Viewport) callconv(.c) void,
    vkCmdSetScissor: *const fn (CommandBuffer, u32, u32, [*]const Rect2D) callconv(.c) void,
    vkCmdSetBlendConstants: *const fn (CommandBuffer, *const [4]f32) callconv(.c) void,
    vkCmdSetStencilReference: *const fn (CommandBuffer, Flags, u32) callconv(.c) void,
    vkCmdDraw: *const fn (CommandBuffer, u32, u32, u32, u32) callconv(.c) void,
    vkCmdDrawIndexed: *const fn (CommandBuffer, u32, u32, u32, i32, u32) callconv(.c) void,
    vkCmdDrawIndirect: *const fn (CommandBuffer, Handle, DeviceSize, u32, u32) callconv(.c) void,
    vkCmdDrawIndexedIndirect: *const fn (CommandBuffer, Handle, DeviceSize, u32, u32) callconv(.c) void,
    vkCmdDispatch: *const fn (CommandBuffer, u32, u32, u32) callconv(.c) void,
    vkCmdDispatchIndirect: *const fn (CommandBuffer, Handle, DeviceSize) callconv(.c) void,
    vkCmdCopyImage: *const fn (CommandBuffer, Handle, i32, Handle, i32, u32, [*]const ImageCopy) callconv(.c) void,
    vkCmdBlitImage: *const fn (CommandBuffer, Handle, i32, Handle, i32, u32, [*]const ImageBlit, i32) callconv(.c) void,
    /// VK_EXT_debug_utils, optional: null when the instance lacks it.
    vkSetDebugUtilsObjectNameEXT: ?*const fn (Device, *const DebugUtilsObjectNameInfoEXT) callconv(.c) Result,
    vkCmdBeginDebugUtilsLabelEXT: ?*const fn (CommandBuffer, *const DebugUtilsLabelEXT) callconv(.c) void,
    vkCmdEndDebugUtilsLabelEXT: ?*const fn (CommandBuffer) callconv(.c) void,
    vkCmdInsertDebugUtilsLabelEXT: ?*const fn (CommandBuffer, *const DebugUtilsLabelEXT) callconv(.c) void,
};

/// Errors from loading the library or resolving a function table.
pub const Error = std.DynLib.Error || VulkanError || error{MissingFunction};

/// An open `libvulkan.so.1` with its global function table. Instance and device
/// tables are resolved separately because their entry points depend on the
/// instance and device extensions enabled at creation.
pub const Library = struct {
    dynlib: std.DynLib,
    get_instance_proc_addr: GetInstanceProcAddr,
    global: GlobalFns,

    pub fn open() Error!Library {
        var dynlib = try std.DynLib.open("libvulkan.so.1");
        errdefer dynlib.close();
        const get = dynlib.lookup(GetInstanceProcAddr, "vkGetInstanceProcAddr") orelse return error.MissingFunction;
        const global = try resolve(GlobalFns, NullInstanceResolver{ .get = get });
        return .{ .dynlib = dynlib, .get_instance_proc_addr = get, .global = global };
    }

    pub fn close(self: *Library) void {
        self.dynlib.close();
        self.* = undefined;
    }

    /// Resolves the instance table for an instance created with `vkCreateInstance`.
    pub fn load_instance(self: *const Library, instance: Instance) Error!InstanceFns {
        return resolve(InstanceFns, InstanceResolver{ .get = self.get_instance_proc_addr, .instance = instance });
    }

    /// Resolves device entry points through `vkGetDeviceProcAddr`, so calls go
    /// straight to the driver without the loader trampoline.
    pub fn load_device(instance_fns: *const InstanceFns, device: Device) Error!DeviceFns {
        return resolve(DeviceFns, DeviceResolver{ .get = instance_fns.vkGetDeviceProcAddr, .device = device });
    }
};

const NullInstanceResolver = struct {
    get: GetInstanceProcAddr,

    fn lookup(self: NullInstanceResolver, name: [:0]const u8) ?PfnVoid {
        return self.get(null, name.ptr);
    }
};

const InstanceResolver = struct {
    get: GetInstanceProcAddr,
    instance: Instance,

    fn lookup(self: InstanceResolver, name: [:0]const u8) ?PfnVoid {
        return self.get(self.instance, name.ptr);
    }
};

const DeviceResolver = struct {
    get: *const fn (Device, [*:0]const u8) callconv(.c) ?PfnVoid,
    device: Device,

    fn lookup(self: DeviceResolver, name: [:0]const u8) ?PfnVoid {
        return self.get(self.device, name.ptr);
    }
};

/// Fills every function-pointer field of `T` by its C name. Optional fields
/// become null when the driver lacks the entry point; required fields fail.
fn resolve(comptime T: type, resolver: anytype) Error!T {
    var out: T = undefined;
    const info = @typeInfo(T).@"struct";
    inline for (info.field_names, info.field_types) |name, FieldType| {
        const sym: [:0]const u8 = "" ++ name;
        const proc = resolver.lookup(sym);
        if (@typeInfo(FieldType) == .optional) {
            @field(out, name) = if (proc) |p| @ptrCast(p) else null;
        } else {
            @field(out, name) = @ptrCast(proc orelse return error.MissingFunction);
        }
    }
    return out;
}

// ---------------------------------------------------------------------------
// Pipelines, render passes, descriptors, commands and debug utilities.
// Layouts and values follow vulkan_core.h (Vulkan 1.0 core plus
// VK_EXT_debug_utils). Structure type values are the header's enum values.
// ---------------------------------------------------------------------------

pub const VK_SUBPASS_EXTERNAL: u32 = 0xffffffff;
pub const VK_ATTACHMENT_UNUSED: u32 = 0xffffffff;
pub const VK_ERROR_OUT_OF_POOL_MEMORY: Result = -1000069000;

pub const VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO: i32 = 18;
pub const VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO: i32 = 19;
pub const VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO: i32 = 20;
pub const VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO: i32 = 22;
pub const VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO: i32 = 23;
pub const VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO: i32 = 24;
pub const VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO: i32 = 25;
pub const VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO: i32 = 26;
pub const VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO: i32 = 27;
pub const VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO: i32 = 28;
pub const VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO: i32 = 29;
pub const VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO: i32 = 30;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO: i32 = 32;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO: i32 = 33;
pub const VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO: i32 = 34;
pub const VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET: i32 = 35;
pub const VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO: i32 = 37;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO: i32 = 38;
pub const VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO: i32 = 43;
pub const VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT: i32 = 1000128000;
pub const VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT: i32 = 1000128002;

pub const VK_ATTACHMENT_LOAD_OP_LOAD: i32 = 0;
pub const VK_ATTACHMENT_LOAD_OP_CLEAR: i32 = 1;
pub const VK_ATTACHMENT_LOAD_OP_DONT_CARE: i32 = 2;
pub const VK_ATTACHMENT_STORE_OP_STORE: i32 = 0;
pub const VK_ATTACHMENT_STORE_OP_DONT_CARE: i32 = 1;

pub const VK_PIPELINE_BIND_POINT_GRAPHICS: i32 = 0;
pub const VK_PIPELINE_BIND_POINT_COMPUTE: i32 = 1;

pub const VK_DESCRIPTOR_TYPE_SAMPLER: i32 = 0;
pub const VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER: i32 = 1;
pub const VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE: i32 = 2;
pub const VK_DESCRIPTOR_TYPE_STORAGE_IMAGE: i32 = 3;
pub const VK_DESCRIPTOR_TYPE_STORAGE_BUFFER: i32 = 7;
pub const VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC: i32 = 8;

pub const VK_SHADER_STAGE_VERTEX_BIT: Flags = 0x1;
pub const VK_SHADER_STAGE_FRAGMENT_BIT: Flags = 0x10;
pub const VK_SHADER_STAGE_COMPUTE_BIT: Flags = 0x20;

pub const VK_DYNAMIC_STATE_VIEWPORT: i32 = 0;
pub const VK_DYNAMIC_STATE_SCISSOR: i32 = 1;
pub const VK_DYNAMIC_STATE_BLEND_CONSTANTS: i32 = 4;
pub const VK_DYNAMIC_STATE_STENCIL_REFERENCE: i32 = 8;

pub const VK_POLYGON_MODE_POINT: i32 = 2;
pub const VK_CULL_MODE_NONE: Flags = 0;
pub const VK_CULL_MODE_FRONT_BIT: Flags = 0x1;
pub const VK_CULL_MODE_BACK_BIT: Flags = 0x2;
pub const VK_STENCIL_FACE_FRONT_AND_BACK: Flags = 0x3;

pub const VK_OBJECT_TYPE_DEVICE: i32 = 3;
pub const VK_OBJECT_TYPE_COMMAND_BUFFER: i32 = 6;
pub const VK_OBJECT_TYPE_BUFFER: i32 = 9;
pub const VK_OBJECT_TYPE_IMAGE: i32 = 10;
pub const VK_OBJECT_TYPE_IMAGE_VIEW: i32 = 14;
pub const VK_OBJECT_TYPE_SHADER_MODULE: i32 = 15;
pub const VK_OBJECT_TYPE_PIPELINE_LAYOUT: i32 = 17;
pub const VK_OBJECT_TYPE_RENDER_PASS: i32 = 18;
pub const VK_OBJECT_TYPE_PIPELINE: i32 = 19;
pub const VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT: i32 = 20;
pub const VK_OBJECT_TYPE_SAMPLER: i32 = 21;
pub const VK_OBJECT_TYPE_DESCRIPTOR_POOL: i32 = 22;
pub const VK_OBJECT_TYPE_FRAMEBUFFER: i32 = 24;

/// VkOffset2D.
pub const Offset2D = extern struct { x: i32, y: i32 };
/// VkRect2D.
pub const Rect2D = extern struct { offset: Offset2D, extent: Extent2D };
/// VkViewport.
pub const Viewport = extern struct { x: f32, y: f32, width: f32, height: f32, minDepth: f32, maxDepth: f32 };
/// VkClearValue: 16 bytes holding a float/int/uint color or a depth and stencil pair.
pub const ClearValue = extern struct { words: [4]u32 };

pub const PipelineShaderStageCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    stage: Flags,
    module: Handle,
    pName: [*:0]const u8,
    pSpecializationInfo: ?*const anyopaque,
};

pub const VertexInputBindingDescription = extern struct { binding: u32, stride: u32, inputRate: i32 };
pub const VertexInputAttributeDescription = extern struct { location: u32, binding: u32, format: i32, offset: u32 };

pub const PipelineVertexInputStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    vertexBindingDescriptionCount: u32,
    pVertexBindingDescriptions: ?[*]const VertexInputBindingDescription,
    vertexAttributeDescriptionCount: u32,
    pVertexAttributeDescriptions: ?[*]const VertexInputAttributeDescription,
};

pub const PipelineInputAssemblyStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    topology: i32,
    primitiveRestartEnable: Bool32,
};

pub const PipelineViewportStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    viewportCount: u32,
    pViewports: ?[*]const Viewport,
    scissorCount: u32,
    pScissors: ?[*]const Rect2D,
};

pub const PipelineRasterizationStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    depthClampEnable: Bool32,
    rasterizerDiscardEnable: Bool32,
    polygonMode: i32,
    cullMode: Flags,
    frontFace: i32,
    depthBiasEnable: Bool32,
    depthBiasConstantFactor: f32,
    depthBiasClamp: f32,
    depthBiasSlopeFactor: f32,
    lineWidth: f32,
};

pub const PipelineMultisampleStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    rasterizationSamples: Flags,
    sampleShadingEnable: Bool32,
    minSampleShading: f32,
    pSampleMask: ?*const Flags,
    alphaToCoverageEnable: Bool32,
    alphaToOneEnable: Bool32,
};

pub const StencilOpState = extern struct {
    failOp: i32,
    passOp: i32,
    depthFailOp: i32,
    compareOp: i32,
    compareMask: u32,
    writeMask: u32,
    reference: u32,
};

pub const PipelineDepthStencilStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    depthTestEnable: Bool32,
    depthWriteEnable: Bool32,
    depthCompareOp: i32,
    depthBoundsTestEnable: Bool32,
    stencilTestEnable: Bool32,
    front: StencilOpState,
    back: StencilOpState,
    minDepthBounds: f32,
    maxDepthBounds: f32,
};

pub const PipelineColorBlendAttachmentState = extern struct {
    blendEnable: Bool32,
    srcColorBlendFactor: i32,
    dstColorBlendFactor: i32,
    colorBlendOp: i32,
    srcAlphaBlendFactor: i32,
    dstAlphaBlendFactor: i32,
    alphaBlendOp: i32,
    colorWriteMask: Flags,
};

pub const PipelineColorBlendStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    logicOpEnable: Bool32,
    logicOp: i32,
    attachmentCount: u32,
    pAttachments: ?[*]const PipelineColorBlendAttachmentState,
    blendConstants: [4]f32,
};

pub const PipelineDynamicStateCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    dynamicStateCount: u32,
    pDynamicStates: ?[*]const i32,
};

pub const GraphicsPipelineCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    stageCount: u32,
    pStages: [*]const PipelineShaderStageCreateInfo,
    pVertexInputState: ?*const PipelineVertexInputStateCreateInfo,
    pInputAssemblyState: ?*const PipelineInputAssemblyStateCreateInfo,
    pTessellationState: ?*const anyopaque,
    pViewportState: ?*const PipelineViewportStateCreateInfo,
    pRasterizationState: ?*const PipelineRasterizationStateCreateInfo,
    pMultisampleState: ?*const PipelineMultisampleStateCreateInfo,
    pDepthStencilState: ?*const PipelineDepthStencilStateCreateInfo,
    pColorBlendState: ?*const PipelineColorBlendStateCreateInfo,
    pDynamicState: ?*const PipelineDynamicStateCreateInfo,
    layout: Handle,
    renderPass: Handle,
    subpass: u32,
    basePipelineHandle: Handle,
    basePipelineIndex: i32,
};

pub const ComputePipelineCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    stage: PipelineShaderStageCreateInfo,
    layout: Handle,
    basePipelineHandle: Handle,
    basePipelineIndex: i32,
};

pub const PipelineLayoutCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    setLayoutCount: u32,
    pSetLayouts: ?[*]const Handle,
    pushConstantRangeCount: u32,
    pPushConstantRanges: ?*const anyopaque,
};

pub const DescriptorSetLayoutBinding = extern struct {
    binding: u32,
    descriptorType: i32,
    descriptorCount: u32,
    stageFlags: Flags,
    pImmutableSamplers: ?*const anyopaque,
};

pub const DescriptorSetLayoutCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    bindingCount: u32,
    pBindings: ?[*]const DescriptorSetLayoutBinding,
};

pub const DescriptorPoolSize = extern struct { descriptorType: i32, descriptorCount: u32 };

pub const DescriptorPoolCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    maxSets: u32,
    poolSizeCount: u32,
    pPoolSizes: ?[*]const DescriptorPoolSize,
};

pub const DescriptorSetAllocateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    descriptorPool: Handle,
    descriptorSetCount: u32,
    pSetLayouts: [*]const Handle,
};

pub const DescriptorBufferInfo = extern struct { buffer: Handle, offset: DeviceSize, range: DeviceSize };
pub const DescriptorImageInfo = extern struct { sampler: Handle, imageView: Handle, imageLayout: i32 };

pub const WriteDescriptorSet = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    dstSet: Handle,
    dstBinding: u32,
    dstArrayElement: u32,
    descriptorCount: u32,
    descriptorType: i32,
    pImageInfo: ?[*]const DescriptorImageInfo,
    pBufferInfo: ?[*]const DescriptorBufferInfo,
    pTexelBufferView: ?*const anyopaque,
};

pub const AttachmentDescription = extern struct {
    flags: Flags,
    format: i32,
    samples: Flags,
    loadOp: i32,
    storeOp: i32,
    stencilLoadOp: i32,
    stencilStoreOp: i32,
    initialLayout: i32,
    finalLayout: i32,
};

pub const AttachmentReference = extern struct { attachment: u32, layout: i32 };

pub const SubpassDescription = extern struct {
    flags: Flags,
    pipelineBindPoint: i32,
    inputAttachmentCount: u32,
    pInputAttachments: ?*const AttachmentReference,
    colorAttachmentCount: u32,
    pColorAttachments: ?[*]const AttachmentReference,
    pResolveAttachments: ?[*]const AttachmentReference,
    pDepthStencilAttachment: ?*const AttachmentReference,
    preserveAttachmentCount: u32,
    pPreserveAttachments: ?*const u32,
};

pub const SubpassDependency = extern struct {
    srcSubpass: u32,
    dstSubpass: u32,
    srcStageMask: Flags,
    dstStageMask: Flags,
    srcAccessMask: Flags,
    dstAccessMask: Flags,
    dependencyFlags: Flags,
};

pub const RenderPassCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    attachmentCount: u32,
    pAttachments: ?[*]const AttachmentDescription,
    subpassCount: u32,
    pSubpasses: [*]const SubpassDescription,
    dependencyCount: u32,
    pDependencies: ?[*]const SubpassDependency,
};

pub const FramebufferCreateInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    flags: Flags,
    renderPass: Handle,
    attachmentCount: u32,
    pAttachments: ?[*]const Handle,
    width: u32,
    height: u32,
    layers: u32,
};

pub const RenderPassBeginInfo = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    renderPass: Handle,
    framebuffer: Handle,
    renderArea: Rect2D,
    clearValueCount: u32,
    pClearValues: ?[*]const ClearValue,
};

pub const ImageCopy = extern struct {
    srcSubresource: ImageSubresourceLayers,
    srcOffset: Offset3D,
    dstSubresource: ImageSubresourceLayers,
    dstOffset: Offset3D,
    extent: Extent3D,
};

pub const ImageBlit = extern struct {
    srcSubresource: ImageSubresourceLayers,
    srcOffsets: [2]Offset3D,
    dstSubresource: ImageSubresourceLayers,
    dstOffsets: [2]Offset3D,
};

pub const DebugUtilsObjectNameInfoEXT = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    objectType: i32,
    objectHandle: u64,
    pObjectName: ?[*:0]const u8,
};

pub const DebugUtilsLabelEXT = extern struct {
    sType: i32,
    pNext: ?*const anyopaque,
    pLabelName: [*:0]const u8,
    color: [4]f32,
};

// Header-derived ABI contract, measured from Vulkan 1.4.341's
// /usr/include/vulkan/vulkan_core.h with GCC on the Linux 64-bit ABI. The C
// probe was compiled to assembly only; no executable or GPU was run. Keep the
// values here independent of the Zig declarations so a transcription error
// cannot silently change both sides of the check. Every field is checked,
// including the anonymous VkConformanceVersion and the VkClearValue overlay.
fn assert_abi(comptime T: type, comptime size: usize, comptime alignment: usize, comptime offsets: anytype) void {
    if (@sizeOf(T) != size) @compileError("Vulkan ABI size mismatch: " ++ @typeName(T));
    if (@alignOf(T) != alignment) @compileError("Vulkan ABI alignment mismatch: " ++ @typeName(T));
    if (std.meta.fieldNames(T).len != std.meta.fieldNames(@TypeOf(offsets)).len)
        @compileError("Vulkan ABI field coverage mismatch: " ++ @typeName(T));
    for (std.meta.fieldNames(T)) |field| {
        if (@offsetOf(T, field) != @field(offsets, field))
            @compileError("Vulkan ABI offset mismatch: " ++ @typeName(T) ++ "." ++ field);
    }
}

comptime {
    @setEvalBranchQuota(10000);
    assert_abi(ApplicationInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .pApplicationName = 16,
        .applicationVersion = 24,
        .pEngineName = 32,
        .engineVersion = 40,
        .apiVersion = 44,
    });
    assert_abi(InstanceCreateInfo, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .pApplicationInfo = 24,
        .enabledLayerCount = 32,
        .ppEnabledLayerNames = 40,
        .enabledExtensionCount = 48,
        .ppEnabledExtensionNames = 56,
    });
    assert_abi(DeviceQueueCreateInfo, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .queueFamilyIndex = 20,
        .queueCount = 24,
        .pQueuePriorities = 32,
    });
    assert_abi(DeviceCreateInfo, 72, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .queueCreateInfoCount = 20,
        .pQueueCreateInfos = 24,
        .enabledLayerCount = 32,
        .ppEnabledLayerNames = 40,
        .enabledExtensionCount = 48,
        .ppEnabledExtensionNames = 56,
        .pEnabledFeatures = 64,
    });
    assert_abi(PhysicalDeviceDriverProperties, 536, 8, .{
        .sType = 0,
        .pNext = 8,
        .driverID = 16,
        .driverName = 20,
        .driverInfo = 276,
        .conformanceVersion = 532,
    });
    assert_abi(PhysicalDeviceProperties2, 840, 8, .{
        .sType = 0,
        .pNext = 8,
        .properties = 16,
    });
    assert_abi(CommandPoolCreateInfo, 24, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .queueFamilyIndex = 20,
    });
    assert_abi(CommandBufferAllocateInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .commandPool = 16,
        .level = 24,
        .commandBufferCount = 28,
    });
    assert_abi(CommandBufferBeginInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .pInheritanceInfo = 24,
    });
    assert_abi(SubmitInfo, 72, 8, .{
        .sType = 0,
        .pNext = 8,
        .waitSemaphoreCount = 16,
        .pWaitSemaphores = 24,
        .pWaitDstStageMask = 32,
        .commandBufferCount = 40,
        .pCommandBuffers = 48,
        .signalSemaphoreCount = 56,
        .pSignalSemaphores = 64,
    });
    assert_abi(FenceCreateInfo, 24, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
    });
    assert_abi(SemaphoreCreateInfo, 24, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
    });
    assert_abi(MemoryAllocateInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .allocationSize = 16,
        .memoryTypeIndex = 24,
    });
    assert_abi(BufferCreateInfo, 56, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .size = 24,
        .usage = 32,
        .sharingMode = 36,
        .queueFamilyIndexCount = 40,
        .pQueueFamilyIndices = 48,
    });
    assert_abi(ImageCreateInfo, 88, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .imageType = 20,
        .format = 24,
        .extent = 28,
        .mipLevels = 40,
        .arrayLayers = 44,
        .samples = 48,
        .tiling = 52,
        .usage = 56,
        .sharingMode = 60,
        .queueFamilyIndexCount = 64,
        .pQueueFamilyIndices = 72,
        .initialLayout = 80,
    });
    assert_abi(ComponentMapping, 16, 4, .{
        .r = 0,
        .g = 4,
        .b = 8,
        .a = 12,
    });
    assert_abi(ImageSubresourceRange, 20, 4, .{
        .aspectMask = 0,
        .baseMipLevel = 4,
        .levelCount = 8,
        .baseArrayLayer = 12,
        .layerCount = 16,
    });
    assert_abi(ImageSubresourceLayers, 16, 4, .{
        .aspectMask = 0,
        .mipLevel = 4,
        .baseArrayLayer = 8,
        .layerCount = 12,
    });
    assert_abi(ImageViewCreateInfo, 80, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .image = 24,
        .viewType = 32,
        .format = 36,
        .components = 40,
        .subresourceRange = 56,
    });
    assert_abi(SamplerCreateInfo, 80, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .magFilter = 20,
        .minFilter = 24,
        .mipmapMode = 28,
        .addressModeU = 32,
        .addressModeV = 36,
        .addressModeW = 40,
        .mipLodBias = 44,
        .anisotropyEnable = 48,
        .maxAnisotropy = 52,
        .compareEnable = 56,
        .compareOp = 60,
        .minLod = 64,
        .maxLod = 68,
        .borderColor = 72,
        .unnormalizedCoordinates = 76,
    });
    assert_abi(ShaderModuleCreateInfo, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .codeSize = 24,
        .pCode = 32,
    });
    assert_abi(MemoryBarrier, 24, 8, .{
        .sType = 0,
        .pNext = 8,
        .srcAccessMask = 16,
        .dstAccessMask = 20,
    });
    assert_abi(BufferMemoryBarrier, 56, 8, .{
        .sType = 0,
        .pNext = 8,
        .srcAccessMask = 16,
        .dstAccessMask = 20,
        .srcQueueFamilyIndex = 24,
        .dstQueueFamilyIndex = 28,
        .buffer = 32,
        .offset = 40,
        .size = 48,
    });
    assert_abi(ImageMemoryBarrier, 72, 8, .{
        .sType = 0,
        .pNext = 8,
        .srcAccessMask = 16,
        .dstAccessMask = 20,
        .oldLayout = 24,
        .newLayout = 28,
        .srcQueueFamilyIndex = 32,
        .dstQueueFamilyIndex = 36,
        .image = 40,
        .subresourceRange = 48,
    });
    assert_abi(BufferCopy, 24, 8, .{
        .srcOffset = 0,
        .dstOffset = 8,
        .size = 16,
    });
    assert_abi(Offset3D, 12, 4, .{
        .x = 0,
        .y = 4,
        .z = 8,
    });
    assert_abi(BufferImageCopy, 56, 8, .{
        .bufferOffset = 0,
        .bufferRowLength = 8,
        .bufferImageHeight = 12,
        .imageSubresource = 16,
        .imageOffset = 32,
        .imageExtent = 44,
    });
    assert_abi(SwapchainCreateInfoKHR, 104, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .surface = 24,
        .minImageCount = 32,
        .imageFormat = 36,
        .imageColorSpace = 40,
        .imageExtent = 44,
        .imageArrayLayers = 52,
        .imageUsage = 56,
        .imageSharingMode = 60,
        .queueFamilyIndexCount = 64,
        .pQueueFamilyIndices = 72,
        .preTransform = 80,
        .compositeAlpha = 84,
        .presentMode = 88,
        .clipped = 92,
        .oldSwapchain = 96,
    });
    assert_abi(PresentInfoKHR, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .waitSemaphoreCount = 16,
        .pWaitSemaphores = 24,
        .swapchainCount = 32,
        .pSwapchains = 40,
        .pImageIndices = 48,
        .pResults = 56,
    });
    assert_abi(PhysicalDeviceFeatures, 220, 4, .{
        .robustBufferAccess = 0,
        .fullDrawIndexUint32 = 4,
        .imageCubeArray = 8,
        .independentBlend = 12,
        .geometryShader = 16,
        .tessellationShader = 20,
        .sampleRateShading = 24,
        .dualSrcBlend = 28,
        .logicOp = 32,
        .multiDrawIndirect = 36,
        .drawIndirectFirstInstance = 40,
        .depthClamp = 44,
        .depthBiasClamp = 48,
        .fillModeNonSolid = 52,
        .depthBounds = 56,
        .wideLines = 60,
        .largePoints = 64,
        .alphaToOne = 68,
        .multiViewport = 72,
        .samplerAnisotropy = 76,
        .textureCompressionETC2 = 80,
        .textureCompressionASTC_LDR = 84,
        .textureCompressionBC = 88,
        .occlusionQueryPrecise = 92,
        .pipelineStatisticsQuery = 96,
        .vertexPipelineStoresAndAtomics = 100,
        .fragmentStoresAndAtomics = 104,
        .shaderTessellationAndGeometryPointSize = 108,
        .shaderImageGatherExtended = 112,
        .shaderStorageImageExtendedFormats = 116,
        .shaderStorageImageMultisample = 120,
        .shaderStorageImageReadWithoutFormat = 124,
        .shaderStorageImageWriteWithoutFormat = 128,
        .shaderUniformBufferArrayDynamicIndexing = 132,
        .shaderSampledImageArrayDynamicIndexing = 136,
        .shaderStorageBufferArrayDynamicIndexing = 140,
        .shaderStorageImageArrayDynamicIndexing = 144,
        .shaderClipDistance = 148,
        .shaderCullDistance = 152,
        .shaderFloat64 = 156,
        .shaderInt64 = 160,
        .shaderInt16 = 164,
        .shaderResourceResidency = 168,
        .shaderResourceMinLod = 172,
        .sparseBinding = 176,
        .sparseResidencyBuffer = 180,
        .sparseResidencyImage2D = 184,
        .sparseResidencyImage3D = 188,
        .sparseResidency2Samples = 192,
        .sparseResidency4Samples = 196,
        .sparseResidency8Samples = 200,
        .sparseResidency16Samples = 204,
        .sparseResidencyAliased = 208,
        .variableMultisampleRate = 212,
        .inheritedQueries = 216,
    });
    assert_abi(PhysicalDeviceSparseProperties, 20, 4, .{
        .residencyStandard2DBlockShape = 0,
        .residencyStandard2DMultisampleBlockShape = 4,
        .residencyStandard3DBlockShape = 8,
        .residencyAlignedMipSize = 12,
        .residencyNonResidentStrict = 16,
    });
    assert_abi(PhysicalDeviceLimits, 504, 8, .{
        .maxImageDimension1D = 0,
        .maxImageDimension2D = 4,
        .maxImageDimension3D = 8,
        .maxImageDimensionCube = 12,
        .maxImageArrayLayers = 16,
        .maxTexelBufferElements = 20,
        .maxUniformBufferRange = 24,
        .maxStorageBufferRange = 28,
        .maxPushConstantsSize = 32,
        .maxMemoryAllocationCount = 36,
        .maxSamplerAllocationCount = 40,
        .bufferImageGranularity = 48,
        .sparseAddressSpaceSize = 56,
        .maxBoundDescriptorSets = 64,
        .maxPerStageDescriptorSamplers = 68,
        .maxPerStageDescriptorUniformBuffers = 72,
        .maxPerStageDescriptorStorageBuffers = 76,
        .maxPerStageDescriptorSampledImages = 80,
        .maxPerStageDescriptorStorageImages = 84,
        .maxPerStageDescriptorInputAttachments = 88,
        .maxPerStageResources = 92,
        .maxDescriptorSetSamplers = 96,
        .maxDescriptorSetUniformBuffers = 100,
        .maxDescriptorSetUniformBuffersDynamic = 104,
        .maxDescriptorSetStorageBuffers = 108,
        .maxDescriptorSetStorageBuffersDynamic = 112,
        .maxDescriptorSetSampledImages = 116,
        .maxDescriptorSetStorageImages = 120,
        .maxDescriptorSetInputAttachments = 124,
        .maxVertexInputAttributes = 128,
        .maxVertexInputBindings = 132,
        .maxVertexInputAttributeOffset = 136,
        .maxVertexInputBindingStride = 140,
        .maxVertexOutputComponents = 144,
        .maxTessellationGenerationLevel = 148,
        .maxTessellationPatchSize = 152,
        .maxTessellationControlPerVertexInputComponents = 156,
        .maxTessellationControlPerVertexOutputComponents = 160,
        .maxTessellationControlPerPatchOutputComponents = 164,
        .maxTessellationControlTotalOutputComponents = 168,
        .maxTessellationEvaluationInputComponents = 172,
        .maxTessellationEvaluationOutputComponents = 176,
        .maxGeometryShaderInvocations = 180,
        .maxGeometryInputComponents = 184,
        .maxGeometryOutputComponents = 188,
        .maxGeometryOutputVertices = 192,
        .maxGeometryTotalOutputComponents = 196,
        .maxFragmentInputComponents = 200,
        .maxFragmentOutputAttachments = 204,
        .maxFragmentDualSrcAttachments = 208,
        .maxFragmentCombinedOutputResources = 212,
        .maxComputeSharedMemorySize = 216,
        .maxComputeWorkGroupCount = 220,
        .maxComputeWorkGroupInvocations = 232,
        .maxComputeWorkGroupSize = 236,
        .subPixelPrecisionBits = 248,
        .subTexelPrecisionBits = 252,
        .mipmapPrecisionBits = 256,
        .maxDrawIndexedIndexValue = 260,
        .maxDrawIndirectCount = 264,
        .maxSamplerLodBias = 268,
        .maxSamplerAnisotropy = 272,
        .maxViewports = 276,
        .maxViewportDimensions = 280,
        .viewportBoundsRange = 288,
        .viewportSubPixelBits = 296,
        .minMemoryMapAlignment = 304,
        .minTexelBufferOffsetAlignment = 312,
        .minUniformBufferOffsetAlignment = 320,
        .minStorageBufferOffsetAlignment = 328,
        .minTexelOffset = 336,
        .maxTexelOffset = 340,
        .minTexelGatherOffset = 344,
        .maxTexelGatherOffset = 348,
        .minInterpolationOffset = 352,
        .maxInterpolationOffset = 356,
        .subPixelInterpolationOffsetBits = 360,
        .maxFramebufferWidth = 364,
        .maxFramebufferHeight = 368,
        .maxFramebufferLayers = 372,
        .framebufferColorSampleCounts = 376,
        .framebufferDepthSampleCounts = 380,
        .framebufferStencilSampleCounts = 384,
        .framebufferNoAttachmentsSampleCounts = 388,
        .maxColorAttachments = 392,
        .sampledImageColorSampleCounts = 396,
        .sampledImageIntegerSampleCounts = 400,
        .sampledImageDepthSampleCounts = 404,
        .sampledImageStencilSampleCounts = 408,
        .storageImageSampleCounts = 412,
        .maxSampleMaskWords = 416,
        .timestampComputeAndGraphics = 420,
        .timestampPeriod = 424,
        .maxClipDistances = 428,
        .maxCullDistances = 432,
        .maxCombinedClipAndCullDistances = 436,
        .discreteQueuePriorities = 440,
        .pointSizeRange = 444,
        .lineWidthRange = 452,
        .pointSizeGranularity = 460,
        .lineWidthGranularity = 464,
        .strictLines = 468,
        .standardSampleLocations = 472,
        .optimalBufferCopyOffsetAlignment = 480,
        .optimalBufferCopyRowPitchAlignment = 488,
        .nonCoherentAtomSize = 496,
    });
    assert_abi(PhysicalDeviceMemoryProperties, 520, 8, .{
        .memoryTypeCount = 0,
        .memoryTypes = 4,
        .memoryHeapCount = 260,
        .memoryHeaps = 264,
    });
    assert_abi(MemoryType, 8, 4, .{
        .propertyFlags = 0,
        .heapIndex = 4,
    });
    assert_abi(MemoryHeap, 16, 8, .{
        .size = 0,
        .flags = 8,
    });
    assert_abi(PhysicalDeviceProperties, 824, 8, .{
        .apiVersion = 0,
        .driverVersion = 4,
        .vendorID = 8,
        .deviceID = 12,
        .deviceType = 16,
        .device_name = 20,
        .pipelineCacheUUID = 276,
        .limits = 296,
        .sparseProperties = 800,
    });
    assert_abi(Extent2D, 8, 4, .{
        .width = 0,
        .height = 4,
    });
    assert_abi(Extent3D, 12, 4, .{
        .width = 0,
        .height = 4,
        .depth = 8,
    });
    assert_abi(SurfaceFormatKHR, 8, 4, .{
        .format = 0,
        .colorSpace = 4,
    });
    assert_abi(ImageFormatProperties, 32, 8, .{
        .maxExtent = 0,
        .max_mip_levels = 12,
        .maxArrayLayers = 16,
        .sampleCounts = 20,
        .maxResourceSize = 24,
    });
    assert_abi(SurfaceCapabilitiesKHR, 52, 4, .{
        .minImageCount = 0,
        .maxImageCount = 4,
        .currentExtent = 8,
        .minImageExtent = 16,
        .maxImageExtent = 24,
        .maxImageArrayLayers = 32,
        .supportedTransforms = 36,
        .currentTransform = 40,
        .supportedCompositeAlpha = 44,
        .supportedUsageFlags = 48,
    });
    assert_abi(QueueFamilyProperties, 24, 4, .{
        .queueFlags = 0,
        .queueCount = 4,
        .timestampValidBits = 8,
        .minImageTransferGranularity = 12,
    });
    assert_abi(MemoryRequirements, 24, 8, .{
        .size = 0,
        .alignment = 8,
        .memoryTypeBits = 16,
    });
    assert_abi(ExtensionProperties, 260, 4, .{
        .extensionName = 0,
        .specVersion = 256,
    });
    assert_abi(LayerProperties, 520, 4, .{
        .layerName = 0,
        .specVersion = 256,
        .implementationVersion = 260,
        .description = 264,
    });
    assert_abi(Offset2D, 8, 4, .{
        .x = 0,
        .y = 4,
    });
    assert_abi(Rect2D, 16, 4, .{
        .offset = 0,
        .extent = 8,
    });
    assert_abi(Viewport, 24, 4, .{
        .x = 0,
        .y = 4,
        .width = 8,
        .height = 12,
        .minDepth = 16,
        .maxDepth = 20,
    });
    assert_abi(ClearValue, 16, 4, .{
        .words = 0,
    });
    assert_abi(PipelineShaderStageCreateInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .stage = 20,
        .module = 24,
        .pName = 32,
        .pSpecializationInfo = 40,
    });
    assert_abi(VertexInputBindingDescription, 12, 4, .{
        .binding = 0,
        .stride = 4,
        .inputRate = 8,
    });
    assert_abi(VertexInputAttributeDescription, 16, 4, .{
        .location = 0,
        .binding = 4,
        .format = 8,
        .offset = 12,
    });
    assert_abi(PipelineVertexInputStateCreateInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .vertexBindingDescriptionCount = 20,
        .pVertexBindingDescriptions = 24,
        .vertexAttributeDescriptionCount = 32,
        .pVertexAttributeDescriptions = 40,
    });
    assert_abi(PipelineInputAssemblyStateCreateInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .topology = 20,
        .primitiveRestartEnable = 24,
    });
    assert_abi(PipelineViewportStateCreateInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .viewportCount = 20,
        .pViewports = 24,
        .scissorCount = 32,
        .pScissors = 40,
    });
    assert_abi(PipelineRasterizationStateCreateInfo, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .depthClampEnable = 20,
        .rasterizerDiscardEnable = 24,
        .polygonMode = 28,
        .cullMode = 32,
        .frontFace = 36,
        .depthBiasEnable = 40,
        .depthBiasConstantFactor = 44,
        .depthBiasClamp = 48,
        .depthBiasSlopeFactor = 52,
        .lineWidth = 56,
    });
    assert_abi(PipelineMultisampleStateCreateInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .rasterizationSamples = 20,
        .sampleShadingEnable = 24,
        .minSampleShading = 28,
        .pSampleMask = 32,
        .alphaToCoverageEnable = 40,
        .alphaToOneEnable = 44,
    });
    assert_abi(StencilOpState, 28, 4, .{
        .failOp = 0,
        .passOp = 4,
        .depthFailOp = 8,
        .compareOp = 12,
        .compareMask = 16,
        .writeMask = 20,
        .reference = 24,
    });
    assert_abi(PipelineDepthStencilStateCreateInfo, 104, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .depthTestEnable = 20,
        .depthWriteEnable = 24,
        .depthCompareOp = 28,
        .depthBoundsTestEnable = 32,
        .stencilTestEnable = 36,
        .front = 40,
        .back = 68,
        .minDepthBounds = 96,
        .maxDepthBounds = 100,
    });
    assert_abi(PipelineColorBlendAttachmentState, 32, 4, .{
        .blendEnable = 0,
        .srcColorBlendFactor = 4,
        .dstColorBlendFactor = 8,
        .colorBlendOp = 12,
        .srcAlphaBlendFactor = 16,
        .dstAlphaBlendFactor = 20,
        .alphaBlendOp = 24,
        .colorWriteMask = 28,
    });
    assert_abi(PipelineColorBlendStateCreateInfo, 56, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .logicOpEnable = 20,
        .logicOp = 24,
        .attachmentCount = 28,
        .pAttachments = 32,
        .blendConstants = 40,
    });
    assert_abi(PipelineDynamicStateCreateInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .dynamicStateCount = 20,
        .pDynamicStates = 24,
    });
    assert_abi(GraphicsPipelineCreateInfo, 144, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .stageCount = 20,
        .pStages = 24,
        .pVertexInputState = 32,
        .pInputAssemblyState = 40,
        .pTessellationState = 48,
        .pViewportState = 56,
        .pRasterizationState = 64,
        .pMultisampleState = 72,
        .pDepthStencilState = 80,
        .pColorBlendState = 88,
        .pDynamicState = 96,
        .layout = 104,
        .renderPass = 112,
        .subpass = 120,
        .basePipelineHandle = 128,
        .basePipelineIndex = 136,
    });
    assert_abi(ComputePipelineCreateInfo, 96, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .stage = 24,
        .layout = 72,
        .basePipelineHandle = 80,
        .basePipelineIndex = 88,
    });
    assert_abi(PipelineLayoutCreateInfo, 48, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .setLayoutCount = 20,
        .pSetLayouts = 24,
        .pushConstantRangeCount = 32,
        .pPushConstantRanges = 40,
    });
    assert_abi(DescriptorSetLayoutBinding, 24, 8, .{
        .binding = 0,
        .descriptorType = 4,
        .descriptorCount = 8,
        .stageFlags = 12,
        .pImmutableSamplers = 16,
    });
    assert_abi(DescriptorSetLayoutCreateInfo, 32, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .bindingCount = 20,
        .pBindings = 24,
    });
    assert_abi(DescriptorPoolSize, 8, 4, .{
        .descriptorType = 0,
        .descriptorCount = 4,
    });
    assert_abi(DescriptorPoolCreateInfo, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .maxSets = 20,
        .poolSizeCount = 24,
        .pPoolSizes = 32,
    });
    assert_abi(DescriptorSetAllocateInfo, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .descriptorPool = 16,
        .descriptorSetCount = 24,
        .pSetLayouts = 32,
    });
    assert_abi(DescriptorBufferInfo, 24, 8, .{
        .buffer = 0,
        .offset = 8,
        .range = 16,
    });
    assert_abi(DescriptorImageInfo, 24, 8, .{
        .sampler = 0,
        .imageView = 8,
        .imageLayout = 16,
    });
    assert_abi(WriteDescriptorSet, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .dstSet = 16,
        .dstBinding = 24,
        .dstArrayElement = 28,
        .descriptorCount = 32,
        .descriptorType = 36,
        .pImageInfo = 40,
        .pBufferInfo = 48,
        .pTexelBufferView = 56,
    });
    assert_abi(AttachmentDescription, 36, 4, .{
        .flags = 0,
        .format = 4,
        .samples = 8,
        .loadOp = 12,
        .storeOp = 16,
        .stencilLoadOp = 20,
        .stencilStoreOp = 24,
        .initialLayout = 28,
        .finalLayout = 32,
    });
    assert_abi(AttachmentReference, 8, 4, .{
        .attachment = 0,
        .layout = 4,
    });
    assert_abi(SubpassDescription, 72, 8, .{
        .flags = 0,
        .pipelineBindPoint = 4,
        .inputAttachmentCount = 8,
        .pInputAttachments = 16,
        .colorAttachmentCount = 24,
        .pColorAttachments = 32,
        .pResolveAttachments = 40,
        .pDepthStencilAttachment = 48,
        .preserveAttachmentCount = 56,
        .pPreserveAttachments = 64,
    });
    assert_abi(SubpassDependency, 28, 4, .{
        .srcSubpass = 0,
        .dstSubpass = 4,
        .srcStageMask = 8,
        .dstStageMask = 12,
        .srcAccessMask = 16,
        .dstAccessMask = 20,
        .dependencyFlags = 24,
    });
    assert_abi(RenderPassCreateInfo, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .attachmentCount = 20,
        .pAttachments = 24,
        .subpassCount = 32,
        .pSubpasses = 40,
        .dependencyCount = 48,
        .pDependencies = 56,
    });
    assert_abi(FramebufferCreateInfo, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .flags = 16,
        .renderPass = 24,
        .attachmentCount = 32,
        .pAttachments = 40,
        .width = 48,
        .height = 52,
        .layers = 56,
    });
    assert_abi(RenderPassBeginInfo, 64, 8, .{
        .sType = 0,
        .pNext = 8,
        .renderPass = 16,
        .framebuffer = 24,
        .renderArea = 32,
        .clearValueCount = 48,
        .pClearValues = 56,
    });
    assert_abi(ImageCopy, 68, 4, .{
        .srcSubresource = 0,
        .srcOffset = 16,
        .dstSubresource = 28,
        .dstOffset = 44,
        .extent = 56,
    });
    assert_abi(ImageBlit, 80, 4, .{
        .srcSubresource = 0,
        .srcOffsets = 16,
        .dstSubresource = 40,
        .dstOffsets = 56,
    });
    assert_abi(DebugUtilsObjectNameInfoEXT, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .objectType = 16,
        .objectHandle = 24,
        .pObjectName = 32,
    });
    assert_abi(DebugUtilsLabelEXT, 40, 8, .{
        .sType = 0,
        .pNext = 8,
        .pLabelName = 16,
        .color = 24,
    });
    assert_abi(@FieldType(PhysicalDeviceDriverProperties, "conformanceVersion"), 4, 1, .{
        .major = 0,
        .minor = 1,
        .subminor = 2,
        .patch = 3,
    });
}
