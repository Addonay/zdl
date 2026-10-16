# Disposable AccessKit handler lease experiment

This is a feasibility extension, not an installed provider, public ZDL backend or
accessible-window demo. Normal ZDL builds do not import it or require Rust.

Run against the exact local sources matching `provider.json`:

```sh
python3 tools/audit_accesskit_lease.py \
  --source /path/to/accesskit-c \
  --unix-source /path/to/accesskit_unix-0.23.0
```

Cargo uses offline cached dependencies and an experiment-owned target directory.
The audit verifies source hashes, copies inputs into `.cache`, adds the private
extension and narrowly scoped default-executor cleanup, derives a local lockfile
offline, then builds/tests with `--locked`. It never edits the input checkouts or
adds a dependency to the ordinary ZDL package. Provider artifacts and reports are
local evidence; redistribution/license/deployment remain separate gates.

`lease.rs` wraps all three native handlers with a shared Arc. Its destructor
calls the C release callback once after the last provider handler is destroyed.
Handler destruction follows in-flight callback return, so a zero callback-count
observation is not used as permission to free userdata. Callbacks/release must
not unwind and userdata must be synchronized for foreign-thread access. Null
callbacks reject without accepting userdata. The private ABI version is 4 (including owned snapshot activation/update clones).

`pending.rs` fixes the pinned Unix provider's failed-initialization path. Its
process-global sender otherwise retains buffered AddAdapter messages when
session-bus initialization exits before processing the receiver. A receiver
guard closes the queue before draining it on event-loop exit, including unwinding.
New sends then fail and release their owned messages. This experiment covers the
default executor, not the Tokio feature. The failing unpatched native test is
preserved in the local cache when reproducing the investigation.

The Rust fixtures hold a callback in flight while dropping other handlers,
exercise native adapter teardown and reject missing callbacks. Zig Debug and
ReleaseSafe probes runtime-load the extended library and create/free 64 adapters
each, observing an acquire/release acknowledgement before freeing userdata.
Native tests explicitly use an absent private session-bus path; no host session
or assistive client is contacted by the audit. On acknowledgement timeout the
Zig probe retains userdata until process exit, since timeout does not revoke a
provider lease. Provider code is pinned resident with NODELETE because global
background threads outlive individual loader handles.

No screen-reader, active bus, text-range mapping, semantic tree publication,
thread-safe action ingress, callback-allocation pressure or native window pass is
claimed. This establishes a candidate reclamation mechanism and failure-path fix,
not completion of WP-02/WP-05.

## Foreign-thread staging

`ingress.zig` supplies a private fixed-capacity MPSC inbox for already mapped
semantic requests. It uses `std.Io.Mutex` and preallocated inline text storage;
callbacks allocate nothing, truncate nothing, and never access mutable Scene or
Document owners. The supplied `std.Io` and the inbox's stable address must outlive
all producers. Whole-message admission rejects full/closed/oversized/invalid-UTF-8
requests with explicit errors and saturating counters; accepted arrival serials
follow mutex acquisition order, not a claimed native source-clock order.

The UI owner takes an Item with independent inline bytes. `request()` rebinds text
at the Item's current address, so a move never retains a pointer into a recycled
inbox slot. `admit` copies into the public owner-thread action queue and records
its ticket only on success. Queue pressure/allocation errors leave the Item
pending for retry or explicit rejection. Calling admit twice on that same Item
is rejected; application code must not clone a pending Item to replay it.

Logical inbox close prevents further submissions and counts discarded unadmitted
messages; taken Items remain owner-owned. Close the public action queue and reject
pending Items before late effects, then quiesce provider handlers before reclaiming
the inbox. Staging serials are not public execution tickets or an AT-SPI reply.
Wakeup/event-loop integration and provider-specific pressure reporting remain
separate adapter work; normalized decoding and versioned routing are described below.

Four fixtures in both Debug/ReleaseSafe cover full/closed/text policies and moved
payloads, owner queue backpressure with one admission, four concurrent producers
and an owner draining 2,000 requests, plus a real document edit/stale-revision path
through the public queue and dispatcher. These are synthetic mapped requests;
no real assistive client's request is inferred from them.

## Native request decoding and versioned routing

The private Rust extension reads its own C request/tagged-union types and visits
normalized Click, Focus and string SetValue requests. Non-root trees, wrong data
variants and unsupported actions reject without coercion. The visitor borrows
text only for its call; the Zig callback copies it to the inbox and always frees
the original native request with the provider function, including rejection paths.
The Zig binding contains all C function-pointer declarations; no C union layout
is guessed in the routing/model code.

`router.zig` publishes a bounded copied mapping atomically. Native IDs are sorted
and never rebound to different semantic controls or reintroduced after retirement.
An unchanged control can keep its native ID while its revision increases; equal
revisions require identical metadata. Text mapping also records document identity,
revision and published byte length. A native string SetValue maps explicitly to
whole-document replacement; numeric values, checkbox coercion and text-selection
positions remain unsupported here. Publishing an invalid mapping preserves the
prior complete mapping.

The native protocol supplies no client-observed semantic revision. This adapter
captures its mapping's current revision on callback arrival; it cannot infer the
client's historical view. Already staged work retains its captured revision and
is checked against the live scene/document on owner dispatch. Router and inbox
locks serialize metadata changes with staging; no native callback accesses the
live owners. Native tree publication must be coordinated separately with this
mapping before this can become a complete accessibility adapter.

Two additional fixtures test native-ID retirement/rebinding, revision capture,
atomic publication failure and full replacement metadata. Each native probe also
uses ten synthetic requests delivered through the actual FfiActionHandler on
foreign Rust threads. It proves owned `native café` text reaches a registered
document after native request release, unsupported focus remains explicitly
rejected by the document-only dispatcher, malformed/foreign-tree requests reject,
and late callbacks cannot stage after close. The fixture is not actual AT-SPI
traffic or proof that a screen reader sees a published tree.

## Owned native snapshot conversion

`Library.convert_snapshot` converts a complete semantic snapshot into an owned
AccessKit TreeUpdate candidate and copied routing records. The converter copies
names, descriptions, text values, child order, relations, bounds, checked/numeric
state, collection sizes/one-based item positions and focus. Native roles and
advertised Click/Focus/SetValue actions use the normalized Rust constructor,
which avoids guessing C enum discriminants. Other standard setters remain in the
private pinned C binding. Actions whose decoding is unimplemented are omitted
from this candidate's native action list.

Native IDs use nonrecycled semantic serials within one Scene domain. One native
adapter/router must stay bound to that domain; replacing the Scene owner requires
a new native adapter. Both an unchanged native ID and its updated semantic
revision survive a property update. Routing records sort by native ID, while
native child lists retain semantic declaration order.

Protected editors become read-only PasswordInput, with neither value nor selection exported.
A full native candidate owns its copied strings/children independently of the
source scene/document/registration. Deinitialize it before its stable Library
owner. Conversion prepares a candidate only: it does not swap callback snapshots,
update a native adapter, synchronize tree publication with routing, or emit native
announcements. Use the separately owned publisher for callback/adapter handoff; live-bus behavior remains gated. This is a full conversion with
O(logical nodes) native storage, not incremental/O(visible) accessibility storage.

The finite nine-node fixture validates two snapshots with the real pinned
`accesskit_consumer` 0.39.0, checks focus, checked/disabled numeric state, bounds, label relations,
collection positions and protected disclosure, then destroys every source owner
and validates/reads the old native candidate again. Stable IDs and Zig allocation/
capacity failures are checked without invalidating that candidate. The direct
consumer dependency exists only in the disposable provider fixture; Cargo derives
the local lock offline. Rust/native allocation aborts remain unrecoverable and
are not claimed to pass Zig allocator-failure tests.

Candidate bounds copy semantic coordinates directly. Window-origin, scaling/DPI,
clipping and transform integration are not certified by this numeric fixture.
Read-only PasswordInput reflects the current semantic policy that rejects native
mutation of protected text; masked native editing would require a separate,
explicit policy and text-position contract.

## Adapter activation and publication owner

`Publisher` owns a real Unix adapter and heap-stable callback context. Initialization
and publish consume an optional candidate only on success. Allocation/domain/router
rejection leaves the candidate caller-owned and preserves the prior callback tree.
One callback gate swaps the owned tree and copied routing metadata together;
activation and action callbacks enter that gate before reading either. Native
activation receives an independently owned clone. The update factory also clones
the current tree and satisfies the provider's non-null ownership contract.

Native create/update/free calls run outside that gate: the pinned provider holds
its own state lock while invoking factories/handlers, so invoking it under the
callback gate could invert lock order. `update_if_active` calls its factory
synchronously in this pinned implementation. UI owner operations (publish, close,
deinit) must be serialized; callback ingress is synchronized separately. This is
an atomic callback-store replacement, not an atomic transaction with the caller's
Scene commit, the native transport, or a screen reader's view. A failed conversion
can leave the old bridge snapshot while live semantic checks reject stale actions;
the caller retries publication from the current model without replaying edits.

Close first disables activation/actions and closes staging, then drops the stored
candidate and frees the native adapter outside the lock. Admitted public queue
commands and independent worker threads remain the caller's responsibility.
Deinit waits for the provider handler-release acknowledgement before reclaiming
context memory. On timeout/cancellation it retains context for retry: the owner
must keep its IO/Library alive. Provider mappings remain process-resident.

Both modes test twelve swaps while foreign Rust-thread activation clones are
validated by the real consumer, then race close with callback entry. They also
check factory ownership, callback routing to the latest version, foreign-domain
publication failure, initialization OOM, unchanged candidate ownership on failure,
post-close activation/actions and repeated deinit. Independent synthetic workers
are joined before deinit; provider acknowledgement does not quiesce user workers.
The real native create/update/free APIs run on the unavailable-bus path. The active
update/factory state machine, native transport, deactivation/reactivation,
announcements and real assistive client behavior still need live-bus validation.
