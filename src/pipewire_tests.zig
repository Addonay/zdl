//! Deterministic PipeWire failure/lifetime tests, linked with libc separately
//! so native core/image/audio consumers retain their no-libc boundary.
const binding = @import("audio/pipewire/binding.zig");

test "PipeWire stream setup failure and synchronous teardown callback lifetimes" {
    try binding.test_stream_lifetime();
}

test "PipeWire older timing prefixes have defined extension fields" {
    try binding.test_time_prefix();
}

test "PipeWire connection failure retires native objects before callback data" {
    try binding.test_connection_lifetime();
}
