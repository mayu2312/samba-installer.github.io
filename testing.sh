#!/bin/bash

service --status-all > data.csv

variable_options() {
    display_options() {
    echo -e "1. Changing Variable on the File"
    echo -e "2. Exit"
}

    # -- | -- | --

    function confirm() {
    while true; do
        display_options #Displaying the options
        read -p "What do you want for me to do? " question

        case $question in
    #    [1]* ) return 0 ;;
    #    [2]* ) exit ;;
    #    * ) echo -e "Dimohon untuk mengisi kolom di atas"

        1) return 0 ;;
        2) echo "Exiting..."
            exit ;;

        *) echo -e "\e[31m\nDimohon untuk mengisi kolom di atas\n\e[0m"

        esac
    done
}
    sauce="data.csv"

    if confirm -eq 1; then
        read -p 'Which one you want to delete: ' search_var
        read -p 'Please input the new text: ' replace_var
        sed -i "s/$search_var/$replace_var/g" "$sauce"
        sed -i 's/\[\([^]]*\)\]/\1/g' "$sauce"
        cat data.csv
    fi
}

variable_options

variable_options

# -- | -- | --

