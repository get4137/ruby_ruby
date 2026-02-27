# frozen_string_literal: true
#
# Topic: `reverse` and `reverse!`
# Purpose: Reverse strings, arrays, and enumerables.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Reverse a string
puts "Example 1: #{"hello".reverse}"

# Example 2: Reverse an array
puts "Example 2: #{[1, 2, 3].reverse.inspect}"

# Example 3: `reverse!` mutates
items = ["a", "b", "c"]
items.reverse!
puts "Example 3: #{items.inspect}"

# Example 4: Reverse a range into an array
puts "Example 4: #{(1..5).to_a.reverse.inspect}"

# Example 5: Reverse by words
sentence = "ruby is fun"
puts "Example 5: #{sentence.split.reverse.join(" ")}"

# Example 6: Reverse each word
reversed_words = sentence.split.map(&:reverse).join(" ")
puts "Example 6: #{reversed_words}"
