#!/usr/bin/env python3
"""Install the native Zig implementations of SDL's core GUID and list helpers."""
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def write(name,body):
    original=(ROOT/'.ref/SDL/src'/f'{name}.c').read_text()
    notice=''.join('// '+line+'\n' for line in original[:original.index('*/')+2].splitlines())
    (ROOT/'src'/f'{name}.zig').write_text(notice+'// Native Zig implementation; SDL ABI adapters follow the implementation.\n'+body)

write('SDL_guid', '''const std = @import("std");
pub const Guid = @import("guid").Guid;
pub const SDL_GUID = Guid;

pub export fn SDL_GUIDToString_REAL(guid: Guid, output: ?[*]u8, capacity: c_int) void {
    const destination = output orelse return;
    if (capacity <= 0) return;
    const count = @min(@as(usize, @intCast(capacity - 1)) / 2, guid.data.len) * 2;
    const formatted = guid.format();
    @memcpy(destination[0..count], formatted[0..count]);
    destination[count] = 0;
}

pub export fn SDL_StringToGUID_REAL(text: [*:0]const u8) Guid {
    return Guid.parse(std.mem.span(text));
}

pub const SDL_GUIDToString = SDL_GUIDToString_REAL;
pub const SDL_StringToGUID = SDL_StringToGUID_REAL;
''')

write('SDL_list', '''extern fn SDL_malloc_REAL(bytes: usize) ?*anyopaque;
extern fn SDL_free_REAL(memory: ?*anyopaque) void;

pub const Node = extern struct {
    entry: ?*anyopaque,
    next: ?*Node = null,
};
pub const SDL_ListNode = Node;

fn create(entry: ?*anyopaque) error{OutOfMemory}!*Node {
    const memory = SDL_malloc_REAL(@sizeOf(Node)) orelse return error.OutOfMemory;
    const node: *Node = @ptrCast(@alignCast(memory));
    node.* = .{ .entry = entry };
    return node;
}

pub fn append(head: *?*Node, entry: ?*anyopaque) error{OutOfMemory}!void {
    var link = head;
    while (link.*) |node| link = &node.next;
    link.* = try create(entry);
}

pub fn push(head: *?*Node, entry: ?*anyopaque) error{OutOfMemory}!void {
    const node = try create(entry);
    node.next = head.*;
    head.* = node;
}

pub fn insert(head: *?*Node, position: c_int, entry: ?*anyopaque) error{OutOfMemory}!void {
    if (position == -1) return append(head, entry);
    // SDL's existing position-zero behavior inserts two entries. Retain it
    // until behavioral changes can be discussed separately from this port.
    if (position == 0) try push(head, entry);
    var current = head.*;
    var remaining: usize = if (position > 1) @intCast(position - 2) else 0;
    while (remaining > 0) : (remaining -= 1) {
        const node = current orelse break;
        current = node.next;
    }
    const previous = current orelse return append(head, entry);
    const node = try create(entry);
    node.next = previous.next;
    previous.next = node;
}

pub fn pop(head: *?*Node) ?Node {
    var link = head;
    while (link.*) |node| {
        if (node.next != null) { link = &node.next; continue; }
        const result = node.*;
        link.* = null;
        SDL_free_REAL(node);
        return result;
    }
    return null;
}

pub fn remove(head: *?*Node, entry: ?*anyopaque) void {
    var link = head;
    while (link.*) |node| {
        if (node.entry == entry) {
            link.* = node.next;
            SDL_free_REAL(node);
            return;
        }
        link = &node.next;
    }
}

pub fn clear(head: *?*Node) void {
    var current = head.*;
    head.* = null;
    while (current) |node| {
        current = node.next;
        SDL_free_REAL(node);
    }
}

pub fn count(head: ?*const Node) usize {
    var current = head;
    var length: usize = 0;
    while (current) |node| : (current = node.next) length += 1;
    return length;
}

pub export fn SDL_ListAppend(head: ?*?*Node, entry: ?*anyopaque) bool {
    append(head orelse return false, entry) catch return false;
    return true;
}
pub export fn SDL_ListAdd(head: *?*Node, entry: ?*anyopaque) bool {
    push(head, entry) catch return false;
    return true;
}
pub export fn SDL_ListInsertAtPosition(head: *?*Node, position: c_int, entry: ?*anyopaque) bool {
    insert(head, position, entry) catch return false;
    return true;
}
pub export fn SDL_ListPop(head: ?*?*Node, entry: ?*?*anyopaque) void {
    const node = pop(head orelse return) orelse return;
    if (entry) |output| output.* = node.entry;
}
pub export fn SDL_ListRemove(head: *?*Node, entry: ?*anyopaque) void { remove(head, entry); }
pub export fn SDL_ListClear(head: *?*Node) void { clear(head); }
pub export fn SDL_ListCountEntries(head: *?*Node) c_int { return @intCast(count(head.*)); }
''')

write('SDL_error', '''const std = @import("std");
pub const errors = @import("core/error_state.zig");

pub export fn SDL_SetError_REAL(format: ?[*:0]const u8, ...) bool {
    const text = format orelse return false;
    var args = @cVaStart();
    defer @cVaEnd(&args);
    errors.format(text, &args);
    return false;
}

pub export fn SDL_SetErrorV_REAL(format: ?[*:0]const u8, args: ?*std.lang.VaList) bool {
    errors.format(format orelse return false, args orelse return false);
    return false;
}

pub export fn SDL_GetError_REAL() ?[*:0]const u8 { return errors.get(); }
pub export fn SDL_ClearError_REAL() bool { errors.clear(); return true; }
pub export fn SDL_OutOfMemory_REAL() bool { errors.outOfMemory(); return false; }

pub const SDL_SetError = SDL_SetError_REAL;
pub const SDL_SetErrorV = SDL_SetErrorV_REAL;
pub const SDL_GetError = SDL_GetError_REAL;
pub const SDL_ClearError = SDL_ClearError_REAL;
pub const SDL_OutOfMemory = SDL_OutOfMemory_REAL;
''')
