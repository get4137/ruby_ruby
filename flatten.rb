# frozen_string_literal: true
#
# Topic: `flatten` and `flatten!`
# Purpose: Convert nested arrays into a single-level array.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic flatten
nested = [1, [2, 3], [4, [5]]]
puts "Example 1: #{nested.flatten.inspect}"

# Example 2: Flatten with a depth limit
puts "Example 2: #{nested.flatten(1).inspect}"

# Example 3: `flatten!` mutates
list = [1, [2, 3]]
list.flatten!
puts "Example 3: #{list.inspect}"

# Example 4: `flatten!` returns nil if no changes
list = [1, 2, 3]
result = list.flatten!
puts "Example 4: result=#{result.inspect}"

# Example 5: Flatten an empty array
puts "Example 5: #{[].flatten.inspect}"
