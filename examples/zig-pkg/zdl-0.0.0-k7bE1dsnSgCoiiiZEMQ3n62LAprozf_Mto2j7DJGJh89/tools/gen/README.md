# Table generators

One-off Python scripts that produced generated Zig tables from the upstream
SDL reference (`.ref/SDL`) and system protocol data. Regenerate instead of
editing generated entries by hand. Run with `python3 -I` from the repo root,
then `zig fmt` the output.

| Script | Output | Usage |
| --- | --- | --- |
| `casefold.py` | table at the end of `src/core/casefold.zig` | `casefold.py .ref/SDL/src/stdlib/SDL_casefolding.h` |
| `keys.py` | Scancode/Keycode enums and names in `src/input/keyboard.zig` | `keys.py .ref/SDL` (splice between the hand-written head and Keycode methods) |
| `linux_keys.py` | tables at the end of `src/input/linux_keys.zig` | `linux_keys.py .ref/SDL` (prints the UCS range report on stderr) |
| `joystick_data.py` | `src/joystick/controller_table.zig`, `src/joystick/gamepad_db.zig` | `joystick_data.py .` |
| `wayland_protocol.py` | `src/video/wayland/protocol.zig` | `wayland_protocol.py > src/video/wayland/protocol.zig` (reads /usr/share/wayland and wayland-protocols) |
| `hidapi_xboxone_table.py` | old Xbox One controller list in `src/joystick/hidapi/xboxone.zig` | see the script header |
| `hidapi_switch_rumble.py` | HD rumble frequency/amplitude tables in `src/joystick/hidapi/switch_pro.zig` | see the script header |
| `hidapi_steam_constants.py` | `src/joystick/hidapi/steam_constants.zig` | see the script header |
| `render_gpu_shaders.py` | `src/render/gpu/shader_blobs.zig` | `render_gpu_shaders.py .ref/SDL > src/render/gpu/shader_blobs.zig` |
| `hint_names.py` | `src/core/hint_names.zig` | `hint_names.py .ref/SDL > src/core/hint_names.zig` |
| `render_debug_font.py` | `src/render/debug_font_data.zig` | `render_debug_font.py .ref/SDL/src/render/SDL_render_debug_font.h` |
| `planar_audio_assets.py` | `examples/assets/planar-left.u8`, `examples/assets/planar-right.u8` | `planar_audio_assets.py .ref/SDL/examples/audio/05-planar-data/planar-data.c` |
