# Native applications

Build with Zig master (`0.18.0-dev.253+16d31ceed` verified):

```sh
cd examples
/home/addo/.zvm/master/zig build --fork=..
./zig-out/bin/apps-dashboard
./zig-out/bin/apps-dashboard --dark
./zig-out/bin/apps-player /path/to/video.mp4
```

The examples use `zdl` and `zlay`; rendering uses FreeType and HarfBuzz loaded at
runtime. Font/icon sources and licenses are embedded alongside the applications.
`--fork=..` selects this checkout instead of the pinned published zdl package.

## Dashboard

The shadcn dashboard-01 reference supplies its layout, Geist fonts, data, theme
tokens and Tabler/Lucide icons. The native view includes collapsible navigation,
revenue cards, stacked visitor chart with period selection and hover values,
table tabs, selection, editable target/limit fields, reviewer menus, row actions,
row reordering, column visibility, pagination and adding sections. State is local
and lasts for this run; navigation items do not imply a backend service.
Settings/user menu can switch appearance. Keyboard Tab and Enter/Space activate
widgets; numeric fields accept text input and Backspace; Escape dismisses menus.

## Player

The supplied VLC Redesign Figma export provides icons, colors and geometry.
Inter and DM Mono fonts retain their OFL licenses. Open media with the folder
button, Ctrl+O, a dropped local file, or positional command-line paths. The
playlist supports choosing and stepping through files. Playback has pause,
seek, volume/mute, fullscreen, repeat and track/codec metadata. Preferences expose
implemented settings and keyboard shortcuts.

Space pauses; arrows seek/change volume; M mutes; F toggles fullscreen. FFmpeg
runs demux/video/audio stages on bounded queues. Audio uses zdl's stream converter
and ALSA; video uses native YUV conversion with optional libswscale fallback.
The binding currently accepts the verified FFmpeg 8.1.3 library ABI only:
libavformat 62.12.103, libavcodec 62.28.103, libavutil 60.26.103. A different
version returns `UnsupportedLibraryVersion` before any record access.

## Verification

```sh
/home/addo/.zvm/master/zig build test-apps --fork=..
./zig-out/bin/apps-dashboard --snapshot /tmp/dashboard.png
./zig-out/bin/apps-dashboard --dark --snapshot /tmp/dashboard-dark.png
./zig-out/bin/apps-player video.mp4 --snapshot /tmp/player.png
./zig-out/bin/apps-dashboard --smoke
SDL_VIDEO_DRIVER=x11 ./zig-out/bin/apps-dashboard --smoke
./zig-out/bin/playback-check --probe video.mp4
```

Snapshots render once through the offscreen backend and export PNG. `--smoke`
opens a native window, presents one frame and closes. The playback probe checks
frame advancement, pause and seek/resume without opening a display.

## Current limits

Main views are runnable; exact screenshot/interaction parity remains unfinished.
The full exported Figma settings/effects/onboarding/miniplayer screens are not
implemented, and audio/subtitle track switching is not exposed. There is no
persistent media library, OS accessibility tree or verified drag/button interaction
automation. Window-control integration currently targets Linux (Wayland/X11);
Windows/macOS backend integration and native Cocoa traffic lights remain pending.
