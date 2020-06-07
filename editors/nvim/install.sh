#! /bin/bash

# If this script is run with --update or -u, then only update config files and
# don't install any packages.
if [[ $1 == "--update" ]] || [[ $1 == "-u" ]]; then
  UPDATE_ONLY=true
elif [[ $1 ]]; then
  echo "Unknown argument: $1"
  echo "Valid argument: ./install_all [--update|-u]"
  exit -1
fi

echo "Installing neovim..."

# If $UPDATE_ONLY is not set, then install the required dependencies.
if [[ -z $UPDATE_ONLY ]]; then

  echo "Installing neovim dependencies..."

  # Install misc dependencies.
  pip3 install --user --upgrade msgpack
  pip3 install --user --upgrade pynvim
  
  # Install Plug configuration manager.
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fi

# Copy over configuration file.
cp ./init.vim ~/.config/nvim/init.vim

echo "Installed neovim."
