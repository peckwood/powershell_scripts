# resize images
#need to add this so that npm display output asian characters right

chcp 65001
clear  
Add-Type -AssemblyName System.Drawing
# 'J:\photos'
# 'F:\TEMP\images'
$photoFolder = 'J:\photos'
$subFolder = 'resized_image'
#$photoFolder = 'F:\TEMP\images'
#skip images smaller than 842kb
$minimumImageSizeForResizing = '842kb'
$irregularDimensions = @{}
$irregularRatios = @{}

# create a subfolder for each folder in $photoFolder, for containing resized photos
<#foreach($folder in (gci $photoFolder -directory)){
    new-item -ItemType directory -Force -Path ("$folder.fullname\$subFolder") | Out-Null
} #>

# traverse recursively all jpg and jpeg files which are bigger than $minimumImageSizeForResizing inside $photoFolder
Get-ChildItem "$photoFolder\*.jp*g" -Recurse | where Length -gt $minimumImageSizeForResizing | ForEach-Object {
    $img = [Drawing.Image]::FromFile($_.Fullname); 
    $compressedImgPath = $_.DirectoryName+ '\' + $_.BaseName + '_squoosh'+ $_.Extension
    $longSideLength = [math]::Max($img.Width,$img.Height)
    $shortSideLength = [math]::Min($img.Width,$img.Height)
	$ratio = [math]::Round($longSideLength / $shortSideLength, 3)
    $dimensions = "$($img.Width) x $($img.Height)"
    $folderPathWithoutQuotes = $_.DirectoryName
    $originalFullname = $_.Fullname
    
    $dimensions
    $ratio
    if($shortSideLength -eq $img.Width){
        echo 'vertical image'
    }else{
        echo 'horizontal image'
    }
    # only images with shortSideLength longer than 1350 will be compressed
    if($shortSideLength -gt 1350){
        if($ratio -eq 1.333){
            $targetLengthOfShortSide = 1350
            # if width is the short side
            if($shortSideLength -eq $img.Width){
                $shortSide = 'width'
            }else{# if height is the short side
                $shortSide = 'height'
            }                    
	}elseif($ratio -eq 1.778){
            if($shortSideLength -eq $img.Width){
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"width\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }else{# if height is the short side
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }
	}elseif($ratio -eq 1.5){
            if($shortSideLength -eq $img.Width){
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"width\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }else{# if height is the short side
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }
	}elseif($ratio -eq 1.336){
            if($shortSideLength -eq $img.Width){
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"width\":1350,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }else{# if height is the short side
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1350,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }
        #image by the size of 4208:3120
    	}elseif($ratio -eq 1.349){
            if($shortSideLength -eq $img.Width){
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"width\":1350,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }else{# if height is the short side
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1350,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }
        #image by the size of 3264:1832
    	}elseif($ratio -eq 1.782){
            if($shortSideLength -eq $img.Width){
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"width\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }else{# if height is the short side
                squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
            }
        }

        $widthAndHeightString3 = ",`"$shortSide`":$targetLengthOfShortSide"
        #$widthAndHeightString3
        $resizeStr = "'{`"width`":100 $widthAndHeightString3,`"method`":`"lanczos3`",`"fitMethod`":`"stretch`",`"premultiply`":true,`"linearRGB`":true}'"
        #$resizeStr
        $resizeStr1 = "{`"enabled`":true$widthAndHeightString3,`"method`":`"lanczos3`",`"fitMethod`":`"stretch`",`"premultiply`":true,`"linearRGB`":true}"
        #$resizeStr1
        #$resizeStr1
        #$resizeStr2 = "'{`"width`":100}'"
        #$resizeStr2 = "`'{`"width`":100}`'"
        #$resizeStr2 = "`'{`"width`":100}`'"
        # this one works!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        $resizeStr2 = "{`"width`":100}"

        $resizeStr4 = "{\`"width\`":1000,\`"enabled\`":true}'"
        $resizeStr4
        powershell D:\workspace\powershell_scripts\GetCommandLine.ps1 $resizeStr4
        squoosh-cli -s _squoosh -d $_.DirectoryName --resize $resizeStr4 --mozjpeg '{"quality":95,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
        echo ''

        $resizeStr4 = "{`"width`":1000,`"enabled`":true}'"
        $resizeStr4
        powershell D:\workspace\powershell_scripts\GetCommandLine.ps1 $resizeStr4
        squoosh-cli -s _squoosh -d $_.DirectoryName --resize $resizeStr4 --mozjpeg '{"quality":95,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
        echo ''

        # duplicate metadata
        #exiftool -overwrite_original -TagsFromFile  "$originalFullname" $compressedImgPath

        #$heightString = ",`"height`":$targetHeight"
        #$heightString
        #&$exe -p "-script=H:\backup\scripts\vss.cmd" $drivesToBackup
        #squoosh-cli -s _squoosh -d $_.DirectoryName --resize '{\"enabled\":true,\"height\":1200,\"method\":\"lanczos3\",\"fitMethod\":\"stretch\",\"premultiply\":true,\"linearRGB\":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' $_.Fullname
    }
}