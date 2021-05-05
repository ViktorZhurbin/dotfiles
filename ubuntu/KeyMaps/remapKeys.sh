#!/bin/sh

# Swap PgUp/PgDown and Home/End keys respectively
# Make file executable and add as a script in Startup Applications
xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"
xmodmap -e "keycode 110 = Prior"
xmodmap -e "keycode 115 = Next"
