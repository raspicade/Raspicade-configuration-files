#!/bin/bash
killall retrogame
killall emulationstation
killall pimenu
cd ~/temp/Raspicade-configuration-files
echo Downloading updates from git into temp/
#only last release
#git clone --depth 1 https://github.com/ian57/Raspicade-configuration-files.git
git pull --depth 1
echo Launching full Upgrade
./Upgrade.sh
