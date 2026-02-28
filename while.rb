# frozen_string_literal: true
#
# Topic: `while` and `until`
# Purpose: Loop while a condition is true (or until it becomes true).
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic while loop
# output: Example 1: count=0
# output: Example 1: count=1
# output: Example 1: count=2
count = 0
while count < 3
  puts "Example 1: count=#{count}"
  count += 1
end

# Example 2: While with `next`
# output: Example 2: odd=1
# output: Example 2: odd=3
# output: Example 2: odd=5
count = 0
while count < 5
  count += 1
  next if count.even?
  puts "Example 2: odd=#{count}"
end

# Example 3: While with `break`
# output: Example 3: 0
# output: Example 3: 1
# output: Example 3: 2
count = 0
while count < 10
  break if count == 3
  puts "Example 3: #{count}"
  count += 1
end

# Example 4: Until loop
# output: Example 4: count=0
# output: Example 4: count=1
# output: Example 4: count=2
count = 0
until count >= 3
  puts "Example 4: count=#{count}"
  count += 1
end

# Example 5: Process an array until empty
# output: Example 5: popped=3
# output: Example 5: popped=2
# output: Example 5: popped=1
numbers = [1, 2, 3]
while !numbers.empty?
  puts "Example 5: popped=#{numbers.pop}"
end

# Example 6: Nested while
# output: Example 6: outer=0, inner=0
# output: Example 6: outer=0, inner=1
# output: Example 6: outer=1, inner=0
# output: Example 6: outer=1, inner=1
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
# output: Example 7: x=1
# output: Example 7: x=2
x = 0
puts "Example 7: x=#{x}" while (x += 1) < 3

# Example 8: Simulated input processing
# output: Example 8: input=yes
# output: Example 8: input=no
inputs = %w[yes no yes stop]
index = 0
while (value = inputs[index]) != "stop"
  puts "Example 8: input=#{value}"
  index += 1
end
