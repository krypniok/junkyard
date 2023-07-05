<?php
### Fun with BEEP ###
# This script allows you to create simple music with tones and timing using an extremely basic "markup"
#
# Notes :
# This is bad code written in 10 minutes, it also comes without any warranty so use it at your own risk.
#
# Installation :
#	apt-get -y install beep php5-cli
#	You may also have to modprobe pcspkr
#
# Writing your own tune :
#	"C4" is middle C.  To play a note for 100 milliseconds you would use ".1". Therefore to play 'middle C' for 1 second you would type 
#	"C4.10" - always seperate your notes with commas!  Empty lines are OK for readability.
#	As always don't run as root, instead add your user to the pcspkr group (whatever it may be).
# Here's a sample tune you may recognize... 
$tune = "E5.2,E5.3,E5.4,C5.2,E5.3,G5.5,G4.5,C5.3,G4.3,E4.3,A4.3,B4.2,A_4_Bb4.2,A4.2,G4.2,E5.2,G5.2,A5.3,F5.2,G5.2,E5.2,C5.2,D5.2,B4.4";
### Don't edit below this line ###


$notes = Array();
$file_to_read = fopen('nachtmusik.txt', 'r');
if($file_to_read !== FALSE){
    while(($data = fgetcsv($file_to_read, 100, ',')) !== FALSE){
        for($i = 0; $i < count($data); $i++) {
        }
		$notes[] = $data;
    }
    fclose($file_to_read);
}


function sinewave($f, $t) {
	$cmd = "~/openal-soft/examples/altonegen -f " . $f . " -t " . $t . " -g 0.4";
	//$cmd = "~/Dokumente/Skripte/Sandbox/sinewave " . $f . " " . $t;
	exec($cmd . " > /dev/null &");
//	echo "sine $f wave $t\n";
}


# "freq_hz","length_ms","post_delay"
#
# "-N","R"   

function calcMelodyTime($notes) {
$span = 1;
$reps = 1;
$numnotes = 1;
$repeat = false;
$duration_ms = 0;
for($i=0; $i<count($notes); $i++) {
	$note = $notes[$i];
	if($note[0] < 0) {
		$span = $numnotes = abs($note[0]);
		$reps = $note[1];
		$repeat = true;
		continue;
	}
	if($repeat) {
		if($reps == 0) { $repeat = false; }
		$numnotes--;
		if($numnotes == 0) { if(--$reps > 0) { $i -= $span; $numnotes = $span; } }
	}

	$delay = $note[1];
	$duration_ms += (int)$delay;

	if(isset($note[2])) {
		$delay = $note[2] * 100;
		$duration_ms += (int)$delay;
		usleep($delay);
	}
}
	return $duration_ms;
}


$melody_duration = calcMelodyTime($notes);

echo "Melody is $melody_duration\n";

$span = 1;
$reps = 1;
$numnotes = 1;
$repeat = false;
$duration_ms = 0;
for($i=0; $i<count($notes); $i++) {
	$note = $notes[$i];
		
	if($note[0] < 0) {
		$span = $numnotes = abs($note[0]);
		$reps = $note[1];
		$repeat = true;
		continue;
	}

	if(isset($note[3])) {
	//	$notes[$i][0] *= $note[3];
	}
	
	$j = 0;
	if($repeat) {
		if($reps == 0) { $repeat = false; }
		$numnotes--;
		if($numnotes == 0) { if(--$reps > 0) { $i -= $span; $numnotes = $span; } }
	}


	sinewave($note[0], $note[1]);

	//$a = readline('Press any...');

	$delay = $note[1] * 1000; // play with for smooth criminal
	usleep($delay);

	$duration_ms += $note[1];

	if(isset($note[2])) {
		$delay = $note[2] * 100;
		usleep($delay);
		$duration_ms += $delay;
	}

	echo "$duration_ms/$melody_duration\n";

}


exit;

$line = explode(',', $tune);
foreach ($line as $note) {
	if (!empty($note)) {
		$d = explode('.', $note);
		$f = trim($d[0]);
		$t = trim($d[1]);
		$t = $t*100;
		if (!empty($f)) {
			play($f, $t);
		}
	}
}

function play($tone, $length = 1000) {
	$note = tone($tone);
echo "note $length $note\n";

$cmd = "~/Dokumente/Skripte/Sandbox/sinewave " . $note . " " . $length;
exec($cmd . " > /dev/null &");
usleep($length * 1000);
}

function tone($tone) {
	$tones = array('C0' => '16.35','C_0_Db0' => '17.32','D0' => '18.35','D_0_Eb0' => '19.45','E0' => '20.60','F0' => '21.83','F_0_Gb0' => '23.12','G0' => '24.50','G_0_Ab0' => '25.96','A0' => '27.50','A_0_Bb0' => '29.14','B0' => '30.87','C1' => '32.70','C_1_Db1' => '34.65','D1' => '36.71','D_1_Eb1' => '38.89','E1' => '41.20','F1' => '43.65','F_1_Gb1' => '46.25','G1' => '49.00','G_1_Ab1' => '51.91','A1' => '55.00','A_1_Bb1' => '58.27','B1' => '61.74','C2' => '65.41','C_2_Db2' => '69.30','D2' => '73.42','D_2_Eb2' => '77.78','E2' => '82.41','F2' => '87.31','F_2_Gb2' => '92.50','G2' => '98.00','G_2_Ab2' => '103.83','A2' => '110.00','A_2_Bb2' => '116.54','B2' => '123.47','C3' => '130.81','C_3_Db3' => '138.59','D3' => '146.83','D_3_Eb3' => '155.56','E3' => '164.81','F3' => '174.61','F_3_Gb3' => '185.00','G3' => '196.00','G_3_Ab3' => '207.65','A3' => '220.00','A_3_Bb3' => '233.08','B3' => '246.94','C4' => '261.63','C_4_Db4' => '277.18','D4' => '293.66','D_4_Eb4' => '311.13','E4' => '329.63','F4' => '349.23','F_4_Gb4' => '369.99','G4' => '392.00','G_4_Ab4' => '415.30','A4' => '440.00','A_4_Bb4' => '466.16','B4' => '493.88','C5' => '523.25','C_5_Db5' => '554.37','D5' => '587.33','D_5_Eb5' => '622.25','E5' => '659.26','F5' => '698.46','F_5_Gb5' => '739.99','G5' => '783.99','G_5_Ab5' => '830.61','A5' => '880.00','A_5_Bb5' => '932.33','B5' => '987.77','C6' => '1046.50','C_6_Db6' => '1108.73','D6' => '1174.66','D_6_Eb6' => '1244.51','E6' => '1318.51','F6' => '1396.91','F_6_Gb6' => '1479.98','G6' => '1567.98','G_6_Ab6' => '1661.22','A6' => '1760.00','A_6_Bb6' => '1864.66','B6' => '1975.53','C7' => '2093.00','C_7_Db7' => '2217.46','D7' => '2349.32','D_7_Eb7' => '2489.02','E7' => '2637.02','F7' => '2793.83','F_7_Gb7' => '2959.96','G7' => '3135.96','G_7_Ab7' => '3322.44','A7' => '3520.00','A_7_Bb7' => '3729.31','B7' => '3951.07','C8' => '4186.01','C_8_Db8' => '4434.92','D8' => '4698.64','D_8_Eb8' => '4978.03');
	return $tones[$tone];
}


