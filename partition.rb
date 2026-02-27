# frozen_string_literal: true
#
# Topic: `partition`
# Purpose: Split a collection into matched and unmatched arrays.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Partition by parity
numbers = [1, 2, 3, 4, 5]
evens, odds = numbers.partition(&:even?)
puts "Example 1: evens=#{evens.inspect}, odds=#{odds.inspect}"

# Example 2: Partition words by length
words = %w[ant bear cat dog]
long, short = words.partition { |w| w.length >= 4 }
puts "Example 2: long=#{long.inspect}, short=#{short.inspect}"

# Example 3: Partition with objects
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
empty = []
left, right = empty.partition { |x| x }
puts "Example 4: #{left.inspect} / #{right.inspect}"
