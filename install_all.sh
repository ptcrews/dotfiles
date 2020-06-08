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

if [[ -z $UPDATE_ONLY ]]; then

  echo "Installing dependencies..."

  # Update and upgrade current packages.
  sudo apt update
  sudo apt upgrade

  # Install misc dependencies not included elsewhere.
  sudo apt install python3
  sudo apt install python3-pip
  curl -sL install-node.now.sh/lts | sudo bash

  # Install various packages for development work.
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustup toolchain install nightly
  rustup component add rust-src
  rustup component add rust-docs

  sudo apt install cargo
  cargo install rustfmt

  sudo apt install tmux

fi

# Get current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Run the install scripts from other directories.
echo "Running install scripts..."

(cd $DIR/editors && ./install.sh $1)

echo "Installation complete."
