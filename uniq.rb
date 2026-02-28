# frozen_string_literal: true
#
# Topic: `uniq` and `uniq!`
# Purpose: Remove duplicate values from arrays.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic uniq
# output: Example 1: [1, 2, 3]
values = [1, 1, 2, 2, 3]
puts "Example 1: #{values.uniq.inspect}"

# Example 2: `uniq` does not mutate
# output: Example 2: [1, 1, 2]
values = [1, 1, 2]
values.uniq
puts "Example 2: #{values.inspect}"

# Example 3: `uniq!` mutates
# output: Example 3: [1, 2]
values = [1, 1, 2]
values.uniq!
puts "Example 3: #{values.inspect}"

# Example 4: `uniq!` returns nil when no changes
# output: Example 4: result=nil
values = [1, 2, 3]
result = values.uniq!
puts "Example 4: result=#{result.inspect}"

# Example 5: Uniq with a block (like `uniq_by`)
# output: Example 5: ["ant", "bear"]
words = %w[ant art arc bear]
puts "Example 5: #{words.uniq { |w| w[0] }.inspect}"
