# frozen_string_literal: true
#
# Topic: `each_slice`
# Purpose: Process elements in fixed-size batches.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic slicing
numbers = [1, 2, 3, 4, 5, 6]
result = []
numbers.each_slice(2) { |slice| result << slice }
puts "Example 1: #{result.inspect}"

# Example 2: Uneven last slice
numbers = [1, 2, 3, 4, 5]
result = []
numbers.each_slice(2) { |slice| result << slice }
puts "Example 2: #{result.inspect}"

# Example 3: Sum each slice
numbers = [1, 2, 3, 4, 5, 6]
sums = numbers.each_slice(3).map { |slice| slice.sum }
puts "Example 3: #{sums.inspect}"

# Example 4: Each_slice without a block returns an enumerator
enum = numbers.each_slice(2)
puts "Example 4: #{enum.class}"

# Example 5: Build a hash of indexed slices
numbers = [1, 2, 3, 4]
indexed = {}
numbers.each_slice(2).with_index { |slice, i| indexed[i] = slice }
puts "Example 5: #{indexed.inspect}"
