#!/usr/bin/env bash


# Run as root
if [ $UID -ne 0 ]; then
  exec sudo -s "$0" "$@"
fi


# Warn user
echo "This script removes a LOT of packages!"
read -p "Do you want to continue? (y/N) " continue

case "$continue" in
  Y|y*);;
  *) exit 1;;
esac


printf "Removing packages...""\n"

while read package
do
  echo $package
  apt purge --auto-remove -y "$package"
done < "packages.txt"

printf "\n""Packages removed successfully!"
