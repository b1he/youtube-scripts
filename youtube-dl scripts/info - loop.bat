@echo off
set /p url=Enter URL:
:loop
cls
youtube-dl.exe -F %url%
timeout 60
goto loop