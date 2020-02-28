#! /bin/bash

# Install misc dependencies.
pip3 install --user --upgrade msgpack
pip3 install --user --upgrade pynvim

# Install Plug configuration manager.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy over configuration file.
cp ./init.vim ~/.config/nvim/init.vim
