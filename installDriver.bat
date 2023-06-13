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
call %ADB_TOOL% shell "sushell -c 'echo \#!/system/bin/sh > /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \#\#\# BEGIN INIT INFO >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Exec: ready >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Process: new >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \### END INIT INFO >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo VERSION_NUMBER="1.2.0" >> /data/init.d/powerblock'"
echo 10%%
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo # Common path for all GPIO access >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo BASE_GPIO_PATH=/sys/class/gpio >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo # Assign names to GPIO pin numbers >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo STATUS_PIN=17 >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo SHUTDOWN_PIN=18 >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo # Assign names to states >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo STATE_ON="1" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo STATE_OFF="0" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo doRun=\$STATE_ON >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
echo 25%%
call %ADB_TOOL% shell "sushell -c 'echo \# Exports a pin if not already exported >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$1: pin number >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo exportPin\(\) \{ >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo if \[ \! -e \"\$BASE_GPIO_PATH/gpio\$1\" \]\; then >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo echo \"\$1\" \> \"\$BASE_GPIO_PATH/export\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo fi >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Set a pin as an output >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$1: pin number to be set as output pin >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setDirectionOutput\(\) \{ >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   echo \"out\" \> \"\$BASE_GPIO_PATH/gpio\$1/direction\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Set a pin as an output >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$1: pin number to be set as output pin >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setDirectionInput\(\) { >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo echo \"in\" \> \"\$BASE_GPIO_PATH/gpio\$1/direction\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Set value of a pin >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$1: pin number >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$2: output value. Can be 0 or 1 >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setPinValue\(\) \{ >> /data/init.d/powerblock'"
echo 50%%
call %ADB_TOOL% shell "sushell -c 'echo echo \"\$2\" \> \"\$BASE_GPIO_PATH/gpio\$1/value\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Returns the current pin value >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Parameter \$1: pin number to be read from >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo getPinValue\(\) \{ >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo cat \"\$BASE_GPIO_PATH/gpio\$1/value\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo doShutdown\(\) { >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   reboot -p  \# Android call for shutting down the system >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   doRun=\$STATE_OFF >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \} >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo exportPin \"\$STATUS_PIN\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo exportPin \"\$SHUTDOWN_PIN\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setDirectionOutput \"\$STATUS_PIN\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setDirectionInput \"\$SHUTDOWN_PIN\" >> /data/init.d/powerblock'"
echo 75%%
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo setPinValue \"\$STATUS_PIN\" \"\$STATE_ON\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo  >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo echo \"PowerBlock Service started, version \$VERSION_NUMBER\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo log -p i -t \"PowerBlock\" \"Service started, version \$VERSION_NUMBER\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo \# Poll shutdown signal once per second >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo while \[ \"\$doRun\" -eq \"\$STATE_ON\" \]\; do >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   sleep 1 >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   currentValue=\$\(getPinValue \"\$SHUTDOWN_PIN\"\) >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   if \[ \"\$currentValue\" -eq \"\$STATE_ON\" \]\; then >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo     echo \"PowerBlock Shutdown signal detected.\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo     log -p i -t \"PowerBlock\" \"Shutdown signal detected.\" >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo     doShutdown >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo   fi >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo done >> /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'echo >> /data/init.d/powerblock'"

call %ADB_TOOL% shell "sushell -c 'chown root:system /data/init.d/powerblock'"
call %ADB_TOOL% shell "sushell -c 'chmod 0755 /data/init.d/powerblock'"
echo 100%%. Done.

echo Finished file transfer and configuration. Rebooting the device. 
call %ADB_TOOL% shell reboot
call %ADB_TOOL% disconnect

echo DONE.
