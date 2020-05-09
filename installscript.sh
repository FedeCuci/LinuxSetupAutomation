#!/bin/bash

# https://askubuntu.com/questions/744310/bash-download-latest-version-of-program-from-website-via-terminal

# Add custom dependencies
sudo add-apt-repository ppa:bashtop-monitor/bashtop

printf "Updating repos and upgrading the system...\n"
sleep 2
sudo apt-get update && sudo apt-get upgrade -y;
sudo apt-get dist-upgrade -y;


# Remove vim
printf "Removing vim..."
sleep 2
sudo apt remove vim;

# Install all preferred programs

printf "Installing apt packages...\n"
sleep 2
apt_packages=(gnome-tweaks hashcat gparted nmap tor git neovim python3-pip tmux ripgrep dconf-editor mlocate gobuster qbittorrent mpv virtualenv timeshift vifm kazam doas feh gnome-boxes gimp steam wireguard openvpn golang-go bashtop apache2 zsh gnome-shell-extensions);

for i in "${apt_packages[@]}"
do
        sudo apt install $i -y
done

# Snap packages

printf "Installing snap packages..."
sleep 2
snap_packages=(discord bitwarden authy cointop);

for i in "${snap_packages[@]}"
do
	sudo snap install $i -y
done

# Install zshell
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Vim-Plug installation
printf "Downloading Vim-Plug..."
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';


# Creat SSH key pair using the ed25519 protocol

printf "Creating ssh key..."
sleep 2
ssh_keygen -t ed25519 -C "fede.cuci@mailbox.org"

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

# Setup git configuration variables
git config --global user.email "fede.cuci@mailbox.org"
git config --global user.name "Federico Cucinotta"

# Run the functions above.
mega;
mullvad;
ulauncher;


