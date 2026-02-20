# frozen_string_literal: true

# Example 1: Instance variable scope - accessible across methods
@counter = 1
puts "Variable @counter equals: #{@counter}"

def increment_counter
  @counter = 2
  print 'Enter password: '
  return gets.strip
end

password = increment_counter
puts "Password entered: #{password}"
puts "Variable @counter equals: #{@counter}"

# Example 2: Instance variable persistence across method calls
@value = 1
puts @value

def modify_value
  @value = 2
end

puts @value  # Still 1
modify_value
puts @value  # Now 2

# Example 3: Local variable scope - limited to method
local_var = 1
puts "Variable local_var equals: #{local_var}"

def get_user_input
  local_var = 2  # Different variable, doesn't affect outer scope
  print 'Enter password: '
  gets.strip
end

user_input = get_user_input
puts "Password entered: #{user_input}"
puts "Variable local_var equals: #{local_var}"  # Still 1

# Example 4: Variable swapping - parallel assignment
first_number = 50
second_number = 20
first_number, second_number = second_number, first_number
puts first_number  # 20
puts second_number  # 50

# Example 5: Logical OR assignment - default values
default_value = 10
result = result || default_value
puts result  # 10

assigned_value = 3
assigned_value = assigned_value || default_value
puts assigned_value  # 3 (keeps original value)

# Example 6: ||= operator - conditional assignment
value = nil
value ||= default_value
puts value  # 10

value = 5
value ||= default_value
puts value  # 5 (not reassigned)

# Example 7: Class variables - shared across instances
class Counter
  @@total_count = 0

  def initialize
    @@total_count += 1
  end

  def self.total
    @@total_count
  end
end

Counter.new
Counter.new
puts "Total instances: #{Counter.total}"

# Example 8: Global variables - accessible everywhere
$global_counter = 0

def increment_global
  $global_counter += 1
end

increment_global
increment_global
puts "Global counter: #{$global_counter}"

# Example 9: Constants - should not be changed
MAX_ATTEMPTS = 3
PI = 3.14159

def check_attempts(attempts)
  if attempts > MAX_ATTEMPTS
    puts "Exceeded maximum attempts: #{MAX_ATTEMPTS}"
  end
end

check_attempts(5)

# Example 10: Block-local variables - shadowing outer scope
outer_var = 100
5.times do |i|
  outer_var = i  # Can modify outer variable
  puts "i = #{i}, outer_var = #{outer_var}"
end
puts "outer_var after block: #{outer_var}"

# Example 11: Block-local variables with pipe - protecting outer scope
protected_var = 100
5.times do |i|
  protected_var = i  # Modifies outer variable
  puts "i = #{i}, protected_var = #{protected_var}"
end
puts "protected_var after block: #{protected_var}"

# Example 12: Variable shadowing in blocks
value = 10
[1, 2, 3].each do |value|  # Shadows outer 'value'
  puts "Block value: #{value}"
end
puts "Outer value: #{value}"  # Still 10

# Example 13: Multiple assignment from array
first, second, third = [1, 2, 3]
puts "First: #{first}, Second: #{second}, Third: #{third}"

# Example 14: Multiple assignment with splat operator
first, *rest = [1, 2, 3, 4, 5]
puts "First: #{first}"
puts "Rest: #{rest.inspect}"

# Example 15: Multiple assignment with fewer values
a, b, c = [1, 2]
puts "a: #{a}, b: #{b}, c: #{c.inspect}"

# Example 16: Multiple assignment with more values
x, y = [1, 2, 3, 4]
puts "x: #{x}, y: #{y}"

# Example 17: Variable assignment from method return
def get_name_and_age
  ["John", 25]
end

name, age = get_name_and_age
puts "Name: #{name}, Age: #{age}"

# Example 18: Instance variable initialization
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

person = Person.new("Alice")
puts "Person name: #{person.name}"
person.name = "Bob"
puts "Person name: #{person.name}"

# Example 19: Class instance variables
class Settings
  @instance_count = 0

  def self.instance_count
    @instance_count
  end

  def self.increment
    @instance_count += 1
  end
end

Settings.increment
Settings.increment
puts "Settings instances: #{Settings.instance_count}"

# Example 20: Variable scope in methods
def demonstrate_scope
  local_var = "I'm local"
  @instance_var = "I'm instance"
  @@class_var = "I'm class"
  $global_var = "I'm global"
end

demonstrate_scope
# puts local_var  # Error: undefined local variable
puts @instance_var
puts @@class_var
puts $global_var

# Example 21: Conditional assignment with &&=
counter = 5
counter &&= 10  # Only assigns if counter is truthy
puts counter  # 10

counter = nil
counter &&= 10  # Doesn't assign if counter is falsy
puts counter.inspect  # nil

# Example 22: Safe navigation and assignment
class User
  attr_accessor :name
end

user = User.new
user.name = "John"
user.name ||= "Guest"  # Only assigns if name is nil or false
puts user.name  # "John"

user2 = User.new
user2.name ||= "Guest"
puts user2.name  # "Guest"

# Example 23: Variable references and object identity
original = [1, 2, 3]
reference = original
reference << 4
puts "Original: #{original.inspect}"  # Modified!
puts "Same object? #{original.object_id == reference.object_id}"

# Example 24: Variable copying (dup/clone)
original_array = [1, 2, 3]
copy = original_array.dup
copy << 4
puts "Original: #{original_array.inspect}"  # Not modified
puts "Copy: #{copy.inspect}"

# Example 25: Freezing variables
frozen_string = "Hello".freeze
# frozen_string << " World"  # Error: can't modify frozen String

frozen_array = [1, 2, 3].freeze
# frozen_array << 4  # Error: can't modify frozen Array

puts "Frozen string: #{frozen_string}"
puts "Frozen array: #{frozen_array.inspect}"

# Example 26: Variable interpolation in strings
name = "Ruby"
version = 3.2
puts "Language: #{name}, Version: #{version}"

# Example 27: Variable in symbol
status = :active
puts "Status: #{status}"

# Example 28: Dynamic variable assignment
(1..5).each do |i|
  instance_variable_set("@var#{i}", i * 10)
end

puts @var1  # 10
puts @var3  # 30
puts @var5  # 50

# Example 29: Reading variables dynamically
@dynamic_var = "Hello"
var_name = "@dynamic_var"
puts instance_variable_get(var_name)

# Example 30: Local variable vs method call
def value
  "I'm a method"
end

value = "I'm a variable"
puts value  # "I'm a variable" (variable takes precedence)

# Example 31: Block variables with different scopes
outer = 10
[1, 2, 3].each do |num|
  inner = num * 2
  puts "Outer: #{outer}, Inner: #{inner}, Num: #{num}"
  # inner is only accessible within this block
end
# puts inner  # Error: undefined local variable

# Example 32: Variable assignment from conditional
result = if true
  "Success"
else
  "Failure"
end
puts result

# Example 33: Variable assignment from case statement
grade = case 85
when 90..100 then "A"
when 80..89 then "B"
when 70..79 then "C"
else "F"
end
puts "Grade: #{grade}"
