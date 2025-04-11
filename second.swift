import Foundation

func findFinalDestination(_ routes: [(String, String)]) -> String {
    if routes.isEmpty {
        return "обратитесь к специалисту"
    }
    
    var routeMap = [String: String]()
    var isDestination = [String: Bool]()
    
    for route in routes {
        let from = route.0
        let to = route.1
        
        if from == to {
            return "обратитесь к специалисту"
        }
        
        routeMap[from] = to
        isDestination[to] = true
    }
    
    var startPoint: String?
    for route in routes {
        if isDestination[route.0] == nil {
            startPoint = route.0
            break
        }
    }
    
    guard let start = startPoint else {
        return "обратитесь к специалисту"
    }
    
    var current = start
    var longestPathEnd = current
    
    while let next = routeMap[current] {
        current = next
        longestPathEnd = current
    }
    
    return longestPathEnd
}

func main() {
    var routes = [(String, String)]()
    
    print("Введите количество пар маршрутов: ", terminator: "")
    guard let n = Int(readLine() ?? "") else {
        print("Некорректный ввод")
        return
    }
    
    for i in 0..<n {
        print("Введите начальный пункт \(i + 1): ", terminator: "")
        let from = readLine() ?? ""
        print("Введите конечный пункт \(i + 1): ", terminator: "")
        let to = readLine() ?? ""
        routes.append((from, to))
    }
    
    let result = findFinalDestination(routes)
    print("Итоговый конечный пункт самой длинной цепочки: \(result)")
}

// Вызов основной функции
main()