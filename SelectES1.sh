#!/bin/bash
echo Selecting EmulationStation1
rm /home/pi/.profile
ln -s /home/pi/.profileES /home/pi/.profile
rm /home/pi/.emulationstation /home/pi/EmulationStation
ln -s /home/pi/EmulationStationV1 /home/pi/EmulationStation
ln -s /home/pi/.emulationstationV1 /home/pi/.emulationstation

