package main

import (
	"bufio"
	"fmt"
	"os"
)

func findFinalDestination(routes [][2]string) string {
	if len(routes) == 0 {
		return "обратитесь к специалисту"
	}

	routeMap := make(map[string]string)
	isDestination := make(map[string]bool)

	for _, route := range routes {
		from := route[0]
		to := route[1]

		if from == to {
			return "обратитесь к специалисту"
		}

		routeMap[from] = to
		isDestination[to] = true
	}

	startPoint := ""
	for _, route := range routes {
		if !isDestination[route[0]] {
			startPoint = route[0]
			break
		}
	}

	if startPoint == "" {
		return "обратитесь к специалисту"
	}

	current := startPoint
	longestPathEnd := current

	for {
		next, exists := routeMap[current]
		if !exists {
			break
		}
		current = next
		longestPathEnd = current
	}

	return longestPathEnd
}

func main() {
	var routes [][2]string
	var n int

	fmt.Print("Введите количество пар маршрутов: ")
	fmt.Scan(&n)
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan() // Очистка буфера после ввода числа

	for i := 0; i < n; i++ {
		var from, to string
		fmt.Printf("Введите начальный пункт %d: ", i+1)
		scanner.Scan()
		from = scanner.Text()

		fmt.Printf("Введите конечный пункт %d: ", i+1)
		scanner.Scan()
		to = scanner.Text()

		routes = append(routes, [2]string{from, to})
	}

	result := findFinalDestination(routes)
	fmt.Printf("Итоговый конечный пункт самой длинной цепочки: %s\n", result)
}
