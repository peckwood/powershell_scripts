# https://www.junian.net/tech/powershell-ffmpeg-batch/
$originalVids = Get-ChildItem J:\photos\*.mp4 -Recurse
# string数组
$rotate_90_conuter_clockwise_hq = @('VID_20200209_213832_姥娘和妈妈谈话.mp4', 'VID_20200520_192952.mp4')
echo '==============================================================================================================================='
for($i = 0; $i -lt $originalVids.length; $i++){
    $newVid = (Get-Item $originalVids[$i] ).DirectoryName+ '\' + (Get-Item $originalVids[$i]).BaseName + '_converted.mp4'
    # 数组是否包含某元素
    if($rotate_90_conuter_clockwise_hq.Contains($originalVids[$i].Name)){
        # HQ and rotate 90 counter clockwise
        $output = "HQ and rotate 90 counter clockwise: " + $originalVids[$i].Name
        echo $output
        ffmpeg -i (Get-Item $originalVids[$i] ).FullName -c:v libx265 -crf 18 -preset veryslow -vf "transpose=2" -codec:a libvorbis  -qscale:a 5 -map_metadata 0 $newVid
    }
    elseif($originalVids[$i].Name -like '*hq*') {
        # HQ
        $output = "HQ: " + $originalVids[$i].Name
        echo $output
        ffmpeg -i (Get-Item $originalVids[$i] ).FullName -c:v libx265 -crf 18 -preset veryslow -codec:a libvorbis  -qscale:a 5 -map_metadata 0 $newVid
    }
    elseif(-Not ($originalVids[$i].Name  -like '*skip*')) {
        $output = "regular quality: " + $originalVids[$i].Name
        echo $output
        # regular quality
        ffmpeg -i (Get-Item $originalVids[$i] ).FullName -c:v libx265 -crf 26 -preset veryslow -codec:a libvorbis  -qscale:a 5 -map_metadata 0 $newVid
    }
 }
