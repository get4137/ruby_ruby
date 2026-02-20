# frozen_string_literal: true

# =========================
# STRING#concat examples
# =========================

# Example 1: Basic string concatenation
str = "Hello"
str.concat(" World")
puts "Basic concat: #{str}" # "Hello World"

# Example 2: concat modifies original object
str1 = "Ruby"
str2 = str1
str1.concat(" Rails")
puts "Modified original: #{str2}" # "Ruby Rails"

# Example 3: concat with multiple arguments
str = "A"
str.concat("B", "C", "D")
puts "Multiple args: #{str}" # "ABCD"

# Example 4: concat vs +
str = "Hello"
new_str = str + " World"
puts "Original after +: #{str}"     # "Hello"
puts "New string: #{new_str}"       # "Hello World"

str.concat(" World")
puts "Original after concat: #{str}" # "Hello World"

# Example 5: concat with integer (ASCII codepoint)
str = "A"
str.concat(66) # ASCII 66 = 'B'
puts "Concat integer: #{str}" # "AB"

# Example 6: concat with empty string
str = "Test"
str.concat("")
puts "Concat empty: #{str}" # "Test"

# Example 7: concat in loop
result = ""
["a", "b", "c"].each do |char|
  result.concat(char)
end
puts "Loop concat: #{result}" # "abc"


# =========================
# ARRAY#concat examples
# =========================

# Example 8: Basic array concat
arr1 = [1, 2]
arr2 = [3, 4]
arr1.concat(arr2)
puts "Array concat: #{arr1.inspect}" # [1, 2, 3, 4]

# Example 9: concat modifies original array
arr1 = [1, 2]
arr2 = arr1
arr1.concat([3])
puts "Shared reference: #{arr2.inspect}" # [1, 2, 3]

# Example 10: concat vs +
arr1 = [1, 2]
arr2 = arr1 + [3]
puts "Original after +: #{arr1.inspect}" # [1, 2]
puts "New array: #{arr2.inspect}"        # [1, 2, 3]

arr1.concat([3])
puts "Original after concat: #{arr1.inspect}" # [1, 2, 3]

# Example 11: concat with empty array
arr = [1, 2]
arr.concat([])
puts "Concat empty array: #{arr.inspect}" # [1, 2]

# Example 12: concat multiple times
arr = []
arr.concat([1])
arr.concat([2, 3])
puts "Multiple concat: #{arr.inspect}" # [1, 2, 3]

# Example 13: concat inside iteration
numbers = []
(1..3).each do |i|
  numbers.concat([i])
end
puts "Iteration concat: #{numbers.inspect}" # [1, 2, 3]

# Example 14: concat with nested array
arr = [1, 2]
arr.concat([[3, 4]])
puts "Nested array: #{arr.inspect}" # [1, 2, [3, 4]]

# Example 15: concat preserves object identity
arr = [1]
object_id_before = arr.object_id
arr.concat([2])
object_id_after = arr.object_id
puts "Same object: #{object_id_before == object_id_after}" # true

# Example 16: concat with large arrays
a = (1..3).to_a
b = (4..6).to_a
a.concat(b)
puts "Large concat: #{a.inspect}" # [1, 2, 3, 4, 5, 6]

# Example 17: concat strings in array
words = ["Hello"]
words.concat(["World"])
puts "Words: #{words.inspect}" # ["Hello", "World"]

# Example 18: concat with frozen string (will raise error)
begin
  str = "Hello".freeze
  str.concat(" World")
rescue => e
  puts "Error on frozen string: #{e.class}"
end

# Example 19: concat chaining
arr = [1]
arr.concat([2]).concat([3])
puts "Chained concat: #{arr.inspect}" # [1, 2, 3]

# Example 20: concat vs push difference
arr = [1, 2]
arr.concat([3, 4])
puts "Concat result: #{arr.inspect}" # [1, 2, 3, 4]

arr = [1, 2]
arr.push([3, 4])
puts "Push result: #{arr.inspect}"   # [1, 2, [3, 4]]
