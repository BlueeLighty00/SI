#/bin/bash

DATE=$(date '+%Y%m%d')
hora=$(date '+%H')
min=$(date '+%M')

DIR_DESTINO="/mnt/nas/AEMET/webcams/penyiscola/$(date +'%-m')/$(date +'%d')"

wget -P "${DIR_DESTINO}" "https://s29.ipcamlive.com/streams/1drmua891bw7ontxj/snapshot.jpg"
mv "${DIR_DESTINO}/snapshot.jpg" "${DIR_DESTINO}/penyiscola_${hora}${min}.jpg"
