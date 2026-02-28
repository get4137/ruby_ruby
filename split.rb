# frozen_string_literal: true
#
# Topic: `split`
# Purpose: Break strings into arrays by a delimiter or pattern.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Split by comma
# output: Example 1: [["item1", "100"], ["item2", "200"], ["item3", "150"]]
csv_data = "item1,100\nitem2,200\nitem3,150"
rows = csv_data.split("\n").map { |line| line.split(",") }
puts "Example 1: #{rows.inspect}"

# Example 2: Split by whitespace (default)
# output: Example 2: ["one", "two", "three"]
text = "one  two\nthree"
puts "Example 2: #{text.split.inspect}"

# Example 3: Split by regex
# output: Example 3: ["a", "b", "c"]
text = "a1b2c3"
puts "Example 3: #{text.split(/\d/).inspect}"

# Example 4: Limit the number of splits
# output: Example 4: ["a", "b", "c-d"]
text = "a-b-c-d"
puts "Example 4: #{text.split("-", 3).inspect}"

# Example 5: Keep trailing empty fields
# output: Example 5: ["a", "b", "c", ""]
text = "a,b,c,"
puts "Example 5: #{text.split(",", -1).inspect}"

# Example 6: Split into characters
# output: Example 6: ["r", "u", "b", "y"]
text = "ruby"
puts "Example 6: #{text.split("").inspect}"
