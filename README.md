# youtube-scripts
Some YouTube scripts for experiments.

### youtube-dl scripts
Useful to automate youtube-dl tasks.
* download - 4k: Download the 4K VP9 SDR video.

* download - 4khdr: Download the 4K VP9 HDR video.

* download - best best: Download the best video and audio stream according to youtube-dl and combine. Does not always choose the best combination such as VP9 video and AAC audio.

* info - loop: Checks every 60 seconds the different encodes available on YouTube. Useful for checking if a higher resolution encode has been processed.

* info + download no.: Returns the encode ids available to download which is entered. e.g: 337+251

* info: Lists different encodes available.

* update: Updates youtube-dl.

### youtube-auto-generated-music-downloader
Script to automatically download YouTube auto-generated music with tagging and album cover.
Requires youtube-dl, ffmpeg and tageditor.
One of my first projects that actually does something (not just a hello world one.)

#### Instructions
Run the batch file and paste the YouTube auto-generated music link there (ctrl+v if on Windows 10 or right click with your mouse).

You can also edit the batch file to change some parameters:
* musicdir: The folder where the music will be stored.
* format: opus50k, opus70k, opus160k, m4a128k, m4a192k or vorbis128k
* bin: The location of the binary folder.
* skipdownloadercover: whether to skip downloading cover or not.

### yt upscale and upload
An experiment with various strategies to 'increase the bitrate' of videos uploaded to YouTube. Useful for archiving non-critical footage in high quality like hours of gameplay!
