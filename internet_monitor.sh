#!/bin/bash

gonderen="barrowkortis@gmail.com"
alici="barrowkortis@gmail.com"
konu="İnternet Bağlantı Takip Aracı"
offline_mesaj="İnternet bağlantısı kesildi."
online_mesaj="İnternet bağlantısı yeniden sağlandı."


kontrol_et() {
    if ping -q -c 1 -W 1 google.com >/dev/null; then
        echo "İnternet bağlantısı mevcut."
        durum="online"
    else
        echo "İnternet bağlantısı kesildi."
        durum="offline"
    fi
}

eposta_gonder() {
    if [ "$1" == "offline" ]; then
        echo "$offline_mesaj" | mail -s "$konu" -r "$gonderen" "$alici"
    elif [ "$1" == "online" ]; then
        echo "$online_mesaj" | mail -s "$konu" -r "$gonderen" "$alici"
    fi
}

while true; do
    kontrol_et
    if [ "$durum" == "offline" ]; then
        eposta_gonder offline
        while true; do
            sleep 10
            kontrol_et
            if [ "$durum" == "online" ]; then
                eposta_gonder online
                break
            fi
        done
    fi
    sleep 60
done