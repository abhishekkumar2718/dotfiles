#! /usr/bin/env bash

source ./bootstrap_function.sh

install_polybar(){

  if [ $(command -v polybar) -eq 0 ] ; then
    success "Polybar installed already";
    return 0;
  fi;

  step "Installing Polybar-3.3.0 from source";
  warning "Verify that Polybar-3.3.0 is the latest stable version";
  # TODO: Add test for validating if the url exists
  step "Downloading polybar-3.3.0.tar";
  exec_command "curl -L -o polybar.tar https://github.com/jaagr/polybar/releases/download/3.3.0/polybar-3.3.0.tar"
  step "Extracting tar file";
  exec_command "tar xvf polybar.tar";
  step "Changing directory to polybar/";
  exec_command "cd polybar";
  step "Executing build.sh";
  exec_command "./build.sh";
  step "Returning to previous directory";
  exec_command "cd ..";
  step "Removing polybar.tar and directory";
  exec_command "rm -rf polybar polybar.tar";

  _=$(command -v polybar);
  if [ $? -ne 0 ] ; then
    error "Polybar could not be installed"; 
    step "Please manually install polybar before continuing."
    exit 1;
  fi;
  success "Polybar is installed";
  return 0;
}

install_arc_dark() {
  step "Installing Arc-Dark from source";
  step "Cloning Arc-Dark repository from github";
  exec_command "git clone https://github.com/horst3180/arc-theme --depth 1";
  step "Changing directory to arc-theme/" 
  exec_command "cd arc-theme";
  step "Executing AutoGen"; 
  exec_command "./autogen.sh --prefix=/usr";
  step "Installing arc-dark";
  exec_command "make install"
  step "Cleaning directory";
  exec_command "cd ..";
  exec_command "rm -rf arc-theme"
  success "Arc-Dark installed!"
}

step "Adding plugin to switch i3 workspaces";
exec_command "add-apt-repository ppa:aacebedo/libi3ipc-glib";
success 'Plugin added';

step "Updating repository lists";
exec_command "apt update";
success "Repository list updated";

step "Upgrading current packages";
exec_command "apt upgrade";
success "Current packages upgraded";

step "Installing required packages";
exec_command "apt install xfce4 xfce4-goodies vim i3 libi3ipc-glib firefox audacious rvm rofi curl tar cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 libgtk-3-dev python-pip python-dev build-essential fonts-powerline";
exec_command "pip install --upgrade setuptools";
exec_command "pip install --upgrade virtualenv";
exec_command "pip install powerline-shell";
success "Required packages installed";

install_polybar;

install_arc_dark;

step "Uninstalling Xfce4-panel and i3status"; 
exec_command "apt remove xfce4-panel i3status";
success "Xfce4-panel, i3status removed"

backup_dotfiles;

synchronise_dotfiles;

# Removes default border line for i3 4.14.1
exec_command "sed '204d' ~/.config/i3/config > ~/.config/i3/config";

exit 0;
