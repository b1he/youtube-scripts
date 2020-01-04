@echo off
set /p url=Enter URL:
youtube-dl.exe -F %url%
set /p no=Enter format number:
youtube-dl.exe -f %no% %url%
pause