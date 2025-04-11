<?php
function countEvenDigits($num) {
    $count = 0;
    $num = abs($num);
    
    do {
        $digit = $num % 10;
        if ($digit % 2 == 0) $count++;
        $num = (int)($num / 10);
    } while ($num != 0);
    
    return $count;
}

echo "Введите кол-во чисел: ";
$num = trim(fgets(STDIN));

for ($i = 0; $i < $num; $i++) {
    $j = trim(fgets(STDIN));
    echo "кол-во четных цифр в каждом числе:" . $j . ": \n";
    echo countEvenDigits($j) . " \n";
}
?>