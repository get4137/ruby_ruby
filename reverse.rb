# frozen_string_literal: true

# Example 1: Basic reverse on string
puts 'hello'.reverse

# Example 2: Reverse on string with mixed case
text = "Hello World"
puts "Original: #{text}"
puts "Reversed: #{text.reverse}"

# Example 3: Reverse on string with special characters
special_text = "Hello! @#$%"
puts "Reversed: #{special_text.reverse}"

# Example 4: Reverse on empty string
empty_string = ""
puts "Empty string reversed: '#{empty_string.reverse}'"

# Example 5: Reverse on array
numbers = [1, 2, 3, 4, 5]
puts "Original array: #{numbers.inspect}"
puts "Reversed array: #{numbers.reverse.inspect}"

# Example 6: Reverse on array with different types
mixed_array = [1, "hello", :symbol, [1, 2]]
puts "Mixed array reversed: #{mixed_array.reverse.inspect}"

# Example 7: Reverse vs reverse! (destructive)
array = [1, 2, 3, 4, 5]
reversed_copy = array.reverse
puts "Original: #{array.inspect}"
puts "Reversed copy: #{reversed_copy.inspect}"
puts "Original unchanged: #{array.inspect}"

array.reverse!  # Destructive
puts "After reverse!: #{array.inspect}"

# Example 8: Palindrome checker
def is_palindrome(word)
  normalized = word.downcase
  normalized == normalized.reverse
end

puts "Is 'Deleveled' a palindrome? #{is_palindrome('Deleveled')}"
puts "Is 'hello' a palindrome? #{is_palindrome('hello')}"
puts "Is 'racecar' a palindrome? #{is_palindrome('racecar')}"

# Example 9: Reverse on string with unicode
unicode_text = "Hello 世界"
puts "Unicode reversed: #{unicode_text.reverse}"

# Example 10: Reverse on string with emoji
emoji_text = "Hello 👋 World 🌍"
puts "Emoji reversed: #{emoji_text.reverse}"

# Example 11: Reverse on hash (converts to array)
hash = { a: 1, b: 2, c: 3 }
reversed_hash = hash.to_a.reverse.to_h
puts "Hash reversed: #{reversed_hash.inspect}"

# Example 12: Reverse on range (converts to array)
range = 1..5
reversed_range = range.to_a.reverse
puts "Range reversed: #{reversed_range.inspect}"

# Example 13: Reverse with chained methods
text = "  Hello World  "
reversed_stripped = text.strip.reverse
puts "Stripped and reversed: '#{reversed_stripped}'"

# Example 14: Reverse with map
words = ["hello", "world", "ruby"]
reversed_words = words.map(&:reverse)
puts "Reversed words: #{reversed_words.inspect}"

# Example 15: Reverse with select
numbers = [1, 2, 3, 4, 5]
reversed_selected = numbers.reverse.select { |n| n > 3 }
puts "Reversed and selected: #{reversed_selected.inspect}"

# Example 16: Reverse twice (back to original)
text = "Hello"
double_reversed = text.reverse.reverse
puts "Double reversed: '#{double_reversed}'"
puts "Same as original? #{text == double_reversed}"

# Example 17: Reverse on nested array
nested = [[1, 2], [3, 4], [5, 6]]
reversed_nested = nested.reverse
puts "Nested reversed: #{reversed_nested.inspect}"

# Example 18: Reverse with each
numbers = [1, 2, 3, 4, 5]
numbers.reverse.each do |num|
  puts "Processing: #{num}"
end

# Example 19: Reverse with each_with_index
words = ["first", "second", "third"]
words.reverse.each_with_index do |word, index|
  puts "[#{index}] #{word}"
end

# Example 20: Reverse with find
numbers = [1, 2, 3, 4, 5]
found = numbers.reverse.find { |n| n > 3 }
puts "First number > 3 (from reversed): #{found}"

# Example 21: Reverse with take
numbers = [1, 2, 3, 4, 5]
last_three = numbers.reverse.take(3)
puts "Last three (using reverse): #{last_three.inspect}"

# Example 22: Reverse with drop
numbers = [1, 2, 3, 4, 5]
without_last_two = numbers.reverse.drop(2).reverse
puts "Without last two: #{without_last_two.inspect}"

# Example 23: Reverse with slice
numbers = [1, 2, 3, 4, 5]
reversed_slice = numbers.reverse.slice(0, 3)
puts "Reversed slice: #{reversed_slice.inspect}"

# Example 24: Reverse with compact
array = [1, nil, 2, nil, 3]
reversed_compact = array.reverse.compact
puts "Reversed and compacted: #{reversed_compact.inspect}"

# Example 25: Reverse with uniq
array = [1, 2, 2, 3, 3, 3]
reversed_uniq = array.reverse.uniq
puts "Reversed and unique: #{reversed_uniq.inspect}"

# Example 26: Reverse on string array
words = ["apple", "banana", "cherry"]
reversed_words = words.reverse
puts "Reversed words array: #{reversed_words.inspect}"

# Example 27: Reverse with sort
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
sorted_reversed = numbers.sort.reverse
puts "Sorted in descending order: #{sorted_reversed.inspect}"

# Example 28: Reverse with reject
numbers = [1, 2, 3, 4, 5, 6]
reversed_filtered = numbers.reverse.reject { |n| n.even? }
puts "Reversed and filtered: #{reversed_filtered.inspect}"

# Example 29: Reverse with partition
numbers = [1, 2, 3, 4, 5]
even, odd = numbers.reverse.partition(&:even?)
puts "Even: #{even.inspect}, Odd: #{odd.inspect}"

# Example 30: Reverse with group_by
numbers = [1, 2, 3, 4, 5, 6]
grouped = numbers.reverse.group_by(&:even?)
puts "Grouped: #{grouped.inspect}"

# Example 31: Reverse on string with bytes
text = "Hello"
puts "String reversed: #{text.reverse}"
puts "Bytes reversed: #{text.bytes.reverse.pack('C*')}"

# Example 32: Reverse with combination
array = [1, 2, 3]
combinations = array.reverse.combination(2).to_a
puts "Combinations from reversed: #{combinations.inspect}"

# Example 33: Reverse with permutation
array = [1, 2, 3]
permutations = array.reverse.permutation(2).to_a
puts "Permutations from reversed: #{permutations.inspect}"

# Example 34: Reverse on string with split
text = "one two three"
words = text.split.reverse
reversed_text = words.join(' ')
puts "Words reversed: '#{reversed_text}'"

# Example 35: Reverse with flatten
nested = [[1, 2], [3, 4], [5, 6]]
flattened_reversed = nested.reverse.flatten
puts "Flattened and reversed: #{flattened_reversed.inspect}"

# Example 36: Reverse with zip
array1 = [1, 2, 3]
array2 = ['a', 'b', 'c']
zipped_reversed = array1.reverse.zip(array2.reverse)
puts "Zipped reversed: #{zipped_reversed.inspect}"

# Example 37: Reverse with inject
numbers = [1, 2, 3, 4, 5]
sum_reversed = numbers.reverse.inject(0) { |sum, n| sum + n }
puts "Sum of reversed array: #{sum_reversed}"

# Example 38: Reverse with reduce
numbers = [1, 2, 3, 4, 5]
product_reversed = numbers.reverse.reduce(1) { |prod, n| prod * n }
puts "Product of reversed array: #{product_reversed}"

# Example 39: Reverse on string with gsub
text = "hello world"
reversed_gsub = text.reverse.gsub('l', 'L')
puts "Reversed and gsub: '#{reversed_gsub}'"

# Example 40: Reverse with method chaining
class Reverser
  def initialize(data)
    @data = data
  end

  def reverse
    @data.reverse
  end

  def display
    puts @data.inspect
    self
  end
end

reverser = Reverser.new([1, 2, 3])
reverser.display.reverse.display

# Example 41: Reverse on enumerator
enumerator = (1..5).each
reversed_array = enumerator.to_a.reverse
puts "Enumerator reversed: #{reversed_array.inspect}"

# Example 42: Reverse with cycle
numbers = [1, 2, 3]
reversed_cycle = numbers.reverse.cycle.take(9)
puts "Reversed cycle: #{reversed_cycle.inspect}"

# Example 43: Reverse with chunk
numbers = [1, 1, 2, 2, 3, 3]
chunked = numbers.reverse.chunk(&:itself).to_a
puts "Reversed chunked: #{chunked.inspect}"

# Example 44: Reverse with slice_before
numbers = [1, 2, 3, 4, 5]
sliced = numbers.reverse.slice_before { |n| n > 3 }.to_a
puts "Reversed slice_before: #{sliced.inspect}"

# Example 45: Reverse on string with encoding
text = "Hello"
puts "Original encoding: #{text.encoding}"
reversed = text.reverse
puts "Reversed encoding: #{reversed.encoding}"

# Example 46: Reverse with method returning reversed
def reverse_array(array)
  array.reverse
end

numbers = [1, 2, 3, 4, 5]
reversed = reverse_array(numbers)
puts "Method returned: #{reversed.inspect}"

# Example 47: Reverse with conditional
def reverse_if_even(array)
  array.even? ? array.reverse : array
end

# For arrays, we need to check length
def reverse_if_even_length(array)
  array.length.even? ? array.reverse : array
end

numbers = [1, 2, 3, 4]
result = reverse_if_even_length(numbers)
puts "Reversed if even length: #{result.inspect}"

# Example 48: Reverse with case statement
def process_reverse(data, action)
  case action
  when :reverse
    data.reverse
  when :double_reverse
    data.reverse.reverse
  else
    data
  end
end

text = "Hello"
puts "Single reverse: #{process_reverse(text, :reverse)}"
puts "Double reverse: #{process_reverse(text, :double_reverse)}"

# Example 49: Reverse with block
def reverse_with_block(array, &block)
  array.reverse.each(&block)
end

numbers = [1, 2, 3, 4, 5]
reverse_with_block(numbers) { |n| puts "Processing: #{n}" }

# Example 50: Reverse on string with each_char
text = "Hello"
reversed_chars = text.each_char.to_a.reverse.join
puts "Reversed chars: '#{reversed_chars}'"

# Example 51: Reverse with lazy evaluation
numbers = [1, 2, 3, 4, 5]
lazy_reversed = numbers.reverse.lazy.select { |n| n > 2 }
puts "Lazy reversed: #{lazy_reversed.take(3).to_a.inspect}"

# Example 52: Reverse with max/min
numbers = [1, 2, 3, 4, 5]
max_from_reversed = numbers.reverse.max
min_from_reversed = numbers.reverse.min
puts "Max from reversed: #{max_from_reversed}"
puts "Min from reversed: #{min_from_reversed}"

# Example 53: Reverse with sum
numbers = [1, 2, 3, 4, 5]
sum_reversed = numbers.reverse.sum
puts "Sum of reversed: #{sum_reversed}"

# Example 54: Reverse with all?/any?
numbers = [1, 2, 3, 4, 5]
all_positive_reversed = numbers.reverse.all? { |n| n > 0 }
any_negative_reversed = numbers.reverse.any? { |n| n < 0 }
puts "All positive (reversed): #{all_positive_reversed}"
puts "Any negative (reversed): #{any_negative_reversed}"

# Example 55: Reverse summary
# reverse creates a new reversed object (non-destructive)
# reverse! modifies the original object (destructive)
# Works with: String, Array, and any Enumerable
# Common use cases:
# - Palindrome checking
# - Processing arrays in reverse order
# - Reversing string order
# - Getting last N elements: array.reverse.take(n).reverse
