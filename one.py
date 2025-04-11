def findSubstrings(s):
    n = len(s)
    result = set()
    i = 0
    while i < n:
        if s[i] == '1':

            j = i + 1
            while j < n and s[j] == '0':
                j += 1
            if j > i + 1 and j < n and s[j] == '1':
                result.add(s[i:j+1])
            
            if i + 1 < n and s[i + 1] == '1':
                k = i + 2
                while k < n and s[k] == '0':
                    k += 1
                if k > i + 2 and k < n and s[k] == '1':
                    result.add(s[i:k+1])
        i += 1
    return result


s = input("Введите строку: ")
print("Результат: ", *findSubstrings(s)) 