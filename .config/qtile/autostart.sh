#!/bin/bash

dunst &
brave-browser &
$GUESSED_TERMINAL &
notify-send -a $DIST "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &
/usr/bin/xautolock -time 10 -locker "i3lock-fancy -f" -detectsleep &
copyq &
numlockx on
