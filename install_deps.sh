#! /bin/bash

echo "Installing dependencies..."

# Prerequisites
sudo apt update
sudo apt upgrade

sudo apt install stow
sudo apt install tmux

# Languages and Developer Environments
echo "Installing languages and developer environments"

## Install Python
sudo apt install python3
sudo apt install python3-pip

## Install Node.js (required for neovim extensions)
curl -sL install-node.now.sh/lts | sudo bash

## Install C++ developer environment
sudo apt install clang

## Install Rust
echo "Installing Rust"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup toolchain install nightly
rustup component add rust-src
rustup component add rust-docs

sudo apt install cargo
cargo install rustfmt

# Install Developer Tools
echo "Installing developer tools"

## Install neovim (requires python3)
sudo apt install neovim
pip3 install --user --upgrade msgpack
pip3 install --user --upgrade pynvim

### Install Plug configuration manager.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall

echo "Dependencies installed."
