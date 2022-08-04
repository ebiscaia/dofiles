#!/bin/bash

numlockx on
dunst &
terminator &
brave-browser &
notify-send -a "Ubuntu" "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &

