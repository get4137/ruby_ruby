# frozen_string_literal: true
#
# Topic: `tally`
# Purpose: Count occurrences of items in an enumerable.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic tally on an array
# output: Example 1: {"apple"=>3, "banana"=>1, "cherry"=>1}
items = %w[apple banana apple cherry apple]
puts "Example 1: #{items.tally.inspect}"

# Example 2: Tally on numbers
# output: Example 2: {1=>1, 2=>2, 3=>3}
numbers = [1, 2, 2, 3, 3, 3]
puts "Example 2: #{numbers.tally.inspect}"

# Example 3: Tally on characters
# output: Example 3: {"b"=>1, "a"=>3, "n"=>2}
text = "banana"
puts "Example 3: #{text.chars.tally.inspect}"

# Example 4: Tally with case normalization
# output: Example 4: {"ruby"=>3}
words = %w[Ruby ruby RUBY]
normalized = words.map(&:downcase)
puts "Example 4: #{normalized.tally.inspect}"

# Example 5: Tally after filtering
# output: Example 5: {"a"=>2, "b"=>2}
values = ["a", "b", "b", nil, "a", nil]
filtered = values.compact
puts "Example 5: #{filtered.tally.inspect}"

# Example 6: Tally on a hash's values
# output: Example 6: {10=>2, 8=>1}
scores = { alice: 10, bob: 10, charlie: 8 }
puts "Example 6: #{scores.values.tally.inspect}"

# Example 7: Tally on enum with `each_line`
# output: Example 7: {"a"=>2, "b"=>1}
lines = "a\nb\na\n"
puts "Example 7: #{lines.each_line.map(&:chomp).tally.inspect}"

# Example 8: Combine with `sort_by` for a ranking
# output: Example 8: [["apple", 3], ["banana", 1], ["cherry", 1]]
ranked = items.tally.sort_by { |_item, count| -count }
puts "Example 8: #{ranked.inspect}"
