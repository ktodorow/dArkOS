#!/bin/bash

# Cleanup to reduce image size and remove build remnants
echo -e "Cleaning up filesystem"
sudo rm -rf Arkbuild/var/log/journal
sudo rm Arkbuild/usr/sbin/policy-rc.d
sudo rm -f Arkbuild/etc/resolv.conf
sudo rm -f Arkbuild/etc/network/interfaces
sudo rm -rf Arkbuild/usr/share/man/*
for i in {1..8}; do sudo mkdir -p Arkbuild/usr/share/man/man"$i"; done
sudo rm -rf Arkbuild/var/lib/apt/lists/*
sudo rm -f Arkbuild/var/log/*.log
sudo rm -f Arkbuild/var/log/apt/*.log
sudo rm -f Arkbuild/tmp/reboot-needed
sudo chroot Arkbuild/ bash -c "rm -rf /home/ark/EmulationStation-fcamod"
sudo chroot Arkbuild/ bash -c "rm -rf /home/ark/libgo2"
sudo chroot Arkbuild/ bash -c "rm -rf /home/ark/linux-rga"
sudo chroot Arkbuild/ bash -c "rm -rf /home/ark/rk3326_core_builds"
sudo chroot Arkbuild/ bash -c "apt-get remove -y build-essential libstdc++-12-dev g++ libboost-system-dev libboost-filesystem-dev libboost-locale-dev libfreeimage-dev libfreetype6-dev libeigen3-dev libcurl4-openssl-dev libboost-date-time-dev libasound2-dev cmake libsdl2-image-dev libsdl2-ttf-dev rapidjson-dev libvlc-dev libvlccore-dev libsdl2-mixer-dev premake4 libopenal-dev libevdev-dev ninja-build autotools-dev"
sudo chroot Arkbuild/ bash -c "apt-get -y autoremove"
sudo chroot Arkbuild/ apt-get clean
cd Arkbuild/usr/lib/aarch64-linux-gnu
for LIB in libEGL.so libEGL.so.1 libGLES_CM.so libGLES_CM.so.1 libGLESv1_CM.so libGLESv1_CM.so.1 libGLESv1_CM.so.1.1.0 libGLESv2.so libGLESv2.so.2 libGLESv2.so.2.0.0 libGLESv2.so.2.1.0 libGLESv3.so libGLESv3.so.3 libgbm.so libgbm.so.1 libgbm.so.1.0.0 libmali.so libmali.so.1 libMaliOpenCL.so libOpenCL.so libwayland-egl.so libwayland-egl.so.1 libwayland-egl.so.1.0.0
do
  sudo rm -fv ${LIB}
  sudo ln -sfv libMali.so ${LIB}
done
cd ../../../../

#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.${extension} /usr/lib/aarch64-linux-gnu/libSDL2.so"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0"
#sudo chroot Arkbuild/ bash -c "ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.${extension} /usr/lib/arm-linux-gnueabihf/libSDL2.so"
#sudo chroot Arkbuild/ ldconfig
