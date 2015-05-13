#!/bin/bash
echo FrontEnd modification
#cp /home/pi/.emulationstationV1/es_input.cfg-gamepads /home/pi/.emulationstationV1/es_input.cfg
#cp /home/pi/.emulationstationV2/es_input.cfg-gamepads /home/pi/.emulationstationV2/es_input.cfg
cp /home/pi/pimenu/pimenu.cfg-gamepads /home/pi/pimenu/pimenu.cfg
echo Emulators modification
cp /home/pi/.picodrive/config2.cfg-gamepads /home/pi/.picodrive/config2.cfg
cp /home/pi/.dgen/dgenrc-gamepads /home/pi/.dgen/dgenrc
sudo chmod 644 /home/pi/.gngeo/gngeorc
sudo cp /home/pi/.gngeo/gngeorc_gamepads  /home/pi/.gngeo/gngeorc
sudo chmod 444 /home/pi/.gngeo/gngeorc
cp /home/pi/mame4all-pi/mame.cfg-gamepads /home/pi/mame4all-pi/mame.cfg
cp /home/pi/mame4all-pi/cfg/default.cfg-gamepads /home/pi/mame4all-pi/cfg/default.cfg
cp /home/pi/pifba/fba2x.cfg-gamepads /home/pi/pifba/fba2x.cfg
cp /home/pi/pisnes/snes9x.cfg-2players  /home/pi/pisnes/snes9x.cfg
cp -f /home/pi/retro/retroarch.cfg-gamepads /home/pi/retro/retroarch.cfg
cp /home/pi/.config/mupen64plus/mupen64plus.cfg-gamepads-auto /home/pi/.config/mupen64plus/mupen64plus.cfg
cp /home/pi/.advance/advmame.rc-gamepads /home/pi/.advance/advmame.rc
