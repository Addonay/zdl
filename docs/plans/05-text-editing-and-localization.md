# Text, fonts, editing, IME and localization

[Plan index](../../PLAN.md) · [Input and accessibility](07-input-focus-and-accessibility.md)

Status: proposed provider/editor architecture with an initial [document model](../text-documents.md)
and [Pango/Cairo feasibility experiment](../experiments/paragraph-cairo.md). Text
correctness remains a G0/G1 requirement. API sketches below remain proposals;
neither initial slice completes the production text/IME/accessibility gates.

## Decision: paragraph services, not a glyph-only widget dependency

Introduce a `zdl.text` contract covering font resolution, paragraph layout,
logical/visual positions, selection geometry and immutable results. The current
FreeType/HarfBuzz helper remains useful for low-level shaping and controlled
embedded-font scenes, but must not be advertised as a complete international
text editor.

For Linux desktop, recommend a **Pango-based paragraph adapter** first. Its
[itemization/shaping/breaking pipeline](https://docs.gtk.org/Pango/pango_rendering.html)
provides a sounder integration point than independently assembling partial
behavior in every control. HarfBuzz remains a shaping component, not the public
paragraph/document API. Pango does not replace zdl's document, undo or UI model.

Before making this the production default, prove a pinned adapter with mixed
scripts, font fallback, caret positions, IME, painting and packaging. If exporting
stable positioned glyph/font data proves impractical through supported APIs,
start with cached PangoCairo paragraph surfaces. Do not invent unsupported struct
prefix reads to force an atlas path. Extract a GPU glyph path later only when
its font identity, metrics and output agree with the same layout result.

## Font model

A font request contains families, language/script preferences, size in logical
points, weight/stretch/slant, feature settings and variation coordinates.
Resolution yields immutable `FontInstanceId`s that encode the actual face,
collection index, axes and raster/metric policy. One family name is not one face.

Support application fonts and system discovery through a provider. Fontconfig
is the Linux discovery candidate; the paragraph provider owns coherent fallback
selection. Missing glyphs trigger explicit fallback/tofu behavior and diagnostics,
not random replacement with a font whose metrics were never measured.

Separate layout font identity from raster identity. Glyph cache keys include the
face/axes, glyph ID, physical scale, hint/raster mode, subpixel phase and relevant
color-glyph settings. A single cache keyed by glyph ID is wrong across fonts.
Bound caches by bytes with eviction that respects in-flight paint leases.

Default to grayscale AA for general transformed/translucent surfaces. Optional
LCD subpixel rendering requires a known opaque target/orientation and a tested
policy; it cannot silently persist after moving to a different output. Do not
bake a Chrome-specific gamma tweak into the universal text model.

## Positions and paragraph snapshots

Use UTF-8 for document storage; distinguish byte offsets, Unicode scalar counts,
grapheme boundaries, glyph clusters and native UTF-16 text ranges. They are not
interchangeable. A valid UTF-8 boundary is not necessarily a valid caret stop.
A glyph cluster is not a grapheme or a universal caret boundary either; preserve the layout
provider's valid logical stops within ligatures and script-specific clusters.

```zig
// Proposed domain sketch.
pub const Utf8Offset = enum(u64) { _ };
pub const LineAffinity = enum { upstream, downstream };
pub const BidiAffinity = enum { strong, weak };
pub const Position = struct {
    offset: Utf8Offset,
    line_affinity: LineAffinity = .downstream,
    bidi_affinity: BidiAffinity = .strong,
    revision: u64,
};
pub const Selection = struct { anchor: Position, active: Position };
```

An immutable paragraph result retains source/document revision, line starts,
logical and visual runs, resolved fonts, glyph clusters/advances, baselines,
caret stops/affinities, selection rectangles and hit-test mapping. Provide
byte-to-visual and visual-to-byte queries on that same result. Do not reshape
text separately to guess where a click or accessibility caret belongs.

Pin a coherent Unicode data/version policy. [UAX #29](https://www.unicode.org/reports/tr29/),
[UAX #9](https://www.unicode.org/reports/tr9/) and
[UAX #14](https://www.unicode.org/reports/tr14/) are relevant references for
segmentation, bidi and breaking. Provider behavior/tailoring must be recorded;
this plan does not claim zdl already implements those algorithms.

Pango's [cursor API](https://docs.gtk.org/Pango/method.Layout.get_cursor_pos.html)
exposes strong/weak positions. Line-wrap affinity and strong/weak bidi affinity are separate properties.
Preserve that distinction rather than assuming
one x coordinate per logical offset. Preserve grapheme/ligature boundaries during
ellipsis, deletion and selection; slicing until a byte prefix fits is insufficient.

## Document storage and editing

Use a dedicated application-owned `TextDocument`, registered with the GUI.
Start with a gap buffer or contiguous storage for ordinary fields, with a stable
editing contract. Add a piece-table/rope-backed document implementation for
large editors after benchmarks establish the threshold; widgets depend on the
contract rather than the storage representation.

An edit transaction describes replacement ranges, inserted UTF-8, selection
changes, origin and expected revision. Validate all ranges first; allocate before
mutation and publish one new document revision. Define newline normalization,
invalid UTF-8 policy, maximum text bytes and maximum undo storage explicitly.
Do not normalize all user content to NFC without application consent.

Undo/redo stores semantic editing groups, not paint frames: typed runs, paste,
selection replacement, composition commit and explicit app transactions. Cursor
moves usually do not create undo entries. Read-only, password and numeric-input
policies share the same editing engine instead of separate string hacks.

Selections preserve anchor/active direction. Navigation has explicit logical
versus visual operations, word/line/document movement and preferred x for vertical
motion. Word boundaries may be language-tailored; a whitespace split is not a
multilingual editing algorithm. Single-line and multiline controls differ by
policy, not by incompatible offset types.

## IME composition

The composition session belongs to a focused document registration and window
seat. Preedit is separate from committed text and ordinary undo history. The
protocol carries replacement range, preedit spans/selection and final commit.

- Never synthesize committed text from key-down events when a text-input stream
  is authoritative. Shortcut handling must not duplicate characters.
- Publish surrounding text with bounded length and native offsets translated
  from a specific document revision. Password policy can restrict disclosure.
- Keep the candidate rectangle in correct native coordinates after scroll,
  zoom, DPI changes and bidi caret movement.
- Losing focus, removing the field, opening a modal or closing a window has a
  documented commit/cancel policy. Native callbacks cannot retain a freed document.
- A composition result for a stale revision is reconciled or rejected explicitly;
  it never inserts into whichever control happens to occupy the old node slot.

Linux acceptance includes real fcitx/IBus workflows on Wayland and X11, not only
replayed ASCII `text_input` events. Later Windows/macOS bridges meet equivalent
composition/document-offset tests on their systems.

## Large documents and asynchronous work

Layout/cache at paragraph granularity. A small edit invalidates its affected
paragraphs and dependent line geometry, not a whole multi-megabyte document.
Virtualize paint and shape around the viewport while retaining an indexed line
model for navigation/search/accessibility. Reflow preserves a document anchor.

Background layout uses immutable text/font/style requests tagged with revision,
width and provider environment. It cannot share a mutable shaping buffer with
the UI. Late results are discarded/freed. Initial implementation may shape on
the owner thread with bounded incremental work; do not add asynchronous races
before measuring the synchronous path.

## Localization

GUI copy is supplied through an application localization interface; no widget
hardcodes English labels for actions such as close, next month or clear input.
Support locale-sensitive numbers/dates, plural/select messages, keyboard shortcut
display and direction. A native platform locale is an input, not a hidden global
state read during paint.

Use an established ICU/compatible provider where formatting or tailoring requires
it; do not grow ad hoc percent substitution into a message-formatting language.
Keep localization optional to low-level media consumers. Translation changes
invalidate affected descriptions/semantics/measurements in one transaction.

## Security and privacy contracts

Password fields expose protected semantics, not plaintext through accessibility
or default diagnostic snapshots. IME/clipboard behavior is explicit; do not claim
that a GUI string type can erase every copy made by third-party input systems.
Inspector/logging capture redacts protected content by default. Rich-text import
is a separate bounded parser; plain text fields do not execute markup or URLs.

## Acceptance gates

Fixtures cover Arabic/Hebrew mixed with Latin/numbers; Indic shaping; combining
marks; emoji ZWJ/variation sequences; CJK breaking; fallback fonts; ligatures;
invalid offsets; RTL selections; tabs/newlines; variable fonts; color glyphs;
fractional scale; and text larger than the viewport/undo budget.

Require interaction-level assertions: caret hit tests round-trip within documented
affinities; backspace respects graphemes; undo restores text/selection; paste and
composition are one logical edit; stale worker/native actions do not modify a
new document; screen readers obtain coherent ranges and selections.

Painting, measurement, hit testing and semantic ranges must agree on one layout
snapshot. That is the release gate, not the ability to call `hb_shape`.
