@echo off

rem This script installs the PowerBlock service on an
rem Emteria installation. 
rem Android 14 and Raspberry Pi 5 is the acceptable system.

rem Adapt the following variables according to your setup
rem You might need to install the Android SDK Platform Tools to get the ADB tool
rem You can get it at https://developer.android.com/studio/releases/platform-tools

SET ADB_TOOL=C:\Users\florian\Desktop\platform-tools\adb.exe
SET IP_OF_DEVICE=192.168.0.182
SET ADB_PORT=5555


rem DO NOT MAKE ANY MODIFICATIONS BELOW THIS LINE

rem Initialization
echo Connecting to device
call %ADB_TOOL% connect %IP_OF_DEVICE%:%ADB_PORT%

rem Install service shell script
echo Installing init.d script...
call %ADB_TOOL% push powerblock /sdcard/
call %ADB_TOOL% shell "sushell -c 'mv -f /sdcard/powerblock /data/init.d/'"
call %ADB_TOOL% shell "sushell -c 'chown root:system /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'chmod 0755 /data/init.d/powerblock'"

echo Installing libgpiod...
call %ADB_TOOL% push ./libgpiod/gpioset /sdcard/
call %ADB_TOOL% push ./libgpiod/gpioget /sdcard/
call %ADB_TOOL% push ./libgpiod/libgpiod.so /sdcard/
call %ADB_TOOL% shell "sushell -c 'mkdir /data/user/libgpiod'"
call %ADB_TOOL% shell "sushell -c 'mv -f /sdcard/gpioset /data/user/libgpiod/'"
call %ADB_TOOL% shell "sushell -c 'mv -f /sdcard/gpioget /data/user/libgpiod/'"
call %ADB_TOOL% shell "sushell -c 'mv -f /sdcard/libgpiod.so /data/user/libgpiod/'"
call %ADB_TOOL% shell "sushell -c 'chown root:system /data/user/libgpiod/*'"
call %ADB_TOOL% shell "sushell -c 'chmod 0755 /data/user/libgpiod/*'"
call %ADB_TOOL% shell "sushell -c 'chmod -x /data/user/libgpiod/libgpiod.so'"

echo Done.

echo Finished file transfer and configuration. Rebooting the device. 
rem call %ADB_TOOL% shell reboot
rem call %ADB_TOOL% disconnect

echo DONE.
