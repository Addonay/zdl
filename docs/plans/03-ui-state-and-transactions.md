# GUI state, identity, transactions and snapshots

[Plan index](../../PLAN.md) · [Layout](04-layout-and-virtualization.md) ·
[Input/semantics](07-input-focus-and-accessibility.md)

Status: recommended design with an initial [model-only scene implementation](../ui-scenes.md).
This is the central contract that other GUI work must share before independent
widget implementation begins. Typed state channels now use that same store;
providers and final scene publication with layout/semantics/paint remain open.

## Decision: retained semantics, declarative updates

Use one retained UI engine, with a declaration builder as the primary ergonomic
frontend. Repeated declarations reconcile existing records by key; they do not
recreate focus, documents or resources each frame. Advanced applications can
apply explicit transactions to the same records.

Do not ship a second immediate-mode widget stack with different keyboard,
accessibility and state behavior. Do not impose a reactive application framework,
reflection-heavy object model, hidden global store or mandatory code generation.

The retained engine owns toolkit mechanics. Applications keep their own model,
collections, commands and editable documents. A button action requests a domain
operation; it does not become the toolkit's hidden application reducer.

## Distinguish identities

- **Key:** application-supplied semantic identity, scoped to a parent/collection.
  A row key derives from its data ID, never its current visible index.
- **NodeId:** checked identity of a live toolkit record; slot plus generation,
  with owner-domain validation where handles cross instances or native bridges.
- **WindowId:** platform/window identity, with a close epoch for asynchronous work.
- **DocumentId / AssetId:** registry identities independent of widget placement.
- **SemanticId:** accessibility identity derived from a persistent semantic node,
  stable across repaint and virtualization; not a pointer or zlay element ID.

Internal IDs are not serialized as application keys. Reusing a pool slot cannot
make an old handle valid; retire a slot on generation wrap. Duplicate keys in one
scope are update errors, not permission to share interaction state accidentally.
Hash-based named keys retain enough interned identity to detect collisions.

Semantic identity is not necessarily a one-to-one alias for a materialized NodeId.
A virtual item can retain its logical semantic ID after its visible widget slot
is retired. A native action resolves through the collection/model key and current
revision, materializing/revealing a widget when needed; it cannot use the old
widget's slot. Model registrations themselves have checked lifetimes.

Moving an item within its collection preserves its state. Moving it into another
scope requires an explicit transfer policy; it must not steal focus or a text
composition merely because a hash matches.

## Store design

Keep a compact hot node header: identity, parent/children range, role, style/layout
references, dirty flags and state references. Large text documents, table models,
images and variant-specific state live in separate typed stores. Avoid a giant
union whose largest editor state bloats every label.

The minimum retained records include hierarchy, stable-key mapping, resolved
style, layout result, interaction state and semantic description. Paint records
are derived data. Caches are rebuildable; application data and accepted edits are
not caches and cannot be evicted to meet a paint-memory budget.

Internal structure-of-arrays optimization is allowed after profiling. It must
not leak dense indexes into public handles or change destruction semantics.

## Update transaction

A proposed update has these phases:

1. **Begin:** capture committed version; allocate staged storage and a change log.
2. **Describe:** declare keyed nodes, properties, bindings and semantic intent.
   Copy temporary strings or acquire explicit immutable text/resource leases.
3. **Validate:** check key uniqueness, tree cycles, property/role compatibility,
   resource domains, document bindings and declared limits.
4. **Resolve:** compute style and intrinsic dependencies, layout and hit regions;
   prepare immutable paragraph/semantic references and a focus-repair plan.
5. **Publish:** atomically replace the committed scene version on the owner thread.
6. **Retire:** release superseded references once readers/packets no longer need them.

No externally visible callbacks run while the store is half-mutated. On failure,
abort staged work and leave the previous scene, IDs and semantic snapshot usable.
Do not increment existing live generations merely because staging failed.

Application model edits that occurred before this transaction are **not** rolled
back by the GUI. Report an update failure, retain the last good scene and allow
a retry without redelivering already-consumed domain actions. Closing a window
is an explicit emergency lifecycle operation, not a transaction requiring memory
to invalidate stale native callbacks.

```zig
// Proposed API sketch. Strings are copied/retained by each declaration call.
fn describe(ui: *zdl.ui.Ui, window: WindowId, model: *const Model) !void {
    var update = try ui.begin_update(window);
    errdefer update.abort();

    try update.begin_column(.named("settings"), .{ .gap = .medium });
    try update.label(.named("heading"), .{ .text = "Preferences" });
    try update.text_field(.named("name"), .{
        .document = model.name_document,
        .label = "Display name",
    });
    try update.button(.named("save"), .{
        .text = "Save",
        .enabled = model.has_unsaved_changes,
    });
    try update.end_container();
    try update.commit();
}
```

The builder is fallible. Exhausting text/node/stack capacity returns an error
before publication; it does not panic or silently omit focusable controls.
Balanced scope checks catch forgotten container closes with a source diagnostic.
A future convenience scope helper must retain identical failure semantics.

## Actions and model ownership

Dispatch input before describing the next scene. Actions include a stable target,
kind, source (pointer/keyboard/assistive/programmatic), serial and relevant typed
payload. An action is delivered once; two distinct activations are not silently
collapsed into one `bool` because they occurred before painting.

```zig
// Proposed embedding sequence, not a complete runnable application.
try ui.dispatch(window, event); // copies any event data it retains
while (ui.next_action()) |action| {
    try app.apply(action);      // app maps UI actions to its own domain commands
}
try describe(ui, window, &app.model);
// Paint the latest committed snapshot when the host requests a frame.
```

A document binding is explicitly authorized to apply editing transactions to the
registered application-owned `TextDocument`, then emits its resulting revision.
Other model properties use controlled values plus change requests. Do not mix
hidden widget ownership and application ownership of the same selection/value.
Provide an explicit edit-request mode for applications that must validate edits
before accepting them; define rejection and composition feedback in that mode.

Application objects do not need stable addresses merely to declare buttons.
Registered document/provider objects do: use an owned registration or checked
registry slot with a documented unregister/quiescence protocol.

## Snapshots and versioning

A committed scene produces related immutable views:

- layout/transform/clip data for hit testing;
- paragraph and caret mappings for text interaction;
- a semantic tree for accessibility and automation;
- an owned display list/frame packet for rendering.

They share a scene revision and reference the document/resource revisions used
to produce them. Readers do not traverse mutable UI stores on another thread.
The latest committed semantic/hit-test version can lead the last physically
presented frame by a bounded scheduling interval. Track both versions; do not
claim atomicity with the display scanout or block AX queries on a GPU fence.

Validate actions returned from an older native semantic snapshot against current
identity, enabled state and document revision. Dropped/stale actions produce a
controlled outcome, never mutate a reused record.

## Invalidation

Track separate invalidation causes: model structure, style, intrinsic measurement,
layout, hit geometry, semantics, paint and composition-only animation.
Examples:

- Hover color: style/paint; no reshaping or tree replacement.
- Text edit: affected paragraph metrics, selection semantics and paint.
- Scroll: transforms/clips and virtual range; not every offscreen item's layout.
- Font fallback resolution: relevant paragraph/layout keys and anchor repair.
- Theme color: resolved paint; a font/density theme change also invalidates metrics.

The first implementation may conservatively invalidate a larger region. Instrument
why. Later narrowing must pass equivalence/replay tests; an incorrectly cached
caret or hit target is worse than a correctly repainted frame.

## Explicit memoization, not hidden magic

Allow an application to preserve an unchanged declarative subtree by key and
revision. The cached description still responds to toolkit-owned hover/focus,
layout constraints and inherited styles. Register dependencies that affect its
structure; changing locale or model revision cannot leave old accessible labels.

Do not advertise O(changed nodes) if the application rebuilds O(all nodes) on
every update. Expose declaration, reconciliation, layout and paint costs separately.

## Migration and acceptance

Extract identity/store/transaction contracts before widgets. Keep zlay IDs private
to the adapter. Migrate one settings scene with a real document and modal first.

Required fixtures: reorder focused rows; remove a captured control; change widget
kind under an existing key; duplicate/colliding keys; abort at every allocation;
close with queued AX actions; retain a paint packet across two UI updates; two
rapid activations before one presentation; update after locale/font/DPI changes.

Every failure must preserve the documented last-good state and release staged
resources. Every accepted input edit must be observable exactly once.
