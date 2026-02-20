# frozen_string_literal: true
#
# Topic: `tally`
# Purpose: Count occurrences of items in an enumerable.
#
# Example 1: Basic tally on an array
items = %w[apple banana apple cherry apple]
puts "Example 1: #{items.tally.inspect}"

# Example 2: Tally on numbers
numbers = [1, 2, 2, 3, 3, 3]
puts "Example 2: #{numbers.tally.inspect}"

# Example 3: Tally on characters
text = "banana"
puts "Example 3: #{text.chars.tally.inspect}"

# Example 4: Tally with case normalization
words = %w[Ruby ruby RUBY]
normalized = words.map(&:downcase)
puts "Example 4: #{normalized.tally.inspect}"

# Example 5: Tally after filtering
values = ["a", "b", "b", nil, "a", nil]
filtered = values.compact
puts "Example 5: #{filtered.tally.inspect}"

# Example 6: Tally on a hash's values
scores = { alice: 10, bob: 10, charlie: 8 }
puts "Example 6: #{scores.values.tally.inspect}"

# Example 7: Tally on enum with `each_line`
lines = "a\nb\na\n"
puts "Example 7: #{lines.each_line.map(&:chomp).tally.inspect}"

# Example 8: Combine with `sort_by` for a ranking
ranked = items.tally.sort_by { |_item, count| -count }
puts "Example 8: #{ranked.inspect}"
