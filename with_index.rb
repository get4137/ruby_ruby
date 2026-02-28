# frozen_string_literal: true
#
# Topic: `each_with_index` and `with_index`
# Purpose: Iterate with an index and optional offset.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `each_with_index` (0-based)
# output: Example 1: 0 -> Taras
# output: Example 1: 1 -> Tanya
names = %w[Taras Tanya]
names.each_with_index { |name, index| puts "Example 1: #{index} -> #{name}" }

# Example 2: 1-based display
# output: Example 2: 1. Taras
# output: Example 2: 2. Tanya
names.each_with_index { |name, index| puts "Example 2: #{index + 1}. #{name}" }

# Example 3: `with_index` with default offset
# output: Example 3: 0 -> Taras
# output: Example 3: 1 -> Tanya
names.each.with_index { |name, index| puts "Example 3: #{index} -> #{name}" }

# Example 4: `with_index` with custom offset
# output: Example 4: 10 -> Taras
# output: Example 4: 11 -> Tanya
names.each.with_index(10) { |name, index| puts "Example 4: #{index} -> #{name}" }

# Example 5: Build a labeled array
# output: Example 5: ["1. Taras", "2. Tanya"]
labeled = names.each_with_index.map { |name, index| "#{index + 1}. #{name}" }
puts "Example 5: #{labeled.inspect}"

# Example 6: Filter using value and index
# output: Example 6: [[30, 2], [50, 4]]
numbers = [10, 20, 30, 40, 50]
selected = numbers.each_with_index.select { |value, index| index.even? && value >= 30 }
puts "Example 6: #{selected.inspect}"

# Example 7: Build a hash from indices
# output: Example 7: {"Taras"=>0, "Tanya"=>1}
index_by_name = {}
names.each_with_index { |name, index| index_by_name[name] = index }
puts "Example 7: #{index_by_name.inspect}"

# Example 8: Nested arrays
# output: Example 8: matrix[0][0] = a
# output: Example 8: matrix[0][1] = b
# output: Example 8: matrix[1][0] = c
# output: Example 8: matrix[1][1] = d
matrix = [%w[a b], %w[c d]]
matrix.each_with_index do |row, row_index|
  row.each_with_index do |cell, col_index|
    puts "Example 8: matrix[#{row_index}][#{col_index}] = #{cell}"
  end
end
