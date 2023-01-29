#!/bin/bash

groupadd dinterfaces

useradd -m -d /home/usu_dinterfaces -G dinterfaces -s /bin/bash usu_dinterfaces

usermod -a -G proyectos_x,src_r,src_x,pruebas_r,pruebas_x usu_dinterfaces

passwd usu_dinterfaces
