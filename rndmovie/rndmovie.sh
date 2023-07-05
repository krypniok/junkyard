#!/bin/bash


cd "/media/simon/4b493a54-f153-4885-91ec-c23518a419c9/New Videos"


while(true) do

readarray -t files < <(find . -type f -print | uniq -u | shuf -n 1)
for i in "${!files[@]}"; do
#    echo ${files[i]}

FILM=${files[i]}   #`ls *.mkv | uniq -u | shuf -n1`
TITLE=`echo $FILM | sed 's/\(.*\)\.German.*/\1/' | sed s/[.]/\ /g | sed 's/[0-9]\+$//'`

# loosing the fraction of a second does not really count here
float=$(ffprobe -i "$FILM" -show_entries format=duration -v quiet -of csv="p=0")
int=${float%.*}
percent=$(((int/100)*25))

#echo "$float $int $percent\n"
#continue


rndl=$(((1 + ($RANDOM % $int)) - $percent * 2))
rnds=$(($percent + $RANDOM % $rndl))
wait=$(($rndl / 4))

len=$((1 + ($RANDOM % $1)))

#echo "$len"
mpv "$FILM" --start=$rnds --length=$len --fullscreen &>/dev/null &

wait=`echo "$len - 0.5" | bc`
sleep $wait

    unset 'files[i]'
done

done

