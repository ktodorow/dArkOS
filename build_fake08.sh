#!/bin/bash

# Build and install fake08 standalone emulator
call_chroot "source /root/.bashrc && cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh fake08sa &&
  mkdir -p /opt/fake08 &&
  cp fake08sa-64/fake08 /opt/fake08/
  "
sudo mkdir -p Arkbuild/opt/fake08
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/fake08/fake08
sudo cp pico8/pico8.sh Arkbuild/usr/local/bin/pico8.sh
sudo cp pico8/fake08.gptk Arkbuild/opt/fake08/
sudo chmod 777 Arkbuild/usr/local/bin/pico8.sh
