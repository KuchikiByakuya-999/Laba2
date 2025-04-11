def count_even_digits(num)
  count = 0
  num = num.abs
  
  begin
    digit = num % 10
    count += 1 if digit % 2 == 0
    num /= 10
  end until num == 0
  
  count
end

print "Введите кол-во чисел: "
num = gets.chomp.to_i

(0...num).each do |i|
  print "Введите число #{i + 1}: "
  j = gets.chomp.to_i
  puts "кол-во четных цифр в числе #{j}: "
  puts count_even_digits(j)
end