#!/bin/bash

#File Validasi untuk semua perintah

validate_browse_samba() {        #Validasi browseable folder
    browse_samba=$1
    if [[ "$browse_samba" == "yes" || "$browse_samba" == "y" ]]; then
        echo -e "browsable = yes" > /etc/samba/smb.conf
    elif [[ "$browse_samba" == "no" || "$browse_samba" == "n" ]]; then
        echo -e "browsable = no" > /etc/samba/smb.conf
    else 
        echo "Invalid Input... Tolong mengisi kolom dengan yes atau no"
    fi
}

validate_read_samba() {
    $read_samba="$1"
    if [[ "$read_samba" == "yes" || "$read_samba" == "y" ]]; then
        echo -e "read-only = yes" > /etc/samba/smb.conf
    elif [[ "$read_samba" == "no" || "$read_samba" == "n" ]]; then
        echo -e "read-only = no" > /etc/samba/smb.conf
    else
        echo "Invalid Input... Tolong mengisi kolom dengan yes atau no"
    fi
}

validate_inherit_samba() {
    $inherit_samba="$1"
    if [[ "$inherit_samba" == "yes" || "$inherit_samba" == "y" ]]; then
        echo -e "inherit permisison = yes" > /etc/samba/smb.conf
    elif [[ "$inherit_samba" == "no" || "$inherit_samba" == "n" ]]; then
        echo -e "inherit permisison = no" > /etc/samba/smb.conf
    else
        echo "Invalid Input... Tolong mengisi kolom dengan yes atau no"
    fi
}

validate_create_mode() {
    $create_mode_confirm="$1"
    if [[ "$create_mode_confirm" == "yes" || "$create_mode_confirm" == "y" ]]; then
        read -p "Masukkan mode file samba(ex: 0774) " create_mode
        echo -e "create mode = $create_mode" > /etc/samba/smb.conf
        echo -e "Create Mode sudah ditambahkan dengan nilai $create_mode"
    elif [[ "$create_mode_confirm" == "no" || "$create_mode_confirm" == "n" ]]; then
        echo -e "Create Mode tidak ditambahkan"
    else
        echo "Invalid Input... Tolong mengisi kolom dengan yes atau no"
    fi
}

validate_directory_mode() {
    $directory_mode_confirm="$1"
    if [[ "$directory_mode_confirm" == "yes" || "$directory_mode_confirm" == "y" ]]; then
        read -p "Masukkan mode directory samba " directory_mode
        echo -e "directory mode = $directory_mode" > /etc/samba/smb.conf
        echo -e "Directory Mode sudah ditambahkan dengan nilai $directory_mode"
    elif [[ "$directory_mode_confirm" == "no" || "$directory_mode_confirm" == "n" ]]; then
        echo -e "Create Mode tidak ditambahkan"
    else
        echo "Invalid Input... Tolong mengisi kolom dengan yes atau no"
}