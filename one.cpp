#include <iostream>
#include <vector>
#include <string>
#include <set>

using namespace std;

vector<string> findSubstrings(const string& s) {
    set<string> unique_substrings;
    int n = s.size();
    
    for (int i = 0; i < n; ) {
        if (s[i] == '1') {
            int start = i;
            i++;
            
            // Вариант 11[0]1
            if (i < n && s[i] == '1') {
                int j = i + 1;
                while (j < n && s[j] == '0') {
                    j++;
                }
                if (j < n && s[j] == '1' && j > i + 1) {
                    unique_substrings.insert(s.substr(start, j - start + 1));
                }
            }
            
            // Вариант 1[0]1
            int k = i;
            while (k < n && s[k] == '0') {
                k++;
            }
            if (k < n && s[k] == '1' && k > i) {
                unique_substrings.insert(s.substr(start, k - start + 1));
            }
            
            if (i == start) i++;
        } else {
            i++;
        }
    }
    
    return vector<string>(unique_substrings.begin(), unique_substrings.end());
}

int main() {
    string s;
    cout << "Введите строку: ";
    cin >> s;
    vector<string> result = findSubstrings(s);
    
    cout << "Результат: ";
    for (size_t i = 0; i < result.size(); ++i) {
        if (i != 0) cout << ", ";
        cout << result[i];
    }
    cout << endl;
    
    return 0;
}