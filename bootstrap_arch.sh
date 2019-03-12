#! /usr/bin/env bash

soruce .bootstrap_function.sh

step "Upgrading installed packages";
exec_command "pacman -Syu";
step "";


step "Installing required packages";
exec_command "pacman -S xfce4 xfce4-goodies vim i3 firefox audacious rofi python-pip polybar arc-gtk-theme";
success "Installed packages";

step "Uninstalling xfce4-panel and i3status";
exec_command "pacman -R xfce4-panel i3status";
success "xfce4-panel, i3status removed";

backup_dotfiles;

synchronise_dotfiles;
