# you2mp3.sh
Bash one-liner to download a youtube playlist directly to mp3



The better way:
youtube-dl --cookies ~/cookies.txt --download-archive downloaded.txt --no-post-overwrites -ciwx --audio-format mp3 -o "%(title)s.%(ext)s" PLi7fV1W5sFaZOfybPbIFp6GxXbO3_Ggo- PLi7fV1W5sFaaPu3v-OKcA3gUxskahQoHT



The dumb old way
Bash script to download a youtube playlist directly to mp3

First you need to install some tools

http://ytdl-org.github.io/youtube-dl/download.html

sudo apt autoinstall sed jq youtube-dl ffmpeg

Then you create an empty directory for the new playlist

mkdir playlist
cd playlist

copy the playlist's list variable (https://www.youtube.com/watch?v=XXXXXXXXXXX&list= LISTLISTLISTL &start_radio=1)

./you2mp3.sh LISTLISTLISTL
