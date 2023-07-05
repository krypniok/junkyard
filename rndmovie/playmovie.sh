#!/bin/bash

# echo $((1 + $RANDOM % 10))
#  dd if=/dev/urandom count=4 bs=1 | od -t d
#
#
if [[ $1 == "" ]]; then exit; fi

cd "/media/simon/4b493a54-f153-4885-91ec-c23518a419c9/New Videos"

readarray -t files < <(find . -type f -print | uniq -u | grep -i "$1")
for i in "${!files[@]}"; do
FILM=${files[i]}
TITLE=`echo $FILM | sed 's/\(.*\)\.German.*/\1/' | sed s/[.]/\ /g | sed 's/[0-9]\+$//'`

#if [[ $TITLE == *"$1"* ]]; then
  # echo "It's there! ${files[i]} "

#fi

# loosing the fraction of a second does not really count here
float=$(ffprobe -i "$FILM" -show_entries format=duration -v quiet -of csv="p=0")
int=${float%.*}
percent=$(((int/100)*25))

rndl=$(((1 + $RANDOM % $int) - $percent * 2))
rnds=$(($percent + $RANDOM % $rndl))
wait=$(($rndl / 4))

echo "$2 $3";
mpv $FILM --start=$2 --length=$3 --fullscreen &>/dev/null &
#sleep 2.5
exit
    unset 'files[i]'
done

