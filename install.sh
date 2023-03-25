#!/bin/bash -e

source /verbis/functions.sh

verbis_defaults_main
verbis_defaults_rust

cargo install ripgrep
cargo install bat

sudo apt install zsh -y
chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

cargo install starship --locked

verbis_symlink_cache_dir git

stow -t ~ gitconfig

# If Samply.Beam not yet present, clone the develop branch
verbis_clone github.com:samply/beam develop

# Same for the Bridgehead -- but here, clone the default branch
verbis_clone github.com:samply/bridgehead
