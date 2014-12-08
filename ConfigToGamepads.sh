#!/bin/bash
echo FrontEnd modification
cp ~/.emulationstationV1/es_input.cfg-gamepads ~/.emulationstationV1/es_input.cfg
cp ~/.emulationstationV2/es_input.cfg-gamepads ~/.emulationstationV2/es_input.cfg
cp ~/pimenu/pimenu.cfg-gamepads ~/pimenu/pimenu.cfg
echo Emulators modification
cp ~/.picodrive/config2.cfg-gamepads ~/.picodrive/config2.cfg
cp ~/.dgen/dgenrc-gamepads ~/.dgen/dgenrc
sudo chmod 644 ~/.gngeo/gngeorc
sudo cp ~/.gngeo/gngeorc_gamepads  ~/.gngeo/gngeorc
sudo chmod 444 ~/.gngeo/gngeorc
cp ~/mame4all-pi/mame.cfg-gamepads ~/mame4all-pi/mame.cfg
cp ~/mame4all-pi/cfg/default.cfg-gamepads ~/mame4all-pi/cfg/default.cfg
cp ~/pifba/fba2x.cfg-gamepads ~/pifba/fba2x.cfg
cp ~/pisnes/snes9x.cfg-2players  ~/pisnes/snes9x.cfg
cp ~/retro/retroarch.cfg-gamepads ~/retro/retroarch.cfg
