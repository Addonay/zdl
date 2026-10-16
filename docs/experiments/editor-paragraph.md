# Editable paragraph integration experiment

Status: **offscreen/controller evidence passed; native input is unverified**.
This is a disposable experiment under `tools/spikes`, not a public widget API or
completion of G0/G1. It connects application-owned documents and registrations to
the existing Pango/Cairo paragraph experiment, with one layout for text painting,
selection geometry, hit testing and visual cursor movement.

## Implemented and checked

The controller accepts committed text input through the document Registry. It
prepares a prospective paragraph and decorated bitmap before applying ordinary
text changes, then adopts the owning document result without another fallible
presentation step. Selection updates prepare the new bitmap first too. Unicode
joining can move an insertion endpoint beyond its requested byte to the provider's
next valid cursor stop. UTF-8 bytes are not deleted individually.

Backspace/Delete use Pango logical grapheme stops in logical order, independently
of visual bidi navigation. Arrow keys use provider visual cursor pairs; Shift
extends the selection, and pointer hit tests choose the closer strong/weak caret.
Raw index/trailing pairs preserve upstream wrap lines. Logical selections produce
provider visual ranges, including split bidi ranges, painted before glyphs.
Preedit is copied into separate storage and never entered into committed history;
a captured composition revision rejects a stale commit. This is not yet complete
native composition/surrounding-text/candidate behavior.

The controller retains a complete source/layout/image frame. Text/selection
preflight failures preserve both model and frame. Undo/redo can be accepted by the
application model before a UI refresh fails; the controller then blocks further
model commands until a presentation-only refresh succeeds. A fixture verifies
that retrying refresh does not perform a second undo. The prototype reuses the
same layout for selection-only refreshes, checking source text equality.

Five editor tests exercise grapheme deletion (combining Latin and Arabic), mixed
script replacement/history, stale composition/closed registration handling,
every Zig allocator failure through text and selection painting, and accepted
undo followed by failed/retried UI publication, and joining insertion with a
valid provider caret beyond the merged grapheme. Two new paragraph tests cover
empty/combining/emoji/flag logical stops and split bidi selection/decorated pixels.
The existing seven paragraph tests remain. Native allocations/cache budgets and
complete Unicode/editor conformance are not certified by these fixtures.

## Provider/ABI constraints

The binding uses public [Pango logical attributes](https://docs.gtk.org/Pango/struct.LogAttr.html)
through [get_log_attrs_readonly](https://docs.gtk.org/Pango/method.Layout.get_log_attrs_readonly.html).
The `is_cursor_position` bit identifies provider grapheme/cursor boundaries.
The raw guint32 bit decoder is explicitly limited to little-endian Linux,
GCC-compatible C bitfield ABI (cursor flag bit 4). Runtime fixtures check expected
boundary arrays, including terminal attributes; this is not a historical ABI or
Unicode-version certification. New line getters require Pango 1.50-era symbols;
missing symbols reject opening the provider instead of deferring failure.

[Selection x ranges](https://docs.gtk.org/Pango/method.LayoutLine.get_x_ranges.html)
are obtained through supported line APIs and freed with g_free. No opaque font/
glyph structure prefix is read. The cached bitmap path still uses explicit
process-resident Pango/Cairo/GObject mappings as established by the earlier
reload experiment. The prototype chooses whole-grapheme deletion uniformly;
Pango's language-specific backspace-tailoring flag is not implemented here.

## Running and reproducing

```sh
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build test-editor-spike
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build run-editor-spike -- --script --snapshot .cache/editor.png --state .cache/editor.json
python3 tools/audit_editor_spike.py
python3 tools/validate.py --pipewire-headers --paragraph-spike --editor-spike
```

The offscreen script runs grapheme deletion, undo/redo, mixed-script replacement,
hit testing and selection, exporting a 720×400 PNG and revision-checked state.
The audit runs Debug/ReleaseSafe build/test/script paths and freezes binaries,
PNG hashes, linkage, provider versions and source hashes. In this environment,
Pango 1.57.1/Cairo 1.18.4 rendered zero missing glyphs for the demo. The PNG was
visually inspected for mixed scripts, selection, caret and clipping.

Interactive use on a working Linux desktop is `zig build run-editor-spike` with
explicit Zig master as above; `--x11` forces that backend. Printable text comes
only from text_input; keydown supplies editing/navigation commands, never a
second synthesized character stream. The demo supports click/drag, Shift+Left/
Right, Backspace/Delete and Ctrl+A/Z/Y. It waits for events when unchanged rather
than repainting continuously. Its controller, not the demo shell, carries the
tested failed-publication recovery contract; the shell is not a hardened runtime.

One paragraph is intentional: no Enter/newline, scrolling, clipboard, word
navigation or complete native IME/AX contract is offered. Preedit is displayed
separately for observation rather than integrated inline. DPI/transform and full
focus/capture/overlay behaviors still need their proper platform/widget adapters.
This controller does not replace the retained scene engine or create a second
production widget stack.

## Native input evidence and remaining gate

`python3 tools/test_editor_x11.py` creates a **private authenticated Xvfb display**,
never targets the user's host desktop, and tests typing, selection/drag,
deletion, undo/redo and close when its prerequisites work. It records status and
logs. An unavailable display exits 2 and is **not** a native test pass.

Native QA here could not start: Xvfb reported failed local/Unix listener creation
and `Cannot establish any listening sockets`. Both xdpyinfo and the editor failed
to connect. Retained logs/status are under `.cache/spikes/editor/native-qa`.
No host-display fallback or permission changes were attempted. The native input
branch of that QA driver and real X11/Wayland IME behavior therefore remain
unverified in this environment, despite compiled native window/event paths.

Continue validating the cached bitmap/editor contract, but do not promote this
tool to a production text field yet. Actual native input/IME, font/fallback and
version/pressure matrices, retained scene integration, document binding actions,
AccessKit, zlay/layout and accessible editable-window gates remain open.
