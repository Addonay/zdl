# AccessKit input and close-contract investigation

Status: source investigation only. No ZDL native adapter is implemented or
certified by this record. The candidate remains gated in ADR-08.

A local independent checkout under `/home/addo/dev/stupid/zui/third_party/accesskit`
contains AccessKit C 0.23.0, depending on `accesskit` 0.25.0 and
`accesskit_unix` 0.23.0. It also has a built shared library; that binary is not
used as a ZDL dependency and its source/build provenance has not been validated.
The following are exact locally inspected source inputs, not a current upstream
version claim or a reproducible ZDL package lock:

| Local source | SHA-256 |
| --- | --- |
| `/home/addo/dev/stupid/zui/third_party/accesskit/Cargo.toml` | `94dcb6348ab8ed8608dc53f31bfa41d1fefee29f3cb858f1237f310ee987c4c4` |
| `/home/addo/dev/stupid/zui/third_party/accesskit/Cargo.lock` | `20d2800d223fee92c5679ae3bb5ce8f1e47fcfeaffcad43cc94436bc81dd70cf` |
| `/home/addo/dev/stupid/zui/third_party/accesskit/include/accesskit.h` | `1a99c7a8dac2f5b4fa99ab323d0274ab5a3bbac8bee02220ef941cde4d36af4f` |
| `/home/addo/dev/stupid/zui/third_party/accesskit/src/unix.rs` | `e0ad6d35d28f7f281635d332babdea496e63d246fc66973323fa90b0f107c060` |
| `/home/addo/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/accesskit_unix-0.23.0/src/adapter.rs` | `b7dee572fc62eb56b79474d3ef1bfec8ac14ba4540a032a2f147cf73c2c9150f` |
| `/home/addo/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/accesskit_unix-0.23.0/src/context.rs` | `b3b34f0e0262d64c65edf1989f9f668047abd4ccd045aa7971f053f27d8cffa9` |

## Findings that constrain implementation

The C header documents that all Unix activation/action/deactivation callbacks
run on another thread. Action requests transfer ownership to the callback and
must be released with `accesskit_action_request_free`. Native action payloads
must be copied before release and mapped through a versioned published snapshot;
they cannot directly call the owner-thread Scene, document Registry or action
Queue. Activation also needs a synchronized immutable tree source.

`src/unix.rs::accesskit_unix_adapter_free` drops the Rust Adapter. In the inspected
Unix crate, `Adapter::drop` sends `Message::RemoveAdapter`; the background context
processes that message separately. The C surface provides no userdata destruction
callback or explicit shutdown acknowledgement in this path. Returning from C
adapter free therefore does not establish the callback-data quiescence ZDL needs.
No claim that freeing the userdata immediately is safe follows from these files.

Before promoting this candidate, establish a supported provider lifetime lease
(e.g. a narrowly scoped binding extension with handler destruction callbacks), or
another proven quiescence protocol. Count active callbacks as well as queued
requests; an in-flight counter alone cannot prevent a new callback entering after
a zero observation. Logical close must reject new commands and invalidate document
routes before native teardown, while callback memory/library mappings remain valid
until the provider releases every handler reference. Silent queue overflow and
truncated UTF-8 replacement requests are not acceptable ingress policies.

A real Linux screen-reader/action/close-race fixture remains required. These
source findings do not replace that gate, nor select a permanent dependency.

## Disposable handler-lease prototype

[`tools/spikes/accesskit`](../../tools/spikes/accesskit/README.md) now contains a
private provider extension and exact input manifest. It adds an Arc-owned lifetime
lease to the activation/action/deactivation handlers; the final destructor calls
one release callback after every handler reference has ended. A Zig ABI probe
runtime-loads this extension, pins provider code resident, waits on a synchronized
release acknowledgement and only then reclaims callback state. Timeout retains
state rather than revoking the provider lease.

The first real native test failed: an unavailable session bus left queued
AddAdapter messages retaining handlers. The pinned Unix provider's process-global
sender outlives its exited initialization receiver. A scoped default-executor
receiver guard now closes and drains pending messages on event-loop exit; sends
after close drop their owned message payloads. This patch exists only in the
experiment-owned source copy, not the sibling checkout or the ZDL package.
The audit derives and hashes a local Cargo lockfile offline and then uses locked
builds/tests. The original failed log is retained at
`.cache/spikes/accesskit-lease/failed-native-before-drain.log`.

Three Rust fixtures pass: a deliberately held in-flight callback, missing-callback
rejection and 32 real Unix adapter teardown cycles. Debug and ReleaseSafe Zig
probes each completed 64 adapter cycles with release acknowledgement. Inputs,
commands, source/binary hashes and limitations are in
`.cache/spikes/accesskit-lease/report.json`. These native cycles explicitly use an
absent private bus path, covering failed initialization and subsequent sends;
they are not active AT-SPI traffic or normal live-bus teardown certification.

A separate private `dbus-run-session` attempt could not bind a socket in this
sandbox (`Operation not permitted`); `private-bus.json` records the failure.
No host session or desktop was substituted. Active bus/AT-SPI action races,
semantic/text mapping, synchronized ingress, native window inspection and a
redistributable provider build remain open before adoption. The runtime-loaded
Rust provider also retains process-global executor state and has abort-on-OOM
behavior; neither is equivalent to reclaimable per-window Zig allocations.

## Bounded foreign-thread ingress

The experiment now has a private preallocated MPSC inbox for already mapped
versioned semantic requests. Producer calls copy complete UTF-8 payloads under
`std.Io.Mutex`; they allocate nothing and cannot call live scene/document owners.
Full/closed/oversized/invalid input returns explicit errors and observable counts.
The owner receives an inline-byte Item independent of slot reuse, then admits it
to the public action queue. Failed admission preserves the Item for retry or
explicit rejection; successful admission stores a ticket and prevents a second
admit on that same Item. Native decoding/ID mapping and event-loop wakeups are
not implemented by this staging primitive.

Four fixtures cover payload lifetime/moves, close/pressure, four producer threads
with 2,000 requests consumed concurrently, and document execution that rejects a
second request at the stale revision. Both build modes are included in the
AccessKit audit. Close must still precede handler quiescence and inbox reclamation;
closing the inbox does not revoke foreign callback pointers or cancel a taken
owner Item. No live AT-SPI action certification follows from these fixtures.

## Normalized action decoder and routing prototype

The private extension now includes ABI-v2 normalized request visitation. Rust
reads the provider-owned C tagged union; Zig receives only explicit kind, native
node ID and a text lease. Root-tree Click/Focus/string SetValue are supported;
wrong variants and foreign trees reject. The callback always releases the owned
native request, while the inbox owns accepted bytes after callback return.

A bounded copied router now supports stable native IDs for the same semantic
identity, monotonic revisions and rejection of retired/rebound IDs. It captures
published semantic/document metadata at callback arrival; the native wire format
has no client-observed semantic revision to recover. Requests staged before a
later publication retain their earlier revision for live owner validation.
String SetValue maps to exact-revision whole-document replacement. Selection
positions, numeric/checkbox actions, native tree publication and wakeups remain
open. See the [experiment contracts](../../tools/spikes/accesskit/README.md#native-request-decoding-and-versioned-routing).

The finite native fixture sends ten synthetic requests per mode from foreign Rust
threads through the actual C owned-request handler, decoder, router and inbox.
Owner dispatch then applies copied `native café` text to a registered Document,
records rejection of unsupported document-only focus execution, and rejects late
callbacks after close. This is a C ABI/ownership fixture, not actual AT-SPI traffic.

## Owned native tree candidates

ABI v3 now converts full semantic snapshots into owned AccessKit TreeUpdate
candidates and copied routing records. It preserves logical child order and
stable semantic serials as native IDs within one Scene domain, plus focus,
labels/descriptions/relations, geometry, checked/numeric state, collection sizes
and item positions. Protected editors use read-only PasswordInput and disclose no value or
selection. Unsupported native action kinds are not advertised.

The probe builds two nine-node snapshots, checks stable IDs across a property
change, and validates each with the pinned native `accesskit_consumer` 0.39.0.
Consumer assertions verify focus, checked/disabled numeric state, bounds, relations, collection
positions and protection. The old candidate remains valid/readable after every
source scene/document/registration ends; allocation/capacity failures preserve it.
The native consumer is a fixture-only dependency in the experiment copy.

This is owned candidate conversion, not native adapter publication. Atomic
callback-snapshot/routing replacement, activation/update integration, delta updates,
announcements, live AT-SPI and screen-reader behavior remain open. It allocates
full logical-tree native storage; no O(visible) or native-allocation-failure claim
is made.

## Adapter callback store and publication prototype

ABI v4 adds owned tree cloning for activation/update callbacks. A real Unix
adapter now has a heap-stable context whose gate swaps the owned candidate and
routing metadata together. Native adapter calls occur outside the gate to avoid
inverting the provider-state/callback-lock order. Initialization/publication move
candidates only on success; foreign-domain or mapping failure preserves the
caller candidate and old callback store.

The finite probe performs twelve swaps while a foreign-thread activation worker
obtains complete clones validated by the native consumer, then closes during
callback entry. It checks latest-version action routing, activation returning null
after close, late action rejection, initialization allocation failure, domain
failure, factory ownership and repeated deinit. Close disables callbacks/staging
before native free; deinit waits for handler acknowledgement before reclaiming
context. A timeout retains state and requires the caller to retain IO/Library.
Independent synthetic workers are explicitly joined before reclamation.

Native adapter create/update/free are called on the unavailable-bus path; synthetic
activation/factory fixtures exercise callback ownership. Active native updates,
transport/announcements, deactivation/reactivation and real AT-SPI clients remain
unverified. The callback-store swap is not an atomic transaction with Scene commits
or a client's historical view. The private-bus socket limitation remains unchanged.
