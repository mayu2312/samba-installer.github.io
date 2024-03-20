#!/bin/bash

source ./makesure.sh    #Validasi Fungsi dari file makesure.sh

sudo apt update

sudo apt install -y samba #Installing Samba Service
echo -e "Samba service berhasil diinstall!!"

read -p "Tentukan nama folder yang ingin dishare " shared_folder
echo -e "[$shared_folder]" > /etc/samba/smb.conf

browsable() {
    function validate_browse_samba() {
        while true; do
        read -p "Apakah client bisa browsing folder? (y/n): " browse_samba

        case $browse_samba in
        [yY])
            echo -e "browsable = yes" > /etc/samba/smb.conf
            exit ;;
        [nN])
            echo -e "Tidak dilakukan perubahan apapun..."
            exit ;;
        *) echo -e "Invalid Option...Ketikkan yes atau no"

        esac
    done
    }
    if validate_browse_samba -eq [yY]; then
        break
    fi
}

browsable

browsable

r_only() {
    function validate_read_samba() {
    while true; do
        read -p "Apakah client hanya bisa melihat folder? (y/n) " read_samba

        case $read_samba in
        [yY])
            echo -e "read only = yes" > /etc/samba/smb.conf
            exit ;;
        [nN])
            echo -e "read only = no" > /etc/samba/smb.conf
            exit ;;
        *) echo -e "Invalid option... Ketikkan yes atau no"

        esac
    done
    }
    if validate_read_samba -eq [nN]; then
        break
    fi
}

r_only
r_only

inherit() {
    function validate_inherit_samba() {
        while true; do
            read -p "Apakah inherit permission dinyalakan? (y/n) " inherit_samba
        case $inherit_samba in
        [yY])
            echo -e "inherit permission = yes" > /etc/samba/smb.conf
            exit ;;
        [nN])
            echo -e "Tidak dilakukan perubahan apapun..."
            exit ;;
        *) echo -e "Invalid option... Ketikkan yes atau no"

        esac
    done
    }
    if validate_inherit_samba -eq [yY]; then
        break
    fi
}

inherit
inherit

cmask(){
    function validate_cmask() {
        while true; do
            read -p "Tambahkan create mask? (y/n) " create_mask
        case $create_mask in
        [yY])
            read -p "Masukkan mask file samba(ex: 0774) " var_create_mask ;;
        [nN])
            echo -e "Tidak dilakukan perubahan apapun..."
            exit ;;
        *) echo -e "Invalid option... Ketikkan yes atau no"

        esac
    done
    }
    if create_mask -eq [yY]; then
        echo -e "create mask = $var_create_mask" > /etc/samba/smb.conf
        exit ;;
    fi
}

cmask
cmask

read -p "Tambahkan directory mask? (y/n) " directory_mask
validate_directory_mask "$directory_mask"