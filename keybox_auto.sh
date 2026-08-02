#!/bin/bash

exec > >(tee -a run_keybox.log) 2>&1
set -x

USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
PAGE_URL="https://droidwin.com/droidwin-keybox-module-gives-you-a-new-unrevoked-keybox/"
DEVICE_FOLDER="/storage/emulated/0/KeyBoxInject"
OLD_FOLDER="$DEVICE_FOLDER/_old"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

LATEST_ZIP=$(curl -L -A "$USER_AGENT" "$PAGE_URL" 2>/dev/null | grep -oE 'https://droidwin\.com/wp-content/uploads/[0-9]{4}/[0-9]{2}/droidwin-keybox[-a-zA-Z0-9_\.]*\.zip' | head -n 1)

if [ -z "$LATEST_ZIP" ]; then
    exit 1
fi

curl -L -A "$USER_AGENT" -o latest_keybox.zip "$LATEST_ZIP"

if [ ! -f "latest_keybox.zip" ]; then
    exit 1
fi

unzip -p latest_keybox.zip '*keybox.xml' > keybox.xml

if [ ! -s "keybox.xml" ]; then
    rm -f latest_keybox.zip keybox.xml
    exit 1
fi

adb shell mkdir -p "$OLD_FOLDER"

adb push keybox.xml "$DEVICE_FOLDER/keybox.xml"
sleep 1

rm -f latest_keybox.zip keybox.xml

adb shell am start -n com.android.settings/.Settings\\\$InfinitySuiteActivity
sleep 2

adb shell input swipe 540 2000 540 300 300
sleep 1

adb shell input tap 540 2065
sleep 1
adb shell input tap 385 510
sleep 1
adb shell input tap 460 970
sleep 1
adb shell input tap 420 1280
sleep 2
adb shell input tap 800 515
sleep 2

adb shell mv "$DEVICE_FOLDER/keybox.xml" "$OLD_FOLDER/keybox_$TIMESTAMP.xml"

adb shell am force-stop com.google.android.gms
adb shell am force-stop com.android.vending
sleep 1

adb shell am start -n gr.nikolasspyr.integritycheck/.MainActivity
sleep 3
adb shell input tap 550 1560

scrcpy

set +x
