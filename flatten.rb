# frozen_string_literal: true
#
# Topic: `flatten` and `flatten!`
# Purpose: Convert nested arrays into a single-level array.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic flatten
# output: Example 1: [1, 2, 3, 4, 5]
nested = [1, [2, 3], [4, [5]]]
puts "Example 1: #{nested.flatten.inspect}"

# Example 2: Flatten with a depth limit
# output: Example 2: [1, 2, 3, 4, [5]]
puts "Example 2: #{nested.flatten(1).inspect}"

# Example 3: `flatten!` mutates
# output: Example 3: [1, 2, 3]
list = [1, [2, 3]]
list.flatten!
puts "Example 3: #{list.inspect}"

# Example 4: `flatten!` returns nil if no changes
# output: Example 4: result=nil
list = [1, 2, 3]
result = list.flatten!
puts "Example 4: result=#{result.inspect}"

# Example 5: Flatten an empty array
# output: Example 5: []
puts "Example 5: #{[].flatten.inspect}"
