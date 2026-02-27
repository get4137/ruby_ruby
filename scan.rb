# frozen_string_literal: true
#
# Topic: `scan`
# Purpose: Extract all regex matches from a string.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Scan digits
text = "a1b2c3"
puts "Example 1: #{text.scan(/\d/).inspect}"

# Example 2: Scan words
text = "Ruby is fun"
puts "Example 2: #{text.scan(/\w+/).inspect}"

# Example 3: Scan with capture groups
text = "name: Alice, age: 30"
pairs = text.scan(/(\w+): (\w+)/)
puts "Example 3: #{pairs.inspect}"

# Example 4: Scan and transform
text = "price: 10, price: 20"
prices = text.scan(/\d+/).map(&:to_i)
puts "Example 4: #{prices.inspect}"

# Example 5: No matches returns empty array
text = "hello"
puts "Example 5: #{text.scan(/\d+/).inspect}"
