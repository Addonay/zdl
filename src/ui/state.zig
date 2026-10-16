//! Typed ownership policies and immutable cells for retained-scene state channels.
//! Public policies clone owned data (or retain immutable leases) and destroy it.
//! They must not mutate application models, reenter the scene, or fail in deinit.
const std = @import("std");

fn plain(comptime T: type) bool {
    return switch (@typeInfo(T)) {
        .int, .float, .bool, .@"enum", .void, .error_set => true,
        .array => |info| plain(info.child),
        .vector => |info| plain(info.child),
        .optional => |info| plain(info.child),
        .@"struct" => |info| block: {
            for (info.field_types) |Field| if (!plain(Field)) break :block false;
            break :block true;
        },
        .@"union" => |info| block: {
            if (info.tag_type == null) break :block false;
            for (info.field_types) |Field| if (!plain(Field)) break :block false;
            break :block true;
        },
        else => false,
    };
}
/// Ownership policy for pointer-free scalar/aggregate state. Slices, pointers
/// and resources require an explicit clone/deinit policy instead of borrowing
/// mutable application memory into a retained snapshot.
pub fn Value(comptime T: type) type {
    if (!plain(T)) @compileError("state.Value requires pointer-free value data; supply an explicit ownership policy");
    return struct {
        pub const Value = T;
        pub fn clone(_: std.mem.Allocator, value: *const T) std.mem.Allocator.Error!T {
            return value.*;
        }
        pub fn deinit(_: std.mem.Allocator, _: *T) void {}
    };
}

pub fn clone_errors(comptime Policy: type) type {
    return @typeInfo(@typeInfo(@TypeOf(Policy.clone)).@"fn".return_type.?).error_union.error_set;
}

/// Internal sparse pool type. Each published version owns one reference per
/// entry. Snapshot retains share the version; version-to-version reconciliation
/// shares cells without copying unchanged values or invoking clone again.
pub fn Pool(comptime Policy: type) type {
    return struct {
        const StateValue = Policy.Value;
        pub const Error = std.mem.Allocator.Error || clone_errors(Policy) || error{ ReferenceLimit, StateLimit };
        pub const Cell = struct {
            allocator: std.mem.Allocator,
            references: usize = 1,
            logical_bytes: usize,
            value: StateValue,
            pub fn create(allocator: std.mem.Allocator, source: *const StateValue) Error!*Cell {
                var value = try Policy.clone(allocator, source);
                errdefer Policy.deinit(allocator, &value);
                const bytes = try logical_bytes(&value);
                const result = try allocator.create(Cell);
                result.* = .{ .allocator = allocator, .value = value, .logical_bytes = bytes };
                return result;
            }
            pub fn retain(self: *Cell) Error!void {
                if (self.references == std.math.maxInt(usize)) return error.ReferenceLimit;
                self.references += 1;
            }
            pub fn release(self: *Cell) void {
                self.references -= 1;
                if (self.references == 0) {
                    const allocator = self.allocator;
                    Policy.deinit(allocator, &self.value);
                    allocator.destroy(self);
                }
            }
        };
        pub fn logical_bytes(value: *const StateValue) Error!usize {
            const extra = if (@hasDecl(Policy, "owned_bytes")) Policy.owned_bytes(value) else 0;
            return std.math.add(usize, @sizeOf(StateValue), extra) catch error.StateLimit;
        }
        pub const Entry = struct { node: u32, cell: *Cell };
        pub const Entries = []const Entry;
        pub const Stage = std.AutoHashMapUnmanaged(u32, ?*Cell);
        pub const OldIndex = std.AutoHashMapUnmanaged(u32, *Cell);
        pub const Prepared = struct {
            entries: []Entry = &.{},
            count: usize = 0,
            pub fn append(self: *Prepared, node: u32, cell: *Cell) Error!void {
                try cell.retain();
                self.entries[self.count] = .{ .node = node, .cell = cell };
                self.count += 1;
            }
            pub fn release(self: *Prepared) void {
                for (self.entries[0..self.count]) |entry| entry.cell.release();
            }
        };
        pub fn find(entries: Entries, node: u32) ?*const StateValue {
            var first: usize = 0;
            var end = entries.len;
            while (first < end) {
                const mid = first + (end - first) / 2;
                if (entries[mid].node < node) first = mid + 1 else end = mid;
            }
            if (first == entries.len or entries[first].node != node) return null;
            return &entries[first].cell.value;
        }
        pub fn release_stage(stage: Stage) void {
            var values = stage.valueIterator();
            while (values.next()) |cell| if (cell.*) |owned| owned.release();
        }
    };
}
