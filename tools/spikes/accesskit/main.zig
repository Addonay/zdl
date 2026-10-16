//! Finite native provider lifetime probe, not an accessible-window demo.
const std = @import("std");
const binding = @import("binding.zig");
pub fn main(init: std.process.Init) !void {
    var args = std.process.Args.Iterator.init(init.minimal.args);
    defer args.deinit();
    _ = args.next();
    const path = args.next() orelse return error.MissingProviderPath;
    var library = try binding.Library.open_resident(path);
    defer library.deinit();
    try library.probe(init.io, 64);
    try library.probe_actions(init.io);
    try library.probe_publication(init.io);
    try library.probe_publisher(init.io);
    std.debug.print("{{\"mode\":\"{s}\",\"native_adapter_cycles\":64,\"release_acknowledged\":true,\"resident_provider\":true,\"native_action_requests\":10,\"owned_text\":true,\"closed_actions_rejected\":true,\"native_tree_nodes\":9,\"protected_text_hidden\":true,\"publisher_swaps\":12,\"activation_close_race\":true}}\n", .{@tagName(@import("builtin").mode)});
}
