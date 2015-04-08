#!/bin/bash
# pinetconf.sh is a simple script to allow static network configuration at boot time
# Yann Morère 2014
# if eth0 is not static, give a new address, netmask and gateway
#create an empty hidden file name .no_netconf_at_boot to deactivate network configuration at boot time

nonetconfigatboot="/home/pi/avoid_config/no_netconf_at_boot"
netconffile="/etc/network/interfaces";

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

if [ -f  $nonetconfigatboot ]
then
	exit 0;
else	
	if [ -f  $netconffile ]
	then
		printf "To avoid this configuration create the file /home/pi/avoid_config/no_netconf_at_boot\n";
		printf "the file $netconffile exists\n";
		if grep -q "iface eth0 inet static" "$netconffile"; 
		then
			printf "eth0 is already configured statically! Here is the configuration :\n"
			cat "$netconffile"
		else
			printf "Do you want to fix the ip address of your pi (y/n):"
			read answer
			result=$(empty_or_multiline "$answer")
			
			while [ $result -eq 0 ]
			do
				echo "Do you want to fix the ip address of your pi (y/n):"
				read answer
				result=$(empty_or_multiline "$answer")
			done

			if [ "$answer" == "y" ]
			then
				printf "Give the IP address :"
				read ipaddr
				result=$(empty_or_multiline "$ipaddr")
		
				while [ $result -eq 0 ]
				do
					echo "Give the IP address :"
					read ipaddr
					result=$(empty_or_multiline "$ipaddr")
				done

				printf "Give the netmask :"
				read netmask
				result=$(empty_or_multiline "$netmask")
		
				while [ $result -eq 0 ]
				do
					echo "Give the IP netmask :"
					read ipaddr
					result=$(empty_or_multiline "$netmask")
				done

				printf "Give the gateway :"
				read gateway
				result=$(empty_or_multiline "$gateway")
	
				while [ $result -eq 0 ]
				do
					echo "Give the IP gateway :"
					read ipaddr
					result=$(empty_or_multiline "$gateway")
				done

				if [ -f  $netconffile ]
				then
					printf "the file $netconffile exists\n";
					if grep -q "iface eth0 inet dhcp" "$netconffile"; 
					then
						printf "sed -i \"s/iface eth0 inet dhcp/iface eth0 inet static \n address ${ipaddr}\n netmask ${netmask}\n gateway ${gateway}/\" $netconffile \n"
						sed -i "s/iface eth0 inet dhcp/iface eth0 inet static \n address $ipaddr\n netmask $netmask\n gateway $gateway/" "$netconffile"
						printf "eth0 is configure statically : address ${ipaddr}\n netmask ${netmask}\n gateway ${gateway}\n"
					else
					printf "I Don't see dhcp config for eth0\n"
				fi
    		else
				printf "the file $netconffile does not exists\n";
			fi
		else
			printf "Goodbye\n"
		fi
	fi
    else
		printf "the file $netconffile does not exists\n";
	fi
fi
