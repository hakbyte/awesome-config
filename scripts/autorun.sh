#!/usr/bin/env bash

# Check if process is already running before attempting to start it.
function run {
  if ! pgrep -f $1 ; then
    $@&
  fi
}

# Load previously configured wallpaper.
run nitrogen --restore