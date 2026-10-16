# Owned gradient brushes

`paint.Gradient` owns immutable linear or two-circle radial geometry and copied
stops. A packet retains each gradient identity once. Draw commands keep compact
resource IDs; existing solid-color command payloads and APIs remain unchanged.
Use `fill_rect_gradient`, `fill_rounded_rect_gradient`, `fill_path_gradient` or
`stroke_path_gradient`, then release the original gradient whenever convenient.

```zig
var gradient = try zdl.paint.Gradient.init(allocator, .{
    .linear = .{ .start = .{ .x = 0, .y = 0 }, .end = .{ .x = 200, .y = 0 } },
}, &.{
    .{ .offset = 0, .color = .{ .r = 0.1, .g = 0.8, .b = 0.9 } },
    .{ .offset = 1, .color = .{ .r = 0.5, .g = 0.2, .b = 1 } },
}, .{});
defer gradient.deinit();
try recorder.fill_rect_gradient(.{ .x = 0, .y = 0, .width = 200, .height = 40 }, &gradient);
```

Stops must be finite, ordered, in [0,1], with at least two entries. Equal offsets
retain insertion order; the last stop wins exactly at the boundary. Stops need not
start/end at 0/1: values between the domain edge and first/last stop clamp to that
stop. This ordering agrees with the [documented Cairo stop API](https://www.cairographics.org/manual/cairo-cairo-pattern-t.html#cairo-pattern-add-color-stop-rgba),
while interpolation is a separate explicit paint contract.

Default spread is pad; repeat, reflect and none are explicit options. Spread maps
the gradient parameter over [0,1]; none returns transparent outside that interval.
Linear endpoints must differ. Circle radii are nonnegative; identical circles and
two zero radii reject. Recorder validates transformed geometry before retaining a
resource. Geometry is local user space at the draw command, so a gradient may be
reused under different transforms.

Stops are straight colors in the gradient's declared policy. Interpolation first
premultiplies each stop, then linearly interpolates components and alpha. A fully
transparent blue stop therefore cannot introduce blue into a red fade. The
`GradientView.sample` reference returns a distinct premultiplied Sample type, uses
binary stop lookup, and handles spread/hard boundaries. Nonfinite parameters fail.
A resource's color policy must match the Recorder; no implicit color conversion
or HDR clamping is introduced. Cairo replay still rejects non-sRGB packet policy.

Defaults limit a resource to 4,096 stops and a packet to 16 MiB of unique retained
stop bytes. Header/container/native memory are excluded from that logical budget.
Clone/release ownership follows the atomic image/packet rules: keep allocator
contexts alive and support the final-release thread. Foreign resource lookup
through a Packet rejects, and recording errors poison finish without mutating an
old packet. Native backend patterns are not stored in the core resource.

## Cairo replay and current cost

The tested Cairo 1.18.4 native varying-alpha gradient produced a midpoint with
red=64, blue=64, alpha=128 for opaque-red to transparent-blue. The paint contract
requires red=128, blue=0, alpha=128. The backend does not weaken that contract:
constant-alpha gradients use the native fast path, while varying-alpha gradients
use an explicit premultiplied device-space raster source.

The fallback maps pixel centers through the current inverse transform, computes
linear/two-circle radial parameters and samples the core reference. Radial sampling
chooses the greatest finite root with nonnegative radius; points without a valid
root or underdetermined linear cases become transparent. Unrepresentable geometry
or inverse-transform arithmetic returns a capability error. The source raster uses
nearest device sampling; Cairo supplies path/stroke coverage and compositing.
This is a defined pixel-center reference, not analytic subpixel gradient integration.

Raster sources cache by resource identity and actual Cairo transform; native
constant-alpha patterns cache by identity. Replay admission conservatively counts
one full-target buffer per varying-alpha draw, including repeated draws that may
hit the cache, before creating native output. Zero-area/empty gradient draws skip
that work. Actual raster reuse may require less memory, but native path/scratch
memory is not included. Full-target generation is deliberately a correctness-first
prototype: tiled/clipped generation, profiling, native allocation fault injection,
complex radial edge conformance and GPU equivalence remain gates. No native speed
or low frame-latency claim is made.

Four core fixtures cover retention/copy/order, policy/geometry/limits/saturation,
all allocation failures and the float spread/alpha reference. Two added Cairo
fixtures cover all four gradient draw forms, transformed reuse, clipped opacity
groups, radial fading, spread/hard edges, working-buffer admission and pattern/raster
cleanup under Zig allocation failures. Results remain scoped to recorded providers.
