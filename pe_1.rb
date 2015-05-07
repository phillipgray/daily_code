ans_array = []

for num in 1...1000
    if num % 3 == 0 || num % 5 == 0
        ans_array.push(num)
    end
end
sum_array = ans_array.inject(:+)

puts sum_array