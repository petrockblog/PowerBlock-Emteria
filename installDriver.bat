@echo off

rem This script installs the PowerBlock service on an
rem Emteria installation. 
rem Android 13 is the minimum acceptable version.

rem Adapt the following variables according to your setup
rem You might need to install the Android SDK Platform Tools to get the ADB tool
rem You can get it at https://developer.android.com/studio/releases/platform-tools

SET ADB_TOOL=C:\Users\florian\Desktop\platform-tools\adb.exe
SET IP_OF_DEVICE=192.168.0.115
SET ADB_PORT=5555


rem DO NOT MAKE ANY MODIFICATIONS BELOW THIS LINE

rem Initialization
echo Connecting to device
call %ADB_TOOL% connect %IP_OF_DEVICE%:%ADB_PORT%

rem Install service shell script
echo Installing service shell script
adb shell sushell <<EOF
cat > /data/init.d/powerblock <<CONTENT
$(type powerblock)
CONTENT

EOF

call %ADB_TOOL% shell sushell -c chown root:system /system/bin/powerblockservice
call %ADB_TOOL% shell sushell -c chmod 0755 /data/init.d/powerblock

call %ADB_TOOL% shell reboot

echo Disconnecting from device
call %ADB_TOOL% disconnect

echo Finished file transfer and configuration. Rebooting.
set /p DUMMY=Hit ENTER to close finish...