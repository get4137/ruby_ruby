# frozen_string_literal: true
#
# Topic: `select` and `reject`
# Purpose: Filter collections based on a predicate.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Select from an array
# output: Example 1: [2, 4, 6]
numbers = [1, 2, 3, 4, 5, 6]
puts "Example 1: #{numbers.select(&:even?).inspect}"

# Example 2: Reject from an array
# output: Example 2: [1, 3, 5]
puts "Example 2: #{numbers.reject(&:even?).inspect}"

# Example 3: Select on a hash
# output: Example 3: {:alice=>90, :charlie=>88}
scores = { alice: 90, bob: 75, charlie: 88 }
passed = scores.select { |_name, score| score >= 80 }
puts "Example 3: #{passed.inspect}"

# Example 4: Reject on a hash
# output: Example 4: {:bob=>75}
failed = scores.reject { |_name, score| score >= 80 }
puts "Example 4: #{failed.inspect}"

# Example 5: Select with index
# output: Example 5: [["a", 0], ["c", 2]]
values = %w[a b c d]
selected = values.each_with_index.select { |_value, index| index.even? }
puts "Example 5: #{selected.inspect}"

# Example 6: `select` with ranges
# output: Example 6: ["bear", "elephant"]
words = %w[ant bear cat dog elephant]
long_words = words.select { |word| word.length >= 4 }
puts "Example 6: #{long_words.inspect}"

# Example 7: `reject` is often clearer than double negatives
# output: Example 7: [2, 4, 6]
clear = numbers.reject { |n| n.odd? }
puts "Example 7: #{clear.inspect}"
