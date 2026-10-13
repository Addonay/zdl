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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_murmur3_32_REAL(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub const SDL_PropertiesID = Uint32;
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
pub const struct_SDL_GPUDevice = opaque {
};
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const struct_SDL_GPUGraphicsPipeline = opaque {};
pub const SDL_GPUGraphicsPipeline = struct_SDL_GPUGraphicsPipeline;
pub const enum_SDL_GPUPrimitiveType = c_uint;
pub const SDL_GPUPrimitiveType = enum_SDL_GPUPrimitiveType;
pub const enum_SDL_GPUTextureFormat = c_uint;
pub const SDL_GPUTextureFormat = enum_SDL_GPUTextureFormat;
pub const SDL_GPU_SAMPLECOUNT_1: c_int = 0;
pub const enum_SDL_GPUSampleCount = c_uint;
pub const SDL_GPUSampleCount = enum_SDL_GPUSampleCount;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2: c_int = 10;
pub const SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4: c_int = 12;
pub const enum_SDL_GPUVertexElementFormat = c_uint;
pub const SDL_GPUVertexElementFormat = enum_SDL_GPUVertexElementFormat;
pub const enum_SDL_GPUVertexInputRate = c_uint;
pub const SDL_GPUVertexInputRate = enum_SDL_GPUVertexInputRate;
pub const SDL_GPU_FILLMODE_FILL: c_int = 0;
pub const enum_SDL_GPUFillMode = c_uint;
pub const SDL_GPUFillMode = enum_SDL_GPUFillMode;
pub const SDL_GPU_CULLMODE_NONE: c_int = 0;
pub const enum_SDL_GPUCullMode = c_uint;
pub const SDL_GPUCullMode = enum_SDL_GPUCullMode;
pub const SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE: c_int = 0;
pub const enum_SDL_GPUFrontFace = c_uint;
pub const SDL_GPUFrontFace = enum_SDL_GPUFrontFace;
pub const enum_SDL_GPUCompareOp = c_uint;
pub const SDL_GPUCompareOp = enum_SDL_GPUCompareOp;
pub const enum_SDL_GPUStencilOp = c_uint;
pub const SDL_GPUStencilOp = enum_SDL_GPUStencilOp;
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
pub const SDL_GPUColorComponentFlags = Uint8;
pub const struct_SDL_GPUVertexBufferDescription = extern struct {
    slot: Uint32 = 0,
    pitch: Uint32 = 0,
    input_rate: SDL_GPUVertexInputRate = @import("std").mem.zeroes(SDL_GPUVertexInputRate),
    instance_step_rate: Uint32 = 0,
};
pub const SDL_GPUVertexBufferDescription = struct_SDL_GPUVertexBufferDescription;
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
pub const struct_SDL_GPUStencilOpState = extern struct {
    fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    pass_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    depth_fail_op: SDL_GPUStencilOp = @import("std").mem.zeroes(SDL_GPUStencilOp),
    compare_op: SDL_GPUCompareOp = @import("std").mem.zeroes(SDL_GPUCompareOp),
};
pub const SDL_GPUStencilOpState = struct_SDL_GPUStencilOpState;
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
pub const struct_SDL_GPUMultisampleState = extern struct {
    sample_count: SDL_GPUSampleCount = @import("std").mem.zeroes(SDL_GPUSampleCount),
    sample_mask: Uint32 = 0,
    enable_mask: bool = false,
    enable_alpha_to_coverage: bool = false,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_GPUMultisampleState = struct_SDL_GPUMultisampleState;
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
pub extern fn SDL_CreateGPUGraphicsPipeline_REAL(device: ?*SDL_GPUDevice, createinfo: [*c]const SDL_GPUGraphicsPipelineCreateInfo) ?*SDL_GPUGraphicsPipeline;
pub extern fn SDL_ReleaseGPUGraphicsPipeline_REAL(device: ?*SDL_GPUDevice, graphics_pipeline: ?*SDL_GPUGraphicsPipeline) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub const VERT_SHADER_TRI_COLOR: c_int = 1;
pub const VERT_SHADER_TRI_TEXTURE: c_int = 2;
pub const GPU_VertexShaderID = c_int;
pub const GPU_FragmentShaderID = c_int;
pub const struct_GPU_Shaders = extern struct {
    vert_shaders: [3]?*SDL_GPUShader = @import("std").mem.zeroes([3]?*SDL_GPUShader),
    frag_shaders: [5]?*SDL_GPUShader = @import("std").mem.zeroes([5]?*SDL_GPUShader),
};
pub const GPU_Shaders = struct_GPU_Shaders;
pub extern fn GPU_GetVertexShader(shaders: [*c]GPU_Shaders, id: GPU_VertexShaderID) ?*SDL_GPUShader;
pub extern fn GPU_GetFragmentShader(shaders: [*c]GPU_Shaders, id: GPU_FragmentShaderID) ?*SDL_GPUShader;
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
pub export fn GPU_InitPipelineCache(cache: [*c]GPU_PipelineCache, device: ?*SDL_GPUDevice) bool {
    @setEvalBranchQuota(100000);
    cache.*.table = SDL_CreateHashTable(0, @"false" != 0, HashPipelineCacheKey, MatchPipelineCacheKey, DestroyPipelineCacheHashItem, @ptrCast(@alignCast(device)));
    return @as(?*anyopaque, @ptrCast(@alignCast(cache.*.table))) != @as(?*anyopaque, null);
}
pub export fn GPU_DestroyPipelineCache(cache: [*c]GPU_PipelineCache) void {
    @setEvalBranchQuota(100000);
    SDL_DestroyHashTable(cache.*.table);
}
pub export fn GPU_GetPipeline(cache: [*c]GPU_PipelineCache, shaders: [*c]GPU_Shaders, device: ?*SDL_GPUDevice, params: [*c]const GPU_PipelineParameters) ?*SDL_GPUGraphicsPipeline {
    @setEvalBranchQuota(100000);
    var pipeline: ?*SDL_GPUGraphicsPipeline = null;
    _ = &pipeline;
    if (!SDL_FindInHashTable(cache.*.table, @ptrCast(@alignCast(params)), @ptrCast(@alignCast(&pipeline)))) {
        var inserted: bool = @"false" != 0;
        _ = &inserted;
        var paramscpy: [*c]GPU_PipelineParameters = undefined;
        paramscpy = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(paramscpy.*)))));
        _ = &paramscpy;
        if (paramscpy != null) {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf(paramscpy.*)) == @sizeOf(@TypeOf(params.*)))) @compileError("static assertion failed \"sizeof (*(paramscpy)) == sizeof (*( params))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(paramscpy)), @ptrCast(@alignCast(params)), @sizeOf(@TypeOf(params.*)));
            pipeline = MakePipeline(device, shaders, params);
            if (pipeline != null) {
                inserted = SDL_InsertIntoHashTable(cache.*.table, @ptrCast(@alignCast(paramscpy)), @ptrCast(@alignCast(pipeline)), @"false" != 0);
            }
        }
        if (!inserted) {
            SDL_free_REAL(@ptrCast(@alignCast(paramscpy)));
            if (pipeline != null) {
                SDL_ReleaseGPUGraphicsPipeline_REAL(device, pipeline);
                pipeline = null;
            }
        }
    }
    return pipeline;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
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
pub extern fn SDL_GetBlendModeSrcColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstColorFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeColorOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub extern fn SDL_GetBlendModeSrcAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeDstAlphaFactor(blendMode: SDL_BlendMode) SDL_BlendFactor;
pub extern fn SDL_GetBlendModeAlphaOperation(blendMode: SDL_BlendMode) SDL_BlendOperation;
pub fn HashPipelineCacheKey(_: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var params: [*c]const GPU_PipelineParameters = @ptrCast(@alignCast(key));
    _ = &params;
    return SDL_murmur3_32_REAL(@ptrCast(@alignCast(params)), @sizeOf(@TypeOf(params.*)), 0);
}
pub fn MatchPipelineCacheKey(_: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_memcmp_REAL(a, b, @sizeOf(GPU_PipelineParameters)) == @as(c_int, 0);
}
pub fn DestroyPipelineCacheHashItem(userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pipeline: ?*SDL_GPUGraphicsPipeline = @ptrCast(@alignCast(@constCast(value)));
    _ = &pipeline;
    var device: ?*SDL_GPUDevice = @ptrCast(@alignCast(userdata));
    _ = &device;
    SDL_ReleaseGPUGraphicsPipeline_REAL(device, pipeline);
    SDL_free_REAL(@ptrCast(@alignCast(@as([*c]GPU_PipelineParameters, @ptrCast(@alignCast(@constCast(key)))))));
}
pub fn MakePipeline(device: ?*SDL_GPUDevice, shaders: [*c]GPU_Shaders, params: [*c]const GPU_PipelineParameters) callconv(.c) ?*SDL_GPUGraphicsPipeline {
    @setEvalBranchQuota(100000);
    var ad: SDL_GPUColorTargetDescription = undefined;
    _ = &ad;
    var blend: SDL_BlendMode = undefined;
    _ = &blend;
    var pci: SDL_GPUGraphicsPipelineCreateInfo = undefined;
    _ = &pci;
    var vertex_buffer_desc: SDL_GPUVertexBufferDescription = undefined;
    _ = &vertex_buffer_desc;
    var num_attribs: Uint32 = undefined;
    _ = &num_attribs;
    var attribs: [4]SDL_GPUVertexAttribute = undefined;
    _ = &attribs;
    var have_attr_uv: bool = undefined;
    _ = &have_attr_uv;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memset(@ptrCast(@alignCast(&ad)), 0, @sizeOf(@TypeOf(ad)));
                ad.format = params.*.attachment_format;
                blend = params.*.blend_mode;
                ad.blend_state.enable_blend = blend != @as(SDL_BlendMode, 0);
                ad.blend_state.color_write_mask = 15;
                ad.blend_state.alpha_blend_op = GPU_ConvertBlendOperation(SDL_GetBlendModeAlphaOperation(blend));
                ad.blend_state.dst_alpha_blendfactor = GPU_ConvertBlendFactor(SDL_GetBlendModeDstAlphaFactor(blend));
                ad.blend_state.src_alpha_blendfactor = GPU_ConvertBlendFactor(SDL_GetBlendModeSrcAlphaFactor(blend));
                ad.blend_state.color_blend_op = GPU_ConvertBlendOperation(SDL_GetBlendModeColorOperation(blend));
                ad.blend_state.dst_color_blendfactor = GPU_ConvertBlendFactor(SDL_GetBlendModeDstColorFactor(blend));
                ad.blend_state.src_color_blendfactor = GPU_ConvertBlendFactor(SDL_GetBlendModeSrcColorFactor(blend));
                _ = memset(@ptrCast(@alignCast(&pci)), 0, @sizeOf(@TypeOf(pci)));
                pci.target_info.has_depth_stencil_target = @"false" != 0;
                pci.target_info.num_color_targets = 1;
                pci.target_info.color_target_descriptions = &ad;
                pci.vertex_shader = GPU_GetVertexShader(shaders, params.*.vert_shader);
                pci.fragment_shader = GPU_GetFragmentShader(shaders, params.*.frag_shader);
                pci.multisample_state.sample_count = SDL_GPU_SAMPLECOUNT_1;
                pci.multisample_state.enable_mask = @"false" != 0;
                pci.primitive_type = params.*.primitive_type;
                pci.rasterizer_state.cull_mode = SDL_GPU_CULLMODE_NONE;
                pci.rasterizer_state.fill_mode = SDL_GPU_FILLMODE_FILL;
                pci.rasterizer_state.front_face = SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE;
                pci.rasterizer_state.enable_depth_clip = @"true" != 0;
                _ = memset(@ptrCast(@alignCast(&vertex_buffer_desc)), 0, @sizeOf(@TypeOf(vertex_buffer_desc)));
                num_attribs = 0;
                _ = memset(@ptrCast(@alignCast(&attribs)), 0, @sizeOf(@TypeOf(attribs)));
                have_attr_uv = @"false" != 0;
                switch (params.*.vert_shader) {
                    VERT_SHADER_TRI_COLOR => {
                        sdl_pc = 2;
                        continue;
                    },
                    VERT_SHADER_TRI_TEXTURE => {
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
                attribs[num_attribs].location = num_attribs;
                attribs[num_attribs].format = SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
                attribs[num_attribs].offset = vertex_buffer_desc.pitch;
                {
                    const ref = &vertex_buffer_desc.pitch;
                    ref.* = @truncate(@as(c_ulong, ref.*) +% (@as(c_ulong, 2) *% @sizeOf(f32)));
                }
                num_attribs +%= 1;
                attribs[num_attribs].location = num_attribs;
                attribs[num_attribs].format = SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4;
                attribs[num_attribs].offset = vertex_buffer_desc.pitch;
                {
                    const ref = &vertex_buffer_desc.pitch;
                    ref.* = @truncate(@as(c_ulong, ref.*) +% (@as(c_ulong, 4) *% @sizeOf(f32)));
                }
                num_attribs +%= 1;
                if (have_attr_uv) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            2 => {
                have_attr_uv = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                have_attr_uv = @"true" != 0;
                {
                    sdl_pc = 1;
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
                attribs[num_attribs].location = num_attribs;
                attribs[num_attribs].format = SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2;
                attribs[num_attribs].offset = vertex_buffer_desc.pitch;
                {
                    const ref = &vertex_buffer_desc.pitch;
                    ref.* = @truncate(@as(c_ulong, ref.*) +% (@as(c_ulong, 2) *% @sizeOf(f32)));
                }
                num_attribs +%= 1;
                {
                    sdl_pc = 7;
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
                pci.vertex_input_state.num_vertex_attributes = num_attribs;
                pci.vertex_input_state.vertex_attributes = @ptrCast(@alignCast(&attribs));
                pci.vertex_input_state.num_vertex_buffers = 1;
                pci.vertex_input_state.vertex_buffer_descriptions = &vertex_buffer_desc;
                return SDL_CreateGPUGraphicsPipeline_REAL(device, &pci);
            },
            else => unreachable,
        }
    }
}
