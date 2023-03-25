
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
. "$HOME/.cargo/env"

alias py="python3"
alias cat="bat"
alias rgf='rg --files | rg'

