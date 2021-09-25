#! /bin/sh
#set -x
# Cheep iptables counter to see how my firewall is doing
# NOTE whatver user runs the nagios/ncpa check need to have nopasswd sudo access for iptables 
# Use at your own risk
# cloudwatch2038@outlook.com
country="$1"
count=`sudo -n iptables -L -n -w | grep "$country Country Drop" | wc -l`
#echo $count
	if [ $count -gt 0 ];then
		echo "OK: $count rules for blocking $country |$country=$count"
		exit 0
	else
		echo "CRITICAL: iptables has $count rules for $country -are you sure your sudo rights are correct `sudo -U nagios -l` |$country=$count"
		exit 2
	fi

