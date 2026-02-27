# frozen_string_literal: true
#
# Topic: `group_by`
# Purpose: Group elements by a computed key.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Group numbers by parity
numbers = [1, 2, 3, 4, 5]
puts "Example 1: #{numbers.group_by(&:even?).inspect}"

# Example 2: Group words by length
words = %w[ant bear cat dog]
puts "Example 2: #{words.group_by(&:length).inspect}"

# Example 3: Group hash entries by value
scores = { alice: 90, bob: 75, charlie: 90 }
puts "Example 3: #{scores.group_by { |_name, score| score }.inspect}"

# Example 4: Group objects by attribute
class User
  attr_reader :role

  def initialize(role)
    @role = role
  end
end

users = [User.new("admin"), User.new("user"), User.new("admin")]
puts "Example 4: #{users.group_by(&:role).keys.inspect}"

# Example 5: Group with a fallback bucket
values = [nil, "a", nil, "b"]
result = values.group_by { |v| v.nil? ? :nil : :value }
puts "Example 5: #{result.inspect}"
