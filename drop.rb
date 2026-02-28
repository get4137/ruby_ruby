# frozen_string_literal: true
#
# Topic: `drop` and `drop_while`
# Purpose: Remove leading items without mutating the receiver.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic drop
# output: Example 1: [3, 4, 5]
items = [1, 2, 3, 4, 5]
puts "Example 1: #{items.drop(2).inspect}"

# Example 2: `drop` does not modify the original
# output: Example 2: [1, 2, 3]
items = [1, 2, 3]
items.drop(1)
puts "Example 2: #{items.inspect}"

# Example 3: Drop more than size returns empty
# output: Example 3: []
items = [1, 2, 3]
puts "Example 3: #{items.drop(10).inspect}"

# Example 4: Drop from empty array
# output: Example 4: []
items = []
puts "Example 4: #{items.drop(2).inspect}"

# Example 5: Negative drop raises ArgumentError
# output: Example 5: error=ArgumentError
begin
  [1, 2, 3].drop(-1)
rescue => e
  puts "Example 5: error=#{e.class}"
end

# Example 6: `drop` on a range
# output: Example 6: [6, 7, 8, 9, 10]
range = (1..10)
puts "Example 6: #{range.drop(5).inspect}"

# Example 7: `drop_while` removes until the condition fails
# output: Example 7: [3, 4, 1]
items = [1, 2, 3, 4, 1]
puts "Example 7: #{items.drop_while { |x| x < 3 }.inspect}"

# Example 8: `drop` vs `drop_while`
# output: Example 8: drop=[3, 4], drop_while=[3, 4]
items = [1, 2, 3, 4]
puts "Example 8: drop=#{items.drop(2).inspect}, drop_while=#{items.drop_while { |x| x < 3 }.inspect}"

# Example 9: Chaining
# output: Example 9: [6, 8, 10]
items = [1, 2, 3, 4, 5]
result = items.drop(2).map { |x| x * 2 }
puts "Example 9: #{result.inspect}"

# Example 10: Nil-safe drop
# output: Example 10: nil
items = nil
puts "Example 10: #{items&.drop(1).inspect}"
