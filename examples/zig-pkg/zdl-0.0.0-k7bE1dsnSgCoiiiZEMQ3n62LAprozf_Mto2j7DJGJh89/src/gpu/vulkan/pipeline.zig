//! Graphics and compute pipelines over SDL's fixed resource layout.
//!
//! Port of SDL_gpu_vulkan.c's VULKAN_CreateGraphicsPipeline and
//! VULKAN_CreateComputePipeline with their resource layouts (see
//! `descriptors.zig` for the set numbering). Each pipeline owns its descriptor
//! set layouts and pipeline layout. `deinit` releases ownership; recorded and
//! submitted commands retain the pipeline and its layouts until completion.
//!
//! Dynamic state: viewport, scissor, blend constants and stencil reference are
//! dynamic, as in SDL, and are set on the render pass or through `set_*` calls.
//!
//! Deliberate differences: the compute `threadcount` fields are accepted but
//! unused, because Vulkan takes the local size from the shader and SDL's Vulkan
//! backend does not use them either. Pipelines are created against a
//! compatible render pass built from the target formats with load and store
//! operations; render passes with other load and store operations remain
//! compatible.

const std = @import("std");
const types = @import("../types.zig");
const vk = @import("binding.zig");
const tables = @import("tables.zig");
const descriptors = @import("descriptors.zig");
const pass = @import("pass.zig");
const device_mod = @import("device.zig");

const Device = device_mod.Device;
const Shader = device_mod.Shader;
const Error = device_mod.Error;

/// Vertex buffer slots and attributes Vulkan pipelines accept here (SDL's limits).
pub const max_vertex_buffers = 16;
pub const max_vertex_attributes = 16;
/// Color targets per pipeline and per render pass (SDL's MAX_COLOR_TARGET_BINDINGS).
pub const max_color_targets = 8;

/// Descriptor counts one graphics shader stage declares.
pub const StageCounts = struct {
    samplers: u32 = 0,
    storage_textures: u32 = 0,
    storage_buffers: u32 = 0,
    uniform_buffers: u32 = 0,
};

/// Borrowed graphics pipeline description with typed shader references.
/// The field meanings follow `types.GraphicsPipelineCreateInfo`, which keeps
/// untyped shader placeholders for compatibility.
pub const GraphicsPipelineInfo = struct {
    vertex_shader: *const Shader,
    fragment_shader: *const Shader,
    vertex_input_state: types.VertexInputState = .{},
    primitive_type: types.PrimitiveType = .triangle_list,
    rasterizer_state: types.RasterizerState = .{},
    multisample_state: types.MultisampleState = .{},
    depth_stencil_state: types.DepthStencilState = .{},
    target_info: types.GraphicsPipelineTargetInfo = .{},
};

/// A graphics pipeline. Bind it with a render pass; `deinit` releases it once
/// the GPU no longer uses it.
pub const GraphicsPipeline = struct {
    device: *Device,
    handle: vk.Handle,
    backing: *device_mod.ObjectBacking,
    /// Borrowed from the device's resource-layout cache; `backing` retains it.
    layout: vk.Handle,
    /// Set layouts 0 to 3: vertex read, vertex uniform, fragment read, fragment uniform.
    set_layouts: [4]vk.Handle,
    resource: descriptors.ResourceLayoutKey,
    /// Counts per stage: index 0 is vertex, index 1 is fragment.
    counts: [2]StageCounts,
    /// Number of color targets the pipeline writes.
    color_target_count: u32,
    /// Whether the pipeline was built against a render pass with resolve
    /// attachments (multisampled pipelines). A pass must match this.
    resolve_attachments: bool,

    pub fn deinit(self: *GraphicsPipeline) void {
        device_mod.release_object(self.device, self.backing);
        self.* = undefined;
    }
};

/// A compute pipeline. The read-only set comes first, then read-write storage,
/// then uniform buffers.
pub const ComputePipeline = struct {
    device: *Device,
    handle: vk.Handle,
    backing: *device_mod.ObjectBacking,
    /// Borrowed from the device's resource-layout cache; `backing` retains it.
    layout: vk.Handle,
    set_layouts: [3]vk.Handle,
    resource: descriptors.ResourceLayoutKey,
    read_samplers: u32,
    read_textures: u32,
    read_buffers: u32,
    write_textures: u32,
    write_buffers: u32,
    uniform_buffers: u32,

    pub fn deinit(self: *ComputePipeline) void {
        device_mod.release_object(self.device, self.backing);
        self.* = undefined;
    }
};

/// Creates a graphics pipeline. Fails with `WrongShaderStage` when the shaders
/// are not vertex and fragment, with `UnsupportedFeature` for unsupported
/// rasterization or independent blending, and with the binding limits otherwise.
pub fn create_graphics_pipeline(dev: *Device, info: GraphicsPipelineInfo) Error!GraphicsPipeline {
    if (info.vertex_shader.stage != .vertex or info.fragment_shader.stage != .fragment) return error.WrongShaderStage;
    if (info.rasterizer_state.fill_mode == .line and !dev.features.fill_mode_non_solid) return error.UnsupportedFeature;
    if (!info.rasterizer_state.enable_depth_clip and !dev.features.depth_clamp) return error.UnsupportedFeature;
    if (info.rasterizer_state.depth_bias_clamp != 0 and !dev.features.depth_bias_clamp) return error.UnsupportedFeature;
    const inputs = info.vertex_input_state;
    if (inputs.vertex_buffer_descriptions.len > max_vertex_buffers) return error.TooManyVertexBuffers;
    if (inputs.vertex_attributes.len > max_vertex_attributes) return error.TooManyVertexAttributes;
    const targets = info.target_info.color_target_descriptions;
    if (targets.len > max_color_targets) return error.TooManyColorTargets;

    var bindings: [max_vertex_buffers]vk.VertexInputBindingDescription = undefined;
    for (inputs.vertex_buffer_descriptions, 0..) |desc, i| {
        bindings[i] = .{
            .binding = desc.slot,
            .stride = desc.pitch,
            .inputRate = tables.vertex_input_rate[@backingInt(desc.input_rate)],
        };
    }
    var attributes: [max_vertex_attributes]vk.VertexInputAttributeDescription = undefined;
    for (inputs.vertex_attributes, 0..) |attr, i| {
        attributes[i] = .{
            .location = attr.location,
            .binding = attr.buffer_slot,
            .format = tables.vertex_format(attr.format),
            .offset = attr.offset,
        };
    }
    var vertex_input = std.mem.zeroes(vk.PipelineVertexInputStateCreateInfo);
    vertex_input.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;
    vertex_input.vertexBindingDescriptionCount = @intCast(inputs.vertex_buffer_descriptions.len);
    vertex_input.pVertexBindingDescriptions = &bindings;
    vertex_input.vertexAttributeDescriptionCount = @intCast(inputs.vertex_attributes.len);
    vertex_input.pVertexAttributeDescriptions = &attributes;

    var input_assembly = std.mem.zeroes(vk.PipelineInputAssemblyStateCreateInfo);
    input_assembly.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
    input_assembly.topology = tables.primitive_topology[@backingInt(info.primitive_type)];

    // Viewport and scissor are dynamic; the counts still must be 1.
    var viewport = std.mem.zeroes(vk.PipelineViewportStateCreateInfo);
    viewport.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
    viewport.viewportCount = 1;
    viewport.scissorCount = 1;

    const r = info.rasterizer_state;
    var rasterization = std.mem.zeroes(vk.PipelineRasterizationStateCreateInfo);
    rasterization.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
    // SDL inverts the flag: depth clip off means depth clamp on.
    rasterization.depthClampEnable = @intFromBool(!r.enable_depth_clip);
    rasterization.polygonMode = tables.polygon_mode[@backingInt(r.fill_mode)];
    rasterization.cullMode = tables.cull_mode[@backingInt(r.cull_mode)];
    rasterization.frontFace = tables.front_face[@backingInt(r.front_face)];
    rasterization.depthBiasEnable = @intFromBool(r.enable_depth_bias);
    rasterization.depthBiasConstantFactor = r.depth_bias_constant_factor;
    rasterization.depthBiasClamp = r.depth_bias_clamp;
    rasterization.depthBiasSlopeFactor = r.depth_bias_slope_factor;
    rasterization.lineWidth = 1;

    const m = info.multisample_state;
    var sample_mask: vk.Flags = m.sample_mask;
    var multisample = std.mem.zeroes(vk.PipelineMultisampleStateCreateInfo);
    multisample.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
    multisample.rasterizationSamples = tables.sample_count_bits[@backingInt(m.sample_count)];
    multisample.pSampleMask = if (m.enable_mask) &sample_mask else null;
    multisample.alphaToCoverageEnable = @intFromBool(m.enable_alpha_to_coverage);

    const ds = info.depth_stencil_state;
    var depth_stencil = std.mem.zeroes(vk.PipelineDepthStencilStateCreateInfo);
    depth_stencil.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO;
    depth_stencil.depthTestEnable = @intFromBool(ds.enable_depth_test);
    depth_stencil.depthWriteEnable = @intFromBool(ds.enable_depth_write);
    depth_stencil.depthCompareOp = tables.compare_op[@backingInt(ds.compare_op)];
    depth_stencil.stencilTestEnable = @intFromBool(ds.enable_stencil_test);
    depth_stencil.front = stencil_state(ds.front_stencil_state, ds.compare_mask, ds.write_mask);
    depth_stencil.back = stencil_state(ds.back_stencil_state, ds.compare_mask, ds.write_mask);

    var blend_attachments: [max_color_targets]vk.PipelineColorBlendAttachmentState = undefined;
    for (targets, 0..) |target, i| {
        const b = target.blend_state;
        blend_attachments[i] = .{
            .blendEnable = @intFromBool(b.enable_blend),
            .srcColorBlendFactor = tables.blend_factor[@backingInt(b.src_color_blendfactor)],
            .dstColorBlendFactor = tables.blend_factor[@backingInt(b.dst_color_blendfactor)],
            .colorBlendOp = tables.blend_op[@backingInt(b.color_blend_op)],
            .srcAlphaBlendFactor = tables.blend_factor[@backingInt(b.src_alpha_blendfactor)],
            .dstAlphaBlendFactor = tables.blend_factor[@backingInt(b.dst_alpha_blendfactor)],
            .alphaBlendOp = tables.blend_op[@backingInt(b.alpha_blend_op)],
            .colorWriteMask = if (b.enable_color_write_mask) @as(u8, @bitCast(b.color_write_mask)) else 0xf,
        };
        // Vulkan requires every attachment state to match when independent
        // blending is disabled, including its effective color write mask.
        if (i > 0 and !dev.features.independent_blend and !std.meta.eql(blend_attachments[0], blend_attachments[i])) {
            return error.UnsupportedFeature;
        }
    }
    var color_blend = std.mem.zeroes(vk.PipelineColorBlendStateCreateInfo);
    color_blend.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
    color_blend.attachmentCount = @intCast(targets.len);
    color_blend.pAttachments = if (targets.len > 0) &blend_attachments else null;

    var dynamic_states = [_]i32{
        vk.VK_DYNAMIC_STATE_VIEWPORT,
        vk.VK_DYNAMIC_STATE_SCISSOR,
        vk.VK_DYNAMIC_STATE_BLEND_CONSTANTS,
        vk.VK_DYNAMIC_STATE_STENCIL_REFERENCE,
    };
    var dynamic = std.mem.zeroes(vk.PipelineDynamicStateCreateInfo);
    dynamic.sType = vk.VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO;
    dynamic.dynamicStateCount = dynamic_states.len;
    dynamic.pDynamicStates = &dynamic_states;

    // Resource layout: vertex sets 0 and 1, fragment sets 2 and 3. Shared with
    // every other pipeline that declares the same counts.
    const vs = shader_counts(info.vertex_shader);
    const fs = shader_counts(info.fragment_shader);
    const specs = [4]descriptors.SetSpec{
        .{ .stages = vk.VK_SHADER_STAGE_VERTEX_BIT, .samplers = vs.samplers, .read_textures = vs.storage_textures, .read_buffers = vs.storage_buffers },
        .{ .stages = vk.VK_SHADER_STAGE_VERTEX_BIT, .uniforms = vs.uniform_buffers },
        .{ .stages = vk.VK_SHADER_STAGE_FRAGMENT_BIT, .samplers = fs.samplers, .read_textures = fs.storage_textures, .read_buffers = fs.storage_buffers },
        .{ .stages = vk.VK_SHADER_STAGE_FRAGMENT_BIT, .uniforms = fs.uniform_buffers },
    };
    const resource = try descriptors.acquire_resource_layout(dev, &specs);
    errdefer descriptors.release_resource_layout(dev, resource.key);

    // Multisampled pipelines are resolved, so their render pass carries resolve
    // attachments. Passes with resolve targets are then compatible (see pass.zig).
    const resolve = m.sample_count != .@"1";
    const render_pass = try pass.compatible_render_pass_resolving(dev, targets, info.target_info.depth_stencil_format, m.sample_count, resolve);

    var stages = [_]vk.PipelineShaderStageCreateInfo{
        stage_info(info.vertex_shader, vk.VK_SHADER_STAGE_VERTEX_BIT),
        stage_info(info.fragment_shader, vk.VK_SHADER_STAGE_FRAGMENT_BIT),
    };
    var create = std.mem.zeroes(vk.GraphicsPipelineCreateInfo);
    create.sType = vk.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
    create.stageCount = stages.len;
    create.pStages = &stages;
    create.pVertexInputState = &vertex_input;
    create.pInputAssemblyState = &input_assembly;
    create.pViewportState = &viewport;
    create.pRasterizationState = &rasterization;
    create.pMultisampleState = &multisample;
    create.pDepthStencilState = &depth_stencil;
    create.pColorBlendState = &color_blend;
    create.pDynamicState = &dynamic;
    create.layout = resource.layout;
    create.renderPass = render_pass;
    create.subpass = 0;

    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateGraphicsPipelines(dev.device, 0, 1, @ptrCast(&create), null, &handle));
    errdefer dev.fns.vkDestroyPipeline(dev.device, handle, null);
    const backing = try dev.create_object_backing(.{ .pipeline = handle }, resource.key);
    return .{
        .device = dev,
        .handle = handle,
        .backing = backing,
        .layout = resource.layout,
        .set_layouts = resource.sets,
        .resource = resource.key,
        .counts = .{ vs, fs },
        .color_target_count = @intCast(targets.len),
        .resolve_attachments = resolve,
    };
}

/// Creates a compute pipeline from SPIR-V in `info.code`. The module is built
/// and destroyed inside this call; the pipeline keeps no reference to it.
pub fn create_compute_pipeline(dev: *Device, info: types.ComputePipelineCreateInfo) Error!ComputePipeline {
    if (!info.format.spirv) return error.UnsupportedShaderFormat;
    if (info.entrypoint.len == 0 or info.entrypoint.len >= device_mod.max_entrypoint_len + 1) return error.InvalidEntrypoint;
    const module = try device_mod.create_module(dev, info.code);
    defer dev.fns.vkDestroyShaderModule(dev.device, module, null);

    var entry = std.mem.zeroes([device_mod.max_entrypoint_len + 1:0]u8);
    @memcpy(entry[0..info.entrypoint.len], info.entrypoint);

    const specs = [3]descriptors.SetSpec{
        .{
            .stages = vk.VK_SHADER_STAGE_COMPUTE_BIT,
            .samplers = info.num_samplers,
            .read_textures = info.num_readonly_storage_textures,
            .read_buffers = info.num_readonly_storage_buffers,
        },
        .{
            .stages = vk.VK_SHADER_STAGE_COMPUTE_BIT,
            .write_textures = info.num_readwrite_storage_textures,
            .write_buffers = info.num_readwrite_storage_buffers,
        },
        .{ .stages = vk.VK_SHADER_STAGE_COMPUTE_BIT, .uniforms = info.num_uniform_buffers },
    };
    const resource = try descriptors.acquire_resource_layout(dev, &specs);
    errdefer descriptors.release_resource_layout(dev, resource.key);

    var create = std.mem.zeroes(vk.ComputePipelineCreateInfo);
    create.sType = vk.VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO;
    create.stage = .{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        .pNext = null,
        .flags = 0,
        .stage = vk.VK_SHADER_STAGE_COMPUTE_BIT,
        .module = module,
        .pName = @ptrCast(&entry),
        .pSpecializationInfo = null,
    };
    create.layout = resource.layout;
    var handle: vk.Handle = 0;
    _ = try vk.check(dev.fns.vkCreateComputePipelines(dev.device, 0, 1, @ptrCast(&create), null, &handle));
    errdefer dev.fns.vkDestroyPipeline(dev.device, handle, null);
    const backing = try dev.create_object_backing(.{ .pipeline = handle }, resource.key);
    return .{
        .device = dev,
        .handle = handle,
        .backing = backing,
        .layout = resource.layout,
        .set_layouts = .{ resource.sets[0], resource.sets[1], resource.sets[2] },
        .resource = resource.key,
        .read_samplers = info.num_samplers,
        .read_textures = info.num_readonly_storage_textures,
        .read_buffers = info.num_readonly_storage_buffers,
        .write_textures = info.num_readwrite_storage_textures,
        .write_buffers = info.num_readwrite_storage_buffers,
        .uniform_buffers = info.num_uniform_buffers,
    };
}

fn shader_counts(shader: *const Shader) StageCounts {
    return .{
        .samplers = shader.num_samplers,
        .storage_textures = shader.num_storage_textures,
        .storage_buffers = shader.num_storage_buffers,
        .uniform_buffers = shader.num_uniform_buffers,
    };
}

fn stage_info(shader: *const Shader, stage: vk.Flags) vk.PipelineShaderStageCreateInfo {
    return .{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
        .pNext = null,
        .flags = 0,
        .stage = stage,
        .module = shader.handle,
        .pName = @ptrCast(&shader.entrypoint),
        .pSpecializationInfo = null,
    };
}

fn stencil_state(state: types.StencilOpState, compare_mask: u8, write_mask: u8) vk.StencilOpState {
    return .{
        .failOp = tables.stencil_op[@backingInt(state.fail_op)],
        .passOp = tables.stencil_op[@backingInt(state.pass_op)],
        .depthFailOp = tables.stencil_op[@backingInt(state.depth_fail_op)],
        .compareOp = tables.compare_op[@backingInt(state.compare_op)],
        .compareMask = compare_mask,
        .writeMask = write_mask,
        .reference = 0,
    };
}
