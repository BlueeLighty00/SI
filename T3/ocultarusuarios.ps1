$file_Users = Import-Csv -Path ocultarusuarios.csv
foreach($user in $file_users)
{
  REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.cuenta /T REG_DWORD /D 0
}
