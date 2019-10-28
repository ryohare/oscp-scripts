#!/bin/sh

# perform initial host discovery via ports
# don't use ping probes (-Pn) because ICMP is 
# likely disabled, instead to fast searches
# via sweeping the ports (-T4, -F)

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

#DIR=$(echo "$1" | sed "s/\//_/g")
#mkdir -p $DIR

#echo ""
#echo "**********************************"
#echo "Scanning $1"
#echo "results in $DIR"
#echo "**********************************"

nmap -T4 -Pn -n -sS -F -oG /tmp/tcp.gnmap $1 > /dev/null 2>&1 &
nmap -T4 -Pn -n -sU -p53,69,111,123,137,161,500,514,520 -oG /tmp/udp.gnmap $1 > /dev/null 2>&1 &
wait

# create a list of unique targets for the network
grep open /tmp/*.gnmap | awk '{print $2}' | sort | uniq > /tmp/targets.txt

cat /tmp/targets.txt

# kick off fast tcp, full tcp, and udp in parallel
#for i in $(cat /tmp/targets.txt); do /root/workspace/oscp_engagement/nmapAutomator/nmapAutomator.sh $i All & done
#nmap -T4 -Pn -n -open -sS -A -oA $DIR/tcp_fast -iL $DIR/targets.txt &
#nmap -T4 -Pn -n -open -sSVC -A -p0-65535 -oA $DIR/tcp_full -iL $DIR/targets.txt &
#nmap -T3 -Pn -n -open -sU -oA $DIR/udp -iL $DIR/targets.txt &
#wait

