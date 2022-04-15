
@echo off
title Display Connector By Aaliq

echo Display Connector By Aaliq
echo --------------------------
echo Press 1 For Wired
echo Press 2 For Wireless
set /p ch=
if %ch% == 1 goto Wired
if %ch% == 2 goto Wireless
:Wired
echo Wired Mode!
adb -d usb
echo connecting...
sleep 2
scrcpy
adb disconnect
adb kill-server
echo BYEE
sleep 2
exit /b
:Wireless
echo Wireless Mode!
adb -d tcpip 5555
sleep 2
adb shell ip addr show wlan0 | grep "inet\s" | awk '{print $2}' | awk -F'/' '{print $1}' >> "%temp%\temp.txt
for /f "delims=" %%i in ('sed -n '1p' %temp%\temp.txt') do set ip=%%i
echo connecting to %ip%:5555....
sleep 1
adb connect %ip%:5555
scrcpy -s %ip%:5555
adb disconnect %ip%:5555
adb disconnect
adb -d usb
adb kill-server
echo BYEE
sleep 2
exit /b