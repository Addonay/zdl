# Modules, dependency boundaries and public API

[Plan index](../../PLAN.md) · [Runtime](02-runtime-ownership-and-concurrency.md)

Status: proposed. The diagrams describe dependency direction, not implementation
files already present in the checkout.

## Decision: one package, explicit logical layers

Keep one source-distributed zdl package initially. Introduce logical boundaries
before creating independently versioned packages or many named Zig modules.
Unreferenced GUI declarations must not affect a core consumer. A physical split
is justified only by measured build cost, independent release needs or an ABI
boundary, not by a target file count.

The conceptual dependency order is:

```text
application model / optional application shell
    -> ui + widgets + optional content hosts
    -> layout + text + semantics + paint recording
    -> domain/resource contracts + explicit host services

paint executor -> render/device backends -> optional system libraries
text adapter  -> optional text/font libraries
AX adapter    -> optional native accessibility libraries
platform adapter -> window/input/presentation libraries or kernel interfaces

core algorithms <- no upward GUI/application/provider dependencies
```

`ui` talks to a typed host contract, not directly to Xlib, Wayland or Vulkan.
`layout` does not own windows, fonts or accessibility objects; it asks a text
measurement interface and returns geometry. `paint` does not interpret widgets.
`accessibility` observes semantic state and requests actions; it never edits the
application model behind the UI owner's back.

## Proposed public namespaces

- `zdl.geometry`, `pixels`, `surface`, `events`, `audio`, `image`, `fs`: retain
  independent use and migrate existing callers deliberately.
- `zdl.platform`: portable contracts and configured platform implementations.
  Keep `zdl.linux` available during migration; no surprise cross-platform claim.
- `zdl.text`: immutable layout results, font selection, documents and positions.
- `zdl.layout`: constraints/results and the adapter contract; zlay-specific
  declarations remain implementation details or an explicit advanced adapter.
- `zdl.paint`: owned display lists, paths, clips and resource references.
- `zdl.render`: high-level renderer/resource entry points and backend capabilities.
- `zdl.gpu`: typed GPU device API for advanced users; Vulkan internals move to an
  explicitly backend-specific namespace rather than defining every GUI API.
- `zdl.ui`: retained engine, update builder, focus/action APIs and semantics.
- `zdl.widgets`: standard widget descriptors/behavior, built on `ui` contracts.
- `zdl.app`: optional convenient runtime and application services.

Prefer `zdl.render.Renderer`, `zdl.render.Texture`, `zdl.ui.Ui` and
`zdl.image.load_png` over repeating implementation filenames. Flatten only the
common surface; do not flatten hundreds of specialized declarations into `zdl`.

## Inclusion profiles are part of the API

Separate three decisions:

1. **Compiled:** which providers/feature families can be referenced at all.
2. **Available:** which compiled providers have compatible libraries, devices
   or desktop services in this process.
3. **Selected:** which available provider handles this operation/window.

Proposed profiles: `core`, `headless_ui`, `linux_desktop`, `direct_display`,
`media_tools`, plus explicit application overrides. They select capabilities,
not optimization levels. ReleaseSafe must not silently use different layout,
text segmentation or interaction semantics than Debug.

A configured type should make disabled branches structurally absent:

```zig
// Proposed interface sketch; not compiled.
const Desktop = zdl.platform.PlatformFor(.{
    .window_backends = .{ .wayland = true, .x11 = true },
    .direct_display = false,
    .graphics = .{ .software = true, .vulkan = true },
});

const Input = zdl.joystick.RegistryFor(.{
    .drivers = &.{ .evdev, .ps5 },
});
```

The ordinary default remains easy to use. Do not require applications to
construct their own vtables to open a window. Keep specialized profiles stable
and inspectable; avoid a giant configuration generic copied through every widget.

A request to select a disabled backend returns a precise configuration error.
Automatic selection tries only enabled, compatible candidates and records its
reasons. Failure of optional Vulkan may permit a configured CPU fallback;
failure of required accessible text must not quietly become ASCII-only text.

## C dependencies and module identity

Keep C declarations, raw callbacks, layouts and function tables in private
binding files. Wrap opaque pointers as typed owned objects or checked handles.
Expose capabilities and typed errors rather than library status integers.

Do not place unconditional `link_libc = true` on a supposedly optional module
and assume declaration laziness removes its build/link flags. Verify the final
consumer. The current design of explicit application libc linkage is a useful
baseline; a later build helper may configure it from selected features.

If named modules are introduced, create each foundational module **once** and
share that exact instance with dependents. Compiling the same source file as
several module roots risks duplicate nominal types and file-ownership errors.
An umbrella must re-export canonical types, not recreate `WindowId`, `Color`,
`Allocator` wrappers or resource tables in parallel.

## API conventions

- PascalCase types, snake_case functions, meaningful enum variants.
- Explicit allocator and `std.Io` where ownership or I/O requires them.
- `init`/`deinit` for movable values; `create`/`destroy` for stable allocated
  objects. Document exceptions and the exact allocator/thread used by teardown.
- `View`/`Borrow` results identify their owner and invalidation boundary.
  `Owned`/`Snapshot` results provide explicit release or `deinit`.
- Distinguish logical points, device pixels, document offsets and monotonic time
  by types or strongly named fields. Do not pass a naked `usize` across all domains.
- Do not use `anyerror` as the permanent high-level API. Domain error sets plus
  an owned diagnostic retain useful backend context without thread-local strings.
- Do not expose mutable renderer, node-pool or backend function-table fields as
  supported application configuration. Advanced access is explicit and scoped.
- Zero-sized views may remain valid in core algorithms; zero drawable window
  extents suspend rendering rather than attempting an invalid swapchain.

## Failure and capability reporting

A capability answers whether an operation can be honored under the requested
contract. Examples: native popup, IME surrounding text, extended-linear output,
clipboard image, accessibility text ranges, external texture import.

A diagnostic includes operation, provider, requested feature, actual limitation,
recoverability and bounded copied detail. Missing a shared library differs from
an unsupported symbol/version, denied device, lost surface or invalid app input.
Optional-library discovery does not pre-open devices during unrelated imports.

```zig
// Proposed contract sketch.
pub const Capabilities = struct {
    text_input: bool,
    accessible_text_ranges: bool,
    fractional_scale: bool,
    native_popups: bool,
    hdr_output: bool,
};

pub const Diagnostic = struct {
    operation: Operation,
    provider: ProviderId,
    code: FailureCode,
    detail: OwnedText, // explicitly copied, with bounded length and deinit
};
```

Do not conflate static backend capability with a currently permitted operation.
A portal can exist while the user denies a request; a display can support HDR
while the chosen surface/profile does not.

## Compatibility and migration

Keep existing low-level interfaces until replacement paths have real callers.
Introduce aliases for common spelling changes where semantics remain identical.
Do not alias an owning image to a borrowed view, or an old device pointer to a
generational handle, just to claim source compatibility.

Publish an old-to-new API map, examples, compiler version and feature differences.
Use a small compatibility namespace with a removal milestone; do not rebuild
SDL's global initialization, allocator hooks or dynapi as the compatibility layer.

## Acceptance gates

- A nontrivial geometry-only consumer links without libc or GUI/provider symbols.
- Native image/audio algorithms remain usable without the windowing runtime.
- Disabling a backend removes its code/library names from measured artifacts.
- Two independent consumers agree on canonical public type identity.
- Missing-library and disabled-feature scenarios produce actionable diagnostics.
- Public API examples are converted into compile consumers during implementation.
- No implementation-only namespace is accidentally promoted by recursive exports.
