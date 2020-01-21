# youtube-scripts
Some YouTube scripts for experiments.

### youtube-dl scripts
Useful to automate youtube-dl tasks.
* download - 4k: Download the 4K VP9 SDR video.

* download - 4khdr: Download the 4K VP9 HDR video.

* download - best best: Download the best video and audio stream according to youtube-dl and combine. It does not always choose the most logical combination such as VP9 video with AAC audio.

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
There isn't a great way to batch upload as th YouTube API can only allow 6 uploads per day. The old web uploading will do since it can upload 15 videos at a time.
Requires an ffmpeg build with libnpp enabled and an NVIDIA GPU.
* My main method - upscale to 4K and slow down video by 4 times. Change audio pitch by reducing sample rate by 4 times. Playback in realtime can be done on Firefox with these commands.
document.getElementsByTagName("video")[0].playbackRate = 4
document.getElementsByTagName("video")[0].mozPreservesPitch = false

* Upscale to 4K - Just upscale to 4K.
* Convert to 10-bit - Re-encode the video that will trick YouTube into thinking the video is in a HDR format which means a 10-bit video is encoded. Slow because bit-depth conversion is done on the CPU.
* Slow down 10 times - Let ffmpeg change the frame rate of the video without re-encoding it. The audio stays intact.

#### Instructions for main method
* Edit batch file to insert location of ffmpeg.
* Place start.bat to a folder where the videos are located.
* Start!
* If uploading 6 or less videos per day, porjo's youtubeuploader can be used, see https://github.com/porjo/youtubeuploader#setup and enable it in the batch file.
* To retrieve and convert back from YouTube, make sure youtube-dl is in the same folder as the bin location, double click and paste url.

#### Instructions for other strategies
* Edit batch file to insert location of ffmpeg.
* Drag and drop the video to the batch file.
* Enter filename of the new converted video.