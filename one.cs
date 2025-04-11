using System;
using System.Collections.Generic;

class Program
{
    static List<string> FindSubstrings(string s)
    {
        List<string> result = new List<string>();
        int i = 0;
        int n = s.Length;
        
        while (i < n - 2)
        {

            if (s[i] == '1' && s[i+1] == '1')
            {
                int zerosStart = i + 2;
                int zerosEnd = zerosStart;
                
                while (zerosEnd < n && s[zerosEnd] == '0')
                {
                    zerosEnd++;
                }
                
                if (zerosEnd > zerosStart && zerosEnd < n && s[zerosEnd] == '1')
                {
                    string match = s.Substring(i, zerosEnd - i + 1);
                    result.Add(match);
                    i = zerosEnd + 1;
                    continue;
                }
            }
            
            if (s[i] == '1')
            {
                int zerosStart = i + 1;
                int zerosEnd = zerosStart;
                
                while (zerosEnd < n && s[zerosEnd] == '0')
                {
                    zerosEnd++;
                }
                

                if (zerosEnd > zerosStart && zerosEnd < n && s[zerosEnd] == '1')
                {
                    string match = s.Substring(i, zerosEnd - i + 1);
                    result.Add(match);
                    i = zerosEnd + 1;
                    continue;
                }
            }
            
            i++;
        }
        
        return result;
    }

    static void Main()
    {
        Console.WriteLine("Введите строку:");
        string input = Console.ReadLine();
        
        List<string> matches = FindSubstrings(input);
        
        Console.WriteLine("\nРезультат:");
        foreach (string match in matches)
        {
            Console.WriteLine(match);
        }
    }
}