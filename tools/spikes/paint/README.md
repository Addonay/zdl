# Cairo paint replay feasibility prototype

Run `python3 tools/audit_paint_spike.py`, or add `--paint-spike` to
`tools/validate.py`. This Linux headless experiment runtime-loads Cairo; no headers,
display server or default ZDL dependency is added. Successful provider mappings
remain resident for process lifetime; owned contexts/surfaces/pattern references
are still released. The Library stays at a stable address until every output ends.
Replay and output readback/export are synchronous owner operations.

The prototype executes every current paint command: save/restore, affine/device
transforms, rectangular/rounded/path clips, solid fills, quadratic/cubic paths,
cap/join/miter strokes, image sampling and opacity groups. Compositing is ordered
source-over in encoded-sRGB-compatible premultiplied ARGB32. Layer opacity applies
to the completed group, so overlapping opaque children do not accumulate opacity
separately. Rounded shapes use Cairo arcs; quadratics convert to cubic control
points. Zero-area image samples and zero-width strokes are no-ops.

Immutable straight sRGB RGBA8 resources convert to native-endian AARRGGBB words
with rounded alpha multiplication. A per-replay identity cache converts repeated
images once. Source/destination coordinates and nearest/bilinear filters are
explicit. Filtering clamps to the full raster's edges; a cropped source's linear
kernel can sample adjacent source pixels. Destination clipping bounds output,
not that kernel. Future backends must match the chosen sampling contract or
report a capability difference. Readback is explicitly premultiplied; callers must
not treat it as ordinary straight RGBA8.

Only `srgb_compatible` policy is accepted. Linear/extended-linear modes reject
before output creation. Singular matrices can return NativeFailure from Cairo;
there is no silent matrix/color fallback. All output is temporary until replay
succeeds, so failure cannot publish a partially rendered result. Public core
Packet resources are borrowed only while the caller holds its lease.

Output defaults to at most 256 MiB. Conservative working-buffer admission defaults
to 512 MiB, counting output, peak full-size opacity groups and unique converted
images before native surface creation. These are logical color buffers, excluding
original packets, allocator overhead and native tessellation/cache scratch/RSS.
Empty clips can make this deliberately conservative. Native allocations/status
failures are handled, but native allocator fault injection is not certified.

Six fixtures pass in Debug/ReleaseSafe: device transforms/clips/group opacity;
retained source crop and premultiplication; rounded/even-odd paths/curves/strokes;
all Zig allocation failures; missing library/symbol, unsupported color/singular
transform; and exact output/group/image buffer admission limits with deduplication.
The 480x260 visual fixture sheet was inspected, and both modes produce identical
PNG bytes on the current Cairo provider. Reports record provider/compiler/machine,
commands, source/executable/PNG hashes and ELF direct dependencies.

This is a disposable adapter decision input, not a public renderer, GPU/Cairo
conformance pass or complete GUI. Text, filters, dash patterns,
linear/HDR, damage, native window presentation, resource retirement and portable
anti-aliasing tolerances remain separate gates. Existing immediate renderers are
preserved.

The [paragraph transport experiment](../../../docs/experiments/paragraph-paint.md)
adds explicit transparent Pango raster capture and origin/scale-aware recording
through immutable image commands. It is a separate opt-in dependency path, with
no deferred native callback or layout pointer inside a packet.

[Gradient resources](../../../docs/paint-gradients.md) add native constant-alpha
patterns and bounded, transform-keyed raster sources for canonical varying-alpha
interpolation. This cost and the Cairo interpolation mismatch are explicit;
expanded gradient buffers participate in conservative working admission.
