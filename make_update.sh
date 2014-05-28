#!/bin/bash
git pull
cp -r mame4all-pi/* ~/mame4all-pi/
cp -r pifba/* ~/pifba/
cp -r pisnes/* ~/pisnes/
chmod 644 ~/.gngeo/gngeorc
cp -r .gngeo/* ~/.gngeo/
chmod 444 ~/.gngeo/gngeorc
