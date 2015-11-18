ans_array = []

for num in range(0, 1000):
    if num % 3 == 0 or num % 5 == 0:
        ans_array.append(num)
sum_array = sum(ans_array)
print sum_array
