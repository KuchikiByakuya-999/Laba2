function findSubstrings(s: string): string[] {
    const result: string[] = [];
    let i = 0;

    while (i < s.length) {
        if (s[i] === '1') {
            const start = i;
            i++;

            if (s[i] === '1') i++;
            if (s[i-1] === '1' && s[i] === '0') {
                while (s[i] === '0') i++;
                if (s[i] === '1') {
                    result.push(s.slice(start, i + 1));
                    i++;
                    continue;
                }
            }
        }
        i++;
    }
    
    return result;
}

function getUserInput(): Promise<string> {
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    return new Promise(resolve => {
        rl.question('Введите строку: ', (input: string) => {
            rl.close();
            resolve(input || '');
        });
    });
}

// Основная функция
async function main() {
    try {
        const inputString = await getUserInput();
        console.log('Введенная строка:', inputString);
        
        const matches = findSubstrings(inputString);
        console.log('Найденные подстроки:', matches.length > 0 ? matches : 'не найдены');
    } catch (err) {
        console.error('Произошла ошибка:', err);
    }
}

// Запуск программы
main();