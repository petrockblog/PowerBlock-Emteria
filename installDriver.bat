@echo off

rem This script installs the PowerBlock service on an
rem Emteria installation.

rem Adapt the following variables according to your setup
rem You might need to install the Android SDK Platform Tools to get the ADB tool
rem You can get it at https://developer.android.com/studio/releases/platform-tools

SET ADB_TOOL=C:\Users\username\AppData\Local\Android\Sdk\platform-tools\adb.exe
SET IP_OF_DEVICE=192.168.0.187
SET ADB_PORT=5555


rem DO NOT MAKE ANY MODIFICATIONS BELOW THIS LINE

rem Initialization
echo Connecting to device
call %ADB_TOOL% connect %IP_OF_DEVICE%:%ADB_PORT%
call %ADB_TOOL% root
call %ADB_TOOL% remount

rem Install service shell script
echo Installing service shell script
call %ADB_TOOL% push powerblockservice /system/bin/powerblockservice
call %ADB_TOOL% shell chown system:shell /system/bin/powerblockservice
call %ADB_TOOL% shell chmod u=rwx /system/bin/powerblockservice
call %ADB_TOOL% shell chmod g=r /system/bin/powerblockservice
call %ADB_TOOL% shell chmod o=r /system/bin/powerblockservice

rem Install kick-starter script
rem echo Installing kick-starter script
call %ADB_TOOL% push powerblock-kickstart /data/init.d/powerblock-kickstart
call %ADB_TOOL% shell chown system:shell /data/init.d/powerblock-kickstart
call %ADB_TOOL% shell chmod u=rwx /data/init.d/powerblock-kickstart
call %ADB_TOOL% shell chmod g=r /data/init.d/powerblock-kickstart
call %ADB_TOOL% shell chmod o=r /data/init.d/powerblock-kickstart

echo Disconnecting from device
call %ADB_TOOL% disconnect

echo Finished file transfer and configuration.
echo You need to reboot the device to finish the driver installation!
