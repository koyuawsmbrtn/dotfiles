# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
capacity=$(expr $(cat /sys/class/power_supply/BAT0/capacity) + 1)
battery_status="$(cat /sys/class/power_supply/BAT0/status) $capacity%"

# Currently playing Song
np="$(playerctl -p spotifyd metadata xesam:artist) – $(playerctl -p spotifyd metadata xesam:title)"

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo "Hi, $USER! ✌️ | 🎵 $np | 🔋 $battery_status | $date_formatted | "
