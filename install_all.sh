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

fi 

# Get current directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Run the install scripts from other directories.
echo "Running install scripts..."

(cd $DIR/editors && ./install.sh $1)

echo "Installation complete."
