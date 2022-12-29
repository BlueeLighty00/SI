#!/bin/bash

while IFS=,
read -r nombre Descripcion
do

groupadd $nombre

done< <(tail -n +2 grupos.csv)
