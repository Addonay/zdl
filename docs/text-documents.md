# Application-owned UTF-8 documents

`zdl.text.Document` implements the model part of WP-04: atomic revision-checked
replacement batches, immutable snapshots, directional selections with affinity,
and bounded grouped undo/redo. It has no UI/text-provider, libc, clock or display
requirement. It is not yet an editable widget or a Unicode navigation engine.

```zig
var document = try zdl.text.Document.init(allocator, "Hello", .{});
defer document.deinit();
var before = try document.snapshot();
defer before.deinit();
var edit = try document.replace(before.revision(), .{
    .start_byte = before.text().len,
    .end_byte = before.text().len,
}, "!", .{ .origin = .typing });
defer edit.deinit();
// before.text() remains "Hello"; edit.snapshot.text() is "Hello!".
var undone = try document.undo(try document.current_revision());
defer undone.deinit();
```

The revision
includes a process-local DocumentId and a monotonic state counter. A delayed edit
must use the token from the document state it actually observed, not silently
rebase itself onto whichever document/selection is now focused. Foreign/stale
requests fail. Undo/redo issue fresh revisions even when restoring earlier text;
old requests do not become valid again. Selection-only changes also advance the
state revision. DocumentId is not a serialized application/file identity.

## Transactions, text and selections

`apply(base, replacements, options)` validates an entire batch against the same
base text. Ranges must be ordered, non-overlapping and on UTF-8 scalar boundaries;
equal-position empty inserts concatenate in input order. New text, resulting
selection, history and allocation are prepared before publication. Failure leaves
content, revision, selection, grouping and logical history unchanged. Internal
container capacity can grow during preflight, but no partial edit escapes.

All offsets are explicitly named **byte** offsets. They are not UTF-16 indexes,
scalar counts, graphemes or glyph clusters. UTF-8 is validated, not normalized to
NFC. Invalid encodings and ranges fail. A valid scalar boundary need not be a
valid caret/grapheme stop: a keyboard/IME/editor adapter must obtain the right
ranges from its navigation/paragraph contract rather than deleting one byte.

`Selection` keeps anchor/active direction and separate endpoint affinities:
line `upstream`/`downstream` and bidi `strong`/`weak`. Affinity-only changes are
state changes and end typing groups. History restores these fields too. The model
preserves intent; it cannot validate or calculate visual caret geometry without
layout. Paragraph results must retain their own width/font/layout identity.

Without `selection_after`, an edit collapses selection after its last normalized
insertion. Explicit offsets refer to the **result**, after newline normalization.
Defaults are downstream/strong. `set_selection` has no undo entry and does not
clear redo; actual movement ends grouping. Exact text+selection no-ops retain the
current revision/history. `EditResult` reports `changed`, `text_changed` and a
history status (`none` need not mean that older history is empty).

Newlines are preserved by default; `.newlines = .lf` normalizes CRLF and lone CR
on initial text and inserted content. Embedded NUL is rejected by default to
avoid silently shortened native text. `.nul = .preserve` explicitly permits it
in the model; an adapter unable to render it must reject it rather than truncate.
Read-only mode rejects text edits and undo/redo while still allowing selection.
No single-line, numeric, password-disclosure or secure-storage policy is implied.

## History and semantic groups

```zig
const group = try document.begin_group();
// Pass .{ .origin = .typing, .group = group } to adjacent typing edits.
try document.end_group(group);
```

Adjacent edits coalesce only with the same active group and origin. Typing,
paste, cut, deletion, composition and programmatic origins are distinct; there is
no hidden timer heuristic. A selection/affinity change, history traversal/clear,
unrecorded change or explicit end breaks grouping. Tokens are owner/session
checked and never wrap. Failed operations preserve the active group.

The baseline stores full before/after text states, sharing immutable buffers
where possible. Limits apply to the sum of logical before+after byte lengths in
both stacks; this conservative count can count shared bytes more than once.
Oldest complete undo groups are evicted to fit a new group. One oversized recorded
group returns `HistoryLimit` atomically. The caller may explicitly retry with
`.record_history = false`, which accepts the change and clears history. A zero
history limit intentionally disables recording. A new text edit clears redo;
selection-only changes do not. `clear_history` does not edit the document.

Defaults: 1 MiB current text, 4,096 replacements/batch, 256 history groups and
8 MiB logical history bytes. These are configurable initial bounds, not an editor
scalability claim. History metadata/container capacity, current text and snapshots
held by other owners are outside logical history-byte accounting. The caller
budgets retained snapshots. Full contiguous copies are appropriate for an initial
field model; large-document piece-table/rope work remains open and benchmark-led.

## Ownership and scene integration

Document owns current state and history; the application owns Document.
[Checked registrations](document-registrations.md) can borrow a mutable document
for live routing; while registered, its address must remain stable. Ordinary
Zig owner values are moved, not shallow-copied and independently deinitialized.
Call `Snapshot.retain()` for another owner. Snapshots remain readable after edits,
close and final Document destruction. Text slices borrow their snapshot. The
allocator must outlive all snapshots, including those retained by scene state.
All API calls, retain/release and history mutation are owner-thread only; no
concurrent registration/worker-handoff protocol is supplied here.

Document operations have no pending mutable transaction object; callers provide
synchronous borrowed edit inputs. Close is allocation-free/idempotent and rejects
new operations. Existing snapshots still own immutable text. Closing/history
release can retain container capacity until deinit. App/provider callbacks must
be unregistered/quiesced separately before the application's Document value dies.

A typed scene channel can retain an immutable document snapshot with a custom
ownership policy (`clone` calls `Snapshot.retain`, `deinit` releases it). This does
not borrow a mutable Document pointer or transfer application model ownership.
The integration fixture accepts a document edit, intentionally fails scene
publication, then retries scene description from the accepted document revision.
The edit is not replayed or rolled back; the old scene retains its old text until
replacement succeeds. Checked logical registrations are available separately; native callback adapters,
action dispatch and the editable widget are still future work.

## Evidence and remaining work

Fifteen document fixtures cover UTF-8/multi-edit/normalization/NUL policies,
directional/affinity selections, stale/foreign requests, grouping/history limits,
read-only, close/owner reuse, counter/reference exhaustion, every allocation
failure in edits/history/grouping, 400 randomized edit/selection/undo/redo rounds
against an independent model, and document/scene retry ownership.

`tools/consumers/text.zig` exercises runtime-input editing/undo/snapshots in the
foundation dependency audit without libc. `tools/bench/documents.zig` records
contiguous edit and history-traversal costs separately from shaping/painting.
The benchmark checks output and snapshot/history limits outside timing and keeps
raw trial ranges; its hot-cache numbers are not a UI typing-latency guarantee.

WP-04 is **started**: production paragraph/font/raster contracts, per-run font
identity, grapheme/word/bidi navigation, real IME, protected text, document
registrations, accessibility ranges, native editable controls and large-document
storage/virtualization remain required. No Unicode algorithm conformance or
native field behavior is certified by the byte-transaction model alone.
