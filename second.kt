import java.util.*

fun findFinalDestination(routes: List<Pair<String, String>>): String {
    if (routes.isEmpty()) {
        return "обратитесь к специалисту"
    }

    val routeMap = mutableMapOf<String, String>()
    val isDestination = mutableMapOf<String, Boolean>()

    for (route in routes) {
        val from = route.first
        val to = route.second

        if (from == to) {
            return "обратитесь к специалисту"
        }

        routeMap[from] = to
        isDestination[to] = true
    }

    var startPoint = ""
    for (route in routes) {
        if (!isDestination.containsKey(route.first)) {
            startPoint = route.first
            break
        }
    }

    if (startPoint.isEmpty()) {
        return "обратитесь к специалисту"
    }

    var current = startPoint
    var longestPathEnd = current

    while (routeMap.containsKey(current)) {
        current = routeMap[current]!!
        longestPathEnd = current
    }

    return longestPathEnd
}

fun main() {
    val routes = mutableListOf<Pair<String, String>>()
    val scanner = Scanner(System.`in`)

    print("Введите количество пар маршрутов: ")
    val n = scanner.nextInt()
    scanner.nextLine() // Очистка буфера после ввода числа

    for (i in 0 until n) {
        print("Введите начальный пункт ${i + 1}: ")
        val from = scanner.nextLine()
        print("Введите конечный пункт ${i + 1}: ")
        val to = scanner.nextLine()
        routes.add(Pair(from, to))
    }

    val result = findFinalDestination(routes)
    println("Итоговый конечный пункт самой длинной цепочки: $result")
}