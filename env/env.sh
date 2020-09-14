# Give the XDG dirs
export XDG_CONFIG_HOME=~/.dotfiles
export XDG_DATA_HOME=~/.data
export XDG_CACHE_HOME=~/.cache

# lang (so programs won't complain, I'm looking at you R.)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# nvim
export EDITOR=nvim

# Update the PATH for user bin
export PATH=$PATH:~/bin

# PYTHONPATH
export PYTHONPATH=~/Documents/python

# Add APY to the environment
export APY_CONFIG=~/.dotfiles/apy/apy.json
export APY_ANKI_PATH="/Users/mikevink/bin/anki-2.1.26/pylib"
export PYTHONPATH=$PYTHONPATH:"/Users/mikevink/bin/anki-2.1.26/qt"

# Add brew bin jupytext to python path
# export PYTHONPATH=$PYTHONPATH:"/usr/local/bin"
export JUPYTER_PORT=9000

# nvr
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# flask
# export FLASK_APP=/Users/mikevink/Documents/python/microblog/microblog.py
export FLASK_APP=microblog.py

# Alias
alias s="source ~/.zshrc&&source ~/.dotfiles/env/env.sh"
alias v="nvim"
alias ls="ls -Ga"
alias ve="nvim ~/.dotfiles/env/env.sh"
alias d="cd ~/.dotfiles"
alias n="cd ~/Documents/markdown_notes"
alias a="~/bin/anki-2.1.26/run"
alias lib="cd ~/Documents/lib"
alias py="cd ~/Documents/python"
alias e="emacs -nw"

# Bindings
export KEYTIMEOUT=20
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M visual 'kj' vi-cmd-mode
