#!/bin/bash
echo Upgrading Raspicade...
echo Apt-Get Update
sudo apt-get update
echo Apt-Get Upgrade
sudo apt-get upgrade
echo Install libSDL_mixer and libavcodec
sudo apt-get install libsdl-mixer1.2 libavcodec53
sudo apt-get install libboost-system1.49.0 libboost-filesystem1.49.0 libfreeimage3
sudo apt-get install python-imaging
sudo apt-get remove --purge alsa-oss
echo Update Firmware and Kernel
sudo rpi-update
#echo Downloading Updates
#git pull
echo Making Updates
cp -r Raspicade-Retrogame-1Player/ ~/
cp -r Raspicade-Retrogame-2Player-BPlus/ ~/
sudo cp etc/rc.local /etc/
sudo cp etc/samba/smb.conf /etc/samba
sudo service samba restart
sudo cp boot/* /boot
cp -r pimenu/* ~/pimenu/
cp -r mame4all-pi/* ~/mame4all-pi/
cp -r pifba/* ~/pifba/
cp -r pisnes/* ~/pisnes/
chmod 644 ~/.gngeo/gngeorc
cp -r .gngeo/* ~/.gngeo/
chmod 444 ~/.gngeo/gngeorc
cp -r PicoDrive ~/
cp -r .picodrive ~/
