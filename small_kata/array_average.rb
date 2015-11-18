def array_average(numbers)
  return 0 if numbers.empty?
  sum = 0.0
  numbers.each {|num| sum += num}
  sum / numbers.length
end