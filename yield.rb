# frozen_string_literal: true
#
# Topic: `yield`
# Purpose: Execute a block passed to a method.
#
# Example 1: Basic yield

def run_three_times
  3.times { yield }
end

run_three_times { puts "Example 1: running" }

# Example 2: Yield with arguments

def each_pair
  yield("John", 30)
  yield("Jane", 28)
end

each_pair { |name, age| puts "Example 2: #{name} (#{age})" }

# Example 3: `block_given?`

def maybe_yield
  return "no block" unless block_given?
  yield("hello")
end

puts "Example 3: #{maybe_yield { |msg| msg.upcase }}"
puts "Example 3: #{maybe_yield}"

# Example 4: Capture a block's return value

def capture
  result = yield
  "result=#{result}"
end

puts "Example 4: #{capture { 2 + 3 }}"

# Example 5: Yield for transformation

def transform(numbers)
  numbers.map { |n| yield(n) }
end

puts "Example 5: #{transform([1, 2, 3]) { |n| n * 2 }.inspect}"

# Example 6: Custom each
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
