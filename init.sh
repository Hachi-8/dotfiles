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


# nvim
link nvim/init.vim ~/.config/nvim/init.vim
link nvim/coc-settings.json ~/.config/nvim/coc-settings.json
link nvim/lua ~/.config/nvim/lua
link nvim/dein.toml ~/.config/nvim/dein.toml
link nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
# link nvim/formatter ~/.config/nvim/formatter 
# これだめっぽい、無限ループのリンクになる

# git
link git/gitignore_global ~/.config/git/ignore
git config --global core.excludesfile ~/.config/git/ignore

# lazygit
link lazygit/config.yml ~/.config/lazygit/config.yml

# alacritty
link alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  echo "--------------------"
  echo "WSL detected"
  echo "Do you want to copy alacritty.toml to %APPDATA%/alacritty/alacritty.toml for WSL? [y/n]"
  read input 

  if [ -z $input ] || [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] || [$input = 'N']; then
    echo "Skip copying alacritty.toml"
  elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] || [ $input = 'Y' ]; then
    echo "type your windows username"
    read username
    if [ -z $username ]; then
      echo "Invalid username. Skip copying alacritty.toml"
      exit 1
    fi
    APPDATA="/mnt/c/Users/$username/AppData/Roaming"
    cp alacritty/alacritty.toml $APPDATA/alacritty/alacritty.toml
  else
    echo "Invalid input. Skip copying alacritty.toml"
  fi
fi
