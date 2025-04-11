function countEvenDigits(num: number): number {
    let count = 0;
    num = Math.abs(num);
    
    do {
        const digit = num % 10;
        if (digit % 2 === 0) count++;
        num = Math.floor(num / 10);
    } while (num !== 0);
    
    return count;
}

function main(): void {
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.question('Введите кол-во чисел: ', (numStr: string) => {
        const num = parseInt(numStr);
        
        let count = 0;
        const processNumber = () => {
            if (count < num) {
                rl.question(`Введите число ${count + 1}: `, (jStr: string) => {
                    const j = parseInt(jStr);
                    console.log(`Кол-во четных цифр в числе ${j}: ${countEvenDigits(j)}`);
                    count++;
                    processNumber();
                });
            } else {
                rl.close();
            }
        };
        
        processNumber();
    });
}

main();