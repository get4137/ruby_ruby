# frozen_string_literal: true
#
# Topic: `partition`
# Purpose: Split a collection into matched and unmatched arrays.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Partition by parity
# output: Example 1: evens=[2, 4], odds=[1, 3, 5]
numbers = [1, 2, 3, 4, 5]
evens, odds = numbers.partition(&:even?)
puts "Example 1: evens=#{evens.inspect}, odds=#{odds.inspect}"

# Example 2: Partition words by length
# output: Example 2: long=["bear"], short=["ant", "cat", "dog"]
words = %w[ant bear cat dog]
long, short = words.partition { |w| w.length >= 4 }
puts "Example 2: long=#{long.inspect}, short=#{short.inspect}"

# Example 3: Partition with objects
# output: Example 3: active=2, inactive=1
class User
  attr_reader :active

  def initialize(active)
    @active = active
  end

  def active?
    @active
  end
end

users = [User.new(true), User.new(false), User.new(true)]
active, inactive = users.partition(&:active?)
puts "Example 3: active=#{active.size}, inactive=#{inactive.size}"

# Example 4: Empty collection
# output: Example 4: [] / []
empty = []
left, right = empty.partition { |x| x }
puts "Example 4: #{left.inspect} / #{right.inspect}"
