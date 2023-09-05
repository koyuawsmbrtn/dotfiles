#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+r to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
capacity=$(expr $(expr $(expr $(cat /sys/class/power_supply/BAT0/capacity) + $(cat /sys/class/power_supply/BAT1/capacity)) / 2) + 1)
if (( capacity > 100 )); then
  capacity=100
fi
battery_status="$(cat /sys/class/power_supply/BAT0/status) $capacity%"

# Currently playing Song
np="$(playerctl -p spotifyd metadata xesam:artist) – $(playerctl -p spotifyd metadata xesam:title)"

battery="🔋"
if (( capacity < 11 )); then
  battery="🪫"
fi
if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ]]; then
  battery="🗲"
fi
if [[ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ]]; then
  battery="🗲"
  battery_status="$(cat /sys/class/power_supply/BAT1/status) $capacity%"
fi

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo "Hi, $USER! | 🎵 $np | $battery $battery_status | $date_formatted | "
