#!/bin/bash
echo FrontEnd modification
#cp ~/.emulationstationV1/es_input.cfg-xinmo ~/.emulationstationV1/es_input.cfg
#cp ~/.emulationstationV2/es_input.cfg-xinmo ~/.emulationstationV2/es_input.cfg
cp ~/pimenu/pimenu.cfg-xinmo-2players ~/pimenu/pimenu.cfg
echo Emulators modification
cp ~/.picodrive/config2.cfg-xinmo ~/.picodrive/config2.cfg
cp ~/.dgen/dgenrc-xinmo ~/.dgen/dgenrc
sudo chmod 644 ~/.gngeo/gngeorc
sudo cp ~/.gngeo/gngeorc_xinmo-2players ~/.gngeo/gngeorc
sudo chmod 444 ~/.gngeo/gngeorc
cp ~/mame4all-pi/default.cfg-xinmo-2players ~/mame4all-pi/default.cfg
cp ~/mame4all-pi/mame.cfg-xinmo-2players ~/mame4all-pi/mame.cfg
cp ~/pifba/fba2x.cfg-xinmo-2players ~/pifba/fba2x.cfg
cp ~/pisnes/snes9x.cfg-xinmo-2players ~/pisnes/snes9x.cfg
cp ~/retro/retroarch.cfg-xinmo ~/retro/retroarch.cfg
