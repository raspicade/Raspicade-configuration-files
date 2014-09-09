#!/bin/bash
# launch : python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350
# to generate gamelists.xml file in each rom directory
echo python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350
echo generating/updating gamelists.xml file in each rom directory
echo comment or uncomment PLATFORMID in es_systems.cfg file to include or exclure research
echo for a specific emulator
read -rsp $'Press any key to continue CTRL-C to stop...\n' -n1 key
python ~/temp/Raspicade-configuration-files/ES-scraper/scraper.py -v -w 350

