#Eliminación de usuarios

$file_users=Import-Csv -Path C:\Users\dserna\Desktop\usuarios.csv 
foreach ($user in $file_users) {
    Remove-LocalUser $user.cuenta
}

$file_groups=Import-Csv -Path C:\Users\dserna\Desktop\grupos.csv

foreach ($group in $file_groups) { 
  Remove-LocalGroup $group.nombre
}
