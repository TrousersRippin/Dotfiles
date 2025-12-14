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

echo -e "${green_color}[ INFO ]${reset_color} This script requires the following dependencies: Homebrew, Stow and Whiptail."
echo -e "${green_color}[ INFO ]${reset_color} It will create .cache, .config and .local folders if not present."

# Check homebrew installed
function check_homebrew() {
    if command -v brew >/dev/null 2>&1; then
        echo -e "${green_color}[ INFO ]${reset_color} Homebrew already installed."
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo -e "${red_color}[ NOTICE ]${reset_color} Homebrew has been installed."
    fi
}

check_homebrew

export HOMEBREW_NO_ENV_HINTS=TRUE

# Check stow installed
function check_stow() {
    if command -v stow >/dev/null 2>&1; then
        echo -e "${green_color}[ INFO ]${reset_color} Stow already installed."
    else
        brew install --quiet stow > /dev/null 2>&1
        echo -e "${red_color}[ NOTICE ]${reset_color} Stow has been installed."
    fi
}

check_stow

# Check Whiptail installed
function check_whiptail() {
    if command -v whiptail >/dev/null 2>&1; then
        echo -e "${green_color}[ INFO ]${reset_color} Whiptail already installed."
    else
        brew install --quiet newt > /dev/null 2>&1
        echo -e "${red_color}[ NOTICE ]${reset_color} Whiptail has been installed."
    fi
}

check_whiptail

mkdir -p $HOME/.cache $HOME/.config $HOME/.local/share $HOME/.local/state

# Software menu
CHOICES=( $(whiptail --separate-output --title "Homebrew packages & dotfiles installer" --backtitle "<Tab> moves; <Space> select; <Enter> continue;" --checklist \
    "Select packages to install:" 0 80 10 \
    "homebrew" "package manager - required" ON \
    "ansible" "automation software" ON \
    "bat" "text viewer" ON \
    "btop" "system monitor" ON \
    "curl" "network downloader" ON \
    "dtop" "docker terminal user interface" ON \
    "duf" "disk usage viewer" ON \
    "fastfetch" "system information" ON \
    "ghostty" "terminal emulator" ON \
    "git" "version control" ON \
    "htop" "system monitor" ON \
    "less" "terminal pager" ON \
    "nano" "code editor" ON \
    "podman-tui" "podman terminal user interface" ON \
    "rclone" "file synchronisation" ON \
    "tmux" "terminal multiplexer" ON \
    "vim" "code editor" ON \
    "wget" "network downloader" ON \
    "zsh" "modern shell" ON \
    "starship" "terminal prompt - requires zsh" ON \
    "sane-defaults" "macOS sane defaults" ON \
    3>&1 1>&2 2>&3) )

install_ansible() {
    brew install --quiet ansible > /dev/null 2>&1
    mkdir -p $HOME/.config/ansible && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/ansible ansible
    whiptail --title "Install completed" --msgbox "Ansible installed and configuration restored." 10 80
}

install_bat() {
    brew install --quiet bat > /dev/null 2>&1
    mkdir -p $HOME/.config/bat && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/bat bat
    whiptail --title "Install completed" --msgbox "Bat installed and configuration restored." 10 80
}

install_btop() {
    brew install --quiet btop > /dev/null 2>&1
    mkdir -p $HOME/.config/btop && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/btop btop
    whiptail --title "Install completed" --msgbox "Btop installed and configuration restored." 10 80
}

install_curl() {
    brew install --quiet curl > /dev/null 2>&1
    whiptail --title "Install completed" --msgbox "Curl installed and configuration restored." 10 80
}

install_dtop() {
    brew install --quiet --cask amir20/homebrew-dtop/dtop > /dev/null 2>&1
    mkdir -p $HOME/.config/dtop && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/dtop dtop
    whiptail --title "Install completed" --msgbox "Dtop installed and configuration restored." 10 80
}

install_duf() {
    brew install --quiet duf > /dev/null 2>&1
    mkdir -p $HOME/.config/duf && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/duf duf
    whiptail --title "Install completed" --msgbox "Duf installed and configuration restored." 10 80
}

install_fastfetch() {
    brew install --quiet fastfetch > /dev/null 2>&1
    mkdir -p $HOME/.config/fastfetch && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/fastfetch fastfetch
    whiptail --title "Install completed" --msgbox "Fastfetch installed and configuration restored." 10 80
}

install_ghostty() {
    mkdir -p $HOME/.config/ghostty && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/ghostty ghostty
    whiptail --title "Install completed" --msgbox "Ghostty installed and configuration restored." 10 80
}

install_git() {
    brew install --quiet git > /dev/null 2>&1
    mkdir -p $HOME/.config/git && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/git git
    whiptail --title "Install completed" --msgbox "Git installed and configuration restored." 10 80
}

install_homebrew() {
    mkdir -p $HOME/.config/homebrew && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/homebrew homebrew
    brew bundle  --quiet --file=$HOME/.config/homebrew/brewfile
    brew upgrade --quiet
    whiptail --title "Install completed" --msgbox "Homebrew installed and configuration restored." 10 80
}

install_htop() {
    brew install --quiet htop > /dev/null 2>&1
    mkdir -p $HOME/.config/htop && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/htop htop
    whiptail --title "Install completed" --msgbox "Htop installed and configuration restored." 10 80
}

install_less() {
    brew install --quiet less > /dev/null 2>&1
    stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config less --dotfiles
    whiptail --title "Install completed" --msgbox "Less installed and configuration restored." 10 80
}

install_nano() {
    brew install --quiet nano > /dev/null 2>&1
    mkdir -p $HOME/.config/nano && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/nano nano
    whiptail --title "Install completed" --msgbox "Nano installed and configuration restored." 10 80
}

install_podmantui() {
    brew install --quiet podman-tui > /dev/null 2>&1
    mkdir -p $HOME/.config/podman-tui && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/podman-tui podman-tui --no-folding
    whiptail --title "Install completed" --msgbox "Podman-tui installed and configuration restored." 10 80
}

install_rclone() {
    brew install --quiet rclone > /dev/null 2>&1
    mkdir -p $HOME/.config/rclone && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/rclone rclone --no-folding
    whiptail --title "Install completed" --msgbox "Rclone installed and configuration restored." 10 80
}

install_sane-defaults() {
    $HOME/Documents/Tech/Dotfiles/sane-defaults_macos.sh
    whiptail --title "Install completed" --msgbox "macOS sane defaults installed." 10 80
}

install_tmux() {
    brew install --quiet tmux > /dev/null 2>&1
    mkdir -p $HOME/.config/tmux && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/tmux tmux --no-folding
    git clone --quiet https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm > /dev/null 2>&1
    whiptail --title "Install completed" --msgbox "TMUX installed and configuration restored." 10 80
}

install_vim() {
    brew install --quiet vim > /dev/null 2>&1
    mkdir -p $HOME/.config/vim && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/vim vim --no-folding
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
    brew install --quiet wget > /dev/null 2>&1
    mkdir -p $HOME/.config/wget && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/wget wget --no-folding
    whiptail --title "Install completed" --msgbox "Wget installed and configuration restored." 10 80
}

install_zsh() {
    brew install --quiet zsh > /dev/null 2>&1
    mkdir -p $HOME/.config/zsh && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/zsh zsh --no-folding
    stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config dir_colors --dotfiles
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions.git      $HOME/.config/zsh/plugins/zsh-autosuggestions > /dev/null 2>&1
    git clone --quiet https://github.com/zsh-users/zsh-completions.git          $HOME/.config/zsh/plugins/zsh-completions > /dev/null 2>&1
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git  $HOME/.config/zsh/plugins/zsh-syntax-highlighting > /dev/null 2>&1
    ln -s .config/zsh/.zshenv ~/.zshenv > /dev/null 2>&1
    touch $HOME/.hushlogin
    whiptail --title "Install completed" --msgbox "ZSH installed and configuration restored." 10 80
}

install_starship() {
    brew install --quiet starship > /dev/null 2>&1
    mkdir -p $HOME/.config/starship && stow --dir=$HOME/Documents/Tech/Dotfiles --target=$HOME/.config/starship starship --no-folding
    whiptail --title "Install completed" --msgbox "Starship installed and configuration restored." 10 80
}

for choice in "${CHOICES[@]}"; do
    case $choice in
        ansible)        install_ansible ;;
        bat)            install_bat ;;
        btop)           install_btop ;;
        curl)           install_curl ;;
        dtop)           install_dtop ;;
        duf)            install_duf ;;
        fastfetch)      install_fastfetch ;;
        ghostty)        install_ghostty ;;
        git)            install_git ;;
        homebrew)       install_homebrew ;;
        htop)           install_htop ;;
        less)           install_less ;;
        nano)           install_nano ;;
        podman-tui)     install_podmantui ;;
        rclone)         install_rclone ;;
        sane-defaults)  install_sane-defaults ;;
        tmux)           install_tmux ;;
        vim)            install_vim ;;
        wget)           install_wget ;;
        zsh)            install_zsh ;;
        starship)       install_starship ;;
        *)              exit ;;
    esac
done
