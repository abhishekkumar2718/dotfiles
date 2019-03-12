success() {
  printf -- "\033[32m$1\033[0m\n";
}

warning() {
  printf -- "\033[33m$1\033[0m\n";
}

error() {
  printf -- "\033[31m$1\033[0m\n";
}

step() {
  printf -- "\033[1m$1\033[0m\n";
}

exec_command() {
  printf -- "\033[37m";
  $1;
  printf -- "\033[0m";
}

binary_exists() {
  _=$(command -v $1);
  if [ $? -ne 0 ]; then
    error "$1 is not installed!"
    exit;
  fi;
  success "$1 is installed";
}

backup_dotfiles() {
  step "Backing up old dotfiles";
  exec_comand "$PWD/bin/dotfiles_sync $PWD/backup/";
  success "Dotfiles successfully backed up to $PWD/backup";
}

synchronise_dotfiles() {
  step "Synchronising dotfiles";
  warning "Earlier dotfiles will be removed. Backup recommended.";
  exec_command "sudo ./sync.sh";
  success "Dotfiles synchronised";
}
