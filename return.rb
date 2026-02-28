# frozen_string_literal: true
#
# Topic: `return`
# Purpose: Exit early and return values from methods.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Early return
# output: Example 1: Hello, Alice
# output: Example 1: No name

def greet(name)
  return "No name" if name.nil? || name.empty?
  "Hello, #{name}"
end

puts "Example 1: #{greet("Alice")}"
puts "Example 1: #{greet("")}"

# Example 2: Implicit return of last expression
# output: Example 2: 5

def add(a, b)
  a + b
end

puts "Example 2: #{add(2, 3)}"

# Example 3: Returning multiple values
# output: Example 3: min=1, max=4, sum=10

def stats(numbers)
  [numbers.min, numbers.max, numbers.sum]
end

min, max, sum = stats([1, 2, 3, 4])
puts "Example 3: min=#{min}, max=#{max}, sum=#{sum}"

# Example 4: Return inside a block (breaks the method)
# output: Example 4: 4

def first_even(numbers)
  numbers.each do |n|
    return n if n.even?
  end
  nil
end

puts "Example 4: #{first_even([1, 3, 4, 7])}"

# Example 5: `return` in lambdas vs procs
# output: Example 5: result=lambda

def lambda_return
  handler = -> { return "lambda" }
  "result=#{handler.call}"
end

puts "Example 5: #{lambda_return}"
