# frozen_string_literal: true
#
# Topic: `inspect`
# Purpose: Produce developer-friendly string representations.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `inspect` vs `to_s`
# output: Example 1: inspect="hello", to_s=hello
text = "hello"
puts "Example 1: inspect=#{text.inspect}, to_s=#{text.to_s}"

# Example 2: Array and hash inspect
# output: Example 2: array=[1, 2, 3], hash={:a=>1, :b=>2}
array = [1, 2, 3]
hash = { a: 1, b: 2 }
puts "Example 2: array=#{array.inspect}, hash=#{hash.inspect}"

# Example 3: Inspect in debugging output
# output: Example 3: {:name=>"Alice", :roles=>["admin", "editor"]}
user = { name: "Alice", roles: ["admin", "editor"] }
puts "Example 3: #{user.inspect}"

# Example 4: Custom `inspect`
# output: Example 4: #<Point x=2 y=3>
class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  def inspect
    "#<Point x=#{@x} y=#{@y}>"
  end
end

puts "Example 4: #{Point.new(2, 3).inspect}"

# Example 5: `inspect` preserves quotes and escapes
# output: Example 5: "line1\nline2"
text = "line1\nline2"
puts "Example 5: #{text.inspect}"
