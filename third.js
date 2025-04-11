const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

function countEvenDigits(num) {
    let count = 0;
    num = Math.abs(num);
    
    do {
        const digit = num % 10;
        if (digit % 2 === 0) count++;
        num = Math.floor(num / 10);
    } while (num !== 0);
    
    return count;
}

async function main() {
    const num = parseInt(await new Promise(resolve => {
        readline.question("Введите кол-во чисел: ", resolve);
    }));
    
    for (let i = 0; i < num; i++) {
        const j = parseInt(await new Promise(resolve => {
            readline.question(`Введите число ${i + 1}: `, resolve);
        }));
        console.log(`Кол-во четных цифр в числе ${j}: ${countEvenDigits(j)}`);
    }
    
    readline.close();
}

main();