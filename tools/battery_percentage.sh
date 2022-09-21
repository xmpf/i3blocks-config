#!/usr/bin/bash -

BAT=/sys/class/power_supply/BAT1
CURR=$(cat $BAT/charge_now)
FULL=$(cat $BAT/charge_full)
PERC=$(echo "100.0 * $CURR / $FULL" | bc -l)

printf " %.2f\n" "$PERC"

STAT=$(cat /sys/class/power_supply/BAT1/status)
CAP=$(cat /sys/class/power_supply/BAT1/capacity)
if [ $CAP -lt 15 ] && [ $STAT == "Discharging" ]; then
    $(dunstify -a "Battery Low" -u "CRIT" 'Urgent: Battery is LOW!')
fi
