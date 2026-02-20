# frozen_string_literal: true
#
# Topic: `sort` vs `sort_by`
# Purpose: Compare custom comparator vs key-based sorting.
#
# Example 1: Default sort
numbers = [3, 1, 2]
puts "Example 1: #{numbers.sort.inspect}"

# Example 2: Custom comparator
words = %w[banana apple cherry]
puts "Example 2: #{words.sort { |a, b| a.length <=> b.length }.inspect}"

# Example 3: `sort_by` with a key
puts "Example 3: #{words.sort_by(&:length).inspect}"

# Example 4: Sorting hashes by value
scores = { alice: 90, bob: 75, charlie: 88 }
by_score = scores.sort_by { |_name, score| -score }
puts "Example 4: #{by_score.inspect}"

# Example 5: `sort_by` is often faster for expensive keys
items = %w[aaaa b ccc dd]
puts "Example 5: #{items.sort_by(&:length).inspect}"

# Example 6: Stable ordering with `sort_by` on equal keys
items = %w[a1 a2 a3]
puts "Example 6: #{items.sort_by { |item| item[0] }.inspect}"
