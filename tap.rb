# frozen_string_literal: true
#
# Topic: `tap`
# Purpose: Inspect or modify an object in a chain without changing the return value.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Tap for debugging
value = "ruby"
result = value.tap { |v| puts "Example 1: before=#{v}" }.upcase
puts "Example 1: after=#{result}"

# Example 2: Tap to build and return the object
hash = {}.tap do |h|
  h[:a] = 1
  h[:b] = 2
end
puts "Example 2: #{hash.inspect}"

# Example 3: Tap in a pipeline
result = [1, 2, 3]
  .tap { |arr| arr << 4 }
  .map { |n| n * 2 }
puts "Example 3: #{result.inspect}"

# Example 4: Tap does not change return value
value = "hello"
result = value.tap { |v| v.upcase! }
puts "Example 4: #{result}"

# Example 5: Tap with conditional logic
result = "ruby".tap { |v| v << "!" if v.length < 5 }
puts "Example 5: #{result}"
