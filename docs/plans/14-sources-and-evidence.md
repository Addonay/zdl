# Primary sources and local evidence ledger

[Plan index](../../PLAN.md) · [Current state](00-current-state.md)

This plan was authored against local `794ddb2` on 2026-10-15. External pages were
consulted during planning. Their documented APIs/capabilities support narrow
facts; provider selection, architecture and numeric targets are recommendations,
not upstream endorsements or measured zdl results. Select actual dependency
versions through the feasibility/release gates, not a moving documentation page.

## Local source anchors

- [AGENTS.md](../../AGENTS.md): existing native naming, std reuse, ownership,
  private binding, runtime loading, compiler and Linux-first constraints.
- [Public root](../../src/root.zig) and [build](../../build.zig): current namespaces,
  source distribution, compile consumers and separate platform tests.
- [Integration plan](../integration-plan.md) and [porting ledger](../porting.md):
  recorded verification and explicit unsupported/incomplete areas. This planning
  turn did not rerun their test or hardware claims.
- [Platform](../../src/platform/linux.zig) and
  [graphics adapter](../../src/platform/graphics.zig): window/event ownership,
  native integration, capability differences and presentation ownership.
- [Event queue](../../src/events/queue.zig),
  [payload store](../../src/events/payload.zig),
  [timestamps](../../src/events/timestamp.zig): shallow payload leases, ordered
  removal and monotonic clock domain.
- [Surface](../../src/video/surface.zig),
  [conversion](../../src/video/convert.zig),
  [GPU renderer](../../src/render/gpu/renderer.zig): existing storage, color,
  command recording, cycling and format behavior to preserve/reconcile.
- [Image facade](../../src/image/image.zig),
  [options](../../src/image/options.zig),
  [animation helpers](../../src/image/animation.zig): options/result/metadata
  boundaries; presence of a type or enum does not prove implemented behavior.
- [Audio stream](../../src/audio/stream.zig) and
  [logical devices](../../src/audio/logical.zig): useful independent domain and
  transport layering.
- [Example UI root](../../examples/apps/ui/ui.zig),
  [runtime](../../examples/apps/ui/runtime.zig),
  [text](../../examples/apps/ui/text.zig),
  [widgets](../../examples/apps/ui/widgets.zig),
  [theme](../../examples/apps/ui/theme.zig): actual prototype architecture.
- [Canvas](../../examples/apps/ui/canvas.zig) and
  [SVG icons](../../examples/apps/ui/svg.zig): existing useful but bounded paint paths.
- [Player queue](../../examples/apps/player/media/queue.zig) and
  [application guide](../../examples/apps/README.md): bounded media ownership and
  explicitly stated application/accessibility/platform limits.
- [Validator](../../tools/validate.py) and
  [platform regression](../../tools/platform_test.zig): current finite-run and
  libc-boundary evidence infrastructure.

The preserved `.ref/SDL` and `.ref/translation_v1` remain local implementation
references, outside the package. They were not changed or archived by this plan.

## Text and Unicode

- [Pango overview](https://docs.gtk.org/Pango/): paragraph-oriented international
  text services and related Cairo/Fontconfig/FreeType integration libraries.
- [Pango rendering pipeline](https://docs.gtk.org/Pango/pango_rendering.html):
  itemization, shaping, breaking and rendering are distinct pipeline stages.
- [Pango cursor positions](https://docs.gtk.org/Pango/method.Layout.get_cursor_pos.html):
  byte indexes and strong/weak caret positions inform the proposed position model.
- [HarfBuzz manual](https://harfbuzz.github.io/): shaping's role in translating
  Unicode/font input into positioned glyphs; not a substitute for a document model.
- [Unicode UAX #29](https://www.unicode.org/reports/tr29/): segmentation reference.
- [Unicode UAX #9](https://www.unicode.org/reports/tr9/): bidirectional reference.
- [Unicode UAX #14](https://www.unicode.org/reports/tr14/): line-breaking reference.

No new Unicode version or text provider was selected/installed. A future adapter
must pin data/provider behavior, tailor it deliberately and verify actual scripts.

## Accessibility and interaction

- [AccessKit overview](https://accesskit.dev/) and
  [official C bindings](https://github.com/AccessKit/accesskit-c): verified existence
  of a custom-toolkit accessibility infrastructure and a C integration route.
  Packaging, callbacks and detailed text/virtualization coverage remain spike gates.
- [WAI-ARIA APG patterns](https://www.w3.org/WAI/ARIA/apg/patterns/): behavior reference
  for control families, not a claim that web attributes implement native accessibility.
- [APG modal dialogs](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/): focused
  reference for modal navigation, background interaction and restoration behavior.
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/): reference for testable accessibility
  outcomes. Native zdl conformance is not established by citing this document.
- [Microsoft UI Automation](https://learn.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32):
  official overview for future Windows accessibility integration.

The local UI/UX guidance produced relevant visible-focus guidance. Its
virtualization searches returned web-oriented results that were not a verified
native-toolkit match; those results were not adopted as native architecture
requirements. Virtualization choices here are engineering proposals to validate
against zdl workloads, not copied CSS heuristics.

## Painting, SVG, platform services and codecs

- [Cairo manual](https://cairographics.org/manual/): paths, transforms, fonts,
  image/recording surfaces and backend-independent drawing API reference.
- [Librsvg API](https://gnome.pages.gitlab.gnome.org/librsvg/Rsvg-2.0/): documented
  SVG load/render API and supported C entry points; actual resource policy,
  feature subset and distribution need validation for the selected version.
- [XDG Desktop Portal](https://flatpak.github.io/xdg-desktop-portal/docs/): system
  service mediation through D-Bus, including sandboxed application use.
- [libjpeg-turbo](https://github.com/libjpeg-turbo/libjpeg-turbo): official provider
  source for a future JPEG/TurboJPEG adapter evaluation.
- [libpng](https://www.libpng.org/pub/png/libpng.html): official PNG library source
  and capability/version reference. Do not assume all releases support APNG.
- [libwebp](https://chromium.googlesource.com/webm/libwebp/): official WebP provider.
- [libavif](https://github.com/AOMediaCodec/libavif): official AVIF library source.
- [libjxl](https://github.com/libjxl/libjxl): official JPEG XL implementation source.

These references justify evaluating providers rather than reimplementing every
codec. They do not establish provider performance on this repository's workloads,
or a safe ABI/version selection without the planned tests.

## Retrieval and evidence limits

Some attempted official AT-SPI/Fontconfig pages were unavailable through the
retrieval tool. The Apple NSAccessibility landing page required JavaScript and
did not expose its detailed contract; the attempted Vulkan landing page was also
unavailable. No detailed API claims from those failed page reads are treated as
verified. Future platform/provider packages must inspect primary headers/source
and native documentation on the relevant machines.

The plan also names alternatives (for example GTK/Qt, Yoga/Taffy, Skia/WebGPU,
ThorVG and optional specialized content libraries) as evaluation directions,
not a verified current feature/ABI matrix or a recommendation to install them now.
Their adoption requires its own exact-version primary-source review.

## Evidence to capture during implementation

For each selected provider/adapter retain: source revision/version, origin/license,
build artifact hash and architecture, supported ABI, required/optional symbols,
ownership/threading behavior, input/output policy, test corpus and native run
results. For each performance claim retain workload, code revisions, compiler,
provider settings, allocator, environment, output checks, repetitions and variation.

Update the architecture decisions when evidence changes. Keep observed source,
prior run records, proposals, implementation results and release claims visibly
separate. This is how the plan remains useful after the first implementation slice.
