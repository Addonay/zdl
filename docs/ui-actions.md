# Owned action delivery and final receipts

`zdl.ui.action_queue.Queue` supplies bounded owner-thread delivery for semantic
requests. It copies retained text before accepting a request, assigns a checked
process-local ticket and records one terminal outcome. It does not execute an
application reducer, create workers or install native callbacks.

```zig
const actions = zdl.ui.action_queue;
var queue = try actions.Queue.init(allocator, .{});
defer queue.deinit();
const ticket = try queue.enqueue(request); // replace_text bytes are copied
while (try queue.take()) |value| {
    var delivery = value;
    defer delivery.deinit();
    const current = try delivery.request();
    if (scene.validate_semantic_action(current)) |intent| {
        // Apply the controller/model operation exactly once here. Document
        // edits still go through the live Registry with their captured target.
        _ = intent;
        try delivery.complete(.handled);
    } else |reason| {
        try delivery.complete(.{ .rejected = reason });
    }
}
_ = try queue.status(ticket);
try queue.forget(ticket);
```

The comment is a controller integration point, not an implementation of widget
behavior. A real handler reports handled only after its operation succeeds.
Validation alone is not an applied model effect. Queue tickets do not make an
arbitrary external side effect transactional or deduplicate independently
submitted requests; two distinct activations retain distinct tickets/deliveries.

## Acceptance, order and ownership

Enqueue is ownership/limit admission, not semantic authorization. Source target
identity/revision can become stale before dispatch. Take once, then validate
against the **live** scene; validate document operations again through Registry.
Pointer/keyboard/assistive/programmatic requests follow the same path. Never
silently refresh an old target's document revision to force acceptance.

The request struct is copied, and replace_text payload bytes have an independent
allocation. Caller stack/producer storage can change after enqueue returns.
Payloads may be invalid UTF-8/unsupported actions; the owner validator rejects
them with a terminal reason rather than treating admission as permission.
Capture request text before returning from a foreign callback and respect the
producer's lease when transferring into an owner-thread queue.

Pending work is FIFO; cancellation removes a pending entry in O(1), without
shifting other entries. Each ticket yields at most one owning Delivery. A lease
keeps its request/payload readable until deinit, including after completion,
receipt forget, queue close and final queue-owner destruction. It keeps cleanup
storage alive, not the scene, window or mutable document. Use retained immutable
snapshots separately where a worker/adapter needs historical data.

Move owning Queue/Delivery values, do not independently deinitialize shallow
copies. All queue, delivery, receipt and retain/release operations are serialized
on one owner thread. Native producers need a separately synchronized ingress/
message handoff; they may not call this owner-only queue from an arbitrary thread.
The allocator must outlive all Delivery leases, even after Queue deinit.

## Exactly one final outcome and cancellation limits

Statuses are pending, in_flight and final. Final outcomes are handled, rejected
(with a Zig error code), or cancelled (requested/queue_closed/abandoned).
Completion/cancellation is allocation-free and cannot overwrite a final outcome.
A second completion returns `AlreadyFinalized`. Deinitializing an unfinished
Delivery finalizes it as abandoned. Close is idempotent, denies new work and
cancels all unfinished accepted tickets without allocation or model callbacks.
Receipts remain queryable while the owner lives; a live Delivery can query its
status after owner destruction too.

Cancellation is logical: it cannot roll back effects already executed. The
controller serializes close/cancel/effect application and finalization, checks
`active()` before applying late results, and completes synchronous model work
before initiating shutdown. A worker must not mutate owner-thread documents or
UI state directly. The queue's one-outcome guarantee is not an OS callback join,
external-worker cancellation acknowledgement, transactional reducer or proof of
exactly-once effects outside that protocol.

`forget` only releases terminal receipts. It cannot evict pending/in-flight work.
A forgotten entry still borrowed by Delivery continues to consume entry/payload
budgets until that lease ends. This avoids bypassing backpressure while retaining
unaccounted payloads. No implicit receipt eviction is performed.

## Budgets and evidence

Defaults: 4,096 allocated entries, 4 MiB total retained payload bytes and 1 MiB
per text payload. Entry accounting includes pending work, receipts and forgotten
terminal entries with outstanding leases. Header/map/allocator capacity is outside
payload-byte accounting. Zero capacities intentionally reject the corresponding
work. Domain/ticket/reference exhaustion fails rather than wrapping/reusing old
identities. Tickets are process-local metadata, not serialized/security tokens.

Ten tests cover copied payloads/distinct FIFO activations, cancellation order,
receipt/payload backpressure, forgotten leases, abandonment/close/final outcomes,
owner destruction, foreign tickets, all enqueue allocation failures (including a
failed second admission preserving prior work), saturation and 10,000 receipt
reuse cycles. A scene integration test rejects a removed semantic target before
completing its receipt. No real foreign-thread/native callback race is certified.

The `actions` foundation consumer admits runtime-count requests, validates live
semantic intents, finalizes handled/rejected outcomes and releases all receipts.
It must have no ELF dynamic section or provider libraries. The separate benchmark
measures enqueue and take/complete/forget/release with 32-byte payloads, not
reducer, document, native callback or input-to-photon latency.

Non-document controller actions, focus/seat/modal authorization, thread-safe native ingress,
async ticket reply adapters and actual widget behaviors remain roadmap work.

## Executing document commands

`ui.document_actions.dispatch` connects a delivery to the live semantic scene and
`text.Registry`. It implements `replace_text` and `set_selection`; other widget
commands still belong to their controllers. Seat/modal authorization belongs to
the owner before dispatch. All access, cancellation and close are serialized on
that owner thread; the dispatcher invokes no application/native callbacks.

```zig
var delivery = (try queue.take()) orelse return;
defer delivery.deinit();
var result = try zdl.ui.document_actions.dispatch(
    &scene, &documents, &delivery, .{ .origin = .programmatic },
);
defer result.deinit();
// result.snapshot() borrows an owning immutable result. Use it to rebuild the
// scene. A publication failure must retry that description, never this delivery.
```

The live scene checks semantic identity/revision, enabled state, advertised action
and document ranges. The registry then checks the registration and actual current
document revision; an old published scene cannot authorize a duplicate edit.
Successful execution finalizes `handled` before returning its owning result.
Replacement results preserve the document's changed/text-changed/history metadata;
selection results own a snapshot. An accepted no-op is also handled.

A failed active request records `rejected` with the same returned error, including
allocation failure, stale registration/revision and unsupported command. Document
failures preserve the document transaction. Already-finalized/cancelled deliveries
return `AlreadyFinalized`, preserve their prior outcome and execute nothing.
Options (history, grouping, origin, resulting selection) are controller policy,
not trusted request data. Result and delivery have separate `deinit` lifetimes.
This dispatcher does not publish scenes, refresh native bridges, implement IME,
provide thread-safe ingress or acknowledge cancellation of external worker jobs.
