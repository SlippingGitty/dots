#!/usr/bin/env bash

#INITIAL INFO PROMPT
dialog  --title "Hopper Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, remember to specifically select the Distro you are using.\n\nAfterwards, you may want to refresh or reboot the computer, depending on your window manager/desktop enviroment." 10 70;sleep 5 

#DIALOG/NCURSES
HEIGHT=15
WIDTH=41
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
         2 "Ubuntu"
         3 "Quit")

#OPTIONS IN EXECUTION
clear
    case $CHOICE in
            1)  
                sudo pacman -S curl git
                bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizardArch.sh)
                git clone https://aur.archlinux.org/yay.git
                cd yay
                makepkg -si --noconfirm
                yay -S i3 cmus steam youtube-dl thunar kdenlive discord-canary picom blueman steam unzip unrar pavucontrol feh curl npm flameshot qbittorrent google-chrome-stable rofi lxappearance thunar tumbler alacritty krita neovim git zsh neofetch --noconfirm
                cd
                cd .config
                git clone git://github.com/tobi-wan-kenobi/bumblebee-status
                sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                cd
                git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
                cd
                clear
                dialog  --title "Hopper Setup Wizard" --infobox "Finished. \n\nThis script is done doing it's job. Pray for the best, and expect the worst. \n\nOnce again, you may want to refresh or reboot the computer, depending on your window manager/desktop enviroment." 10 70;sleep 5 
                sleep 3
            # Sets everything up for Arch
                ;;
            2)
                sudo apt install --assume-yes curl git
                bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizard.sh)
                sudo add-apt-repository -y ppa:regolith-linux/stable
                sudo apt install --assume-yes i3-gaps curl npm flameshot qbittorrent firefox rofi lxappearance thunar tumbler picom unrar feh unzip kitty krita neovim git zsh neofetch flatpak kdenlive blueman steam cmus youtube-dl
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                cd .config
                git clone git://github.com/tobi-wan-kenobi/bumblebee-status
                cd
                sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                cd
                git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
                cd
                clear
                dialog  --title "Hopper Setup Wizard" --infobox "Finished. \n\nThis script is done doing it's job. Pray for the best, and expect the worst. \n\nOnce again, you may want to refresh or reboot the computer, depending on your window manager/desktop enviroment." 10 70;sleep 5 
            # Sets everything up for Ubuntu
                ;;
            3)
            echo "User requested an exit"
            exit
                ;;
    esac
done
