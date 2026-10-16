# Input, focus, semantics and accessibility

[Plan index](../../PLAN.md) · [Widgets](08-widgets-and-design-system.md)

Status: required GUI contract with an initial [transactional semantic model](../ui-semantics.md).
Accessibility remains a native release gate for the first usable GUI; the model
is not an AccessKit/AT-SPI implementation or screen-reader certification.

## Input routing

Normalize platform events into a window/seat/pointer domain, preserving monotonic
timestamps, button identity, source and relevant raw protocol metadata separately.
Dispatch against the committed transform/clip/hit-test snapshot.

Define capture, target and bubbling phases, with explicit handling/default-action
results. A custom control can participate without stealing every event globally.
The hit-test order matches paint/layer order and excludes clipped, inert, disabled
or non-hittable transformed content according to documented rules.

Pointer capture belongs to a live node and pointer ID. Release/cancel it on button
sequence completion, device loss, window deactivation or node removal. Enter/leave
and hover are distinct from capture; dragging outside a button does not turn its
release into activation unless its interaction contract says so.

Use semantic actions to unify pointer, keyboard and assistive activation. Do not
synthesize arbitrary mouse clicks to make accessibility “work.”

## Focus scopes

A window has active focus plus a stack of scopes: ordinary content, menus,
nonmodal panels and modal dialogs. Distinguish keyboard focus, pointer hover,
text-input ownership, selected item and accessibility reading position.

- Tab follows the defined logical navigation order; Shift+Tab reverses it.
- Composite controls use roving focus/active descendants as appropriate rather
  than hundreds of unrelated tab stops.
- Disabled/removed/inert controls cannot keep actionable focus.
- Opening/closing a modal repairs focus deliberately and restores its invoker
  or a documented logical fallback if that invoker no longer exists.
- Focus reveal accounts for clipping, scrolling, sticky regions and popups.
- Focus indicators remain visible in high-contrast/dark themes and under zoom.

Use [APG patterns](https://www.w3.org/WAI/ARIA/apg/patterns/) as behavior references,
not as native API implementations. The [modal pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/)
provides useful expectations for contained navigation and focus restoration.
Native semantics still need native accessibility mappings; adding ARIA strings
to an internal struct is not a Linux accessibility implementation.

## Activation and gestures

Buttons activate on the documented successful release/keyboard action, not any
pointer-down that later becomes a drag. Space, Enter, repeat and default/cancel
button behavior are control/platform policies, with one final activation per
accepted interaction. Never run the same destructive command through both key
and text events.

A gesture arena resolves competing tap, long-press, drag, scroll and selection
recognizers. Losing recognizers receive cancellation. Multi-pointer and pen
pressure/tilt data do not get flattened into one global mouse-down boolean.
Trackpads and wheel devices keep meaningful units; touch target expansion must
not make neighboring controls ambiguous.

Drag/drop defines offered MIME types, asynchronous reads, ownership, cancellation,
allowed actions and external versus intra-app routes. Dropping text/files does
not grant the library permission to open or execute them automatically.

## Keyboard shortcuts and commands

Use an application command registry with stable command IDs, labels, enabled
state and key bindings. Scope resolution is explicit: composition/editing takes
precedence where appropriate; window/menu/application commands follow. Bindings
are locale/platform aware and can display the current mapping.

Do not hardcode Ctrl for all systems or assume a keyboard scancode identifies a
character in the active layout. Keep physical shortcuts and logical shortcuts
separate. Focused text editing gets normal copy/paste/select/undo behavior through
the document engine, not duplicated widget-specific key handlers.

## Semantic tree

Generate a semantic tree from committed widget intent, not a reverse-engineered
picture of the render commands. Nodes carry role, accessible name/description,
value/state, relationships, supported actions, bounds, focus, selection and text
information where appropriate.

```zig
// Proposed semantic description sketch.
try update.semantics(node, .{
    .role = .slider,
    .name = "Volume",
    .value = .{ .number = .{ .current = 0.65, .min = 0, .max = 1 } },
    .actions = .{ .set_value = true, .increment = true, .decrement = true },
});
```

Node IDs survive repaint and materialization. Decorative icons and repeated text
are omitted/merged intentionally; icon-only controls still have useful names.
Relations refer to live semantic IDs. Announcements, validation errors and loading
state are updated without flooding assistive technology with every paint frame.

Semantic actions marshal to the UI owner and run the same control behavior as
ordinary input. Validate stale target/revision/permissions; an old native request
cannot invoke a new control that reused its slot.

## Recommended native bridge

Evaluate [AccessKit](https://accesskit.dev/) through its
[C bindings](https://github.com/AccessKit/accesskit-c) as the first bridge. It is
specifically aimed at custom-rendered toolkits and provides a cross-language
boundary. This is a recommendation, not a claim its current C API meets every
zdl requirement without a prototype.

The feasibility gate must demonstrate:

- Linux session-bus/AT-SPI integration and real screen-reader navigation.
- Text offsets, selection/caret geometry and actions for an editable document.
- Virtual collections with offscreen item identity/materialization.
- Thread/callback quiescence on window/runtime destruction.
- A deployable pinned C artifact, version detection and clear missing-library
  behavior without forcing Rust tooling on ordinary source consumers.

If that gate fails, implement a Linux AT-SPI adapter over the same semantic
contract or adjust the dependency strategy. Do not redesign every widget to fit
an incomplete bridge. Later Windows [UI Automation](https://learn.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32)
and macOS accessibility are validated on their platforms; cross-platform source
compilation is insufficient.

## Text and virtual collections

Native text APIs use different index conventions. Translate from versioned UTF-8
positions to required scalar/UTF-16 units in one adapter, with bounds checking
and tested reverse mapping. Report selection, line/word ranges, read-only and
protected state consistently with editing behavior.

A virtual list exposes its logical count, positions and item semantics without
building a full paint tree. An assistive request to inspect/focus an offscreen
item may ask the model to materialize/reveal it. Bound that work and define
loading/unknown states; do not pretend offscreen items disappeared.

Measure semantic storage separately from materialized paint nodes. If a bridge
requires lightweight semantic records for every logical item, declare and budget
that O(n) cost; do not claim total memory is O(visible rows). If it cannot support
needed lazy access, choose a tested alternative or limit the advertised capability
explicitly. Silently hiding offscreen items is not an acceptable workaround.

For a virtual table, logical rows/columns, headers, selection and editable cells
remain one semantic model even when pinned panes are painted separately.

## Accessibility and visual quality requirements

Use [WCAG 2.2](https://www.w3.org/TR/WCAG22/) as a useful design/test reference,
not as an automatic native-app conformance certificate. Establish contrast,
keyboard operation, alternatives to color-only meaning, motion preferences,
labels/errors and visible focus for shipped themes.

Distinguish ordinary non-obscured focus expectations from the stronger enhanced
criterion; do not label an AAA requirement as AA. Touch-friendly defaults can
provide larger targets without imposing web pixel heuristics on every dense
native desktop control. Offer density and input-mode policies with tests.

Reduced motion, high contrast, font scaling, RTL and system appearance changes
are live inputs to style/layout, not startup-only booleans.

## Automation contract

Expose a test driver over semantic IDs/roles/actions and document operations.
Do not give tests privileged mutation paths that bypass disabled state, modal
restrictions or validation. Keep an independent native bridge path so internal
semantic snapshots do not mask failures in real AT-SPI/UIA/AX integration.

## Acceptance gates

- Keyboard-only completion of settings, search, dialog, table and editor workflows.
- Screen-reader names, roles, state changes and text selection with real clients.
- Focus/capture repair after removal, reorder, deactivation and modal nesting.
- No duplicate activation during IME/shortcut handling or rapid event batches.
- Drag/scroll/selection recognizer cancellation and multi-pointer isolation.
- High contrast, reduced motion, magnification and virtual-item navigation.
- Query/action traffic racing with window destruction cannot access freed state.
