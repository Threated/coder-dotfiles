
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

eval "$(starship init zsh)"
