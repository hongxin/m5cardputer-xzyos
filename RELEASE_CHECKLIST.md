# XZYOS 发布清单

## 隐私检查
- [x] 二进制文件扫描：不含主机名 / 用户路径 / MAC 地址
- [x] 无源代码发布
- [x] SSH 配置（host/user/pass）存储于设备 NVS，不在固件内
- [x] Wi-Fi 凭据同上
- [x] README 无个人真实姓名 / 手机号 / 邮箱

## 发布内容
- [x] firmware/bootloader_0x0.bin (21KB)
- [x] firmware/partitions_0x8000.bin (3KB)
- [x] firmware/xzyos_0x10000.bin (2.4MB)
- [x] flash.sh 烧录脚本
- [x] README.md 功能说明 + 安装指南
- [x] m5burner.json M5Burner 元数据
- [ ] screenshots/ （可选，后续补充）

## 后续版本规划
- 滚动回看（scrollback）
- SSH rekey 支持
- 繁体字库（全量 GBK）
