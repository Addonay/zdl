# Experimental retained scenes

`zdl.ui.Scene` is a std-only **model foundation**, not a usable widget toolkit.
It publishes retained keyed records and transactional focus/capture references.
It currently has no layout, hit regions, text/document bindings, widget behavior,
input/action dispatch, paint packets or native accessibility bridge. Existing
application examples keep their existing UI path until replacements meet those
contracts. See [the roadmap](plans/12-migration-roadmap.md).

## Describe and publish

```zig
var scene = try zdl.ui.Scene.init(allocator, .{});
defer scene.deinit();
var update = try scene.begin_update();
defer update.abort(); // also safe after commit

_ = try update.begin_group(.{ .named = "settings" }, .{});
const save = try update.node(.{ .named = "save" }, .control, .{
    .label = "Save",
    .focusable = true,
});
try update.end_group();
try update.request_focus(save);
var snapshot = try update.commit();
defer snapshot.deinit();
const save_id = try snapshot.id_for(save);
_ = try snapshot.resolve(save_id);
```

A declaration is a complete replacement description reconciled against current
records. Matching parent identity, full key and kind preserves `NodeId`.
Reordering children preserves identity. Moving to another parent scope, changing
kind, or removing/reintroducing a node creates a distinct checked identity.
Named keys are copied and compared as complete bytes, not treated as unique
because their hashes match. Integer/named key variants are distinct.

`add(parent, key, kind, properties)` is the explicit transaction API;
`node`/`begin_group`/`end_group` provide a builder over that same store. Parents
must already be declared in this update, which prevents cycles. Labels are
leaves. Limits and scope/property errors fail; controls are never silently
omitted. Any declaration/commit error poisons the update: abort and begin a new
one. Only one update can be active per scene. A successful commit consumes it.

All named keys and label strings are copied during declaration, then copied into
independent immutable publication storage. Stack/reused application buffers are
safe after the declaration call returns. Failed commits release candidate data
on unwind/abort and leave prior records, generations, focus/capture, revision and
snapshots intact. No model reducer/domain action runs here; a retry does not
replay application actions. Typed ownership policies only clone/release resources
and must not reenter the scene or mutate application models. Typed application actions are still future work.

## Handle and lifetime rules

`NodeId` includes an owner domain, slot and generation. Domains come from a
process-wide atomic monotonic issuer: the only global state is the identity
counter, not an allocator, scene registry or current-runtime singleton. This
prevents a newly created scene from accepting IDs of a previously destroyed
scene at a reused address. Domain/generation/transaction/revision exhaustion
fails without wrapping. A slot is permanently retired when its generation
cannot advance. IDs are not serialized or security capabilities.

`DraftId` is scoped to its owner and update attempt. It cannot target another
scene, aborted update or subsequent update. It resolves to a `NodeId` only through
the snapshot produced by its commit. Failed staging never publishes tentative IDs.

These are ordinary owning Zig values: **move, do not independently deinitialize
shallow copies**. Call `Snapshot.retain()` for another owning snapshot reference.
The allocator must outlive the Scene, outstanding updates and all retained
snapshots, including references held after scene destruction. The first
implementation is owner-thread only, including retain/release. It does
not yet supply a concurrent AX/render-worker snapshot handoff protocol.

- `Scene.resolve` validates current identity; returned Node/string data borrows
  until the next successful commit or close. Failed updates preserve the lease.
- Snapshot Node/string/child-iterator results borrow that owning reference and
  remain historical across updates and scene destruction. Its `resolve` answers
  historical queries; validate delayed actions through `Scene.resolve` instead.
- `close` is idempotent and allocation-free. It rejects new work and drops the
  scene's reference to current storage. A pending update owns its core long enough
  to return `Closed` and abort safely even after the Scene value is deinitialized.
- Independent snapshots can outlive Scene and Update. Release each explicitly;
  the caller budgets retained revisions. Native resources/providers are not yet
  bound into these snapshots.

Focus/capture requests refer to this update's drafts. Retained references survive
reordering, but both clear on removal, scope/kind replacement or disablement.
Focus also clears when the record loses focusability. Explicit invalid targets reject publication. This is deterministic
model repair, not native focus/capture routing: nearest-ancestor restoration,
modal policy, cancellation actions and composition teardown remain future work.

## Limits, cost and verification

Defaults: 100,000 nodes, 200,000 total slots, 4 MiB copied key/label bytes and
256 levels. Total slots include free and permanently retired slots. Removed
slots become available on a later commit, so replacement may need transient slot
headroom; exhausting it returns `SlotLimit` with no mutation. This is explicit
capacity behavior, not permission to evict live state. These defaults are an
initial configurable bound, not a guarantee a 100k-node scene fits a frame budget.

The baseline performs expected O(n) full description/reconciliation/publication, with hash
indexes and full-key equality. It does not claim O(changed nodes). Staging/index
scratch is freed at publication; published records, generation history, strings
and child ranges live in their own arena. `arena_capacity_bytes()` reports that
arena's capacity, excluding owner/storage headers, allocator metadata and other
retained snapshots. It does not report whole-process memory.

Fixtures cover reorder/scope/kind/enablement changes, owned strings, duplicate and
forced-collision equality, foreign/stale handles and drafts, slot reuse/wrap,
exhausted counters/references, limits, close with pending work, retained snapshots,
120 randomized reconciliation rounds, finished-builder rejection after abort,
and every allocator-failure position of
construction plus a multi-version update with live focus/capture.

The runtime-input `tools/consumers/scene.zig` is included in `check-foundation`
and the ELF dependency audit. It builds/runs without libc or GUI provider sonames.
`tools/bench/scenes.zig` separately measures description and publication of reversed
1k/10k/100k keyed descriptions and validates retained IDs/keys/focus outside timing.
This measures model work, not layout, painting or input-to-photon latency.

WP-03 remains **started**: typed channels are implemented below; document/resource bindings,
layout/semantic/paint publication, event actions and integration into the first
native settings application still need implementation and their own acceptance.

## Typed retained state channels

`ui.with_states` instantiates the **same** scene engine with separate sparse,
strongly typed state channels. Plain `ui.Scene` uses an empty schema; its node
headers do not acquire a union of every widget's state.

```zig
const Model = zdl.ui.with_states(.{
    .scroll = zdl.ui.state.Value(struct { offset: f64, anchor: ?u64 = null }),
    .checked = zdl.ui.state.Value(bool),
});
var scene = try Model.Scene.init(allocator, .{});
defer scene.deinit();
var update = try scene.begin_update();
defer update.abort();
const row = try update.node(.{ .integer = 42 }, .control, .{});
try update.set_state("scroll", row, &.{ .offset = 12, .anchor = 42 });
try update.set_state("checked", row, &true);
var snapshot = try update.commit();
defer snapshot.deinit();
const id = try snapshot.id_for(row);
const scroll = (try snapshot.state("scroll", id)).?;
_ = scroll.offset;
```

Channel names and value types are checked at compile time. Setting a value clones
it during staging. Repeated sets release the superseded staged value. Omitted
overrides inherit the immutable cell only when key, parent scope, kind and checked
identity still match. `clear_state(channel, draft)` explicitly removes a value;
null from `snapshot.state(channel, id)` means a live node has no channel value.
Stale/foreign IDs still return errors. Slot reuse and kind/scope replacement do
not inherit another node's state.

State cells are immutable and reference-counted on the owner thread. Retained
snapshots and later unchanged versions share cells without invoking clone again.
Replacement/removal/close release values only after the last referencing version
is retired. State reads return const pointers borrowing the snapshot reference.
Failed allocation, clone validation, state limits or reference saturation reject
publication atomically alongside node/focus/capture data. Abort and close retain
the same safety rules as the plain scene.

`state.Value(T)` is restricted to pointer-free values/aggregates. Slices, pointers
and owned resources require an explicit policy:

```zig
const OwnedText = struct {
    pub const Value = struct { bytes: []const u8 };
    pub fn clone(a: std.mem.Allocator, value: *const Value) std.mem.Allocator.Error!Value {
        return .{ .bytes = try a.dupe(u8, value.bytes) };
    }
    pub fn deinit(a: std.mem.Allocator, value: *Value) void {
        a.free(value.bytes);
    }
    pub fn owned_bytes(value: *const Value) usize { return value.bytes.len; }
};
const Model = zdl.ui.with_states(.{ .caption = OwnedText });
```

A policy defines `Value`, fallible `clone(allocator, *const Value)` and infallible
`deinit(allocator, *Value)`. An optional `owned_bytes(*const Value)` reports logical
owned bytes in addition to `@sizeOf(Value)`. Clone errors join that model's public
error set. Policies must copy or retain **immutable** resources, expose no mutable
application aliases through a published value, have no model/scene side effects,
and never reenter the engine. A const outer pointer does not make a nested mutable
slice immutable; that is part of a custom policy's ownership contract. Cleanup
must work for unpublished candidates too. This is resource management, not an
application reducer or an implicit mutable state hook.

Defaults additionally bound published state to 100k entries and 16 MiB logical
bytes per version, summed across channels. Known oversized source values are
rejected before clone, and cloned/aggregate sizes are checked again. This is not
an allocator security sandbox: custom policies account truthfully, temporary
clone work may have its own cost, and native/resource budgets remain separate.
`state_usage()` reports entry count and logical bytes in O(state entries).
`arena_capacity_bytes()` includes channel entry arrays but excludes separately
allocated state cells and their owned resources. Neither metric is process RSS
or a budget for all independently retained revisions.

Publication uses expected linear reconciliation for a fixed schema/channel count;
immutable per-channel entry arrays support O(log channel entries) reads. The
model has no type-erased public pointers or competing widget engine. It still
needs document/resource registrations, real controls and event actions before it
can serve as the complete GUI runtime.


Semantic-capable models use [ui.with_semantics(schema)](ui-semantics.md), sharing
the same engine/commit point and optional state schema. Inherited physical
ancestor disablement now clears retained focus/capture, not merely direct-node
disablement. Native layout/paint/accessibility behavior remains separately gated.
