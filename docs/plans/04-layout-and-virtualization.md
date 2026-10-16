# Layout, scrolling, virtualization and motion

[Plan index](../../PLAN.md) · [Text](05-text-editing-and-localization.md)

Status: proposed production contract with an initial [pinned adapter experiment](../experiments/layout-zlay.md).
The limited row/column/opaque-measurement result is not production adoption; this
contract still decides whether to accept, extend or replace the provider.

## Layout owns geometry, not application state

Inputs are a committed description, inherited layout style, constraints and
immutable intrinsic measurements. Outputs are sizes, positions, baselines,
overflow/clip regions and dependency information. Layout does not open fonts,
read application collections, dispatch button actions or allocate GPU resources.

Use logical points for layout, with an explicit logical-to-device transform per
window/output. Keep fractional values through layout. Apply a documented snapping
policy once at rasterization; do not repeatedly round child coordinates and
accumulate error across columns or monitor scale transitions.

## Constraint and measurement contract

Represent finite/unbounded constraints explicitly; do not use NaN or a magic
negative width for “auto.” Reject nonfinite dimensions and arithmetic overflow.
A box receives min/max extents and returns a constrained size, baseline and
intrinsic limits. Define how min-content, preferred content and max-content
interact with flex sizing, wrapping, aspect ratio and percentage resolution.

Text measurement returns results from the same paragraph layout used for paint,
selection and hit testing. Width measurement cannot shape one font while the
renderer draws a different fallback. Measurement keys include document/style
revision, constraint width, language, font environment and applicable scale policy.

Production order:

1. Row/column flex, gaps, alignment, min/max and content sizing.
2. Wrapping, baseline alignment, aspect-ratio images and overlays.
3. Scroll containers, nested clipping and anchored popup placement.
4. Fixed/variable-height virtual lists and trees.
5. Data-grid columns, pinned regions and professional layout primitives.
6. General grid/subgrid-like features only after a concrete application needs
   them and an adapter can meet their defined semantics.

This is not a promise of full browser CSS layout. Avoid importing CSS vocabulary
whose actual rules the engine does not implement.

## zlay adapter boundary

Translate zdl node/style/measurement inputs into zlay-specific declarations and
translate its output into zdl layout results. Retained NodeIds are never zlay's
transient element IDs. Keep a revisioned mapping with clear invalidation.

Evaluate: mutation and alias safety, deterministic measure callbacks, overflow,
constraint coverage, stable text lifetime, partial relayout opportunities and
cost for sparse versus full updates. Compare actual pinned versions and complete
lifecycles; do not infer safety or performance from fixture count alone.

A fixed-capacity backend must report insufficient capacity before publishing an
update. Resizing its scratch arena is a controlled retry, not an overwrite of
memory still referenced by a previous snapshot.

If the contract cannot be met, compare an improved zlay adapter, Clay/Yoga C APIs,
or an explicitly maintained Taffy bridge. Taffy is not assumed to provide a
ready-made stable C ABI. Replacing the layout engine must not change widget
identities, documents, semantics or the public tree model.

## Layout invalidation and cycles

Track dependencies from intrinsic content to box constraints and ancestors.
Recompute the smallest correct region; grow to a full window when necessary.
Cyclic percentage/intrinsic constraints use a documented resolution rule or
return a diagnostic, not an arbitrary iteration count with silent stale output.

During resize, selection/caret geometry is recomputed from current text layout.
Layout may not call arbitrary application callbacks that mutate the tree. Model
adapters provide an immutable revisioned view for the duration of the transaction.

## Scrolling

A scroll state contains logical offsets, extents, viewport and active animation,
not just the last wheel delta. Route wheel/gesture input to the deepest eligible
scroll container. Transfer unconsumed deltas outward according to explicit
scroll-chaining policy; distinguish touchpad pixel deltas from wheel lines.

- Preserve a stable content anchor across insertions, font reflow and async images.
- Programmatic reveal aligns a target with minimum movement and respects sticky
  headers, modal bounds and focused caret visibility.
- Clamp only against current committed extents; resizing does not leave a hidden
  focus target outside the viewport.
- Scrollbar drag, keyboard paging and assistive scroll actions use the same model.
- Momentum and overscroll are optional policy, with reduced-motion behavior.
- Right-to-left horizontal scrolling has a logical origin; do not expose a
  backend/browser-specific negative-offset convention as the public model.

## Virtual list and tree model

The logical collection exists independently of materialized widget records.
The model offers item count/revision, stable keys, lightweight metadata and a
fallible visible-range materializer. Selection/focus belongs to stable keys,
not a recycled row slot. Data fetching and I/O do not run inside layout.

```zig
// Proposed model sketch. Returned row data has an explicit update lease.
pub const Row = struct { key: ItemKey, label: []const u8, enabled: bool };

fn describe_rows(update: *zdl.ui.Update, model: *const Model) !void {
    const range = try update.visible_range(.named("results"), .{
        .count = model.count(),
        .estimated_height = 28,
        .overscan = 8,
    });
    for (range.start..range.end) |index| {
        const row = try model.row(index);
        try update.list_row(.item(row.key), .{ .text = row.label, .enabled = row.enabled });
    }
}
```

The exact builder syntax is open, but the contract must not enumerate 100,000
rows to find the 60 visible ones. A model must also support lookup/reveal by key
for keyboard search and accessibility, even when the item has no paint node.

Use wide indexes and sufficient precision for total content extents/prefix sums
(for example u64 item indexes and f64 scroll/content offsets). Rebase paint
coordinates around the viewport before narrowing to GPU floats; a large scroll
position must not quantize small pointer movements or adjacent row positions.

Variable-height lists maintain prefix-height information (for example a Fenwick
or order-statistic structure). Measured heights are keyed by item revision,
width/font/style context, not index alone. During estimation correction, preserve
the top visible anchor and fractional offset. Large-range queries remain bounded.

For trees, expansion changes the visible logical sequence; collapsed descendants
retain application state without retaining every painter. Removed items choose
an explicit successor/ancestor focus fallback. A native screen reader must still
understand logical item positions and be able to request materialization.

## Tables, grids and docking

Keep logical row/column identity separate from pane materialization. Pinned
headers/columns share one logical selection and semantic grid, even if painted
through several clipped layers. Column resizing updates a coherent width model;
editing a cell binds the same document after it scrolls out and back.

Docking manipulates an application-owned layout document with stable pane IDs,
minimum sizes and serialized placement. Dragging a pane is a transaction with
preview/commit/cancel, not immediate destruction/recreation of its content or
GPU resources. Multi-window tear-off follows window capability and focus rules.

## Popups and placement

Resolve anchored overlays from current committed geometry. Fit against usable
window/output bounds, flip/slide when needed, and transform the anchor correctly
under scrolling, scaling and RTL. Pointer hit testing, clipping and semantic
parentage must agree with the resolved placement.

An in-window overlay is not equivalent to a native popup extending outside a
window. Publish that distinction and provide a fallback policy. A modal scope
remains modal regardless of which painting/native surface hosts its content.

## Motion

Separate compositing transforms from structural layout animation. Animated
transforms are sampled by the UI owner at a presentation opportunity. Publish that sampled
geometry to hit testing and semantic queries without rebuilding unchanged widget
descriptions. Hit and semantic bounds follow the visible sampled position, not
the future destination. Outgoing decorative exit animations are noninteractive.
Coalesce native bounds notifications without leaving query snapshots stale. Do
not leave an invisible control clickable along its old bounds.

Animation cancellation starts the new animation from the sampled current value.
Reduced motion shortens/removes nonessential motion, not state feedback. Repeated
updates do not allocate an unbounded chain of animation objects.

## Acceptance gates

- Golden geometry for nested constraints, RTL, baselines, wrapping and scale changes.
- Full versus incremental layout equivalence under randomized valid updates.
- 100k-item fixed/variable lists materialize a bounded visible range.
- Insertion/reflow preserves anchors and focused caret visibility.
- Nested wheel, scrollbar and assistive scroll actions agree on offsets.
- Popups stay operable near all edges and after monitor-scale changes.
- Virtualized selection/edit/AX identity survives recycling and reordering.
