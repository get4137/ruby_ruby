# frozen_string_literal: true

# Example 1: Basic upto - iterating from 0 to a number
max_value = 4
0.upto(max_value) do |i|
  puts "i = #{i}"
end

# Example 2: Nested loops with upto
1.upto(3) do |x|
  x.times do
    puts 'hello'
  end
  puts '-----'
end

# Example 3: Upto with random number guessing game
print 'Your favorite number is: '
target_number = rand(1..50)
puts target_number
1.upto(10) do |attempt|
  puts "Playing attempt #{attempt}"
  guess = rand(1..50)
  if guess == target_number
    puts 'YOU WON!'
    exit
  end
end
puts 'LOSER!'

# Example 4: Upto with user input - number guessing game
puts 'Guess the number (1-99, 9 attempts)'
secret_number = rand(1..99)
max_attempts = 9
1.upto(max_attempts) do |attempt|
  puts "Attempt #{attempt}, attempts remaining: #{max_attempts - attempt}"
  user_guess = gets.to_i
  if user_guess == secret_number
    puts 'GUESSED IT!'
    exit
  elsif user_guess > secret_number
    puts 'No, smaller'
  else
    puts 'No, larger'
  end
end
puts 'LOST!'

# Example 5: Upto with negative numbers
(-5).upto(5) do |num|
  puts "Number: #{num}"
end

# Example 6: Upto with step (using with_each or custom logic)
1.upto(10) do |i|
  puts i if i.even?  # Only even numbers
end

# Example 7: Upto collecting values in array
numbers = []
1.upto(5) do |i|
  numbers << i * 2
end
puts "Doubled numbers: #{numbers.inspect}"

# Example 8: Upto with break - early exit
1.upto(10) do |i|
  puts i
  break if i == 5
end

# Example 9: Upto with next - skipping iterations
1.upto(10) do |i|
  next if i.odd?
  puts "Even number: #{i}"
end

# Example 10: Upto returning enumerator (without block)
enumerator = 1.upto(5)
puts "Enumerator: #{enumerator.class}"
enumerator.each { |n| puts n }

# Example 11: Upto with string interpolation
1.upto(3) do |day|
  puts "Day #{day} of the week"
end

# Example 12: Upto calculating sum
sum = 0
1.upto(100) do |num|
  sum += num
end
puts "Sum from 1 to 100: #{sum}"

# Example 13: Upto calculating factorial
factorial = 1
1.upto(5) do |n|
  factorial *= n
end
puts "5! = #{factorial}"

# Example 14: Upto with conditional logic
1.upto(20) do |num|
  if num % 15 == 0
    puts "FizzBuzz: #{num}"
  elsif num % 3 == 0
    puts "Fizz: #{num}"
  elsif num % 5 == 0
    puts "Buzz: #{num}"
  else
    puts num
  end
end

# Example 15: Upto with method calls
def square(n)
  n * n
end

1.upto(5) do |i|
  puts "Square of #{i} is #{square(i)}"
end

# Example 16: Upto with hash building
squares_hash = {}
1.upto(5) do |num|
  squares_hash[num] = num * num
end
puts "Squares hash: #{squares_hash.inspect}"

# Example 17: Upto with floating point (converted to integer)
1.upto(5.9) do |i|  # 5.9 is converted to 5
  puts i
end

# Example 18: Upto with zero range
5.upto(5) do |i|
  puts "Single iteration: #{i}"
end

# Example 19: Upto with larger range
1.upto(1000) do |i|
  break if i > 10  # Only show first 10
  puts i
end

# Example 20: Upto with yield in custom method
def count_up_to(max)
  1.upto(max) do |i|
    yield i
  end
end

count_up_to(5) do |num|
  puts "Counting: #{num}"
end

# Example 21: Upto with array indexing
fruits = ['apple', 'banana', 'cherry', 'date', 'elderberry']
1.upto(fruits.length) do |index|
  puts "Fruit #{index}: #{fruits[index - 1]}"
end

# Example 22: Upto with string building
result = ""
1.upto(5) do |i|
  result += i.to_s
  result += ", " unless i == 5
end
puts "Result: #{result}"

# Example 23: Upto with redo (restarting iteration)
attempts = 0
1.upto(3) do |i|
  attempts += 1
  print "Enter a number greater than 5: "
  num = gets.to_i
  if num <= 5
    puts "Too small! Restarting iteration."
    redo
  end
  puts "Accepted: #{num}"
end

# Example 24: Upto with retry (in rescue block)
1.upto(3) do |attempt|
  begin
    print "Enter a valid number: "
    value = gets.to_i
    raise "Invalid" if value <= 0
    puts "Valid number: #{value}"
  rescue
    puts "Invalid input on attempt #{attempt}"
    retry if attempt < 3
  end
end

# Example 25: Upto with nested upto
1.upto(3) do |outer|
  1.upto(3) do |inner|
    puts "Outer: #{outer}, Inner: #{inner}"
  end
end

# Example 26: Upto with accumulator pattern
numbers = [10, 20, 30, 40, 50]
sum = 0
1.upto(numbers.length) do |index|
  sum += numbers[index - 1]
end
puts "Sum of array: #{sum}"

# Example 27: Upto with modulo operations
1.upto(12) do |hour|
  display_hour = hour % 12
  display_hour = 12 if display_hour == 0
  am_pm = hour <= 12 ? 'AM' : 'PM'
  puts "#{display_hour}:00 #{am_pm}"
end

# Example 28: Upto with file operations simulation
file_lines = ["Line 1", "Line 2", "Line 3", "Line 4", "Line 5"]
1.upto(file_lines.length) do |line_number|
  puts "Processing line #{line_number}: #{file_lines[line_number - 1]}"
end

# Example 29: Upto with conditional collection
even_numbers = []
1.upto(20) do |num|
  even_numbers << num if num.even?
end
puts "Even numbers: #{even_numbers.inspect}"

# Example 30: Upto with early return pattern
def find_first_match(max)
  1.upto(max) do |num|
    return num if num > 5
  end
  nil
end

result = find_first_match(10)
puts "First match: #{result}"

# Example 31: Upto with block return value
results = 1.upto(5).map do |i|
  i * 2
end
puts "Mapped results: #{results.inspect}"

# Example 32: Upto with select/filter pattern
selected = []
1.upto(10) do |num|
  selected << num if num % 3 == 0
end
puts "Multiples of 3: #{selected.inspect}"

# Example 33: Upto with reduce pattern
product = 1
1.upto(5) do |num|
  product = product * num
end
puts "Product: #{product}"

# Example 34: Upto with string formatting
1.upto(5) do |num|
  formatted = format("%03d", num)  # Zero-padded to 3 digits
  puts "Formatted: #{formatted}"
end

# Example 35: Upto with time simulation
1.upto(24) do |hour|
  puts "Hour #{hour}:00"
end
