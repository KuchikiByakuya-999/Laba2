const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function findLongestChainDestination(pairs: [string, string][]): string {
  const map = new Map<string, string>();
  
  for (let i = 0; i < pairs.length; i++) {
    const [start, end] = pairs[i];
    if (start === end) {
      return "обратитесь к специалисту";
    }
    map.set(start, end);
  }

  const starts = new Set<string>(map.keys());
  
  const mapValues = Array.from(map.values());
  for (let i = 0; i < mapValues.length; i++) {
    starts.delete(mapValues[i]);
  }

  if (starts.size === 0) {
    return "обратитесь к специалисту";
  }

  let maxDestination: string | null = null;
  let maxLength = 0;
  const startArray = Array.from(starts);
  for (let i = 0; i < startArray.length; i++) {
    let current = startArray[i];
    let length = 0;
    while (map.has(current)) {
      current = map.get(current)!;
      length++;
    }
    if (length > maxLength) {
      maxLength = length;
      maxDestination = current;
    }
  }

  return maxDestination || "не удалось определить конечный пункт";
}

function main(): void {
  const pairs: [string, string][] = [];
  
  function askPair(): void {
    rl.question('Введите начальный пункт (или "end" для завершения ввода): ', (start: string) => {
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
      
      rl.question('Введите конечный пункт: ', (end: string) => {
        pairs.push([start, end]);
        askPair();
      });
    });
  }
  
  console.log('Вводите пары пунктов. Для завершения введите "end"');
  askPair();
}

main();