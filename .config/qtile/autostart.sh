#!/bin/bash

#Discover the dist name
DIST=$(lsb_release -a | cut -f2 | sed -n 2p)

numlockx on
dunst &
alacritty &
brave-browser &
notify-send -a $DIST "Notification" "Welcome to Qtile"
feh --bg-fill --randomize ~/Pictures/*
picom &
/usr/bin/xautolock -time 10 -locker "i3lock-fancy -f 'Binchotan_Sharp-Regular-Nerd-Font-Plus-Font-Awesome-Plus-Font-Logos-(Font-Linux)-Plus-Material-Design-Icons'" -detectsleep &
copyq &
