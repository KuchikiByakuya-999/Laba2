#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>

using namespace std;

string findFinalDestination(const vector<pair<string, string>>& routes) {
    if (routes.empty()) {
        return "обратитесь к специалисту";
    }

    unordered_map<string, string> routeMap;
    unordered_map<string, bool> isDestination;

    for (const auto& route : routes) {
        const string& from = route.first;
        const string& to = route.second;

        if (from == to) {
            return "обратитесь к специалисту";
        }

        routeMap[from] = to;
        isDestination[to] = true;
    }

    string startPoint;
    for (const auto& route : routes) {
        if (isDestination.find(route.first) == isDestination.end()) {
            startPoint = route.first;
            break;
        }
    }

    if (startPoint.empty()) {
        return "обратитесь к специалисту";
    }

    string current = startPoint;
    string longestPathEnd = current;

    while (routeMap.find(current) != routeMap.end()) {
        current = routeMap[current];
        longestPathEnd = current;
    }

    return longestPathEnd;
}

int main() {
    vector<pair<string, string>> routes;
    int n;

    cout << "Введите количество пар маршрутов: ";
    cin >> n;
    cin.ignore();

    for (int i = 0; i < n; ++i) {
        string from, to;
        cout << "Введите начальный пункт " << i + 1 << ": ";
        getline(cin, from);
        cout << "Введите конечный пункт " << i + 1 << ": ";
        getline(cin, to);
        routes.emplace_back(from, to);
    }

    string result = findFinalDestination(routes);
    cout << "Итоговый конечный пункт самой длинной цепочки: " << result << endl;

    return 0;
}