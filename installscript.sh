#!/usr/bin/bash

# https://askubuntu.com/questions/744310/bash-download-latest-version-of-program-from-website-via-terminal

sudo apt-get update && sudo apt-get upgrade -y;

# Install all preferred programs

apt_packages=(gnome-tweaks hashcat gparted nmap tor git neovim python3-pip zim tmux ripgrep dconf-editor mlocate gobuster deluge vlc virtualenv timeshift);

sudo apt install $apt_packages; -y &

# Snap packages

snap_packages=(discord bitwarden authy);

sudo snap install $snap_packages; -y &

# MEGA
function mega() {
    wget https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb;
    sudo dpkg -i megasync-xUbuntu_20.04_amd64.deb;
    rm megasync-xUbuntu_20.04_amd64.deb;
}

function mullvad () {
# Mullvad VPN
    mullvad_version=`curl "https://mullvad.net/en/download/" | rg "Latest release" | uniq | cut -b 24-29`;
    wget "https://github.com/mullvad/mullvadvpn-app/releases/download/${mullvad_version}/MullvadVPN-${mullvad_version}_amd64.deb";
    sudo dpkg -i "MullvadVPN-${mullvad_version}_amd64.deb";
    rm "MullvadVPN-${mullvad_version}_amd64.deb";
}

# Ulauncher
function ulauncher () {
    ulauncher_version=`curl https://github.com/Ulauncher/Ulauncher/tags | rg "/Ulauncher/Ulauncher/releases/tag/" | head -n 1 | cut -b 50-54`;
    wget "https://github.com/Ulauncher/Ulauncher/releases/download/${ulauncher_version}/ulauncher_${ulauncher_version}_all.deb";
    sudo dpkg -i "ulauncher_${ulauncher_version}_all.deb";
    rm "ulauncher_${ulauncher_version}_all.deb";
}

mega & mullvad & ulauncher

