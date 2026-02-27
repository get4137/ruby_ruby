# frozen_string_literal: true
#
# Topic: `even?`
# Purpose: Check parity of integers.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic usage
puts "Example 1: #{4.even?}"

# Example 2: In a loop
(1..5).each { |n| puts "Example 2: #{n} even? #{n.even?}" }

# Example 3: Filter with `select`
nums = [1, 2, 3, 4, 5, 6]
puts "Example 3: #{nums.select(&:even?).inspect}"

# Example 4: Negative numbers
puts "Example 4: #{(-2).even?}"

# Example 5: Using with `reject`
puts "Example 5: #{nums.reject(&:even?).inspect}"
