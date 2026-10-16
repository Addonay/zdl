# WP-02: Pango paragraph and Cairo cached-bitmap feasibility

Status: **initial experiment passed; conditional recommendation, not adoption**.
Source baseline is the active implementation worktree over `794ddb2`. The
experiment is [under tools](../../tools/spikes/paragraph/README.md), not imported
by `zdl` or promoted to a permanent text/widget API.

## Inputs and observed results

On the current Linux x86_64 host, the audit used Zig
`0.18.0-dev.253+16d31ceed`, runtime **Pango 1.57.1** and **Cairo 1.18.4**.
The requested font was `Liberation Sans 20`; Fontconfig selected Liberation Sans
Regular at `/usr/share/fonts/liberation-sans-fonts/LiberationSans-Regular.ttf`.
That request result does not identify the actual font used for every shaped run.

Seven tests passed in both Debug and ReleaseSafe with `G_DEBUG=fatal-warnings`:

- absent providers/partial load and missing-symbol rejection;
- combining-mark grapheme stops and reverse visual traversal;
- distinct strong/weak bidi carets and nonlogical visual movement;
- unambiguous ASCII caret/hit round trips and out-of-bounds hit reporting;
- copied input ownership, repeat raster equality, opaque pixel checks, bitmap
  lifetime after layout destruction and all Zig allocator failure positions;
- wrapping and explicit invalid text/font/geometry options;
- sixteen complete provider-handle/object open/use/close cycles in one process.

The 540-pixel layout rendered a 556×321 bitmap with nine lines. The 180-pixel
layout rendered a 197×724 bitmap with 22 lines. Image allocation includes padding
and ink overhang, so its width need not equal the requested layout width plus
exactly sixteen pixels. Both reported zero missing glyphs for the mixed Latin,
Hebrew, Arabic and combining-accent sample. Wide/narrow PNGs were visually
inspected for text, wrapping and clipping. These do not certify every script or
fallback choice, bidi selection geometry or a native editable field.

The frozen executables link libc/loader (Debug also libm); Pango/Cairo/GObject
are runtime loaded. Their mappings are intentionally resident after activation.
No development headers, display server or dependency installation was used.
Version-sensitive pixels and executable sizes are evidence for this host only.
The audit report records source/artifact hashes and commands under
`.cache/spikes/paragraph/report.json`.

## Lifecycle finding and decision

Ordinary unloading/reloading reproduced duplicate GObject type registration and
a hang; an isolated pre-fix regression also crashed during the next layout
construction. Its log is `.cache/spikes/paragraph/reload-before.log`.

The experiment now explicitly calls its loader `open_resident`: after all symbol
tables resolve, balanced `dlopen`/`dlclose` probes mark mappings `RTLD_NODELETE`.
All owned native paragraph/surface objects and loader references are released;
provider mappings, static registrations and caches persist until process exit.
The GObject documentation distinguishes [static types](https://docs.gtk.org/gobject/types.html)
from its [unloadable type-module mechanism](https://docs.gtk.org/gobject/class.TypeModule.html).
[Linux NODELETE semantics](https://man7.org/linux/man-pages/man3/dlopen.3.html)
preserve mapped code/state across closes. The exact residency policy must stay
explicit if a production adapter is adopted; object teardown cannot be marketed
as reclaiming every provider cache or mapping.

## Recommendation and remaining gates

Continue with **Pango layout plus provider-rendered cached bitmaps** for the first
Linux CPU text adapter. Query and painting share the same immutable native layout;
no unsupported glyph/font struct prefix reads were needed. Keep direct shaping
helpers as narrower services. Do not expose this spike as a permanent contract.

[Pango cursor geometry](https://docs.gtk.org/Pango/method.Layout.get_cursor_pos.html)
separates strong/weak bidi carets. Its [visual movement](https://docs.gtk.org/Pango/method.Layout.move_cursor_visually.html)
preserves index/trailing pairs, including wrapping information. Keep these domains
in the eventual document/revision API; converting everything to one byte offset
would discard information. [PangoCairo rendering](https://docs.gtk.org/PangoCairo/func.show_layout.html)
provides the demonstrated cached-bitmap route.

Before production adoption, complete:

- per-run resolved font/fallback identity evidence, broader scripts/fonts/Unicode
  corpus, wrap/selection geometry and logical/visual caret affinity contracts;
- application-owned document/revision/undo transactions, real Wayland/X11 IME,
  native accessibility text ranges and screen-reader actions;
- supported runtime ABI/version matrix and native allocation-failure/pressure
  tests, plus budgets for native shaping/layout/font caches (current source/image
  limits do not bound all native work or allocations);
- real native-window demo, DPI/scale/transform behavior, font options, color/alpha
  policy and general Cairo paint protocol conformance;
- supported GPU glyph/font export identity, or continue cached surfaces explicitly
  until a provider-consistent export route is proven;
- deployment/licensing/reproducible font inputs and residency policy review.

AccessKit and zlay feasibility gates are independent and still open. Passing this
experiment does not close WP-02, G0 or G1.
