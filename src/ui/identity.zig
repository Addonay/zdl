//! Checked retained-scene identities. Keys are application data; NodeIds are
//! process-local, generation-checked handles and must not be serialized.
const std = @import("std");
const identity = @import("../core/identity.zig");
/// Process-local scene-owner identity; zero is never issued.
pub const Domain = identity.Domain;
/// Checked owner/slot/generation value, not a pointer or security capability.
pub const NodeId = struct {
    domain: Domain,
    slot: u32,
    generation: u64,
    /// Exact identity equality across all checked domains.
    pub fn eql(a: NodeId, b: NodeId) bool {
        return a.domain == b.domain and a.slot == b.slot and a.generation == b.generation;
    }
};
/// Parent-scoped application identity; declaration copies named bytes.
pub const Key = union(enum) {
    integer: u64,
    /// Full bytes are copied/compared, so hash collisions never alias identity.
    named: []const u8,
    /// Full variant/value equality, independent of hash collisions.
    pub fn eql(a: Key, b: Key) bool {
        return switch (a) {
            .integer => |value| switch (b) {
                .integer => |other| value == other,
                else => false,
            },
            .named => |value| switch (b) {
                .named => |other| std.mem.eql(u8, value, other),
                else => false,
            },
        };
    }
};

/// Shared saturating issuer; retains no scene or document.
pub const issue_domain = identity.issue_domain;
