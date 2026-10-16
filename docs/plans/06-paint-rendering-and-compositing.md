# Paint, rendering, compositing and color

[Plan index](../../PLAN.md) · [Media/assets](09-media-assets-and-services.md)

Status: proposed. Preserve the existing low-level renderers while introducing a
GUI paint protocol; do not equate this document with hardware-validated support.

## Decision: record once, execute through explicit backends

`zdl.paint` records backend-neutral commands from committed layout/text/style.
A display list owns its storage and retains referenced paths, images and text
layouts. It carries scene/resource revisions, conservative damage and the color
policy. Backends execute it; they do not rebuild widgets or ask application
callbacks for more data while submitting work.

Initial backends:

- Existing native software primitives for minimal/core use and narrow fixtures.
- Optional Cairo CPU painting for rich paths, clips and an early dependable GUI.
- Existing zdl Vulkan work as the accelerated backend, admitted through live
  validation and paint-conformance gates.

[Cairo's API](https://cairographics.org/manual/) provides drawing, paths, transforms,
image/recording surfaces and font integration. That makes it a practical CPU
candidate, not proof that every GPU/color mode will match it bit-for-bit.
Keep backend-specific differences and unsupported operations visible.

## Display-list contract

Include save/restore state, transforms, rectangular/rounded/path clips, fills,
strokes, gradients, image samples, positioned text, layers/opacity and explicit
filter effects. Paths record winding/fill rule and stroke cap/join/miter/dash
properties. Recording validates finite coordinates, nesting and resource domains.

```zig
// Proposed sketch. Recording copies path commands/retains referenced resources.
var paint = try zdl.paint.Recorder.init(allocator, .{
    .color_policy = .srgb_compatible,
});
defer paint.deinit();
try paint.push_clip(.{ .rounded_rect = bounds });
try paint.fill_rect(bounds, theme.panel);
try paint.draw_text(paragraph_lease, origin, theme.foreground);
try paint.draw_image(image_lease, source_rect, destination_rect, .linear);
try paint.pop_clip();
var packet = try paint.finish(); // owned; no borrowed widget pointers
defer packet.deinit(); // release here unless ownership is transferred to submission
```

Custom widget painters run synchronously while recording. Their output is data,
not a deferred `*anyopaque` closure. Unsafe native custom passes, if offered,
live in an advanced API with explicit thread/resource/state restoration rules.
A GPU plugin does not get to invalidate the following widget's blend or clip state.

## Coordinates, clipping and ordering

Keep logical geometry and a root device transform explicit. Use affine transforms
for local paint/hit regions; represent noninvertible transforms as non-hittable
or a documented error. Clip bounds are conservative under transforms.

Painting order follows scene order and layer boundaries. Batch only when it
preserves painter's order, blend dependencies, clips and resource hazards.
A shadow/filter can read pixels outside its nominal rectangle; expand damage
and offscreen bounds accordingly. Never infer opacity from an image format name.

Define top-left/edge coverage, stroke alignment and pixel snapping consistently.
Path antialiasing may have backend-specific tolerances; those are test metadata,
not a reason to accept arbitrary screenshot drift.

## Compositing and color policy

Separate source color encoding, alpha representation, working compositing space
and output encoding. Do not treat every four-byte surface as equivalent RGBA.
Cairo ARGB32/native-endian storage needs an explicit adapter; on little-endian
systems its byte order is not the library's ordinary RGBA8 contract.

Recommended first GUI default: **SDR sRGB-compatible premultiplied compositing**,
for predictable conventional GUI appearance across the CPU/GPU paths. Declare
this choice; do not describe encoded-sRGB blending as linear-light blending.

Offer a separately validated linear/extended-linear policy for color-critical
content and HDR. Convert straight-alpha source colors into the working space
before premultiplying; do not apply transfer functions blindly to premultiplied
channels. Tone-map content relative to explicit SDR white/output headroom.

Cairo is a useful geometry/coverage reference, but its ordinary color composition
is not the reference for every linear/HDR mode. Those need a float CPU oracle or
coverage masks with explicit color math. A fallback may not change color policy
silently. If it cannot honor a mode, report it or use an app-approved conversion.

Retain ICC/CICP/transfer metadata through asset decode and video import. A GUI
thumbnail can intentionally convert to its target space; an image editor must
be able to retain precision and distinguish display conversion from document
pixel edits. The existing color/YUV pipeline is a starting point, not permission
to claim every wide format is supported by every renderer.

## Text paint path

Start with provider-consistent paragraph rasterization/cache when necessary.
Later glyph atlases consume glyphs and font instances from the exact text
layout snapshot. Separate monochrome coverage, color emoji and distance-field
assets; one SDF technique is not a universal small-text quality solution.

Atlas entries include font/raster policy and scale. They stay pinned while in
flight. Eviction cannot overwrite a glyph still referenced by a submitted frame.
Font changes and device loss invalidate the appropriate cache epoch. Grayscale
AA is the ordinary baseline; transformed/subpixel text policies are explicit.

## GPU resource and frame lifecycle

Use an owned packet and fence/sequence retirement. At most a configured number
of frames may be queued. Superseding an unsubmitted packet releases its leases;
submitting transfers lifetime responsibility to the device retire queue.

- Upload/staging rings have bounded capacity and explicit backpressure.
- A texture update defines whether queued reads see the old or new backing.
- Unmapping, cycling and suballocation tracking cannot expose host pointers to
  freed/cycled memory.
- Swapchain recreation validates window epoch, scale, zero extent and format.
- Surface/device loss is a state transition; avoid repeatedly recreating a device
  each frame without a retry/backoff and diagnostic policy.
- Window close stops submission and releases native surfaces after the necessary
  work is retired. A raw window pointer is never a permanent GPU completion token.

Do not enable unfinished live-resource compaction. A correctly implemented
fallback/new allocation is preferable to experimental relocation that invalidates
views, descriptors or cached framebuffers. Compaction has its own acceptance
package covering every resource reference before production enablement.

## Compositor and damage

Introduce retained layers only where useful: scrolling clips, expensive effects,
static paragraph/image caches and transform/opacity animation. Do not allocate a
texture per widget. A full redraw remains a correct fallback.

Track damage from changed bounds, old bounds, filters, clip changes and dependent
layers. Match scene version and presentation damage; skipping a paint because
model bytes are unchanged is wrong when a device surface was recreated.

Handle obscured/minimized windows without continuous redraw. Presentation timing
is measured separately from CPU recording and GPU work; vsync settings alone do
not prove low input-to-photon latency.

## Interop and export

One window has one active presentation owner. Preserve the current prohibition
on attaching software, GL and GPU buffers concurrently to one native surface.
External video/GPU textures arrive through explicit acquire/release and color
contracts. Zero-copy is a capability, not an unconditional promise.

Print/export consumes a paint/document snapshot with an explicit target size,
font policy and color space. PNG export is not vector/PDF support. Consider Cairo
PDF or another provider only in an optional export package with tested pagination,
font behavior and cancellation; do not put a PDF engine in core painting.

## Acceptance gates

Replay the same paint fixtures through CPU and GPU paths: nested transforms,
rounded/path clips, alpha layers, gradients, stroke joins, images with padding,
text/fallback/color glyphs, palette/YUV/wide content and filters. Check resource
leaks and deterministic command ordering under allocation/device failures.

For Vulkan, require real drivers, validation layers, resize/minimize/reopen,
swapchain loss, texture cycling, in-flight destruction and pressure workloads.
Headless software screenshots do not close that gate.
