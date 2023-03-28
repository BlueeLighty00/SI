#!/bin/bash

# Obtener fecha con formato "YYYYMMDD"
DATE=$(date '+%Y%m%d')
hora=$(date -u '+%H')
horaesp=$(date '+%H')

# Establecer directorio de destino /mnt/nas
DIR_DESTINO="/mnt/nas/meteosat/$(date +"%-m")/$(date +"%-d")"


wget -P "${DIR_DESTINO}" "https://www.aemet.es/imagenes_d/eltiempo/observacion/satelite/${DATE}${hora}00_s93g.gif"
