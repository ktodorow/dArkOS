#!/bin/bash

sudo rm -f /media/sf_VMShare/RGB10\ Boot/ArkOS_RGB10.img*
sudo cp ArkOS_RGB10.img /media/sf_VMShare/RGB10\ Boot/ArkOS_RGB10.img
xz --keep -z -9 -T0 ArkOS_RGB10.img
mv ArkOS_RGB10.img.xz /media/sf_VMShare/RGB10\ Boot/
