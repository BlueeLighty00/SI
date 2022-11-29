# Creación de grupos de forma masiva.
# Ayuda: https://learn.microsoft.com/es-es/powershell/module/microsoft.powershell.localaccounts/new-localgroup?view=powershell-5.1
$file_groups=Import-Csv -Path grupos.csv 
foreach ($group in $file_groups) { 
  New-LocalGroup -Name $group.nombre -Description $group.Descripcion
}
