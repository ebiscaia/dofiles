#!/bin/bash

brave-browser &
dunst &
notify-send -a $DIST "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &
/usr/bin/xautolock -time 10 -locker "i3lock-fancy -f" -detectsleep &
copyq &
sleep 1
$GUESSED_TERMINAL &
numlockx on
