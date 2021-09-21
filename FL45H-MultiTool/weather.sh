!/usr/bin/bash

clear
trap ctrl_c INT
ctrl_c() {
clear
echo  "Ctrl + C Detected!"
sleep 1
echo  "Thanks for using weather tool!"
sleep 1
clear
exit
}
toilet -f mono9 -F border "Weather"
toilet -f mono9 -F border "Report"

echo ""
read -p "Your City: " city
clear
figlet -f future "weather report for: "$city;date
echo ""
curl http://wttr.in/$city
