# frozen_string_literal: true
#
# Topic: `uniq` with a block (uniq by key)
# Purpose: Remove duplicates based on a computed key.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Uniq by first letter
# output: Example 1: ["ant", "bear"]
words = %w[ant art arc bear]
puts "Example 1: #{words.uniq { |w| w[0] }.inspect}"

# Example 2: Uniq by length
# output: Example 2: ["cat", "bear"]
words = %w[cat bear dog lion]
puts "Example 2: #{words.uniq(&:length).inspect}"

# Example 3: Uniq objects by attribute
# output: Example 3: [1, 2]
class User
  attr_reader :id

  def initialize(id)
    @id = id
  end
end

users = [User.new(1), User.new(1), User.new(2)]
unique = users.uniq { |u| u.id }
puts "Example 3: #{unique.map(&:id).inspect}"

# Example 4: Uniq is stable (keeps first occurrence)
# output: Example 4: ["a1"]
values = %w[a1 a2 a3]
result = values.uniq { |v| v[0] }
puts "Example 4: #{result.inspect}"
