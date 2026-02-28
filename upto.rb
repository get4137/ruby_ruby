# frozen_string_literal: true
#
# Topic: `upto`
# Purpose: Iterate from a starting integer up to a limit.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic `upto`
# output: Example 1: i=0
# output: Example 1: i=1
# output: Example 1: i=2
# output: Example 1: i=3
0.upto(3) { |i| puts "Example 1: i=#{i}" }

# Example 2: `upto` returns an enumerator without a block
# output: Example 2: Enumerator
enum = 1.upto(3)
puts "Example 2: #{enum.class}"

# Example 3: Build a sum
# output: Example 3: 15
sum = 0
1.upto(5) { |n| sum += n }
puts "Example 3: #{sum}"

# Example 4: Build a hash
# output: Example 4: {1=>1, 2=>4, 3=>9, 4=>16}
squares = {}
1.upto(4) { |n| squares[n] = n * n }
puts "Example 4: #{squares.inspect}"

# Example 5: Skip iterations with `next`
# output: Example 5: even=2
# output: Example 5: even=4
# output: Example 5: even=6
1.upto(6) do |n|
  next if n.odd?
  puts "Example 5: even=#{n}"
end

# Example 6: Early exit with `break`
# output: Example 6: 1
# output: Example 6: 2
# output: Example 6: 3
1.upto(10) do |n|
  break if n > 3
  puts "Example 6: #{n}"
end

# Example 7: `upto` with a custom method
# output: Example 7: 1
# output: Example 7: 4
# output: Example 7: 9

def square(n)
  n * n
end

1.upto(3) { |n| puts "Example 7: #{square(n)}" }

# Example 8: String building
# output: Example 8: 123
result = String.new
1.upto(3) { |n| result << n.to_s }
puts "Example 8: #{result}"
