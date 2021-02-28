#!/bin/bash

pulseaudio --start

# status bar
while true; do
	dt="[$(date "+%a %d-%m-%y %T")]"
	bat="[B:$(cat /sys/class/power_supply/BAT1/capacity)%$(cat /sys/class/power_supply/BAT1/status)]"
	net="[C:$(nmcli dev status | grep connected | awk '{c=","}{print$2c$4}')]"
	vol="[V:$(pamixer --get-volume-human)]"
	stat="$vol$net$bat$dt"
	xsetroot -name "$stat"
	sleep 1s
done


