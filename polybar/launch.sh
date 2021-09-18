#!/bin/bash

SCRIPT_DIR=$HOME/.config/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar dummy &
polybar bar &

sleep 1

pid_dummy=$(ps -ef | grep 'polybar dummy' | grep -v grep | awk '{print $2}')
pid_bar=$(ps -ef | grep 'polybar bar' | grep -v grep | awk '{print $2}')

echo $pid_dummy > $SCRIPT_DIR/pid_dummy.txt
echo $pid_bar > $SCRIPT_DIR/pid_bar.txt

wid_dummy=$(xdo id -p $pid_dummy)
wid_bar=$(xdo id -p $pid_bar)

wid_bar_array=($wid_bar)

echo $wid_dummy > $SCRIPT_DIR/wid_dummy.txt
echo $wid_bar > $SCRIPT_DIR/wid_bar.txt

xdo lower $wid_dummy
xdo raise $wid_bar

echo '1' > $SCRIPT_DIR/toggle.txt
