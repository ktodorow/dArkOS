#!/bin/bash
if [ ! -e "/home/ark/.config/.SWAPPOWERANDSUSPEND" ]; then
  sudo systemctl stop emulationstation
  sudo systemctl poweroff
else
  sudo systemctl suspend
fi
