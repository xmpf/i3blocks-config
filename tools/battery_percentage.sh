#!/usr/bin/bash -

BAT=/sys/class/power_supply/BAT0
CURR=$(cat $BAT/energy_now)
FULL=$(cat $BAT/energy_full)
PERC=$((100 * $CURR / $FULL))

printf " %2.2f\n" "$PERC"

STAT=$(cat /sys/class/power_supply/BAT1/status)
CAP=$(cat /sys/class/power_supply/BAT1/capacity)
if [ $CAP -lt 15 ] && [ $STAT == "Discharging" ]; then
    $(dunstify -a "Battery Low" -u "CRIT" 'Urgent: Battery is LOW!')
fi
