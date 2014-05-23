#!/bin/bash
# pinetconf.sh is a simple script to select audio output for pi at boot time
# Yann Morère 2014
# By default sound is routed automatically. If an HDMI → VGA converter is plugged, the system will use
# the HDMI sound output. If you want to change that, we need to configure amixer :
# $ sudo amixer cset numid=3 1
# numid=3,iface=MIXER,name='PCM Playback Route'
#   ; type=INTEGER,access=rw­­­­­­,values=1,min=0,max=2,step=0
#   : values=1
#create an empty hidden file name .no_audioconf_at_boot to deactivate audio configuration at boot time
 
noaudioconfigatboot="/home/pi/avoid_config/no_audioconf_at_boot"
audioconffile="/var/lib/alsa/asound.state";
#audioconffile="asound.state";
 
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
 
if [ -f  $noaudioconfigatboot ]
then
	exit 0;
else	
	if [ -f  $audioconffile ]
	then
		printf "$audioconffile present. Go to configuration\n";
 
		printf "Do you want to configure audio output of raspicade (y/n):"
		read answer
		result=$(empty_or_multiline "$answer")
 
		while [ $result -eq 0 ]
		do
			echo "Do you want to configure audio output of raspicade (y/n):"
			read answer
			result=$(empty_or_multiline "$answer")
		done
		if [ "$answer" == "y" ]
		then
			printf "Select your audio output (0 = auto, 1 = jack3\"5, 2 = hdmi) :"
			read selectaudio
			result=$(empty_or_multiline "$selectaudio")
 
			while [ $result -eq 0 ]
			do
			printf "Select your audio output (0 = auto, 1 = jack3\"5, 2 = hdmi) :"
			read selectaudio
			result=$(empty_or_multiline "$selectaudio")
			done
			#do the selection
			#printf "sed -i \"/PCM Playback Route/{N; s/value ./value $selectaudio/}\" $audioconffile"
			printf "Configuration is running...\n"
			sed -i "/PCM Playback Route/{N; s/value ./value $selectaudio/}" $audioconffile
			sleep 2
			#read the configuration
			straudio=`sed -n "/PCM Playback Route/{N; /value ./p}" $audioconffile | grep value`
			audioconf=${straudio: -1}
 
			case "$audioconf" in
				0) printf "Auto selected.\n"
				;;
				1) printf "Jack 3\"5 selected.\n"
				;;
				2) printf "HDMI selected.\n"
				;;
				*) printf "Problem with selection\n"
				;;
			esac
 
		else
			printf "Goodbye\n"
		fi
 
    else
		printf "the file $audioconffile does not exists\n";
	fi
fi
