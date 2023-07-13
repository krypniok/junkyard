#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    filename=$(echo "$line" | awk '{print $1}')
    timestamp=$(echo "$line" | awk '{print $2}')
    sleep_duration=$(echo "$line" | awk '{print $3}')
    
    eval "./playmovie.sh \"$filename\" \"$timestamp\" \"$sleep_duration\" 1>/dev/null"    

    wait=$(echo "$sleep_duration - 0.5" | bc)
    sleep $wait
done < input.txt

