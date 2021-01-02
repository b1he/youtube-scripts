@echo off
set /p name=Enter output filename: 
ffmpeg.exe -i %1 -r 15 -vf "format=yuv444p,setpts=4.0*PTS,scale=3840x2160:flags=neighbor" -af "asetrate=12000" -c:a pcm_s16le -c:v hevc_nvenc -b:v 100M -preset slow -pix_fmt p010le -colorspace bt2020nc -color_trc smpte2084 -color_primaries bt2020 -attach LUT.cube -metadata:s:2 mimetype=application/x-cube "%name%.mkv"
