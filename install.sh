#!/bin/bash -e

sudo apt update -y && sudo apt upgrade -y

source /verbis/functions.sh

verbis_defaults_main
verbis_defaults_rust

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
