#! /bin/bash

echo "Installing dependencies..."

sudo apt update
sudo apt upgrade

# Prerequisites
sudo apt install stow

sudo apt install python3
sudo apt install python3-pip
curl -sL install-node.now.sh/lts | sudo bash

# Install Developer Environment
sudo apt install tmux

## Install neovim
sudo apt install neovim
pip3 install --user --upgrade msgpack
pip3 install --user --upgrade pynvim

### Install Plug configuration manager.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup toolchain install nightly
rustup component add rust-src
rustup component add rust-docs

sudo apt install cargo
cargo install rustfmt

echo "Dependencies installed."
