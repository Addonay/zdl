# Checked document registrations

`zdl.text.Registry` routes owner-thread actions to live application-owned mutable
documents through domain/slot/generation handles. This is a logical routing and
lifetime boundary, not an OS accessibility/IME adapter or a worker message queue.
The document and snapshot models remain std-only and independent of UI providers.

```zig
var doc = try zdl.text.Document.init(allocator, "Hello", .{});
defer doc.deinit();
var registry = try zdl.text.Registry.init(allocator, .{});
defer registry.deinit();
var registration = try registry.register(&doc);
defer registration.close(); // ends borrow before doc.deinit()
var observed = try registry.snapshot(registration.handle());
defer observed.deinit();
const target: zdl.text.registry.Target = .{
    .registration = registration.handle(),
    .revision = observed.revision(),
};
// A delayed owner-thread request carries this original target, not a new base.
var result = try registry.replace(target, .{
    .start_byte = observed.text().len,
    .end_byte = observed.text().len,
}, "!", .{});
defer result.deinit();
```

The application keeps Document at a stable address while any registration borrows
it. Do not grow a container that relocates registered Document values or destroy
one before ending its registrations. Multiple views can register the same document
independently; closing one view does not close the document or another view.
A registry/registration does **not** own or implicitly destroy application data.

## Dispatch and invalidation

A `Target` is plain metadata containing the view handle and observed document
revision. It owns no slices or document pointer. Snapshot capture and dispatch
happen on the document/UI owner thread. Foreign native callbacks only enqueue
owned messages with the previously published target; they must not call this
registry or refresh its revision from another thread. Queued edit strings still
need producer-owned/copied storage until owner-thread dispatch consumes them.

Dispatch checks registry liveness, owner domain, slot generation, captured document
identity, then the document's expected revision and edit/read-only/range policy.
A stale view fails before document dereference. A changed revision fails rather
than silently rebasing onto newer text or a different caret. `apply`, `replace`,
`set_selection`, `undo` and `redo` use this same checked route. No mutable document
pointer is returned by the public routing API. Application-owned semantic edit
groups can still be passed through ordinary document edit options.

`Registration.close()` is allocation-free/idempotent. `Registry.unregister(handle)`
can invalidate early; subsequent owner cleanup is harmless and cannot close a new
generation in the same slot. Slot reuse advances generation; saturated slots are
permanently retired. A free list makes reuse O(1), with amortized append for new
slots. Resolution is a direct checked slot lookup. Defaults allow 4,096 live
registrations and 8,192 total logical slots, including free/retired slots; standard
container capacity and owner references have separate allocation overhead.

`Registry.close()` invalidates all handles without allocating or dereferencing
application documents. `deinit()` releases its owner reference. Outstanding
Registration values keep only their cleanup core alive and can close safely after
the registry owner is destroyed. The registry allocator must outlive them. The
captured-identity check can diagnose an in-place document replacement at a valid
address; it cannot make a freed borrowed pointer safe. End the borrow first.

Immutable document snapshots own independent data leases: they can outlive the
registration, registry and application document. **Historical snapshots must not
extend a mutable registration.** Store plain handles/targets and owning immutable
document snapshots in scene state; keep the owning Registration in the live
binding/controller and close it when that binding ends. Native semantic IDs may
have a different logical lifetime for virtualization; the native adapter must
resolve that explicitly, not reuse an old materialized-node slot.

## Boundaries that remain the controller's responsibility

Logical invalidation makes delayed routing reject a closed view; it does not
unregister/join an external OS callback, free its userdata, cancel native preedit,
end a semantic typing group, authenticate external input, or implement exactly-once
asynchronous action completion. Quiesce those producers and perform composition/
group teardown through the live owner before releasing their borrowed objects.
Do not capture Registry/Document pointers in a foreign callback instead of using
an owned message and checked target.

The controller also validates current scene identity/enabled state, focus/seat,
composition generation and authorization before requesting a document operation.
This registry does not infer them from a document ID. Target handles are checked
process-local identities, not serialized/security capabilities.

Nine fixtures cover stale/foreign generations/revisions/documents, multiple views,
early unregister plus slot reuse, all constructor/dispatch allocation failures,
registry-owner destruction, close-before-document-destruction, limits and retired
slots/references, complete batch/selection/history routing, and 10,000 reuse
cycles. These are deterministic logical lifetime tests, not real native callback
race or IME/screen-reader certification.

`tools/consumers/registration.zig` exercises the public route from runtime input
in the foundation ELF audit. The first editable native field and actual native
IME/accessibility registrations remain open roadmap work.
