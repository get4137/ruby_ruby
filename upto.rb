# frozen_string_literal: true
#
# Topic: `upto`
# Purpose: Iterate from a starting integer up to a limit.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic `upto`
0.upto(3) { |i| puts "Example 1: i=#{i}" }

# Example 2: `upto` returns an enumerator without a block
enum = 1.upto(3)
puts "Example 2: #{enum.class}"

# Example 3: Build a sum
sum = 0
1.upto(5) { |n| sum += n }
puts "Example 3: #{sum}"

# Example 4: Build a hash
squares = {}
1.upto(4) { |n| squares[n] = n * n }
puts "Example 4: #{squares.inspect}"

# Example 5: Skip iterations with `next`
1.upto(6) do |n|
  next if n.odd?
  puts "Example 5: even=#{n}"
end

# Example 6: Early exit with `break`
1.upto(10) do |n|
  break if n > 3
  puts "Example 6: #{n}"
end

# Example 7: `upto` with a custom method

def square(n)
  n * n
end

1.upto(3) { |n| puts "Example 7: #{square(n)}" }

# Example 8: String building
result = ""
1.upto(3) { |n| result << n.to_s }
puts "Example 8: #{result}"
