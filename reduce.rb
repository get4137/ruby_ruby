# frozen_string_literal: true
#
# Topic: `reduce` / `inject`
# Purpose: Accumulate values into a single result.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Sum with an initial value
# output: Example 1: 10
numbers = [1, 2, 3, 4]
sum = numbers.reduce(0) { |acc, n| acc + n }
puts "Example 1: #{sum}"

# Example 2: Product
# output: Example 2: 24
product = numbers.reduce(1) { |acc, n| acc * n }
puts "Example 2: #{product}"

# Example 3: Using a symbol
# output: Example 3: 10
sum_symbol = numbers.reduce(:+)
puts "Example 3: #{sum_symbol}"

# Example 4: Accumulate into a hash
# output: Example 4: {"apple"=>2, "banana"=>1, "cherry"=>1}
words = %w[apple banana apple cherry]
counts = words.reduce(Hash.new(0)) do |acc, word|
  acc[word] += 1
  acc
end
puts "Example 4: #{counts.inspect}"

# Example 5: Find longest string
# output: Example 5: elephant
longest = %w[cat elephant dog].reduce do |acc, word|
  acc.length >= word.length ? acc : word
end
puts "Example 5: #{longest}"

# Example 6: Build a string with a separator
# output: Example 6: a-b-c
joined = %w[a b c].reduce { |acc, char| "#{acc}-#{char}" }
puts "Example 6: #{joined}"
