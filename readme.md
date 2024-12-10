# PowerBlock-Emteria

The [PowerBlock](https://blog.petrockblock.com/powerblock/) is an extension board for the Raspberry Pi. Its key features include a safe power button functionality and LED status indication.

This repository contains the installer for the [PowerBlock](https://blog.petrockblock.com/powerblock/) driver for [Emteria](https://emteria.com/), an Android distribution.

![PowerBlock attached to Raspberry Pi](powerblock_thumb.jpg)

## Pre-Requisites for Driver Installation

1. **Android SDK Platform Tools**: Download the tools from [here](https://developer.android.com/studio/releases/platform-tools).

2. **Set `ADB_TOOL`**: Open the `installDriver.bat` file and set the `ADB_TOOL` variable to the correct path of your ADB installation.

3. **Set `IP_OF_DEVICE`**: In the `installDriver.bat` file, set the `IP_OF_DEVICE` variable to the correct IP address of your device.

4. **Enable ADB over Ethernet**: In your Emteria installation, open 'Settings' > 'Emteria' and activate 'Enable ADB over Ethernet'.

## Installation Instructions

1. **Complete Pre-Requisites**: Ensure you have completed all the steps in the "Pre-Requisites for Driver Installation" section.

2. **Connect PowerBlock**: We recommend attaching the PowerBlock and switch to the Raspberry Pi during driver installation. Also, connect USB power to the PowerBlock. The driver installation should still work without the PowerBlock being attached, though.

3. **Run `installDriver.bat`**: Execute the batch file `installDriver.bat` from the Windows command line.

4. **Verify Installation**: Once the installation is finished, your Emteria device will reboot. The PowerBlock status LED should indicate it is working by showing a continuous signal.

5. **Use the PowerBlock**: You can now start and shut down your Emteria device using the PowerBlock.

Good luck with your project!
