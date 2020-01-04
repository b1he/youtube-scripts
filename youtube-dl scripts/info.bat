@echo off
set /p url=Enter URL:
youtube-dl.exe -F %url%
pause