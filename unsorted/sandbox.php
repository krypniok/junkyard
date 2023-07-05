#!/usr/bin/php
<?php

#declare(strict_types=1);
require 'bootstrap.php';

define('M_PI_180', M_PI / 180);

$screen_width = 1920;
$screen_height = 1080;

$dn = dirname(__FILE__) . "/";


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

//$command = "xterm";
//$process = 'export DISPLAY=:1 && ' . $command;
//run($process);

//$command = "firefox --no-remote -P default";
//$process = 'export DISPLAY=:1 && ' . $command;
//run($process);

$command = "cinnamon-session";
$process = 'export DISPLAY=:1 && ' . $command;
run($process);

echo "mypid = " . getmypid() . "\n";

/*
    https://evanw.github.io/font-texture-generator/
*/

function loadfont($renderer, $fontname) {
    global $dn;
    $font = Array();
#    } else { exit("Unable to load font info ($fontname.json)\n"); }
    $font = json_decode(file_get_contents($dn . "$fontname.json"), true);

    $font['image'] = SDL_LoadBMP($dn . "$fontname.bmp");
    if ($font['image'] === null) {
        exit("Unable to load font image ($fontname.bmp)\n");
    }
    global $window;
    $windowSurface = SDL_GetWindowSurface($window);
    $color = SDL_MapRGB($windowSurface->format, 0, 0, 0);
    SDL_SetColorKey($font['image'], true, $color);

    $font['texture'] = SDL_CreateTextureFromSurface($renderer, $font['image']);
    $font['drect'] = $font['image']->clip_rect;
    SDL_FreeSurface($font['image']);
    return $font;
}

$angle = 0;
function rendertext($renderer, $font, $x, $y, $text) {
    global $angle;
    for($i=0; $i<strlen($text); $i++) {
        $char = $font['characters'][$text[$i]];
        $w = (int)$char['width'];
        $h = (int)$char['height'];

        if (SDL_RenderCopyEx($renderer, $font['texture'], new SDL_Rect($char['x'], $char['y'], $char['width'], $char['height']),
                                                          new SDL_Rect($x, $y + 32 - $char['height'], $char['width'], $char['height']), $angle,
                                                          new SDL_Point((int)($w/2), (int)($h/2)), SDL_FLIP_NONE) != 0) {
            echo SDL_GetError(), PHP_EOL;
        }
        SDL_SetRenderDrawColor($renderer, 255, 255, 255, 255);
        //SDL_RenderDrawRect($renderer, new SDL_Rect($x, $y + 32 - $char['height'], $char['width'], $char['height']));
        $x += $char['advance'];
        //$angle += 0.11;
    }
}



// Berechne prozedurale Textur
$data = array();
for ($y = 0; $y < 480; $y++) {
    for ($x = 0; $x < 640; $x++) {
        $r = sin($x / 10) * 255;
        $g = cos($y / 10) * 255;
        $b = sin($x * $y / 100) * 255;
        $a = 255;
        $data[] = $r;
        $data[] = $g;
        $data[] = $b;
        $data[] = $a;
    }
}
/* This is meant to show how to edit a surface's pixels on the CPU, but
   normally you should use SDL_FillRect() to wipe a surface's contents. */
function WipeSurface(&$surface) {
    global $data;
    /* This is fast for surfaces that don't require locking. */
    /* Once locked, surface->pixels is safe to access. */
    SDL_LockSurface($surface);

    /* This assumes that color value zero is black. Use
       SDL_MapRGBA() for more robust surface color mapping! */
    /* height times pitch is the size of the surface's whole buffer. */
//    SDL_MUSTLOCK(surface) 
    for($i=0; $i < $surface->h * $surface->w; $i++) {
        //memset($surface->pixels, 0, $surface->h * $surface->pitch);
        $surface->pixels[$i] = rand(0, 255);
    }

}


function loadtexture($filename) {
    global $renderer, $window, $dn;
    $image = SDL_LoadBMP($dn . $filename);
    if ($image === null) {
        exit("Unable to load image (.bmp)\n");
    }
    $windowSurface = SDL_GetWindowSurface($window);
    $color = SDL_MapRGB($windowSurface->format, 0, 0, 0);
    SDL_SetColorKey($image, true, $color);
 WipeSurface($image);
    $texture = SDL_CreateTextureFromSurface($renderer, $image);
    $drect = $image->clip_rect;
    SDL_UnlockSurface($image);
    SDL_FreeSurface($image);
    return $texture;
}

function rendersprite($texture, $spritewh, $x, $y, $frameindex, $angle, $size=0) {
    global $renderer;
    if($size == 0) $size = $spritewh;
    $w = 0; $h = 0;
    $format = 0;
    $access = 0;
    SDL_QueryTexture($texture, $format, $access, $w, $h);
    $numcols = $w / $spritewh;
    $numrows = $h / $spritewh;
    $framecount = $numcols * $numrows;
    if($frameindex > $framecount) exit("Invalid frame # (.bmp)\n");

    $left = (int)$spritewh * (int)($frameindex % $numcols);
    $top = (int)$spritewh * (int)($frameindex / $numcols);
    $bottom = $spritewh; //$top + $spritewh;
    $right = $spritewh; //$top + $spritewh;

    if (SDL_RenderCopyEx($renderer, $texture, new SDL_Rect((int)$left, (int)$top, (int)$bottom, (int)$right), new SDL_Rect($x, $y, (int)$size, (int)$size), $angle, new SDL_Point($size/2, $size/2), SDL_FLIP_NONE) != 0) {
        echo SDL_GetError(), PHP_EOL;
    }
}

function move_object($object) {
    global $ship;
    $newobject = $object;
    $newobject['vel_x'] += cos($newobject['angle'] * M_PI_180);
    $newobject['vel_y'] += sin($newobject['angle'] * M_PI_180);
    $newobject['x'] += $newobject['vel_x'];
    $newobject['y'] += $newobject['vel_y'];
    return $newobject;
}


$quit = false;

SDL_Init(SDL_INIT_VIDEO);
$title = "SDL Sandbox 0.1";
$window = SDL_CreateWindow($title, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, $screen_width, $screen_height, SDL_WINDOW_SHOWN | SDL_WINDOW_BORDERLESS | SDL_WINDOW_FULLSCREEN);

$renderer = SDL_CreateRenderer($window, -1, 0);


// Get the WindowID
$windowId = SDL_GetWindowID($window);
system("espeak \"test $windowId\"");

echo "windowId = $windowId\n";
// Use exec to call xprop and modify window properties
exec("xprop -id $windowId -f _NET_WM_STATE 32a -remove _NET_WM_STATE_HIDDEN");
exec("xprop -id $windowId -f _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_SKIP_TASKBAR");


$font = loadfont($renderer, "helvetica");


$texture = loadtexture("shuttle.bmp");
$texture2 = loadtexture("asteroid-psyche.bmp");

$texture3 = loadtexture("explosion.bmp");

SDL_SetRenderDrawColor($renderer, 255, 255, 255, 255);

SDL_RenderClear($renderer);
SDL_RenderPresent($renderer);

$event = new SDL_Event;
$update = true;


$ship = Array('x' => 320-32, 'y' => 240-32, 'vel_x' => 0, 'vel_y' => 0, 'angle' => 0, 'angle_vel' => 0, 'size' => 64);

#$bullet = Array('x' => 400, 'y' => 300, 'vel_x' => 0, 'vel_y' => 0, 'angle' => 0, 'size' => 8);
$bullets = Array();
#$bullets[] = $bullet;


$spriteindex = 0;
$lasttime = microtime(true);

$object = Array();
$object['x'] = 400;
$object['y'] = 300;
$object['x_vel'] = 0;
$object['y_vel'] = 0;
$object['angle'] = 0;
$object['speed'] = 0.5;

$object['noise'] = 0.5;
$object['radius'] = 4;


while (!$quit) {
    $currenttime = microtime(true);
    $deltatime = $currenttime - $lasttime;

	while (SDL_PollEvent($event)) {
		switch ($event->type) {
			case SDL_QUIT:
				$quit = true;
				break;
			case SDL_MOUSEMOTION:
				$x = $event->motion->x;
				$y = $event->motion->y;
				$update = true;
				break;
            case SDL_KEYDOWN:
                switch( $event->key->keysym->sym ) {
                    case SDLK_ESCAPE:
                        SDL_Quit();
                        exit;
                        break;
                    case SDLK_LEFT:
                        $ship['angle_vel'] -= 1;
                        break;
                    case SDLK_RIGHT:
                        $ship['angle_vel'] += 1;
                        break;
                    case SDLK_UP:
                        $ship['vel_x'] += cos($ship['angle'] * M_PI_180);
                        $ship['vel_y'] += sin($ship['angle'] * M_PI_180);
                        break;
                    case SDLK_DOWN:
                        $ship['vel_x'] -= cos($ship['angle'] * M_PI_180);
                        $ship['vel_y'] -= sin($ship['angle'] * M_PI_180);
                        break;
                    case SDLK_SPACE:
                        $bullet = Array('x' => 400, 'y' => 300, 'vel_x' => 1, 'vel_y' => 1, 'angle' => 0, 'size' => 8);
                        $bullet['vel_x'] = 0;
                        $bullet['vel_y'] = 0;
                        $bullet['x'] = $ship['x']+cos($ship['angle'] * M_PI_180); // $ship['x']+32;
                        $bullet['y'] = $ship['y']+sin($ship['angle'] * M_PI_180); //$ship['y']+32;
                        $bullet['angle'] = $ship['angle'];
                        $bullet['vel_x'] += cos($bullet['angle'] * M_PI_180);
                        $bullet['vel_y'] += sin($bullet['angle'] * M_PI_180);
                        $bullets[] = $bullet;

                        $ship['vel_x'] -= cos($ship['angle'] * M_PI_180) * 0.1;
                        $ship['vel_y'] -= sin($ship['angle'] * M_PI_180) * 0.1;
                        exec("espeak \"peng\" > /dev/null &");
                        break;
                }
            break;
		}
	}
    $update = true;
	if ($update) {
        SDL_SetWindowTitle($window, $title . " - " . $deltatime);
        SDL_SetRenderDrawColor($renderer, 0, 0, 0, 255);
		SDL_RenderClear($renderer);

        $ship['x'] += $ship['vel_x'];
        $ship['y'] += $ship['vel_y'];

        $ship['angle'] += $ship['angle_vel'];
        if($ship['angle'] < 0) $ship['angle'] += 360;
        if($ship['angle'] >= 360-1) $ship['angle'] = 0;

        if($ship['x'] >= $screen_width) $ship['x'] = 0-$ship['size']; else if($ship['x'] <= -$ship['size']) $ship['x'] = $screen_width;;
        if($ship['y'] >= $screen_height) $ship['y'] = 0-$ship['size']; else if($ship['y'] <= -$ship['size']) $ship['y'] = $screen_height;

        $ship['vel_x'] *= 0.9975;
        $ship['vel_y'] *= 0.9975;
        $ship['angle_vel'] *= 0.98;

        rendertext($renderer, $font, 0, 0, "AbCdEfGhIjKlMnOpQrStUvWxYz1234567890!$%&/()=");
        rendertext($renderer, $font, 0, 32-1, "aBcDeFgHiJkLmNoPqRsTuVwXyZ1234567890!$%&/()=");

        if($spriteindex++ > 24) $spriteindex = 0;
        rendersprite($texture3, 130, 200, 200, $spriteindex, $ship['angle'], 64);

        rendersprite($texture, 256, (int)$ship['x'], (int)$ship['y'], 0, $ship['angle']+90, 64);


		if (SDL_RenderCopyEx($renderer, $texture2, NULL, new SDL_Rect(100, 100, 100, 100), 0, new SDL_Point(50, 50), SDL_FLIP_NONE) != 0) {
			echo SDL_GetError(), PHP_EOL;
		}

        SDL_SetRenderDrawColor($renderer, 0, 255, 0, 0);
        for($i=0; $i<count($bullets); $i++) {
            $bull = &$bullets[$i];
            $bull['x'] += $bull['vel_x'];
            $bull['y'] += $bull['vel_y'];
            if($bull['x'] >= $screen_width) $bull['x'] = 0-3; else if($bull['x'] <= -3) $bull['x'] = $screen_width;
            if($bull['y'] >= $screen_height) $bull['y'] = 0-3; else if($bull['y'] <= -3) $bull['y'] = $screen_height;
            SDL_RenderDrawPointF($renderer, $bull['x'],     $bull['y']);
            SDL_RenderDrawPointF($renderer, $bull['x'] + 1, $bull['y']);
            SDL_RenderDrawPointF($renderer, $bull['x'],     $bull['y'] + 1);
            SDL_RenderDrawPointF($renderer, $bull['x'] - 1, $bull['y']);
            SDL_RenderDrawPointF($renderer, $bull['x'],     $bull['y'] - 1);

            rendersprite($texture3, 130, (int)$bull['x'], (int)$bull['y'], $spriteindex, $ship['angle'], 16);
        }


$objects = array(
    array('x' => 200, 'y' => 100, 'x_vel' => 0, 'y_vel' => 0, 'angle' => 1, 'speed' => 1, 'radius' => 8, 'mass' => 1),
    array('x' => 400, 'y' => 300, 'x_vel' => 0, 'y_vel' => 0, 'angle' => 1, 'speed' => 1, 'radius' => 8, 'mass' => 1),
    array('x' => 600, 'y' => 500, 'x_vel' => 0, 'y_vel' => 0, 'angle' => 1, 'speed' => 1, 'radius' => 8, 'mass' => 1)
);
 
// Update the objects' positions and velocities
foreach ($objects as &$object) {
    $object['x_vel'] = $object['speed'] * cos($object['angle']);
    $object['y_vel'] = $object['speed'] * sin($object['angle']);
    $object['x'] += $object['x_vel'];
    $object['y'] += $object['y_vel'];
    $object['angle'] += 0.1;
    $object['radius'] = sqrt(pow(($object['x'] - (800 / 2)), 2) + pow(($object['y'] - (600 / 2)), 2));
    $object['mass'] = rand(1, 10);
    
    // Calculate the gravitational force between the objects
    foreach ($objects as &$object2) {
        if ($object !== $object2) {
            $distance = sqrt(pow(($object['x'] - $object2['x']), 2) + pow(($object['y'] - $object2['y']), 2));
            $force = ($object['mass'] * $object2['mass']) / pow($distance, 2);
            $object['x_vel'] += $force * ($object2['x'] - $object['x']);
            $object['y_vel'] += $force * ($object2['y'] - $object['y']);
        $object['x_vel'] *= 0.999;
        $object['y_vel'] *= 0.999;
   $object['x'] += $object['x_vel'];
    $object['y'] += $object['y_vel'];
        }
    }

    // Check if the objects are outside the screen
    if ($object['x'] < 0 || $object['x'] > 800 || $object['y'] < 0 || $object['y'] > 600) {
        // Reverse the velocity
        $object['x_vel'] *= -1;
        $object['y_vel'] *= -1;
    }
    $object['x'] += $object['x_vel'];
    $object['y'] += $object['y_vel'];
}
unset($object);
// Check if the objects are outside the screen
foreach ($objects as &$object) {
 rendersprite($texture3, 130, (int)$object['x'], (int)$object['y'], $spriteindex, 0, 32);
}


		SDL_RenderPresent($renderer);
		$update = false;
	}

	SDL_Delay(5);
	$lasttime = $currenttime;
}

SDL_DestroyTexture($texture);
SDL_DestroyRenderer($renderer);
SDL_DestroyWindow($window);
SDL_Quit();

?>

