# Widgets, styling, themes and application patterns

[Plan index](../../PLAN.md) · [Migration roadmap](12-migration-roadmap.md)

Status: proposed widget system. Extract behavior from the example toolkit; do
not freeze one dashboard's Tailwind dimensions or one media player's skin as the
library's universal design system.

## Component anatomy

Every shipped control has four parts:

1. A typed descriptor and controlled value/document binding.
2. An interaction state machine producing typed actions.
3. Layout/paint using shared primitives and resolved styles.
4. Semantic role, state, relationships and native actions.

Its acceptance fixtures cover all four. A rectangle that changes color on hover
is not a complete button. A row that looks selected but cannot be selected through
keyboard or accessibility APIs is not a complete listbox item.

Standard widgets generate their own semantics. Custom authors explicitly supply
semantics, focus behavior and hit geometry through supported interfaces.

## Primitive controls before large compositions

The first reusable set is label, button, link, checkbox/tri-state checkbox,
radio group, switch, text field, text area, slider, progress, separator and
scroll container. Add selection/listbox, tabs, disclosure, tooltip, menu,
combobox and dialog on the same focus/overlay model.

For each control specify enabled, disabled, hovered, pressed, focused,
focus-visible, selected/checked, invalid, busy, read-only and drag states where
applicable. These are not arbitrary booleans: define impossible combinations
and transition rules. Busy does not automatically mean disabled; a cancellable
operation needs an operable cancel action.

Activation, value changes and edits are distinct actions. Reading a checkbox's
current value does not consume an event; accepting an activation has a serial.
A frame painted twice must not repeat a domain command.

## Design tokens and style resolution

Separate semantic tokens from raw palette values: surface, raised surface,
foreground, muted foreground, accent, selection, error, warning, focus ring,
border, spacing, typography, density, radius and motion. Theme adapters may use
system settings or an application palette. Built-in themes are samples with
quality guarantees, not a compulsory brand.

Define the style precedence: engine defaults -> theme -> component role/variant
-> inherited text/direction/density -> instance overrides -> interaction state.
Make precedence observable in the inspector. Do not introduce full CSS selector
matching or arbitrary cascading rules unless a concrete application justifies it.

Styles are immutable/interned values or revisioned resources. Color-only changes
invalidate paint; typography/density changes can invalidate measurement/layout.
A theme switch updates the scene coherently, including native popup/IME appearance
where supported. High contrast and user font scaling are first-class variants.

Avoid fixed `u16` integer font-size or scale assumptions in the public contract.
Logical sizes can be fractional; physical pixel snapping is a paint decision.
Provide compact desktop and larger touch-friendly density presets with appropriate
focus/target behavior rather than one hardcoded 44-point rectangle everywhere.

## Accessible forms

A field has a visible label, optional description, validation state/message,
required/read-only/protected flags and a document/value binding. Errors are
associated semantically and announced at appropriate times. Placeholder text is
not a replacement for a label. Form validation can be synchronous or an explicit
asynchronous request with revision/cancellation handling.

```zig
// Proposed descriptor sketch; not a compiled API.
try update.text_field(.named("email"), .{
    .document = model.email_document,
    .label = strings.email,
    .description = strings.email_help,
    .validation = model.email_validation,
    .input_purpose = .email,
});
try update.button(.named("submit"), .{
    .text = strings.submit,
    .enabled = model.can_submit,
    .busy = model.submitting,
});
```

Do not bake application validation/business logic into the control. If validation
runs remotely, stale replies cannot overwrite the error state for newer input.

## Menus, popovers, dialogs and command palette

Use one overlay manager for ordering, modality, focus scopes, placement, dismissal
and native-surface ownership. Menus are not generic cards whose caller manually
handles Escape. Comboboxes combine editing, selection and popup behavior without
duplicating the text engine or losing IME ownership.

Tooltips support keyboard discovery and do not capture focus. Toasts do not steal
focus and expose announcement/timeout policies. Destructive confirmation defaults
must be explicit. Native menu integration consumes the same application command
registry, including enabled state and keyboard binding labels.

Command palettes filter application commands through a virtual list and shared
text field; they are a composition example, not a reason to add a global singleton.

## Data controls

A virtual list/tree/grid model offers stable keys, revisions, lightweight semantic
metadata, lookup/reveal and visible-range data. It does not expose mutable slices
that may relocate during layout. Typed registration helpers can adapt an
application model; any private type erasure stays behind a lifetime-checked
registration and is not public C-style userdata.

Data-grid requirements: column identity, sorting requests, selection modes,
resizing/reordering, pinned regions, keyboard cell navigation, clipboard export,
editing lifecycle and semantic row/column/header relationships. Pagination and
remote data loading remain application policies. Avoid allocating an editor
for every possible cell; retain the active document by logical cell identity.

Tree requirements: expand/collapse, typeahead/search, selection/focus independence,
logical depth/position, async loading, cancellation and stable state across moves.

Docking/splitters/tabs share a layout document and command/undo boundary. Define
minimum sizes, resize hit slop, keyboard movement, accessibility value actions and
multi-window transfer. A dockable panel's content/resources outlive its placement.

## Charts and specialized content

Charts use scale/axis/series models with retained data revisions and optional
level-of-detail sampling. Data decimation preserves an application's chosen
meaning; it is not a generic “skip every Nth point” visual trick. Hit testing and
accessible summaries refer to logical data, not tessellated triangle indexes.

Node graphs, timelines, waveform/image canvases and maps get reusable viewport,
pan/zoom, selection and coordinate-transform primitives. They do not each invent
an incompatible input capture or text system.

Terminal, Markdown, code and PDF views remain optional content hosts. Evaluate
established parsers/renderers where appropriate; a terminal needs a real terminal
state engine, a rich document needs a parser/model, and a code editor needs more
than colored glyphs. These integrations cannot block G1 controls/accessibility.

## Extension contract

A custom widget declares identity, state ownership, intrinsic measurement,
interaction/actions, semantic output, paint recording and invalidation. It can
compose standard controls without reaching into private node pools.

Do not provide an escape hatch that only paints arbitrary pixels and then claim
it inherits accessible interaction automatically. Support explicit embedded/native
surfaces separately, with focus/IME/accessibility subtree handoff and tested
bounds/clipping rules.

## Acceptance gates

Maintain a component gallery as executable contract documentation. Include
keyboard-only and screen-reader flows, loading/error/empty states, disabled/read-only
behavior, focus-visible styling, RTL, long translations, scale changes and theme
switches. Export semantic and paint snapshots for every state transition.

Migrate dashboard widgets to this gallery and back to the app. Migrate the player
controls through the same public API. A component is reusable only when its
second consumer does not need privileged example-specific branches.
