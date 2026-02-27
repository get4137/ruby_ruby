# frozen_string_literal: true
#
# Topic: `each_with_object`
# Purpose: Build an accumulator without returning it from the block.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Build an array
numbers = [1, 2, 3, 4]
doubled = numbers.each_with_object([]) { |n, acc| acc << n * 2 }
puts "Example 1: #{doubled.inspect}"

# Example 2: Build a hash
words = %w[apple banana cherry]
lengths = words.each_with_object({}) { |word, acc| acc[word] = word.length }
puts "Example 2: #{lengths.inspect}"

# Example 3: Group values
numbers = [1, 2, 3, 4, 5, 6]
grouped = numbers.each_with_object({ even: [], odd: [] }) do |n, acc|
  (n.even? ? acc[:even] : acc[:odd]) << n
end
puts "Example 3: #{grouped.inspect}"

# Example 4: Comparison with `inject`
numbers = [1, 2, 3]
inject_result = numbers.inject([]) { |acc, n| acc << n * 10 }
with_object_result = numbers.each_with_object([]) { |n, acc| acc << n * 10 }
puts "Example 4: inject=#{inject_result.inspect}, each_with_object=#{with_object_result.inspect}"

# Example 5: Build a string
letters = %w[a b c]
combined = letters.each_with_object("") { |char, acc| acc << char.upcase }
puts "Example 5: #{combined}"

# Example 6: Index by attribute
users = [{ id: 1, name: "John" }, { id: 2, name: "Jane" }]
indexed = users.each_with_object({}) { |user, acc| acc[user[:id]] = user }
puts "Example 6: #{indexed.inspect}"

# Example 7: Count occurrences
items = %w[apple banana apple cherry apple]
counts = items.each_with_object(Hash.new(0)) { |item, acc| acc[item] += 1 }
puts "Example 7: #{counts.inspect}"

# Example 8: Empty collection
empty = []
result = empty.each_with_object([]) { |item, acc| acc << item }
puts "Example 8: #{result.inspect}"

# Example 9: Common mistake with immutable accumulator
numbers = [1, 2, 3]
result = numbers.each_with_object(0) { |n, acc| acc + n }
puts "Example 9: #{result}"

# Example 10: Chaining with select
numbers = [1, 2, 3, 4, 5]
chained = numbers.select(&:odd?).each_with_object([]) { |n, acc| acc << n * 100 }
puts "Example 10: #{chained.inspect}"
