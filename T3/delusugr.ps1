#Eliminación de usuarios

$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) {
    Remove-LocalUser $user.cuenta
}
