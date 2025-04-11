using System;

class Program
{
    static int CountEvenDigits(int num)
    {
        int count = 0;
        num = Math.Abs(num);
        
        do
        {
            int digit = num % 10;
            if (digit % 2 == 0) count++;
            num /= 10;
        } while (num != 0);
        
        return count;
    }

    static void Main()
    {
        Console.Write("Введите кол-во чисел: ");
        int num = int.Parse(Console.ReadLine());
        
        for (int i = 0; i < num; i++)
        {
            int j = int.Parse(Console.ReadLine());
            Console.WriteLine($"кол-во четных цифр в каждом числе: {j}: ");
            Console.WriteLine(CountEvenDigits(j));
        }
    }
}