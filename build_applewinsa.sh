#!/bin/bash

# Build and install applewin standalone emulator along with sdl2-compat
call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh applewinsa
  "
sudo mkdir -p Arkbuild/opt/applewin
sudo cp -R Arkbuild/home/ark/${CHIPSET}_core_builds/applewinsa-64/applewin Arkbuild/opt/applewin/
sudo cp -R Arkbuild/home/ark/${CHIPSET}_core_builds/applewinsa-64/bin/ Arkbuild/opt/applewin/
sudo cp -R Arkbuild/home/ark/${CHIPSET}_core_builds/applewinsa-64/resource/ Arkbuild/opt/applewin/
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/applewin/applewin
