#!/usr/bin/env bash

#INITIAL INFO PROMPT
dialog  --title "Hopper Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, remember to specifically select the Distro you are using.\n\nAfterwards, you may want to refresh or reboot the computer, depending on your window manager/desktop enviroment." 10 70;sleep 5 

#DIALOG/NCURSES
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Hopper Setup Wizard"
TITLE="Installer"
MENU="Select an option:"

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

#OPTIONS NAMES
OPTIONS=(1 "Arch"
         2 "Debian"
         3 "Quit")

#OPTIONS IN EXECUTION
clear
    case $CHOICE in
            1)  
                sudo pacman -S curl npm flameshot qbittorrent firefox rofi lxapperance thunar tumbler alacritty krita neovim git zsh neofetch
                bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizardArch.sh)
                echo Finished.
                sleep 3
            # Installs the Arch packages I want
                ;;
            2)
                sudo apt install curl npm flameshot qbittorrent firefox rofi lxapperance thunar tumbler alacritty krita neovim git zsh neofetch
                bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizard.sh)
                echo Finished.
                sleep 3
                cd
            # Installs all the Debian packages I want
                ;;
            3)
            echo "User requested an exit"
            exit
                ;;
    esac
done
