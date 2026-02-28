# frozen_string_literal: true
#
# Topic: Block, Proc, and Lambda
# Purpose: Show arity rules and return behavior differences.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: A block passed to a method
# output: Example 1: 1
# output: Example 1: 2
# output: Example 1: 3
[1, 2, 3].each { |n| puts "Example 1: #{n}" }

# Example 2: Proc vs lambda arity
# output: Example 2: proc=[1, nil], lambda=[1, 2]
loose = proc { |a, b| [a, b] }
strict = lambda { |a, b| [a, b] }
puts "Example 2: proc=#{loose.call(1).inspect}, lambda=#{strict.call(1, 2).inspect}"

# Example 3: `return` behavior
# output: Example 3: from proc
# output: Example 3: after lambda with from lambda

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
# output: Example 4: HELLO

def with_block(&block)
  block.call("hello")
end

puts "Example 4: #{with_block { |msg| msg.upcase }}"

# Example 5: Proc as a reusable callback
# output: Example 5: Hello, Alice
formatter = proc { |name| "Hello, #{name}" }
puts "Example 5: #{formatter.call("Alice")}"

# Example 6: Lambda as a guard (strict arity)
# output: Example 6: true
validator = ->(value) { value.is_a?(Integer) }
puts "Example 6: #{validator.call(10)}"
