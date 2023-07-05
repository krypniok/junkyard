<?php
/*
    Proof that
    
        A² + B² = C² + (B - 4) * B

    Is true For every 3 subsequent natural numbers.

    And

        (A² + B²) - C² + (A² - (C² - B²)) = 0

    only for 3, 4, 5
    and     -1, 0, 1


TODO:
Do it with odd number sequence only
9 + 1 = 1 + 9
-1 + 1 = 9 - 8
1² + 3² = 5² - 15  +0
3² + 5² = 7² - 15  -8   
5² + 7² = 9² - 7  +16
7    9 = 11² + 9  +24
9   11 = 13² + 33 +32
11² 13² = 15² + 65 +40 
13  15   17    + 105 +48
15  17  19    + 153

0 1 2 = 9  -  4
1 2 3 = 16 -  2
2 3 4 = 25 +  4
3 4 5 = 36 + 14
4 5 6 = 49 + 28
5 6 7 = 64 + 46
6 7 8 = 81 + 68

*/

echo "a²\t+\tb²\t=\tc²\t+\t(b - 4) * b\n";
echo "-----------------------------------------------------------\n";
for($a=1; $a<1000000; $a++) {
    $b = $a + 1;
    $c = $b + 1;
    $a2 = pow($a, 2);
    $b2 = pow($b, 2);
    $c2 = pow($c, 2);
    $c3 = $a2 * $b2;
    $b3 = $b - 4;
    $result = ($a2 + $b2) - $c2 + ($a2 - ($c2 - $b2));

    if($result == 0) {
        echo "HIT: \t";
        echo "$a2\t+\t$b2\t=\t$c2\t+\t$b3 * $b\t($result)\n";
    }
}

?>