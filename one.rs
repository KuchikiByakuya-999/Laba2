use std::io;

fn findSubstrings(s: &str) -> Vec<String> {
    let mut result = Vec::new();
    let bytes = s.as_bytes();
    let n = bytes.len();
    let mut i = 0;

    while i < n {
        if bytes[i] == b'1' {
            let start = i;
            let mut end = i + 1;
            
            if end < n && bytes[end] == b'1' {
                end += 1;
            }
            
            let mut zero_pos = end;
            while zero_pos < n && bytes[zero_pos] == b'0' {
                zero_pos += 1;
            }
            
            if zero_pos > end && zero_pos < n && bytes[zero_pos] == b'1' {
                end = zero_pos + 1;
                result.push(String::from_utf8_lossy(&bytes[start..end]).to_string());
                i = end;
                continue;
            }
        }
        i += 1;
    }

    result
}

fn main() {
    println!("Введите строку:");
    let mut input_string = String::new();
    
    io::stdin()
        .read_line(&mut input_string)
        .expect("Не удалось прочитать строку");
    
    input_string = input_string.trim().to_string();
    
    let substrings = findSubstrings(&input_string);
    
    println!("Результат:");
    for substr in substrings {
        println!("{}", substr);
    }
}