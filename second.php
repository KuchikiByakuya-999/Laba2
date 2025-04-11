<?php

function findFinalDestination($routes) {
    if (empty($routes)) {
        return "обратитесь к специалисту";
    }

    $routeMap = array();
    $isDestination = array();

    foreach ($routes as $route) {
        $from = $route['from'];
        $to = $route['to'];

        if ($from == $to) {
            return "обратитесь к специалисту";
        }

        $routeMap[$from] = $to;
        $isDestination[$to] = true;
    }

    $startPoint = "";
    foreach ($routes as $route) {
        if (!isset($isDestination[$route['from']])) {
            $startPoint = $route['from'];
            break;
        }
    }

    if (empty($startPoint)) {
        return "обратитесь к специалисту";
    }

    $current = $startPoint;
    $longestPathEnd = $current;

    while (isset($routeMap[$current])) {
        $current = $routeMap[$current];
        $longestPathEnd = $current;
    }

    return $longestPathEnd;
}

echo "Введите количество пар маршрутов: ";
$n = intval(trim(fgets(STDIN)));
$routes = array();

for ($i = 0; $i < $n; ++$i) {
    echo "Введите начальный пункт " . ($i + 1) . ": ";
    $from = trim(fgets(STDIN));
    echo "Введите конечный пункт " . ($i + 1) . ": ";
    $to = trim(fgets(STDIN));
    $routes[] = array('from' => $from, 'to' => $to);
}

$result = findFinalDestination($routes);
echo "Итоговый конечный пункт самой длинной цепочки: " . $result . "\n";

?>