#!/bin/bash

#Copyright 2023 Christian_Haitian
#
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the “Software”), to deal in the Software without
#restriction, including without limitation the rights to use,
#copy, modify, merge, publish, distribute, sublicense, and/or
#sell copies of the Software, and to permit persons to whom
#the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included
#in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
#DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
#OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
#THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Change SDL for Ports
#

sudo chmod 666 /dev/tty0
export TERM=linux
export XDG_RUNTIME_DIR=/run/user/$UID/
#printf "\033c" > /dev/tty0
reset

# hide cursor
printf "\e[?25l" > /dev/tty0
dialog --clear

height="15"
width="55"

ExitCode="0"

if [[ ! -e "/dev/input/by-path/platform-odroidgo2-joypad-event-joystick" ]]; then
  sudo setfont /usr/share/consolefonts/Lat7-TerminusBold24x12.psf.gz
fi

pgrep -f gptokeyb | sudo xargs kill -9
pgrep -f osk.py | sudo xargs kill -9
printf "\033c" > /dev/tty0
printf "Starting change SDL App.  Please wait..." 2>&1 > /dev/tty0
old_ifs="$IFS"

ExitMenu() {
  printf "\033c" > /dev/tty0
  if [[ ! -z $(pgrep -f gptokeyb) ]]; then
    pgrep -f gptokeyb | sudo xargs kill -9
  fi
  if [[ ! -e "/dev/input/by-path/platform-odroidgo2-joypad-event-joystick" ]]; then
    sudo setfont /usr/share/consolefonts/Lat7-Terminus20x10.psf.gz
  fi
  exit
  reset  
}

MainMenu() {
  mainoptions=( 1 "2.18.2" 2 "2.26.2" 3 "2.26.5" 4 "2.28.2" 5 "2.30.3" 6 "2.30.7" 7 "2.30.10" 8 "System Default" 9 "Exit" )
  IFS="$old_ifs"
  if [ -f "/home/ark/.config/.DEFAULT_PORTS_SDL" ]; then
    SDL=`grep libSDL2-2.0.so.0. /home/ark/.config/.DEFAULT_PORTS_SDL | cut -d "." -f5-6 | sed '/00/s///g'`
    SDL="2.$SDL"
  else
    SDL="Default"
  fi
  while true; do
    mainselection=(dialog \
   	--backtitle "Ports SDL: Currently set to $SDL" \
   	--title "Main Menu" \
   	--no-collapse \
   	--clear \
	--cancel-label "Select + Start to Exit" \
	--menu "Please make your selection" $height $width 15)

	mainchoices=$("${mainselection[@]}" "${mainoptions[@]}" 2>&1 > /dev/tty0)
	if [[ $? != 0 ]]; then
	  exit 1
	fi
    for mchoice in $mainchoices; do
      case $mchoice in
	1) echo "libSDL2-2.0.so.0.18.2" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	2) echo "libSDL2-2.0.so.0.2600.2" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	3) echo "libSDL2-2.0.so.0.2600.5" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	4) echo "libSDL2-2.0.so.0.2800.2" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	5) echo "libSDL2-2.0.so.0.3000.3" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	6) echo "libSDL2-2.0.so.0.3000.7" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	7) echo "libSDL2-2.0.so.0.3000.10" > /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	8) rm -f /home/ark/.config/.DEFAULT_PORTS_SDL
	   MainMenu ;;
	9) ExitMenu ;;
      esac
    done
  done
}

#
# Joystick controls
#
# only one instance

sudo chmod 666 /dev/uinput
export SDL_GAMECONTROLLERCONFIG_FILE="/opt/inttools/gamecontrollerdb.txt"
if [[ ! -z $(pgrep -f gptokeyb) ]]; then
  pgrep -f gptokeyb | sudo xargs kill -9
fi
/opt/inttools/gptokeyb -1 "Change Ports SDL.sh" -c "/opt/inttools/keys.gptk" &
printf "\033c" > /dev/tty0
dialog --clear

trap ExitMenu EXIT
MainMenu
