use std::io;

fn count_even_digits(num: i32) -> i32 {
    let mut count = 0;
    let mut n = num;
    
    if n < 0 {
        n = -n;
    }

    while n != 0 {
        let digit = n % 10;
        if digit % 2 == 0 {
            count += 1;
        }
        n /= 10;
    }

    count
}

fn main() {
    println!("Введите кол-во чисел: ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка чтения строки");
    let num: i32 = input.trim().parse().expect("Ожидалось целое число");

    for _ in 0..num {
        let mut number_input = String::new();
        io::stdin().read_line(&mut number_input).expect("Ошибка чтения строки");
        let j: i32 = number_input.trim().parse().expect("Ожидалось целое число");
        
        println!("кол-во четных цифр в числе: {}: ", j);
        println!("{}", count_even_digits(j));
    }
}