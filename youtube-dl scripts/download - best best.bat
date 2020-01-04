@echo off
set /p url=Enter URL:
youtube-dl.exe -f bestvideo+bestaudio %url%