#include <iostream>

using namespace std;

int countEvenDigits(int num) {
    int count = 0;
    num = abs(num);
    
    do {
        int digit = num % 10;
        if (digit % 2 == 0) count++;
        num /= 10;
    } while (num != 0);
    
    return count;
}

int main() {
    int num;
    cout << "Введите кол-во чисел: ";
    cin >> num;
    
    for (int i = 0; i < num; i++) {
        int j;
        cin >> j;
        cout << "кол-во четных цифр в каждом числе:" << j << ": \n";
        cout << countEvenDigits(j) << " \n";
    }
    
    return 0;
}