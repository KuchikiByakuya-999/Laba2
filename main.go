package main

import (
	"bufio"
	"fmt"
	"os"
)

func findPatternSubstrings(s string) []string {
	var result []string
	n := len(s)
	i := 0

	for i < n-2 {
		if s[i] == '1' {
			start := i
			patternStart := i

			if i+1 < n && s[i+1] == '1' {
				i++
			}
			zeroStart := i + 1
			zeroCount := 0
			for zeroStart < n && s[zeroStart] == '0' {
				zeroCount++
				zeroStart++
			}

			if zeroCount > 0 && zeroStart < n && s[zeroStart] == '1' {
				end := zeroStart
				found := s[start : end+1]

				exists := false
				for _, v := range result {
					if v == found {
						exists = true
						break
					}
				}

				if !exists {
					result = append(result, found)
				}

				i = end
				continue
			}

			i = patternStart + 1
		} else {
			i++
		}
	}

	return result
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Введите строку: ")
	input, _ := reader.ReadString('\n')
	if len(input) > 0 {
		input = input[:len(input)-1]
	}

	substrings := findPatternSubstrings(input)
	fmt.Println("Результат:", substrings)
}
