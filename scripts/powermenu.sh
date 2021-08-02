#!/bin/bash

rofi_command="rofi -theme ~/.config/awesome/conf/powermenu.rasi"

who=$(whoami)
host=$(hostname)
hostinfo="$who@$host"

# Options
lock="  Lock"
logout="  Logout"
suspend="  Suspend"
reboot="  Reboot"
shutdown="  Shutdown"

# Power menu options
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p $hostinfo -dmenu -selected-row 0)"
case $chosen in
  $lock)
    betterlockscreen -l dim ;;
  $logout)
    awesome-client 'awesome.quit()' ;;
  $suspend)
    systemctl suspend ;;
  $reboot)
    systemctl reboot ;;
  $shutdown)
    systemctl -i poweroff
esac
