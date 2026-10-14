//! Names of SDL's documented configuration hints (generated from SDL_hints.h
//! by tools/gen/hint_names.py; do not edit by hand). Pass these to `Hints`.
//! The environment-variable name of a hint equals its string value.

pub const allow_alt_tab_while_grabbed = "SDL_ALLOW_ALT_TAB_WHILE_GRABBED";
/// A variable to control whether the SDL activity is allowed to be re-created.
pub const android_allow_recreate_activity = "SDL_ANDROID_ALLOW_RECREATE_ACTIVITY";
/// A variable to control whether the event loop will block itself when the app is paused.
pub const android_block_on_pause = "SDL_ANDROID_BLOCK_ON_PAUSE";
/// A variable to control whether low latency audio should be enabled.
pub const android_low_latency_audio = "SDL_ANDROID_LOW_LATENCY_AUDIO";
/// A variable to control Android's AAudio input preset.
pub const android_aaudio_input_preset = "SDL_ANDROID_AAUDIO_INPUT_PRESET";
/// A variable to control whether we trap the Android back button to handle it manually.
pub const android_trap_back_button = "SDL_ANDROID_TRAP_BACK_BUTTON";
/// A variable to control whether we allow persistent folder access on Android when using the SDL select folder dialog.
pub const android_allow_persistent_folder_access = "SDL_ANDROID_ALLOW_PERSISTENT_FOLDER_ACCESS";
/// A variable setting the app ID string.
pub const app_id = "SDL_APP_ID";
/// A variable setting the application name.
pub const app_name = "SDL_APP_NAME";
/// A variable controlling whether controllers used with the Apple TV generate UI events.
pub const apple_tv_controller_ui_events = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS";
/// A variable controlling whether the Apple TV remote's joystick axes will automatically match the rotation of the remote.
pub const apple_tv_remote_allow_rotation = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION";
/// Specify the default ALSA audio device name.
pub const audio_alsa_default_device = "SDL_AUDIO_ALSA_DEFAULT_DEVICE";
/// Specify the default ALSA audio playback device name.
pub const audio_alsa_default_playback_device = "SDL_AUDIO_ALSA_DEFAULT_PLAYBACK_DEVICE";
/// Specify the default ALSA audio recording device name.
pub const audio_alsa_default_recording_device = "SDL_AUDIO_ALSA_DEFAULT_RECORDING_DEVICE";
/// A variable controlling the audio category on iOS and macOS.
pub const audio_category = "SDL_AUDIO_CATEGORY";
/// A variable controlling the default audio channel count.
pub const audio_channels = "SDL_AUDIO_CHANNELS";
/// Specify an application icon name for an audio device.
pub const audio_device_app_icon_name = "SDL_AUDIO_DEVICE_APP_ICON_NAME";
/// A variable controlling device buffer size.
pub const audio_device_sample_frames = "SDL_AUDIO_DEVICE_SAMPLE_FRAMES";
/// Specify an audio stream name for an audio device.
pub const audio_device_stream_name = "SDL_AUDIO_DEVICE_STREAM_NAME";
/// Specify an application role for an audio device.
pub const audio_device_stream_role = "SDL_AUDIO_DEVICE_STREAM_ROLE";
/// Specify whether this audio device should do audio processing.
pub const audio_device_raw_stream = "SDL_AUDIO_DEVICE_RAW_STREAM";
/// Specify the input file when recording audio using the disk audio driver.
pub const audio_disk_input_file = "SDL_AUDIO_DISK_INPUT_FILE";
/// Specify the output file when playing audio using the disk audio driver.
pub const audio_disk_output_file = "SDL_AUDIO_DISK_OUTPUT_FILE";
/// A variable controlling the audio rate when using the disk audio driver.
pub const audio_disk_timescale = "SDL_AUDIO_DISK_TIMESCALE";
/// A variable that specifies an audio backend to use.
pub const audio_driver = "SDL_AUDIO_DRIVER";
/// Specify whether this audio stream should duck other audio.
pub const audio_duck_others = "SDL_AUDIO_DUCK_OTHERS";
/// A variable controlling the audio rate when using the dummy audio driver.
pub const audio_dummy_timescale = "SDL_AUDIO_DUMMY_TIMESCALE";
/// A variable controlling the default audio format.
pub const audio_format = "SDL_AUDIO_FORMAT";
/// A variable controlling the default audio frequency.
pub const audio_frequency = "SDL_AUDIO_FREQUENCY";
/// A variable that causes SDL to not ignore audio "monitors".
pub const audio_include_monitors = "SDL_AUDIO_INCLUDE_MONITORS";
/// A variable controlling whether SDL updates joystick state when getting input events.
pub const auto_update_joysticks = "SDL_AUTO_UPDATE_JOYSTICKS";
/// A variable controlling whether SDL updates sensor state when getting input events.
pub const auto_update_sensors = "SDL_AUTO_UPDATE_SENSORS";
/// Prevent SDL from using version 4 of the bitmap header when saving BMPs.
pub const bmp_save_legacy_format = "SDL_BMP_SAVE_LEGACY_FORMAT";
/// A variable that decides what camera backend to use.
pub const camera_driver = "SDL_CAMERA_DRIVER";
/// A variable that limits what CPU features are available.
pub const cpu_feature_mask = "SDL_CPU_FEATURE_MASK";
/// A variable controlling whether DirectInput should be used for controllers.
pub const joystick_directinput = "SDL_JOYSTICK_DIRECTINPUT";
/// A variable that specifies a dialog backend to use.
pub const file_dialog_driver = "SDL_FILE_DIALOG_DRIVER";
/// Override for SDL_GetDisplayUsableBounds().
pub const display_usable_bounds = "SDL_DISPLAY_USABLE_BOUNDS";
/// A variable that enables a fast framebuffer path on DOS.
pub const dos_allow_direct_framebuffer = "SDL_DOS_ALLOW_DIRECT_FRAMEBUFFER";
/// Set the level of checking for invalid parameters passed to SDL functions.
pub const invalid_param_checks = "SDL_INVALID_PARAM_CHECKS";
/// Disable giving back control to the browser automatically when running with asyncify.
pub const emscripten_asyncify = "SDL_EMSCRIPTEN_ASYNCIFY";
/// Specify the CSS selector used for the "default" window/canvas.
pub const emscripten_canvas_selector = "SDL_EMSCRIPTEN_CANVAS_SELECTOR";
/// Override the binding element for keyboard inputs for Emscripten builds.
pub const emscripten_keyboard_element = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT";
/// A variable that controls whether the on-screen keyboard should be shown when text input is active.
pub const enable_screen_keyboard = "SDL_ENABLE_SCREEN_KEYBOARD";
/// A variable that controls whether the Steam on-screen keyboard should be shown when text input is active.
pub const enable_steam_screen_keyboard = "SDL_ENABLE_STEAM_SCREEN_KEYBOARD";
/// A variable containing a list of evdev devices to use if udev is not available.
pub const evdev_devices = "SDL_EVDEV_DEVICES";
/// A variable controlling verbosity of the logging of SDL events pushed onto the internal queue.
pub const event_logging = "SDL_EVENT_LOGGING";
/// A variable controlling whether raising the window should be done more forcefully.
pub const force_raisewindow = "SDL_FORCE_RAISEWINDOW";
/// A variable controlling how 3D acceleration is used to accelerate the SDL screen surface.
pub const framebuffer_acceleration = "SDL_FRAMEBUFFER_ACCELERATION";
/// A variable that lets you manually hint extra gamecontroller db entries.
pub const gamecontrollerconfig = "SDL_GAMECONTROLLERCONFIG";
/// A variable that lets you provide a file with extra gamecontroller db entries.
pub const gamecontrollerconfig_file = "SDL_GAMECONTROLLERCONFIG_FILE";
/// A variable that overrides the automatic controller type detection.
pub const gamecontrollertype = "SDL_GAMECONTROLLERTYPE";
/// A variable containing a list of devices to skip when scanning for game controllers.
pub const gamecontroller_ignore_devices = "SDL_GAMECONTROLLER_IGNORE_DEVICES";
/// If set, all devices will be skipped when scanning for game controllers except for the ones listed in this variable.
pub const gamecontroller_ignore_devices_except = "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT";
/// A variable that controls whether the device's built-in accelerometer and gyro should be used as sensors for gamepads.
pub const gamecontroller_sensor_fusion = "SDL_GAMECONTROLLER_SENSOR_FUSION";
/// This variable sets the default text of the TextInput window on GDK platforms.
pub const gdk_textinput_default_text = "SDL_GDK_TEXTINPUT_DEFAULT_TEXT";
/// This variable sets the description of the TextInput window on GDK platforms.
pub const gdk_textinput_description = "SDL_GDK_TEXTINPUT_DESCRIPTION";
/// This variable sets the maximum input length of the TextInput window on GDK platforms.
pub const gdk_textinput_max_length = "SDL_GDK_TEXTINPUT_MAX_LENGTH";
/// This variable sets the input scope of the TextInput window on GDK platforms.
pub const gdk_textinput_scope = "SDL_GDK_TEXTINPUT_SCOPE";
/// This variable sets the title of the TextInput window on GDK platforms.
pub const gdk_textinput_title = "SDL_GDK_TEXTINPUT_TITLE";
/// A variable to control whether HIDAPI uses libusb for device access.
pub const hidapi_libusb = "SDL_HIDAPI_LIBUSB";
/// A variable to control whether HIDAPI uses libusb for GameCube adapters.
pub const hidapi_libusb_gamecube = "SDL_HIDAPI_LIBUSB_GAMECUBE";
/// A variable to control whether HIDAPI uses libusb only for whitelisted devices.
pub const hidapi_libusb_whitelist = "SDL_HIDAPI_LIBUSB_WHITELIST";
/// A variable to control whether HIDAPI uses udev for device detection.
pub const hidapi_udev = "SDL_HIDAPI_UDEV";
/// A variable that specifies a GPU backend to use.
pub const gpu_driver = "SDL_GPU_DRIVER";
/// A variable that specifies the library name to use when loading the OpenXR loader.
pub const openxr_library = "SDL_OPENXR_LIBRARY";
/// A variable to control whether SDL_hid_enumerate() enumerates all HID devices or only controllers.
pub const hidapi_enumerate_only_controllers = "SDL_HIDAPI_ENUMERATE_ONLY_CONTROLLERS";
/// A variable containing a list of devices to ignore in SDL_hid_enumerate().
pub const hidapi_ignore_devices = "SDL_HIDAPI_IGNORE_DEVICES";
/// A variable describing what IME UI elements the application can display.
pub const ime_implemented_ui = "SDL_IME_IMPLEMENTED_UI";
/// A variable controlling whether the home indicator bar on iPhone X and later should be hidden.
pub const ios_hide_home_indicator = "SDL_IOS_HIDE_HOME_INDICATOR";
/// A variable that lets you enable joystick (and gamecontroller) events even when your app is in the background.
pub const joystick_allow_background_events = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS";
/// A variable containing a list of arcade stick style controllers.
pub const joystick_arcadestick_devices = "SDL_JOYSTICK_ARCADESTICK_DEVICES";
/// A variable containing a list of devices that are not arcade stick style controllers.
pub const joystick_arcadestick_devices_excluded = "SDL_JOYSTICK_ARCADESTICK_DEVICES_EXCLUDED";
/// A variable containing a list of devices that should not be considered joysticks.
pub const joystick_blacklist_devices = "SDL_JOYSTICK_BLACKLIST_DEVICES";
/// A variable containing a list of devices that should be considered joysticks.
pub const joystick_blacklist_devices_excluded = "SDL_JOYSTICK_BLACKLIST_DEVICES_EXCLUDED";
/// A variable containing a comma separated list of devices to open as joysticks.
pub const joystick_device = "SDL_JOYSTICK_DEVICE";
/// A variable containing a list of drum style controllers.
pub const joystick_drum_devices = "SDL_JOYSTICK_DRUM_DEVICES";
/// A variable controlling whether enhanced reports should be used for controllers when using the HIDAPI driver.
pub const joystick_enhanced_reports = "SDL_JOYSTICK_ENHANCED_REPORTS";
/// A variable containing a list of flightstick style controllers.
pub const joystick_flightstick_devices = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES";
/// A variable containing a list of devices that are not flightstick style controllers.
pub const joystick_flightstick_devices_excluded = "SDL_JOYSTICK_FLIGHTSTICK_DEVICES_EXCLUDED";
/// A variable controlling whether GameInput should be used for controller handling on Windows.
pub const joystick_gameinput = "SDL_JOYSTICK_GAMEINPUT";
/// A variable controlling whether GameInput should be used for handling GIP devices that require raw report processing, but aren't supported by HIDRAW, such as Xbox One Guitars.
pub const joystick_gameinput_raw = "SDL_JOYSTICK_GAMEINPUT_RAW";
/// A variable containing a list of devices known to have a GameCube form factor.
pub const joystick_gamecube_devices = "SDL_JOYSTICK_GAMECUBE_DEVICES";
/// A variable containing a list of devices known not to have a GameCube form factor.
pub const joystick_gamecube_devices_excluded = "SDL_JOYSTICK_GAMECUBE_DEVICES_EXCLUDED";
/// A variable containing a list of guitar style controllers.
pub const joystick_guitar_devices = "SDL_JOYSTICK_GUITAR_DEVICES";
/// A variable controlling whether the HIDAPI joystick drivers should be used.
pub const joystick_hidapi = "SDL_JOYSTICK_HIDAPI";
/// A variable controlling whether Nintendo Switch Joy-Con controllers will be combined into a single Pro-like controller when using the HIDAPI driver.
pub const joystick_hidapi_combine_joy_cons = "SDL_JOYSTICK_HIDAPI_COMBINE_JOY_CONS";
/// A variable controlling whether the HIDAPI driver for Nintendo GameCube controllers should be used.
pub const joystick_hidapi_gamecube = "SDL_JOYSTICK_HIDAPI_GAMECUBE";
/// A variable controlling whether rumble is used to implement the GameCube controller's 3 rumble modes, Stop(0), Rumble(1), and StopHard(2).
pub const joystick_hidapi_gamecube_rumble_brake = "SDL_JOYSTICK_HIDAPI_GAMECUBE_RUMBLE_BRAKE";
/// A variable controlling whether the HIDAPI driver for Nintendo Switch Joy-Cons should be used.
pub const joystick_hidapi_joy_cons = "SDL_JOYSTICK_HIDAPI_JOY_CONS";
/// A variable controlling whether the Home button LED should be turned on when a Nintendo Switch Joy-Con controller is opened.
pub const joystick_hidapi_joycon_home_led = "SDL_JOYSTICK_HIDAPI_JOYCON_HOME_LED";
/// A variable controlling whether the HIDAPI driver for Amazon Luna controllers connected via Bluetooth should be used.
pub const joystick_hidapi_luna = "SDL_JOYSTICK_HIDAPI_LUNA";
/// A variable controlling whether the HIDAPI driver for Nintendo Online classic controllers should be used.
pub const joystick_hidapi_nintendo_classic = "SDL_JOYSTICK_HIDAPI_NINTENDO_CLASSIC";
/// A variable controlling whether the HIDAPI driver for PS3 controllers should be used.
pub const joystick_hidapi_ps3 = "SDL_JOYSTICK_HIDAPI_PS3";
/// A variable controlling whether the Sony driver (sixaxis.sys) for PS3 controllers (Sixaxis/DualShock 3) should be used.
pub const joystick_hidapi_ps3_sixaxis_driver = "SDL_JOYSTICK_HIDAPI_PS3_SIXAXIS_DRIVER";
/// A variable controlling whether the HIDAPI driver for PS4 controllers should be used.
pub const joystick_hidapi_ps4 = "SDL_JOYSTICK_HIDAPI_PS4";
/// A variable controlling the update rate of the PS4 controller over Bluetooth when using the HIDAPI driver.
pub const joystick_hidapi_ps4_report_interval = "SDL_JOYSTICK_HIDAPI_PS4_REPORT_INTERVAL";
/// A variable controlling whether the HIDAPI driver for PS5 controllers should be used.
pub const joystick_hidapi_ps5 = "SDL_JOYSTICK_HIDAPI_PS5";
/// A variable controlling whether the player LEDs should be lit to indicate which player is associated with a PS5 controller.
pub const joystick_hidapi_ps5_player_led = "SDL_JOYSTICK_HIDAPI_PS5_PLAYER_LED";
/// A variable controlling whether the HIDAPI driver for NVIDIA SHIELD controllers should be used.
pub const joystick_hidapi_shield = "SDL_JOYSTICK_HIDAPI_SHIELD";
/// A variable controlling whether the HIDAPI driver for Google Stadia controllers should be used.
pub const joystick_hidapi_stadia = "SDL_JOYSTICK_HIDAPI_STADIA";
/// A variable controlling whether the HIDAPI driver for Bluetooth Steam Controllers should be used.
pub const joystick_hidapi_steam = "SDL_JOYSTICK_HIDAPI_STEAM";
/// A variable controlling whether the Steam button LED should be turned on when a Steam controller is opened.
pub const joystick_hidapi_steam_home_led = "SDL_JOYSTICK_HIDAPI_STEAM_HOME_LED";
/// A variable controlling whether the HIDAPI driver for the Steam Deck builtin controller should be used.
pub const joystick_hidapi_steamdeck = "SDL_JOYSTICK_HIDAPI_STEAMDECK";
/// A variable controlling whether the HIDAPI driver for HORI licensed Steam controllers should be used.
pub const joystick_hidapi_steam_hori = "SDL_JOYSTICK_HIDAPI_STEAM_HORI";
/// A variable controlling whether the HIDAPI driver for some Logitech wheels should be used.
pub const joystick_hidapi_lg4ff = "SDL_JOYSTICK_HIDAPI_LG4FF";
/// A variable controlling whether the HIDAPI driver for 8BitDo controllers should be used.
pub const joystick_hidapi_8bitdo = "SDL_JOYSTICK_HIDAPI_8BITDO";
/// A variable controlling whether the HIDAPI driver for SInput controllers should be used.
pub const joystick_hidapi_sinput = "SDL_JOYSTICK_HIDAPI_SINPUT";
/// A variable controlling whether the HIDAPI driver for ZUIKI controllers should be used.
pub const joystick_hidapi_zuiki = "SDL_JOYSTICK_HIDAPI_ZUIKI";
/// A variable controlling whether the HIDAPI driver for Flydigi controllers should be used.
pub const joystick_hidapi_flydigi = "SDL_JOYSTICK_HIDAPI_FLYDIGI";
/// A variable controlling whether the HIDAPI driver for GameSir controllers should be used.
pub const joystick_hidapi_gamesir = "SDL_JOYSTICK_HIDAPI_GAMESIR";
/// A variable controlling whether the HIDAPI driver for Nintendo Switch controllers should be used.
pub const joystick_hidapi_switch = "SDL_JOYSTICK_HIDAPI_SWITCH";
/// A variable controlling whether the Home button LED should be turned on when a Nintendo Switch Pro controller is opened.
pub const joystick_hidapi_switch_home_led = "SDL_JOYSTICK_HIDAPI_SWITCH_HOME_LED";
/// A variable controlling whether the player LEDs should be lit to indicate which player is associated with a Nintendo Switch controller.
pub const joystick_hidapi_switch_player_led = "SDL_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED";
/// A variable controlling whether the HIDAPI driver for Nintendo Switch 2 controllers should be used.
pub const joystick_hidapi_switch2 = "SDL_JOYSTICK_HIDAPI_SWITCH2";
/// A variable controlling whether Nintendo Switch Joy-Con controllers will be in vertical mode when using the HIDAPI driver.
pub const joystick_hidapi_vertical_joy_cons = "SDL_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS";
/// A variable controlling whether the HIDAPI driver for Nintendo Wii and Wii U controllers should be used.
pub const joystick_hidapi_wii = "SDL_JOYSTICK_HIDAPI_WII";
/// A variable controlling whether the player LEDs should be lit to indicate which player is associated with a Wii controller.
pub const joystick_hidapi_wii_player_led = "SDL_JOYSTICK_HIDAPI_WII_PLAYER_LED";
/// A variable controlling whether the HIDAPI driver for XBox controllers should be used.
pub const joystick_hidapi_xbox = "SDL_JOYSTICK_HIDAPI_XBOX";
/// A variable controlling whether the HIDAPI driver for XBox 360 controllers should be used.
pub const joystick_hidapi_xbox_360 = "SDL_JOYSTICK_HIDAPI_XBOX_360";
/// A variable controlling whether the player LEDs should be lit to indicate which player is associated with an Xbox 360 controller.
pub const joystick_hidapi_xbox_360_player_led = "SDL_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED";
/// A variable controlling whether the HIDAPI driver for XBox 360 wireless controllers should be used.
pub const joystick_hidapi_xbox_360_wireless = "SDL_JOYSTICK_HIDAPI_XBOX_360_WIRELESS";
/// A variable controlling whether the HIDAPI driver for XBox One controllers should be used.
pub const joystick_hidapi_xbox_one = "SDL_JOYSTICK_HIDAPI_XBOX_ONE";
/// A variable controlling whether the Home button LED should be turned on when an Xbox One controller is opened.
pub const joystick_hidapi_xbox_one_home_led = "SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED";
/// A variable controlling whether the new HIDAPI driver for wired Xbox One (GIP) controllers should be used.
pub const joystick_hidapi_gip = "SDL_JOYSTICK_HIDAPI_GIP";
/// A variable controlling whether the new HIDAPI driver for wired Xbox One (GIP) controllers should reset the controller if it can't get the metadata from the controller.
pub const joystick_hidapi_gip_reset_for_metadata = "SDL_JOYSTICK_HIDAPI_GIP_RESET_FOR_METADATA";
/// A variable controlling whether IOKit should be used for controller handling.
pub const joystick_iokit = "SDL_JOYSTICK_IOKIT";
/// A variable controlling whether to use the classic /dev/input/js* joystick interface or the newer /dev/input/event* joystick interface on Linux.
pub const joystick_linux_classic = "SDL_JOYSTICK_LINUX_CLASSIC";
/// A variable controlling whether joysticks on Linux adhere to their HID-defined deadzones or return unfiltered values.
pub const joystick_linux_deadzones = "SDL_JOYSTICK_LINUX_DEADZONES";
/// A variable controlling whether joysticks on Linux will always treat 'hat' axis inputs (ABS_HAT0X - ABS_HAT3Y) as 8-way digital hats without checking whether they may be analog.
pub const joystick_linux_digital_hats = "SDL_JOYSTICK_LINUX_DIGITAL_HATS";
/// A variable controlling whether digital hats on Linux will apply deadzones to their underlying input axes or use unfiltered values.
pub const joystick_linux_hat_deadzones = "SDL_JOYSTICK_LINUX_HAT_DEADZONES";
/// A variable controlling whether GCController should be used for controller handling.
pub const joystick_mfi = "SDL_JOYSTICK_MFI";
/// A variable controlling whether the RAWINPUT joystick drivers should be used for better handling XInput-capable devices.
pub const joystick_rawinput = "SDL_JOYSTICK_RAWINPUT";
/// A variable controlling whether the RAWINPUT driver should pull correlated data from XInput.
pub const joystick_rawinput_correlate_xinput = "SDL_JOYSTICK_RAWINPUT_CORRELATE_XINPUT";
/// A variable controlling whether the ROG Chakram mice should show up as joysticks.
pub const joystick_rog_chakram = "SDL_JOYSTICK_ROG_CHAKRAM";
/// A variable controlling whether a separate thread should be used for handling joystick detection and raw input messages on Windows.
pub const joystick_thread = "SDL_JOYSTICK_THREAD";
/// A variable containing a list of throttle style controllers.
pub const joystick_throttle_devices = "SDL_JOYSTICK_THROTTLE_DEVICES";
/// A variable containing a list of devices that are not throttle style controllers.
pub const joystick_throttle_devices_excluded = "SDL_JOYSTICK_THROTTLE_DEVICES_EXCLUDED";
/// A variable controlling whether Windows.Gaming.Input should be used for controller handling.
pub const joystick_wgi = "SDL_JOYSTICK_WGI";
/// A variable containing a list of wheel style controllers.
pub const joystick_wheel_devices = "SDL_JOYSTICK_WHEEL_DEVICES";
/// A variable containing a list of devices that are not wheel style controllers.
pub const joystick_wheel_devices_excluded = "SDL_JOYSTICK_WHEEL_DEVICES_EXCLUDED";
/// A variable containing a list of devices known to have all axes centered at zero.
pub const joystick_zero_centered_devices = "SDL_JOYSTICK_ZERO_CENTERED_DEVICES";
/// A variable containing a list of devices and their desired number of haptic (force feedback) enabled axis.
pub const joystick_haptic_axes = "SDL_JOYSTICK_HAPTIC_AXES";
/// A variable that controls keycode representation in keyboard events.
pub const keycode_options = "SDL_KEYCODE_OPTIONS";
/// A variable that controls what KMSDRM device to use.
pub const kmsdrm_device_index = "SDL_KMSDRM_DEVICE_INDEX";
/// A variable that controls whether SDL requires DRM master access in order to initialize the KMSDRM video backend.
pub const kmsdrm_require_drm_master = "SDL_KMSDRM_REQUIRE_DRM_MASTER";
/// A variable that controls whether KMSDRM will use "atomic" functionality.
pub const kmsdrm_atomic = "SDL_KMSDRM_ATOMIC";
/// A variable controlling the default SDL log levels.
pub const logging = "SDL_LOGGING";
/// A variable controlling whether to force the application to become the foreground process when launched on macOS.
pub const mac_background_app = "SDL_MAC_BACKGROUND_APP";
/// A variable that determines whether Ctrl+Click should generate a right-click event on macOS.
pub const mac_ctrl_click_emulate_right_click = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK";
/// A variable controlling whether dispatching OpenGL context updates should block the dispatching thread until the main thread finishes processing on macOS.
pub const mac_opengl_async_dispatch = "SDL_MAC_OPENGL_ASYNC_DISPATCH";
/// A variable controlling whether the Option key on macOS should be remapped to act as the Alt key.
pub const mac_option_as_alt = "SDL_MAC_OPTION_AS_ALT";
/// A variable controlling whether SDL_EVENT_MOUSE_WHEEL event values will have momentum on macOS.
pub const mac_scroll_momentum = "SDL_MAC_SCROLL_MOMENTUM";
/// A variable controlling whether the GCMouse API will be used on macOS.
pub const mac_use_gcmouse = "SDL_MAC_USE_GCMOUSE";
/// A variable controlling whether holding down a key will repeat the pressed key or open the accents menu on macOS.
pub const mac_press_and_hold = "SDL_MAC_PRESS_AND_HOLD";
/// Request SDL_AppIterate() be called at a specific rate.
pub const main_callback_rate = "SDL_MAIN_CALLBACK_RATE";
/// A variable controlling whether the mouse is captured while mouse buttons are pressed.
pub const mouse_auto_capture = "SDL_MOUSE_AUTO_CAPTURE";
/// A variable setting the double click radius, in pixels.
pub const mouse_double_click_radius = "SDL_MOUSE_DOUBLE_CLICK_RADIUS";
/// A variable setting the double click time, in milliseconds.
pub const mouse_double_click_time = "SDL_MOUSE_DOUBLE_CLICK_TIME";
/// A variable setting which system cursor to use as the default cursor.
pub const mouse_default_system_cursor = "SDL_MOUSE_DEFAULT_SYSTEM_CURSOR";
/// A variable setting whether we should scale cursors by the current display scale.
pub const mouse_dpi_scale_cursors = "SDL_MOUSE_DPI_SCALE_CURSORS";
/// A variable controlling whether warping a hidden mouse cursor will activate relative mouse mode.
pub const mouse_emulate_warp_with_relative = "SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE";
/// Allow mouse click events when clicking to focus an SDL window.
pub const mouse_focus_clickthrough = "SDL_MOUSE_FOCUS_CLICKTHROUGH";
/// A variable setting the speed scale for mouse motion, in floating point, when the mouse is not in relative mode.
pub const mouse_normal_speed_scale = "SDL_MOUSE_NORMAL_SPEED_SCALE";
/// A variable controlling whether relative mouse mode constrains the mouse to the center of the window.
pub const mouse_relative_mode_center = "SDL_MOUSE_RELATIVE_MODE_CENTER";
/// A variable setting the scale for mouse motion, in floating point, when the mouse is in relative mode.
pub const mouse_relative_speed_scale = "SDL_MOUSE_RELATIVE_SPEED_SCALE";
/// A variable controlling whether the system mouse acceleration curve is used for relative mouse motion.
pub const mouse_relative_system_scale = "SDL_MOUSE_RELATIVE_SYSTEM_SCALE";
/// A variable controlling whether a motion event should be generated for mouse warping in relative mode.
pub const mouse_relative_warp_motion = "SDL_MOUSE_RELATIVE_WARP_MOTION";
/// A variable controlling whether the hardware cursor stays visible when relative mode is active.
pub const mouse_relative_cursor_visible = "SDL_MOUSE_RELATIVE_CURSOR_VISIBLE";
/// A variable controlling whether mouse events should generate synthetic touch events.
pub const mouse_touch_events = "SDL_MOUSE_TOUCH_EVENTS";
/// A variable controlling whether the keyboard should be muted on the console.
pub const mute_console_keyboard = "SDL_MUTE_CONSOLE_KEYBOARD";
/// Tell SDL not to catch the SIGINT or SIGTERM signals on POSIX platforms.
pub const no_signal_handlers = "SDL_NO_SIGNAL_HANDLERS";
/// Specify the OpenGL library to load.
pub const opengl_library = "SDL_OPENGL_LIBRARY";
/// Specify the EGL library to load.
pub const egl_library = "SDL_EGL_LIBRARY";
/// A variable controlling what driver to use for OpenGL ES contexts.
pub const opengl_es_driver = "SDL_OPENGL_ES_DRIVER";
/// A variable controlling whether to force an sRGB-capable OpenGL context.
pub const opengl_force_srgb_framebuffer = "SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER";
/// Mechanism to specify openvr_api library location
pub const openvr_library = "SDL_OPENVR_LIBRARY";
/// A variable controlling which orientations are allowed on iOS/Android.
pub const orientations = "SDL_ORIENTATIONS";
/// A variable controlling the use of a sentinel event when polling the event queue.
pub const poll_sentinel = "SDL_POLL_SENTINEL";
/// Override for SDL_GetPreferredLocales().
pub const preferred_locales = "SDL_PREFERRED_LOCALES";
/// A variable that decides whether to send SDL_EVENT_QUIT when closing the last window.
pub const quit_on_last_window_close = "SDL_QUIT_ON_LAST_WINDOW_CLOSE";
/// A variable controlling whether the Direct3D device is initialized for thread-safe operations.
pub const render_direct3d_threadsafe = "SDL_RENDER_DIRECT3D_THREADSAFE";
/// A variable controlling whether to enable Direct3D 11+'s Debug Layer.
pub const render_direct3d11_debug = "SDL_RENDER_DIRECT3D11_DEBUG";
/// A variable controlling whether to use the Direct3D 11 WARP software rasterizer.
pub const render_direct3d11_warp = "SDL_RENDER_DIRECT3D11_WARP";
/// A variable controlling whether to enable Vulkan Validation Layers.
pub const render_vulkan_debug = "SDL_RENDER_VULKAN_DEBUG";
/// A variable controlling whether to create the GPU device in debug mode.
pub const render_gpu_debug = "SDL_RENDER_GPU_DEBUG";
/// A variable controlling whether to prefer a low-power GPU on multi-GPU systems.
pub const render_gpu_low_power = "SDL_RENDER_GPU_LOW_POWER";
/// A variable specifying which render driver to use.
pub const render_driver = "SDL_RENDER_DRIVER";
/// A variable controlling how the 2D render API renders lines.
pub const render_line_method = "SDL_RENDER_LINE_METHOD";
/// A variable controlling whether the Metal render driver select low power device over default one.
pub const render_metal_prefer_low_power_device = "SDL_RENDER_METAL_PREFER_LOW_POWER_DEVICE";
/// A variable controlling whether updates to the SDL screen surface should be synchronized with the vertical refresh, to avoid tearing.
pub const render_vsync = "SDL_RENDER_VSYNC";
/// A variable to control whether the return key on the soft keyboard should hide the soft keyboard on Android and iOS.
pub const return_key_hides_ime = "SDL_RETURN_KEY_HIDES_IME";
/// A variable containing a list of ROG gamepad capable mice.
pub const rog_gamepad_mice = "SDL_ROG_GAMEPAD_MICE";
/// A variable containing a list of devices that are not ROG gamepad capable mice.
pub const rog_gamepad_mice_excluded = "SDL_ROG_GAMEPAD_MICE_EXCLUDED";
/// A variable controlling the width of the PS2's framebuffer in pixels.
pub const ps2_gs_width = "SDL_PS2_GS_WIDTH";
/// A variable controlling the height of the PS2's framebuffer in pixels.
pub const ps2_gs_height = "SDL_PS2_GS_HEIGHT";
/// A variable controlling whether the signal is interlaced or progressive.
pub const ps2_gs_progressive = "SDL_PS2_GS_PROGRESSIVE";
/// A variable controlling the video mode of the console.
pub const ps2_gs_mode = "SDL_PS2_GS_MODE";
/// A variable controlling the pixel storage mode of the PS2's framebuffer.
pub const ps2_gs_color_depth = "SDL_PS2_GS_COLOR_DEPTH";
/// A variable controlling which Dispmanx layer to use on a Raspberry PI.
pub const rpi_video_layer = "SDL_RPI_VIDEO_LAYER";
/// Specify an "activity name" for screensaver inhibition.
pub const screensaver_inhibit_activity_name = "SDL_SCREENSAVER_INHIBIT_ACTIVITY_NAME";
/// A variable controlling whether SDL calls dbus_shutdown() on quit.
pub const shutdown_dbus_on_quit = "SDL_SHUTDOWN_DBUS_ON_QUIT";
/// A variable that specifies a backend to use for title storage.
pub const storage_title_driver = "SDL_STORAGE_TITLE_DRIVER";
/// A variable that specifies a backend to use for user storage.
pub const storage_user_driver = "SDL_STORAGE_USER_DRIVER";
/// Specifies whether SDL_THREAD_PRIORITY_TIME_CRITICAL should be treated as realtime.
pub const thread_force_realtime_time_critical = "SDL_THREAD_FORCE_REALTIME_TIME_CRITICAL";
/// A string specifying additional information to use with SDL_SetCurrentThreadPriority.
pub const thread_priority_policy = "SDL_THREAD_PRIORITY_POLICY";
/// A variable that controls the timer resolution, in milliseconds.
pub const timer_resolution = "SDL_TIMER_RESOLUTION";
/// A variable controlling whether touch events should generate synthetic mouse events.
pub const touch_mouse_events = "SDL_TOUCH_MOUSE_EVENTS";
/// A variable controlling whether trackpads should be treated as touch devices.
pub const trackpad_is_touch_only = "SDL_TRACKPAD_IS_TOUCH_ONLY";
/// A variable controlling whether the Android / tvOS remotes should be listed as joystick devices, instead of sending keyboard events.
pub const tv_remote_as_joystick = "SDL_TV_REMOTE_AS_JOYSTICK";
/// A variable controlling whether the screensaver is enabled.
pub const video_allow_screensaver = "SDL_VIDEO_ALLOW_SCREENSAVER";
/// A comma separated list containing the names of the displays that SDL should sort to the front of the display list.
pub const video_display_priority = "SDL_VIDEO_DISPLAY_PRIORITY";
/// Tell the video driver that we only want a double buffer.
pub const video_double_buffer = "SDL_VIDEO_DOUBLE_BUFFER";
/// A variable that specifies a video backend to use.
pub const video_driver = "SDL_VIDEO_DRIVER";
/// A variable controlling whether the dummy video driver saves output frames.
pub const video_dummy_save_frames = "SDL_VIDEO_DUMMY_SAVE_FRAMES";
/// If eglGetPlatformDisplay fails, fall back to calling eglGetDisplay.
pub const video_egl_allow_getdisplay_fallback = "SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK";
/// A variable controlling whether the OpenGL context should be created with EGL.
pub const video_force_egl = "SDL_VIDEO_FORCE_EGL";
/// A variable that specifies the policy for fullscreen Spaces on macOS.
pub const video_mac_fullscreen_spaces = "SDL_VIDEO_MAC_FULLSCREEN_SPACES";
/// A variable that specifies the menu visibility when a window is fullscreen in Spaces on macOS.
pub const video_mac_fullscreen_menu_visibility = "SDL_VIDEO_MAC_FULLSCREEN_MENU_VISIBILITY";
/// A variable indicating whether the metal layer drawable size should be updated for the SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event on macOS.
pub const video_metal_auto_resize_drawable = "SDL_VIDEO_METAL_AUTO_RESIZE_DRAWABLE";
/// A variable controlling whether SDL will attempt to automatically set the destination display to a mode most closely matching that of the previous display if an exclusive fullscreen window is moved onto it.
pub const video_match_exclusive_mode_on_move = "SDL_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE";
/// A variable controlling whether fullscreen windows are minimized when they lose focus.
pub const video_minimize_on_focus_loss = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS";
/// A variable controlling whether the offscreen video driver saves output frames.
pub const video_offscreen_save_frames = "SDL_VIDEO_OFFSCREEN_SAVE_FRAMES";
/// A variable controlling whether all window operations will block until complete.
pub const video_sync_window_operations = "SDL_VIDEO_SYNC_WINDOW_OPERATIONS";
/// A variable controlling whether the libdecor Wayland backend is allowed to be used.
pub const video_wayland_allow_libdecor = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR";
/// A variable controlling whether video mode emulation is enabled under Wayland.
pub const video_wayland_mode_emulation = "SDL_VIDEO_WAYLAND_MODE_EMULATION";
/// A variable controlling how modes with a non-native aspect ratio are displayed under Wayland.
pub const video_wayland_mode_scaling = "SDL_VIDEO_WAYLAND_MODE_SCALING";
/// A variable controlling whether the libdecor Wayland backend is preferred over native decorations.
pub const video_wayland_prefer_libdecor = "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR";
/// A variable forcing non-DPI-aware Wayland windows to output at 1:1 scaling.
pub const video_wayland_scale_to_display = "SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY";
/// A variable specifying which shader compiler to preload when using the Chrome ANGLE binaries.
pub const video_win_d3dcompiler = "SDL_VIDEO_WIN_D3DCOMPILER";
/// A variable controlling whether the X Synchronization Extension is enabled.
pub const video_x11_enable_xsync_ext = "SDL_VIDEO_X11_ENABLE_XSYNC_EXT";
/// A variable controlling whether SDL should call XSelectInput() to enable input events on X11 windows wrapped by SDL windows.
pub const video_x11_external_window_input = "SDL_VIDEO_X11_EXTERNAL_WINDOW_INPUT";
/// A variable controlling whether the X11 _NET_WM_BYPASS_COMPOSITOR hint should be used.
pub const video_x11_net_wm_bypass_compositor = "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR";
/// A variable controlling whether the X11 _NET_WM_PING protocol should be supported.
pub const video_x11_net_wm_ping = "SDL_VIDEO_X11_NET_WM_PING";
/// A variable controlling whether SDL uses DirectColor visuals.
pub const video_x11_nodirectcolor = "SDL_VIDEO_X11_NODIRECTCOLOR";
/// A variable forcing the content scaling factor for X11 displays.
pub const video_x11_scaling_factor = "SDL_VIDEO_X11_SCALING_FACTOR";
/// A variable forcing the visual ID used for X11 display modes.
pub const video_x11_visualid = "SDL_VIDEO_X11_VISUALID";
/// A variable forcing the visual ID chosen for new X11 windows.
pub const video_x11_window_visualid = "SDL_VIDEO_X11_WINDOW_VISUALID";
/// A variable controlling whether the X11 XRandR extension should be used.
pub const video_x11_xrandr = "SDL_VIDEO_X11_XRANDR";
/// A variable controlling whether the HDR headroom slider should be shown in the visionOS window settings.
pub const visionos_hdr_headroom_ui = "SDL_VISIONOS_HDR_HEADROOM_UI";
/// A variable controlling whether touch should be enabled on the back panel of the PlayStation Vita.
pub const vita_enable_back_touch = "SDL_VITA_ENABLE_BACK_TOUCH";
/// A variable controlling whether touch should be enabled on the front panel of the PlayStation Vita.
pub const vita_enable_front_touch = "SDL_VITA_ENABLE_FRONT_TOUCH";
/// A variable controlling the module path on the PlayStation Vita.
pub const vita_module_path = "SDL_VITA_MODULE_PATH";
/// A variable controlling whether to perform PVR initialization on the PlayStation Vita.
pub const vita_pvr_init = "SDL_VITA_PVR_INIT";
/// A variable overriding the resolution reported on the PlayStation Vita.
pub const vita_resolution = "SDL_VITA_RESOLUTION";
/// A variable controlling whether OpenGL should be used instead of OpenGL ES on the PlayStation Vita.
pub const vita_pvr_opengl = "SDL_VITA_PVR_OPENGL";
/// A variable controlling which touchpad should generate synthetic mouse events.
pub const vita_touch_mouse_device = "SDL_VITA_TOUCH_MOUSE_DEVICE";
/// A variable overriding the display index used in SDL_Vulkan_CreateSurface()
pub const vulkan_display = "SDL_VULKAN_DISPLAY";
/// Specify the Vulkan library to load.
pub const vulkan_library = "SDL_VULKAN_LIBRARY";
/// A variable controlling how the fact chunk affects the loading of a WAVE file.
pub const wave_fact_chunk = "SDL_WAVE_FACT_CHUNK";
/// A variable controlling the maximum number of chunks in a WAVE file.
pub const wave_chunk_limit = "SDL_WAVE_CHUNK_LIMIT";
/// A variable controlling how the size of the RIFF chunk affects the loading of a WAVE file.
pub const wave_riff_chunk_size = "SDL_WAVE_RIFF_CHUNK_SIZE";
/// A variable controlling how a truncated WAVE file is handled.
pub const wave_truncation = "SDL_WAVE_TRUNCATION";
/// A variable controlling whether the window is activated when the SDL_RaiseWindow function is called.
pub const window_activate_when_raised = "SDL_WINDOW_ACTIVATE_WHEN_RAISED";
/// A variable controlling whether the window is activated when the SDL_ShowWindow function is called.
pub const window_activate_when_shown = "SDL_WINDOW_ACTIVATE_WHEN_SHOWN";
/// If set to "0" then never set the top-most flag on an SDL Window even if the application requests it.
pub const window_allow_topmost = "SDL_WINDOW_ALLOW_TOPMOST";
/// A variable controlling whether the window frame and title bar are interactive when the cursor is hidden.
pub const window_frame_usable_while_cursor_hidden = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN";
/// A variable controlling whether SDL generates window-close events for Alt+F4 on Windows.
pub const windows_close_on_alt_f4 = "SDL_WINDOWS_CLOSE_ON_ALT_F4";
/// A variable controlling whether menus can be opened with their keyboard shortcut (Alt+mnemonic).
pub const windows_enable_menu_mnemonics = "SDL_WINDOWS_ENABLE_MENU_MNEMONICS";
/// A variable controlling whether the windows message loop is processed by SDL.
pub const windows_enable_messageloop = "SDL_WINDOWS_ENABLE_MESSAGELOOP";
/// A variable controlling whether GameInput is used for raw keyboard and mouse on Windows.
pub const windows_gameinput = "SDL_WINDOWS_GAMEINPUT";
/// A variable controlling whether raw keyboard events are used on Windows.
pub const windows_raw_keyboard = "SDL_WINDOWS_RAW_KEYBOARD";
/// A variable controlling whether or not the RIDEV_NOHOTKEYS flag is set when enabling Windows raw keyboard events.
pub const windows_raw_keyboard_exclude_hotkeys = "SDL_WINDOWS_RAW_KEYBOARD_EXCLUDE_HOTKEYS";
/// A variable controlling whether the RIDEV_INPUTSINK flag is set when enabling Windows raw keyboard events.
pub const windows_raw_keyboard_inputsink = "SDL_WINDOWS_RAW_KEYBOARD_INPUTSINK";
/// A variable controlling whether the RIDEV_NOLEGACY flag is set when enabling Windows raw mouse events.
pub const windows_raw_mouse_nolegacy = "SDL_WINDOWS_RAW_MOUSE_NOLEGACY";
/// A variable controlling whether SDL uses Kernel Semaphores on Windows.
pub const windows_force_semaphore_kernel = "SDL_WINDOWS_FORCE_SEMAPHORE_KERNEL";
/// A variable to specify custom icon resource id from RC file on Windows platform.
pub const windows_intresource_icon = "SDL_WINDOWS_INTRESOURCE_ICON";
/// A variable to specify custom icon resource id from RC file on Windows platform.
pub const windows_intresource_icon_small = "SDL_WINDOWS_INTRESOURCE_ICON_SMALL";
/// A variable controlling whether SDL uses the D3D9Ex API introduced in Windows Vista, instead of normal D3D9.
pub const windows_use_d3d9ex = "SDL_WINDOWS_USE_D3D9EX";
/// A variable controlling whether SDL will clear the window contents when the WM_ERASEBKGND message is received.
pub const windows_erase_background_mode = "SDL_WINDOWS_ERASE_BACKGROUND_MODE";
/// A variable controlling whether X11 windows are marked as override-redirect.
pub const x11_force_override_redirect = "SDL_X11_FORCE_OVERRIDE_REDIRECT";
/// A variable specifying the type of an X11 window.
pub const x11_window_type = "SDL_X11_WINDOW_TYPE";
/// Specify the XCB library to load for the X11 driver.
pub const x11_xcb_library = "SDL_X11_XCB_LIBRARY";
/// A variable controlling whether XInput should be used for controller handling.
pub const xinput_enabled = "SDL_XINPUT_ENABLED";
/// A variable controlling response to SDL_assert failures.
pub const assert = "SDL_ASSERT";
/// A variable controlling whether pen events should generate synthetic mouse events.
pub const pen_mouse_events = "SDL_PEN_MOUSE_EVENTS";
/// A variable controlling whether pen events should generate synthetic touch events.
pub const pen_touch_events = "SDL_PEN_TOUCH_EVENTS";
