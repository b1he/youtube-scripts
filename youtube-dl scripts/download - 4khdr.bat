@echo off
set /p url=Enter URL:
youtube-dl.exe -f 337+251 -k -o "D:\%%(title)s.%%(ext)s" %url%