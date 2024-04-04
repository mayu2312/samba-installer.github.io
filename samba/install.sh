#!/bin/bash

#Install the fckin Samba first or just fckin update the package
apt update && apt install -y samba
echo -e "Samba has been installed"

#Don't you fckin forget to install the fckin VFS Modules for Samba
apt install samba-vfs-modules -y
ehco -e "VFS Modules has been installed"

#Backup Samba configuration first, if you don't. You're gonna be fcked up
cp /etc/samba/smb.conf /etc/samba/smb.bak
echo -e "You know where it is right?"

#Create your folder name and directory
read -p "Choose your main folder to create the Samba Folder: " dir_folder
mkdir 