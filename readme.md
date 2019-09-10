# PowerBlock-Emteria

This repository contains the installer for the PowerBlock driver for [Emteria](https://emteria.com/).

## Pre-Requisites

1. The installation script needs the Android SDK Platform Tools. You can download them from [https://developer.android.com/studio/releases/platform-tools](https://developer.android.com/studio/releases/platform-tools).

2. When you have installed the SDK Platform Tools, you need to set the variable `ADB_TOOL` in the file `installDriver.bat` to the correct path of your ADB installation.

3. You need to enable 'Enable ADB over Ethernet' in your Emteria installation: Open 'Settings', 'Emteria'. Activate the option 'Enable ADB over Ethernet'.

## Installation Instructions

1. If you have not done so already, make sure to do all the described steps from the Section "Pre-Requesites" above.

2. Execute the batch file `installDriver.bat`.

3. Shutdown your Emteria device and connect the PowerBlock with the Raspberry Pi. Make sure to also connect the USB power to the PowerBlock.

4. You should now be able to start and shutdown your Emteria device with the PowerBlock.


Good luck with your project!