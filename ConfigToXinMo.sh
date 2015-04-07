#!/bin/bash
echo FrontEnd modification
#cp /home/pi/.emulationstationV1/es_input.cfg-xinmo /home/pi/.emulationstationV1/es_input.cfg
#cp /home/pi/.emulationstationV2/es_input.cfg-xinmo /home/pi/.emulationstationV2/es_input.cfg
cp /home/pi/pimenu/pimenu.cfg-xinmo-2players /home/pi/pimenu/pimenu.cfg
echo Emulators modification
cp /home/pi/.picodrive/config2.cfg-xinmo /home/pi/.picodrive/config2.cfg
cp /home/pi/.dgen/dgenrc-xinmo /home/pi/.dgen/dgenrc
sudo chmod 644 /home/pi/.gngeo/gngeorc
sudo cp /home/pi/.gngeo/gngeorc_xinmo-2players /home/pi/.gngeo/gngeorc
sudo chmod 444 /home/pi/.gngeo/gngeorc
cp /home/pi/mame4all-pi/cfg/default.cfg-xinmo-2players /home/pi/mame4all-pi/cfg/default.cfg
cp /home/pi/mame4all-pi/mame.cfg-xinmo-2players /home/pi/mame4all-pi/mame.cfg
cp /home/pi/pifba/fba2x.cfg-xinmo-2players /home/pi/pifba/fba2x.cfg
cp /home/pi/pisnes/snes9x.cfg-xinmo-2players /home/pi/pisnes/snes9x.cfg
cp -f /home/pi/retro/retroarch.cfg-xinmo-2players /home/pi/retro/retroarch.cfg
cp /home/pi/.config/mupen64plus/mupen64plus.cfg-xinmo-2players /home/pi/.config/mupen64plus/mupen64plus.cfg
