#!/bin/bash
TFM_ULTRA=/tmp/TFM_ULTRA.lock
TFM_NORMAL=/tmp/TFM_NORMAL.lock

if mkdir $TFM_ULTRA
then
	rmdir $TFM_NORMAL
	gsettings set org.gnome.desktop.peripherals.keyboard delay 1
	gsettings set org.gnome.desktop.peripherals.keyboard repeat true
	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 1
fi
