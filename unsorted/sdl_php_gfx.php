<?php
/*
    2023 crypticode
*/

/* https://stackoverflow.com/questions/1201200/fast-algorithm-for-drawing-filled-circles */
function DrawFilledCircle($renderer, $x0, $y0, $radius)
{
    $x = $radius;
    $y = 0;
    $xChange = 1 - ($radius << 1);
    $yChange = 0;
    $radiusError = 0;

    while ($x >= $y)
    {
        for ($i = $x0 - $x; $i <= $x0 + $x; $i++)
        {
            SDL_RenderDrawPointF($renderer, $i, $y0 + $y);
            SDL_RenderDrawPointF($renderer, $i, $y0 - $y);
        }
        for ($i = $x0 - $y; $i <= $x0 + $y; $i++)
        {
            SDL_RenderDrawPointF($renderer, $i, $y0 + $x);
            SDL_RenderDrawPointF($renderer, $i, $y0 - $x);
        }

        $y++;
        $radiusError += $yChange;
        $yChange += 2;
        if ((($radiusError << 1) + $xChange) > 0)
        {
            $x--;
            $radiusError += $xChange;
            $xChange += 2;
        }
    }
}

/* https://stackoverflow.com/questions/38334081/how-to-draw-circles-arcs-and-vector-graphics-in-sdl */
function DrawCircle($renderer, $centreX, $centreY, $radius)
{
   $diameter = ($radius * 2);

   $x = ($radius - 1);
   $y = 0;
   $tx = 1;
   $ty = 1;
   $error = ($tx - $diameter);

   while ($x >= $y)
   {
      //  Each of the following renders an octant of the circle
      SDL_RenderDrawPoint($renderer, $centreX + $x, $centreY - $y);
      SDL_RenderDrawPoint($renderer, $centreX + $x, $centreY + $y);
      SDL_RenderDrawPoint($renderer, $centreX - $x, $centreY - $y);
      SDL_RenderDrawPoint($renderer, $centreX - $x, $centreY + $y);
      SDL_RenderDrawPoint($renderer, $centreX + $y, $centreY - $x);
      SDL_RenderDrawPoint($renderer, $centreX + $y, $centreY + $x);
      SDL_RenderDrawPoint($renderer, $centreX - $y, $centreY - $x);
      SDL_RenderDrawPoint($renderer, $centreX - $y, $centreY + $x);

      if ($error <= 0)
      {
         ++$y;
         $error += $ty;
         $ty += 2;
      }

      if ($error > 0)
      {
         --$x;
         $tx += 2;
         $error += ($tx - $diameter);
      }
   }
}

?>