# frozen_string_literal: true
#
# Topic: Equality in Ruby
# Purpose: Compare `==`, `eql?`, and `equal?`.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `==` compares values
# output: Example 1: true
puts "Example 1: #{10 == 10}"

# Example 2: `eql?` is stricter about type
# output: Example 2: false
puts "Example 2: #{10.eql?(10.0)}"

# Example 3: `equal?` compares object identity
# output: Example 3: true
text = "ruby"
alias_text = text
puts "Example 3: #{text.equal?(alias_text)}"

# Example 4: Two different objects with same value
# output: Example 4: ==true, equal?=true
text_a = "ruby"
text_b = "ruby"
puts "Example 4: ==#{text_a == text_b}, equal?=#{text_a.equal?(text_b)}"

# Example 5: Arrays compare by content
# output: Example 5: true
puts "Example 5: #{[1, 2] == [1, 2]}"

# Example 6: Hashes compare by content
# output: Example 6: true
puts "Example 6: #{ { a: 1 } == { a: 1 } }"

# Example 7: Symbols are singletons
# output: Example 7: true
puts "Example 7: #{:ruby.equal?(:ruby)}"

# Example 8: Custom `==` for a class
# output: Example 8: true
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
# output: Example 9: in range
value = 5
result = case value
         when 1..10 then "in range"
         else "out of range"
         end
puts "Example 9: #{result}"

# Example 10: `eql?` used for Hash keys
# output: Example 10: nil
hash = { 1 => "integer" }
puts "Example 10: #{hash[1.0].inspect}"
