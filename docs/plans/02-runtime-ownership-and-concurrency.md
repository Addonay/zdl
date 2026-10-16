# Runtime, ownership, scheduling and concurrency

[Plan index](../../PLAN.md) · [GUI transactions](03-ui-state-and-transactions.md)

Status: proposed contracts. Preserve the current explicit allocator, `std.Io`
and monotonic timestamp design; do not introduce hidden subsystem threads.

## Owner model

One UI owner thread controls an application runtime and its window scenes.
The platform event pump, UI mutation, focus, capture, composition and semantic
publication execute there. Applications may own several runtimes explicitly;
there is no process-global current window, current renderer or current GUI.

Keep a convenient `zdl.app` runner, but make it a client of the same primitives
available to an embedding application. An existing game loop or editor host can
pump input, dispatch UI events, submit a frame and wait on its own schedule.
The runner must not require owning the application's audio, task pool or GPU.

Start with rendering on the UI owner. Add an optional render worker only after
profiling demonstrates benefit and packet/resource lifetime tests exist. Selected external providers may own threads internally. Document and budget
those explicitly; do not claim process-wide single-threaded behavior simply
because zdl creates no worker. Coordinate per-decode parallelism with the asset
worker pool to avoid multiplying both thread counts.

A new thread is not the default fix for an inefficient layout or repeated shaping call.

## Event/update/frame sequence

The canonical sequence is:

1. Take the next ordered platform event or worker completion.
2. Normalize coordinates and dispatch it against the current committed scene.
3. Deliver typed actions; the application applies model/document changes.
4. Settle required UI/layout changes before another geometry-sensitive query.
5. Publish a coherent scene/semantic snapshot.
6. At a presentation opportunity, record and submit the latest required paint.
7. Retire completed packets/resources; wait until input, completion or a deadline.

It is valid to paint once after several events. It is not valid to batch away
an intervening focus change, release, composition commit or geometry dependency.
An optimization that coalesces events must be equivalent under replay fixtures.

Do not rebuild the application from a GPU completion callback or accessibility
thread. Those callbacks produce messages for the owner.

## Scheduling and idle behavior

The next wake is the minimum of platform readiness, job completion, animation
step, focused caret deadline and presentation opportunity. Time domains are
explicit: library event timestamps remain unsigned host-monotonic nanoseconds.
Raw protocol milliseconds and audio sample positions retain their own names.

- An unchanged idle window has no recurring render timer.
- Hover changes generally invalidate style/paint, not text layout or the model.
- Caret blinking invalidates its small paint region; unfocused/hidden carets stop.
- Occluded or minimized windows suspend ordinary frame work.
- Animations use elapsed time, not a count of frames. Reduced motion and resume
  after suspend have explicit policies; a long pause does not replay every tick.
- Each event-processing turn has a fairness budget. A producer flooding progress
  notifications must not starve keyboard input or quit.

Use `std.Io` and its synchronization/task facilities directly where suitable.
Add only the domain scheduling needed to combine UI deadlines, platform waits
and presentation. Do not build a general second async runtime.

## Lifetimes and destruction order

An application/runtime owns provider instances and shared resource registries.
A window scene owns its UI tree and semantic state. A committed paint packet
owns its command storage and strong resource leases until submission retirement.
A text document is owned by the application; the GUI borrows it through an
explicit registration whose owner must outlive that registration.

The default shutdown protocol is:

1. Stop accepting new application/window work; invalidate window epochs.
2. Cancel UI-owned jobs and publish closure to waiters.
3. End composition, pointer capture, drag sessions and semantic registrations.
4. Detach presentation surfaces and prevent new GPU claims.
5. Drain/retire render packets and join workers the runtime actually owns.
6. Release scene snapshots and document registrations.
7. Release font/image/GPU registries, then provider library handles and runtime.

Unregistering a borrowed external executor does not join or destroy it. Every
adapter states its callback-quiescence requirement. If a driver cannot retire a
resource safely, report/retain it under a bounded failure policy; do not free
memory a driver may still reference just to make shutdown appear leak-free.

## Ownership vocabulary

- `View`: synchronous borrowed access, with the invalidation boundary stated.
- `Snapshot`: immutable versioned storage with explicit retention/release.
- `Lease`: keeps an owned resource alive across a defined consumer interval.
- `Ticket`: identifies an accepted asynchronous request with one final outcome.
- `Registration`: owns a subscription/binding; ending it quiesces callbacks as
  documented before the registered state can be freed.

These are domain types, not new general-purpose smart pointers around every
integer. Ordinary owned Zig values remain the default where no cross-frame or
cross-thread retention exists.

## Event payloads and messages

The core event queue keeps its documented shallow-copy behavior. The GUI must
consume or copy borrowed text/drop/composition payloads before the producer's
next invalidating pump. A UI event dispatcher may promise synchronous copying;
it must never promise that pushing an event silently extends its input lease.

For cross-thread delivery use owned typed messages. Bound queues by count **and
owned bytes**, with a wake source integrated into the platform wait. Each message
class has a policy: releases and accepted edits are lossless; replaceable progress
can coalesce by job ID; pointer motion may coalesce only within a compatible
capture/routing interval. Closing wakes every producer/consumer.

```zig
// Proposed interface sketch. The payload moves into a successful send.
const Completion = union(enum) {
    image_ready: struct {
        request: RequestId,
        document_revision: u64,
        image: zdl.image.Image,
    },
    failed: struct { request: RequestId, diagnostic: OwnedDiagnostic },
};

var message = Completion{ .image_ready = result };
mailbox.send(io, message) catch |err| {
    message.deinit(); // the completion type disposes its active owned payload
    return err;
};
// Success transfers ownership. The sender must not use/dispose message again.
```

Specify cancellation races: cancellation is a request, not proof execution has
stopped. Every accepted ticket has one completion/cancelled outcome. A late
completion for a closed window or old document revision is discarded **and freed**.
Do not use a freed window pointer as a job's routing address.

## Memory domains and budgets

Separate update scratch, retained nodes/state, text/layout caches, paint packets,
CPU image data, GPU allocations and external-library working memory. Account
for them separately in tools and expose high-water marks.

- Scratch allocation failure aborts an update before publication.
- Retained allocation failure preserves existing live handles and snapshots.
- Cache admission can fail without making a valid widget disappear; render
  uncached or report a documented resource error.
- Packet queues are bounded; superseded unsubmitted packets release their leases.
- External C libraries may allocate outside the supplied Zig allocator. A decoded
  output cap is not a hard process-memory cap. Report that distinction; offer
  worker-process isolation when an application needs hard limits for hostile data.

Preallocated emergency teardown paths must release capture/subscriptions even
when ordinary allocations fail. Avoid broad `catch {}` around invariants.
Recoverable fallback is accompanied by a reason; corruption is not downgraded
to a different backend without diagnosis.

## Concurrency contracts

Font rasterization contexts, mutable provider objects, UI stores and device
command recording are not automatically thread-safe. Share immutable bytes or
snapshots, not mutable FreeType faces or borrowed glyph buffers. Worker-local
provider contexts are the initial rule unless documented library guarantees and
measured locking justify shared contexts.

A render packet may contain IDs plus retained resources; it may not contain
`*Ui`, application state pointers or deferred arbitrary paint callbacks. Native
accessibility callbacks retain a semantic snapshot and marshal mutations to the
owner. Reply deadlines and cancellation on window close are required.

## Acceptance gates

- Repeated create/update/close with allocation failures leaves no dangling lease.
- Closing a window during shape/decode/render/AX work cannot target its replacement.
- Every accepted asynchronous request has exactly one final ownership outcome.
- Idle wake counters distinguish caret/animation activity from accidental polling.
- Input remains responsive under progress floods and stalled render submission.
- A host-owned loop/executor can embed UI and shut it down without surrendering
  ownership of its own threads, device or event loop.
