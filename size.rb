# frozen_string_literal: true

# Example 1: Size of string - counting characters
name = "Ruby"
puts "Hello, #{name.capitalize}"
puts "There are #{name.size} letters in your name"

# Example 2: Size of string with spaces
text = "Hello World"
puts "Text: '#{text}'"
puts "Size (including spaces): #{text.size}"

# Example 3: Size of string with special characters
special_text = "Hello! @#$%"
puts "Special text size: #{special_text.size}"

# Example 4: Size of empty string
empty_string = ""
puts "Empty string size: #{empty_string.size}"

# Example 5: Size of array
numbers = [1, 2, 3, 4, 5]
puts "Array: #{numbers.inspect}"
puts "Array size: #{numbers.size}"

# Example 6: Size of empty array
empty_array = []
puts "Empty array size: #{empty_array.size}"

# Example 7: Size of hash
person = { name: "John", age: 30, city: "NYC" }
puts "Hash: #{person.inspect}"
puts "Hash size: #{person.size}"

# Example 8: Size of empty hash
empty_hash = {}
puts "Empty hash size: #{empty_hash.size}"

# Example 9: Size of range
range = 1..10
puts "Range: #{range.inspect}"
puts "Range size: #{range.size}"

# Example 10: Size of infinite range
infinite_range = 1..Float::INFINITY
puts "Infinite range size: #{infinite_range.size.inspect}"

# Example 11: Size vs length (they are aliases for most collections)
array = [1, 2, 3]
puts "Array size: #{array.size}"
puts "Array length: #{array.length}"
puts "Are they equal? #{array.size == array.length}"

# Example 12: Size of string vs length
text = "Ruby"
puts "String size: #{text.size}"
puts "String length: #{text.length}"
puts "Are they equal? #{text.size == text.length}"

# Example 13: Size of nested array
nested = [[1, 2], [3, 4], [5, 6]]
puts "Nested array size: #{nested.size}"
puts "First inner array size: #{nested[0].size}"

# Example 14: Size of array with different types
mixed_array = [1, "hello", :symbol, [1, 2], {a: 1}]
puts "Mixed array size: #{mixed_array.size}"

# Example 15: Size of hash with different value types
complex_hash = {
  string: "value",
  number: 42,
  array: [1, 2, 3],
  hash: {nested: "data"}
}
puts "Complex hash size: #{complex_hash.size}"

# Example 16: Size of string with unicode characters
unicode_text = "Hello 世界"
puts "Unicode text: #{unicode_text}"
puts "Size (bytes): #{unicode_text.bytesize}"
puts "Size (characters): #{unicode_text.size}"

# Example 17: Size of string with emoji
emoji_text = "Hello 👋 World 🌍"
puts "Emoji text: #{emoji_text}"
puts "Size: #{emoji_text.size}"

# Example 18: Size comparison
array1 = [1, 2, 3]
array2 = [1, 2, 3, 4, 5]
puts "Array1 size: #{array1.size}"
puts "Array2 size: #{array2.size}"
puts "Array2 is larger: #{array2.size > array1.size}"

# Example 19: Size in conditional
items = ["apple", "banana", "cherry"]
if items.size > 2
  puts "We have more than 2 items: #{items.size}"
end

# Example 20: Size with zero check
collection = []
if collection.size == 0
  puts "Collection is empty"
end

# Alternative: using empty?
if collection.empty?
  puts "Collection is empty (using empty?)"
end

# Example 21: Size in loop condition
numbers = [1, 2, 3, 4, 5]
index = 0
while index < numbers.size
  puts "Index #{index}: #{numbers[index]}"
  index += 1
end

# Example 22: Size with each_with_index
fruits = ["apple", "banana", "cherry"]
fruits.each_with_index do |fruit, index|
  puts "[#{index + 1}/#{fruits.size}] #{fruit}"
end

# Example 23: Size calculation
def calculate_total_size(collections)
  total = 0
  collections.each do |collection|
    total += collection.size
  end
  total
end

arrays = [[1, 2], [3, 4, 5], [6]]
puts "Total size: #{calculate_total_size(arrays)}"

# Example 24: Size with map
words = ["hello", "world", "ruby"]
sizes = words.map(&:size)
puts "Word sizes: #{sizes.inspect}"

# Example 25: Size with select
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
large_array = numbers.select { |n| n > 5 }
puts "Original size: #{numbers.size}"
puts "Filtered size: #{large_array.size}"

# Example 26: Size with reject
numbers = [1, 2, 3, 4, 5]
filtered = numbers.reject { |n| n.even? }
puts "Original size: #{numbers.size}"
puts "After reject size: #{filtered.size}"

# Example 27: Size of string after operations
text = "  Hello World  "
puts "Original size: #{text.size}"
stripped = text.strip
puts "After strip size: #{stripped.size}"

# Example 28: Size of array after operations
numbers = [1, 2, 3]
puts "Original size: #{numbers.size}"
numbers << 4
puts "After push size: #{numbers.size}"
numbers.pop
puts "After pop size: #{numbers.size}"

# Example 29: Size of hash after operations
hash = {a: 1}
puts "Original size: #{hash.size}"
hash[:b] = 2
puts "After adding key size: #{hash.size}"
hash.delete(:a)
puts "After delete size: #{hash.size}"

# Example 30: Size with compact
array = [1, nil, 2, nil, 3]
puts "Original size: #{array.size}"
compacted = array.compact
puts "Compacted size: #{compacted.size}"

# Example 31: Size with uniq
array = [1, 2, 2, 3, 3, 3]
puts "Original size: #{array.size}"
unique = array.uniq
puts "Unique size: #{unique.size}"

# Example 32: Size of string array
words = ["apple", "banana", "cherry"]
total_chars = words.sum(&:size)
puts "Total characters in all words: #{total_chars}"

# Example 33: Size comparison methods
array1 = [1, 2, 3]
array2 = [1, 2, 3, 4]

puts "Array1 size: #{array1.size}"
puts "Array2 size: #{array2.size}"
puts "Array1 < Array2: #{array1.size < array2.size}"
puts "Array1 > Array2: #{array1.size > array2.size}"

# Example 34: Size with slice
array = [1, 2, 3, 4, 5]
sliced = array.slice(0, 3)
puts "Original size: #{array.size}"
puts "Sliced size: #{sliced.size}"

# Example 35: Size of range with step
range = (1..10)
puts "Range size: #{range.size}"
stepped = range.step(2)
puts "Stepped range size: #{stepped.size}"

# Example 36: Size with flatten
nested = [[1, 2], [3, [4, 5]]]
puts "Nested size: #{nested.size}"
flattened = nested.flatten
puts "Flattened size: #{flattened.size}"

# Example 37: Size of string with gsub
text = "hello world"
puts "Original size: #{text.size}"
replaced = text.gsub("l", "L")
puts "After gsub size: #{replaced.size}"  # Same size

# Example 38: Size with split
text = "one,two,three"
parts = text.split(',')
puts "Text size: #{text.size}"
puts "Split parts size: #{parts.size}"

# Example 39: Size of enumerator
enumerator = (1..5).each
puts "Enumerator size: #{enumerator.size}"

# Example 40: Size with take
array = [1, 2, 3, 4, 5]
taken = array.take(3)
puts "Original size: #{array.size}"
puts "Taken size: #{taken.size}"

# Example 41: Size with drop
array = [1, 2, 3, 4, 5]
dropped = array.drop(2)
puts "Original size: #{array.size}"
puts "Dropped size: #{dropped.size}"

# Example 42: Size of string with bytes
text = "Hello"
puts "String size (chars): #{text.size}"
puts "String bytesize: #{text.bytesize}"

# Example 43: Size with combination
array = [1, 2, 3]
combinations = array.combination(2).to_a
puts "Array size: #{array.size}"
puts "Combinations size: #{combinations.size}"

# Example 44: Size with permutation
array = [1, 2, 3]
permutations = array.permutation(2).to_a
puts "Array size: #{array.size}"
puts "Permutations size: #{permutations.size}"

# Example 45: Size of set (if using Set class)
require 'set'
set = Set.new([1, 2, 3, 3, 2])
puts "Set size: #{set.size}"

# Example 46: Size with group_by
numbers = [1, 2, 3, 4, 5, 6]
grouped = numbers.group_by(&:even?)
puts "Original size: #{numbers.size}"
puts "Grouped hash size: #{grouped.size}"

# Example 47: Size of string with encoding
text = "Hello"
puts "String size: #{text.size}"
puts "Encoding: #{text.encoding}"

# Example 48: Size with chunk
numbers = [1, 1, 2, 2, 3, 3]
chunked = numbers.chunk(&:itself).to_a
puts "Original size: #{numbers.size}"
puts "Chunked size: #{chunked.size}"

# Example 49: Size with partition
numbers = [1, 2, 3, 4, 5]
even, odd = numbers.partition(&:even?)
puts "Original size: #{numbers.size}"
puts "Even partition size: #{even.size}"
puts "Odd partition size: #{odd.size}"

# Example 50: Size in method return
def get_collection_size(collection)
  collection.size
end

array = [1, 2, 3, 4, 5]
puts "Collection size: #{get_collection_size(array)}"

# Example 51: Size with any?
array = [1, 2, 3]
if array.size > 0 && array.any? { |n| n > 2 }
  puts "Array has items and contains number > 2"
end

# Example 52: Size with all?
array = [1, 2, 3]
if array.size > 0 && array.all? { |n| n > 0 }
  puts "Array has items and all are positive"
end

# Example 53: Size with none?
array = []
if array.size == 0 || array.none? { |n| n < 0 }
  puts "Array is empty or has no negative numbers"
end

# Example 54: Size with one?
array = [5]
if array.size == 1 && array.one? { |n| n > 0 }
  puts "Array has exactly one positive number"
end

# Example 55: Size with count
array = [1, 2, 2, 3, 3, 3]
puts "Array size: #{array.size}"
puts "Count of 2: #{array.count(2)}"
puts "Count with condition: #{array.count { |n| n > 2 }}"
