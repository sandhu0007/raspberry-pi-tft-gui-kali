# Raspberry Pi TFT GUI + Kali Tools Setup

This repo contains everything needed to set up a 3.5" GPIO TFT screen (like GoodTFT) with Raspberry Pi OS 32-bit Desktop and install Kali Linux tools using `katoolin3`.

## 📦 Contents

- `LCD-show/` - Cloned GoodTFT installer (required to get display working)
- `scripts/` - Automation scripts (optional enhancements)
- `configs/` - Sample `config.txt` and `xorg.conf` settings

---

## ✅ Step 1: Enable TFT Display with GoodTFT Drivers

Open terminal on your Raspberry Pi OS 32-bit Desktop:

```bash
sudo rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git
chmod -R 755 LCD-show
cd LCD-show
sudo ./LCD35-show
```

This will:
- Configure framebuffer overlays
- Set up X11 redirect to /dev/fb0
- Reboot Pi

---

## ✅ Step 2: Verify Framebuffer

After reboot, run:

```bash
ls /dev/fb*
cat /sys/class/graphics/fb0/name
```

Expected output:

```
/dev/fb0
fb_ili9340
```

If you see that, your screen is ready.

---

## ✅ Step 3: Install Kali Tools on Raspberry Pi OS

```bash
sudo apt update
sudo apt install git -y
git clone https://github.com/s-h-3-l-l/katoolin3
cd katoolin3
sudo python3 installer.py
katoolin3
```

Inside `katoolin3`, you can:
- Add Kali Linux repositories
- Install categories of tools
- Or run `install all` for the full set

---

## 📁 Extras

- `scripts/tft_gui_launcher.sh`: Manually launch GUI on TFT via framebuffer
- `configs/config.txt`: Example config for `/boot/firmware/config.txt`
- `configs/99-fbdev.conf`: X11 redirect config for `/usr/share/X11/xorg.conf.d/`

---

## 🧠 Tips

- Ensure SPI is enabled: `sudo raspi-config`
- Use 32-bit Raspberry Pi OS Desktop, NOT Lite or 64-bit
- If stuck on white screen, always try the official `LCD-show` first

---

Created with ❤️ by sandhu
