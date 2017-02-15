#!/bin/bash
TFM_ULTRA=/tmp/TFM_ULTRA.lock
TFM_NORMAL=/tmp/TFM_NORMAL.lock

if mkdir $TFM_NORMAL
then
	rmdir $TFM_ULTRA
	gsettings set org.gnome.desktop.peripherals.keyboard delay 100
	gsettings set org.gnome.desktop.peripherals.keyboard repeat true
	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 9
fi
