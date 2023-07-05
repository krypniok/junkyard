<?php

# I guess i dont really want it
declare(strict_types=1);

include("sdl_php_gfx.php");

define('M_PI_180', M_PI / 180);

const WINDOW_WIDTH = 640;
const WINDOW_HEIGHT = 480;

SDL_Init(SDL_INIT_VIDEO);
$window = SDL_CreateWindow("Drawing lines on screen", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN); //| SDL_WINDOW_FULLSCREEN);
$renderer = SDL_CreateRenderer($window, 0, SDL_RENDERER_ACCELERATED);

srand(time());

function sinewave($freq, $ms) { $cmd = "~/Dokumente/Skripte/Sandbox/sinewave $freq $ms"; exec($cmd . " > /dev/null &"); }

// Draw grid
function drawgrid($renderer) {
    SDL_SetRenderDrawColor($renderer, 0, 0, 0, 255);
    for($y=0; $y<WINDOW_HEIGHT; $y+=16) {
        for($x=0; $x<WINDOW_WIDTH; $x+=16) {
            SDL_RenderDrawLine($renderer, $x, $y, $x, WINDOW_HEIGHT-1);
        }
        SDL_RenderDrawLine($renderer, 0, $y, WINDOW_WIDTH-1, $y);
    }
    SDL_SetRenderDrawColor($renderer, 255, 0, 0, 255);
}


$microtime = microtime(true);
$thistime = microtime(true);
$lasttime = microtime(true);

$x = 1;
$y = 1;
$quit = false;

$mass_x = 0;
$mass_y = 0;
$mass_d = 1.0;

$null_x = -128;
$null_y = 0;
$null_a = 0;

function movemass() {
    global $mass_x, $mass_y, $mass_d;
    $mass_x += $mass_d;
    if($mass_x <= -112) $mass_d = -$mass_d;
    if($mass_x >= 112) $mass_d = -$mass_d;

}



function rotate_point($cx, $cy, $angle, &$px, &$py) {
  $s = sin($angle * M_PI_180);
  $c = cos($angle * M_PI_180);

  // translate point back to origin:
  $x = $px;
  $y = $py;

  $x -= $cx;
  $y -= $cy;

  // rotate point
  $xnew = $x * $c - $y * $s;
  $ynew = $x * $s + $y * $c;

  // translate point back:
  $px = $xnew + $cx;
  $py = $ynew + $cy;

 # echo "angle = $angle\n";
}

function fliehkraftvektor($x, $y, $x0, $y0, $m, $v, &$Fx, &$Fy) {
    $r = sqrt(($x - $x0)*($x - $x0) + ($y - $y0)*($y - $y0));    //radius
    if($r < 1) $r = 1;
    $w = $v/$r;  //winkelgeschwindigkeit
    $Fx = -$m*$w*$w*($x - $x0);  //x-Komponente des Fliehkraftvektors
    $Fy = -$m*$w*$w*($y - $y0);  //y-Komponente des Fliehkraftvektors
}


$angle = 0;
$clear = 1;

// Wait for quit event
$event = new SDL_Event;
while (!$quit) {
    $thistime = microtime(true) - $lasttime;

    if (SDL_PollEvent($event)) {
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
                        case SDLK_F1:
                            $clear = !$clear;
                        case SDLK_SPACE:
                            $mass_d = -1;
                }
            break;
		}
	}

   # SDL_SetWindowTitle($window, "Scene #$scene, $fps FPS");

    // Clear screen
    SDL_SetRenderDrawColor($renderer, 255, 255, 255, 255);
    if($clear) SDL_RenderClear($renderer);

   # drawgrid($renderer);

    $grid_x = (int)($x / 16); 
    $grid_y = (int)($y / 16);
   # $rect = new SDL_Rect(96, 96, 16, 16);;
   # $rect->x = 1;


    SDL_SetRenderDrawColor($renderer, 0, 0, 0, 255);
    DrawCircle($renderer, (int)320, (int)240, (int)128);

   
    SDL_SetRenderDrawColor($renderer, 128, 128, 128, 255);
    DrawFilledCircle($renderer, (int)320+$mass_x, (int)240+$mass_y, (int)16);

   // $mass_d *= 0.9;

    $px = 320+$mass_x;
    $py = 240+$mass_y;

    if($mass_x < 0) {
        $angle = (abs($mass_x)/224)*180;
    } else {
        $angle = (-abs($mass_x)/224)*180;
    }
   
    if($mass_d < 0 ) {
        rotate_point(320, 240, $angle, $px, $py);
    } else {
        rotate_point(320, 240, 180-$angle, $px, $py);
    }
    
    SDL_SetRenderDrawColor($renderer, 128, 128, 128, 255);
    DrawFilledCircle($renderer, (int)0+$px, (int)0+$py, (int)16);

    $x = $px-320;
    $y = $py-240; // Position des beweglichen Punkts
    $x0 = 0.0;
    $y0 = -32.0; // Position des fixen Punkts
    $m = 1.0; // Masse des beweglichen Punkts
    $v = 1.0; // Geschwindigkeit des beweglichen Punkts
    $Fx = 0;
    $Fy = 0; // Fliehkraftvektor
    fliehkraftvektor($x, $y, $x0, $y0, $m, $v, $Fx, $Fy);

    SDL_SetRenderDrawColor($renderer, 64, 64, 255, 255);
//    echo "$Fx, $Fy\n";
    $zoom = 32;
    SDL_RenderDrawLine($renderer, (int)$px, (int)$py, 320+(int)($mass_x), 240+(int)($mass_y));

    $px = 320+$null_x;
    $py = 240+$null_y;
    $null_a = abs((360/448)*(abs($mass_x)));

    if($mass_x < 0) {  
        if($mass_d < 0)
            rotate_point(320, 240, $null_a, $px, $py);
        else
            rotate_point(320, 240, 90+abs(90-$null_a), $px, $py);
    }
    else {
        if($mass_d > 0)
            rotate_point(320, 240, 180+abs($null_a), $px, $py);
        else
            rotate_point(320, 240, 270+90-abs($null_a), $px, $py);
    }

    SDL_SetRenderDrawColor($renderer, 255, 64, 64, 255);
    DrawFilledCircle($renderer, (int)$px, (int)$py, (int)8);

    $px -= 320;
    $py -= 240;
    $px = -$px;
    $py = -$py;
    $px += 320;
    $py += 240;
    

    SDL_SetRenderDrawColor($renderer, 64, 255, 64, 255);
    DrawFilledCircle($renderer, (int)$px, (int)$py, (int)8);

    movemass();

#    SDL_RenderFillRect($renderer, new SDL_Rect((int)(16*$grid_x), (int)(16*$grid_y), 16, 16));
    SDL_RenderPresent($renderer);
    
    SDL_Delay(5);

    $lasttime = microtime(true);
}

SDL_DestroyRenderer($renderer);
SDL_DestroyWindow($window);
SDL_Quit();
