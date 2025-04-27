#!/bin/bash

# Write rootfs to disk
sync
e2fsck -p -f ${FILESYSTEM}
resize2fs -M ${FILESYSTEM}
dd if="${FILESYSTEM}" of="${DISK}" bs=512 seek="${STORAGE_PART_START}" conv=fsync,notrunc
