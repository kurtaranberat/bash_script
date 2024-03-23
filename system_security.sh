#!/bin/bash

gonderen="barrowkortis@gmail.com"
alici="barrowkortis@gmail.com"
konu="Sistem Güvenlik Denetimi Bildirimi"
mesaj="Sistemde güvenlikle ilgili bir olay tespit edildi."

denetle() {
    hatali_giris_sayisi=$(grep "Failed password" /var/log/auth.log | wc -l)
    if [ "$hatali_giris_sayisi" -gt 0 ]; then
        echo "Başarısız oturum açma girişimleri tespit edildi: $hatali_giris_sayisi"
        eposta_gonder
    fi
}

eposta_gonder() {
    echo "$mesaj" | mail -s "$konu" -r "$gonderen" "$alici"
    echo "E-posta bildirimi gönderildi."
}

denetle