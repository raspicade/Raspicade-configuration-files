#!/bin/bash
killall emulationsation
killall pimenu
cd ~/temp/Raspicade-configuration-files
echo Downloading updates from git into temp/
git pull
echo Launching full Upgrade
./Upgrade.sh
