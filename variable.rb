# frozen_string_literal: true
#
# Topic: Variables and scope
# Purpose: Show local, instance, class, and global variables.
#
# Example 1: Local variable scope
local_var = 1
puts "Example 1: #{local_var}"

# Example 2: Instance variables on the top-level object
@counter = 1
puts "Example 2: #{@counter}"

# Example 3: Instance variable inside a class
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

person = Person.new("Alice")
puts "Example 3: #{person.name}"

# Example 4: Class variables
class Counter
  @@total = 0

  def initialize
    @@total += 1
  end

  def self.total
    @@total
  end
end

Counter.new
Counter.new
puts "Example 4: #{Counter.total}"

# Example 5: Class instance variables
class Settings
  @instance_count = 0

  def self.increment
    @instance_count += 1
  end

  def self.instance_count
    @instance_count
  end
end

Settings.increment
Settings.increment
puts "Example 5: #{Settings.instance_count}"

# Example 6: Global variables (use sparingly)
$global_counter = 0

def increment_global
  $global_counter += 1
end

increment_global
increment_global
puts "Example 6: #{$global_counter}"

# Example 7: Constants
MAX_ATTEMPTS = 3
puts "Example 7: #{MAX_ATTEMPTS}"

# Example 8: Parallel assignment
first, second = [10, 20]
puts "Example 8: first=#{first}, second=#{second}"

# Example 9: Splat assignment
head, *tail = [1, 2, 3, 4]
puts "Example 9: head=#{head}, tail=#{tail.inspect}"

# Example 10: Conditional assignment with ||= 
value = nil
value ||= 10
puts "Example 10: #{value}"

# Example 11: Block scope and shadowing
value = 100
[1, 2, 3].each do |value|
  puts "Example 11: inner=#{value}"
end
puts "Example 11: outer=#{value}"
