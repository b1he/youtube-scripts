@echo off

rem Extension of the original videos
set ext=mp4

rem Folder with ffmpeg.exe and youtubeuploader_windows_amd64.exe
set bin=bin

rem Use youtubeuploader to automatically upload to YouTube after an encode. Don't use this for more than 6 videos per day!
set ytu=false

mkdir temp
mkdir temp\converting
mkdir temp\uploading
mkdir completed
mkdir completed\original
mkdir completed\converted

for %%a in (*.%ext%) do (
if not exist "temp\uploading\%%~na.mkv" (
title Converting %%~na
"%bin%\ffmpeg.exe" -hwaccel cuvid -c:v h264_cuvid -i "%%~na.%ext%" -r 15 -vf setpts=4.0*PTS,scale_npp=-1:2160:interp_algo=lanczos -af asetrate=12000 -c:v hevc_nvenc -b:v 25M -c:a pcm_s16le "temp\converting\%%~na.mkv" -y
move "temp\converting\%%~na.mkv" "temp\uploading\%%~na.mkv"
)
if %ytu% == true (
title Uploading %%~na
"%bin%\youtubeuploader_windows_amd64.exe" -filename "temp\uploading\%%~na.mkv" -title "%%~na" -description "" -privacy "unlisted" -cache "%bin%\request.token" -secrets "%bin%\client_secrets.json"
)
move "temp\uploading\%%~na.mkv" "completed\converted\%%~na.mkv"
move "%%~na.%ext%" "completed\original\%%~na.%ext%"
)

title Finished
echo Finished
pause