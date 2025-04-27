#!/bin/bash
if [ ! -e "/home/ark/.config/.SWAPPOWERANDSUSPEND" ]; then
  sudo systemctl suspend
else
  sudo systemctl stop emulationstation
  sudo systemctl poweroff
fi
