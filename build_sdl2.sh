#!/bin/bash

# Build and install SDL2
sudo chroot Arkbuild/ bash -c "cd /home/ark &&
  git clone https://github.com/christianhaitian/rk3326_core_builds.git &&
  cd rk3326_core_builds &&
  chmod 777 builds-alt.sh &&
  ./builds-alt.sh sdl2 &&
  cd SDL/build &&
  make install
  "

extension="3000.10"
#sudo mv -f -v Arkbuild/home/ark/rk3326_core_builds/sdl2-64/libSDL2-2.0.so.0.${extension}.rotated Arkbuild/usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.${extension}
#sudo mv -f -v Arkbuild/home/ark/rk3326_core_builds/sdl2-32/libSDL2-2.0.so.0.${extension}.rotated Arkbuild/usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.${extension}
#sudo rm -rfv Arkbuild/home/ark/rk3326_core_builds/sdl2-64
#sudo rm -rfv Arkbuild/home/ark/rk3326_core_builds/sdl2-32
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.${extension} /usr/lib/aarch64-linux-gnu/libSDL2.so"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.${extension} /usr/lib/arm-linux-gnueabihf/libSDL2.so"
sudo rm -rf Arkbuild/home/ark/rk3326_core_builds/SDL
