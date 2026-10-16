# Platform adapters, interoperability and distribution

[Plan index](../../PLAN.md) · [Verification](11-validation-performance-and-tooling.md)

Status: proposed. Linux is the first complete target. Contracts may anticipate
other systems, but support claims require their own machine/runtime evidence.

## Platform boundary

The semantic GUI needs windows, input/text input, time/wake integration,
presentation, clipboard/drag sessions, accessibility and optional desktop services.
It must not know the Xlib/Wayland/Vulkan structure layouts implementing them.

Retain explicit environment and allocator inputs. Backend selection is a runtime
policy over enabled implementations. Expose capabilities and reasons for missing
features; the differences between desktop windows, headless surfaces and direct
DRM output cannot be erased by giving them the same method names.

An application can use standalone platform windows without UI. An embedded UI
can borrow a host surface/input stream without opening another platform connection.
Both paths use the same coordinate, ownership and action contracts.

## Linux desktop release gate

Wayland and X11 must each demonstrate real multi-window lifecycle, resize,
minimize/restore, fractional scale transitions, focus, keyboard layout, IME,
clipboard text/image, drag/drop, cursor themes and accessibility integration.
Document protocol/compositor-specific limits rather than emulating impossible
operations (such as freely positioning a Wayland toplevel) with false success.

Custom decorations remain optional policy. Respect desktop button order,
window-menu actions, resize hit areas, activation and accessibility. Evaluate a
maintained decoration helper where it materially improves interoperability;
do not make KDE-specific visuals or control order universal.

Use [desktop portals](https://flatpak.github.io/xdg-desktop-portal/docs/) for
appropriate system-mediated dialogs/settings/permissions, with D-Bus requests
and completions integrated into the owner loop. A portal service existing does
not mean an operation was permitted. Handle cancel, denial, disappearance and
window close distinctly.

Native popups and in-window overlays have different constraints. Preserve that
capability boundary in menus, comboboxes and tooltips. Multi-seat/touch/tablet
support requires actual routing/capture and relevant hardware/protocol tests.

## Direct display and headless

KMS/DRM is an explicit application choice with VT/session/device ownership,
input availability and restoration obligations. Do not probe/open it merely
because desktop connection failed. Preserve VT release/acquire semantics and
rebuild graphics targets according to their backend lifetime contract.

Headless UI uses deterministic fonts, clock and size/scale inputs. It can provide
semantic/action and paint testing, snapshots and supported exports. It does not
validate compositor popup rules, physical audio, native IME or real accessibility
registration. Null-device runs must be labeled as such.

## Windows and macOS contracts

Plan adapters against the same window scenes/documents/paint/semantic contracts.
Windows work includes DPI, message/event ownership, text input/composition,
clipboard/OLE-style drag/drop, menus, accessibility, graphics and packaging.
macOS work includes main-thread application lifetime, text input, menus/services,
accessibility, backing scale and native window control conventions.

Use system text/accessibility integrations where they fit the contract. Pixel
identity across different system fonts is not a portability promise. Deterministic
fixtures pin fonts/providers; native integration tests verify native expectations.

Do not start platform implementations in this Linux planning task. Preserve
reference platform code and assess required Objective-C/C++ glue on those
machines. Private bindings are allowed; public API leakage or temporary native
module-to-module ABI bridges are not the target architecture.

## Optional-library loading policy

Every provider declares: soname/artifact selection, supported ABI/version range,
required versus optional symbols, initialization/thread model, ownership and
unload preconditions. Feature discovery happens when that provider is requested,
not when importing `zdl` or converting a rectangle.

Prefer runtime loading for optional platform/system libraries. A directly linked
provider is acceptable when loading is impractical, but must be selected through
an explicit build/application profile. Keep a minimal core consumer and dependency
manifest regression in CI so an innocent umbrella import cannot add libc/Pango.

Version numbers alone are not layout validation. Prefer opaque handles and
accessors; verify every necessary exposed structure against supported headers,
architectures and ABI calls. Never assume an x86_64 prefix layout is portable to
all Linux targets. Audit error callbacks and retained pointers, not only sizes.

Unloading requires all provider objects, worker jobs, callbacks and GPU/native
references to be quiescent. Keeping a provider loaded for runtime lifetime is a
valid documented policy; pretending it can be unloaded while its objects live
is not an optimization.

## Dependency delivery choices

Support two explicit deployment models for selected optional providers:

- **System:** discover compatible installed libraries, report capabilities and
  minimum requirements, and rely on distribution packaging for updates.
- **Bundled:** pin reproducible artifacts/build inputs with architectures,
  licenses/notices, exported-symbol/ABI checks, hashes and an update procedure.

Ordinary consumers should not need to build a Rust/C++ toolchain merely to use
a prebuilt C ABI provider. Maintainers may build those artifacts in controlled
jobs. Runtime dynamic loading does not eliminate transitive dependencies or
license obligations; keep a per-profile dependency record.

Do not download libraries or fonts automatically on application startup. Applications
choose their installers, update channels and asset sources. Ensure useful errors
when optional data/fonts/locales/plugins are absent in a minimal installation.

## Packaging and settings

The toolkit provides documented hooks for app identity, icons, settings/appearance,
file associations, dialogs and resource lookup. It does not silently create an
application's global configuration or choose a secret store.

Validate desktop entry/icons, portal parent identities, library search paths,
font/cache behavior, scale and accessibility in a clean distribution environment.
A developer machine with many installed providers is not a packaging test.

Keep debug inspector support separable from production artifacts. Source packages
exclude reference trees, build caches, test captures and local machine paths.
Preserve origin/license notices for SDL-derived and other adopted code.

## Embedding and extension boundaries

Hosts explicitly provide event delivery, draw targets, scale/color information,
clipboard/IME/AX routing and lifecycle notifications. Embedded external surfaces
need clipping/transform, focus and semantic subtree integration; do not market
an arbitrary native child window as a universally composable widget.

Keep advanced GPU interop scoped to borrowed device/session resources and fence
leases. Application-owned graphics remains application-owned. Destroying a UI
must not destroy a host's shared device or font provider unexpectedly.

## Acceptance gates

- Clean environment starts with core only, full desktop providers, and selectively
  missing providers; each result is explicit and stable.
- Wayland and X11 run real native workflow/IME/AX suites on KDE/GNOME-style sessions.
- Direct-display and headless capabilities are documented separately.
- A host loop/device can embed, detach and recreate a UI without resource leaks.
- Packaging tests use supported architectures/ABI ranges and retained notices.
- Windows/macOS support is declared only after their own native release gates pass.
