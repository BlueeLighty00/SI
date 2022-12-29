#!/bin/bash

while IFS=,
read -r cuenta password Fullname descripcion grupo

do

userdel -r $cuenta

done< <(tail -n +2 usuarios.csv)

while IFS=,
read -r nombre descripcion

do

groupdel $nombre

done < <(tail -n +2 grupos.csv)
