#!/usr/bin/env bash

# Check if process is already running before attempting to start it.
function run {
  if ! pgrep -f $1 ; then
    $@&
  fi
}

# Load previously configured wallpaper.
run nitrogen --restore

# Enable compositor effects.
run picom --config ~/.config/awesome/conf/picom.cfg

# Network manager tray icon.
run nm-applet

# Start power management.
run xfce4-power-manager

# Start screen locker
run xss-lock ~/.config/awesome/scripts/sleep-lock.sh