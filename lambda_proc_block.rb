# frozen_string_literal: true
#
# Topic: Block, Proc, and Lambda
# Purpose: Show arity rules and return behavior differences.
#
# Example 1: A block passed to a method
[1, 2, 3].each { |n| puts "Example 1: #{n}" }

# Example 2: Proc vs lambda arity
loose = proc { |a, b| [a, b] }
strict = lambda { |a, b| [a, b] }
puts "Example 2: proc=#{loose.call(1).inspect}, lambda=#{strict.call(1, 2).inspect}"

# Example 3: `return` behavior

def proc_return_demo
  handler = proc { return "from proc" }
  handler.call
  "after proc"
end

def lambda_return_demo
  handler = lambda { return "from lambda" }
  result = handler.call
  "after lambda with #{result}"
end

puts "Example 3: #{proc_return_demo}"
puts "Example 3: #{lambda_return_demo}"

# Example 4: Converting a block to a Proc

def with_block(&block)
  block.call("hello")
end

puts "Example 4: #{with_block { |msg| msg.upcase }}"

# Example 5: Proc as a reusable callback
formatter = proc { |name| "Hello, #{name}" }
puts "Example 5: #{formatter.call("Alice")}"

# Example 6: Lambda as a guard (strict arity)
validator = ->(value) { value.is_a?(Integer) }
puts "Example 6: #{validator.call(10)}"
