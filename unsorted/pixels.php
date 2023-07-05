<?php

declare(strict_types=1);

const WINDOW_WIDTH = 640;
const WINDOW_HEIGHT = 400;

SDL_Init(SDL_INIT_VIDEO);
$window = SDL_CreateWindow("Drawing lines on screen", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN);
$renderer = SDL_CreateRenderer($window, 0, SDL_RENDERER_ACCELERATED);

srand(time());

$points = Array();
for($i=0; $i<8; $i++) {
    $points[] = Array('x' => (float)rand(0, WINDOW_WIDTH), 'y' => (float)rand(0, WINDOW_HEIGHT), 'vel_x' => (float)-0.5 + (float)rand(0, 10) / 10, 'vel_y' => (float)-0.5 + (float)rand(0, 10) / 10, 'c' => new SDL_Color(0, 0, 0, 255));
}

function tone() {
//    $cmd = "~/Dokumente/Skripte/Sandbox/sinewave " . rand(440, 880) . " " . rand(100, 500);
//    exec($cmd . " > /dev/null &");
}


// Draw points
function points(&$points, $renderer)
{
#    global $points;
    foreach($points as &$point) {
        SDL_SetRenderDrawColor($renderer, $point['c']->r, $point['c']->g, $point['c']->b, $point['c']->a);
        SDL_RenderDrawPointF($renderer, (float) $point['x'], $point['y']);
    }
}

// move points
function movepoints(&$points, $renderer)
{
    foreach($points as &$point) {
        #  $point['vel_x'] = (float)rand(0, 10) / 10; $point['vel_x'] = (float)rand(0, 10) / 10;
        if($point['x'] < 0 || $point['x'] > WINDOW_WIDTH-1) { $point['vel_x'] = -$point['vel_x']; tone(); }
        if($point['y'] < 0 || $point['y'] > WINDOW_HEIGHT-1) { $point['vel_y'] = -$point['vel_y']; tone(); }
        $point['x'] += $point['vel_x'];
        $point['y'] += $point['vel_y'];
       # if($point['x'] < 0 || $point['x'] > WINDOW_WIDTH-1) { $point['x'] -= $point['vel_x']; }
       # if($point['y'] < 0 || $point['y'] > WINDOW_HEIGHT-1) { $point['y'] -= $point['vel_y']; }

    }
}

$microtime = microtime(true);
$thistime = microtime(true);
$lasttime = microtime(true);

// Wait for quit event
$event = new SDL_Event;
while (true) {
    $thistime = microtime(true) - $lasttime;

    if (SDL_PollEvent($event) && $event->type == SDL_QUIT) {
        break;
    }
    // Clear screen
    SDL_SetRenderDrawColor($renderer, 255, 255, 255, 255);
    SDL_RenderClear($renderer);

    movepoints($points, $renderer);
    points($points, $renderer);

    SDL_RenderPresent($renderer);
    
    SDL_Delay(5);

    $lasttime = microtime(true);
}

SDL_DestroyRenderer($renderer);
SDL_DestroyWindow($window);
SDL_Quit();
