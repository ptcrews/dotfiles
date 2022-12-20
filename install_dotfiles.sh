#! /bin/bash

echo "Linking dotfiles..."

for f in *; do
  if [ -d "$f" ]; then
    echo "Linking $f"
    stow "$f"
  fi
done

echo "Done linking dotfiles."
