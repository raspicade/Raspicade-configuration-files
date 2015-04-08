#!/bin/bash
# pinetconf.sh is a simple script to select audio output for pi at boot time
# Yann Morère 2014
# By default sound is routed automatically. If an HDMI -> VGA converter is plugged, the system will use
# the HDMI sound output. If you want to change that, we need to configure amixer :
# $ sudo amixer cset numid=3 1
# numid=3,iface=MIXER,name='PCM Playback Route'
#   ; type=INTEGER,access=rw­­­­­­,values=1,min=0,max=2,step=0
#   : values=1
#create an empty hidden file name .no_audioconf_at_boot to deactivate audio configuration at boot time
 
noinputconfigatboot="/home/pi/avoid_config/no_inputconf_at_boot"
 
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
 
if [ -f  $noinputconfigatboot ]
then
	exit 0;
else	
	printf "To avoid this configuration create the file /home/pi/avoid_config/no_inputconf_at_boot\n"; 
	printf "Do you want to configure your type of input (Keyboard-retrogame-IPAC/Gamepads/XinMo-Arcade) (y/n):"
	read answer
	result=$(empty_or_multiline "$answer")

	while [ $result -eq 0 ]
	do
		echo "Do you want to configure your type of input (XinMo-Arcade/Gamepads/Keyboard-retrogame-IPAC) (y/n):"
		read answer
		result=$(empty_or_multiline "$answer")
	done
	if [ "$answer" == "y" ]
	then
		printf "Select your type of input (0 = keyboard, 1 = gamepads, 2 = xinmo) :"
		read selectinput
		result=$(empty_or_multiline "$selectinput")

		while [ $result -eq 0 ]
		do
		printf "Select your type of input (0 = keyboard, 1 = gamepads, 2 = xinmo, 3 = GPIO Retrogame Brev2,B+ 1Player, 4 = GPIO Retrogame B+ 2Players, 5 = GPIO Retrogame Pi2 1-2 Players, 6 = MCP23017 Module Brev2 B+ Pi2 pikeyd ) :"
		read selectinput
		result=$(empty_or_multiline "$selectinput")
		done

		case "$selectinput" in
			0) printf "Keyboard selected.\n";
			   /home/pi/ConfigToKeyboard.sh;
			   sudo cp /etc/rc.local-orig /etc/rc.local;
			;;
			1) printf "Gamepads selected.\n";
			   /home/pi/ConfigToGamepads.sh;
			   sudo cp /etc/rc.local-orig /etc/rc.local;
			;;
			2) printf "XinMo selected.\n";
			   /home/pi/ConfigToXinMo.sh;
			   sudo cp /etc/rc.local-orig /etc/rc.local;
			;;
			3) printf "GPIO Retrogame Brev2,B+ 1Player selected.\n";
			   /home/pi/ConfigToKeyboard.sh;
			   sudo cp /etc/rc.local-Brev2-B+-1Player /etc/rc.local;
			;;
			4) printf "GPIO Retrogame B+ 2Players selected.\n";
			   /home/pi/ConfigToKeyboard.sh;
			   sudo cp /etc/rc.local-B+-2Players /etc/rc.local;
			;;
			5) printf "GPIO Retrogame Pi2 1-2 Players selected.\n";
			   /home/pi/ConfigToKeyboard.sh;
			   sudo cp /etc/rc.local-Pi2-1-2Players /etc/rc.local;
			;;
			6) printf "MCP23017 Module Brev2 B+ Pi2 pikeyd selected.\n";
			   /home/pi/ConfigToKeyboard.sh;
			   sudo cp /etc/rc.local-Brev2-B+-Pi2-pikeyd /etc/rc.local;
			;;
			*) printf "Problem with selection\n"
			;;
		esac

	else
		printf "Goodbye\n"
	fi

fi
