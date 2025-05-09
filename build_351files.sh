#!/bin/bash

# Build and install ogage (Globa Hotkey Daemon)
sudo chroot Arkbuild/ bash -c "cd /home/ark &&
  git clone --recursive https://github.com/christianhaitian/351Files.git &&
  cd 351Files &&
  ./build_RG351.sh RGB10 ArkOS /roms ./res &&
  strip 351Files &&
  mkdir -p /opt/351Files &&
  cp 351Files /opt/351Files/ &&
  chmod 777 /opt/351Files/351Files &&
  cp -R res/ /opt/351Files/
  "
sudo rm -rf Arkbuild/home/ark/351Files

