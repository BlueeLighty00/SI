function crearUsuariosGrupos
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

    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.cuenta /T REG_DWORD /D 0

    net user $user.cuenta /times:"$($user.dias),$($user.horainicial)-$($user.horafinal)"
  }

  Add-LocalGroupMember -Group administradores -Member piti
  
  Add-LocalGroupMember -Group 1eso_f -Member jony
  Add-LocalGroupMember -Group 2eso_f -Member iker
  Add-LocalGroupMember -Group 3eso_f -Member oscar
  Add-LocalGroupMember -Group 4eso_f -Member isaac
  Add-LocalGroupMember -Group 1bach_f -Member fede
  Add-LocalGroupMember -Group 2bach_f -Member alberto
  Add-LocalGroupMember -Group 1dam_f -Member piti

  Add-LocalGroupMember -Group 1eso_r -Member iker,oscar,isaac
  Add-LocalGroupMember -Group 2eso_r -Member jony,oscar,isaac
  Add-LocalGroupMember -Group 3eso_r -Member jony,iker,isaac
  Add-LocalGroupMember -Group 4eso_r -Member jony,iker,oscar

  Add-LocalGroupMember -Group 1bach_r -Member alberto
  Add-LocalGroupMember -Group 2bach_r -Member fede


}

function crearEstructura
{
    
    "E:\Publico" | %{New-Item -Path "$_" -ItemType "Directory"} 
    
    icacls E:\Publico /inheritance:d /T
    icacls E:\Publico /remove:g Usuarios /T
    icacls E:\Publico /remove:g "Usuarios autentificados" /T
    
    "E:\Publico\1ESO", "E:\Publico\2ESO", "E:\Publico\3ESO", "E:\Publico\4ESO", "E:\Publico\1BACH", "E:\Publico\2BACH", "E:\Publico\1DAM" | %{New-Item -Path "$_" -ItemType "Directory"}

}

function darPermisos
{
    'icacls E:\Publico /GRANT 1eso:(R)' | cmd
    'icacls E:\Publico /GRANT 2eso:(R)' | cmd
    'icacls E:\Publico /GRANT 3eso:(R)' | cmd
    'icacls E:\Publico /GRANT 4eso:(R)' | cmd
    'icacls E:\Publico /GRANT 1bach:(R)' | cmd
    'icacls E:\Publico /GRANT 2bach:(R)' | cmd
    'icacls E:\Publico /GRANT 1dam:(R)' | cmd

    'icacls E:\Publico\1ESO /GRANT 1eso_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\1ESO /GRANT 1eso_r:(OI)(CI)(R) /T' | cmd
    'icacls E:\Publico\2ESO /GRANT 2eso_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\2ESO /GRANT 2eso_r:(OI)(CI)(R) /T' | cmd
    'icacls E:\Publico\3ESO /GRANT 3eso_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\3ESO /GRANT 3eso_r:(OI)(CI)(R) /T' | cmd
    'icacls E:\Publico\4ESO /GRANT 4eso_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\4ESO /GRANT 4eso_r:(OI)(CI)(R) /T' | cmd

    'icacls E:\Publico\1BACH /GRANT 1bach_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\1BACH /GRANT 1bach_r:(OI)(CI)(R) /T' | cmd
    'icacls E:\Publico\2BACH /GRANT 2bach_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\2BACH /GRANT 2bach_r:(OI)(CI)(R) /T' | cmd

    'icacls E:\Publico\1DAM /GRANT 1dam_f:(OI)(CI)(F) /T' | cmd
    'icacls E:\Publico\1DAM /GRANT 1dam_r:(OI)(CI)(R) /T' | cmd
}

function borrarGestor
{
  $file_users=Import-Csv -Path CSV\usuarios.csv -Delimiter ';'
  foreach ($user in $file_users) {
    Remove-LocalUser $user.cuenta

    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.cuenta /f
  }
    
  $file_groups=Import-Csv -Path CSV\grupos.csv -Delimiter ';'
  foreach ($group in $file_groups) { 
    Remove-LocalGroup -Name $group.nombre
  }

  Remove-Item -Path E:\Publico -Recurse
}

#Función que nos muestra un menú por pantalla con 3 opciones y una última para salir del mismo.

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
     Write-Host "4. Borrar Gestor Documental"
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
                crearUsuariosGrupos
                pause
           } '2' { 
                Clear-Host  
                crearEstructura 
                pause
           } '3' {
                Clear-Host
                darPermisos
                pause
           } '4' {  
                Clear-Host
                borrarGestor
                pause 
           } 's' {
                'Saliendo del script...'
                return 
           }  
     } 
     pause 
} 
until ($input -eq 's')
