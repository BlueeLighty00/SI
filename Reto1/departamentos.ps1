# Creación de grupos de forma masiva.
$file_groups=Import-Csv -Path departamentos.csv 
foreach ($group in $file_groups) { 
  New-LocalGroup -Name $group.nombre -Description $group.Descripcion
}
