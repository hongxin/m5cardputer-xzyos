# Reddit r/CardPuter 发帖草稿

## Title

**XZYOS — a dual-screen SSH terminal + MP3 player + lunar almanac clock for Cardputer ADV (with an external 320×240 SPI display)**

---

## Body

Hey folks!

I've been working on a custom firmware for the Cardputer ADV (ESP32-S3) that turns it into a pocket SSH terminal with a big external display. Just released v0.6.0 — binaries only, no source (for now).

### What it does

**SSH Terminal** (the main feature):
- Full SSH2 client implemented from scratch (curve25519 + AES128-CTR + HMAC-SHA2-256)
- Runs on the external 320×240 ILI9341 SPI display — 40×15 VT100 terminal with ANSI 16-color, blinking cursor, and Chinese character support (GB2312 bitmap font)
- Tested against OpenSSH 10.3 / zsh / vim / htop — full-screen TUI apps work
- Password auth, config stored in NVS, long-press key repeat (hold backspace to delete, hold arrows to move in vim)
- Flow control window management, so heavy output like `cat` doesn't stall

**MP3 Player**:
- SD card playback via esp-audio-dec hardware decode
- Dual-screen visualization: inner 240×135 shows controls, external 320×240 shows a Braun-style clock face + spectrum analyzer + track name
- Resume from last position, long-press seek, software volume with perceptual curve

**Lunar Clock** (3 modes, Tab to switch):
1. Large DSEG7 LED clock with blinking colon
2. Date + weekday + Chinese lunar calendar date
3. Full almanac page: four pillars (八字 BaZi), five elements (五行), daily auspicious/inauspicious activities (宜忌), and lucky clothing colors shown as little T-shirt icons

All verified against the `cnlunar` Python library for accuracy across 2,150 test dates.

### Hardware

- Cardputer ADV (ESP32-S3, 8MB flash, no PSRAM)
- External ILI9341 320×240 SPI display (shares bus with SD card)
- The display connects via the Prokuon Cap TFT V2 adapter board

### Keyboard

Follows the standard Cardputer layout:
- Plain `,` `.` `/` `;` = type punctuation directly (for IPs and URLs)
- `Fn` + those keys = arrow keys
- `Ctrl` + letter = control characters
- `Esc` short = send ESC, long hold = exit app

### Download

**GitHub**: https://github.com/hongxin/m5cardputer-xzyos

Binaries + flash script included. No source code at this time.

---

**Made by Tim** · XZYOS (小璋瑜OS) · v0.6.0

Would love feedback, especially from anyone with a Cardputer ADV + external display setup!

---

## 发帖备注（不用贴到 Reddit）

- **附图**: 发帖时直接把这 6 张图片作为 Reddit 帖的图片附件上传（Reddit 不支持 Markdown 引用外部图，需直接上传）
  - `screenshots/ssh-terminal.jpg` — SSH 终端
  - `screenshots/almanac.jpg` — 黄历四柱八字
  - `screenshots/music-player.jpg` — 音乐播放器
  - `screenshots/launcher.jpg` — Launcher 主界面
  - `screenshots/clock-date.jpg` — 时钟+日期模式
  - `screenshots/dual-screen.jpg` — 双屏全景

- **Subreddit**: r/CardPuter (约 10K 成员，活跃度高)
- **最佳发帖时间**: 北美工作日上午 9-11 点 EST（约北京时间晚上 10-12 点）
- **建议附图**: 外屏 SSH 终端运行 vim/htop 的照片、黄历页照片、音乐可视化照片 — 图片帖在 Reddit 的互动率远高于纯文字
- **Flair**: 如果板块有 "Project" 或 "Firmware" flair 记得选上
- **备选标题**（如果觉得上面太长）:
  - "XZYOS: SSH terminal + lunar almanac on Cardputer ADV with external display"
  - "I built a pocket SSH client with Chinese terminal support for Cardputer ADV"
