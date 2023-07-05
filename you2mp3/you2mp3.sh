#!/bin/bash
# remember to install jq and id3 tool
#
# sudo apt install jq id3tool detox???
#
#
#youtube-dl -j --flat-playlist "$1" | jq -r '.id' | sed 's_^_https://youtu.be/_' > result.log
#while IFS='' read -r LINE || [ -n "${LINE}" ]; do
#    TITLE=$(youtube-dl --skip-download --get-title --no-warnings ${LINE} | sed 2d)
#    echo "Downloading and converting '$TITLE' to MP3..."
#    youtube-dl -q --no-warnings --extract-audio --audio-format mp3 ${LINE}
#done < result.log
#rm result.log

if [[ $1 == "" ]]; then echo "Usage: $0 (YOUTUBEID|YOUTUBEPL|batchfilepath)"; exit; fi

# TODO
#detox () {
#}

# Provide an Netscape-Style cookie.txt for youtube.com
YTDL="yt-dlp"
COOKIEFILE="--cookies ~/cookies.txt"
CFLAGS="--console-title --ignore-errors --no-warnings --quiet"
LFLAGS="-j --flat-playlist"

ret=0
count=0

json=`$YTDL $CFLAGS $COOKIEFILE $LFLAGS $1`
#if [[ $? > 0 ]]; then echo "Error: Fetching $1"; exit; fi

echo "$json" | jq -r '.id' | sed 's_^_https://youtu.be/_' > result.log
resultlen=`wc -l < result.log`

while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "($count / $resultlen) Trying to Download and Convert ($LINE) to MP3 ..."
    count=$(($count + 1))
 
    #ID=$(youtube-dl --skip-download --get-id --no-warnings ${LINE} | sed 2d)
    FILEID=`youtube-dl --console-title --skip-download --get-filename --no-warnings ${LINE} 2>> errors.txt`
    ret=$?
    if [[ $ret > 0 ]]; then echo "youtube-dl returned $ret ($LINE) ($FILEID)" >> errors.txt; fi

    continue

    ID=`echo $FILEID | sed -n 's/\(.*\)\-\(...........\)\.\(...\)/\2/p'`
    FILE=`echo $FILEID | sed -n 's/\(.*\)\-\(...........\)\.\(...\)/\1\.\3/p'`
    FILEOUT="${FILE%.*}.mp3"

    count=$(($count + 1))

    echo "($count / $resultlen) Downloading ($LINE) and converting to MP3 ..."

    ret=`youtube-dl --console-title -q --cookies ~/cookies.txt --download-archive downloaded.txt --no-post-overwrites -ciwx --audio-format mp3 -o "%(title)s.%(ext)s" ${LINE}`
    echo "youtube-dl returned $?"
    echo ""

    if [ -f "$FILEOUT" ]
    then
#    echo "$FILEOUT"
    newname="`detox -v -s iso8859_1 --special \"$FILEOUT\"`"
    #echo "$newname"
    newname2="`echo $newname | sed -n 's/.* -> \(.*\)$/\1/p'`"
    FILEOUT="$newname2"
#echo "$newname2"
    # set note
    id3tool --set-note="crypticode 2023 ($ID)" --set-title="${FILE%.*}" "$FILEOUT" 
    # get note
    id3tool "$FILEOUT" | sed 's/Filename.*$//' | sed 's/Note:[^a-Z0-9\-\_]*\(.*\)$/\1/'
    else
        # log to 
        echo "Missing $LINE"
        echo "$LINE" > error-missing.log
    fi

    echo "... with Tag ($ID) to ($FILEOUT)"
    echo ""
    

done < result.log
rm result.log

