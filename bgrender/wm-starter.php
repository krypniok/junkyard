#!/usr/bin/php
<?php

// Function to run process in background
function run($command, $outputFile = '/dev/null') {
    $processId = shell_exec(sprintf(
        '%s > %s 2>&1 & echo $!',
        $command,
        $outputFile
    ));
    print_r("processID of process in background is: " . $processId);
    return $processId;
}

$command = "./bgrender";
$process = 'export DISPLAY=:1 && ' . $command;
run($process);

$command = "cinnamon-session";
$process = 'export DISPLAY=:1 && ' . $command;
run($process);

echo "mypid = " . getmypid() . "\n";

$quit = 0;

$lasttime = microtime(true);
while (!$quit) {
    $currenttime = microtime(true);
    $deltatime = $currenttime - $lasttime;
    sleep(1);
    $lasttime = microtime(true);
}

?>
