#!/bin/bash
printf "\033c" >> /dev/tty1
sudo systemctl enable batt_led
sudo systemctl start batt_led
printf "\n\n\n\e[32mLow battery warning has been enabled.\n"
sudo cp /usr/local/bin/disable\ low\ battery\ warning.sh /opt/system/Advanced/.
sudo rm /opt/system/Advanced/enable\ low\ battery\ warning.sh
sleep 2
printf "\033c" >> /dev/tty1
sudo systemctl restart emulationstation
