# frozen_string_literal: true
#
# Topic: `concat` for String and Array
# Purpose: Show mutation vs non-mutation and common patterns.
#
# Example 1: String concat mutates the receiver
text = "Hello"
text.concat(" World")
puts "Example 1: #{text}"

# Example 2: `+` returns a new string
original = "Hello"
combined = original + " World"
puts "Example 2: original=#{original}, combined=#{combined}"

# Example 3: String concat with integer codepoint
text = "A"
text.concat(66) # ASCII 66 = 'B'
puts "Example 3: #{text}"

# Example 4: Build a string in a loop
result = ""
%w[a b c].each { |char| result.concat(char) }
puts "Example 4: #{result}"

# Example 5: Array concat mutates the receiver
numbers = [1, 2]
numbers.concat([3, 4])
puts "Example 5: #{numbers.inspect}"

# Example 6: `+` returns a new array
left = [1, 2]
right = left + [3]
puts "Example 6: left=#{left.inspect}, right=#{right.inspect}"

# Example 7: Nested array stays nested with concat
list = [1, 2]
list.concat([[3, 4]])
puts "Example 7: #{list.inspect}"

# Example 8: Concat preserves object identity
arr = [1]
before = arr.object_id
arr.concat([2])
after = arr.object_id
puts "Example 8: same_object=#{before == after}"

# Example 9: Concat vs push
arr = [1, 2]
arr.concat([3, 4])
puts "Example 9: concat=#{arr.inspect}"

arr = [1, 2]
arr.push([3, 4])
puts "Example 9: push=#{arr.inspect}"

# Example 10: Concat on frozen string raises error
begin
  frozen = "Hello".freeze
  frozen.concat(" World")
rescue => e
  puts "Example 10: error=#{e.class}"
end
