#!/bin/bash -e

sudo apt update -y
sudo apt install software-properties-common -y
source /verbis/functions.sh

verbis_defaults_main
verbis_symlink_cache_dir git
sudo ln -ds /mnt/cache/bridgehead /etc
rm -rf /home/coder/.cargo/registry
verbis_defaults_rust
echo "ran rust"
# Yanked from https://github.com/bstollnitz/dotfiles/blob/main/install.sh
create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
sudo chsh -s $(which fish)

curl -L -o out.tgz https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz
tar -xf out.tgz
mv cargo-binstall $HOME/.cargo/bin
rm out.tgz

source $HOME/.cargo/env

cargo binstall ripgrep bat tre-command starship -y

stow -t ~ gitconfig

verbis_install_vscode_extensions ms-azuretools.vscode-docker eamodio.gitlens serayuzgur.crates tamasfe.even-better-toml

sudo apt install python3-pip gh -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source $HOME/.profile
nvm install --lts
