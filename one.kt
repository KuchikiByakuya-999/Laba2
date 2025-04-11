fun findSubstrings(input: String): List<String> {
    val result = mutableListOf<String>()
    var i = 0
    val n = input.length
    
    while (i < n - 2) {
        if (input[i] == '1') {
            if (i + 3 < n && input[i+1] == '1') {
                var j = i + 2
                while (j < n && input[j] == '0') {
                    j++
                }
                if (j > i + 2 && j < n && input[j] == '1') {
                    val substring = input.substring(i, j + 1)
                    result.add(substring)
                    i = j + 1
                    continue
                }
            }
            if (i + 2 < n && input[i+1] == '0') {
                var j = i + 1
                while (j < n && input[j] == '0') {
                    j++
                }

                if (j > i + 1 && j < n && input[j] == '1') {
                    val substring = input.substring(i, j + 1)
                    result.add(substring)
                    i = j + 1
                    continue
                }
            }
        }
        i++
    }
    
    return result
}

fun main() {
    println("Введите строку:")
    val input = readLine() ?: ""
    
    val result = findSubstrings(input)
    
    println("Результат:")
    println(result.joinToString(", "))
}