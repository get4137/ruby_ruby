# frozen_string_literal: true
#
# Topic: `size` / `length`
# Purpose: Measure collection or string length.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: String size
# output: Example 1: 4
name = "Ruby"
puts "Example 1: #{name.size}"

# Example 2: Array size
# output: Example 2: 4
numbers = [1, 2, 3, 4]
puts "Example 2: #{numbers.size}"

# Example 3: Hash size
# output: Example 3: 2
scores = { alice: 90, bob: 85 }
puts "Example 3: #{scores.size}"

# Example 4: `size` and `length` are synonyms
# output: Example 4: true
puts "Example 4: #{name.length == name.size}"

# Example 5: Size of an enumerator (when known)
# output: Example 5: 10
range = (1..10)
puts "Example 5: #{range.size}"
