#!/usr/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch

for m in $(xrandr --query | grep " connected" | cut -d" " -f1);  do
    MONITOR=$m polybar --reload example & 
done
echo "Bars launched..."
