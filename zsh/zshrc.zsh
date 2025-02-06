if [ -f "$HOME/.zshrc_local.zsh" ]; then
  source $HOME/.zshrc_local.zsh
fi

# load sheldon
eval "$(sheldon source)"
