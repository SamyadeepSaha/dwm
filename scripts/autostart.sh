#!/bin/bash

#pulseaudio --start
xwallpaper --zoom /home/ak98/Downloads/wallpaperflare.com_wallpaper.jpg


# status bar
while true; do
	dt="[$(date "+%a %d-%m-%y %T")]"
    bat_cap=$(cat /sys/class/power_supply/BAT1/capacity)
    bat_stat=$(cat /sys/class/power_supply/BAT1/status)
	bat="[B:$bat_cap%$bat_stat]"
    if [[ $bat_cap -lt 10 ]] && [ $bat_stat = "Discharging" ]
    then
        notify-send -u critical "Battery Low"
    fi
	net="[C:$(nmcli dev status | grep connected | awk '{c=","}{print$2c$4}')]"
	vol="[V:$(pamixer --get-volume-human)]"
	stat="$vol$net$bat$dt"
	xsetroot -name "$stat"
	sleep 1s
done


