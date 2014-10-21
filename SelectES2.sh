#!/bin/bash
echo Selecting EmulationStation2
rm /home/pi/.profile
ln -s /home/pi/.profileES /home/pi/.profile
rm /home/pi/.emulationstation /home/pi/EmulationStation
ln -s /home/pi/EmulationStationV2 /home/pi/EmulationStation
ln -s /home/pi/.emulationstationV2 /home/pi/.emulationstation
