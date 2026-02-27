#!/bin/bash

echo "select an option:"
echo "1) Identify System's public Ip Address"
echo "2) Private Ip Address On System Network Interface"
echo "3)  Display MAC Address"
echo "4) Percentage Of CPU Usage"
echo "5) Memory Usage Statistics: Total  and Avaliable Memory"
echo "6) Active System Services With Their Status"
echo "7) Top 10 Largest File In /Home"
read choice
case $choice in
1)
echo "Identify System's Public Ip Address"
curl -s ifconfig.co
;;
2)
echo "My Private Ip Address On System Network Interface"
ifconfig | grep broadcast | awk '{print $2}'
;;
3)
echo "Display The MAC Address"
ifconfig | grep ether | awk '{print $2]'
;;
4)
echo "The Percentage Of CPU Usage"
top -b -n1 | head -n 12
;;
5)
echo "The Memory Usage Statistics: Total and Avaliable Memory"
free -h | awk '/Mem:/ {print "Total:", $2, "Available:", $7}'
;;
6)
echo "Active System Services With Their Status"
systemctl list-units --type=service --state=running
;;
7)
echo "Top 10 Largest File In /Home"
find /home -type f -exec du -h {} + | sort -rh | head -n 10
;;
esac
