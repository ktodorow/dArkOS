#!/bin/bash

# Build and install openmsx standalone emulator
call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh openmsx
  "
sudo mkdir -p Arkbuild/opt/openmsx/backupconfig/openmsx
sudo cp -Ra Arkbuild/home/ark/${CHIPSET}_core_builds/openMSX/share Arkbuild/opt/openmsx/backupconfig/openmsx/
sudo cp openmsx/configs/openmsx.gptk Arkbuild/opt/openmsx/backupconfig/openmsx/
sudo cp openmsx/configs/commands.txt Arkbuild/opt/openmsx/backupconfig/openmsx/
sudo cp Arkbuild/home/ark/${CHIPSET}_core_builds/openMSX/Contrib/cbios/* Arkbuild/opt/openmsx/backupconfig/openmsx/share/machines/
sudo cp openmsx/configs/gamecontrollerdb.txt Arkbuild/opt/openmsx/
sudo cp openmsx/scripts/openmsx Arkbuild/usr/local/bin/
sudo cp -a Arkbuild/home/ark/${CHIPSET}_core_builds/openMSX/README Arkbuild/opt/openmsx/
sudo cp -a Arkbuild/home/ark/${CHIPSET}_core_builds/openmsx64/openmsx Arkbuild/opt/openmsx/
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/openmsx/openmsx
sudo chmod 777 Arkbuild/usr/local/bin/openmsx
