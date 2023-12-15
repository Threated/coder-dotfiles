
fish_add_path ~/.cargo/bin/
export STARSHIP_CONFIG=$HOME/.config/coderv2/dotfiles/starship.toml
set -g fish_greeting
starship init fish | source
