#! /bin/bash

caps=$(/usr/bin/xset -q | grep Caps | awk '{ print $4 }')

if [[ $caps =~ on ]]; then
    echo '<span color="#00ff00" size="x-large">A</span>'
else
    echo '<span color="#000000" size="x-large"></span>'
fi  

exit 0
