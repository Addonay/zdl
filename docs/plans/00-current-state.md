# Current state and architectural pressure points

[Plan index](../../PLAN.md) · [Next: modules](01-modules-and-public-api.md)

Status: source-backed assessment at local `794ddb2` on 2026-10-15. Recommendations
are future work. This planning pass does not rerun the implementation test suite.

## What is already a useful foundation

The [public root](../../src/root.zig) exposes lazy native namespaces. The
[build](../../build.zig) exports source, compiles API consumers without executing
them, and separates libc-backed platform tests from core tests. Keep this ability
to use a small part of zdl without adopting an application framework.

The existing source already separates several concerns well:

- [Surfaces](../../src/video/surface.zig) distinguish owned storage and borrowed
  views; conversion/color/YUV modules hold domain algorithms.
- [Audio streams](../../src/audio/stream.zig) specialize speaker layouts and
  separate conversion/queuing from ALSA, PulseAudio, PipeWire and JACK transports.
- [Event payload storage](../../src/events/payload.zig) gives borrowed event
  slices an explicit owner, instead of pretending a shallow queue owns text.
- [The platform](../../src/platform/linux.zig) unifies backend input/window
  behavior; [graphics integration](../../src/platform/graphics.zig) already keeps
  native window handles out of normal graphics calls.
- [Image loading](../../src/image/image.zig) provides a coherent owned image
  result and explicit options. Keep its codec-independent result contract while
  auditing which options are actually enforced.
- [Media queues](../../examples/apps/player/media/queue.zig) demonstrate bounded
  queues, seek serials and close/wakeup behavior useful to future content hosts.

There is substantial code under video, joystick, audio and GPU, including
bindings/generated data. Source volume measures maintenance exposure, not
completeness or quality. This is a broad SDL-derived foundation, not yet a
released general-purpose GUI toolkit.

## Where the GUI lives today

The toolkit is under [examples/apps/ui](../../examples/apps/ui/ui.zig), rather
than a stable library namespace. It contains:

- `runtime.zig`: immediate declarations through zlay, event handling, focus,
  window controls, redraw scheduling and presentation.
- `text.zig`: runtime-loaded FreeType/HarfBuzz shaping and glyph masks.
- `canvas.zig`: antialiased CPU drawing for the current examples.
- `svg.zig`: a useful icon-oriented SVG subset, not general SVG conformance.
- `theme.zig` and `widgets.zig`: appearance and component helpers influenced by
  the dashboard/player references.

The dashboard and player prove that these pieces can form recognizable native
applications. The [application limits](../../examples/apps/README.md) explicitly
say there is no OS accessibility tree or complete interaction automation. Treat
these apps as migration clients and realistic workloads, not as completed GUI APIs.

## Concrete architectural pressure points

### Transient declaration data needs a library-grade contract

The current `Ui` has a fixed 65,536-byte text store and panics on exhaustion.
Focusable and interactive arrays are capped at 512, with some registrations
silently ignored when full. Suitable prototype constraints become difficult
failure modes in large applications. Replace silent truncation/panic with
fallible transactions and configurable budgets; do not merely increase constants.

### The shaping result is not an editing model

`Text.Run` borrows a reusable buffer overwritten by another shape/measure/draw
call. Public `Placed` values retain glyph IDs and positions but do not expose
source cluster ranges or caret affinity. These are useful drawing primitives,
but insufficient for persistent paragraph caches, bidi caret navigation,
selection, accessibility text ranges or asynchronous rendering.

### Identity is entangled with layout and immediate interaction

Widgets use `zlay.ElementId`; focus/activation are compact IDs and hit testing
uses the previous layout. A production GUI needs scoped stable keys plus
checked live handles, well-defined behavior after reordering/removal, and
transaction ordering that avoids stale geometry or repeated activations.

### Example customization is too unconstrained to promote unchanged

The current public `Custom` paint callback carries `*anyopaque` state; decoration
and icon data pass through layout engine userdata. A general renderer may retain
commands beyond a build or run on another thread. New custom painting must
record owned commands synchronously and retain typed resource leases explicitly.

### Rendering has multiple partially overlapping contracts

There is a software immediate renderer, the example CPU canvas, a GPU renderer,
wide/color conversion code and several presentation paths. Their existence is
valuable; turning them into a GUI requires one paint protocol and documented
color/alpha/coordinate rules. It does not require deleting useful low-level APIs.

The [GPU renderer](../../src/render/gpu/renderer.zig) documents state capture,
resource cycling and format limits. Live GUI workloads, effects, clipping,
context loss and resource pressure need separate validation. GPU relocation
helpers in the integrated draft remain explicitly unsupported.

### Core laziness is not complete integration-level exclusion

A runtime backend switch can keep several implementations reachable. Controller
driver registries likewise select from a fixed list. Introduce inclusion profiles
and prove symbol/dependency removal with actual consumers. Renaming directories
or adding more namespace aliases does not establish tree shaking.

### Queue and error paths need depth before more breadth

[Queue.get](../../src/events/queue.zig) removes ordered array entries. Draining
one event at a time can repeatedly shift the tail. Plan a head-index/ring design
that preserves filters, watchers and range queries; benchmark realistic mixtures.

The earlier `Platform.open` duplicate-destroy defect is fixed in this baseline,
with a [separate regression](../../tools/platform_test.zig). Do not keep planning
it as an unfixed bug. Extend the same failure-path discipline to construction,
partial commits, asynchronous completions and device-loss teardown.

## Evidence tiers

Use distinct labels in future documentation and release notes:

1. **Source-present:** an API/body or binding exists.
2. **Compiled:** representative calls were analyzed and linked.
3. **Model-tested:** deterministic input/output, state or failure fixtures pass.
4. **Backend-tested:** a real implementation ran, with its environment identified.
5. **Workflow-tested:** editing, focus, assistive technology or a media interaction
   passed an end-to-end scenario.
6. **Performance-characterized:** repeated representative measurements with
   independently checked output and recorded environment.

The prior integration record reports 296 native/platform tests, 24 app tests per
mode, and 29 finite run targets. Those runs use headless rendering and ALSA null
output. They do not certify real speakers, compositor interactions, GPU driver
behavior, accessibility or full codec conformance. These are prior recorded
results, not fresh results obtained while writing this plan.

## Reuse, extract, redesign, defer

- **Reuse:** geometry, pixel/color domain work, audio data paths, event models,
  backend bindings and explicit platform/environment conventions.
- **Extract with contracts:** paragraph services, paint recording, theme tokens,
  reusable widget behavior, bounded media completion queues.
- **Redesign:** GUI identity, publication/ownership, focus/capture/modal routing,
  semantic accessibility, editable documents and virtualized data controls.
- **Defer:** native reimplementations of difficult codecs, a second GPU API,
  browser-like styling, a complete terminal/PDF stack, and additional operating
  systems before the Linux slice meets its release gates.

## Baseline work package

Before moving files, record the public import graph, actual optional libraries,
ABI layout checks, feature/option behavior, allocations and cache lifetimes.
Inventory every example-only assumption: embedded fonts, hardcoded dimensions,
owner thread, chosen text raster policy, temporary buffers and swallowed errors.
Each extraction must carry its relevant regression fixtures and a migration client.
