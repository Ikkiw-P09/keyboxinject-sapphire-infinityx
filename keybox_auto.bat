@echo on

for /f "delims=" %%I in ('powershell -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set "TIMESTAMP=%%I"

set "USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
set "PAGE_URL=https://droidwin.com/droidwin-keybox-module-gives-you-a-new-unrevoked-keybox/"
set "DEVICE_FOLDER=/storage/emulated/0/KeyBoxInject"
set "OLD_FOLDER=%DEVICE_FOLDER%/_old"

for /f "delims=" %%I in ('powershell -Command "[regex]::Match((Invoke-RestMethod -Uri '%PAGE_URL%' -UserAgent '%USER_AGENT%'), 'https://droidwin\.com/wp-content/uploads/\d{4}/\d{2}/droidwin-keybox[-a-zA-Z0-9_\.]*\.zip').Value"') do set "LATEST_ZIP=%%I"

if "%LATEST_ZIP%"=="" exit /b 1

curl -L -A "%USER_AGENT%" -o latest_keybox.zip "%LATEST_ZIP%"

if not exist latest_keybox.zip exit /b 1

tar -xf latest_keybox.zip keybox.xml

if not exist keybox.xml (
    del /f /q latest_keybox.zip keybox.xml 2>nul
    exit /b 1
)

adb shell mkdir -p "%OLD_FOLDER%"

adb push keybox.xml "%DEVICE_FOLDER%/keybox.xml"
timeout /t 1 /nobreak >nul

del /f /q latest_keybox.zip keybox.xml 2>nul

adb shell am start -n com.android.settings/.Settings\$InfinitySuiteActivity
timeout /t 2 /nobreak >nul

adb shell input swipe 540 2000 540 300 300
timeout /t 1 /nobreak >nul
adb shell input swipe 540 2000 540 300 300
timeout /t 1 /nobreak >nul

adb shell input tap 540 2065
timeout /t 1 /nobreak >nul
adb shell input tap 385 510
timeout /t 1 /nobreak >nul
adb shell input tap 460 970
timeout /t 1 /nobreak >nul
adb shell input tap 420 1280
timeout /t 2 /nobreak >nul
adb shell input tap 800 515
timeout /t 2 /nobreak >nul

adb shell mv "%DEVICE_FOLDER%/keybox.xml" "%OLD_FOLDER%/keybox_%TIMESTAMP%.xml"

adb shell am force-stop com.google.android.gms
adb shell am force-stop com.android.vending
timeout /t 1 /nobreak >nul

adb shell am start -n gr.nikolasspyr.integritycheck/.MainActivity
timeout /t 3 /nobreak >nul
adb shell input tap 550 1560

scrcpy
