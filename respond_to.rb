# frozen_string_literal: true
#
# Topic: `respond_to?`
# Purpose: Check if an object implements a method.
#
# Example 1: Basic usage
text = "hello"
puts "Example 1: #{text.respond_to?(:upcase)}"

# Example 2: Checking a missing method
puts "Example 2: #{text.respond_to?(:missing_method)}"

# Example 3: Private methods with `respond_to?`
class Demo
  private

  def secret
    "secret"
  end
end

demo = Demo.new
puts "Example 3: public=#{demo.respond_to?(:secret)}, include_private=#{demo.respond_to?(:secret, true)}"

# Example 4: Guarding `public_send`
value = 42
method = :to_s
puts "Example 4: #{value.public_send(method)}"

# Example 5: Dynamic setter check
class Point
  attr_accessor :x
end

point = Point.new
if point.respond_to?(:x=)
  point.public_send(:x=, 5)
end
puts "Example 5: #{point.x}"
