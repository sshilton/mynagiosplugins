#! /bin/sh
#set -x
# Cheep iptables counter to see how my firewall is doing
country="$1"
count=`sudo iptables -L -n -w | grep "$country Country Drop" | wc -l`
#echo $count
	if [ $count -gt 0 ];then
		echo "OK: $count rules for blocking $country |$country=$count"
		exit 0
	else
		echo "CRITICAL: iptables has $count rules for $country|$country=$count"
		exit 2
	fi

