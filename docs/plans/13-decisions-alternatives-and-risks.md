# Architectural decisions, alternatives and risks

[Plan index](../../PLAN.md) · [Sources](14-sources-and-evidence.md)

Status: recommended decisions pending implementation evidence. “Recommended”
is a planning choice; “gated” identifies an experiment that can change it.
No provider is installed or adopted by writing its name here.

## ADR-01 — Custom-drawn GUI with native integration

**Choose:** a shared custom-drawn semantic engine, with native text input,
accessibility, clipboard/drag/drop, dialogs and appropriate menu/window services.

**Alternative:** primarily wrap GTK/Qt native widgets. That could be the better
product if native controls and a smaller bespoke rendering surface become the
main priority. It introduces different ownership/platform/styling constraints
than the current custom GUI work. Do not maintain two complete widget stacks in
G1 just to postpone deciding.

**Revisit when:** applications chiefly need native widget embedding or the custom
engine cannot meet accessibility/text gates at an acceptable maintenance cost.

## ADR-02 — One retained engine with a declaration frontend

**Choose:** persistent records and explicit updates, plus an ergonomic builder.
This supports stable focus/documents, native semantic queries and incremental
work without mandating an application reactive framework.

**Alternatives:** a purely transient tree, or a heavyweight object/property
framework. The former makes independent native queries/lifetimes harder; the
latter can impose runtime/build cost and ownership conventions on every consumer.

**Gate:** reorder/remove/cancel/AX and snapshot-lifetime fixtures, not a static demo.

## ADR-03 — Transactional publication

**Choose:** stage/validate/resolve/publish and immutable reader snapshots.
**Cost:** memory for staging, versioning and retained readers. Mitigate with
bounded queues/caches and structural sharing only when correct and measured.

**Reject:** callbacks mutating a half-reconciled tree, or an update that succeeds
while omitting controls due to an internal fixed array. Application model changes
are a separate transaction boundary and are not magically rolled back by UI OOM.

## ADR-04 — Logical layering before package proliferation

**Choose:** preserve a source package with explicit import direction and inclusion
profiles. Keep one canonical instance of shared types if modules split later.

**Reject:** an umbrella that forces all C link flags, or duplicate source modules
that produce incompatible versions of the same public resource type.

**Gate:** artifact/dependency consumers, compiler/build costs and a type-identity
fixture. Namespace organization by itself is not a tree-shaking benchmark.

## ADR-05 — Pango paragraph adapter first on Linux (gated)

**Choose:** prove [Pango](https://docs.gtk.org/Pango/) for paragraph layout with
coherent fallback/caret behavior; retain the current direct shaping helper only
for an explicitly narrower contract.

**Alternative:** build a full pipeline from HarfBuzz + font discovery/rasterization
+ Unicode bidi/breaking/tailoring libraries. It may suit a later shared engine,
but it is considerably more than retaining the present glyph loop. Do not choose
it merely because it has fewer named dependencies while rebuilding the same work.

**Gate:** supported glyph/font extraction or provider-consistent cached surfaces,
multilingual editing/IME tests, packaging and worker/owner lifetime. If rejected,
record which contract failed before selecting the alternative.

Initial implementation evidence: the [Pango/Cairo paragraph experiment](../experiments/paragraph-cairo.md)
passes combining/bidi/hit/raster and object-lifetime fixtures on the recorded
Linux provider versions. Continue the cached-bitmap route conditionally, with
explicit process-resident provider code for static GObject registrations.
Per-run font identity, production document/IME/AX, version/pressure and native
window gates remain open; this is not production adoption.

## ADR-06 — zlay behind a replaceable adapter

**Choose:** use current investment through a strict constraint/measurement/result
boundary. Its transient IDs do not become document/semantic IDs.

**Alternatives:** improve zlay, use an established C layout engine, or evaluate a
maintained Taffy bridge if required features/performance justify it. Do not assume
a stable official C ABI for a Rust library without checking the actual artifact.

**Gate:** correctness, lifetime/failure behavior, real pinned versions and complete
layout workloads. Old fixture counts or one cached-layout result cannot decide it.

## ADR-07 — CPU reference and existing Vulkan acceleration

**Choose:** owned display lists; optional Cairo CPU support and a conformance-tested
Vulkan path over zdl's existing device work. Keep minimal native raster use.

**Alternatives:** Skia, a WebGPU stack or a vector GPU library. Evaluate only with
a stable binding/deployment strategy, measured benefit and clear ownership. A
C++-centric engine without an accepted maintained C boundary is not an excuse to
spread temporary C++ shims through native modules.

**Gate:** paint/color/alpha semantics, text consistency, live-driver resource tests,
startup/binary/dependency cost and complete-scene timing. Do not replace everything
at once and lose the ability to attribute a regression.

## ADR-08 — AccessKit C integration candidate (gated)

**Choose:** investigate [AccessKit](https://accesskit.dev/) and its
[C binding](https://github.com/AccessKit/accesskit-c) before maintaining every
platform accessibility protocol directly.

**Alternative:** direct AT-SPI first, later UIA/macOS adapters, all against the
same semantic contract. This remains viable if the C artifact/integration cannot
meet required ranges, virtualization, lifecycle or packaging behavior.

**Gate:** real assistive technology and editing/action/close races. The internal
semantic tree is not sufficient proof of native accessibility support.

The [local close-contract investigation](../experiments/accesskit-lifetime.md)
identifies foreign-thread callbacks and an asynchronous adapter removal path.
Provider userdata reclamation must be proven before a native adapter is promoted.

## ADR-09 — Explicit color policies

**Choose:** ordinary G1 SDR sRGB-compatible premultiplied composition, with a
separately tested linear/extended-linear policy for color-critical/HDR content.
Source encoding, alpha convention, working space and output encoding stay explicit.

**Reject:** selecting one backend and silently changing blending/tone mapping.
Cairo's ordinary compositor is not the linear/HDR oracle; plan a float reference
for those modes. Different providers may differ in coverage, but not in an
undocumented interpretation of the application's requested color policy.

## ADR-10 — External libraries are optional implementation providers

**Choose:** use established libraries where they improve behavior, quality,
maintenance or measured performance; keep core/media algorithms independent.
Prefer runtime loading when practical and an explicit directly linked profile
when necessary. Pin supported ABI/artifact ranges, not whatever happens to load.

**Reject:** both “native Zig must be faster” and “a system library makes validation
unnecessary.” Dynamic loading neither removes transitive dependencies nor fixes
an unsafe callback/structure layout.

## ADR-11 — Application-owned documents and models

**Choose:** controlled values/actions plus explicit mutable document registrations.
The toolkit owns mechanics/caches, not the application's domain database.

**Reject:** two authorities for the same text/selection, hidden callbacks into a
freed application object, or forcing every consumer into one global reactive store.

**Gate:** two realistic applications, host embedding, undo/validation and stable
ownership through movement/removal of controls.

## ADR-12 — Async ownership, not deferred borrowed callbacks

**Choose:** typed owned completions, bounded queues and retained packet resources.
Start on one UI owner; use worker-local provider contexts and a render worker
only when justified. Expose selected providers' thread policies.

**Reject:** naked pointers to window/UI/app state in long-lived callbacks, one
thread pool per image request, or an implicit multiplication of decoder threads
inside a large asset worker pool. Cancellation does not prove quiescence.

## ADR-13 — Stable public core with deliberate compatibility

**Choose:** coherent namespace entry points, private bindings, ownership-preserving
compatibility aliases and a bounded migration period before a stable GUI API.

**Reject:** silently changing owner/borrow semantics under an old spelling or
recreating SDL globals/dynapi for convenience. Keep reference source/origin notices
and candid pending-feature ledgers.

## ADR-14 — Useful releases rather than feature-count completion

**Choose:** the accessible editable vertical slice, then scalable/professional
workloads. Optional complex codecs/content and additional platforms proceed
through their own gates.

**Reject:** calling a button demo “the toolkit,” or postponing a reliable Linux
release until every optional media format and controller is reimplemented.

## Risk register and mitigation ownership

- **R1 — Text scope underestimated.** Owner: text lead. Close with multilingual
  caret/IME/native range evidence before exposing the editor as production-ready.
- **R2 — Dependency artifact burden.** Owner: platform/release lead. Prove pinned
  C artifacts, ABI detection, transitive dependencies and clean-install behavior.
- **R3 — Snapshot/cache memory growth.** Owner: runtime/render lead. Bound queues,
  inspect retained-reader/resource graphs and test pressure/close paths.
- **R4 — AX callback deadlock or UAF.** Owner: semantics/runtime lead. Immutable
  reads, owner-thread action marshalling, cancellation and quiescence tests; never
  block the UI waiting for a callback that itself waits on the UI.
- **R5 — “Incremental” frontend still rebuilds everything.** Owner: UI/layout lead.
  Measure declaration versus reconciliation/layout/paint costs; add explicit keyed
  memoization and virtualization instead of unverifiable complexity claims.
- **R6 — Too many schedulers/threads.** Owner: runtime/media lead. Budget decoder
  parallelism with asset workers; document unavoidable provider-owned threads.
- **R7 — Color/alpha disagreement.** Owner: rendering/color lead. Typed policy,
  explicit conversions and a separate linear/HDR oracle.
- **R8 — Widget breadth outruns behavior.** Owner: widget/QA lead. Component gates
  require semantics, keyboard, IME and failure evidence, not appearance alone.
- **R9 — Cross-platform abstraction by guesswork.** Owner: platform lead. Keep
  capability differences and wait for actual platform machines before promises.
- **R10 — Existing media regressions during GUI extraction.** Owner: integrator.
  Core/no-libc, audio/image and old examples remain required migration clients.
- **R11 — Performance marketing outruns evidence.** Owner: release lead. Publish
  named workloads, variation, output checks and limits; no universal fastest claim.
- **R12 — Dependency/license update debt.** Owner: release lead. Track origins,
  notices, redistribution choices and updates per delivered profile; obtain
  project-appropriate review before changing distribution models.

Roles describe accountability, not a staffing assumption. One person may own
several; a work package without an owner and acceptance evidence is not ready.

## Experiments that must precede irreversible choices

1. Pango text result/raster/GPU identity and IME round-trip.
2. AccessKit C + real Linux assistive editing/virtual-item access.
3. zlay retained-adapter failure and partial-update behavior.
4. Cairo/Vulkan compatible paint/color reference agreement.
5. Profile-level binary/link/runtime dependency elimination.
6. Snapshot pressure and close with delayed render/font/AX completions.

Keep results with exact versions and a decision outcome. Change the recommendation
when the evidence warrants it; do not change the contract merely to conceal an
implementation shortcut. Keep API experiments small enough to discard cleanly.
