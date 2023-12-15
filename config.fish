
fish_add_path ~/.cargo/bin/
export STARSHIP_CONFIG=$HOME/.config/coderv2/dotfiles/starship.toml
set -g fish_greeting
starship init fish | source

alias py 'python3'
alias cat 'bat'
alias rgf 'rg --files | rg'
alias lsa 'ls -la'
alias dockerip "docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
