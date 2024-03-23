#!/bin/bash

kaynak_dizin="/home/berat/orj"
hedef_dizin="/home/berat/yedek"


yedekle() {
    echo "Dosyalar yedekleniyor..."
    cp -r "$kaynak_dizin"/* "$hedef_dizin"
    echo "Yedekleme tamamlandı."
}


temizle() {
    echo "Eski yedekler temizleniyor..."
    find "$hedef_dizin"/* -type d -mtime +7 -exec rm -rf {} \;
    echo "Eski yedekler temizlendi."
}

while true; do
    echo ""
    echo "Dosya Yedekleme ve Temizleme Aracı"
    echo "1. Dosyaları Yedekle"
    echo "2. Eski Yedekleri Temizle"
    echo "3. Çıkış"
    read -p "Seçiminizi yapın: " secim

    case $secim in
        1) yedekle;;
        2) temizle;;
        3) echo "Programdan çıkılıyor."
           exit;;
        *) echo "Geçersiz seçim. Lütfen tekrar deneyin.";;
    esac
done