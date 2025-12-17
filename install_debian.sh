#!/bin/bash

# Set colours for Whiptail
export NEWT_COLORS='root=,black
border=green,black
title=red,black
roottext=green,black
window=red,black
textbox=white,black
button=black,green
compactbutton=white,black
listbox=white,black
actlistbox=black,white
actsellistbox=black,green
checkbox=green,black
actcheckbox=black,green
'

green_color="\033[32m"
red_color="\033[31m"
reset_color="\033[0m"

echo -e "${green_color}[ INFO ]${reset_color} This script requires the following dependencies: Git and Whiptail."
echo -e "${green_color}[ INFO ]${reset_color} It will create .cache, .config and .local folders if not present."

# Check Git installed
function check_git() {
    if command -v git >/dev/null 2>&1; then
        echo -e "${green_color}[ INFO ]${reset_color} Git already installed."
    else
        sudo apt-get install -y -qq git > /dev/null 2>&1
        echo -e "${red_color}[ NOTICE ]${reset_color} Git has been installed."
    fi
}

check_git

# Check Whiptail installed
function check_whiptail() {
    if command -v whiptail >/dev/null 2>&1; then
        echo -e "${green_color}[ INFO ]${reset_color} Whiptail already installed."
    else
        sudo apt-get install -y -qq whiptail > /dev/null 2>&1
        echo -e "${red_color}[ NOTICE ]${reset_color} Whiptail has been installed."
    fi
}

check_whiptail

mkdir -p $HOME/.cache $HOME/.config $HOME/.local/share $HOME/.local/state > /dev/null 2>&1

# Software menu
CHOICES=( $(whiptail --separate-output --title "Linux software & dotfiles installer" --backtitle "<Tab> moves; <Space> select; <Enter> continue;" --checklist \
    "Select packages to install" 0 80 10 \
    "zsh" "modern shell" ON \
    "ansible" "automation software" OFF \
    "bat" "text viewer" ON \
    "btop" "system monitor" ON \
    "curl" "network downloader" ON \
    "duf" "disk usage viewer" ON \
    "fastfetch" "system information" ON \
    "gnupg" "encryption software" OFF \
    "htop" "system monitor" ON \
    "less" "terminal pager" ON \
    "nano" "code editor" ON \
    "starship" "terminal prompt (requires zsh)" ON \
    "vim" "code editor" ON \
    "wget" "network downloader" ON \
    3>&1 1>&2 2>&3) )

install_ansible() {
    sudo apt-get install -y -qq ansible > /dev/null 2>&1
    cp -R dotfiles/ansible $HOME/.config
    whiptail --title "Install completed" --msgbox "Ansible installed and configuration restored." 10 80
}

install_bat() {
    sudo apt-get install -y -qq bat > /dev/null 2>&1
    cp -R dotfiles/bat $HOME/.config
    whiptail --title "Install completed" --msgbox "Bat installed and configuration restored." 10 80
}

install_btop() {
    sudo apt-get install -y -qq btop > /dev/null 2>&1
    cp -R dotfiles/btop $HOME/.config
    whiptail --title "Install completed" --msgbox "Btop installed and configuration restored." 10 80
}

install_curl() {
    sudo apt-get install -y -qq curl > /dev/null 2>&1
    whiptail --title "Install completed" --msgbox "Curl installed and configuration restored." 10 80
}

install_duf() {
    sudo apt-get install -y -qq duf > /dev/null 2>&1
    cp -R dotfiles/duf $HOME/.config
    whiptail --title "Install completed" --msgbox "Duf installed and configuration restored." 10 80
}

install_fastfetch() {
    sudo apt-get install -y -qq fastfetch > /dev/null 2>&1
    cp -R dotfiles/fastfetch $HOME/.config
    whiptail --title "Install completed" --msgbox "Fastfetch installed and configuration restored." 10 80
}

install_gnupg() {
    mkdir -p $HOME/.local/share/gnupg
    touch $HOME/.local/share/gnupg/gpg-agent.service
    echo '[Service]
    Environment="GNUPGHOME=%h/.local/share/gnupg"' >> $HOME/.local/share/gnupg/gpg-agent.service
    whiptail --title "Install completed" --msgbox "Gnupg installed and configuration restored." 10 80
}

install_htop() {
    sudo apt-get install -y -qq htop > /dev/null 2>&1
    cp -R dotfiles/htop $HOME/.config
    whiptail --title "Install completed" --msgbox "Htop installed and configuration restored." 10 80
}

install_less() {
    sudo apt-get install -y -qq less > /dev/null 2>&1
    cp dotfiles/less/lesskey $HOME/.config
    whiptail --title "Install completed" --msgbox "Less installed and configuration restored." 10 80
}

install_nano() {
    sudo apt-get install -y -qq nano > /dev/null 2>&1
    cp -R dotfiles/nano $HOME/.config &&
    sed -i -e '$d' $HOME/.config/nano/nanorc && echo "include /usr/share/nano/*.nanorc" >> $HOME/.config/nano/nanorc
    whiptail --title "Install completed" --msgbox "Nano installed and configuration restored." 10 80
}

install_vim() {
    sudo apt-get install -y -qq vim > /dev/null 2>&1
    cp -R dotfiles/vim $HOME/.config &&
    sed -i -e '$d' $HOME/.config/vim/vimrc && echo "set rtp+=/usr/bin/fzf" >> $HOME/.config/vim/vimrc
    mkdir -p $HOME/.config/vim/after $HOME/.config/vim/autoload > /dev/null 2>&1
    mkdir -p $HOME/.config/vim/pack/{itchyny,junegunn,preservim,ryanoasis,tpope}/{start,opt} > /dev/null 2>&1
    git clone --quiet https://github.com/itchyny/lightline.vim  $HOME/.config/vim/pack/itchyny/start/lightline > /dev/null 2>&1
    git clone --quiet https://github.com/junegunn/fzf.vim       $HOME/.config/vim/pack/junegunn/start/fzf > /dev/null 2>&1
    git clone --quiet https://github.com/preservim/nerdtree.git $HOME/.config/vim/pack/preservim/start/nerdtree > /dev/null 2>&1
    git clone --quiet https://github.com/ryanoasis/vim-devicons $HOME/.config/vim/pack/ryanoasis/start/vim-devicons > /dev/null 2>&1
    git clone --quiet https://github.com/tpope/vim-fugitive.git $HOME/.config/vim/pack/tpope/start/vim-fugitive > /dev/null 2>&1
    git clone --quiet https://github.com/tpope/vim-sensible.git $HOME/.config/vim/pack/tpope/start/vim-sensible > /dev/null 2>&1
    whiptail --title "Install completed" --msgbox "Vim installed and configuration restored." 10 80
}

install_wget() {
    sudo apt-get install -y -qq wget > /dev/null 2>&1
    cp -R dotfiles/wget $HOME/.config
    whiptail --title "Install completed" --msgbox "Wget installed and configuration restored." 10 80
}

install_zsh() {
    sudo apt-get install -y -qq zsh > /dev/null 2>&1
    cp dotfiles/dir_colors/dir_colors $HOME/.config
    cp -R dotfiles/zsh $HOME/.config
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions.git      $HOME/.config/zsh/plugins/zsh-autosuggestions > /dev/null 2>&1
    git clone --quiet https://github.com/zsh-users/zsh-completions.git          $HOME/.config/zsh/plugins/zsh-completions > /dev/null 2>&1
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git  $HOME/.config/zsh/plugins/zsh-syntax-highlighting > /dev/null 2>&1
    : > $HOME/.config/zsh/history
    ln -s .config/zsh/.zshenv ~/.zshenv
    echo "alias bat='batcat'" >> $HOME/.config/zsh/aliases
    sudo chsh -s $(which zsh) $USER > /dev/null 2>&1
    whiptail --title "Install completed" --msgbox "ZSH installed and configuration restored." 10 80
}

install_starship() {
    sudo apt-get install -y -qq starship > /dev/null 2>&1
    cp -R dotfiles/starship $HOME/.config &&
    whiptail --title "Install completed" --msgbox "Starship installed and configuration restored." 10 80
}

for choice in "${CHOICES[@]}"; do
    case $choice in
        ansible)        install_ansible ;;
        bat)            install_bat ;;
        btop)           install_btop ;;
        curl)           install_curl ;;
        duf)            install_duf ;;
        fastfetch)      install_fastfetch ;;
        git)            install_git ;;
        gnupg)          install_gnupg ;;
        htop)           install_htop ;;
        less)           install_less ;;
        nano)           install_nano ;;
        starship)       install_starship ;;
        vim)            install_vim ;;
        wget)           install_wget ;;
        zsh)            install_zsh ;;
        *)              exit ;;
    esac
done

# Post-Install
function post_install() {
    if whiptail --title "Post Install" --yesno "Do you want to run user post install?" 10 80; then
        rm $HOME/.bash_logout $HOME/.bash_profile $HOME/.bashrc $HOME/.profile> /dev/null 2>&1
        touch $HOME/.hushlogin
        echo -e "${red_color}[ NOTICE ]${reset_color} Post install completed."
    else
        echo -e "${green_color}[ INFO ]${reset_color} Post install not completed."
    fi
}

post_install

rm -fr dotfiles

# Exit/Reboot
function exit_reboot() {
    if whiptail --title "Exit or Reboot"  --yes-button "Exit" --no-button "Reboot" --yesno "Do you want to exit or reboot?" 10 80; then
        exit
    else
        sudo reboot
    fi
}

exit_reboot
