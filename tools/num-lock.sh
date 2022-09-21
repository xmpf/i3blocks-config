#! /bin/bash

numlock=$(/usr/bin/xset -q | grep "Num Lock" | awk '{ print $8 }')

if [[ $numlock =~ off ]]; then
    echo '<span color="#00ff00" size="x-large">9</span>'
else
    echo '<span color="#000000" size="x-large"></span>'
fi  

exit 0
