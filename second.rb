def find_final_destination(routes)
    return "обратитесь к специалисту" if routes.empty?
  
    route_map = {}
    is_destination = {}
  
    routes.each do |from, to|
      if from == to
        return "обратитесь к специалисту"
      end
  
      route_map[from] = to
      is_destination[to] = true
    end
  
    start_point = nil
    routes.each do |from, to|
      unless is_destination.key?(from)
        start_point = from
        break
      end
    end
  
    return "обратитесь к специалисту" if start_point.nil?
  
    current = start_point
    longest_path_end = current
  
    while route_map.key?(current)
      current = route_map[current]
      longest_path_end = current
    end
  
    longest_path_end
  end
  
  puts "Введите количество пар маршрутов: "
  n = gets.chomp.to_i
  
  routes = []
  n.times do |i|
    puts "Введите начальный пункт #{i + 1}: "
    from = gets.chomp
    puts "Введите конечный пункт #{i + 1}: "
    to = gets.chomp
    routes << [from, to]
  end
  
  result = find_final_destination(routes)
  puts "Итоговый конечный пункт самой длинной цепочки: #{result}"