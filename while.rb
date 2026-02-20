# frozen_string_literal: true
#
# Topic: `while` and `until`
# Purpose: Loop while a condition is true (or until it becomes true).
#
# Example 1: Basic while loop
count = 0
while count < 3
  puts "Example 1: count=#{count}"
  count += 1
end

# Example 2: While with `next`
count = 0
while count < 5
  count += 1
  next if count.even?
  puts "Example 2: odd=#{count}"
end

# Example 3: While with `break`
count = 0
while count < 10
  break if count == 3
  puts "Example 3: #{count}"
  count += 1
end

# Example 4: Until loop
count = 0
until count >= 3
  puts "Example 4: count=#{count}"
  count += 1
end

# Example 5: Process an array until empty
numbers = [1, 2, 3]
while !numbers.empty?
  puts "Example 5: popped=#{numbers.pop}"
end

# Example 6: Nested while
outer = 0
while outer < 2
  inner = 0
  while inner < 2
    puts "Example 6: outer=#{outer}, inner=#{inner}"
    inner += 1
  end
  outer += 1
end

# Example 7: Modifier form
x = 0
puts "Example 7: x=#{x}" while (x += 1) < 3

# Example 8: Simulated input processing
inputs = %w[yes no yes stop]
index = 0
while (value = inputs[index]) != "stop"
  puts "Example 8: input=#{value}"
  index += 1
end
