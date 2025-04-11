def countEvenDigits(num):
    count = 0
    num = abs(num)
    
    while num > 0:
        digit = num % 10
        if digit % 2 == 0:
            count += 1
        num = num // 10
    
    return count



num = int(input())

for _ in range(num):
    j = int(input())
    print(f"Кол-во четных цифр в каждом числе: {j}: {countEvenDigits(j)}")