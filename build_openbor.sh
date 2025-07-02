#!/bin/bash

# Build and install OpenBOR standalone emulator
call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh openbor
  "
sudo mkdir -p Arkbuild/opt/OpenBor
sudo mkdir -p Arkbuild/opt/OpenBor/Paks
sudo mkdir -p Arkbuild/opt/OpenBor/Saves
sudo cp -a Arkbuild/home/ark/${CHIPSET}_core_builds/openbor-64/OpenBOR Arkbuild/opt/OpenBor/
sudo cp -a openbor/configs/master.cfg.${UNIT} Arkbuild/opt/OpenBor/Saves/master.cfg
sudo cp openbor/OpenBor.sh Arkbuild/opt/OpenBor/OpenBor.sh
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/OpenBor/OpenBor.sh
