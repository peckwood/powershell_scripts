$pth = "D:/nextcloud/audio/music_repository";
Get-ChildItem -Path $pth -Recurse -Include "*.mp3" | % { Process { 
    If ( ! ( Test-Path "$((Split-Path $_.FullName -Resolve))\$($_.BaseName).lrc" ) ) 
    { $_.FullName };
    }};