#!/bin/bash

length=5

while true; do
  readarray -t files < <(find . -type f -print | shuf -n 1)
  for i in "${!files[@]}"; do
    film=${files[i]}

    # Check if ffprobe can extract the duration of the film
    if ffprobe -i "$film" -show_entries format=duration -v quiet -of csv="p=0" >/dev/null; then
      duration=$(ffprobe -i "$film" -show_entries format=duration -v quiet -of csv="p=0")
      duration=${duration%.*}

      if [ $duration -lt 1 ]
      then
        continue
      fi

      # Calculate random start and length values
      percent=$((duration / 100 * 25))
      rndl=$((1 + ($RANDOM % duration) - percent * 2))
      rnds=$((percent + RANDOM % rndl))
      wait=$((rndl / 4))
      len=$((1 + ($RANDOM % length)))

      # Play the film with mpv
      mpv "$film" --start=$rnds --length=$len --fullscreen >/dev/null 2>&1 &
      #wmctrl -r "mpv" -b add,above,fullscreen,skip_taskbar

      # Wait for the film to play for the specified length
      wait=$(echo "$len - 0.5" | bc)
      sleep $wait

      unset 'files[i]'
    fi
  done
done
