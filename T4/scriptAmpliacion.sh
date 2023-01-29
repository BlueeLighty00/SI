#!/bin/bash

groupadd dinterfaces

useradd -m -d /home/usu_dinterfaces -G dinterfaces -s /bin/bash usu_dinterfaces

usermod -a -G proyectos_x,src_r,pruebas_r  usu_dinterfaces

passwd usu_dinterfaces
