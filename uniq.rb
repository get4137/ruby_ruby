# frozen_string_literal: true
#
# Topic: `uniq` and `uniq!`
# Purpose: Remove duplicate values from arrays.
#
# Example 1: Basic uniq
values = [1, 1, 2, 2, 3]
puts "Example 1: #{values.uniq.inspect}"

# Example 2: `uniq` does not mutate
values = [1, 1, 2]
values.uniq
puts "Example 2: #{values.inspect}"

# Example 3: `uniq!` mutates
values = [1, 1, 2]
values.uniq!
puts "Example 3: #{values.inspect}"

# Example 4: `uniq!` returns nil when no changes
values = [1, 2, 3]
result = values.uniq!
puts "Example 4: result=#{result.inspect}"

# Example 5: Uniq with a block (like `uniq_by`)
words = %w[ant art arc bear]
puts "Example 5: #{words.uniq { |w| w[0] }.inspect}"
