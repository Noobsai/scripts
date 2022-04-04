#!/bin/bash

btrfs subvolume delete /data/snapshots/@
btrfs subvolume snapshot -r /run/timeshift/backup/@ /run/timeshift/backup/timeshift-btrfs/snapshots
btrfs send /run/timeshift/backup/timeshift-btrfs/snapshots/@ | btrfs receive /data/snapshots
btrfs subvolume delete /run/timeshift/backup/timeshift-btrfs/snapshots/@

btrfs subvolume delete /data/snapshots/@home
btrfs subvolume snapshot -r /run/timeshift/backup-home/@home /run/timeshift/backup-home/timeshift-btrfs/snapshots
btrfs send /run/timeshift/backup-home/timeshift-btrfs/snapshots/@home | btrfs receive /data/snapshots
btrfs subvolume delete /run/timeshift/backup-home/timeshift-btrfs/snapshots/@home
