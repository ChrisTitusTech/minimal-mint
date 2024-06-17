#!/bin/bash

# Run as root
if [ $UID -ne 0 ]; then
    exec sudo -s "$0" "$@"
fi

printf "Removing packages...""\n"

while read package
do
  apt purge --ignore-missing --auto-remove -y "$package"
done < "packages.txt"

printf "\n""Packages removed successfully!"
