#!/bin/bash

# Build and install Yabasanshiro standalone emulator
call_chroot "source /root/.bashrc && cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  sed -i '/python-pip/s//python3-pip/g' scripts/yabasanshirosa.sh &&
  eatmydata ./builds-alt.sh yabasanshirosa &&
  mkdir -p /opt/yabasanshiro &&
  cp yabasanshirosa64/yabasanshiro /opt/yabasanshiro/
  "
sudo mkdir -p Arkbuild/opt/yabasanshiro
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/yabasanshiro/yabasanshiro
sudo cp yabasanshiro/saturn.sh Arkbuild/usr/local/bin/saturn.sh
sudo chmod 777 Arkbuild/usr/local/bin/saturn.sh
