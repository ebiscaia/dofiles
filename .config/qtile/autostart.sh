#!/bin/bash

numlockx on
dunst &
terminator &
brave-browser &
notify-send -a "Ubuntu" "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &
/usr/bin/xautolock -time 10 -locker "i3lock-fancy -f 'Binchotan_Sharp-Regular-Nerd-Font-Plus-Font-Awesome-Plus-Font-Logos-(Font-Linux)-Plus-Material-Design-Icons'" -detectsleep &
copyq &
