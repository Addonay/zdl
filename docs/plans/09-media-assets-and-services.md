# Media, assets, documents and optional services

[Plan index](../../PLAN.md) · [Rendering](06-paint-rendering-and-compositing.md)

Status: proposed evolution of the whole media foundation alongside GUI work.
Do not let GUI development regress independent image/audio/device consumers.

## Image contract before more codecs

Keep encoded bytes, decoded storage and renderer resources distinct. Decoded
images retain dimensions, pixel layout/stride, alpha convention, color encoding,
orientation and metadata policy. An owning image and a borrowed view are not
interchangeable. A frame sequence is not silently reduced to one image when the
caller requested animation.

Metadata lifetime must be independent of temporary decode inputs when results
escape to jobs/caches. A synchronous probe may borrow encoded bytes with an
explicit lease. An asynchronous owned result must copy selected metadata or
retain an encoded-source lease; it cannot keep `Info.exif` slices into a worker's
freed input buffer. Test freeing/reusing the encoded buffer immediately after
return/completion for each declared ownership mode.

Separate `probe`, `decode`, `decode_into`, sequence decoding and encoding. A
recognized signature reports recognition; decoder availability and enabled
features are separate queries. Unsupported options must fail or be reported
through an explicit negotiation result, never be silently ignored.

Review the current grouped options for actual behavior: frame selection, thread
count, resize/crop ordering, color conversion, orientation, alpha, checksums and
input/output limits. Make the documented operation order independent of build
optimization mode. Output precision must not be reduced merely to fit the GUI's
ordinary RGBA8 texture path.

## Native versus external providers

Do not rewrite every mature codec to preserve a “pure” label. Retain native
PNG/JPEG/QOI/BMP/TGA/PNM/GIF/WebP paths where correctness and measured value
justify them. Use them as independent/fallback implementations when useful;
maintaining two decoders still carries real maintenance cost.

Recommended optional production candidates, selected per profile/workload:

- [libjpeg-turbo](https://github.com/libjpeg-turbo/libjpeg-turbo): evaluate its
  opaque TurboJPEG interface for JPEG throughput and less exposed ABI surface.
- [libpng](https://www.libpng.org/pub/png/libpng.html): mature PNG provider and
  differential oracle; APNG support is version/feature-specific, not assumed.
- [libwebp](https://chromium.googlesource.com/webm/libwebp/): WebP provider/oracle.
- [libavif](https://github.com/AOMediaCodec/libavif): AVIF container/codec integration
  rather than treating AV1 frame decoding alone as AVIF support.
- [libjxl](https://github.com/libjxl/libjxl): JPEG XL provider, including precision,
  metadata and animation capabilities only when actually bound/tested.

`auto` selection may choose an enabled provider only when it can honor requested
semantics. Record the chosen provider/version in diagnostics and benchmark logs.
A native/external fallback can have defined lossy pixel tolerances; it cannot
silently change orientation, color handling, limits or frame selection.

Each binding has one private ABI layer, symbol/version checks, allocation/error
translation and teardown tests. Prefer opaque handles/accessors. Do not permit
`longjmp` across arbitrary Zig frames as an undocumented error strategy.

## SVG and vector assets

The current example SVG icon parser remains a useful constrained path. Expose it
as such. General desktop SVG should use an optional
[librsvg](https://gnome.pages.gitlab.gnome.org/librsvg/Rsvg-2.0/) adapter first;
ThorVG is an evaluation candidate if a lighter/vector-animation profile warrants
its own capability/quality evidence. Do not promise full SVG/CSS/text compatibility
from an icon-only path parser.

SVG load and raster/paint are separate operations with bounded input, dimensions,
recursion, filters and referenced resources. Default asset loading performs no
network fetch and does not grant arbitrary filesystem access. Verify each chosen
provider's actual resource-resolution API/security behavior before exposing a
resolver contract; if it cannot enforce the requested policy, use process
isolation or reject that mode.

Raster cache keys include content revision, size/scale, tint/style inputs and
provider policy. Multi-color/document SVG must not be treated as a monochrome
mask. Cache admission and in-flight lifetime follow ordinary resource leases.

## Asset service

Make the asset service optional and application-owned. It composes caller-supplied
I/O with decoders and resource registries; it is not an implicit global filesystem
or network client. Support embedded bytes, file sources and application resolvers.

A request includes identity/revision, desired representation, priority, cancellation
and limits. Deduplicate concurrent requests for the same immutable asset policy.
Separate metadata, decoded CPU frames, thumbnails, paragraph/vector caches and
GPU upload state; releasing one consumer does not destroy another consumer's lease.

Use byte budgets, bounded work queues and visible cache statistics. Retain
original compressed data only by policy. Decode bombs are constrained by pixel,
frame, metadata and work policies; opaque provider allocations may require an
isolated worker process for hard process limits.

```zig
// Proposed asynchronous request sketch.
const ticket = try assets.request_image(.{
    .source = .{ .embedded = logo_bytes },
    .limits = upload_policy,
    .representation = .{ .thumbnail = .{ .max_edge = 256 } },
    .owner = window_epoch,
});
// Completion owns its result; stale/cancelled outcomes are still released.
```

## Audio and video integration

Keep transport/mixing/resampling independent from GUI. The UI controls commands
and displays observations; it does not execute the real-time audio callback or
block the mixer to wait for layout/painting.

For video, promote useful player concepts only after contract review: bounded
queues, seek generations, clocks, frame ownership and decode completion. Frame
objects retain color/format/stride and an explicit CPU/GPU release lease. A media
seek invalidates old outcomes by generation; the UI discards and frees them.

Define audio master-clock versus video/external-clock operation, drift policy,
pause semantics, underrun behavior and bounded buffering. Translate media sample
positions into host-monotonic estimates with uncertainty/latency metadata; do not
pretend a raw timestamp from any decoder is already a library event timestamp.

FFmpeg is a legitimate optional provider. Replace unsafe version-sensitive struct
prefix access with a supported binding/accessor strategy and explicit ABI support
matrix. Do not weaken the existing version guard merely to make an unverified
installation run. Hardware decoding/zero-copy need separate capability and
lifetime acceptance on actual drivers.

Video widgets are content hosts with ordinary focus, overlay controls, captions,
accessible playback commands and correct tone mapping. Subtitles are timed text
or a dedicated subtitle renderer, not a hardcoded string over each frame.

## Other services and content

Reuse existing D-Bus/dialog/notification/tray/power facilities through optional
host services. Portal requests have lifetime/cancellation and parent-window
identity; displaying a dialog must not stall the GUI owner indefinitely.

Do not wrap all of std or build an application database abstraction into core.
Optional integrations can cover settings persistence, document export, Markdown,
syntax trees, terminal surfaces and PDF. Each needs a concrete consumer, stable
content-host boundary and its own dependency/permission/license review.

## Acceptance gates

- Owned decode, decode-into and sequence APIs meet explicit limits/metadata rules.
- Provider fallback preserves semantic options and exposes any negotiated loss.
- Independent codec corpora and malformed/failure fixtures check actual pixels.
- Cancelling or closing during decode/upload/seek never leaks or publishes stale data.
- Audio remains deadline-safe while the UI stalls or resizes.
- Video frame/texture teardown works with pending GPU work and device loss.
- A core/image-only application can exclude all GUI/media-service providers.
