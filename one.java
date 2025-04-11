package first;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class one {
    public static List<String> findSubstrings(String s) {
        List<String> result = new ArrayList<>();
        int n = s.length();
        int i = 0;

        while (i < n) {
            if (s.charAt(i) == '1') {
                int start = i;
                i++;


                boolean hasSecondOne = (i < n && s.charAt(i) == '1');
                if (hasSecondOne) {
                    i++;
                }

                int zeroCount = 0;
                while (i < n && s.charAt(i) == '0') {
                    zeroCount++;
                    i++;
                }

                if (zeroCount > 0 && i < n && s.charAt(i) == '1') {
                    result.add(s.substring(start, i + 1));
                    i++;
                } else {
                    i = start + 1;
                }
            } else {
                i++;
            }
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите строку: ");
        String inputString = scanner.nextLine();
        List<String> substrings = findSubstrings(inputString);

        System.out.println("Результат: " + String.join(", ", substrings));

        scanner.close();
    }
}