# frozen_string_literal: true
#
# Topic: Equality in Ruby
# Purpose: Compare `==`, `eql?`, and `equal?`.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `==` compares values
puts "Example 1: #{10 == 10}"

# Example 2: `eql?` is stricter about type
puts "Example 2: #{10.eql?(10.0)}"

# Example 3: `equal?` compares object identity
text = "ruby"
alias_text = text
puts "Example 3: #{text.equal?(alias_text)}"

# Example 4: Two different objects with same value
text_a = "ruby"
text_b = "ruby"
puts "Example 4: ==#{text_a == text_b}, equal?=#{text_a.equal?(text_b)}"

# Example 5: Arrays compare by content
puts "Example 5: #{[1, 2] == [1, 2]}"

# Example 6: Hashes compare by content
puts "Example 6: #{ { a: 1 } == { a: 1 } }"

# Example 7: Symbols are singletons
puts "Example 7: #{:ruby.equal?(:ruby)}"

# Example 8: Custom `==` for a class
class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    other.is_a?(Point) && x == other.x && y == other.y
  end
end

puts "Example 8: #{Point.new(1, 2) == Point.new(1, 2)}"

# Example 9: `===` is case equality (used by `case`)
value = 5
result = case value
         when 1..10 then "in range"
         else "out of range"
         end
puts "Example 9: #{result}"

# Example 10: `eql?` used for Hash keys
hash = { 1 => "integer" }
puts "Example 10: #{hash[1.0].inspect}"
