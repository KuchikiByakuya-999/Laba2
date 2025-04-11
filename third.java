import java.util.Scanner;

public class third {
    public static int countEvenDigits(int num) {
        int count = 0;
        num = Math.abs(num);
        
        do {
            int digit = num % 10;
            if (digit % 2 == 0) count++;
            num /= 10;
        } while (num != 0);
        
        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите кол-во чисел: ");
        int num = scanner.nextInt();
        
        for (int i = 0; i < num; i++) {
            int j = scanner.nextInt();
            System.out.println("кол-во четных цифр в каждом числе:" + j + ": ");
            System.out.println(countEvenDigits(j) + " ");
        }
        
        scanner.close();
    }
}