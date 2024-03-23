#!/bin/bash

izlenen_dizin="/home/berat/orj"

dosya_eklendi_eylem() {
    echo "Yeni bir dosya eklendi: $1"
}

dosya_silindi_eylem() {
    echo "Bir dosya silindi: $1"
}

while true; do
    for dosya in "$izlenen_dizin"/*; do
        if [ -f "$dosya" ]; then
            if [ ! -e "$dosya.previous" ]; then
                dosya_eklendi_eylem "$dosya"
                mv "$dosya" "$dosya.previous"
            fi
        elif [ -e "$dosya.previous" ]; then
            dosya_silindi_eylem "$dosya"
            rm "$dosya.previous"
        fi
    done
    sleep 5
done