# Migration work packages, dependencies and release gates

[Plan index](../../PLAN.md) · [Decisions/risks](13-decisions-alternatives-and-risks.md)

Status: execution proposal only. No implementation, dependency installation,
branch manipulation or release publication is performed by this planning task.

## Delivery discipline

Use bounded work packages with one integrator owning public contracts and final
verification. Before implementation, name the relevant source baseline, contract,
allowed files, fixtures, ownership and acceptance evidence. Shared IDs/text/paint
interfaces change centrally, not independently in widget tasks.

If later work is delegated, honor the user's current limits: at most two
subagents at once and only the requested Haiku 5.5 model. This document does not
spawn or authorize agents, and does not assume that model is available.

Do not move all example UI code into `src` and call that G1. Migrate one vertical
slice through complete contracts, retaining old paths until their replacements
have actual clients. Keep native core/media consumers building throughout.

## F0 — Stabilized foundation

### WP-00: evidence, ABI and dependency inventory

**Depends on:** current integrated source. **Likely areas:** `src/root.zig`,
`build.zig`, `tools/checks`, `tools/validate.py`, bindings, porting docs.

Inventory public APIs, representative call coverage, actual provider loading,
version-sensitive layouts, ownership/leases and option behavior. Record binary
and runtime dependency baselines for small core/image/audio/window consumers.
Replace reference-only checks where necessary with calls; retain the prohibition
on executing the compile consumer.

**Acceptance:** reproducible baseline report; no-libc consumer; real missing-symbol/
version rejection fixtures; every existing finite example still works. Distinguish
current bugs, deliberate behavior differences and unverified hardware paths.

### WP-01: lifecycle, queues and domain contracts

**Depends on:** WP-00. **Areas:** events/platform/app/GPU resource contracts.

Consolidate timestamp/coordinate/handle domains, callback quiescence and close
rules. Expand allocation-failure tests. Address ordered event-drain costs without
changing filters/watchers/range semantics. Audit provider objects retained by
native callbacks and GPU commands; unfinished compaction stays disabled/unsupported.

**Acceptance:** queue equivalence and pressure measurements; stale-handle/error
fixtures; deterministic shutdown and one final outcome for every accepted ticket.

## G0 — Prove GUI architecture before a catalogue

### WP-02: dependency feasibility spikes

**Depends on:** agreed text/semantic/paint contract drafts from this plan.

Run bounded experiments, each producing a decision record and disposable adapter
prototype rather than a new permanent public API:

- Pango paragraphs: mixed bidi/fallback, cursor maps, raster output and a supported
  route to stable glyph/font identity for later GPU use.
- AccessKit C: one real Linux accessible window, editable text and close/action races.
- Cairo: replay proposed paint operations and color-policy limitations.
- zlay: mapping retained IDs and measurements, failure/capacity behavior and
  changed/full-layout performance for the actual pinned dependency.

**Acceptance:** pinned build/runtime inputs, owned-object teardown, a native demo,
capability gaps and a clear adopt/reject/revise recommendation for each experiment.
If a gate fails, revise the dependency choice before building widgets on it.

### WP-03: identity/store/update transactions

**Depends on:** WP-01; provider experiment constraints known.
**Proposed areas:** `src/ui/{identity,store,update,snapshot}.zig` (names illustrative).

Implement stable keys, generational/domain checks, staged updates, validation,
atomic publication and typed state stores. Add an ergonomic builder over that
same engine. Do not add a second independent widget implementation.

**Acceptance:** reorder/remove/kind-change/duplicate-key and every-allocation-failure
fixtures; retained snapshots survive updates; staged strings never dangle; app
model edits are not replayed when a scene update is retried.

### WP-04: text paragraph/document contract

**Depends on:** WP-01/02; may develop against model-only scenes before WP-03 finishes.
**Proposed areas:** `src/text` plus private selected-provider bindings.

Add immutable layout results, font instances, cluster/position mappings and
application-owned editable documents with transactional edits and undo grouping.
Separate shaping, document and raster lifetimes. Preserve low-level direct
HarfBuzz use as an explicitly narrower service where valuable.

**Acceptance:** mixed scripts, grapheme deletion, bidi selection/carets, font fallback,
round-trip hit tests, undo and cancellation tests; provider-consistent paint data.

### WP-05: semantic tree and native bridge skeleton

**Depends on:** WP-02/03; text range integration follows WP-04.
**Proposed areas:** `src/ui/semantics` and a private native bridge adapter.

Publish immutable semantic snapshots, stable IDs and validated actions routed to
the UI owner. Implement roles/names/focus and editable text ranges for the first
controls. Provide an internal test driver and a separate real native path.

**Acceptance:** real screen-reader inspection/action on Linux, stale action/close
races, no duplicate announcements, protected-text policy, versioned range mapping.

## G1 — Usable Linux GUI vertical slice

### WP-06: layout, paint and first controls

**Depends on:** WP-03/04/05; selected zlay/paint adapters from WP-02.

Create row/column/overlay/scroll primitives and the label/button/checkbox/text-field
slice. Add owned display lists, CPU execution and explicit style tokens. Standard
controls generate semantics and use common actions. Inspector exposes identity,
layout, focus and semantic data early enough to debug the following packages.

**Acceptance:** a settings application works through keyboard, pointer, IME and
screen reader; identical state is seen by paint/hit/semantics; failures keep the
last-good scene; idle does not poll/repaint continuously.

### WP-07: focus scopes, overlays and native text input

**Depends on:** WP-04/05/06.

Finish modal/menu focus rules, capture/gesture cancellation, popup placement,
clipboard/paste and composition/surrounding-text. Add document revision and native
offset conversion tests. Integrate system appearance/font scale/reduced motion.

**Acceptance:** real Wayland and X11 IME scenarios, nested modal workflows,
focus restoration, text-selection clipboard and scale/scroll candidate placement.
Headless replay alone does not close this gate.

### WP-08: virtual lists and general form controls

**Depends on:** WP-06/07.

Add bounded visible-range lists, stable item selection/AX reveal, variable-height
anchors, radio/switch/slider/progress/listbox/tabs/disclosure/tooltip/combobox and
accessible validation. Do not implement offscreen items as lost semantics.

**Acceptance:** 100k logical items with bounded materialization; keyboard/search/
AX reveal and reordering preserve identity; form flows in RTL/long translations.

### WP-09: migrate applications and package G1

**Depends on:** WP-06/07/08; native integration and packaging evidence.

Migrate the dashboard's controls/dialog/editing and the player's ordinary controls
to the public APIs. Keep custom charts/video as content-host clients. Move only
contract-complete helpers out of `examples/apps/ui`; delete duplicate paths only
when replacement consumers and compatibility mapping exist.

**Acceptance:** both apps consume the public API without privileged internals;
component gallery, docs and a clean-install Linux desktop package pass. Publish
explicit CPU/GPU, text, IME, AX and backend capability statuses.

## G2 — Acceleration and professional applications

### WP-10: Vulkan paint conformance and resource lifecycle

**Depends on:** stable display-list/text contracts and WP-01 GPU lifetime fixes.

Implement missing paint operations incrementally, staging/atlas budgets, clip/layer
ordering and explicit color modes. Match provider text and resource ownership.
Keep CPU fallback correct. Do not bundle experimental memory relocation into
this package without its own proof.

**Acceptance:** real-driver validation, paint fixtures, resize/occlusion/device-loss,
in-flight destruction and resource-pressure evidence. Quantified end-to-end win
on representative scenes, with no output/quality regression.

### WP-11: editor/data-grid/tree/docking workloads

**Depends on:** WP-04/07/08; accelerated rendering is optional until its gate passes.

Add large-document storage/layout, active cell editing, logical grid semantics,
virtual trees, pane layout documents and command/undo integration. Build reusable
viewport/pan/zoom/selection primitives for charts, graphs and timelines.

**Acceptance:** named professional workloads with bounded memory, coherent
selection/IME/AX behavior, anchor stability and interaction latency measurements.

### WP-12: assets, image providers and media content

**Depends on:** stable resource/packet/worker contracts; independent media can
progress alongside GUI packages without importing UI.

Audit/enforce codec options; add selected external providers and optional SVG;
provide asset request/cache budgets and explicit animation sequences. Review the
player's FFmpeg ABI boundary before promoting media services. Connect video/YUV/HDR
content to paint through typed leases and clock/seek generations.

**Acceptance:** independent codec/metadata corpora, real frame/seek/pause workflows,
provider-absence tests, bounded decode/upload and safe close/device loss.

### WP-13: performance, tooling and release hardening

**Depends on:** workload-specific evidence from the previous packages.

Complete dirty-reason/stage/allocator/packet tooling, cache tuning and benchmark
comparisons. Validate opt-in inspector/redaction and release builds without tools.
Review the public API/error/ownership documentation and deprecate proven replacements.

**Acceptance:** the reference workload suite meets agreed budgets or records an
explicit evidence-backed scope change. No unsupported feature is marketed as
complete because another layer has its enum or signature.

## G3 — Native platform expansion

### WP-14: Windows

**Depends on:** stable domain/UI contracts and an actual Windows environment.

Implement native window/input/IME/clipboard/drag/drop/AX/presentation/distribution
adapters. Choose text/render providers through the same contracts, keeping
platform-specific behavior intentional. Run native accessibility and DPI suites.

### WP-15: macOS

**Depends on:** stable contracts and an actual macOS environment.

Implement Cocoa lifetime/window/text/menu/accessibility/presentation/distribution
integration, including native control conventions. Verify main-thread and
backing-scale behavior. Do not claim native fidelity from a cross-compiled binary.

Other target families need separate briefs. None is silently included in G3.

## Dependency sequence and stop conditions

F0 contracts unblock G0 experiments/store/text/semantics. Those converge before
G1 controls and native workflows. G2 adds performance/advanced content without
redefining identity/ownership. G3 ports validated contracts to other machines.

Stop and revise a package when its provider cannot honor a contract, tests reveal
ambiguous ownership, a performance comparison changes semantics, or independent
widget work requires incompatible text/ID/action models. This is a decision gate,
not permission to hide the discrepancy behind another adapter name.

## Definition of done for a work package

A package is done only with source/ABI provenance, ownership/thread contracts,
representative compile calls, correctness/failure fixtures, migration client,
applicable native checks, measured cost where claimed, and updated capability/
porting documentation. Green compilation or an agent report alone is insufficient.
