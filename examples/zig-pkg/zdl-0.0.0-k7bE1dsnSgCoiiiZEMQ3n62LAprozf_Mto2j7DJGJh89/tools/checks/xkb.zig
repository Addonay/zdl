const std = @import("std");
const zdl = @import("zdl").xkb;

const sample_keymap =
    \\xkb_keymap {
    \\  xkb_keycodes "sample" { <AE01> = 10; <LFSH> = 50; <LALT> = 64; <LVL3> = 92; };
    \\  xkb_types "sample" {
    \\    virtual_modifiers LevelThree, Alt;
    \\    type "ONE_LEVEL" { modifiers = none; level_name[Level1] = "Any"; };
    \\    type "TWO_LEVEL" { modifiers = Shift; map[Shift] = Level2; level_name[Level1] = "Base"; };
    \\  };
    \\  xkb_compatibility "sample" { virtual_modifiers NumLock; };
    \\  xkb_symbols "sample" {
    \\    name[Group1] = "Sample";
    \\    key <AE01> { type = "TWO_LEVEL", symbols[Group1] = [ 1, exclam ] };
    \\    key <LFSH> { [ Shift_L ] };
    \\    key <LALT> { [ Alt_L, Meta_L ] };
    \\    modifier_map Shift { <LFSH> };
    \\    modifier_map Mod1 { <LALT> };
    \\  };
    \\};
;

fn exercise(library: *const zdl.library.Library) !void {
    var keymap = try zdl.keymap.Keymap.from_text(library, sample_keymap);
    defer keymap.deinit();
    _ = keymap.min_keycode();
    _ = keymap.max_keycode();
    _ = keymap.layout_count();
    _ = keymap.layout_name(0);
    _ = keymap.modifier_mask(.alt);
    _ = keymap.modifier_mask(.level3);
    _ = keymap.level_count(10, 0);
    _ = keymap.level_keysyms(10, 0, 1);
    var masks: [16]u32 = undefined;
    _ = keymap.level_masks(10, 0, 1, &masks);

    var state = try keymap.create_state();
    defer state.deinit();
    state.update_wayland(0x01, 0, 0x02, 0);
    state.update_mask(0, 0, 0, 0, 0, 0);
    _ = state.keysym(10);
    _ = state.keysyms(10);

    var layouts = try zdl.sdl_keymap.Keymaps.build(std.heap.page_allocator, &keymap);
    defer layouts.deinit();
    _ = layouts.layout(0);
    _ = layouts.scancode_for_key(38, null);
}

pub fn check() !void {
    if (std.os.linux.getpid() != 0) return;
    var library = try zdl.library.Library.open();
    defer library.close();
    try exercise(&library);
}
