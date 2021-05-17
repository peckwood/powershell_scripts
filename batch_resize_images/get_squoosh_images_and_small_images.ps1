clear
$squooshImageList = Get-ChildItem "J:\photos\*_squoosh.jp*g" -Recurse 

filter Check-Not-In-Squoosh-List-Filter {
	if($_.basename -like '*_squoosh.jp*g'){
		$_
	}else{
		# if it doesn't have a '_squoosh.jpg' image, return image
		$nameWithSquoosh = $_.basename+'_squoosh'
		$notMatch = 1

	 	foreach ($squooshImage in $squooshImageList){
	 		$squooshStrBaseName = $squooshImage.BaseName
	 		if($_.basename -eq 'IMG_1221'){
				Write-Host $nameWithSquoosh
				Write-Host $squooshStrBaseName
				Write-Host '========================='
			}
		 	if($nameWithSquoosh -eq $squooshStrBaseName){
		 		$notMatch = 0
		 		break
	 		}
		}
		if($notMatch -eq 1){
	 		$_
	 	}
 	}

}

Get-ChildItem "J:\photos\*.jp*g" -Recurse | where {$_ | Check-Not-In-Squoosh-List-Filter} | ForEach-Object{ $_.Fullname}
