# frozen_string_literal: true

# Example 1: Basic times with block parameter - single line syntax
5.times { |i| puts "i = #{i}" }

# Example 2: Basic times with block parameter - multi-line syntax
5.times do |i|
  puts "i = #{i}"
end

# Example 3: Nested times loops - counting iterations
total_iterations = 0
10.times do
  100.times do
    total_iterations += 1
  end
end
puts "Total iterations: #{total_iterations}"

# Example 4: Times without block parameter - just repeat action
3.times do
  puts "Hello!"
end

# Example 5: Times collecting values in array
squares = []
5.times do |i|
  squares << i * i
end
puts "Squares: #{squares.inspect}"

# Example 6: Times with break - early exit
5.times do |i|
  puts i
  break if i == 2
end

# Example 7: Times with next - skipping iterations
5.times do |i|
  next if i.even?
  puts "Odd index: #{i}"
end

# Example 8: Times with conditional logic
5.times do |i|
  if i.odd?
    puts "#{i} is odd"
  else
    puts "#{i} is even"
  end
end

# Example 9: Times returning enumerator (without block)
enumerator = 5.times
puts "Enumerator class: #{enumerator.class}"
enumerator.each { |n| puts "Number: #{n}" }

# Example 10: Times calculating sum
sum = 0
10.times do |i|
  sum += i
end
puts "Sum from 0 to 9: #{sum}"

# Example 11: Times calculating factorial
factorial = 1
5.times do |i|
  factorial *= (i + 1)
end
puts "5! = #{factorial}"

# Example 12: Times with string building
result = ""
5.times do |i|
  result += i.to_s
  result += ", " unless i == 4
end
puts "Result: #{result}"

# Example 13: Times with hash building
squares_hash = {}
5.times do |i|
  squares_hash[i] = i * i
end
puts "Squares hash: #{squares_hash.inspect}"

# Example 14: Times with array indexing
fruits = ['apple', 'banana', 'cherry', 'date', 'elderberry']
fruits.length.times do |i|
  puts "Fruit #{i}: #{fruits[i]}"
end

# Example 15: Times with method calls
def greet(name)
  "Hello, #{name}!"
end

3.times do |i|
  puts greet("Person #{i + 1}")
end

# Example 16: Times with zero iterations
0.times do |i|
  puts "This won't print"
end
puts "Zero times executed"

# Example 17: Times with large number
1000.times do |i|
  break if i >= 5  # Only show first 5
  puts "Iteration: #{i}"
end

# Example 18: Times with yield in custom method
def repeat_action(count)
  count.times do |i|
    yield i
  end
end

repeat_action(3) do |iteration|
  puts "Action #{iteration}"
end

# Example 19: Times with accumulator pattern
numbers = [10, 20, 30, 40, 50]
sum = 0
numbers.length.times do |i|
  sum += numbers[i]
end
puts "Sum of array: #{sum}"

# Example 20: Times with redo (restarting iteration)
attempts = 0
3.times do |i|
  attempts += 1
  print "Enter a number greater than 5: "
  num = gets.to_i
  if num <= 5
    puts "Too small! Restarting iteration."
    redo
  end
  puts "Accepted: #{num}"
end

# Example 21: Times with retry (in rescue block)
3.times do |attempt|
  begin
    print "Enter a valid number: "
    value = gets.to_i
    raise "Invalid" if value <= 0
    puts "Valid number: #{value}"
  rescue
    puts "Invalid input on attempt #{attempt}"
    retry if attempt < 2
  end
end

# Example 22: Times with nested times
3.times do |outer|
  3.times do |inner|
    puts "Outer: #{outer}, Inner: #{inner}"
  end
end

# Example 23: Times with modulo operations
12.times do |hour|
  display_hour = hour % 12
  display_hour = 12 if display_hour == 0
  am_pm = hour < 12 ? 'AM' : 'PM'
  puts "#{display_hour}:00 #{am_pm}"
end

# Example 24: Times with file operations simulation
file_lines = ["Line 1", "Line 2", "Line 3", "Line 4", "Line 5"]
file_lines.length.times do |line_number|
  puts "Processing line #{line_number}: #{file_lines[line_number]}"
end

# Example 25: Times with conditional collection
even_numbers = []
10.times do |num|
  even_numbers << num if num.even?
end
puts "Even numbers: #{even_numbers.inspect}"

# Example 26: Times with early return pattern
def find_first_match(max_iterations)
  max_iterations.times do |i|
    return i if i > 5
  end
  nil
end

result = find_first_match(10)
puts "First match: #{result}"

# Example 27: Times with block return value
results = 5.times.map do |i|
  i * 2
end
puts "Mapped results: #{results.inspect}"

# Example 28: Times with select/filter pattern
selected = []
10.times do |num|
  selected << num if num % 3 == 0
end
puts "Multiples of 3: #{selected.inspect}"

# Example 29: Times with reduce pattern
product = 1
5.times do |i|
  product = product * (i + 1)
end
puts "Product: #{product}"

# Example 30: Times with string formatting
5.times do |num|
  formatted = format("%03d", num)  # Zero-padded to 3 digits
  puts "Formatted: #{formatted}"
end

# Example 31: Times with time simulation
24.times do |hour|
  puts "Hour #{hour}:00"
end

# Example 32: Times with FizzBuzz pattern
15.times do |num|
  if num % 15 == 0 && num > 0
    puts "FizzBuzz: #{num}"
  elsif num % 3 == 0 && num > 0
    puts "Fizz: #{num}"
  elsif num % 5 == 0 && num > 0
    puts "Buzz: #{num}"
  else
    puts num
  end
end

# Example 33: Times with variable count
count = 3
count.times do |i|
  puts "Iteration #{i} of #{count}"
end

# Example 34: Times with calculation in condition
(2 + 3).times do |i|
  puts "Calculated count: #{i}"
end

# Example 35: Times with negative number (returns enumerator, no execution)
enumerator = (-5).times
puts "Negative times returns: #{enumerator.class}"

# Example 36: Times with float (converted to integer)
5.9.times do |i|
  puts "Float converted: #{i}"
end

# Example 37: Times building multiplication table
5.times do |i|
  5.times do |j|
    result = (i + 1) * (j + 1)
    print "#{result}\t"
  end
  puts
end

# Example 38: Times with pattern generation
5.times do |i|
  stars = "*" * (i + 1)
  puts stars
end

# Example 39: Times with reverse pattern
5.times do |i|
  stars = "*" * (5 - i)
  puts stars
end

# Example 40: Times with random number generation
random_numbers = []
5.times do
  random_numbers << rand(1..100)
end
puts "Random numbers: #{random_numbers.inspect}"

# Example 41: Times with user input collection
names = []
3.times do |i|
  print "Enter name #{i + 1}: "
  names << gets.strip
end
puts "Names collected: #{names.inspect}"

# Example 42: Times with counter reset
counter = 0
5.times do |i|
  counter += 1
  puts "Counter: #{counter}, Index: #{i}"
end

# Example 43: Times with method chaining
result = 5.times.select { |i| i.even? }
puts "Even indices: #{result.inspect}"

# Example 44: Times with each_with_index alternative
items = ['a', 'b', 'c']
items.length.times do |i|
  puts "Item #{i}: #{items[i]}"
end

# Example 45: Times with early break and value
found = nil
10.times do |i|
  if i == 7
    found = i
    break
  end
end
puts "Found value: #{found}"
