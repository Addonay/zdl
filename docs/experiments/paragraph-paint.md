# Paragraph raster to owned paint integration

Run `python3 tools/audit_paint_text_spike.py`, or opt into `--paint-text-spike`
in the main validator. This headless Linux experiment requires the runtime
Pango/PangoCairo/GObject/Cairo providers and fonts. It is separate from the
Cairo-only `--paint-spike`; ordinary library consumers acquire no new dependency.

`paragraph.Snapshot.rasterize_styled` now supports an explicit foreground,
optional background, selection and cursor colors. Colors are finite normalized
straight sRGB. Existing rasterize/decorated methods delegate to the same code
with their original opaque white/black defaults; existing clients keep those
results. A null background preserves transparent native ARGB32 pixels.

`tools/spikes/paint/text.zig` copies a stable, flushed native ARGB32 bitmap into
an immutable `paint.Image` resource. It reads native-endian AARRGGBB words,
validates premultiplied channels, then unpremultiplies with rounded integer math.
Replay's rounded premultiplication preserves valid original 8-bit premultiplied
texels. This does not recover original high-precision straight colors or certify
linear/HDR text composition. Input pixels/provider objects are borrowed only
through capture; the returned Raster contains no native pointer or callback.

The Raster retains the bitmap's logical-layout origin in pixels, including
negative-ink offsets and padding. `draw` subtracts that origin and divides raster
dimensions/offsets by explicit pixels-per-unit before recording an image command.
The caller supplies a matching device transform. Recording retains a separate
image lease, so the Raster, paragraph layout, bitmap and provider handles may all
end before packet replay. Raster clone supports another cache/state owner without
retaining the provider. Allocators and their contexts must outlive all image leases.

Layout/caret/hit-test owners remain separate: this bitmap does not replace a
paragraph snapshot needed for interaction. Device scale, font, text, width, style
or decoration changes require suitable layout/raster invalidation. No cache key,
font epoch, retained text layout, glyph export, IME bridge or public text service
is implemented by this capture adapter. Bitmap scaling is not reflow or reshaping.
The maximum capture size defaults to 64 MiB; temporary RGBA adaptation and the
final immutable copy each allocate that many logical bytes in addition to the
native source. No zero-copy/precision/per-frame performance claim is made.

Five fixtures in Debug/ReleaseSafe verify mixed-script Pango pixels after every
provider owner ends, matching origin at two pixels per logical unit, all 65,536
channel/alpha combinations (valid channel values clamped to alpha), capture/record
allocation failures and input limits/validation, legacy default output equality,
and zero-area descriptors with a very large declared row count.
The native framebuffer comparisons are exact texels at integer-aligned nearest
sampling; they are not portable font/antialiasing goldens. A selected mixed-script
paragraph with caret is also captured and replayed in the 480x220 visual artifact;
both modes must produce identical PNG bytes on the same recorded provider/fonts.

This is a provider-consistent CPU raster path into existing paint image commands,
not GPU glyph/atlas conformance, a native window/editor/screen-reader pass or a
finished text contract. Provider mappings remain resident under the existing
Pango static-type policy; owned layout/bitmap objects are explicitly destroyed.

The zero-area case also found and fixed row-count traversal in core paint image
copy: an empty-width resource now skips pixel rows before issuing its immutable
lease. Both capture and core copy preserve zero-sized storage without work
proportional to an otherwise irrelevant height.
