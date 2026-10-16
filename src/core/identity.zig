//! Process-local owner domains shared by scenes and documents. No allocator,
//! object registry or current-runtime singleton is retained by the issuer.
const std = @import("std");
pub const Domain = enum(u64) { _ };
// Only process-wide state: monotonic identity issuance, never an allocator,
// current scene, registration table or subsystem. Saturation fails permanently
// instead of wrapping and accepting handles from a previously closed instance.
var next_domain = std.atomic.Value(u64).init(1);
/// Internal saturating issuer; does not retain any scene or allocate memory.
pub fn issue_domain() error{DomainExhausted}!Domain {
    return issue(&next_domain);
}
fn issue(counter: *std.atomic.Value(u64)) error{DomainExhausted}!Domain {
    var value = counter.load(.monotonic);
    while (true) {
        if (value == std.math.maxInt(u64)) return error.DomainExhausted;
        if (counter.cmpxchgWeak(value, value + 1, .monotonic, .monotonic)) |actual| value = actual else return @fromBackingInt(value);
    }
}
test "scene domain issuance saturates without wrapping" {
    var counter = std.atomic.Value(u64).init(std.math.maxInt(u64) - 1);
    try std.testing.expectEqual(@as(u64, std.math.maxInt(u64) - 1), @backingInt(try issue(&counter)));
    try std.testing.expectError(error.DomainExhausted, issue(&counter));
    try std.testing.expectError(error.DomainExhausted, issue(&counter));
}
