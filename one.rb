def findSubstrings(s)
    result = []
    i = 0
    n = s.length
  
    while i < n
      if s[i] == '1'
        start = i
        pos = i + 1
        
        # Проверяем необязательную вторую '1'
        if pos < n && s[pos] == '1'
          pos += 1
        end
        
        # Ищем хотя бы один '0'
        zero_start = pos
        while pos < n && s[pos] == '0'
          pos += 1
        end
        
        # Проверяем что были нули и после них идет '1'
        if pos > zero_start && pos < n && s[pos] == '1'
          result << s[start..pos]
          i = pos + 1  # Перескакиваем после найденной подстроки
        else
          i += 1
        end
      else
        i += 1
      end
    end
  
    result
  end
  
  # Ввод строки от пользователя
  print "Введите строку: "
  input_string = gets.chomp
  
  # Поиск подстрок
  substrings = findSubstrings(input_string)
  

  puts "Результат: #{substrings.join(', ')}"
