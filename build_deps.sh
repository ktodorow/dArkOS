#!/bin/bash

# Install build dependencies
sudo chroot Arkbuild/ bash -c "apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  alsa-utils \
  autotools-dev \
  brightnessctl \
  build-essential \
  cmake \
  console-setup \
  dialog \
  dos2unix \
  espeak-ng \
  exfatprogs \
  ffmpeg \
  fonts-noto-cjk \
  g++ \
  git \
  libarchive-zip-perl \
  libasound2-dev \
  libboost-date-time-dev \
  libboost-filesystem-dev \
  libboost-locale-dev \
  libboost-system-dev \
  libcurl4-openssl-dev \
  libdrm-dev \
  libeigen3-dev \
  libevdev-dev \
  libfreeimage-dev \
  libfreetype6-dev \
  libopenal-dev \
  libopenal1 \
  libsdl2-dev \
  libsdl2-image-2.0-0 \
  libsdl2-image-dev \
  libsdl2-mixer-dev \
  libsdl2-ttf-2.0-0 \
  libsdl2-ttf-dev \
  libstdc++-12-dev \
  libtool \
  libtool-bin \
  libvlc-dev \
  libvlccore-dev \
  ninja-build \
  p7zip-full \
  premake4 \
  psmisc \
  python3 \
  python3-pip \
  python3-setuptools \
  python3-urwid \
  python3-wheel \
  rapidjson-dev \
  rustc \
  unzip \
  vlc-bin \
  zip"

# Symlink fix for DRM headers
sudo chroot Arkbuild/ bash -c "ln -s /usr/include/libdrm/ /usr/include/drm"

# Install meson
sudo chroot Arkbuild/ bash -c "git clone https://github.com/mesonbuild/meson.git && ln -s /meson/meson.py /usr/bin/meson"

# Build and install librga
sudo chroot Arkbuild/ bash -c "cd /home/ark &&
  git clone https://github.com/christianhaitian/linux-rga.git &&
  cd linux-rga &&
  git checkout 1fc02d56d97041c86f01bc1284b7971c6098c5fb &&
  meson build && cd build &&
  meson compile &&
  cp -r librga.so* /usr/lib/aarch64-linux-gnu/ &&
  cd .. &&
  mkdir -p /usr/local/include/rga &&
  cp -f drmrga.h rga.h RgaApi.h RockchipRgaMacro.h /usr/local/include/rga/
  "

# Build and install libgo2
sudo chroot Arkbuild/ bash -c "cd /home/ark &&
  git clone https://github.com/OtherCrashOverride/libgo2.git &&
  cd libgo2 &&
  premake4 gmake &&
  make -j$(nproc) &&
  cp libgo2.so* /usr/lib/aarch64-linux-gnu/ &&
  mkdir -p /usr/include/go2 &&
  cp -L src/*.h /usr/include/go2/
  "
