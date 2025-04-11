func countEvenDigits(_ num: Int) -> Int {
    var count = 0
    var number = abs(num)
    
    repeat {
        let digit = number % 10
        if digit % 2 == 0 { count += 1 }
        number /= 10
    } while number != 0
    
    return count
}

func main() {
    print("Введите кол-во чисел: ", terminator: "")
    guard let input = readLine(), let num = Int(input) else {
        print("Ошибка ввода")
        return
    }
    
    for _ in 0..<num {
        guard let j = Int(readLine() ?? "") else {
            print("Ошибка ввода числа")
            continue
        }
        print("кол-во четных цифр в каждом числе: \(j): ")
        print(countEvenDigits(j))
    }
}

main()