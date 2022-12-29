#!/bin/bash

while IFS=,
read -r cuenta password Fullname descripcion grupo
do

useradd -m -d "/home/${cuenta}" -G $grupo -c $descripcion -p $password -s "/bin/bash" $cuenta

chage -d0 $cuenta

done< <(tail -n +2 usuarios.csv)
