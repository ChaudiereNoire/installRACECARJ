#!/bin/bash
# Download the Stereolabs SDK for the Jetson TX2 (JetPack 3.1 version, CUDA 8.0)
# Then run the installer
echo " "
echo "Downloading and installing the Stereolabs ZED SDK version 2.2.1"
echo "Installer will be placed in ~/ZED unless specified on command line"
echo " "
DEFAULTDIR=~/ZED
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
mkdir -p "$DEFAULTDIR"
cd "$DEFAULTDIR"


#wget https://www.stereolabs.com/developers/downloads/archives/ZED_SDK_Linux_JTX2_v2.2.1.run 
# I will place the file before I kick off the install
chmod +x ZED_SDK_Tegra_L4T32.7_v4.0.5.zstd.run
./ZED_SDK_Tegra_L4T32.7_v4.0.5.zstd.run


