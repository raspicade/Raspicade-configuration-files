#!/bin/bash
BACKUPDIR=/home/pi/backupconfig
echo --------------------------------------------
echo --  Upgrade to last release of raspicade  --  
echo --------------------------------------------
if [ ! -d "$BACKUPDIR" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
 mkdir /home/pi/backupconfig
 mkdir /home/pi/backupconfig/mame4all-pi
 mkdir /home/pi/backupconfig/gngeo
 mkdir /home/pi/backupconfig/pifba
 mkdir /home/pi/backupconfig/dgen
 mkdir /home/pi/backupconfig/picodrive
 mkdir /home/pi/backupconfig/pisnes
 mkdir /home/pi/backupconfig/retro
 mkdir /home/pi/backupconfig/emulationstation
fi
read -rsp $'Press any key to continue...\n' -n1 key
today=`date +%Y-%m-%d.%H_%M_%S`
echo Backup of old config files
echo Backup of boot/config.txt
sudo cp /boot/config.txt /home/pi/backupconfig/config.txt_$today
echo For Mame
cp /home/pi/mame4all-pi/mame.cfg /home/pi/backupconfig/mame4all-pi/mame.cfg_$today
cp -r  /home/pi/mame4all-pi/cfg /home/pi/backupconfig/mame4all-pi/cfg_$today
echo For Gngeo
cp -r /home/pi/.gngeo /home/pi/backupconfig/gngeo/.gngeo_$today
echo For Dgen
cp -r /home/pi/.dgen /home/pi/backupconfig/dgen/.dgen_$today
echo For EmulationStation
cp -r /home/pi/.emulationstation /home/pi/backupconfig/emulationstation/.emulationstation_$today
echo For Picodrive
cp -r /home/pi/.picodrive /home/pi/backupconfig/picodrive/.picodrive_$today
echo For PiFBA
cp -r  /home/pi/pifba/fba2x.cfg /home/pi/backupconfig/pifba/fba2x.cfg_$today
echo For PiSnes
cp -r  /home/pi/pisnes/snes9x.cfg  /home/pi/backupconfig/pisnes/snes9x.cfg_$today
echo For Retro
cp -r  /home/pi/retro/retroarch.cfg  /home/pi/backupconfig/pisnes/retroarch.cfg_$today
cp -r  /home/pi/retro/retroarch-core-options.cfg  /home/pi/backupconfig/pisnes/retroarch-core-options.cfg_$today
echo Upgrading Raspicade...
read -rsp $'Press any key to continue...\n' -n1 key
echo Apt-Get Update
sudo apt-get update
echo Apt-Get Upgrade
sudo apt-get upgrade
sudo apt-get clean
echo Install libSDL_mixer and libavcodec
sudo apt-get install libsdl-mixer1.2 libavcodec53
#EmulationStation 1 et 2
sudo apt-get install libboost-system1.49.0 libboost-filesystem1.49.0 libfreeimage3
#EmulationStation 2
sudo apt-get install libboost-date-time1.49.0
#install SDL2 2.0.1 libs for ES2
echo installing SDL2 libraries
sudo tar xzf SDL2-2.0.1/libsdl2.0.1.tar.gz -C /
#for scraper
echo installing software for scraper
sudo apt-get install python-imaging
sudo apt-get remove --purge alsa-oss
sudo apt-get clean
sudo apt-get autoremove
echo Update Firmware and Kernel
read -rsp $'Press any key to continue...\n' -n1 key
sudo rpi-update
#echo Downloading Updates
#git pull
echo Copy new file in filesystem tree
read -rsp $'Press any key to continue...\n' -n1 key
echo Moving from ES1  to multi frontend
rm /home/pi/.profile
cp .profileES .profilePI ~/
echo linking to ES by default
ln -s  /home/pi/.profileES  /home/pi/.profile
#cp .profile /home/pi/.profile
echo Copying ESx directory and configuration

if [ -d "/home/pi/EmulationStation" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  rm -rf /home/pi/EmulationStation 
fi
if [ -d "/home/pi/.emulationstation" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  rm -rf /home/pi/.emulationstation
fi
#rm -rf /home/pi/EmulationStation /home/pi/.emulationstation
cp -r EmulationStationV1 EmulationStationV2 .emulationstationV1 .emulationstationV2 ~/
echo Linking to ES1 by default
ln -s /home/pi/EmulationStationV1  /home/pi/EmulationStation
ln -s  /home/pi/.emulationstationV1 /home/pi/.emulationstation
echo Copying new Retrogame programs
cp -r Raspicade-Retrogame-1Player/ ~/
cp -r Raspicade-Retrogame-2Player-BPlus/ ~/
echo Fixing Retrogame bug with ES2
sudo cp etc/udev/rules.d/* /etc/udev/rules.d/
echo Adding Frontend selector at boot
if [ -f "/etc/init.d/apizfrontendconf" ]
then
	sudo rm  /etc/init.d/apizfrontendconf
fi
if [ -f "/etc/init.d/apifrontendconf" ]
then
	sudo rm  /etc/init.d/apifrontendconf
fi
if [ ! -f "/home/pi/avoid_config/no_frontendconf_at_boot.remove_extention_to_deactivate_question" ]
then
	touch /home/pi/avoid_config/no_frontendconf_at_boot.remove_extention_to_deactivate_question
fi
sudo cp etc/init.d/api* /etc/init.d/
sudo chmod a+x /etc/init.d/apipfrontendconf
sudo insserv /etc/init.d/apipfrontendconf
cp pifrontendconf.sh ~/
cp SelectES1.sh SelectES2.sh SelectPIMENU.sh getPiInfo.sh piaudioconf.sh pifrontendconf.sh pinetconf.sh raspicade_update.sh shutdown.sh GetTemp.sh ~/
echo Update Boot directory
sudo cp boot/* /boot
echo Config to 4-3monitor1024x768 by default
sudo cp boot/config.txt-4-3monitor1024x768 /boot/config.txt
echo copying Emulators directories
cp -r pimenu/* ~/pimenu/
cp -r mame4all-pi/* ~/mame4all-pi/
cp -r pifba/* ~/pifba/
cp -r pisnes/* ~/pisnes/
chmod 644 ~/.gngeo/gngeorc
cp -r .gngeo/* ~/.gngeo/
chmod 444 ~/.gngeo/gngeorc
cp -r PicoDrive ~/
cp -r .picodrive ~/
cp -r dgen ~/
cp -r .dgen ~/
cp -r retro ~/
mkdir ~/retro/roms_pcsx ~/retro/roms_fceu
chmod 777 ~/retro/roms_pcsx ~/retro/roms_gambatte ~/retro/roms_meteor ~/retro/roms_vecx ~/retro/roms_stella ~/retro/roms_fceu
#cp -r EmulationStation ~/
#cp -r .emulationstation ~/
if [ ! -d "/home/pi/PicoDrive/romfelix" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir /home/pi/PicoDrive/romfelix
fi
chmod 777 /home/pi/PicoDrive/roms
echo copying Videos directory and stuff for video management from ES1
cp -r videos/ ~/
chmod 777 ~/videos
if [ ! -d "/home/pi/joy2key" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir /home/pi/joy2key
fi
cp joy2key-code/joy2key /home/pi/joy2key
cp playvideo.sh /home/pi/joy2key
cp omxplayer_keys.rc /home/pi
echo Updating  /etc/rc.local
sudo cp etc/rc.local /etc/
echo Updating Samba
sudo cp etc/samba/smb.conf /etc/samba
sudo service samba restart
echo EmulationStation1 : Put scraper stuff in the good directory
cp ES-scraper/mame_no_image.png /home/pi/mame4all-pi/roms/no_image.png
cp ES-scraper/neogeo_no_image.png /home/pi/pifba/roms/no_image.png
cp ES-scraper/neogeo_no_image.png  /home/pi/gngeo-pi/roms/no_image.png
cp ES-scraper/snes_no_image.png  /home/pi/pisnes/roms/no_image.png
cp ES-scraper/megadrive_no_image.png /home/pi/PicoDrive/romfelix/no_image.png
cp ES-scraper/megadrive_no_image.png /home/pi/PicoDrive/roms/no_image.png
cp ES-scraper/atari2600_no_image.png /home/pi/retro/roms_stella/no_image.png
cp ES-scraper/gba_no_image.png /home/pi/retro/roms_meteor/no_image.png
cp ES-scraper/gbgbc_no_image.png /home/pi/retro/roms_gambatte/no_image.png
cp ES-scraper/nes_no_image.png /home/pi/retro/roms_fceu/no_image.png
cp ES-scraper/vectrex_no_image.png /home/pi/retro/roms_vecx/no_image.png
cp ES-scraper/psx_no_image.png /home/pi/retro/roms_pcsx/no_image.png
# launch : python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350
# to generate gamelists.xml file in each rom directory
echo Updates finished 
echo **********************************************************************************
echo Default New GUI : EmulationEtation. File .profile is modified
echo If you want the pimenu emulator selector please edit /home/pi/.profile file:
echo comment echo && echo "Starting EmulationStation" && echo
echo comment /home/pi/EmulationStation/emulationstation --gamelist-only
echo uncomment echo && echo "Starting PIMENU" && echo
echo uncomment /home/pi/pimenu/pimenu
echo To get GUI with Game images and description please run :
echo python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350
echo to download image files and generate gamelists.xml file in each rom directory
echo **********************************************************************************
echo Raspicade is going to reboot \(type CTRL-C if you don\'t want to\)
read -rsp $'Press any key to reboot (CTRL-C to abort)...\n' -n1 key
sudo reboot
