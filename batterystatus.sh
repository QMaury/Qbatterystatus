#!/bin/sh

percent=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage:`

notify-send -t 15000 "battery life" "$percent" 
