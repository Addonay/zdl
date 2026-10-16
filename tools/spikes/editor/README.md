# Disposable editable paragraph controller

See [experiment/evidence](../../../docs/experiments/editor-paragraph.md).
This is opt-in and not imported by zdl. The root build exposes:

- `check-editor-spike`: compile/link without running;
- `test-editor-spike`: provider/document controller tests (runtime libraries needed);
- `run-editor-spike`: native window, or `--script` for finite offscreen behavior.

`tools/audit_editor_spike.py` runs Debug/ReleaseSafe integration and records
source/artifact/provider evidence. `tools/test_editor_x11.py` is a separate
private-display native input driver; environment-unavailable is not a passing
native result. No host desktop input is used.

`Session` borrows Library and Registry at stable addresses and routes all mutable
document operations through a checked registration. The document must outlive
its registration. Session owns its font string, immutable source snapshot,
layout, bitmap and copied preedit. Source/layout/image swap together; pending
UI publication blocks new model commands. Native provider mappings intentionally
remain resident until process exit. All APIs and retain/release are owner-thread
only. Fields are prototype implementation data, not mutable public interfaces.

This is not public widgets or full IME, AX, Unicode-navigation conformance,
clipboard/scrolling/DPI behavior, or a production renderer. It intentionally
handles one paragraph and whole-provider-grapheme deletion.
