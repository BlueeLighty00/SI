#!/bin/bash

mkdir proyectos

setfacl -m d:g:sinformacion:rwx ./proyectos
setfacl -m g:sinformacion:rwx ./proyectos
setfacl -m d:other:0 ./proyectos
setfacl -m other:0 ./proyectos

mkdir -p ./proyectos/{pruebas,src}

setfacl -m g:proyectos_r:r ./proyectos
setfacl -m g:proyectos_w:w ./proyectos
setfacl -m g:proyectos_x:x ./proyectos

setfacl -m g:pruebas_r:r ./proyectos/pruebas
setfacl -m g:pruebas_w:w ./proyectos/pruebas
setfacl -m g:pruebas_x:x ./proyectos/pruebas

setfacl -m d:g:src_r:r ./proyectos/src
setfacl -m d:g:src_w:w ./proyectos/src
setfacl -m d:g:src_x:x ./proyectos/src
setfacl -m g:src_r:r ./proyectos/src
setfacl -m g:src_w:w ./proyectos/src
setfacl -m g:src_x:x ./proyectos/src
