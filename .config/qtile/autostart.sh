#!/bin/bash

numlockx on
dunst &
$GUESSED_TERMINAL &
brave-browser &
notify-send -a $DIST "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &
/usr/bin/xautolock -time 10 -locker "i3lock-fancy -f" -detectsleep &
copyq &
