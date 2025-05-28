#!/bin/bash

# Build and install gzdoom standalone emulator
sudo chroot Arkbuild/ bash -c "cd /home/ark &&
  cd rk3326_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh gzdoom
  "
sudo mkdir -p Arkbuild/opt/gzdoom
sudo mkdir -p Arkbuild/home/ark/.config/gzdoom
sudo cp -a Arkbuild/home/ark/rk3326_core_builds/gzdoom64/gzdoom Arkbuild/opt/gzdoom/
sudo cp -a gzdoom/configs/rgb10/gzdoom.ini Arkbuild/home/ark/.config/gzdoom/
sudo cp -a gzdoom/configs/rgb10/*.ini Arkbuild/opt/gzdoom/
sudo cp gzdoom/scripts/doom* Arkbuild/usr/local/bin/
sudo cp gzdoom/scripts/*.pk3 Arkbuild/home/ark/.config/gzdoom/
sudo cp -R gzdoom/soundfonts/ Arkbuild/home/ark/.config/gzdoom/
sudo cp -R gzdoom/backup/ Arkbuild/home/ark/.config/gzdoom/
sudo chroot Arkbuild/ bash -c "chown -R ark:ark /home/ark/.config/"
sudo chroot Arkbuild/ bash -c "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/gzdoom/*
sudo chmod 777 Arkbuild/usr/local/bin/doom*
