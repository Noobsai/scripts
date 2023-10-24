#!/bin/bash

mkdir /mnt/root
mount -L root /mnt/root
btrfs subvolume snapshot -r /mnt/root/@ /mnt/root/timeshift-btrfs/snapshots
btrfs subvolume delete /data/snapshots/@
btrfs send /mnt/root/timeshift-btrfs/snapshots/@ | btrfs receive /data/snapshots
btrfs subvolume delete /mnt/root/timeshift-btrfs/snapshots/@
umount /mnt/root
rmdir /mnt/root

mkdir /mnt/home
mount -L home /mnt/home
btrfs subvolume snapshot -r /mnt/home/@home /mnt/home/timeshift-btrfs/snapshots
btrfs subvolume delete /data/snapshots/@home
btrfs send /mnt/home/timeshift-btrfs/snapshots/@home | btrfs receive /data/snapshots
btrfs subvolume delete /mnt/home/timeshift-btrfs/snapshots/@home
umount /mnt/home
rmdir /mnt/home
