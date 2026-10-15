//! Controller model identifiers from Valve's controller_type.h. The tag values
//! are SDL's EControllerType numbers and are stored in persistent databases, so
//! they must never be renumbered. Lookup from vendor/product ids lives in
//! `joystick.zig`, which uses the generated `controller_table.zig`.

/// Steam-style controller model. Values are SDL's `EControllerType` numbers.
pub const ControllerType = enum(i32) {
    none = -1,
    unknown = 0,

    unknown_steam_controller = 1,
    steam_controller = 2,
    steam_controller_v2 = 3,
    steam_controller_neptune = 4,
    steam_controller_triton = 10,

    unknown_non_steam_controller = 30,
    xbox360_controller = 31,
    xbox_one_controller = 32,
    ps3_controller = 33,
    ps4_controller = 34,
    wii_controller = 35,
    apple_controller = 36,
    android_controller = 37,
    switch_pro_controller = 38,
    switch_joycon_left = 39,
    switch_joycon_right = 40,
    switch_joycon_pair = 41,
    switch_input_only_controller = 42,
    mobile_touch = 43,
    /// Client-side only: Switch-style controller that presents itself as XInput.
    xinput_switch_controller = 44,
    ps5_controller = 45,
    xbox_elite_controller = 46,
    /// Client-side only: DualShock 4 style controller presenting itself as XInput.
    xinput_ps4_controller = 47,
    ps5_edge_controller = 48,
    hori_steam_controller = 49,
    bitdo8_controller = 50,
    switch2_pro_controller = 51,
    switch2_input_only_controller = 52,

    generic_keyboard = 400,
    generic_mouse = 800,
};
