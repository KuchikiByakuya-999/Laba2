package main

import (
	"fmt"
)

func countEvenDigits(num int) int {
	count := 0
	n := num
	if n < 0 {
		n = -n
	}

	for n != 0 {
		digit := n % 10
		if digit%2 == 0 {
			count++
		}
		n /= 10
	}

	return count
}

func main() {
	var num int
	fmt.Print("Введите кол-во чисел: ")
	fmt.Scan(&num)

	for i := 0; i < num; i++ {
		var j int
		fmt.Scan(&j)
		fmt.Printf("кол-во четных цифр в каждом числе: %d: \n", j)
		fmt.Printf("%d \n", countEvenDigits(j))
	}
}
