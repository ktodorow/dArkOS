#!/bin/bash

# Unmount chroot binds
sudo umount Arkbuild/dev/pts
sudo umount Arkbuild/dev
sudo umount Arkbuild/proc
sudo umount Arkbuild/sys
sudo umount Arkbuild

sudo rm -rf Arkbuild
rm -rf mnt
sudo rm -f "${FILESYSTEM}"
sudo rm -rf $KERNEL_SRC
