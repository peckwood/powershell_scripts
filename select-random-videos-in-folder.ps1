$Files = Get-ChildItem -Path J:\videos\* -Recurse
$Sample = $Files | Get-Random -Count 5
echo $Sample