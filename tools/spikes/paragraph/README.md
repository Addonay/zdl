# Pango/Cairo paragraph feasibility experiment

This is a disposable **Linux WP-02 experiment**, not a public `zdl.text` API.
Nothing under `src/root.zig` imports it. Normal builds and tests never run it.
Runtime Pango, PangoCairo, GObject, Cairo and suitable system fonts are required;
no development headers or display server are needed. Missing providers fail the
opt-in suite explicitly.

Use Zig master from the repository root:

```sh
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build check-paragraph-spike
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build test-paragraph-spike
mkdir -p .cache/spikes/paragraph
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build run-paragraph-spike -- .cache/spikes/paragraph/demo.png 540
python3 tools/audit_paragraph_spike.py
python3 tools/validate.py --paragraph-spike
```

The audit runs Debug/ReleaseSafe tests and wide/narrow demos with native warnings
made fatal. It freezes executables, checks PNG dimensions and wrapping, records
versions, hashes, linkage, requested Fontconfig family match and source inputs.
The font match is not a per-run resolved-font inventory. PNGs are local visual
evidence; their bytes depend on provider/font versions and raster settings.

`binding.zig` owns all native ABI declarations and loader handles. `paragraph.zig`
owns copied UTF-8 and per-snapshot native font-map/context/layout references.
Queries and rasterization use the same layout; the rendered image survives
snapshot destruction. Pixel bytes borrow the image. Every object is owner-thread
only, and its `Library` must outlive it at a stable address. Snapshot internals
must not be modified by consumers. Invalid UTF-8/NUL text, invalid positions,
unbounded font sizes and invalid raster options fail explicitly. Text/image
limits bound our storage/output, not all provider allocations or layout work.

**Provider residency is part of the experiment's contract.**
`Library.open_resident` marks loaded mappings `RTLD_NODELETE` only after symbols
resolve. Static GObject registrations/cache references make unloading unsafe;
we reproduced a reload crash/hang with ordinary unloadable handles. `deinit`
balances owned handles and snapshots free their objects, but mappings and native
globals/caches remain until process exit. No global allocator or zdl singleton is
introduced, and media/core consumers still load nothing from this experiment.

Cursor positions retain native index/trailing pairs. Byte offsets alone lose
wrap affinity. Strong/weak bidi positions are separate. The scalar-boundary
`carets` query does not certify a valid grapheme stop; visual movement supplies
provider cursor stops. This is not yet a document revision/IME position contract.
Rendering is opaque black-on-white Cairo ARGB32 in native endianness; it proves a
provider-consistent cached bitmap route, not HDR/color-managed/subpixel/vector
paint conformance or GPU glyph identity.

See [decision/evidence record](../../../docs/experiments/paragraph-cairo.md).

The editor experiment extends this prototype with provider logical stops,
selection ranges, wrap-aware caret drawing and decorated rasters. Its public
logical-attribute bit decoder is restricted to little-endian Linux guint32 ABI,
and supported line getters require Pango 1.50-era symbols. The suite now has nine
tests. [Editor integration limits](../../../docs/experiments/editor-paragraph.md)
remain separate from production paragraph adoption.
