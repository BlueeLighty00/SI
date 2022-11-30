#Creación de usuarios de forma masiva.
#Ayuda: https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1

$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -FullName $user.Fullname -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
  #Indicamos que la primera vez que logueamos nos pida un cambio de contraseña
  Set-LocalUser $user.cuenta -PasswordNeverExpires $false
  net user $user.cuenta /logonpasswordchg:yes
  #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
  Add-LocalGroupMember -Group $user.grupo -Member $user.cuenta
  Add-LocalGroupMember -Group usuarios -Member $user.cuenta
}
