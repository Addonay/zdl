# Native event queue benchmark

From the repository root, with the same compiler/target/optimization for each run:

```sh
mkdir -p .cache/foundation
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/events_queue.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/foundation/queue-bench
.cache/foundation/queue-bench
```

The benchmark enqueues 1,000/8,000/32,000 ordinary user events, then times draining
one event per call. Enqueue/allocation/teardown are outside the timed interval.
Every returned ordinal and the final arithmetic checksum are checked. An
independent ordered-array implementation reproduces the old drain algorithm.
Three trials per case alternate native/reference order; printed arrays are sorted.

This isolates FIFO-removal work. It does not measure total event-pump, window,
callback, rendering or input-to-photon cost. Partial-code range reads and callbacks
have different costs. Use the model/failure tests for semantics, and repeat on a
recorded machine before making comparative claims. Never infer whole-GUI speed
from a large algorithmic improvement in this deliberately stressed case.

## Retained scene publication

```sh
mkdir -p .cache/scenes
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/scenes.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/scenes/benchmark
.cache/scenes/benchmark
```

Three trials per 1k/10k/100k case time full reverse-order declaration and commit
separately. Initial construction, retained-ID/key/focus verification and teardown
are outside timed intervals. This is a linear model-only workload, not a frame
benchmark or a comparison against another UI engine. Strings are empty/integer
keys in this workload; it is not a text-allocation benchmark. Reported arena bytes
include capacity overhead but exclude owner/storage headers, staging scratch,
other retained versions, allocator bookkeeping and process RSS.

## Contiguous document editing

```sh
mkdir -p .cache/documents
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/documents.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/documents/benchmark-fast
.cache/documents/benchmark-fast
```

Three trials at initial 1 KiB/64 KiB/1 MiB perform 32 prepend edits with bounded
history, timing allocations/history retirement/result release as part of editing.
Undo and redo are timed separately and reuse immutable text buffers. Input setup,
output/old-snapshot validation and final teardown are outside timing. Warmup and
allocator/cache state affect the small cases substantially; inspect the raw trial
ranges. Logical history bytes are not process RSS or all retained snapshot memory.
No shaping, navigation, IME, layout, painting or presentation cost is measured.

## Complete logical semantic collection

```sh
mkdir -p .cache/semantics
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/semantics.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/semantics/benchmark-fast
.cache/semantics/benchmark-fast
```

Three trials at 1k/10k/100k logical items keep one physical node. Full declaration
and publication are timed separately; each logical item/action/key and checksum
is verified outside timing. Arena capacity measures retained scene/semantic
storage, excluding staging scratch, allocator metadata, native bridge copies and
other snapshots. This explicitly measures O(logical) metadata, not O(visible)
accessibility storage or native AT-SPI/frame latency. The baseline is not an
incremental update implementation.

## Owned semantic action delivery

```sh
mkdir -p .cache/actions
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/actions.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/actions/benchmark-fast
.cache/actions/benchmark-fast
```

Three trials at 1k/10k/32k requests copy 32-byte text payloads. Admission includes
entry/payload allocation and receipt-map growth. Dispatch includes FIFO take,
order/payload-length checks, completion, receipt removal and lease release. Setup
and final accounting checks are outside timing; printed trial arrays are sorted.
This measures queue mechanics, not semantic validation, controller effects,
thread handoff, document edits or native GUI response time.

## Owned paint recording

```sh
mkdir -p .cache/paint
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/bench/paint.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/paint/benchmark-fast
.cache/paint/benchmark-fast
```

Three trials at 1k/10k/100k solid rectangles include recorder allocation, geometry/
color validation, command growth and finish; an optimizer barrier exposes the
completed command buffer before the end timestamp. Command count/geometry checksum and
final release are outside timing. No path/image allocation, replay, pixel output,
layout, text or presentation is measured. This is a local recording baseline,
not a frame-time claim or a toolkit comparison; arrays are sorted raw trials.
