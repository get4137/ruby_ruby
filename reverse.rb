# frozen_string_literal: true
#
# Topic: `reverse` and `reverse!`
# Purpose: Reverse strings, arrays, and enumerables.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Reverse a string
# output: Example 1: olleh
puts "Example 1: #{"hello".reverse}"

# Example 2: Reverse an array
# output: Example 2: [3, 2, 1]
puts "Example 2: #{[1, 2, 3].reverse.inspect}"

# Example 3: `reverse!` mutates
# output: Example 3: ["c", "b", "a"]
items = ["a", "b", "c"]
items.reverse!
puts "Example 3: #{items.inspect}"

# Example 4: Reverse a range into an array
# output: Example 4: [5, 4, 3, 2, 1]
puts "Example 4: #{(1..5).to_a.reverse.inspect}"

# Example 5: Reverse by words
# output: Example 5: fun is ruby
sentence = "ruby is fun"
puts "Example 5: #{sentence.split.reverse.join(" ")}"

# Example 6: Reverse each word
# output: Example 6: ybur si nuf
reversed_words = sentence.split.map(&:reverse).join(" ")
puts "Example 6: #{reversed_words}"
