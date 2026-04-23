#!/bin/sh
DOTFILES_DIR=$(cd $(dirname "$0"); pwd)

link() {
  dir_path=$(dirname "$2")
  if [ ! -d "$dir_path" ]; then
    mkdir -p "$dir_path" 
  fi
  ln -sfv "$DOTFILES_DIR/$1" "$2"
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
  echo "Do you want to copy alacritty config files to Windows? [y/n]"
  read input 

  case "$input" in
    [yY][eE][sS]|[yY])
      # Try to get Windows username automatically
      win_user=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
      if [ -n "$win_user" ]; then
        echo "Detected Windows username: $win_user. Is this correct? [y/n]"
        read confirm
        case "$confirm" in
          [nN]*)
            echo "Enter your Windows username:"
            read win_user
            ;;
        esac
      else
        echo "Could not detect Windows username. Please enter it:"
        read win_user
      fi

      if [ -z "$win_user" ]; then
        echo "Invalid username. Skip copying alacritty config."
      else
        APPDATA="/mnt/c/Users/$win_user/AppData/Roaming"
        if [ -d "$APPDATA" ]; then
          mkdir -p "$APPDATA/alacritty"
          # Copy toml files from alacritty dir
          for f in "$DOTFILES_DIR"/alacritty/*.toml; do
            [ -e "$f" ] || continue
            cp "$f" "$APPDATA/alacritty/$(basename "$f")"
          done
          echo "Copied Alacritty config to $APPDATA/alacritty/"
        else
          echo "Error: Could not find Windows AppData directory at $APPDATA"
        fi
      fi
      ;;
    *)
      echo "Skip copying alacritty config"
      ;;
  esac
fi
