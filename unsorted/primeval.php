#!/bin/php
<?php

function rename_decimal($decimal) {
    return str_replace(Array('0','1','2','3','4','5','6','7','8','9'), Array('A','B','C','D','E','F','G','H','I','J'), $decimal);
}

$primes = Array();
$primes_file = explode("\n", file_get_contents("primes10000000.txt"));
foreach($primes_file as $line) {
    $primes[] = $line;
}

$testdata = "The bigger the data the bigger the compression rate ?!";
$testdata_binary = "";
foreach($primes as $index => $prime) {
#    echo $index + 1 . ".) ($prime) = " . base_convert($prime, 10, 2) . PHP_EOL;
}

for($index=0; $index<strlen($testdata); $index++) {
    // base_convert(ord($testdata[$index]), 10, 2); // . " ";
    $testdata_binary .= str_pad(base_convert(ord($testdata[$index]), 10, 2), 8, '0', STR_PAD_LEFT);
}

$testdata_primed = $testdata_binary;
for($index=count($primes)-1; $index>=0; $index--) {
   // echo $index + 1 . ".) ($primes[$index]) = " . base_convert($primes[$index], 10, 2) . PHP_EOL;

    $testdata_primed = str_replace(base_convert($primes[$index], 10, 2), "[" . rename_decimal($index) . "]", $testdata_primed);
}


   
//echo "$testdata" . PHP_EOL;
//echo "$testdata_binary" . PHP_EOL;
//echo "" . PHP_EOL;
echo "$testdata_primed" . PHP_EOL;


?>