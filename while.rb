# frozen_string_literal: true

# Example 1: Basic while loop - condition-based iteration
answer = 'Y'
while answer == 'Y'
  puts 'continue? (Y/N) '
  answer = gets.strip.capitalize
end

# Example 2: Infinite while loop with break - user input collection
phonebook = {}
while true
  print 'enter name (Enter to stop): '
  name = gets.strip.capitalize
  if name == ''
    break
  end
  print 'enter phone number: '
  number = gets.strip
  phonebook[name] = number
end
puts phonebook

# Example 3: Loop with exit - dictionary lookup
dictionary = {
  'dog' => 'a loyal pet',
  'cat' => 'an independent pet',
  'girl' => 'a young female'
}
loop do
  print 'enter the word: '
  eng = gets.strip
  if eng == ''
    exit
  end
  puts dictionary[eng]
end

# Example 4: While loop with counter - iterating with yield
def iterate_with_counter
  x = 0
  while x < 5
    yield x, 55
    x += 1
  end
end
iterate_with_counter { |i, v| puts "Something, index #{i}, value: #{v}" }

# Example 5: While loop reading file line by line
input = File.open('test.txt', 'r')
while (line = input.gets)
  puts line
end
input.close

# Example 6: While loop with conditional processing
input = File.open('test.txt', 'r')
while (line = input.gets)
  line.strip!
  if line.size == 6
    puts line
  end
end
input.close

# Example 7: While loop with next - skipping iterations
counter = 0
while counter < 10
  counter += 1
  if counter.even?
    next
  end
  puts "Odd number: #{counter}"
end

# Example 8: While loop processing array until empty
numbers = [1, 2, 3, 4, 5]
sum = 0
while !numbers.empty?
  sum += numbers.pop
end
puts "Sum: #{sum}"

# Example 9: While loop with multiple conditions
x = 0
y = 10
while x < 5 && y > 5
  puts "x: #{x}, y: #{y}"
  x += 1
  y -= 1
end

# Example 10: While loop with until condition (alternative syntax)
count = 0
until count >= 5
  puts "Count: #{count}"
  count += 1
end

# Example 11: While loop with redo - restarting current iteration
attempts = 0
max_attempts = 3
while attempts < max_attempts
  print "Enter a number greater than 10: "
  number = gets.to_i
  if number <= 10
    puts "Too small! Try again."
    redo
  end
  puts "Great! You entered #{number}"
  attempts += 1
end

# Example 12: While loop with begin-end-while (post-test loop)
begin
  print "Enter 'yes' to continue: "
  answer = gets.strip.downcase
end while answer != 'yes'
puts "Thank you!"

# Example 13: While loop with nested conditions
outer = 0
while outer < 3
  inner = 0
  while inner < 3
    puts "Outer: #{outer}, Inner: #{inner}"
    inner += 1
  end
  outer += 1
end

# Example 14: While loop with break from nested loop
i = 0
while i < 5
  j = 0
  while j < 5
    if i * j > 10
      break  # Breaks inner loop only
    end
    puts "i: #{i}, j: #{j}"
    j += 1
  end
  i += 1
end

# Example 15: While loop with modifier (one-liner)
x = 0
puts x while (x += 1) < 5

# Example 16: While loop with array manipulation
items = ['apple', 'banana', 'cherry', 'date']
while items.length > 0
  item = items.shift
  puts "Processing: #{item}"
end

# Example 17: While loop with hash iteration
scores = { 'Alice' => 85, 'Bob' => 92, 'Charlie' => 78 }
keys = scores.keys
while keys.length > 0
  key = keys.shift
  puts "#{key}: #{scores[key]}"
end

# Example 18: While loop with retry (in rescue block)
attempts = 0
begin
  attempts += 1
  print "Enter a valid email: "
  email = gets.strip
  raise "Invalid email" unless email.include?('@')
  puts "Email accepted: #{email}"
rescue
  if attempts < 3
    puts "Invalid format. Try again."
    retry
  else
    puts "Too many attempts!"
  end
end

# Example 19: While loop with file reading (safer with ensure)
file = File.open('test.txt', 'r')
begin
  while (line = file.gets)
    puts line.chomp
  end
ensure
  file.close
end

# Example 20: While loop with complex condition
temperature = 100
pressure = 50
while temperature > 0 && pressure < 100 || temperature > 50
  puts "Temp: #{temperature}, Pressure: #{pressure}"
  temperature -= 10
  pressure += 5
  break if temperature < 0
end

# Example 21: While loop simulating do-while behavior
value = nil
loop do
  print "Enter a positive number: "
  value = gets.to_i
  break if value > 0
  puts "Invalid! Must be positive."
end
puts "You entered: #{value}"

# Example 22: While loop with accumulator pattern
numbers = [1, 2, 3, 4, 5]
index = 0
product = 1
while index < numbers.length
  product *= numbers[index]
  index += 1
end
puts "Product: #{product}"

# Example 23: While loop with string processing
text = "Hello World"
index = 0
while index < text.length
  puts "Character at #{index}: #{text[index]}"
  index += 1
end

# Example 24: While loop with early exit conditions
counter = 0
target = 7
while counter < 10
  counter += 1
  if counter == target
    puts "Found target: #{target}"
    break
  end
  puts "Counter: #{counter}"
end
