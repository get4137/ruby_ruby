# frozen_string_literal: true
#
# Topic: `yield`
# Purpose: Execute a block passed to a method.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic yield
# output: Example 1: running

def run_three_times
  3.times { yield }
end

run_three_times { puts "Example 1: running" }

# Example 2: Yield with arguments
# output: Example 2: John (30)
# output: Example 2: Jane (28)

def each_pair
  yield("John", 30)
  yield("Jane", 28)
end

each_pair { |name, age| puts "Example 2: #{name} (#{age})" }

# Example 3: `block_given?`
# output: Example 3: HELLO
# output: Example 3: no block

def maybe_yield
  return "no block" unless block_given?
  yield("hello")
end

puts "Example 3: #{maybe_yield { |msg| msg.upcase }}"
puts "Example 3: #{maybe_yield}"

# Example 4: Capture a block's return value
# output: Example 4: result=5

def capture
  result = yield
  "result=#{result}"
end

puts "Example 4: #{capture { 2 + 3 }}"

# Example 5: Yield for transformation
# output: Example 5: [2, 4, 6]

def transform(numbers)
  numbers.map { |n| yield(n) }
end

puts "Example 5: #{transform([1, 2, 3]) { |n| n * 2 }.inspect}"

# Example 6: Custom each
# output: Example 6: 5
# output: Example 6: 6
# output: Example 6: 7
class NumberSequence
  def initialize(start, step, length)
    @start = start
    @step = step
    @length = length
  end

  def each
    (0...@length).each do |i|
      yield @start + @step * i
    end
  end
end

sequence = NumberSequence.new(5, 1, 3)
sequence.each { |n| puts "Example 6: #{n}" }
