# frozen_string_literal: true
#
# Topic: `each_slice`
# Purpose: Process elements in fixed-size batches.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic slicing
# output: Example 1: [[1, 2], [3, 4], [5, 6]]
numbers = [1, 2, 3, 4, 5, 6]
result = []
numbers.each_slice(2) { |slice| result << slice }
puts "Example 1: #{result.inspect}"

# Example 2: Uneven last slice
# output: Example 2: [[1, 2], [3, 4], [5]]
numbers = [1, 2, 3, 4, 5]
result = []
numbers.each_slice(2) { |slice| result << slice }
puts "Example 2: #{result.inspect}"

# Example 3: Sum each slice
# output: Example 3: [6, 15]
numbers = [1, 2, 3, 4, 5, 6]
sums = numbers.each_slice(3).map { |slice| slice.sum }
puts "Example 3: #{sums.inspect}"

# Example 4: Each_slice without a block returns an enumerator
# output: Example 4: Enumerator
enum = numbers.each_slice(2)
puts "Example 4: #{enum.class}"

# Example 5: Build a hash of indexed slices
# output: Example 5: {0=>[1, 2], 1=>[3, 4]}
numbers = [1, 2, 3, 4]
indexed = {}
numbers.each_slice(2).with_index { |slice, i| indexed[i] = slice }
puts "Example 5: #{indexed.inspect}"
