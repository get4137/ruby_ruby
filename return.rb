# frozen_string_literal: true

# Example 1: Basic return - early exit from method
def say_something
  puts 'Hello'
  return  # Early exit (similar to break, but for methods)
  puts 'This will not be executed'
end

say_something

# Example 2: Return with value
def get_number
  return 42
  puts 'This will not execute'
end

result = get_number
puts "Result: #{result}"

# Example 3: Return without value (returns nil)
def do_something
  puts 'Doing something'
  return
end

result = do_something
puts "Return value: #{result.inspect}"

# Example 4: Implicit return (last expression)
def calculate_sum(a, b)
  a + b  # Implicit return - no explicit return needed
end

puts "Sum: #{calculate_sum(5, 3)}"

# Example 5: Explicit return vs implicit return
def explicit_return
  return "Explicit"
  "This won't execute"
end

def implicit_return
  "Implicit"  # This is returned
end

puts explicit_return
puts implicit_return

# Example 6: Return with multiple values (array)
def get_coordinates
  return [10, 20, 30]
end

x, y, z = get_coordinates
puts "Coordinates: x=#{x}, y=#{y}, z=#{z}"

# Example 7: Return with hash
def get_person_info
  return { name: "Alice", age: 30, city: "NYC" }
end

info = get_person_info
puts "Person info: #{info.inspect}"

# Example 8: Return with conditional
def check_value(value)
  return "Positive" if value > 0
  return "Zero" if value == 0
  return "Negative"
end

puts check_value(5)
puts check_value(0)
puts check_value(-5)

# Example 9: Return in if-else
def process_number(num)
  if num.even?
    return "Even number"
  else
    return "Odd number"
  end
end

puts process_number(4)
puts process_number(5)

# Example 10: Return in case statement
def get_day_type(day)
  case day
  when 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'
    return "Weekday"
  when 'Saturday', 'Sunday'
    return "Weekend"
  else
    return "Unknown"
  end
end

puts get_day_type('Monday')
puts get_day_type('Saturday')

# Example 11: Return with early exit pattern
def find_first_even(numbers)
  numbers.each do |num|
    return num if num.even?
  end
  nil  # Return nil if no even number found
end

numbers = [1, 3, 5, 8, 9]
puts "First even: #{find_first_even(numbers)}"

# Example 12: Return in loop
def find_target(numbers, target)
  numbers.each do |num|
    return "Found #{target}" if num == target
  end
  "Not found"
end

puts find_target([1, 2, 3, 4, 5], 3)
puts find_target([1, 2, 3, 4, 5], 10)

# Example 13: Return with rescue
def safe_divide(a, b)
  return a / b
rescue ZeroDivisionError
  return "Cannot divide by zero"
end

puts safe_divide(10, 2)
puts safe_divide(10, 0)

# Example 14: Return with ensure
def operation_with_cleanup
  return "Result"
ensure
  puts "Cleanup executed even with return"
end

puts operation_with_cleanup

# Example 15: Return in nested methods
def outer_method
  inner_method
  "Outer result"
end

def inner_method
  return "Inner result"
end

puts outer_method

# Example 16: Return vs break in blocks
def demonstrate_return_vs_break
  [1, 2, 3].each do |num|
    puts "Processing #{num}"
    return "Returned from method" if num == 2
  end
  "End of method"
end

puts demonstrate_return_vs_break

def demonstrate_break
  result = [1, 2, 3].each do |num|
    puts "Processing #{num}"
    break "Broke from block" if num == 2
  end
  "End of method: #{result}"
end

puts demonstrate_break

# Example 17: Return with yield
def method_with_yield
  yield
  return "After yield"
end

result = method_with_yield do
  return "Returned from block"  # This returns from the block's context
end
puts result

# Example 18: Return in class method
class Calculator
  def self.add(a, b)
    return a + b
  end

  def self.multiply(a, b)
    a * b  # Implicit return
  end
end

puts Calculator.add(5, 3)
puts Calculator.multiply(4, 2)

# Example 19: Return in instance method
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def can_vote?
    return false if @age < 18
    true
  end
end

person1 = Person.new("Alice", 20)
person2 = Person.new("Bob", 16)
puts "Can vote? #{person1.can_vote?}"
puts "Can vote? #{person2.can_vote?}"

# Example 20: Return with multiple returns
def process_value(value)
  return "Too small" if value < 0
  return "Too large" if value > 100
  return "Perfect"
end

puts process_value(-5)
puts process_value(50)
puts process_value(150)

# Example 21: Return with guard clauses
def process_user(user)
  return "User is nil" if user.nil?
  return "User is empty" if user.empty?
  "Processing user: #{user}"
end

puts process_user(nil)
puts process_user("")
puts process_user("Alice")

# Example 22: Return with method chaining
class Builder
  def initialize
    @parts = []
  end

  def add_part(part)
    return self if part.nil?  # Early return for chaining
    @parts << part
    self
  end

  def build
    @parts.join('-')
  end
end

builder = Builder.new
result = builder.add_part("part1").add_part(nil).add_part("part2").build
puts result

# Example 23: Return with super
class Parent
  def greet
    "Hello from parent"
  end
end

class Child < Parent
  def greet
    return super if some_condition
    "Hello from child"
  end

  def some_condition
    false
  end
end

child = Child.new
puts child.greet

# Example 24: Return with alias
class Example
  def original_method
    return "Original"
  end

  alias_method :aliased_method, :original_method
end

example = Example.new
puts example.aliased_method

# Example 25: Return in module method
module Helper
  def self.help
    return "Help message"
  end
end

puts Helper.help

# Example 26: Return with method_missing
class Dynamic
  def method_missing(method_name, *args)
    return "Handled: #{method_name}" if method_name.to_s.start_with?('handle_')
    super
  end
end

dynamic = Dynamic.new
puts dynamic.handle_something

# Example 27: Return with define_method
class DynamicMethods
  [:method1, :method2].each do |method_name|
    define_method(method_name) do
      return "Called #{method_name}"
    end
  end
end

dynamic = DynamicMethods.new
puts dynamic.method1
puts dynamic.method2

# Example 28: Return value types
def return_string
  return "String"
end

def return_number
  return 42
end

def return_array
  return [1, 2, 3]
end

def return_hash
  return { key: "value" }
end

def return_symbol
  return :symbol
end

def return_nil
  return nil
end

puts return_string
puts return_number
puts return_array.inspect
puts return_hash.inspect
puts return_symbol
puts return_nil.inspect

# Example 29: Return with block return value
def process_with_block
  result = yield
  return "Block returned: #{result}"
end

output = process_with_block do
  return "From block"  # Returns from the block's context
end
puts output

# Example 30: Return in private method
class Example
  def public_method
    private_method
  end

  private

  def private_method
    return "Private method result"
  end
end

example = Example.new
puts example.public_method

# Example 31: Return with protected method
class Example
  def public_method
    protected_method
  end

  protected

  def protected_method
    return "Protected method result"
  end
end

example = Example.new
puts example.public_method

# Example 32: Return vs next in blocks
def demonstrate_next
  result = [1, 2, 3].map do |num|
    next "Skipped" if num == 2
    num * 2
  end
  result
end

puts demonstrate_next.inspect

# Example 33: Return with exception handling
def safe_operation
  return "Success"
rescue => e
  return "Error: #{e.message}"
end

puts safe_operation

# Example 34: Return with retry
def operation_with_retry(attempts = 0)
  return "Failed after 3 attempts" if attempts >= 3
  raise "Error" if attempts < 2
  "Success"
rescue
  operation_with_retry(attempts + 1)
end

puts operation_with_retry

# Example 35: Return in lambda
my_lambda = lambda do |x|
  return x * 2
end

puts my_lambda.call(5)

# Example 36: Return in proc
my_proc = proc do |x|
  return x * 2  # Note: return in proc returns from enclosing method!
end

def test_proc_return
  my_proc.call(5)
  "This won't execute"
end

puts test_proc_return

# Example 37: Return with splat operator
def get_multiple_values
  return *[1, 2, 3]  # Returns array
end

puts get_multiple_values.inspect

# Example 38: Return with keyword arguments
def greet(name:, age:)
  return "Hello, #{name}, age #{age}"
end

puts greet(name: "Alice", age: 30)

# Example 39: Return with default arguments
def calculate(amount, discount: 0)
  return amount - discount
end

puts calculate(100)
puts calculate(100, discount: 20)

# Example 40: Return summary
# return statement:
# - Exits the method immediately
# - Can return a value or nil
# - Similar to break, but for methods
# - Can be used with or without a value
# - Implicit return: last expression is returned
# - Explicit return: use 'return' keyword
#
# Differences:
# - return: exits method
# - break: exits loop/block
# - next: skips to next iteration
# - redo: restarts current iteration
