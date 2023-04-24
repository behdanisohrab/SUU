#!/bin/bash

while true
do
    echo "Welcome to Simple Ubuntu Utility"
    echo "Please select a section:"
    echo "1) Enable/Disable Snap Packages"
    echo "2) Brave / Firefox Installer"
    echo "3) Enable Pacstall "
    echo "4) Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Please choose an action for Snap Packages:"
            echo "1) Enable"
            echo "2) Disable"
            read -p "Enter your choice: " snap_choice

            case $snap_choice in
                1)
                    sh scripts/enable_snap.sh
                    ;;
                2)
                    sh scripts/disable_snap.sh
                    ;;
                *)
                    echo "Invalid choice."
                    ;;
            esac
            ;;
        2)
            sh scripts/install_browser.sh
            ;;
        3)
            sh scripts/pacstall.sh
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac

    echo "Done with section $choice."
done

exit 0
