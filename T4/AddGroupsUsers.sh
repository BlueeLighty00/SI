#!/bin/bash

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



useradd -m -d /home/usu_sinformacion -G sinformacion -s /bin/bash usu_sinformacion
useradd -m -d /home/usu_desarrollo -G desarrollo -s /bin/bash usu_desarrollo
useradd -m -d /home/usu_explotacion -G explotacion -s /bin/bash usu_explotacion

passwd usu_sinformacion
passwd usu_desarrollo
passwd usu_explotacion
