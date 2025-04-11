import Foundation

func findSubstrings(in s: String) -> [String] {
    var result = [String]()
    let characters = Array(s)
    let n = characters.count
    var i = 0
    
    while i < n {
        if characters[i] == "1" {
            // Вариант 1: 11[0]1
            if i+1 < n && characters[i+1] == "1" {
                var j = i + 2
                while j < n && characters[j] == "0" { j += 1 }
                if j < n && characters[j] == "1" && j > i + 2 {
                    result.append(String(characters[i...j]))
                    i = j + 1  // Пропускаем все до конца найденной подстроки
                    continue
                }
            }
            
            // Вариант 2: 1[0]1
            var k = i + 1
            while k < n && characters[k] == "0" { k += 1 }
            if k < n && characters[k] == "1" && k > i + 1 {
                result.append(String(characters[i...k]))
                i = k + 1  // Пропускаем все до конца найденной подстроки
                continue
            }
        }
        i += 1
    }
    
    return result
}

// Ввод строки от пользователя
print("Введите строку:")
if let inputString = readLine() {
    let substrings = findSubstrings(in: inputString)
    
    if substrings.isEmpty {
        print("\n")
    } else {
        print("Результат: \(substrings.joined(separator: ", "))")
    }
}