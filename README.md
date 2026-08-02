# 🚀 KeyboxInject (for Redmi Note 13 4G/NFC (sapphire/sapphiren) on Project Infinity X 3.12 or newer)

An automated ADB shell script designed to fetch the latest Keybox module from Droidwin, inject it into Project Infinity X settings, reset GMS attestation, and run Play Integrity Checker without requiring root access.

---

## 📱 Compatibility
* **Device:** Redmi Note 13 4G / 4G NFC (`sapphire` / `sapphiren`)
* **Display:** 1080x2400 @ ~395 DPI *(Required due to hardcoded tap coordinates)*
* **ROM:** Project Infinity X 3.12 or newer
* **Root Required:** **No** *(Works on non-rooted devices via ADB)*

---

## ✨ Features
* **Auto Web Scraping:** Automatically fetches and downloads the latest Keybox module from Droidwin.
* **Auto Extraction:** Unzips the module and extracts `keybox.xml` on the fly.
* **Directory Management:** Pushes the file to `/storage/emulated/0/KeyBoxInject/` (creates the directory if missing).
* **Zero-Touch UI Automation:** Navigates through Infinity Suite settings and injects the Keybox automatically.
* **Archiving System:** Moves used Keybox files to `_old/` with a timestamp after injection.
* **GMS Attestation Reset:** Force stops Google Play Services and Play Store to apply changes.
* **Auto Integrity Check:** Launches Play Integrity API Checker, triggers the test, and opens `scrcpy` for real-time monitoring.

---

## 📋 Prerequisites

### On your PC:
* `adb` (Android Debug Bridge)
* `curl`
* `unzip`
* `scrcpy`

### On your Android Device:
* **[Play Integrity API Checker](https://play.google.com/store/apps/details?id=gr.nikolasspyr.integritycheck)** app must be pre-installed (`gr.nikolasspyr.integritycheck`).
* **USB Debugging** enabled and authorized for your PC.

---

## ⚠️ Important Instructions Before Running
1. **Unlock your phone screen** – The screen must be awake and unlocked so touch commands (`input tap`) can be executed.
2. **Close all Settings and Recent Apps** – Swipe away the Settings app from recent apps to ensure a clean UI navigation and prevent "Activity not started" conflicts.
3. **Ensure Play Integrity Checker is installed** – The script will automatically launch this app to verify the result.

---

## 🚀 How to Use

### 🐧 Linux / 🍎 macOS
1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ikkiw-P09/keyboxinject-sapphire-infinityx.git
   cd keyboxinject-sapphire-infinityx
   ```

2. **Make executable and run:**
   ```bash
   chmod +x keybox_auto.sh
   ./keybox_auto.sh
   ```

### 🪟 Windows (CMD / PowerShell)
1. **Clone or Download the repository.**
2. **Run `keybox_auto.bat` directly in Command Prompt or PowerShell:**
   ```cmd
   keybox_auto.bat

---

## 🙏 Credits
* **[Droidwin](https://droidwin.com/)** for providing the Keybox modules.
* **[Project Infinity X Team](https://projectinfinity-x.com/)** for the ROM.
* **[nikolasspyr](https://github.com/nikolasspyr/PlayIntegrityChecker)** for the Play Integrity API Checker app.

---

## ⚠️ Disclaimer
This script is provided for educational and personal automation purposes only. The touch coordinates are strictly mapped to 1080x2400 (395 DPI) screen layouts. Use at your own risk.

---
