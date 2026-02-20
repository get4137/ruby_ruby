# frozen_string_literal: true
#
# Topic: Modules
# Purpose: Namespacing, mixins, and module functions.
#
# Example 1: Module as a namespace
module Humans
  class Manager
    def greet
      "Hello from Manager"
    end
  end
end

manager = Humans::Manager.new
puts "Example 1: #{manager.greet}"

# Example 2: Module mixin for instance methods
module Drivable
  def drive
    "Driving"
  end
end

class Car
  include Drivable
end

puts "Example 2: #{Car.new.drive}"

# Example 3: Module for class methods using `extend`
module Identifiable
  def type
    name
  end
end

class Order
  extend Identifiable
end

puts "Example 3: #{Order.type}"

# Example 4: Module functions
module MathTools
  module_function

  def square(n)
    n * n
  end
end

puts "Example 4: #{MathTools.square(5)}"

# Example 5: `prepend` to wrap methods
module Logging
  def save
    "[LOG] #{super}"
  end
end

class Record
  def save
    "saved"
  end
end

class LoggedRecord < Record
  prepend Logging
end

puts "Example 5: #{LoggedRecord.new.save}"
