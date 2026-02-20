# frozen_string_literal: true

# =========================
# BASIC USAGE
# =========================

# Example 1: Building array
numbers = [1, 2, 3, 4]
result = numbers.each_with_object([]) do |n, arr|
  arr << n * 2
end
puts "Doubled: #{result.inspect}" # [2, 4, 6, 8]

# Example 2: Building hash
words = %w[apple banana cherry]
lengths = words.each_with_object({}) do |word, hash|
  hash[word] = word.length
end
puts "Word lengths: #{lengths.inspect}"

# Example 3: Grouping values
numbers = [1, 2, 3, 4, 5, 6]
grouped = numbers.each_with_object({ even: [], odd: [] }) do |n, acc|
  if n.even?
    acc[:even] << n
  else
    acc[:odd] << n
  end
end
puts "Grouped: #{grouped.inspect}"

# =========================
# DIFFERENCE VS inject/reduce
# =========================

# Example 4: inject version (for comparison)
numbers = [1, 2, 3]
inject_result = numbers.inject([]) do |acc, n|
  acc << n * 10
end
puts "Inject result: #{inject_result.inspect}"

# Example 5: each_with_object version (no need to return accumulator)
ewo_result = numbers.each_with_object([]) do |n, acc|
  acc << n * 10
end
puts "each_with_object result: #{ewo_result.inspect}"

# =========================
# WITH STRINGS
# =========================

# Example 6: Concatenating string
letters = %w[a b c]
combined = letters.each_with_object("") do |char, str|
  str << char.upcase
end
puts "Combined string: #{combined}" # "ABC"

# =========================
# NESTED STRUCTURES
# =========================

# Example 7: Indexing objects by attribute
users = [
  { id: 1, name: "John" },
  { id: 2, name: "Jane" }
]

indexed = users.each_with_object({}) do |user, hash|
  hash[user[:id]] = user
end
puts "Indexed users: #{indexed.inspect}"

# Example 8: Counting occurrences
items = %w[apple banana apple cherry apple]
counts = items.each_with_object(Hash.new(0)) do |item, hash|
  hash[item] += 1
end
puts "Counts: #{counts.inspect}"

# =========================
# EDGE CASES
# =========================

# Example 9: Empty collection
empty = []
result = empty.each_with_object([]) do |item, arr|
  arr << item
end
puts "Empty result: #{result.inspect}" # []

# Example 10: Immutable object mistake
begin
  numbers = [1, 2, 3]
  result = numbers.each_with_object(0) do |n, acc|
    acc += n # does not modify original accumulator
  end
  puts "Immutable accumulator: #{result}"
rescue => e
  puts "Error: #{e.class}"
end

# =========================
# CHAINING
# =========================

# Example 11: With select before each_with_object
numbers = [1, 2, 3, 4, 5]
result = numbers.select(&:odd?).each_with_object([]) do |n, arr|
  arr << n * 100
end
puts "Chained result: #{result.inspect}"

# Example 12: With sort
words = %w[zebra apple banana]
sorted_indexed = words.sort.each_with_object({}) do |word, hash|
  hash[word] = word.upcase
end
puts "Sorted indexed: #{sorted_indexed.inspect}"
