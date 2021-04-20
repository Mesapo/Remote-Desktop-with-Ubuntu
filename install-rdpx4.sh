#!/bin/bash
##
## Instalacja GUI XFCE4 dla UBUNTU/DEBIAN
##
echo "## Update system..."
sudo apt -qq update -y
echo "## Installing the graphical interface..."
sudo apt -qq install xubuntu-core^ -y
echo "## Installation of additional programs..."
sudo apt -qq install xrdp xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils python3 python3-pip zip git ffmpeg thunar-archive-plugin firefox -y
echo "## finishing the settings..."
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
sudo ufw allow 3389/tcp
sudo /etc/init.d/xrdp restart


echo "## do you want to install google chrome? (firefox has already been installed)..."
read -p "Select the option [y/n]: " answer
case $answer in
        s)
    echo "## installing..."
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install ./google-chrome-stable_current_amd64.deb -y
        sudo apt -f install -y
        sudo rm -rf google-chrome-stable_current_amd64.deb
        echo "## "
        echo "## to use google chrome, you will need to create a new user on the system (google chrome does not open in root user)"
        echo "## "
        ;;
        n)
        echo "ok"
        ;;
        done


echo "## ## finalized"
echo "## want to restart the system?"
read -p "Select the option [y/n]: " answer
case $answer in
        s)
    echo "## restarting..."
        sudo reboot
        ;;
        n)
    echo "## ok. gl&hf"
    exit;;
done
