#!/bin/bash
sudo umount /dev/mmcblk0p3
sudo fsck.exfat -y /dev/mmcblk0p3
sudo mount -t exfat /dev/mmcblk0p3 /roms
sleep 2
