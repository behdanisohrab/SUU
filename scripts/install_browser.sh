#!/bin/bash

function install_brave() {
    sudo apt-get update
    sudo apt-get install -y apt-transport-https curl
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update
    sudo apt-get install -y brave-browser
}

function install_firefox() {
	sudo add-apt-repository ppa:mozillateam/ppa
	echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
	sudo apt update
	sudo apt install firefox
}

echo "Please select a browser to install:"
echo "1) Brave Browser"
echo "2) Firefox DEB version"

read -p "Enter your choice: " choice

case $choice in
    1)
        echo "Installing Brave Browser..."
        install_brave &> /dev/null &
        ;;
    2)
        echo "Installing Firefox DEB version..."
        install_firefox &> /dev/null &
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

exit $?
