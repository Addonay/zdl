# WP-02: pinned zlay adapter feasibility

Status: **limited row/column adapter passed; production adoption remains gated**.
This experiment tests the same zlay pin currently used by examples, not the
mutable sibling checkout or its newer Taffy-port API. It does not introduce a
zlay dependency into the root package's ordinary source consumers.

## Reproducible source and isolation

The dependency is commit `d6112faa78b5750a3817b927b7d48bb562634304`, package hash
`zlay-0.1.0-TRqBosOgAwBpF1ZBaJs8oQu4kRrM5dAPdfPMOGdTRRGr`. The audit checks the
examples pin, validates every regular archive member against the checked-in
`tools/spikes/layout/pin.json` SHA-256 source manifest, and extracts into owned
`.cache/spikes/layout/dependency` scratch. It records the actual archive hash
without requiring identical gzip container bytes on another machine.

The root build accepts `-Dlayout-zlay-source=/absolute/pinned/source` only for
explicit developer experiment steps. The audit supplies the verified directory.
There is no root build.zig.zon dependency change, network fetch, global compiler
selection change, edit to the dependency sources, or replacement of the examples'
UI path. A concurrent examples zdl-pin edit was observed and preserved.

```sh
python3 tools/audit_layout_spike.py
python3 tools/validate.py --pipewire-headers --paragraph-spike --editor-spike --layout-spike
```

The audit runs Debug/ReleaseSafe compile/tests and runtime-input geometry demos,
checks compiled modes and absence of an ELF dynamic section, then compiles/runs an
explicit-all-modules ReleaseFast first/changed/unchanged benchmark. The current
compiler is `0.18.0-dev.253+16d31ceed`. Runtime Pango is needed only for the
separate opaque-paragraph integration test, not the pure adapter/demos.

## Adapter and result contract

The adapter consumes an immutable retained scene, viewport, and one style per
checked NodeId. Private nonzero backend IDs are assigned without hashing and
skip the engine's implicit root. They are never durable widget IDs or public
lookup keys. Results copy boxes into owned storage and retain the source scene.
They survive another layout and adapter/source-owner destruction. Backend render
commands/element pointers and their next-beginLayout leases never escape.

Styles cover row/column, content/fixed/grow/fraction sizing, bounds, integer gap/
padding, and cross alignment. Float geometry remains fractional; snapping is not
performed here. Invalid/foreign/duplicate styles, nonfinite geometry and capacity
fail explicitly. Capacity is preflighted including implicit-root/sentinel headroom.
Backend errors are captured and converted to a failed candidate, not logged as a
successful missing element. No application callback, font opening or GPU work
runs from layout. Failure preserves independently retained prior geometry.

Intrinsic text is an **opaque measured leaf**. The pinned engine's built-in text
path splits strings on spaces/newlines and sums per-word measurements; the adapter
does not use it for international paragraphs. Missing/stale-width leaf metrics
produce checked measurement requests tagged with NodeId and scene revision.
`placements`/`get` reject unresolved results, so provisional zero-height or stale
paragraph geometry is not offered as ready-to-paint output. The coordinator
measures the requested width through its paragraph provider and reruns layout.
The Pango fixture completes this cycle at wide/narrow widths, verifies the exact
height of the same painted paragraph and retains the prior layout result.

The result owns geometry/source only; it does not implicitly own an external
paragraph/raster resource. A production frame must retain that same immutable
paragraph through paint/hit/selection retirement. Production style/document/font/
DPI measurement keys and cycle-resolution policy remain to be defined with the
public paragraph contract. This experiment computes geometry after a committed
scene and stamps it with that source revision; it does **not** yet integrate
layout into Scene's atomic resolve/publish phase.

## Fixtures and baseline

Seven pure fixtures plus one native-paragraph fixture pass in Debug/ReleaseSafe:
independent row arithmetic, fraction/cross-alignment/fractional dimensions,
measurement negotiation, foreign/duplicate/stale style data, capacity and unsupported
input, old-result ownership across scratch reuse/deinit, all allocator failures,
failed-run recovery, and Pango wide/narrow reflow with old-result preservation.

Three-trial ReleaseFast baseline (1k/10k children plus one root) times complete
adapter runs; setup, output/retained-ID/geometry checks and teardown are excluded:

| Children | First run median | One changed style, full redeclaration | Unchanged, full redeclaration |
| --- | ---: | ---: | ---: |
| 1,000 | 1.042 ms | 0.746 ms | 0.772 ms |
| 10,000 | 10.247 ms | 7.402 ms | 7.392 ms |

Both subsequent paths still validate/redeclare/project the complete tree. These
numbers do not prove O(changed nodes), isolated engine-only cost, a toolkit
comparison, or a frame budget. They include adapter allocation/projection, have
cache/allocator effects and record raw trial ranges. Source/dependency/binary
hashes and machine/commands are in `.cache/spikes/layout/report-final.json`.

## Conditional decision and remaining gates

Continue evaluating this pin behind the zdl-owned contract for finite row/column
geometry and explicit measurement negotiation. Do not expose zlay declarations,
transient IDs or borrowed render output as the permanent widget API.

The following restrictions are explicit, not silently rounded/ignored features:

- Padding/gaps in this pin are u16; fractional spacing is rejected. Fixed and
  percentage geometry can remain fractional. Optional range maxima must be
  positive; exact zero sizing uses a fixed axis.
- Grow/percentage beneath an intrinsic parent is rejected by this adapter rather
  than guessing a percentage/intrinsic fixed-point resolution.
- No baseline alignment, flex wrapping/grid, clipping/scroll/transform/hit-order
  protocol or snap policy is claimed. Native text word sums are not substituted
  for shaped paragraphs.
- Full declarations/metadata are rebuilt. Sparse relayout, measurement caching,
  animation/scroll state and retained resource coherence need separate evidence.
- Zlay's queried element metadata can persist across frames; only IDs declared in
  the current adapter input are queried. No stale backend lookup is accepted as
  a retained scene lookup.

Before production adoption, complete those required layout contracts or choose a
better provider for them, integrate resolution with semantic/scene/paint atomic
publication, compare the alternatives on actual workloads, and run native-window
resize/DPI/editing/accessibility scenarios. WP-02 and WP-06 are not closed by this
limited adapter or its green fixtures.
