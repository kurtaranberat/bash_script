#!/bin/bash

topla_bilgiler() {
    echo "Sistem bilgileri toplanıyor..."
    cpu_kullanim=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    bellek_kullanim=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    disk_kullanim=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    network_trafik=$(ifstat | grep eth0 | awk '{print $6}')
}

bilgileri_goster() {
    clear
    echo "Sistem İzleme Aracı"
    echo "---------------------"
    echo "CPU Kullanımı: $cpu_kullanim%"
    echo "Bellek Kullanımı: $bellek_kullanim%"
    echo "Disk Kullanımı: $disk_kullanim%"
    echo "Ağ Trafik: $network_trafik"
}

while true; do
    topla_bilgiler
    bilgileri_goster
    sleep 5
done
