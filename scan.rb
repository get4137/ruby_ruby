# frozen_string_literal: true
#
# Topic: `scan`
# Purpose: Extract all regex matches from a string.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Scan digits
# output: Example 1: ["1", "2", "3"]
text = "a1b2c3"
puts "Example 1: #{text.scan(/\d/).inspect}"

# Example 2: Scan words
# output: Example 2: ["Ruby", "is", "fun"]
text = "Ruby is fun"
puts "Example 2: #{text.scan(/\w+/).inspect}"

# Example 3: Scan with capture groups
# output: Example 3: [["name", "Alice"], ["age", "30"]]
text = "name: Alice, age: 30"
pairs = text.scan(/(\w+): (\w+)/)
puts "Example 3: #{pairs.inspect}"

# Example 4: Scan and transform
# output: Example 4: [10, 20]
text = "price: 10, price: 20"
prices = text.scan(/\d+/).map(&:to_i)
puts "Example 4: #{prices.inspect}"

# Example 5: No matches returns empty array
# output: Example 5: []
text = "hello"
puts "Example 5: #{text.scan(/\d+/).inspect}"
