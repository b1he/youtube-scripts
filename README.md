# youtube-scripts
Batch scripts as part of my YouTube encoding/analysis experiments.

## youtube-dl scripts
Automate some youtube-dl tasks.

| File                  | Description|
|-----------------------|-|
| download - 4k         | Download the 4K VP9 SDR video. |
| download - 4khdr      | Download the 4K VP9 HDR video. |
| download - best+best  | Download the best video and audio stream according to youtube-dl and  combine.It does not always choose the most logical combination such as combining VP9 video with AAC audio. |
| info                  | Lists different encodes available. |
| info - loop           | Same as above but refreshes every 60 seconds. Useful while waiting for higher resolution recodes are processed by YouTube. |
| info + download no. | Returns the encode ids available to download then prompts you to choose which encode ids to download and also combine. e.g. : 337+251 |
| update | Updates youtube-dl. |

## youtube autogen music dl
Script to automatically download YouTube auto-generated music with tagging and album cover.
Requires youtube-dl, ffmpeg and tageditor.
YouTube keeps changing the layout of the album cover placement so may not save the image properly anymore.

#### Usage
Run the batch file and paste the YouTube auto-generated music link there (Ctrl+v if on Windows 10 or right click with your mouse).
You can also edit the batch file to change some parameters:
* musicdir: The folder where the music will be stored.
* format: opus50k, opus70k, opus160k, m4a128k, m4a192k or vorbis128k
* bin: The location of the binary folder.
* skipdownloadercover: whether to skip downloading cover or not.

## youtube archive by upscaling
An experiment with various strategies to increase the YouTube encoded bitrate. Used by me to test archiving non-critical footage in high quality: hours of gameplay!
#### What the script does:
* Make the video four times slower so YouTube can allocate a higher bitrate per real second. This is not an exact linear 4x bitrate boost as YouTube encodes at different bitrates depending on the frame rate/amount of action. The new adjusted frame rate in the script is 15 as it is assumed the source frame rate is 60.
 * Slow audio down from 48kHz to 12kHz without doing any audio processing. Adjustments will need to be made if the source rate is not 48kHz.
* Upscale the resolution to 3840x2160 so that YouTube will encode with VP9 and at a significantly higher bitrate. 
* Use nearest neighbour scaling as edges are preserved a little better.
* Convert the pixel format to 10-bit and apply HDR metadata to trick YouTube to encode a 10-bit version of the video. This version helps significantly reduce banding and preserve shadow detail much better.
* Insert a LUT so YouTube knows how to convert the supposedly HDR video back to SDR. (Basically the LUT tells it to do nothing.)
* Utilise HEVC NVENC encoding. This can speed up the conversion process. However, the CPU will still be the bottleneck as it will still need to do the decoding, upscaling and pixel format conversion. (The GPU cannot do pixel format conversion and libnpp (Nvidia's GPU upscaler) cannot upscale in 10-bit colour.)

#### Usage
Drag the source video to start.bat. The script will prompt you to enter the output filename. The output video will be saved in an .mkv format.

#### Viewing the video on YouTube
On Firefox web browser, inspect element by right-clicking a white-space on the page. Go to console and insert the following code to set the video speed to 4x and adjust the audio pitch. 

	document.getElementsByTagName("video")[0].playbackRate = 4
	document.getElementsByTagName("video")[0].mozPreservesPitch = false

As far as I know, no other browser supports a preserves pitch tag, which means this will only work for Firefox. If Firefox supports HDR video in the future and your display also supports it, you will need to disable HDR either in the browser or display settings or your eyes may melt.

If you know you have a fast enough internet connection and are getting buffering while playing the video at 4x (60mbps!), try refreshing the page once or twice and your buffering issues should be fixed! Or download the video and see the instructions below. 

#### Viewing the YouTube downloaded video on a media player
| Player | Instructions|
|-|-|
| VLC | Go to Preferences > Audio and uncheck Enable Time-Stretching audio. Re-open the video and press the + key four times to speed up the video to 4x. |
| MPC-HC | Just open the video and hold Ctrl while pressing Up twice.|
