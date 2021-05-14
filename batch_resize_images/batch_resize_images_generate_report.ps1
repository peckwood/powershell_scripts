# 生成report
Add-Type -AssemblyName System.Drawing
# 'J:\photos'
# 'F:\TEMP\images'
$photoFolder = 'J:\photos'
#$photoFolder = 'F:\TEMP\images'
# 842kb 1kb
$minimumImageSizeForResizing = '842kb'
#$minimumImageSizeForResizing = '1kb'
# 注意
$irregularDimensions = @{}
$irregularRatios = @{}
foreach($folder in (gci $photoFolder -directory)){
    new-item -ItemType directory -Force -Path ($folder.fullname+"\resized_image") | Out-Null
}
Get-ChildItem "$photoFolder\*.jp*g" -Recurse | where Length -gt $minimumImageSizeForResizing | ForEach-Object {
	#$_.Fullname
    $img = [Drawing.Image]::FromFile($_.Fullname); 
    $longSide = [math]::Max($img.Width,$img.Height)
    $shortSide = [math]::Min($img.Width,$img.Height)
	$ratio = [math]::Round($longSide / $shortSide, 3)
    $dimensions = "$($img.Width) x $($img.Height)"
    if($shortSide -gt 1350){
		if($ratio -eq 1.333){
			#echo 'ratio 1.333'
			#$ratio
		}elseif($ratio -eq 1.778){
			#echo 'ratio 1.778'
			#$ratio
		}elseif($ratio -eq 1.5){
			#echo 'ratio 1.5'
			#$ratio
		}else{
			$_.Fullname
			echo 'irregular ratio'
			
			#$irregularDimensions.Add($dimensions, $currentCount + 1)
            if(-Not ($irregularDimensions[$dimensions])){
                $irregularDimensions[$dimensions] = 1
            }else{
                $irregularDimensions[$dimensions] = $irregularDimensions[$dimensions]+1
            }

            if(-Not ($irregularRatios[$dimensions])){
			    $irregularRatios.Add($dimensions, $ratio)
            }
			$dimensions
			$ratio
		}
    }
}
echo 'irregularDimensions'
$irregularDimensions
echo ''
echo 'irregularRatios'
$irregularRatios
