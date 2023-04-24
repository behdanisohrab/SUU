#!/bin/bash

sudo apt-get remove --purge snapd gnome-software-plugin-snap
rm -fr ~/snap

echo "Adding nosnap.pref file to /etc/apt/preferences.d"
sudo sh -c 'echo "Package: snapd" > /etc/apt/preferences.d/nosnap.pref'
sudo sh -c 'echo "Pin: release a=*-snap*" >> /etc/apt/preferences.d/nosnap.pref'
sudo sh -c 'echo "Pin-Priority: -10" >> /etc/apt/preferences.d/nosnap.pref'

echo "Snap packages have been disabled."
 
