# 🚀 KeyboxInject (Sapphire / Project Infinity X)

An automated ADB shell script designed to fetch the latest Keybox module from Droidwin, inject it into Project Infinity X settings, reset GMS attestation, and run Play Integrity Checker without requiring root access.

---

## 📱 Compatibility
* **Device:** Redmi Note 13 4G / 4G NFC (`sapphire` / `sapphiren`)
* **Display:** 1080x2400 @ ~395 DPI *(Required due to hardcoded tap coordinates)*
* **ROM:** Project Infinity X 3.12
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
Make sure your PC has the following tools installed and added to PATH:
* `adb` (Android Debug Bridge)
* `curl`
* `unzip`
* `scrcpy`

*(And ensure **USB Debugging** is enabled on your Android device)*

---

## 🚀 How to Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ikkiw-P09/keyboxinject-sapphire-infinityx.git
   cd keyboxinject-sapphire-infinityx
   ```

2. **Make the script executable:**
   ```bash
   chmod +x keybox_auto.sh
   ```

3. **Connect your phone via USB and run:**
   ```bash
   ./keybox_auto.sh
   ```

---

## 🙏 Credits
* **[Droidwin](https://droidwin.com/)** for providing the Keybox modules.
* **[Project Infinity X Team](https://projectinfinity-x.com/)** for the ROM.
* **[nikolasspyr](https://github.com/nikolasspyr/PlayIntegrityChecker)** for the Play Integrity API Checker app.

---

## ⚠️ Disclaimer
This script is provided for educational and personal automation purposes only. The touch coordinates are strictly mapped to 1080x2400 (395 DPI) screen layouts. Use at your own risk.
