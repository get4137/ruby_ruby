# frozen_string_literal: true
#
# Topic: `even?`
# Purpose: Check parity of integers.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic usage
# output: Example 1: true
puts "Example 1: #{4.even?}"

# Example 2: In a loop
# output: Example 2: 1 even? false
# output: Example 2: 2 even? true
# output: Example 2: 3 even? false
# output: Example 2: 4 even? true
# output: Example 2: 5 even? false
(1..5).each { |n| puts "Example 2: #{n} even? #{n.even?}" }

# Example 3: Filter with `select`
# output: Example 3: [2, 4, 6]
nums = [1, 2, 3, 4, 5, 6]
puts "Example 3: #{nums.select(&:even?).inspect}"

# Example 4: Negative numbers
# output: Example 4: true
puts "Example 4: #{(-2).even?}"

# Example 5: Using with `reject`
# output: Example 5: [1, 3, 5]
puts "Example 5: #{nums.reject(&:even?).inspect}"
