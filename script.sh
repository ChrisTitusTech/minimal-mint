#!/usr/bin/env bash


# Run as root
if [ $UID -ne 0 ]; then
  exec sudo -s "$0" "$@"
fi


# Warn user
echo "This script removes a LOT of packages!"
read -p "Do you want to continue? (y/N) " yn

case "$yn" in
  Y|y*);;
  *) exit 1;;
esac

printf "Removing packages...""\n"

while read package
do
  dpkg -P "$package"
done < "packages.txt"

printf "Running 'apt-get autopurge'...""\n"
apt-get autopurge

printf "\n""Packages removed successfully!"
