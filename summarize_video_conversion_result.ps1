# https://www.junian.net/tech/powershell-ffmpeg-batch/
using assembly microsoft.visualbasic
using namespace microsoft.visualbasic

$allVideos = Get-ChildItem J:\photos\*.mp4 -Recurse
echo '==============================================================================================================================='
for($i = 0; $i -lt $originalVids.length; $i++){
    if((Get-Item $allVideos[$i]).BaseName -like '*_converted*'){
        $newVid = $allVideos[$i]
        $originalVid =  (Get-Item $newVid ).Fullname.Replace('_converted', '')
        "debug newVidFullname $newVid"
        "debug originalVidFullname $originalVid"

        $originalBaseName = (Get-Item $originalVid).BaseName
        $newVidBaseName = (Get-Item $newVid).BaseName
        "$originalBaseName => $newVidBaseName"

        $originalSize =  [string]::Format("{0:0.00} MB", (Get-Item $originalVid).Length / 1MB)
        $newSize =  [string]::Format("{0:0.00} MB", (Get-Item $newVid).Length / 1MB)
        "$originalSize => $newSize"
        if((Get-Item $originalVid).Length -lt (Get-Item $newVid).Length){
            echo 'GOT BIGGER'
            # if converted file is bigger, move to recycle bin
            #[FileIO.FileSystem]::DeleteFile($newVid, 'OnlyErrorDialogs', 'SendToRecycleBin')
        }

        # move original video to recycle bin
        [FileIO.FileSystem]::DeleteFile($originalVid, 'OnlyErrorDialogs', 'SendToRecycleBin')

        

        echo ''
    }
}
