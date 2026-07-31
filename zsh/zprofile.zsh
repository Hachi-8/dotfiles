if [ -f $HOME/.zprofile_local ]; then
  source $HOME/.zprofile_local
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
