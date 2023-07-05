<?php

# I guess i dont really want it
declare(strict_types=1);

include("sdl_php_gfx.php");

const WINDOW_WIDTH = 640;
const WINDOW_HEIGHT = 480;

SDL_Init(SDL_INIT_VIDEO);
$window = SDL_CreateWindow("Drawing lines on screen", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN); //| SDL_WINDOW_FULLSCREEN);
$renderer = SDL_CreateRenderer($window, 0, SDL_RENDERER_ACCELERATED);

srand(time());

$points = Array();
for($i=0; $i<32; $i++) {
    $randrad = rand(8, 16);
    $points[] = Array('x' => (float)rand($randrad, WINDOW_WIDTH-$randrad*2), 'y' => (float)rand($randrad, WINDOW_HEIGHT-$randrad*2), 'vel_x' => (float)-0.5 + (float)rand(0, 10) / 10, 'vel_y' => (float)-0.5 + (float)rand(0, 10) / 10, 'c' => new SDL_Color(rand(0, 255), rand(0, 255), rand(0, 255), 255),
                      'radius' => $randrad);
}

function tone() {
    $cmd = "~/Dokumente/Skripte/Sandbox/sinewave " . rand(440, 880) . " " . rand(20, 40);
    exec($cmd . " > /dev/null &");
}


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



// Draw points
function points(&$points, $renderer)
{
#    global $points;
    foreach($points as &$point) {
        SDL_SetRenderDrawColor($renderer, $point['c']->r, $point['c']->g, $point['c']->b, $point['c']->a);
        //DL_RenderDrawPointF($renderer, (float) $point['x'], $point['y']);
        DrawCircle($renderer, (int)$point['x'], (int)$point['y'], (int)$point['radius']);
    }
}

// move points
function movepoints(&$points, $renderer)
{
    foreach($points as $index1 => &$point) {
        $r = $point['radius'];

        //$point['vel_x'] = (float)rand(0, 10) / 10; $point['vel_y'] = (float)rand(0, 10) / 10;

        if($point['x'] < $r || $point['x'] > WINDOW_WIDTH - $r) { $point['vel_x'] = -$point['vel_x'];  }
        if($point['y'] < $r || $point['y'] > WINDOW_HEIGHT - $r) { $point['vel_y'] = -$point['vel_y'];  }
        $point['x'] += $point['vel_x'];
        $point['y'] += $point['vel_y'];
       # if($point['x'] < 0 || $point['x'] > WINDOW_WIDTH-1) { $point['x'] -= $point['vel_x']; }
       # if($point['y'] < 0 || $point['y'] > WINDOW_HEIGHT-1) { $point['y'] -= $point['vel_y']; }
        foreach($points as $index2 => &$point2) {
            $r2 = $point2['radius'];
            if($point2 != $point) {
                $dist_x = abs($point2['x'] - $point['x']);
                $dist_y = abs($point2['y'] - $point['y']);

                /*
                // Avoid the square root
                https://flatredball.com/documentation/tutorials/math/circle-collision/
                */

                //$dist_l = sqrt($dist_x * $dist_x + $dist_y * $dist_y);
                $dist_ls = ($dist_x * $dist_x + $dist_y * $dist_y);
                #echo "distance = $dist_l\n";
                if($dist_ls <= ($r+$r2)*($r+$r2) ) {
                    $point['x'] -= $point['vel_x'];
                    $point['y'] -= $point['vel_y'];

                    $point['vel_x'] = -$point['vel_x'];
                    $point['vel_y'] = -$point['vel_y'];
                    $point2['vel_x'] = -$point2['vel_x'];
                    $point2['vel_y'] = -$point2['vel_y'];
                    
                    //$point['vel_x'] = $point2['vel_x'];
                    //$point['vel_y'] = $point2['vel_y'];
                    $point['x'] = rand($r*2, WINDOW_WIDTH-$r*2);
                    $point['y'] = rand($r*2, WINDOW_HEIGHT-$r*2);
                    $point2['x'] = rand($r2*2, WINDOW_WIDTH-$r2*2);
                    $point2['y'] = rand($r2*2, WINDOW_HEIGHT-$r2*2);

                    $point['vel_x'] = 0+10/rand(1, 100);
                    $point['vel_y'] = 0+10/rand(1, 100);
                    $point2['vel_x'] = 0+10/rand(1, 100);
                    $point2['vel_y'] = 0+10/rand(1, 100);
                    
                    tone();
                   // return;
                }
                
                if($dist_ls < ($r+$r2)*($r+$r2)) { 
                    $grid_x = (int)($point2['x'] / 16); 
                    $grid_y = (int)($point2['y'] / 16);
                    $color = new SDL_Color(128, 128, 128, 255);
                    $color->r = 255;
                    echo "\rdistance = $dist_ls | lets call it contact $grid_x $grid_y";

                    $point['radius'] -= 1;
                    $point2['radius'] += 1;


                    if( $point['radius'] == 0) {
                        unset($points[$index1]);
                    }
                    if( $point2['radius'] == 0) {
                        unset($points[$index2]);
                    }

                    //return;
                }
            }
        }
    }
}


$microtime = microtime(true);
$thistime = microtime(true);
$lasttime = microtime(true);

$x = 1;
$y = 1;
$quit = false;

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
                }
            break;
		}
	}

    SDL_SetWindowTitle($window, "Scene #1, 0 Fps, " . count($points) . " Cell(s)");

    // Clear screen
    SDL_SetRenderDrawColor($renderer, 255, 255, 255, 255);
    SDL_RenderClear($renderer);

    drawgrid($renderer);

    $grid_x = (int)($x / 16); 
    $grid_y = (int)($y / 16);
    $rect = new SDL_Rect(96, 96, 16, 16);;
    $rect->x = 1;
    $color = new SDL_Color(128, 128, 128, 255);
    $color->r = 255;

    SDL_SetRenderDrawColor($renderer, $color->r, $color->g, $color->b, $color->a);

    movepoints($points, $renderer);
    points($points, $renderer);


    SDL_SetRenderDrawColor($renderer, $color->r, $color->g, $color->b, $color->a);
    SDL_RenderFillRect($renderer, new SDL_Rect((int)(16*$grid_x), (int)(16*$grid_y), 16, 16));
    SDL_RenderPresent($renderer);
    
    SDL_Delay(5);

    $lasttime = microtime(true);
}

SDL_DestroyRenderer($renderer);
SDL_DestroyWindow($window);
SDL_Quit();
