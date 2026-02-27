# frozen_string_literal: true
#
# Topic: `casecmp`
# Purpose: Compare strings ignoring case.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Equal ignoring case
puts "Example 1: #{"Ruby".casecmp("ruby").inspect}"

# Example 2: Sorting with case-insensitive comparison
words = %w[banana Apple cherry]
sorted = words.sort { |a, b| a.casecmp(b) }
puts "Example 2: #{sorted.inspect}"

# Example 3: Normalize by downcasing
words = %w[banana Apple cherry]
normalized = words.sort_by(&:downcase)
puts "Example 3: #{normalized.inspect}"

# Example 4: `casecmp?` (returns boolean)
if "Ruby".respond_to?(:casecmp?)
  puts "Example 4: #{"Ruby".casecmp?("ruby")}"
end

# Example 5: Compare with nil-safe behavior
value = "Ruby"
other = nil
result = other ? value.casecmp(other) : nil
puts "Example 5: #{result.inspect}"
