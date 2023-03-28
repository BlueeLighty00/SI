#/bin/bash

DATE=$(date '+%Y%m%d')
hora=$(date -u '+%H')
min=$(date -u '+%M')

DIR_DESTINO="/mnt/nas/AEMET/meteosat/$(date +"%Y")/$(date +"%-m")/$(date +"%d")"

wget -P "${DIR_DESTINO}" "https://s29.ipcamlive.com/streams/1drmua891bw7ontxj/snapshot.jpg"
mv "${DIR_DESTINO}/snapshot.jpg" "${DIR_DESTINO}/penyiscola_${hora}${min}.jpg"
