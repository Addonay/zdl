# Owned paint packets

`zdl.paint` is an initial libc-free recording contract. It does not yet replay
commands, render a GUI or claim Cairo/GPU equivalence. Rich native replay, text,
filters, dashed strokes, incremental damage and in-flight GPU retirement
remain gates in the [paint plan](plans/06-paint-rendering-and-compositing.md).

```zig
var recorder = try zdl.paint.Recorder.init(allocator, .{});
defer recorder.deinit();
try recorder.save();
try recorder.clip_rounded_rect(.{
    .rect = .{ .x = 0, .y = 0, .width = 300, .height = 120 }, .radius = 12,
});
try recorder.fill_rect(.{ .x = 0, .y = 0, .width = 300, .height = 120 },
    .{ .r = 0.1, .g = 0.2, .b = 0.3 });
try recorder.restore();
var packet = try recorder.finish();
defer packet.deinit();
```

A packet owns command/path storage and retained immutable image leases. It stores
no widget pointers, deferred application callbacks or provider userdata. Recorder
finish is an allocation-free move, requires balanced state/layer scopes and leaves
the Recorder closed. Every failed recording operation poisons finish: discard the
recording and retry from the current model, preserving a previously accepted
packet. This does not replay application model edits.

Commands include affine transforms, save/restore, rectangular/rounded/path clips,
solid rectangle/path fills, solid path strokes with cap/join/miter choices, image
sampling and opacity layers. Paths copy their move/line/quadratic/cubic/close data.
Each contour starts with move; close ends it and further segments require a new
move. Empty paths are valid. Rounded radii clamp to half the smaller rectangle
side. Layer boundaries implicitly save/restore graphics state; restore may not
cross a layer boundary. Layer opacity is finite [0,1]. Zero-area geometry/images
must replay as no-ops; finite degenerate transforms are recordable and a backend
must explicitly support, cull or reject them rather than silently corrupt state.

Affine concatenation right-multiplies local coordinates. The packet metadata
stores an explicit root device transform plus an optional scene domain/revision
stamp supplied by the caller. Recording validates finite input/composed transforms
and transformed geometry, but supplies no hit-test inverse or scene-authority
check. Painter order is command order. `full_redraw` is always true: this contract
does not infer conservative damage or promise culling/batching.

Default color policy is SDR sRGB-compatible compositing. Solid Color components
are straight alpha in the policy encoding, with finite alpha in [0,1]. Normal
sRGB/linear RGB components are [0,1]; extended-linear RGB may be any finite value.
Recording carries these policies; no replay backend is yet certified for them.
A backend must reject unsupported policy instead of silently falling back. Proper
premultiplication, linear conversion and native ARGB32 adaptation belong to replay.

`paint.Image.copy` copies/converts a borrowed `video.surface.View` into tightly
packed RGBA8, excluding padding. The source code values must already represent
straight-alpha sRGB: pixel-format conversion is not ICC/transfer/alpha conversion.
In particular, premultiplied Cairo ARGB32 bytes are not ordinary straight RGBA8.
Callers must adapt them explicitly. Source pixels/palette are borrowed only during
copy and must remain stable then. Image views in commands borrow packet-retained
immutable bytes. Each unique image identity is retained once per recording,
including repeated samples; queued reads never see later source mutations.

Packet/Image clones use saturating atomic reference counts. Distinct owning
handles may be cloned/released concurrently; do not race operations on the same
handle or independently deinitialize shallow copies. Allocators and their contexts must outlive every dependent lease. Allocators
for packet and image storage must support the thread performing each final release. Transferring
ownership to a submit/retirement owner is possible, but no retire queue/fence is
implemented here. A command slice alone does not keep its packet/resources alive.

Defaults bound commands (65,536), state/layer depth (256), copied path segments
(1,048,576) and unique retained image bytes (64 MiB). Image copy has its own explicit
byte limit. These are logical budgets, excluding allocator metadata, container
capacity, source storage and other live packets/leases. No implicit eviction occurs.

Seven fixtures cover owned path/raster data and padding, repeated image retention,
nesting/state restoration, color/geometry/depth/resource limits, poison/close,
saturation, all allocation-failure points and 8,000 concurrent packet clone/release
cycles. Zero-width raster copy skips rows even for a very large declared height.
The isolated paint consumer records runtime-sized commands without libc.
The [benchmark](../tools/bench/README.md#owned-paint-recording) measures recording
only; a green packet test does not certify raster output or GUI frame latency.

## Optional Cairo feasibility replay

The [private Cairo prototype](../tools/spikes/paint/README.md) now executes current
packet commands into owned ARGB32 raster output. It verifies source-over/group
alpha, transforms/clips/paths and explicit RGBA-to-premultiplied image adaptation.
Run `python3 tools/audit_paint_spike.py` or opt into `--paint-spike` in the main
validator. This does not promote a public `zdl.paint.cairo` backend or certify
GPU/native-window conformance. The core module remains libc-free.

A separate [paragraph raster integration](experiments/paragraph-paint.md) now
captures provider-consistent transparent text into immutable image resources,
with explicit alpha/origin/scale handling. It remains a private experiment;
paint packets do not yet retain a public positioned-text/layout resource.

## Gradient resources

[Owned gradients](paint-gradients.md) now support linear/radial geometry, ordered
stops, spread modes and explicit premultiplied interpolation. Packets retain
resources once by identity, and the Cairo prototype uses a bounded raster fallback
when native varying-alpha interpolation does not meet the contract. Existing
solid commands keep their payloads. Positioned text, filters/dashes and renderer
conformance remain open.
