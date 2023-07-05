#!/bin/bash

# Function to run process in background
function run() {
    command="$1"
    outputFile="/dev/null"
    processId=$(eval "$command > $outputFile 2>&1 & echo $!")
    return $processId;
}

command="./bgrender"
process="export DISPLAY=:1 && $command"
run "$process"

command="cinnamon-session"
process="export DISPLAY=:1 && $command"
run "$process"

trap "exit" INT TERM
while true; do
    sleep 3600  # Wait for an hour (you can adjust the duration as needed)
done
