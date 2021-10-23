#!/usr/bin/env bash

# Check if process is already running before attempting to start it
function run {
  if ! pgrep -f $1 ; then
    $@&
  fi
}

#
# Apps & configuration scripts to automatically run:
#

# Compositor effects
run picom --config ~/.config/awesome/conf/picom.cfg

# Network manager (tray icon)
run nm-applet

# Power management
run xfce4-power-manager

# Screen locker
run xss-lock ~/.config/awesome/scripts/sleep-lock.sh

# Screenshot utility (tray icon)
run flameshot
