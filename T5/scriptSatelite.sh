#!/bin/bash

# Obtener fecha con formato "YYYYMMDD"
DATE=$(date '+%Y%m%d')
hora=$(date -u '+%H')
horaesp=$(date '+%H')

# Establecer directorio de destino /mnt/nas
DIR_DESTINO="/home/dserna/Desktop"


wget -P "${DIR_DESTINO}" "https://www.aemet.es/imagenes_d/eltiempo/observacion/satelite/${DATE}${hora}00_s93>
mv "${DIR_DESTINO}/${DATE}${hora}00_s93g.gif" "${DIR_DESTINO}/meteosat_${horaesp}.gif"
