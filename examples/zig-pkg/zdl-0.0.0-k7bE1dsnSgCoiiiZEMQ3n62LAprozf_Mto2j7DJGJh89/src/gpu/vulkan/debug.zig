//! Object names and command-buffer labels through VK_EXT_debug_utils.
//!
//! Port of SDL_SetGPUBufferName, SDL_InsertGPUDebugLabel,
//! SDL_PushGPUDebugGroup and SDL_PopGPUDebugGroup. Every call does nothing when
//! the instance lacks the extension, so callers never need to check. Names longer
//! than 255 bytes are truncated.

const std = @import("std");
const vk = @import("binding.zig");
const device_mod = @import("device.zig");

const Device = device_mod.Device;
const CommandBuffer = device_mod.CommandBuffer;

/// Kinds of object a debug name can be attached to.
pub const ObjectType = enum {
    buffer,
    image,
    image_view,
    sampler,
    shader_module,
    pipeline,
    pipeline_layout,
    render_pass,
    framebuffer,
    descriptor_set_layout,
    descriptor_pool,
    command_buffer,
};

const max_name = 255;

/// Attaches `name` to the object `handle` of kind `object`. `handle` is the
/// 64-bit handle value (buffer, image, and so on), not a pointer.
pub fn name_object(dev: *Device, object: ObjectType, handle: u64, name: []const u8) void {
    const set_name = dev.fns.vkSetDebugUtilsObjectNameEXT orelse return;
    var buffer = std.mem.zeroes([max_name + 1:0]u8);
    copy_name(&buffer, name);
    var info = std.mem.zeroes(vk.DebugUtilsObjectNameInfoEXT);
    info.sType = vk.VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
    info.objectType = object_type(object);
    info.objectHandle = handle;
    info.pObjectName = &buffer;
    _ = set_name(dev.device, &info);
}

/// Opens a labeled region in the command buffer. Close it with `pop_label`.
pub fn push_label(cb: *CommandBuffer, name: []const u8) void {
    const begin = cb.device.fns.vkCmdBeginDebugUtilsLabelEXT orelse return;
    var buffer = std.mem.zeroes([max_name + 1:0]u8);
    copy_name(&buffer, name);
    var label = label_info(&buffer);
    begin(cb.handle, &label);
}

/// Closes the innermost region opened by `push_label`.
pub fn pop_label(cb: *CommandBuffer) void {
    const end = cb.device.fns.vkCmdEndDebugUtilsLabelEXT orelse return;
    end(cb.handle);
}

/// Inserts a single label at the current point of the command buffer.
pub fn insert_label(cb: *CommandBuffer, name: []const u8) void {
    const insert = cb.device.fns.vkCmdInsertDebugUtilsLabelEXT orelse return;
    var buffer = std.mem.zeroes([max_name + 1:0]u8);
    copy_name(&buffer, name);
    var label = label_info(&buffer);
    insert(cb.handle, &label);
}

fn label_info(buffer: [*:0]const u8) vk.DebugUtilsLabelEXT {
    return .{
        .sType = vk.VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT,
        .pNext = null,
        .pLabelName = buffer,
        .color = .{ 0, 0, 0, 0 },
    };
}

fn copy_name(buffer: *[max_name + 1:0]u8, name: []const u8) void {
    const n = @min(name.len, max_name);
    @memcpy(buffer[0..n], name[0..n]);
}

fn object_type(object: ObjectType) i32 {
    return switch (object) {
        .buffer => vk.VK_OBJECT_TYPE_BUFFER,
        .image => vk.VK_OBJECT_TYPE_IMAGE,
        .image_view => vk.VK_OBJECT_TYPE_IMAGE_VIEW,
        .sampler => vk.VK_OBJECT_TYPE_SAMPLER,
        .shader_module => vk.VK_OBJECT_TYPE_SHADER_MODULE,
        .pipeline => vk.VK_OBJECT_TYPE_PIPELINE,
        .pipeline_layout => vk.VK_OBJECT_TYPE_PIPELINE_LAYOUT,
        .render_pass => vk.VK_OBJECT_TYPE_RENDER_PASS,
        .framebuffer => vk.VK_OBJECT_TYPE_FRAMEBUFFER,
        .descriptor_set_layout => vk.VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT,
        .descriptor_pool => vk.VK_OBJECT_TYPE_DESCRIPTOR_POOL,
        .command_buffer => vk.VK_OBJECT_TYPE_COMMAND_BUFFER,
    };
}
