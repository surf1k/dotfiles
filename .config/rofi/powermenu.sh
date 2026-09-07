#!/usr/bin/env bash

# Options in English
shutdown='   Shutdown'
reboot='   Reboot'
suspend='   Suspend'

# Rofi Command with dedicated compact theme
rofi_cmd() {
    rofi -dmenu \
        -theme ~/.config/rofi/powermenu.rasi \
        -p "Power"
}

# Pass options to rofi
run_rofi() {
    echo -e "$shutdown\n$reboot\n$suspend" | rofi_cmd
}

# Execute Command
chosen="$(run_rofi)"
case "${chosen}" in
    *"Shutdown"*)
        systemctl poweroff
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
esac
