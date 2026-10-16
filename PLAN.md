# zdl media and GUI architecture plan

**Status:** architecture proposal with implementation in progress under an active goal.
**Planning source baseline:** local commit `794ddb2`, inspected 2026-10-15.
Implementation progress is recorded in [foundation status](docs/foundation-status.md).
The first GUI dependency experiment is [Pango/Cairo paragraphs](docs/experiments/paragraph-cairo.md).
The design documents remain proposals until their individual gates are met.

All Zig API fragments below and in the linked plans are **illustrative proposed
interfaces**, not existing APIs, compiled examples, or compatibility promises.

## Direction

Make zdl a composable native application toolkit: dependable multimedia and
platform foundations, a capable custom-drawn GUI, excellent international text,
real accessibility, and tools that explain behavior and cost. Keep it useful
when the consumer wants only a pixel converter, an audio stream, a window, or
an embedded UI. A GUI application must not require owning every device backend;
a media application must not acquire the GUI's dependencies.

“Best” is a product ambition, not a claim this checkout can substantiate. Judge
it through real applications, independent correctness evidence, accessible
workflows, predictable resource use, distribution quality, and reproducible
comparisons. More supported formats, a passing build, and attractive screenshots
are useful evidence, but none independently establishes a great toolkit.

## Recommended architectural decisions

1. **One coherent semantic GUI engine.** Retain identity, interaction state,
   text documents, layout results and accessibility semantics. Allow an
   ergonomic declaration builder over that engine. Do not create separate
   immediate-mode and retained-mode widget implementations.
2. **Explicit transactions and immutable snapshots.** Validate and publish UI
   updates atomically. Paint, hit testing and accessibility consume versioned
   results of the same committed update. Rendering never borrows stack-local
   declarations or mutable application objects.
3. **Separate application data from toolkit mechanics.** Applications own their
   domain model and documents. zdl owns focus, capture, composition sessions,
   animation state and caches. Actions and edits cross a documented boundary.
4. **Text and accessibility determine the architecture early.** Editable text,
   bidi navigation, IME, semantic roles and native accessibility actions are
   foundational contracts. A label painter is insufficient.
5. **Reuse established libraries at difficult boundaries.** Recommend Pango's
   paragraph stack for the first production Linux text adapter, AccessKit's C
   binding as the first accessibility integration candidate, Cairo as a rich
   CPU painter/reference, and librsvg for desktop SVG. Each has a feasibility
   and distribution gate; none becomes a mandatory core dependency.
6. **Keep zlay behind a layout contract.** Reuse it where it meets the contract;
   do not expose its IDs, element declarations or lifetime model as zdl's
   permanent widget API. Do not replace it based solely on a benchmark headline.
7. **Keep and harden the existing Vulkan work.** Build a backend-neutral paint
   protocol over it. Do not simultaneously rewrite Vulkan, adopt a second GPU
   abstraction, and redesign widgets. Accelerated GUI readiness requires live
   driver validation, not just compiled command bodies.
8. **Make inclusion and capability explicit.** Compile-time profiles select
   what can exist; runtime selection chooses among compiled, available providers.
   Publish actual capabilities and useful diagnostics. Do not silently ignore
   options or reinterpret a requested feature as a weaker one.
9. **Linux desktop first, portable contracts now.** Wayland and X11 are the first
   complete GUI targets. KMS/headless retain their distinct capabilities.
   Windows/macOS work begins and is validated on those machines; contracts must
   avoid embedding Linux assumptions in the semantic GUI.
10. **Consolidate before expanding.** Preserve working media APIs and examples,
    fix lifecycle/ABI/queue correctness, then extract GUI foundations in vertical
    slices. Do not move the whole example toolkit into `src/ui` unchanged.

These are recommended defaults. The exact dependency versions, ABI support
ranges, GPU export path for shaped text, and packaging choices remain gated by
[decision records](docs/plans/13-decisions-alternatives-and-risks.md).

## Read the plans in this order

- [00 — Current state and evidence](docs/plans/00-current-state.md): what exists,
  what is missing, and which prior validation results can actually support.
- [01 — Modules and public API](docs/plans/01-modules-and-public-api.md): logical
  layers, dependency direction, inclusion profiles and API conventions.
- [02 — Runtime and ownership](docs/plans/02-runtime-ownership-and-concurrency.md):
  event loop, cancellation, queues, handles, failure and shutdown rules.
- [03 — GUI state and transactions](docs/plans/03-ui-state-and-transactions.md):
  identities, retained records, declaration builder and snapshot publication.
- [04 — Layout and virtualization](docs/plans/04-layout-and-virtualization.md):
  intrinsic measurement, constraints, scrolling, lists, grids and motion.
- [05 — Text and editing](docs/plans/05-text-editing-and-localization.md): fonts,
  paragraph layout, documents, carets, IME and localization.
- [06 — Painting and compositing](docs/plans/06-paint-rendering-and-compositing.md):
  display lists, CPU/GPU paths, color, clipping, resource retirement and export.
- [07 — Input and accessibility](docs/plans/07-input-focus-and-accessibility.md):
  routing, focus scopes, gestures, semantic trees and native bridge actions.
- [08 — Widgets and design system](docs/plans/08-widgets-and-design-system.md):
  component anatomy, themes, complex controls and extension interfaces.
- [09 — Media, assets and services](docs/plans/09-media-assets-and-services.md):
  codecs, image contracts, video/audio integration and optional document content.
- [10 — Platforms and distribution](docs/plans/10-platforms-and-distribution.md):
  desktop integration, embedding, library loading, deployment and portability.
- [11 — Verification and tooling](docs/plans/11-validation-performance-and-tooling.md):
  test layers, workloads, proposed budgets, profiling and developer tools.
- [12 — Migration roadmap](docs/plans/12-migration-roadmap.md): work packages,
  dependencies, acceptance evidence and useful release cuts.
- [13 — Decisions and risks](docs/plans/13-decisions-alternatives-and-risks.md):
  alternatives, reversal conditions and unresolved experiments.
- [14 — Sources](docs/plans/14-sources-and-evidence.md): local evidence and primary
  external documentation, including verification limits.

## Scope and product boundaries

The primary product is a **custom-drawn native GUI with native integration**,
not an attempt to implement a browser or reproduce every operating-system
widget in parallel. Native file dialogs, menus where appropriate, accessibility,
clipboard, drag/drop, window controls, IME and platform settings must still work.
A custom appearance does not justify custom, surprising interaction semantics.

Support these application classes through shared foundations:

- Utilities, forms, preferences, dashboards and data-heavy desktop applications.
- Editors and development tools with large documents, trees, tables and logs.
- Image/video/audio tools with accurate content presentation and responsive UI.
- Game/tool overlays and embedded GUI surfaces that borrow an existing runtime.
- Headless testing and supported export workflows.

Rich documents, terminal emulation, PDF display and embedded web content are
optional content integrations, not prerequisites for the first GUI release.
Mobile and browser distribution are later product decisions, not implied by
“cross-platform.” Networking, databases and application-specific business models
remain outside the core; offer adapters rather than a second standard library.

## Cross-cutting invariants

- No process-global allocator, hidden subsystem startup or thread-local last error.
- All public ownership, leases, thread affinity and cancellation behavior are stated.
- No C pointers or C userdata in ordinary application-facing GUI APIs.
- No GUI dependency from pure audio, geometry, image, filesystem or input models.
- No layout ID used as a durable document, window, resource or semantic identity.
- No rendering command reads application state after the recording call returns.
- No input event exposes a foreign clock as a host monotonic event timestamp.
- No successful update publishes half a tree or an invalid accessibility reference.
- No feature is “supported” because its signature is recognized or its option exists.
- No performance claim without workload, build mode, environment and output checks.

## First useful vertical slice

Before growing the catalogue, ship a small application containing:

1. A resizable Linux window and idle event loop.
2. A label, button, checkbox and **real editable text field**.
3. A modal dialog with correct focus restoration and keyboard behavior.
4. A scrollable virtual list with stable item identity.
5. An inspectable semantic tree and a working screen-reader path.
6. A CPU paint path, deterministic headless replay, and explicit missing-library errors.
7. Failure-injection tests for construction, update publication and shutdown.

This slice proves the architecture's hardest intersections. An attractive
label/button demo without editing or accessibility does not close this gate.

## Release sequence

- **F0: foundation stabilized.** Existing media/platform behavior is measured,
  ownership/ABI defects are addressed, dependency boundaries have regression tests.
- **G0: GUI contract proven.** IDs, transactions, semantic actions, text positions,
  font adapter and accessibility bridge are demonstrated together.
- **G1: usable Linux GUI.** The first vertical slice, standard controls, dialogs,
  clipboard/IME and scalable lists work with the reference CPU path.
- **G2: accelerated and professional workloads.** Validated Vulkan painting,
  advanced text/documents, tables/trees/docking and coherent media presentation.
- **G3: additional native platforms.** Windows and macOS adapters meet equivalent
  interaction, accessibility, deployment and performance gates on real systems.

Release names are capability milestones, not dates or estimates. Keep optional
advanced modules developing independently; do not block a reliable minimal
library on AVIF internals, a terminal emulator, or every controller driver.

## Execution discipline

Implementation is authorized and the roadmap is tracked as an active goal. Pick
a roadmap work package, freeze its API/ownership contract, add failing acceptance
fixtures, and make a reviewable migration. Keep one integrator responsible for shared APIs and
final verification. The original planning task alone did not authorize implementation. Current
implementation work follows the user's subsequent instructions and repository
policy; release publication and deleting preserved references remain separate.

Record a decision change when new evidence invalidates a recommendation. Update
contracts and dependent plans together; do not let individual component work
invent incompatible IDs, text offsets, queue leases or paint resource ownership.
