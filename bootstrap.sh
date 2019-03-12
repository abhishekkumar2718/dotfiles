#! /usr/bin/env bash

source ./bootstrap_function.sh

# Catch errors in pipelines
set -o pipefail
# Exit on using undeclared variable
set -o nounset

if [ ${#@} -eq 1 ]; then
  if [ "$1" == "--help" ]; then
    printf -- "Usage: bootstrap_arch.sh [OPTION]\n";
    printf -- "Options:\n":
    printf -- "-- debug                 Run in debugging mode\n";
    exit 0;
  elif [ "$1" == "--debug" ]; then
    set -o xtrace
  fi;
fi;

warning "Must be run as root user";
if [ "$EUID" -ne 0 ]; then
  error "Not run as root user";
  success "Run script as - sudo ./bootstrap.sh"
  exit;
fi;

step "Recognizing OS..."
_=$(command -v apt)
if [ $? -eq 0 ]; then
  success "Ubuntu detected";
  sudo ./bootstrap_ubuntu.sh;
  warning "Need to disable xfwn4 and xfdesktop manually";
  step "Follow instructions on https://github.com/abhishekkumar2718/dotfiles/README.md";
  exit;
fi;
_=$(command -v pacman)
if [ $? -eq 0 ]; then
  success "Arch Linux detected"
  sudo ./bootstrap_arch.sh
  warning "Need to disable xfwn4 and xfdesktop manually";
  step "Follow instructions on https://github.com/abhishekkumar2718/dotfiles/README.md";
  exit;
fi;

error "Could not identify OS";
step "Follow manual instructions on http://github.com/abhishekkumar2718/dotfiles/README.md";
exit 0;
