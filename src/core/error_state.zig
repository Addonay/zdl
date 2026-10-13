const std = @import("std");

pub const Code = enum(c_uint) { none, generic, out_of_memory, _ };
pub const Message = extern struct {
    code: Code = .none,
    buffer: ?[*]u8 = null,
    capacity: usize = 0,
};
pub const State = extern struct {
    messages: [2]Message = .{ .{}, .{} },
    current: c_int = 0,
    reallocate: ?*const fn (?*anyopaque, usize) callconv(.c) ?*anyopaque = null,
    free: ?*const fn (?*anyopaque) callconv(.c) void = null,

    pub fn active(self: *State) *Message {
        return &self.messages[@intCast(self.current)];
    }

    pub fn activeConst(self: *const State) *const Message {
        return &self.messages[@intCast(self.current)];
    }
};

extern fn SDL_GetErrBuf(create: bool) ?*State;
extern fn SDL_vsnprintf_REAL(output: ?[*]u8, capacity: usize, format: [*:0]const u8, args: *std.lang.VaList) c_int;

pub fn format(message: [*:0]const u8, args: *std.lang.VaList) void {
    const state = SDL_GetErrBuf(true) orelse return;
    state.current = if (state.current == 0) 1 else 0;
    const slot = state.active();
    slot.code = .generic;

    const required = write(slot, message, args);
    if (required < 0 or @as(usize, @intCast(required)) < slot.capacity) return;
    const reallocate = state.reallocate orelse return;
    const capacity = @as(usize, @intCast(required)) + 1;
    const memory = reallocate(if (slot.buffer) |buffer| buffer else null, capacity) orelse return;
    slot.buffer = @ptrCast(memory);
    slot.capacity = capacity;
    _ = write(slot, message, args);
}

fn write(slot: *Message, text: [*:0]const u8, args: *std.lang.VaList) c_int {
    var copy = @cVaCopy(args);
    defer @cVaEnd(&copy);
    return SDL_vsnprintf_REAL(slot.buffer, slot.capacity, text, &copy);
}

pub fn get() ?[*:0]const u8 {
    const state = SDL_GetErrBuf(false) orelse return "";
    const slot = state.activeConst();
    return switch (slot.code) {
        .generic => if (slot.buffer) |buffer| @ptrCast(buffer) else null,
        .out_of_memory => "Out of memory",
        else => "",
    };
}

pub fn clear() void {
    if (SDL_GetErrBuf(false)) |state| state.active().code = .none;
}

pub fn outOfMemory() void {
    if (SDL_GetErrBuf(true)) |state| state.active().code = .out_of_memory;
}
