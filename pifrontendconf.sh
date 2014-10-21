#!/bin/bash
# pinetconf.sh is a simple script to select emulator selector frontend at boot time
# Yann Morère 2014
# By default EmulationStation1 is selected. You can choose among
#  - pimenu
#  - EmulationStation1 (light and reactive)
#  - EmulationStation2 (Beautiful but less reactive)
#create an empty hidden file name .no_frontendconf_at_boot to deactivate frontend configuration at boot time
 
nofrontendconfigatboot="/home/pi/avoid_config/no_frontendconf_at_boot"
 
function empty_or_multiline()
{
	local chaine=$1
	size=${#chaine}
	echo $size 
	if [ $size -eq 0 ]
	then
		return 0;
	fi
 
  #[ -z "$1" ] && return 0;
  count=$(printf "$chaine" | wc -l);
  if [ $count -gt 0 ]
  then
	return 0;
  else
	return 1;
  fi
 
}
 
if [ -f  $nofrontendconfigatboot ]
then
	exit 0;
else	
	printf "Do you want to configure frontend for raspicade (y/n):"
	read answer
	result=$(empty_or_multiline "$answer")

 	while [ $result -eq 0 ]
	do
		echo "Do you want to configure frontend for raspicade (y/n):"
		read answer
		result=$(empty_or_multiline "$answer")
	done
	if [ "$answer" == "y" ]
	then
		printf "Select your frontend output (0 = pimenu, 1 = EmulationStation1, 2 = EmulationStation2) :"
		read selectfrontend
		result=$(empty_or_multiline "$selectfrontend")

		while [ $result -eq 0 ]
		do
			printf "Select your frontend output (0 = pimenu, 1 = EmulationStation1, 2 = EmulationStation2) :"
			read selectfrontend
			result=$(empty_or_multiline "$selectfrontend")
		done
		#do the selection
 
		case "$selectfrontend" in
			0) printf "Pimenu Selected.\n";
				/home/pi/SelectPIMENU.sh;
			;;
			1) printf "EmulationStation1 Selected.\n";
				/home/pi/SelectES1.sh;
			;;
			2) printf "EmulationStation2 Selected.\n"
				/home/pi/SelectES2.sh;
			;;
			*) printf "Problem with selection\n"
			;;
		esac
 
	else
		printf "Goodbye\n"
	fi
fi
