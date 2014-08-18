#!/bin/bash
echo Updating Raspicade
cd temp/Raspicade-configuration-files
echo Downloading updates
git pull
echo Making updates
./Upgrade.sh
