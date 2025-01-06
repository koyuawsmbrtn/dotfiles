#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+r to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Repeat function
repeatString(){
    # argument 1: The string to print
    # argument 2: The number of times to print
    stringToPrint=$1
    length=$2

    # Find the largest integer value of x in 2^x=(number of times to repeat) using logarithms
    power=`echo "l(${length})/l(2)" | bc -l`
    power=`echo "scale=0; ${power}/1" | bc`

    # Get the difference between the length and 2^x
    diff=`echo "${length} - 2^${power}" | bc`

    # Double the string length to the power of x
    for i in `seq "${power}"`; do 
        stringToPrint="${stringToPrint}${stringToPrint}"
    done

    #Since we know that the string is now at least bigger than half the total, grab however many more we need and add it to the string.
    stringToPrint="${stringToPrint}${stringToPrint:0:${diff}}"
    echo ${stringToPrint}
}

# Returns the battery status: "Full", "Discharging", or "Charging".
capacity=$(expr $(expr $(expr $(cat /sys/class/power_supply/BAT0/capacity) + $(cat /sys/class/power_supply/BAT1/capacity)) / 2) + 1)
if (( capacity > 100 )); then
  capacity=100
fi
battery_status="$(cat /sys/class/power_supply/BAT1/status) $capacity%"

# Currently playing Song
np="$(playerctl -p spotify metadata xesam:artist) – $(playerctl -p spotify metadata xesam:title)"

battery="🔋"
battery=$(repeatString '🔋' $(echo $(ls /sys/class/power_supply/ | wc -l) - 1 | bc))

if (( capacity < 11 )); then
  battery="🪫"
  battery_status="Battery low! $capacity%"
fi

if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Discharging" && "$(cat /sys/class/power_supply/BAT1/status)" == "Not charging" ]]; then
  battery=$(repeatString '🔋' $(echo $(ls /sys/class/power_supply/ | wc -l) - 1 | bc))
  battery_status="Discharging $capacity%"
fi

if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ]]; then
  battery="🗲"
  battery_status="Charging $capacity%"
fi
if [[ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ]]; then
  battery="🗲"
  battery_status="$(cat /sys/class/power_supply/BAT1/status) $capacity%"
fi

if [[ "$capacity" == "100" ]]; then
  battery=$(repeatString '🔋' $(echo $(ls /sys/class/power_supply/ | wc -l) - 1 | bc))
  battery_status="Full $capacity%"
fi

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo "Hi, $USER! | 🎵 $np | $battery $battery_status | $date_formatted | "
