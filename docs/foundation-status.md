# Architecture implementation: first foundation slice

Baseline: `794ddb2`; Zig `0.18.0-dev.253+16d31ceed`. This is the first implementation
slice of [the architecture roadmap](plans/12-migration-roadmap.md), not completion
of F0 or the GUI toolkit. The existing public runtime/widget APIs are preserved.

## Implemented

- Four actual consumer profiles under `tools/consumers`: geometry, native PNG,
  caller-driven mono-to-stereo audio, and the libc-backed Linux platform using
  its offscreen driver. Runtime inputs prevent the first three from being only
  constant-folded demonstrations.
- `zig build check-foundation` builds/links these consumers without running them.
  The ordinary `check` step includes this dependency-boundary check.
- `tools/audit_foundation.py` builds the profiles, freezes the measured binaries,
  executes their safe data/offscreen paths, checks ELF linkage and records hashes,
  sizes, compiler/machine/mode, source hashes and syntactic inventory candidates.
- The image compile consumer now makes actual decoder/encoder/animation/MJPG
  calls behind the impossible PID-zero guard. It must never be executed.
- Event FIFO draining advances a head index instead of shifting the entire tail
  per event. Push compacts only after a sufficiently consumed prefix; this also
  avoids quadratic steady pop/push compaction. The event cap counts live events.
- Range extraction, flushing and superseding window removal compact survivors
  in one stable pass. `cut_pending` deliberately keeps sequential removal because
  filters can observe the queue length; this callback operation is not claimed
  to have the same linear bound.
- New queue tests compare against an independent ordered model, exercise 20,000
  mixed operations and steady FIFO pressure, check callback-visible lengths,
  watcher mutation/nested dispatch and all allocation-failure positions.

Payload ownership has not changed. Queued slices still borrow from the producer;
consuming/clearing the queue does not free or extend their storage. Queue storage
is internal, may retain capacity/consumed prefixes, and is not a byte-budget API.

## Dependency baseline

The mode-verified ReleaseSmall profile run recorded:

- geometry: 149,760 bytes; no ELF dynamic section or shared-library dependencies;
- native PNG: 198,768 bytes; no ELF dynamic section or shared-library dependencies;
- native audio stream: 169,640 bytes; no ELF dynamic section or shared libraries;
- offscreen **unified platform**: 306,424 bytes; dynamic ELF, libc/loader needed.

These include executable startup/std code and the selected consumer, not merely
library code size. Values are local measurements, not universal size budgets.
The platform consumer is distinct from the independently libc-free software
framebuffer. Embedded sonames are static strings, not proof libraries were loaded.

Reproduce with `python3 tools/audit_foundation.py`; select Debug/ReleaseSafe/
ReleaseFast/ReleaseSmall explicitly if comparing builds. The generated JSON and
frozen artifacts are development evidence under `.cache`, not package contents.
Installed consumers are separated under `zig-out/bin/foundation/<mode>` and report
their compiled mode; the audit rejects a mismatched-mode artifact.
Source inventories identify candidates for manual review; they are not a complete
import graph, dynamic-loading graph, ABI certification or body-coverage proof.

## FIFO measurement

The same ReleaseFast benchmark was compiled before and after the queue change.
Three timed drain trials per case checked every ordinal/checksum and excluded
enqueue/allocation/teardown. At 32,000 queued events, the original median was
807.494 ms (range 727.716–1,104.394 ms); the new median was 0.244 ms
(range 0.238–0.249 ms). The after binary's independent ordered-array reference
still took a median 798.750 ms. This is an isolated algorithmic stress case,
not a claim of that improvement in complete UI event processing or frame rate.

Raw before/after logs are in `.cache/foundation/queue-before.log` and
`queue-after.log`. The reusable benchmark is `tools/bench/events_queue.zig`;
its build/run instructions and measurement limits are in `tools/bench/README.md`.

## Acceptance state

- **WP-00: started.** Concrete consumer/link boundaries and inventory tooling exist.
  ALSA now has real missing-provider/missing-symbol ELF fixtures and loader-reference
  ownership checks. PipeWire now has native-header layout checks for the installed
  version. Other bindings and cross-version/version-rejection matrices remain pending. Bare-reference inventory candidates need manual disposition; variable
  references in those candidates are not necessarily missing function calls.
- **WP-01: started.** FIFO/range queue work and related state/failure checks are
  implemented. PipeWire deterministic setup/teardown ordering is covered. Real
  provider concurrency, handle-domain and GPU lifetime review remain pending. Unimplemented GPU relocation remains unsupported.
- **WP-02: started.** The optional Pango/Cairo paragraph experiment passed its
  initial tests and raster demonstrations; see the decision record below. AccessKit,
  zlay, general paint conformance and production text adoption remain gated.
- **G0/G1: not complete.** No retained GUI engine or accessible editable field
  is claimed by the paragraph experiment.

## Validation record

The full `python3 tools/validate.py` matrix passed all 40 commands:

- native Debug build/check and ReleaseSafe build;
- 302/302 library tests in both Debug and ReleaseSafe;
- example Debug/ReleaseFast builds, application build and Debug/ReleaseSafe tests;
- mode-verified dependency audit and all 29 declared finite run targets.

Zig formatting, Python syntax, Markdown local links and `git diff --check` also
passed. Reports and individual command logs are under `.cache/validation`.
Hardware-dependent behavior still needs its own evidence; offscreen/null-device
runs do not certify physical audio, window-manager, controller or GPU behavior.


## Active-goal follow-up: optional loader rejection

The architecture roadmap is now an active implementation goal. The next bounded
WP-00 change adds `zig build test-providers`, also included in `zig build test`.
The private ALSA binding has an internal path-selecting loader seam; public
`audio.alsa.Library.open()` still loads the same system soname and reports
`Unavailable` on loading/symbol failures.

Controlled ELF providers omit an early (`snd_pcm_open`), middle
(`snd_pcm_recover`) or final (`snd_strerror`) required symbol. Repeated rejection
must leave no loaded provider reference, checked using balanced `RTLD_NOLOAD`
probes. A complete symbol table must publish successfully, and independent
loader owners must retain their own references. The four focused Debug tests
pass. The updated full matrix passed all 40 commands, including Debug/ReleaseSafe
library and application tests, dependency isolation, example builds and all 29
run targets. Logs are under `.cache/validation-loader`. ReleaseSafe reports
306/306 library tests; Debug reports 302 executed plus the cached four-test
provider group (also run explicitly above).

Fixture symbol addresses are never called. These are publication/cleanup tests,
not proof of ALSA function signatures, structure layouts or device behavior.
ALSA version rejection is not claimed or invented: the existing binding uses
its versioned soname and required symbol set. A binding with a version-sensitive
layout needs a separate evidence-backed version gate and matching fixtures.

## PipeWire ownership and native-header follow-up

The next WP-00/WP-01 slice fixes two setup/unwind ownership defects:

- Stream property bags are freed if property configuration or loop lookup fails
  before native stream construction. The constructor takes ownership even on
  failure; its caller does not free the transferred bag a second time.
- Failed connection setup now stops the loop and retires native listeners/objects
  before releasing callback-owned strings, queues/maps and the shared allocation.
  Cleanup also covers initialized shared state when listener/start setup fails.
  Close requires callers to finish concurrent public calls and destroy streams
  before their connection, and connections before their library.

`src/pipewire_tests.zig` is a separate libc-linked test root included in
`test-providers` and ordinary `test`. Typed native stubs stay in the private
binding. It covers each property-setting failure, native allocation/loop/
constructor/connect/negotiation failures, all Zig allocation failures, successful
close and a synchronous destruction callback that accesses still-live state.
Connection fixtures inspect retained callback data during native disconnect.

Both ownership regressions were observed before the fixes: the old property
path missed its free, and the old connection unwind exposed already-released
strings. Logs are under `.cache/foundation/pipewire-properties-before.log` and
`pipewire-lifetime-before.log`; the corrected focused provider suite passed.
The stubs establish deterministic lifetime ordering, not real threaded race or
server/device correctness.

Size-negotiated `pw_time` results now start zeroed, so extension fields stay
well-defined if a provider writes only its supported prefix. A prefix-only
provider fixture verifies this behavior.

`python3 tools/audit_pipewire_abi.py` is an **optional** developer audit requiring
installed PipeWire/SPA headers and pkg-config. It translates headers only as
independent verification input, then compile-checks 16 record layouts/prefixes,
hook/interface storage and selected protocol constants against the handwritten
binding. It does not import the translation into the library, load PipeWire,
contact a daemon or add header requirements to ordinary builds. On this machine,
the check passed against the installed **1.6.9** header package. The report
records compiler/header versions, declaration flags and source/translation hashes.
The check allows appended fields in provider-owned prefix records; it does not
certify function signatures or all historical runtime versions.

The full validator supports `--pipewire-headers` to opt into that audit. The
updated **41/41-command matrix passed** under `.cache/validation-pipewire`:
Debug build/check, ReleaseSafe build, Debug/ReleaseSafe library/application tests,
Debug/ReleaseFast examples, the dependency/header audits and **29/29** finite run
targets. The separate PipeWire root contains 14 tests (including imported native
algorithm fixtures); Debug runs passed explicitly, and ReleaseSafe ran them in
the full matrix. The core remains 301 tests, with platform and ALSA fixtures in
their own roots. Zig may reuse successful test runs, so per-command counts differ
when groups are cached. Formatting, Python syntax, local links and diff whitespace
checks pass. No physical devices, native scheduling races or historical runtime
version matrix is certified by these runs.

Ownership/locking evidence: [PipeWire stream API](https://docs.pipewire.org/group__pw__stream.html),
[1.6.9 constructor cleanup source](https://github.com/PipeWire/pipewire/blob/1.6.9/src/pipewire/stream.c),
and [thread-loop locking/stop rules](https://docs.pipewire.org/page_thread_loop.html).


## WP-02 paragraph/CPU-raster experiment

[Decision and evidence](experiments/paragraph-cairo.md) records the disposable
Pango/Cairo spike, which is not exported by `zdl`. Seven opt-in tests pass in
Debug and ReleaseSafe, with native warnings fatal. The same owned native layout
supports combining-grapheme visual motion, mixed-bidi strong/weak carets,
unambiguous hit tests and opaque CPU raster output. Owned input and bitmap/layout
lifetimes have failure tests; the image remains valid after layout destruction.

Wide/narrow mixed-script PNGs were rendered and visually inspected with Pango
1.57.1/Cairo 1.18.4. Real unload/reload exposed unsafe persistent native type/cache
state. The explicit `open_resident` policy now keeps provider mappings resident
until process exit while balancing owned references and destroying owned objects.
This is an adoption constraint, not a claim of leak-free native global caches.

Use `python3 tools/audit_paragraph_spike.py`, or opt into it through
`tools/validate.py --paragraph-spike`. Normal builds/tests acquire no new runtime
provider dependency. The initial experiment recommends continuing with cached
provider-rendered bitmaps; document/IME/AX, per-run font identity, GPU export,
version/pressure budgets and a native window demo remain open. The updated
**42/42-command matrix passed** under `.cache/validation-paragraph`, including
all 29 finite run targets and both optional audits. Audit source hashes still
match current code, and frozen PNG hashes match their report. Formatting, Python
syntax and local Markdown links pass. Existing core/image/audio no-libc consumer
linkage and measured sizes are unchanged. The paragraph audit also passed its
eight internal compile/test/demo commands; cached reruns retain the earlier
explicit Debug/ReleaseSafe seven-test evidence.

## WP-03 retained scene foundation

`zdl.ui.Scene` now provides a model-only retained description/transaction engine.
[API and ownership guide](ui-scenes.md) documents the implemented contract:
parent-scoped integer/full-byte named keys, domain/slot/generation identities,
checked attempt-local drafts, copied strings, child iteration, immutable owning
snapshots, transactional focus/capture references and allocation-free close.
A new scene never inherits IDs of a destroyed scene at a reused address: a
process-wide saturating atomic issuer supplies unique owner domains. That counter
holds no allocator/current-runtime/object registry. Slot generations, owner IDs,
transaction/revision counters and reference counts do not wrap.

Fifteen new identity/scene tests cover randomized reconciliation, snapshots
across revisions/owner destruction, scope/kind/removal/disablement repair,
duplicate/forced-collision equality, stale/foreign IDs/drafts, every allocator
failure in multi-version publication, limits and exhausted counters. A pending
update keeps a separate core reference so close/deinit can invalidate publication
without leaving its abort path dangling. Builder and explicit add calls use the
same engine; failed staging is poisoned and cannot publish omitted nodes.

The initial benchmark exposed staging/index scratch retained in snapshot arenas.
Published storage now owns separate immutable copies; staging/index scratch is
freed at publication. For 100k integer-key/empty-label nodes, the arena fell from
135,837,890 to 36,000,168 bytes. This is one snapshot arena's capacity, not peak/RSS
or total memory across retained versions. Latest ReleaseFast three-trial medians:

| Nodes | Full reverse description | Publication | Snapshot arena capacity |
| --- | ---: | ---: | ---: |
| 1,000 | 0.636 ms | 0.768 ms | 360,168 bytes |
| 10,000 | 6.648 ms | 6.684 ms | 3,600,168 bytes |
| 100,000 | 62.862 ms | 79.438 ms | 36,000,168 bytes |

The benchmark verifies order, retained keys/IDs/focus and checksum outside the
measured intervals. It demonstrates the current O(n) baseline, not a frame budget,
whole-GUI win or comparison against another toolkit. Raw logs and frozen before/
after binaries are under `.cache/scenes`; `current.json` pins the final benchmark
source/binary hashes, compiler, machine and command. Reusable instructions are in
`tools/bench/README.md`. Virtualization and incremental work remain necessary.

`check-foundation` now includes a fifth runtime-input, libc-free scene consumer.
The mode-verified ReleaseSmall executable is 163,184 bytes and has no ELF dynamic
section, linked libraries or GUI-provider sonames; the prior four profile sizes
are unchanged on this host.
The final updated matrix **passed all 42/42 commands** under
`.cache/validation-scenes-final`: Debug/check/ReleaseSafe builds, Debug and
ReleaseSafe library/application tests, example builds, both optional audits, the
paragraph experiment and all **29/29 run targets**. Each library test command
reported 317 executed tests plus cached provider groups. Source hashes in the
final dependency audit match current code. Formatting, Python syntax and local
links pass. The final benchmark was rerun on the verified source and its own
source/artifact hashes are recorded.

An earlier run was stopped to fix finished-builder stack access; finished methods
now reject before inspecting released staging data, with a dedicated regression.

**WP-03 is started, not complete.** Node categories are model records, not actual
widgets. Typed channels are implemented in the follow-up below; document/resource
leases, layout/semantic/paint publication, actions, native focus/capture cancellation and cross-thread
snapshot handoff are still open. The first real accessible editable application,
AccessKit/zlay feasibility and all later roadmap gates remain required.


## WP-03 typed retained-state channels

`ui.with_states(.{ .channel = Policy, ... })` now instantiates the same retained
scene engine with separate sparse typed pools. `ui.Scene` remains the empty-schema
alias, so its node headers and API do not acquire a giant state union. No public
void pointers, runtime type-name hashes or global state-store registry are used.
The channel and its value type are checked at compile time.

A staged set clones a replacement before publication; a clear is explicit.
Unchanged cells are retained only for matching node identity, and shared across
immutable versions. Kind/scope/slot-generation changes do not inherit old state.
Cells release their owned values only when the last version retires them.
Node/focus/capture/state publication shares one commit point. Clone/allocation/
limit/reference failures leave the prior scene intact; unpublished and superseded
values release exactly once. Close can invalidate a pending state update without
freeing the core it still needs to abort safely.

`ui.state.Value(T)` accepts pointer-free scalar/aggregate values. Owned resources
use explicit clone/deinit policies, with optional logical owned-byte accounting.
Policies may not reenter or mutate application models; cleanup is infallible and
can occur at staging abort or version retirement. Deep immutability/owned-resource
accounting of a custom policy remains its implementer's contract. Defaults bound
published state to 100k entries and 16 MiB logical bytes per version, not process
RSS or all independently retained history. [The guide](ui-scenes.md#typed-retained-state-channels)
contains the exact API, lifecycle and budget definitions.

Seven new state tests pass: independent multi-channel ownership/replacement/
clear, identity isolation, clone validation, aggregate count/byte limits,
reference exhaustion, pending close/foreign/finished drafts, all allocation
failures, and 100 randomized multi-channel history rounds. Original scene tests
still pass. `tools/check_state_types.py` adds one compile-positive and four
compile-negative public API fixtures (wrong type, unknown channel, pointer-bearing
value policy and invalid schema); generated programs are never executed.

The sixth foundation profile exercises typed state from runtime inputs. Its
mode-verified ReleaseSmall executable is 171,096 bytes with no ELF dynamic
section, linked libraries or provider sonames. The five existing consumer sizes
are unchanged, including the plain scene consumer at 163,184 bytes. These remain
whole-executable local measurements, not a universal library size budget.

The full `.cache/validation-state` matrix passed **42/42 commands**, including
Debug/ReleaseSafe library/application tests, builds, optional provider/paragraph
audits and all **29/29 run targets**. Library commands report 324 executed tests
plus cached provider groups in each mode. The five type fixtures also passed
separately under `.cache/state-types`. They are now part of the normal validator;
the final integrated run passed **43/43 commands** under
`.cache/validation-state-final`, including all five type fixtures and **29/29**
run targets. Empty-schema scenes retain their original error set; StateLimit
belongs only to stateful models. The final dependency/type-fixture source hashes
match current code. Zig formatting, Python syntax, local links and diff whitespace
checks pass. These tests certify the model/state layer, not native widget/IME/AX
behavior or concurrent snapshot access.

WP-03 remains open for application-owned document/resource registrations,
semantic/layout/paint publication, action delivery and native integration. This
state API does not supply a mutable application reducer or actual widgets.

## WP-04 application-owned document model

`zdl.text.Document` now supports revision-checked UTF-8 replacement batches,
retained immutable snapshots, directional selections with line/bidi affinities,
explicit semantic grouping, and bounded undo/redo. [The document guide](text-documents.md)
defines the exact ownership, byte/range, history, policy and limit contract.
All allocations/validation precede publication. Stale/foreign edits fail, and
undo/redo issue fresh state revisions instead of reviving old request tokens.

The owner-domain issuer moved into `core/identity.zig` and is shared by scene and
document identities. The document module imports no UI/provider backend. Scene
identity keeps its existing public alias; no second issuer or domain collision
is introduced across the new module boundary.

Fifteen new document fixtures pass focused checks: UTF-8 batches and rejected
ranges, newline/NUL/size/read-only policies, selection direction and strong/weak/
wrap affinity, grouped/limited history and redo branching, close/owner reuse,
reference/revision/group exhaustion, all allocator failures in edit/history/
group publication, and 400 independent randomized history-model rounds. A scene
integration fixture proves that an accepted document edit survives a failed GUI
publication and is not repeated when scene description retries. Old scene/document
snapshots remain valid even after the application document is destroyed.

The initial validation run was stopped to add missing affinity preservation;
byte offsets alone would have lost wrap/bidi caret intent across history. The
final benchmark and matrix use the completed selection contract. The final
**43/43-command matrix passed** under `.cache/validation-documents-final`, with
Debug/ReleaseSafe library/application tests, compile checks, optional audits,
paragraph experiment and **29/29 run targets**. Reports/source hashes match
current code. Formatting, Python syntax, local links and diff whitespace pass.

The seventh dependency profile runs the document pipeline from runtime input.
Its ReleaseSmall executable is 158,312 bytes with no ELF dynamic section, linked
libraries or provider sonames. Geometry/PNG/audio/state/window profiles retain
prior measured sizes; the plain scene profile is 163,176 bytes in this build
(previously 163,184). These are selected whole-executable measurements, not full
library sizes or a performance claim.

The benchmark measures 32 contiguous prepend edits at 1 KiB/64 KiB/1 MiB,
separate undo/redo traversal, and independent output/history/old-snapshot checks.
It excludes shaping, layout and presentation and does not certify typing latency.
The report pins compiler/machine/command/source/binary hashes and raw trial ranges.
Small cases show substantial allocator/cache variance; large-editor storage and
paragraph virtualization remain open. Latest three-trial median edit-batch times
(32 edits, ReleaseFast) are 0.083 ms at initial 1 KiB, 1.790 ms at 64 KiB and
30.232 ms at 1 MiB. Full arrays, separate undo/redo times and logical history
accounting are in `.cache/documents/benchmark.log`; `.cache/documents/benchmark.json`
pins the final inputs and frozen binary hash. These totals include edit allocation,
history retirement and result release, and exclude setup/checks/teardown and GUI
work. They are not per-keystroke frame budgets.

WP-04 is **started**, not complete. Actual Unicode navigation/shaping/IME,
protected text, document registrations, accessibility ranges and a native editable
control still need their integration gates. The current API preserves layout
metadata but does not calculate visual caret positions or grapheme boundaries.


## WP-03/WP-04 checked document routing

`zdl.text.Registry` adds generation/domain-checked logical registrations for
application-owned mutable documents. [The registration guide](document-registrations.md)
spells out stable-address borrowing, cleanup ownership, snapshot separation and
external producer-quiescence requirements. Delayed targets contain only a view
handle and the observed document revision. Dispatch validates both before editing;
no mutable document pointer is exposed to consumers of scene/native snapshots.

An owning Registration has a separate core reference, so its cleanup remains safe
when the registry owner closes/dies. Closing/unregistering invalidates before any
borrow can be used again. Independent views of the same document are independent
handles. Reuse uses a free list and increments generations; retired slots never
wrap. Cleanup is allocation-free and does not destroy application documents or
implicitly operate external callbacks/composition sessions.

Nine new fixtures pass targeted tests, including all allocation failures, stale
view/revision/document handling, independent views, early invalidation plus reuse,
registry-owner destruction, read-only/closed documents, generation/reference/slot
limits, batch/selection/undo/redo routing and 10,000 reuse cycles. This does not
certify real OS callback races or complete native document registration behavior.

The eighth foundation consumer exercises this public routing path without libc.
The full **43/43-command matrix passed** under
`.cache/validation-registrations`, including Debug/ReleaseSafe library/application
tests, optional audits/paragraph experiment, type fixtures and **29/29 run targets**.
After the final stable-address documentation clarification, the dependency audit
and focused registration suite were rerun. Refreshed source hashes match current
code; formatting, Python syntax, local links and diff whitespace checks pass.
The mode-verified ReleaseSmall registration consumer is 161,192 bytes with no ELF
dynamic section, linked libraries or provider sonames. All seven prior consumer
sizes are unchanged in this run; these are local whole-executable measurements.
Native text-field, IME, focus/seat, asynchronous action outcomes and accessibility
binding integration remain open; the registry supplies their checked owner-thread
routing primitive, not those complete adapters.


## Paragraph/document editable-field experiment

The [editable paragraph experiment](experiments/editor-paragraph.md) now connects
registered application documents to Pango/Cairo painting, logical grapheme
boundaries, bidi selection ranges, visual movement and hit testing. Five opt-in
controller tests cover text/history/selection behavior, stale composition and
closed views, all Zig allocation failures (including selection painting), and
accepted undo followed by failed/retried UI refresh without replaying the undo.
The paragraph suite now has nine tests, including combining/emoji/flag stops and
split bidi decoration. The public core still imports none of these providers.

An optional Linux window shell and finite offscreen script share the controller.
The inspected 720×400 image contains mixed Latin/Hebrew/Arabic and combining text,
blue visual selection and a caret from the same layout. The controller prepares
ordinary edit presentation before applying the model and preserves the complete
last frame on failure. Native events use committed text input, not duplicated
printable-key synthesis. This is a disposable feasibility tool, not a second
production widget engine or a completed text-field API.

Private Xvfb native input QA was attempted and failed before interaction because
the server could not create listening sockets. The reusable driver records
`environment-unavailable` under `.cache/spikes/editor/native-qa`; native input is
not marked passing. No user host display or permission workaround was used.

The full opt-in matrix (including `--editor-spike`) **passed 44/44 commands**
under `.cache/validation-editor`, including Debug/ReleaseSafe library/application
tests, type/provider audits, paragraph/editor experiments and **29/29 run targets**.
The editor audit was rerun after adding the joining-insertion regression; all six
build/test/script commands pass with five controller tests per mode. Fresh
foundation/editor source hashes and PNG hashes match current code. Existing eight
consumer linkage/size boundaries are unchanged. Formatting, Python syntax, local
links and diff whitespace checks pass. Native input remains unverified, not a
skipped test counted as success. Native X11/Wayland input/IME, true inline composition,
font/version/pressure/DPI matrices, retained scene integration and accessibility
remain open. See the experiment record for ABI restrictions and reproduction.

## WP-05 transactional semantic model

`ui.with_semantics(schema)` adds a provider-independent semantic tree to the same
scene commit, with optional typed state channels. [Semantic contracts](ui-semantics.md)
define owner/update-checked drafts, independent logical IDs, role/value/action
validation, copied names/relationships, immutable document leases and protected
views. Native accessibility/AccessKit/AT-SPI is not implemented by these records.

Per-node semantic revisions survive unrelated scene updates but reject obsolete
meaning/materialization/document bindings. Requests validate current availability,
supported typed payloads and document revision without executing model behavior.
Document actions still go through the live Registry. Logical collection records
must cover the declared collection, including offscreen items; changing physical
materialization preserves their semantic IDs. Naming graphs and active descendants
are validated iteratively before publication.

Eleven new semantic fixtures plus inherited-disablement scene repair cover these
contracts, all combined node/state/semantic allocation failures, protected text,
3000-node naming chains, limits and counter/reference lifetimes. The tests caught
an arena-state copy before semantic preparation could grow its buffer chain;
published storage now takes the final arena state and frees all resources/buffers.

The ReleaseFast baseline at 100k logical items/one materialized node recorded a
132.869 ms median full description, 83.835 ms publication and 61,201,630 bytes of
snapshot arena capacity. This is O(logical) metadata and not a frame budget or
native bridge result. Smaller raw trials, machine/compiler/command and source/
binary hashes are under `.cache/semantics`. Incremental metadata reuse is pending.

The ninth foundation profile tests logical items/action routing without libc.
The full opt-in **44/44-command matrix passed** under
`.cache/validation-semantics`: Debug/check/ReleaseSafe builds, both-mode library/
application tests, type/provider audits, paragraph/editor experiments and **29/29**
run targets. Dependency and benchmark source hashes match current code. Formatting,
Python syntax, local links and diff whitespace checks pass. The semantic consumer
is 189,064 bytes in ReleaseSmall with no ELF dynamic section, linked libraries or
provider sonames. The existing plain-scene/state consumers are now 163,392/171,312
bytes following inherited-focus repair; other prior profile sizes are unchanged.
These are selected local executable measurements, not universal library budgets.
AccessKit Rust crates are cached, but the loader inventory did not reveal an
installed C binding. Native artifact/ABI, screen-reader/actions/text and shutdown
races remain required gates; model tests do not close them.

## WP-02 pinned layout-provider experiment

The [zlay adapter experiment](experiments/layout-zlay.md) tests the exact examples
pin `d6112faa78b5750a3817b927b7d48bb562634304`. It deliberately does not use the
mutable sibling checkout's different Taffy-port API. Cached source is checked
against a per-file manifest and extracted only into owned scratch; no root zlay
dependency or examples pin replacement is made.

The disposable adapter maps retained NodeIds to private collision-free backend
IDs, copies result geometry and retains its source scene. Opaque paragraph
measurements negotiate actual content widths, with unresolved geometry rejected
by the ready-result API. Zlay never opens fonts or splits/measures user text on
this path. Old results survive reuse/deinit. Seven pure fixtures and a Pango
wide/narrow-height fixture pass Debug/ReleaseSafe, including allocator failures,
recovery, capacity, foreign/stale inputs and independent numeric geometry.

The current pin's integer spacing and the adapter's intrinsic-parent percentage/
grow restrictions are explicit. Baseline/grid/flex-wrap/clip/scroll/transform,
sparse update and atomic scene/layout/semantic/paint publication contracts remain
open. At 10k children the measured changed and unchanged full redeclarations both
cost about 7.4 ms median locally; this is not O(changed nodes), engine-only or a
complete UI latency claim. Full command/source/dependency/binary evidence is in
`.cache/spikes/layout/report-final.json`.

The full opt-in matrix passed **45/45 commands** under `.cache/validation-layout`,
including **29/29 run targets**. The layout audit was rerun after adding its
changed/full benchmark and source-manifest portability check; all ten adapter
build/test/demo/benchmark commands pass. Final source/artifact/dependency-member
hashes match, both pure demo modes have no ELF dynamic section, and formatting,
Python syntax, local links and diff whitespace checks pass. Existing core
consumer linkage/size boundaries are unchanged. Native GUI/AX and remaining
provider gates stay open.


## WP-01/WP-05 owned action delivery

`ui.action_queue.Queue` adds copied-payload FIFO admission, checked nonrecycled
tickets, explicit completion receipts and allocation-free cancellation/close.
[Action ownership/protocol](ui-actions.md) defines lease lifetime, one-outcome and
side-effect boundaries. Delivery owns request text independently of producer
buffers and keeps cleanup storage alive after Queue owner destruction. Forgetting
a terminal receipt cannot free a live delivery's payload or bypass its budget.

Ten new fixtures pass focused checks: distinct activations and owned text, pending
unlink/order, abandoned/requested/close outcomes, duplicate completion, owner
teardown, foreign tickets, all allocation failures including preservation of prior
accepted work, reference/ticket exhaustion and 10k receipt reuse. Live semantic
validation still occurs when dispatching; admission never authorizes a stale
control. Queue code invokes no reducers or native callbacks.

The tenth foundation consumer exercises owned semantic delivery from runtime
inputs with no libc. All 45 commands in the full opt-in matrix passed under
`.cache/validation-actions`, including all 29 declared finite run targets. These
include offscreen/null-device runs; native display QA remains separately open.
Native ingress/thread handoff, widget/controller
execution, asynchronous reply adapters and side-effect atomicity remain separate
gates, not claims made by a one-terminal-receipt data structure.

The refreshed `foundation-final.json` records the action consumer at 187,736
bytes (ReleaseSmall), with no ELF dynamic section or shared-library dependencies.
The local ReleaseFast queue baseline (`.cache/actions/benchmark.json`) measured
32k admissions with copied 32-byte payloads at 8.154–17.226 ms (median 8.565 ms),
and take/complete/forget/release at 3.035–3.452 ms (median 3.076 ms), across three
trials. Admission includes allocation/map growth; dispatch includes checks and
release. This is a local queue baseline, not controller, native bridge or GUI
latency, and not a comparison against another toolkit.

## WP-04/WP-05 queued document execution

`ui.document_actions.dispatch` now executes queued semantic text replacement and
selection commands against the live scene and registered document. It validates
both semantic and actual document revisions, records one final rejection/handled
outcome and returns an owning document result for a separate scene refresh.
Accepted document edits survive failed scene descriptions without replaying an
action. Controller-owned edit/history options stay outside native request data.

Four new fixtures cover successful replacement and selection, cancellation,
duplicate/stale execution, aborted scene refresh, closed registration/scene,
non-document commands and all allocation-failure points. The existing `actions`
foundation consumer now executes a registered document replacement as well as
its FIFO activation/owned-payload checks. Focus/seat/modal authorization, widget
controllers, native action ingress and bridge refresh remain separate work.

Focused Debug tests and all 45 commands of the full opt-in matrix passed under
`.cache/validation-document-actions`, including Debug/ReleaseSafe library tests,
optional paragraph/editor/layout integrations and all 29 finite run targets.
Native display/screen-reader validation remains open.
The expanded ReleaseSmall action consumer is 202,288 bytes with no ELF dynamic
section/shared-library dependencies. Its workload now includes document mutation
and history, so this size is not directly comparable to the earlier queue-only
consumer. Foundation source hashes and frozen consumer binaries are recorded in
`.cache/validation-document-actions/foundation.json`.

## WP-02/WP-05 AccessKit provider lease experiment

The [disposable native handler experiment](experiments/accesskit-lifetime.md)
implements an explicit provider-owned callback-state release acknowledgement,
with a private ABI version and process-resident provider code. It also fixes an
observed pinned-provider initialization-failure leak: a global sender retained
pending adapter messages after the bus receiver exited. The cleanup guard closes
and drains that queue; subsequent failed sends release their owned messages.
Changes are confined to an experiment copy, with exact source manifests and an
offline derived lockfile. Ordinary ZDL builds still have no AccessKit/Rust dependency.

Three Rust fixtures and native Zig Debug/ReleaseSafe probes pass, covering a held
callback and missing callback rejection, 32 native Rust adapter cycles and 64
cycles per Zig mode on the unavailable-bus path. A private D-Bus session attempt
failed to bind a socket; normal live-bus/AT-SPI traffic and real screen-reader
inspection remain unverified. This is not a native accessibility backend or a
completed WP-05 gate. Reports and failed-before-fix evidence live under
`.cache/spikes/accesskit-lease`.

Final experiment audit passed all seven commands (offline local lock derivation,
Rust tests/shared build and two Zig compile/native probes). Library `build check`,
`build test` and a refreshed foundation dependency audit also pass; source hashes
match the recorded reports. Prior full-matrix results remain for the unchanged
production sources; this step adds only opt-in tools and documentation.

## WP-02/WP-05 foreign-thread action staging

The disposable AccessKit experiment now has a bounded, allocation-free producer
inbox using `std.Io.Mutex`, whole copied UTF-8 payloads and explicit pressure/close
counts. Only the UI owner admits taken Items to `ui.action_queue`; failed admission
keeps bytes for retry/rejection and successful admission cannot repeat on that
Item. Payload getters bind inline bytes after a move, independent of slot reuse.

Four fixtures cover lifetime/close/pressure, distinct owner admission, four
concurrent producers with 2,000 messages drained concurrently, and real document
execution plus stale duplicate rejection. The opt-in audit now includes ingress
tests in Debug and ReleaseSafe. Native request decoding, immutable native-ID
mapping, wakeups, provider-specific pressure reporting and a real AT-SPI session remain open; this is
private adapter staging, not a new public queue or completed native backend.

The expanded nine-command experiment audit passed, including all four ingress
fixtures in both modes and the existing native handler lease probes. Library
compile checks/tests and refreshed foundation dependency checks pass; recorded
source hashes match. Ordinary consumer sizes and dependency boundaries are unchanged.

## WP-02/WP-05 native decoding and versioned action routing

The private AccessKit extension's ABI v2 now normalizes native Click/Focus/string
SetValue requests using the provider's own tagged-union types. Zig callbacks copy
payloads into the bounded inbox and always free transferred native requests.
Wrong data variants/non-root trees reject. A copied bounded router keeps native
IDs stable for the same semantic control, rejects identity rebinding/retired-ID
reuse and captures semantic/document revisions at callback arrival. Failed mapping
publication preserves the previous mapping. Whole-string SetValue explicitly
means whole-document replacement; native text-selection positions are not guessed.

Two new fixtures cover native identity/version/mapping invariants. The native
probe also delivers ten synthetic requests per mode from Rust threads through
the actual C handler/decoder, router, inbox, queue and registered-document path;
late callbacks after logical close reject. This is synthetic ABI traffic, not
active AT-SPI, a native tree publisher or a screen-reader pass. The native wire
request carries no client-observed semantic revision; the adapter cannot infer
an older client view and instead validates the revision captured at arrival.

The nine-command native audit passes with six ingress/router fixtures in both
Debug and ReleaseSafe, plus ten synthetic cross-language action requests per
mode. Library compile checks/tests and refreshed foundation checks pass; source
hashes match. No new dependency reaches ordinary ZDL consumers. Active AT-SPI,
native semantic tree publication, focus execution and text-selection mapping
remain open.

## WP-02/WP-05 owned native semantic tree conversion

The private AccessKit prototype now converts semantic snapshots into owned native
TreeUpdate candidates and copied routing entries. Stable native IDs survive
property changes; native children preserve order. Roles, focus, names, relations,
bounds, checked/numeric values and collection sizes/positions are copied. Protected
editors become read-only PasswordInput without exported text/selection; unsupported action
kinds are not advertised. Candidate storage survives all source-owner teardown.

The nine-node fixture uses the real pinned native consumer to validate two
versions, assert copied properties/protection and verify old native storage after
scene/document destruction. Zig allocation/capacity failures preserve the old
candidate. The provider fixture alone adds the pinned consumer dependency; normal
ZDL consumers are unchanged. Actual native publication, activation/update handling,
coordinated callback/routing swap, announcement behavior and live AT-SPI remain
open. Full candidate conversion is not an incremental or O(visible) adapter.

The nine-command audit passes in Debug/ReleaseSafe with the nine-node native
consumer/protection fixture, all six ingress/router tests and existing lease/ABI
probes. Library compile checks/tests and refreshed dependency checks pass.
Recorded source hashes match, and production `src/` hashes still match the prior
full 45-command validation matrix; no new provider dependency reaches core users.

## WP-02/WP-05 native activation/update owner

The private AccessKit publisher now owns a real Unix adapter, a stable callback
context and the current native tree. One callback gate replaces tree/routing
metadata together; activation/update factories return independently owned clones.
Native adapter calls run outside the gate to avoid provider/callback lock inversion.
Initialization/publication move caller candidates only on success. Close disables
ingress before native free; deinit waits for provider handler acknowledgement and
retains state on timeout/cancellation. IO/Library and independent workers must
remain alive/quiesced according to those separate leases.

The finite fixture checks twelve swaps concurrent with foreign-thread activation,
real-consumer validation of complete clones, latest-version routing, initialization
OOM, foreign-domain failure preserving ownership/store, close versus callback entry,
late actions, factory ownership and repeated deinit. This wires native adapter
create/update/free on the unavailable-bus path; it does not certify active-bus
publication, native announcements, deactivation/reactivation or real AT-SPI clients.
Callback-store replacement is not an atomic Scene/native-transport transaction.

The nine-command native audit passes with twelve publication swaps and the
activation/close race in both Debug and ReleaseSafe, alongside the existing
consumer, lease, decoding and ingress fixtures. Library checks/tests and refreshed
foundation checks pass; recorded source hashes match. Production source hashes
remain identical to the prior full 45-command validation matrix. No AccessKit/Rust
dependency is introduced into normal library consumers.

## WP-06 owned paint packet foundation

`zdl.paint` now records owned solid geometry/path/image commands, affine clips,
save/restore and opacity layers with explicit device/color/scene metadata. Images
are copied to immutable straight-sRGB RGBA8 and retained once per packet identity;
paths are copied, and no deferred widget/provider callback escapes. Saturating
atomic leases support distinct packet/image handles; final-release allocators
must support the releasing thread. Failed recording poisons finish and preserves
an earlier packet. Logical geometry/depth/command/image budgets are explicit.

[Paint contracts](paint-packets.md) distinguish recordability from backend support.
Six fixtures cover lifetime/padding/deduplication, all allocation failures,
validation/nesting/limits, close/saturation and concurrent lease use. The eleventh
foundation consumer records runtime-count solid commands with no libc. Replay,
text/gradients/filters/dashes, native ARGB32 adaptation, damage and GPU retirement
remain open. All 45 commands in the full opt-in matrix passed under
`.cache/validation-paint`, including all 29 finite run targets and library tests
in Debug/ReleaseSafe.


The final isolated consumer additionally exercises copied paths and retained
raster sampling, passing Debug compile/link and the refreshed ReleaseSmall runtime/
dependency audit. It is 163,064 bytes, with no ELF dynamic section or shared-library
dependencies (`foundation-final.json`); the earlier rectangle-only consumer was
155,304 bytes, a different workload. Recorded source hashes match current files.
The recording-only ReleaseFast baseline (`.cache/paint/benchmark.json`) measured
100k solid rectangles at 9.858–10.415 ms (median 9.879 ms), across three local trials.
It includes init/validation/growth/finish and an optimizer barrier, excludes final
release/checksum/replay, and makes no GUI latency or toolkit-comparison claim.

## WP-02/WP-06 optional Cairo packet replay

The [headless Cairo prototype](../tools/spikes/paint/README.md) now executes current
paint commands with explicit encoded-sRGB source-over/group compositing and native
ARGB32 image adaptation. Resource identities cache converted rasters once per
replay; source crop and nearest/bilinear filters are explicit. Output stays
unpublished until replay succeeds. Unsupported linear/HDR policy and native
status errors return failure, without silent conversion/fallback.

Logical output/working color buffers have explicit admission budgets; peak groups
and unique images count before native surface creation. Six fixtures in both modes
cover numeric pixels, transforms/clips/layers, path/stroke/rounded geometry,
source ownership/premultiplication, missing provider/symbol, unsupported policy,
singular transform, all Zig allocation failures and buffer boundaries/deduplication.
The visual fixture sheet was inspected; Debug/ReleaseSafe PNG bytes match on the
recorded Cairo provider. Native allocation fault injection and portable edge
coverage are not certified.

All 46 commands of the full opt-in integration matrix passed under
`.cache/validation-paint-replay`, including the new `--paint-spike` and all 29 finite
run targets. Existing core consumer dependency boundaries remain unchanged.
This is a private feasibility backend; text/gradients/filters/dashes, linear/HDR,
GPU conformance, native presentation, damage and retirement remain open.

## WP-04/WP-06 provider-consistent paragraph pixels in paint

The paragraph experiment now has explicit styled/transparent rasterization while
preserving legacy white-background defaults. A separate [capture adapter](experiments/paragraph-paint.md)
validates native premultiplied ARGB32, unpremultiplies into the immutable core image
contract, preserves layout origin/padding and applies explicit pixels-per-unit
when recording. Paragraph/bitmap/provider/Raster owners may all end before replay;
packets retain their own pixels, not a deferred native layout callback.

Four fixtures cover exact mixed-script native texels at matching device scale,
all valid 8-bit channel/alpha pairs, allocation/input failure cleanup, legacy
raster equality and style validation. A selected paragraph/caret visual fixture
was inspected; Debug/ReleaseSafe outputs match on the recorded provider. The initial 47-command integration matrix passed under
`.cache/validation-paint-text`, before the zero-area boundary fix below. This is raster transport, not a public text service,
glyph export, native editor/IME, screen-reader or GPU text conformance pass.

Boundary review also found a zero-width row traversal in core image copy and
the new capture adapter. Both now skip empty rows, with maximum-u31-height
fixtures; paint core has seven fixtures and paragraph transport has five. The
final 47-command matrix passed under `.cache/validation-paint-text-final` after
this fix, including all 29 finite run targets.

The final paragraph transport audit passes all five fixtures in Debug/ReleaseSafe
and verifies identical PNG bytes with Pango 1.57.1 / Cairo 1.18.4.
Core compile/link, tests and dependency checks remain green; current source hashes
match the final reports. Core painting acquires no native text/provider dependency.

## WP-06 immutable gradient resources and faithful replay

`paint.Gradient` now owns linear/radial geometry and copied ordered stops, with
atomic leases, spread modes, stop/resource budgets and a float premultiplied
sampling reference. Packets retain each resource identity once and reject foreign
lookups or mismatched color policy. Four gradient draw forms preserve the existing
solid payloads; shared geometry/color declarations now live in `paint/types.zig`.

The [gradient contract](paint-gradients.md) records a native interpolation mismatch
found by pixel testing. The backend preserves canonical premultiplied interpolation
using a device-space raster source for varying alpha; constant-alpha resources
keep native Cairo patterns. Cache keys include transforms for raster sources,
working-buffer admission accounts for them, and empty draws skip rasterization.
Full-target generation is a private correctness-first fallback, not a speed claim.

Four new core fixtures cover resource lifetime/order/limits/policy, allocation
failures and reference sampling. Two added Cairo fixtures exercise geometry,
alpha, transformed reuse, layers, radial/spread/hard edges, buffers and native
pattern/raster cleanup on Zig failures. The full 47-command opt-in matrix is
running under `.cache/validation-gradients`; renderer/GPU/native-window and advanced
radial/tiled-performance gates remain open.
