# frozen_string_literal: true

# `each_with_index` is the most common way to iterate with an index.
# `with_index` is used on Enumerators (often after `each`) and can start from a custom offset.

# Example 1: each_with_index (0-based index)
names = %w[Taras Tanya]
names.each_with_index do |name, index|
  puts "#{index}. #{name}"
end

# Example 2: Display as 1-based list (index + 1)
names.each_with_index do |name, index|
  puts "#{index + 1}. #{name}"
end

# Example 3: with_index (Enumerator) with default start = 0
names.each.with_index do |name, index|
  puts "with_index: #{index} -> #{name}"
end

# Example 4: with_index with custom start offset
names.each.with_index(10) do |name, index|
  puts "starting from 10: #{index} -> #{name}"
end

# Example 5: with_index with map to build a new array
labeled = names.each_with_index.map { |name, index| "#{index + 1}. #{name}" }
puts "labeled: #{labeled.inspect}"

# Example 6: each_with_index + select (filter using both value and index)
numbers = [10, 20, 30, 40, 50]
selected = numbers.each_with_index.select { |value, index| index.even? && value >= 30 }
puts "selected pairs: #{selected.inspect}"

# Example 7: each_with_index to build a hash
index_by_name = {}
names.each_with_index { |name, index| index_by_name[name] = index }
puts "index_by_name: #{index_by_name.inspect}"

# Example 8: each_with_index for nested arrays (outer and inner indices)
matrix = [
  %w[a b],
  %w[c d]
]

matrix.each_with_index do |row, row_index|
  row.each_with_index do |cell, col_index|
    puts "matrix[#{row_index}][#{col_index}] = #{cell}"
  end
end

# Example 9: each_with_index vs with_index on an Enumerator (common pattern with select/map)
words = %w[apple banana cherry date]
long_words_with_positions = words.each.with_index(1).select { |word, _pos| word.length >= 6 }
puts "long_words_with_positions: #{long_words_with_positions.inspect}"

# Example 10: Sum values on odd positions (1-based indexing)
values = [5, 10, 15, 20, 25]
sum_on_odd_positions = values.each.with_index(1).sum do |value, position|
  position.odd? ? value : 0
end
puts "sum_on_odd_positions: #{sum_on_odd_positions}"

# Summary:
# - Use `each_with_index` for simple iteration with index.
# - Use `each.with_index(start)` when you need a custom index start or want to chain enumerator ops.
