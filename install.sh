#!/bin/bash -e

sudo apt update -y && sudo apt upgrade -y

source /verbis/functions.sh

verbis_defaults_main
verbis_defaults_rust

curl -L -o out.tgz https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz
tar -xf out.tgz
mv cargo-binstall $HOME/.cargo/bin
rm out.tgz

cargo binstall ripgrep -y
cargo binstall bat -y

sudo apt install tree -y
sudo apt install zsh -y
sudo chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

cargo binstall starship -y

verbis_symlink_cache_dir git

stow -t ~ gitconfig

# If Samply.Beam not yet present, clone the develop branch
verbis_clone github.com:samply/beam develop

# Same for the Bridgehead -- but here, clone the default branch
verbis_clone github.com:samply/bridgehead
