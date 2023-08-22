#!/bin/bash

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt-get update
sudo apt-get install snapd
sudo apt-mark unhold

echo "Snap packages have been enabled."
