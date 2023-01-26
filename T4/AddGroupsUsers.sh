#!/bin/bash

#Creación de grupos
groupadd sinformacion
groupadd desarrollo
groupadd explotacion
groupadd proyectos_r
groupadd proyectos_w
groupadd proyectos_x
groupadd pruebas_r
groupadd pruebas_w
groupadd pruebas_x
groupadd src_r
groupadd src_w
groupadd src_x


#Creación de usuarios
useradd -m -d /home/usu_sinformacion -G sinformacion -p sinformacion -s /bin/bash usu_sin>
useradd -m -d /home/usu_desarrollo -G desarrollo -p desarrollo -s /bin/bash usu_desarrollo
useradd -m -d /home/usu_explotacion -G explotacion -p explotacion -s /bin/bash usu_explot>


