#!/bin/bash

masking_mode() {
    function mask_mode() {
        while true; do
            read -p "Tambahkan create mask? " create_mask
        case $create_mask in
        [yY]) return 0 ;;
        [nN]) return 1 ;;
        *) echo -e "Invalid"
    
        esac
    done
    }

    if mask_mode -eq [yY]; then
        read -p "Kamu Jawa? " var_create_mask
        echo -e "$var_create_mask"
        exit
    elif mask_mode -eq [nN]; then
        echo -e "Kamu bukan Jawa"
        exit
    else
        echo -e "Invalid Jawa"
    fi
}

masking_mode

masking_mode