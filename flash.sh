#!/bin/bash
# XZYOS v0.6.0 烧录脚本 — 用法: ./flash.sh /dev/cu.usbmodem-XXXXX
set -e
PORT="${1:?用法: ./flash.sh /dev/cu.usbmodem-XXXXX}"
cd "$(dirname "$0")"
esptool.py --chip esp32s3 -p "$PORT" -b 460800 \
  --before default_reset --after hard_reset write_flash \
  0x0      firmware/bootloader_0x0.bin \
  0x8000   firmware/partitions_0x8000.bin \
  0x10000  firmware/xzyos_0x10000.bin
echo "烧录完成 ✔ 设备将自动重启进入 XZYOS"
