def find_final_destination(routes):
    if not routes:
        return "обратитесь к специалисту"

    route_map = {}
    is_destination = {}

    for from_city, to_city in routes:
        if from_city == to_city:
            return "обратитесь к специалисту"

        route_map[from_city] = to_city
        is_destination[to_city] = True

    start_point = None
    for from_city, _ in routes:
        if from_city not in is_destination:
            start_point = from_city
            break

    if not start_point:
        return "обратитесь к специалисту"

    current = start_point
    longest_path_end = current

    while current in route_map:
        current = route_map[current]
        longest_path_end = current

    return longest_path_end


routes = []
n = int(input("Введите количество пар маршрутов: "))

for i in range(n):
    from_city = input(f"Введите начальный пункт {i + 1}: ")
    to_city = input(f"Введите конечный пункт {i + 1}: ")
    routes.append((from_city, to_city))

result = find_final_destination(routes)
print(f"Итоговый конечный пункт самой длинной цепочки: {result}")