//! Symbol-presence fixture only. These placeholder addresses must never be
//! called: this DSO tests loader publication/cleanup, not ALSA's function ABI.
const std = @import("std");
const binding = @import("alsa_binding");
const options = @import("fixture_options");

fn placeholder() callconv(.c) void {}

comptime {
    for (@typeInfo(binding.Functions).@"struct".field_names) |name| {
        if (!std.mem.eql(u8, name, options.omit)) {
            @export(&placeholder, .{ .name = "snd_" ++ name });
        }
    }
}
