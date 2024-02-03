#!/bin/sh
link() {
  dir_path=$(dirname "$2")
  if [ ! -d "$dir_path" ]; then
    mkdir -p "$dir_path" 
  fi
  ln -sfv ~/dotfiles/$1 $2
}

# zsh
sheldon init --shell zsh
link zsh/zprofile.zsh ~/.zprofile
link zsh/zshrc.zsh ~/.zshrc
link zsh/plugins.toml ~/.config/sheldon/plugins.toml

# starship 
link starship/starship.toml ~/.config/starship.toml

# tmux
link tmux/tmux.conf ~/.tmux.conf

