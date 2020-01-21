@echo off

rem Folder with youtube-dl.exe and ffmpeg.exe
set bin=bin

title Retrieve video

set /p url=Enter URL:
%bin%\youtube-dl.exe -f 313,251 -o "temp\retrieve\%%(format_id)s\%%(title)s.%%(ext)s" %url%

for %%a in (temp\retrieve\313\*.webm) do (
%bin%\ffmpeg -hwaccel dxva2 -i "temp\retrieve\313\%%~na.webm" -i "temp\retrieve\251\%%~na.webm" -r 60 -vf hwupload_cuda,setpts=0.25*PTS,scale_npp=-1:1080:interp_algo=lanczos -af aresample=isr=12000:osr=12000,asetrate=48000 -c:v h264_nvenc -b:v 100m -c:a aac -b:a 320k "%%~na.mp4" -y
)

rmdir temp /s /q

title Finished
echo Finished.
pause