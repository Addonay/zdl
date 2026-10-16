# Transactional semantic intent and owner-side actions

`ui.with_semantics(schema)` enables semantic records in the **same** retained
scene engine, optionally with the same typed state channels. The semantic tree,
node IDs, state, focus/capture and revision publish at one scene commit point.
Failure preserves the previous complete scene and semantic snapshot.

This is a provider-independent model and test-driver boundary, **not a native
accessibility implementation**. No AT-SPI/UIA/AX/AccessKit adapter is installed or
started by these APIs. Plain `ui.Scene` and `ui.with_states` keep their profiles;
semantic-capable models explicitly opt into the additional APIs/errors/storage.

```zig
const Model = zdl.ui.with_semantics(.{});
var scene = try Model.Scene.init(allocator, .{});
defer scene.deinit();
var update = try scene.begin_update();
defer update.abort();
const button = try update.node(.{ .named = "save" }, .control, .{
    .focusable = true,
});
const root = try update.semantic_node(null, .{ .named = "window" }, .{
    .role = .window, .name = "Settings",
}, null);
const intent = try update.semantic_node(root, .{ .named = "save" }, .{
    .role = .button, .name = "Save", .actions = .{ .activate = true, .focus = true },
}, button);
try update.request_focus(button);
var snapshot = try update.commit();
defer snapshot.deinit();
const view = try snapshot.semantic(try snapshot.semantic_id_for(intent));
const action = try scene.validate_semantic_action(.{
    .target = view.id, .revision = view.revision, .payload = .activate,
    .source = .assistive,
});
// Owner controller handles action through the same behavior as pointer/keyboard.
_ = action;
```

## Identity, leases and atomic publication

Semantic Id is a distinct owner-domain/serial type, not NodeId, a pointer, dense
index or layout element ID. Keys are scoped to semantic parents and compared in
full. Matching key/scope/role retains identity; removal/reintroduction or a role
change receives a new nonrecycled serial. Counter exhaustion fails, never wraps.
Drafts are owner/update-attempt checked and resolve only through their committed
snapshot. Semantic records may have no materialized node at all.

A semantic-capable update can declare the semantic tree independently of physical
node ordering. Optional materialization refers to an earlier node draft in that
update; two semantic records cannot claim one physical node. Materialized control
roles/focus capabilities are checked. A focused materialized node must have a
semantic counterpart; inert/disabled semantic focus cannot publish.

Node and semantic enabled state respect their ancestors. Disabling a physical
ancestor now also repairs retained scene focus/capture; explicit requests into
that disabled subtree fail. Inert semantic ancestors deny actions. Rendering/
input/layout adapters still have to use this same published intent consistently.

Names, descriptions and named keys are copied during declaration and copied into
independent frozen storage. Naming references resolve to frozen shared strings.
Document bindings retain owning immutable snapshots in staging/publication and
release them on abort/last scene retirement. The snapshot/scene allocator must
outlive every owning reference. Owner-thread-only retain/release remains the rule;
this layer does not yet supply a foreign-thread snapshot handoff protocol.

Semantic views/child views borrow the snapshot that produced them. Historical
queries remain valid after updates/close. Delayed actions must use live Scene
validation, not invoke behavior from an old borrowed view. Close rejects new
routing without allocation. Ownership cleanup is infallible and never invokes
application reducers or action handlers.

## Validated data and relationships

Implemented record roles are window/group/label/button/checkbox/slider/collection/
item/editor. These are intent records, not implementations of those widgets.
Role/action/value combinations, UTF-8/NUL names, finite bounds and numeric ranges
are validated. Bounds use logical units; they may be absent for unmaterialized or
not-yet-resolved content. Native geometry/transform mapping remains an adapter gate.

Use `semantic_relations(draft, .{ ... })` after referenced drafts are declared.
Labelled-by and described-by edges must form an acyclic graph. Accessible names
resolve through labelled-by chains; named controls cannot publish empty names.
Active descendants must be actual semantic-tree descendants. Validation and name
resolution use iterative traversal, not recursive application callbacks or an
unbounded C stack. Naming chains and physical/semantic trees are checked before
publication.

A collection declares its complete logical count. Every immediate child must be
an item with its zero-based logical position in order, and child count must match.
This deliberately rejects exposing only visible paint rows while claiming a larger
accessible collection. Unmaterialized items keep their semantic identity and
supported actions. A focus/reveal action can return `needs_materialization`; the
owner/model must actually reveal/materialize it or report a controlled failure.
No scrolling/materializer callback is implicitly run by validation.

The current implementation stores O(logical items) lightweight intent records,
not an O(visible rows) semantic tree. Defaults bound this to 200k records and
4 MiB logical key/name/description/document-text bytes. The arena capacity metric
includes semantic records/indexes/child ranges; document buffers, native bridge
copies and other retained versions have separate costs. Incremental/subtree reuse
and provider-specific lazy access remain open.

## Action validation and document/protected state

Each semantic node has its own revision, separate from the scene revision. It
changes when its effective public semantic data, materialization, focus, relations,
children or document binding changes. Unrelated scene updates/repaints do not
invalidate an otherwise unchanged target. An old request cannot activate a new
control/role or silently apply an obsolete value.

Requests carry target ID, observed node revision, input source and typed payload.
Live validation checks identity/revision, effective enabled/inert state, supported
actions and payload constraints. Numeric values must be finite/in range. Pointer,
keyboard, assistive and programmatic sources use this same validation path.
Validation returns intent; it neither mutates the application nor delivers/dedups
an asynchronous ticket. Two distinct activations are not collapsed into a bool.
The controller still owns authorization, modal/seat/composition policy and one
final outcome for each accepted queued action.

Editor bindings contain an immutable document snapshot and registration handle.
Text actions carry an exact observed document revision and checked UTF-8 byte
ranges/selections. Successful validation returns a registry Target. The owner must
still dispatch through the live document Registry: the document may have changed
since the semantic frame, or its mutable registration may have ended. A fixture
checks that semantic validation cannot bypass the registry's stale-revision guard.
Native UTF-16/scalar mapping, paragraph/caret geometry and Unicode navigation are
not supplied by semantic byte ranges.

Protected disclosure produces empty text and no selection in public semantic
views; read-only/protected bindings cannot advertise text mutation/selection
actions. Internal application snapshots retain their ordinary ownership. This is
an explicit conservative disclosure policy, not a password widget, secure memory
store or native protected-text conformance certificate. A real adapter must export
the sanitized View, not inspect private scene storage or unrelated app state.

`Resolved.model_key` borrows the current scene until its next successful commit/
close. Text in `Resolved.payload` borrows the request until consumed; copy queued
payloads before the producer's lease expires. Resolved results are immediate
owner-thread values, not references native callbacks may retain after publication.

## Verification and native bridge gate

Eleven semantic fixtures cover per-node revisions/identity, full-key/scoped labels,
relationship cycles, invalid roles/geometry/collections, complete virtual items
with changing materialization, protected/document snapshots and text action checks,
all allocation failures across node/state/semantic publication, foreign/stale IDs,
3000-node naming chains, limits/counter exhaustion and focus coverage. A separate
scene fixture covers inherited disablement repairing focus/capture. The allocator
tests found and fixed arena-state capture before semantic preparation had finished
growing its buffers; frozen storage now captures the final arena state.

The native loader inventory has libatspi and cached AccessKit Rust crates, but no
installed AccessKit C library was found through the loader inventory. The upstream
[AccessKit C binding](https://github.com/AccessKit/accesskit-c) exists; cached Rust
sources alone are not a deployable validated C bridge. The native bridge still
needs its pinned artifact, ABI/lifetime adapter, real Linux session-bus/AT-SPI
client/action/text tests, callback quiescence and distribution evidence. Current
private-Xvfb listener creation is also unavailable; no native accessibility or
screen-reader pass is inferred from this semantic model.


An [owned action queue](ui-actions.md) now supplies FIFO payload ownership,
backpressure, explicit tickets and terminal receipts around this validation
boundary. The controller still executes behavior and native ingress remains a
separate synchronized adapter; semantic validation itself remains callback-free.

The [document dispatcher](ui-actions.md#executing-document-commands) supplies text
replacement/selection execution through the live Registry, with receipts and
owning results. General widget behavior and native bridge publication remain
outside semantic validation. A [local AccessKit source investigation](experiments/accesskit-lifetime.md)
found a sibling checkout/artifact candidate and an asynchronous removal path;
this is not an installed or validated ZDL provider, and callback lifetime remains
a feasibility gate.
