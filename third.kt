import java.util.Scanner

fun countEvenDigits(num: Int): Int {
    var count = 0
    var number = Math.abs(num)
    
    do {
        val digit = number % 10
        if (digit % 2 == 0) count++
        number /= 10
    } while (number != 0)
    
    return count
}

fun main() {
    val scanner = Scanner(System.`in`)
    print("Введите кол-во чисел: ")
    val num = scanner.nextInt()
    
    for (i in 0 until num) {
        val j = scanner.nextInt()
        println("кол-во четных цифр в каждом числе:$j: ")
        println("${countEvenDigits(j)} ")
    }
    
    scanner.close()
}