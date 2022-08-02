#!/bin/bash

numlockx on
dunst &
terminator &
brave-browser &
notify-send -a "Ubuntu" "Notification" "Welcome to Qtile"
nitrogen --restore &
picom &

