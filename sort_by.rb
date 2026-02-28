# frozen_string_literal: true
#
# Topic: `sort_by`
# Purpose: Sort by a computed key.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Sort numbers by absolute value
# output: Example 1: [-1, -2, 3]
numbers = [-2, 3, -1]
puts "Example 1: #{numbers.sort_by(&:abs).inspect}"

# Example 2: Sort words by length
# output: Example 2: ["apple", "banana", "cherry"]
words = %w[banana apple cherry]
puts "Example 2: #{words.sort_by(&:length).inspect}"

# Example 3: Sort hash entries by value
# output: Example 3: [[:alice, 90], [:charlie, 88], [:bob, 75]]
scores = { alice: 90, bob: 75, charlie: 88 }
puts "Example 3: #{scores.sort_by { |_k, v| -v }.inspect}"

# Example 4: Sort objects by attribute
# output: Example 4: [25, 30, 40]
class User
  attr_reader :age

  def initialize(age)
    @age = age
  end
end

users = [User.new(30), User.new(25), User.new(40)]
puts "Example 4: #{users.sort_by(&:age).map(&:age).inspect}"

# Example 5: Stable sorting on equal keys
# output: Example 5: ["a1", "a2", "a3"]
items = %w[a1 a2 a3]
puts "Example 5: #{items.sort_by { |i| i[0] }.inspect}"
