# frozen_string_literal: true

# Example 1: Basic yield - executing a block multiple times
def run_5_times
  5.times do
    yield
  end
end

run_5_times { puts 'Something' }

# Example 2: Yield with arguments - passing values to the block
def iterate_with_index
  x = 0
  while x < 5
    yield x, 55
    x += 1
  end
end

iterate_with_index { |i, v| puts "Something, index #{i}, value: #{v}" }

# Example 3: Yield for wrapping content - HTML-like structure
def wrap_in_body_tag
  puts "<body>"
  yield
  puts "</body>"
end

wrap_in_body_tag do
  puts "something!"
end

# Example 4: Yield in the middle - code before and after yield
def execute_with_wrapper
  puts "reached the top"
  yield
  puts "reached the bottom"
end

execute_with_wrapper do
  puts "reached yield"
end

# Example 5: Yield with parameters - passing data to block
def process_person_info
  yield("John", 2)
  # Note: 'name' variable is not accessible here - it's only in the block scope
end

process_person_info { |name, age| puts "#{name} is #{age} years old" }

# Example 6: Yield returning a value - capturing block's return value
def capture_block_result
  value = yield
  puts "value is: #{value}"
end

capture_block_result do
  2
end

# Example 7: Yield with conditional execution - checking if block is given
def execute_if_block_given
  if block_given?
    result = yield("Hello")
    puts "Block returned: #{result}"
  else
    puts "No block provided"
  end
end

execute_if_block_given { |message| message.upcase }
execute_if_block_given

# Example 8: Yield multiple times - iterating and yielding
def generate_sequence(start, step, length)
  (0..(length - 1)).each do |i|
    value = start + step * i
    yield value
  end
end

puts "Sequence example:"
generate_sequence(5, 1, 5) do |x|
  puts x
end

# Example 9: Yield with array processing - transforming data
def process_array(numbers)
  result = []
  numbers.each do |num|
    transformed = yield(num)
    result << transformed
  end
  result
end

doubled = process_array([1, 2, 3, 4]) { |n| n * 2 }
puts "Doubled array: #{doubled}"

# Example 10: Yield with early return - breaking out of iteration
def find_first_match(numbers)
  numbers.each do |num|
    if yield(num)
      return num
    end
  end
  nil
end

found = find_first_match([1, 2, 3, 4, 5]) { |n| n > 3 }
puts "First number greater than 3: #{found}"

# Example 11: Yield with multiple yields - different execution points
def multi_stage_processing
  puts "Stage 1: Initialization"
  yield("init")
  
  puts "Stage 2: Processing"
  yield("process")
  
  puts "Stage 3: Finalization"
  yield("finalize")
end

multi_stage_processing do |stage|
  puts "  Executing #{stage} stage"
end

# Example 12: Yield with error handling
def safe_execute
  begin
    yield
  rescue StandardError => e
    puts "Error occurred: #{e.message}"
  end
end

safe_execute do
  puts "This will execute safely"
end

safe_execute do
  raise "Something went wrong!"
end

# Example 13: Class with yield - encapsulating iteration logic
class NumberSequence
  def initialize(start, step, length)
    @start = start
    @step = step
    @length = length
  end

  def each
    (0..(@length - 1)).each do |i|
      value = @start + @step * i
      yield value
    end
  end

  def print_sequence
    each do |x|
      puts x
    end
  end
end

sequence = NumberSequence.new(5, 1, 5)
puts "NumberSequence example:"
sequence.print_sequence

puts "\nUsing each directly:"
sequence.each { |x| puts "Value: #{x}" }

# Example 14: Yield with accumulator pattern
def accumulate(numbers, initial_value)
  result = initial_value
  numbers.each do |num|
    result = yield(result, num)
  end
  result
end

sum = accumulate([1, 2, 3, 4, 5], 0) { |acc, num| acc + num }
puts "Sum: #{sum}"

product = accumulate([1, 2, 3, 4], 1) { |acc, num| acc * num }
puts "Product: #{product}"
