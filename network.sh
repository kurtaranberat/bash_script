#!/bin/bash

izleme_süresi=60

rapor_olustur() {
    echo "Ağ İzleme ve Raporlama Aracı"
    echo "İzleme süresi: $izleme_suresi saniye"

   
    ping -c 5 google.com >/dev/null
    if [ $? -eq 0 ]; then
        echo "Google'a ping atıldı: Başarılı"
    else
        echo "Google'a ping atıldı: Başarısız"
    fi

    
    echo "Bağlı Cihazlar:"
    arp -a

    echo "Ağ Trafiği İstatistikleri:"
    ifstat -t -T $izleme_suresi

    # Ek raporlama işlemleri buraya eklenebilir
}


anormallik_kontrol() {
     echo "Anormallik kontrolü tamamlandı."
}


rapor_olustur


anormallik_kontrol
