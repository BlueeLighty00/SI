#Establecer política de contraseñas con comandos NET
#Eemplo: Longitud mínima 8, tiempo de cambio de contraseña entre 2 y 60 días, bloqueo de cuenta con 3 intentos erróneos.

#Bloqueo de cuentas 
#Se configura para que se bloquee si se falla al intento 3.
net accounts /lockoutthreshold:3
#Duración del bloqueo 90 minutos
net accounts /lockoutduration:90
#Ventana de bloqueo (tiempo en minutos antes de que se restablezca el contador de intentos fallidos de contraseña )
net accounts /lockoutwindow:90

#Establecer los dias máximos para cambiar el password, ejempo 60 días.
net accounts /maxpwage:60
#Establecer los dias mínimos para cambiar el password, ejempo 2 días.
net accounts /minpwage:2
#Establecer la longitud mínima del password, ejemplo: 8
net accounts /minpwlen:8


#Para consultar la configuración de los parámetros establecidos
net accounts 
