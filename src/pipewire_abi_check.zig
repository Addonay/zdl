//! Optional native-header ABI audit. Not imported by zdl or normal test roots.
const binding = @import("audio/pipewire/binding.zig");
const c = @import("pipewire_headers");
comptime {
    binding.check_header_abi(c);
}
