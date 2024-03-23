#!/bin/bash

anahtar="myencryptionkey"

dosya_sifrele() {
    dosya="$1"
    openssl enc -aes-256-cbc -salt -in "$dosya" -out "$dosya.enc" -pass pass:"$anahtar"
    echo "Dosya şifrelendi: $dosya.enc"
}

dosya_coz() {
    dosya="$1"
    openssl enc -d -aes-256-cbc -in "$dosya" -out "${dosya%.enc}" -pass pass:"$anahtar"
    echo "Dosya çözüldü: ${dosya%.enc}"
}

echo "Dosya Şifreleme ve Şifre Çözme Aracı"
echo "1. Dosya Şifrele"
echo "2. Şifreli Dosya Çöz"
read -p "Seçiminizi yapın: " secim

case $secim in
    1) read -p "Şifrelenecek dosyanın adını ve yolunu girin: " dosya
       dosya_sifrele "$dosya";;
    2) read -p "Şifresi çözülecek dosyanın adını ve yolunu girin: " dosya
       dosya_coz "$dosya";;
    *) echo "Geçersiz seçim. Lütfen tekrar deneyin.";;
esac
