# XZYOS · 小璋瑜OS

> **Made by Tim** · v0.6.0
> A pocket dual-screen SSH terminal + MP3 player + lunar almanac clock for Cardputer ADV

![SSH Terminal](screenshots/ssh-terminal.jpg)
![Lunar Almanac](screenshots/almanac.jpg)
![Music Player](screenshots/music-player.jpg)
![Launcher](screenshots/launcher.jpg)
![Clock + Date](screenshots/clock-date.jpg)
![Dual Screen](screenshots/dual-screen.jpg)

## What It Does

### SSH Terminal (the main feature)
- **Full SSH2 client** built from scratch — curve25519 KEX, AES128-CTR, HMAC-SHA2-256, password auth
- Runs on an **external 320×240 ILI9341 SPI display** — 40×15 VT100 terminal with ANSI 16-color, blinking cursor
- **Chinese text support** (GB2312 Level 1+2 bitmap font, 6,886 glyphs)
- Tested against **OpenSSH 10.3 / zsh / vim / htop** — full-screen TUI apps work
- Config stored in NVS (host, port, user, password)
- Long-press key repeat (hold backspace to delete, hold arrows to move in vim)
- Flow control window management

### MP3 Player
- SD card playback via esp-audio-dec hardware decode
- Dual-screen: inner 240×135 shows controls, external 320×240 shows Braun-style visualization (clock + spectrum + track name)
- Resume from last position, long-press seek, software volume with perceptual curve

### Lunar Clock (3 modes, Tab to switch)
| Mode | Content |
|---|---|
| 1 | Large DSEG7 LED clock with blinking colon |
| 2 | Date + weekday + Chinese lunar calendar (干支 year, lunar month/day) |
| 3 | Full almanac: four pillars (八字), five elements (五行), daily auspicious/inauspicious activities (宜忌), lucky clothing colors |

All lunar calculations verified against the [`cnlunar`](https://pypi.org/project/cnlunar/) Python library across 2,150 test dates.

### Settings
- Wi-Fi connection (NVS persistent) · SNTP time sync · System info

## Hardware

- **Cardputer ADV** (ESP32-S3, 8MB Flash, no PSRAM)
- External **ILI9341 320×240 SPI display** (via Prokuon Cap TFT V2 adapter, shares bus with SD card)
- TCA8418 keyboard (4×14 matrix + Fn/Ctrl/Opt/Alt/Shift modifiers)
- microSD card slot
- ES8311 codec + speaker

## Install

### Flash with esptool

```bash
./flash.sh /dev/cu.usbmodem-XXXXX
```

Or directly:

```bash
esptool.py --chip esp32s3 -p PORT -b 460800 write_flash \
  0x0      firmware/bootloader_0x0.bin \
  0x8000   firmware/partitions_0x8000.bin \
  0x10000  firmware/xzyos_0x10000.bin
```

> Filenames indicate flash addresses (`name_address.bin`). All three files are required.

## Keyboard Reference

| Input | Action |
|---|---|
| `,` `.` `/` `;` (no modifier) | Type punctuation directly — IPs and URLs work without any modifier |
| `Fn` + `,` `.` `/` `;` | Arrow keys ←↓→↑ |
| `Ctrl` + letter | Control characters (Ctrl+C, etc.) |
| `Shift` | Uppercase / symbols |
| `Alt` + key | ESC prefix (Meta) |
| `Esc` (short) | Send ESC to remote |
| `Esc` (hold 600ms) | Exit to launcher |
| `Enter` | Confirm / next field / play-pause |
| `Tab` (in Clock) | Switch external display mode |

## Version

| Version | Notes |
|---|---|
| 0.6.0 | Initial public release: SSH terminal + MP3 player + lunar clock + Wi-Fi settings |

---

**XZYOS · 小璋瑜OS** · Made by Tim · 0.6.0

[中文说明](README_CN.md)
