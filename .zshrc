
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
