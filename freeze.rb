# frozen_string_literal: true
#
# Topic: `freeze`
# Purpose: Prevent objects from being modified.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Freeze a string
text = "ruby".freeze
puts "Example 1: frozen?=#{text.frozen?}"

# Example 2: Modifying a frozen object raises error
begin
  text << "!"
rescue => e
  puts "Example 2: error=#{e.class}"
end

# Example 3: Freeze an array
arr = [1, 2].freeze
puts "Example 3: frozen?=#{arr.frozen?}"

# Example 4: Freeze is shallow
arr = [[1], [2]].freeze
begin
  arr << [3]
rescue => e
  puts "Example 4: error=#{e.class}"
end
arr[0] << 9
puts "Example 4: inner=#{arr.inspect}"

# Example 5: Dup creates a mutable copy
text = "hello".freeze
copy = text.dup
copy << "!"
puts "Example 5: #{copy}"
