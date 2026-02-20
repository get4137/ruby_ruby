# frozen_string_literal: true
#
# Topic: `each_with_index` and `with_index`
# Purpose: Iterate with an index and optional offset.
#
# Example 1: `each_with_index` (0-based)
names = %w[Taras Tanya]
names.each_with_index { |name, index| puts "Example 1: #{index} -> #{name}" }

# Example 2: 1-based display
names.each_with_index { |name, index| puts "Example 2: #{index + 1}. #{name}" }

# Example 3: `with_index` with default offset
names.each.with_index { |name, index| puts "Example 3: #{index} -> #{name}" }

# Example 4: `with_index` with custom offset
names.each.with_index(10) { |name, index| puts "Example 4: #{index} -> #{name}" }

# Example 5: Build a labeled array
labeled = names.each_with_index.map { |name, index| "#{index + 1}. #{name}" }
puts "Example 5: #{labeled.inspect}"

# Example 6: Filter using value and index
numbers = [10, 20, 30, 40, 50]
selected = numbers.each_with_index.select { |value, index| index.even? && value >= 30 }
puts "Example 6: #{selected.inspect}"

# Example 7: Build a hash from indices
index_by_name = {}
names.each_with_index { |name, index| index_by_name[name] = index }
puts "Example 7: #{index_by_name.inspect}"

# Example 8: Nested arrays
matrix = [%w[a b], %w[c d]]
matrix.each_with_index do |row, row_index|
  row.each_with_index do |cell, col_index|
    puts "Example 8: matrix[#{row_index}][#{col_index}] = #{cell}"
  end
end
