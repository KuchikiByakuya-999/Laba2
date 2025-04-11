use std::collections::HashMap;
use std::io;

fn find_final_destination(routes: Vec<(String, String)>) -> String {
    if routes.is_empty() {
        return "обратитесь к специалисту".to_string();
    }

    let mut route_map = HashMap::new();
    let mut is_destination = HashMap::new();

    for (from, to) in &routes {
        if from == to {
            return "обратитесь к специалисту".to_string();
        }

        route_map.insert(from.clone(), to.clone());
        is_destination.insert(to.clone(), true);
    }

    let start_point = routes.iter()
        .find(|(from, _)| !is_destination.contains_key(from))
        .map(|(from, _)| from.clone());

    let start_point = match start_point {
        Some(point) => point,
        None => return "обратитесь к специалисту".to_string(),
    };

    let mut current = start_point;
    let mut longest_path_end = current.clone();

    while let Some(next) = route_map.get(&current) {
        current = next.clone();
        longest_path_end = current.clone();
    }

    longest_path_end
}

fn main() {
    let mut routes = Vec::new();
    let mut n = String::new();

    println!("Введите количество пар маршрутов: ");
    io::stdin().read_line(&mut n).expect("Ошибка чтения");
    let n: usize = n.trim().parse().expect("Введите число");

    for i in 0..n {
        let mut from = String::new();
        let mut to = String::new();

        println!("Введите начальный пункт {}: ", i + 1);
        io::stdin().read_line(&mut from).expect("Ошибка чтения");
        let from = from.trim().to_string();

        println!("Введите конечный пункт {}: ", i + 1);
        io::stdin().read_line(&mut to).expect("Ошибка чтения");
        let to = to.trim().to_string();

        routes.push((from, to));
    }

    let result = find_final_destination(routes);
    println!("Итоговый конечный пункт самой длинной цепочки: {}", result);
}