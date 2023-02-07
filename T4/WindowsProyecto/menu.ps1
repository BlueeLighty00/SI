function fntFuncion1
{
  $file_groups=Import-Csv -Path CSV\grupos.csv -Delimiter ';'
  foreach ($group in $file_groups) { 
    New-LocalGroup -Name $group.nombre -Description $group.description
  }

  $file_users=Import-Csv -Path CSV\usuarios.csv -Delimiter ';'
  foreach ($user in $file_users) { 
    $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
    New-LocalUser $user.cuenta -Password $clave -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
    #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
    Add-LocalGroupMember -Group $user.grupo -Member $user.cuenta
    Add-LocalGroupMember -Group usuarios -Member $user.cuenta
  }
}

function fntFuncion2
{
  Write-Host "F2"
}

#----------------Funcion Submenu  -------------#
function mostrar_Submenu
{
     param (
           [string]$Titulo = 'Submenu.....'
     )
     Clear-Host 
     Write-Host "================ $Titulo ================"
    
     Write-Host "1: Opción 1."
     Write-Host "2: Opción 2."
     Write-Host "s: Volver al menu principal."
do
{
     $input = Read-Host "Por favor, pulse una opcion"
     switch ($input)
     {
           '1' {
                'Opcion 1'
                return
           } '2' {
                'Opcion 2'
                return
           } 
     }
}
until ($input -eq 'q')
}


#Función que nos muestra un menú por pantalla con 3 opciones, donde una de ellas es para acceder
# a un submenú) y una última para salir del mismo.

function mostrarMenu 
{ 
     param ( 
           [string]$Titulo = 'Usuarios Locales - Gestor Documental' 
     ) 
     Clear-Host 
     Write-Host "                 Bienvenid@ " $env:USERNAME
     
     Write-Host "================ $Titulo================" 
      
     
     Write-Host "1. Creación de usuarios y de grupos" 
     Write-Host "2. Creación de estructura de datos" 
     Write-Host "3. Establecer permisos"
     Write-Host "4. Extra"
     Write-Host "s. Presiona 's' para salir" 
}
do 
{ 
     mostrarMenu 
     $input = Read-Host "Elegir una Opción" 
     switch ($input) 
     { 
           '1' { 
                Clear-Host  
                fntFuncion1 
                pause
           } '2' { 
                Clear-Host  
                fntFuncion2 
                pause
           } '3' {  
                mostrar_Submenu      
           } 's' {
                'Saliendo del script...'
                return 
           }  
     } 
     pause 
} 
until ($input -eq 's')
