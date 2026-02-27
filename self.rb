# frozen_string_literal: true
#
# Topic: `self`
# Purpose: Show how `self` changes by scope.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `self` in class context
class Person
  puts "Example 1: self in class body is #{self}"

  def self.greet
    "Hello from class method"
  end

  def greet
    "Hello from instance method"
  end
end

puts "Example 1: #{Person.greet}"

# Example 2: `self` inside an instance method
person = Person.new
puts "Example 2: #{person.greet}"

# Example 3: `self` inside a module method
module Tools
  def self.name
    self
  end
end

puts "Example 3: #{Tools.name}"

# Example 4: `self` used for setters
class Counter
  attr_accessor :count

  def initialize
    @count = 0
  end

  def increment
    self.count = count + 1
  end
end

counter = Counter.new
counter.increment
puts "Example 4: #{counter.count}"
