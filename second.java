package second;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

public class second {
    public static String findFinalDestination(List<String[]> routes) {
        if (routes.isEmpty()) {
            return "обратитесь к специалисту";
        }

        Map<String, String> routeMap = new HashMap<>();
        Map<String, Boolean> isDestination = new HashMap<>();

        for (String[] route : routes) {
            String from = route[0];
            String to = route[1];

            if (from.equals(to)) {
                return "обратитесь к специалисту";
            }

            routeMap.put(from, to);
            isDestination.put(to, true);
        }

        String startPoint = null;
        for (String[] route : routes) {
            if (!isDestination.containsKey(route[0])) {
                startPoint = route[0];
                break;
            }
        }

        if (startPoint == null) {
            return "обратитесь к специалисту";
        }

        String current = startPoint;
        String longestPathEnd = current;

        while (routeMap.containsKey(current)) {
            current = routeMap.get(current);
            longestPathEnd = current;
        }

        return longestPathEnd;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<String[]> routes = new ArrayList<>();
        
        System.out.print("Введите количество пар маршрутов: ");
        int n = scanner.nextInt();
        scanner.nextLine(); // Очистка буфера после ввода числа

        for (int i = 0; i < n; ++i) {
            System.out.print("Введите начальный пункт " + (i + 1) + ": ");
            String from = scanner.nextLine();
            System.out.print("Введите конечный пункт " + (i + 1) + ": ");
            String to = scanner.nextLine();
            routes.add(new String[]{from, to});
        }

        String result = findFinalDestination(routes);
        System.out.println("Итоговый конечный пункт самой длинной цепочки: " + result);
    }
}