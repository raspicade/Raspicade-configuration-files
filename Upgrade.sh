#!/bin/bash
today=`date +%Y-%m-%d.%H_%M_%S`
echo Backup of old config files
echo Backup of boot/config.txt
sudo cp /boot/config.txt /boot/config.txt_$today
echo For Mame
cp /home/pi/mame4all-pi/mame.cfg /home/pi/mame4all-pi/mame.cfg_$today
cp -r  /home/pi/mame4all-pi/cfg /home/pi/mame4all-pi/cfg_$today
echo For Gngeo
cp -r /home/pi/.gngeo /home/pi/.gngeo_$today
echo For Dgen
cp -r /home/pi/.dgen /home/pi/.dgen_$today
echo For EmulationStation
cp -r /home/pi/.emulationstation /home/pi/.emulationstation_$today
echo For Picodrive
cp -r /home/pi/.picodrive /home/pi/.picodrive_$today
echo For PiFBA
cp -r  /home/pi/pifba/fba2x.cfg /home/pi/pifba/fba2x.cfg_$today
echo For PiSnes
cp -r  /home/pi/pisnes/snes9x.cfg  /home/pi/pisnes/snes9x.cfg_$today
echo Upgrading Raspicade...
read -rsp $'Press any key to continue...\n' -n1 key
echo Apt-Get Update
sudo apt-get update
echo Apt-Get Upgrade
sudo apt-get upgrade
echo Install libSDL_mixer and libavcodec
sudo apt-get install libsdl-mixer1.2 libavcodec53
#EmulationStation
sudo apt-get install libboost-system1.49.0 libboost-filesystem1.49.0 libfreeimage3
sudo apt-get install python-imaging
sudo apt-get remove --purge alsa-oss
echo Update Firmware and Kernel
read -rsp $'Press any key to continue...\n' -n1 key
sudo rpi-update
#echo Downloading Updates
#git pull
echo Copy new file in filesystem tree
read -rsp $'Press any key to continue...\n' -n1 key
cp .profile /home/pi/.profile
cp -r Raspicade-Retrogame-1Player/ ~/
cp -r Raspicade-Retrogame-2Player-BPlus/ ~/
sudo cp boot/* /boot
sudo cp boot/config.txt-4-3monitor1024x768 /boot/config.txt
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
cp -r EmulationStation ~/
cp -r .emulationstation ~/
mkdir /home/pi/PicoDrive/romfelix
chmod 777 /home/pi/PicoDrive/roms
cp -r videos/ ~/
mkdir /home/pi/joy2key
cp joy2key-code/joy2key /home/pi/joy2key
cp omxplayer_keys.rc /home/pi
sudo cp etc/rc.local /etc/
sudo cp etc/samba/smb.conf /etc/samba
sudo service samba restart
echo EmulationStation : Put scraper stuff in the good directory
cp ES-scraper/mame_no_image.png /home/pi/mame4all-pi/roms/no_image.png
cp ES-scraper/neogeo_no_image.png /home/pi/pifba/roms/no_image.png
cp ES-scraper/neogeo_no_image.png  /home/pi/gngeo-pi/roms/no_image.png
cp ES-scraper/snes_no_image.png  /home/pi/pisnes/roms/no_image.png
cp ES-scraper/megadrive_no_image.png /home/pi/PicoDrive/romfelix/no_image.png
cp ES-scraper/megadrive_no_image.png /home/pi/PicoDrive/roms/no_image.png
# launch : python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350
# to generate gamelists.xml file in each rom directory
echo Making Updates
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
read -rsp $'Press any key to finish...\n' -n1 key
