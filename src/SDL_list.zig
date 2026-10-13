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
// Native Zig implementation; SDL ABI adapters follow the implementation.
extern fn SDL_malloc_REAL(bytes: usize) ?*anyopaque;
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
        if (node.next != null) {
            link = &node.next;
            continue;
        }
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
pub export fn SDL_ListRemove(head: *?*Node, entry: ?*anyopaque) void {
    remove(head, entry);
}
pub export fn SDL_ListClear(head: *?*Node) void {
    clear(head);
}
pub export fn SDL_ListCountEntries(head: *?*Node) c_int {
    return @intCast(count(head.*));
}
