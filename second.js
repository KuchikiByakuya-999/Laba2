const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function findLongestChainDestination(pairs) {
  const map = new Map();
  for (const [start, end] of pairs) {
    if (start === end) {
      return "обратитесь к специалисту";
    }
    map.set(start, end);
  }

  const starts = new Set(map.keys());
  for (const end of map.values()) {
    starts.delete(end);
  }

  if (starts.size === 0) {
    return "обратитесь к специалисту";
  }

  let maxDestination = null;
  let maxLength = 0;

  for (const start of starts) {
    let current = start;
    let length = 0;
    while (map.has(current)) {
      current = map.get(current);
      length++;
    }
    if (length > maxLength) {
      maxLength = length;
      maxDestination = current;
    }
  }

  return maxDestination || "не удалось определить конечный пункт";
}

function main() {
  const pairs = [];
  
  function askPair() {
    rl.question('Введите начальный пункт (или "end" для завершения ввода): ', (start) => {
      if (start.toLowerCase() === 'end') {
        if (pairs.length === 0) {
          console.log('Не введено ни одной пары');
          rl.close();
          return;
        }
        
        const result = findLongestChainDestination(pairs);
        console.log(`Итоговый конечный пункт: ${result}`);
        rl.close();
        return;
      }
      
      rl.question('Введите конечный пункт: ', (end) => {
        pairs.push([start, end]);
        askPair();
      });
    });
  }
  
  console.log('Вводите пары пунктов. Для завершения введите "end"');
  askPair();
}

main();