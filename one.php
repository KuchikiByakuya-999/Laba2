<?php
function findSubstrings($s) {
    $result = [];
    $n = strlen($s);
    $i = 0;
    
    while ($i < $n - 2) {
        if ($s[$i] == '1') {
            $start = $i;
            $next_pos = $i + 1;
            
            if ($i + 1 < $n && $s[$i + 1] == '1') {
                $j = $i + 2;

                while ($j < $n && $s[$j] == '0') {
                    $j++;
                }

                if ($j < $n && $s[$j] == '1' && ($j - ($i + 2)) > 0) {
                    $result[] = substr($s, $i, $j - $i + 1);
                    $i = $j + 1;
                    continue;
                }
            }
            
            $j = $i + 1;

            while ($j < $n && $s[$j] == '0') {
                $j++;
            }

            if ($j < $n && $s[$j] == '1' && ($j - ($i + 1)) > 0) {
                $result[] = substr($s, $i, $j - $i + 1);
                $i = $j + 1;
                continue;
            }
            
            $i++;
        } else {
            $i++;
        }
    }
    
    return $result;
}

echo "Введите строку: ";
$input = trim(fgets(STDIN));
$result = findSubstrings($input);
echo "Результат: " . implode(', ', $result) . "\n";

?>