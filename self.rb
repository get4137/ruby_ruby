# frozen_string_literal: true

# Example 1: Basic self in class method
class Person
  def self.greet
    puts 'Hello'
  end
end

Person.greet

# Example 2: Self in instance method vs class method
class Person
  attr_reader :name

  def initialize
    @name = 'Alice'
  end

  def self.greet  # Class method
    puts 'Hello from class'
  end

  def greet_instance  # Instance method
    puts 'Hello from instance'
  end
end

Person.greet
person1 = Person.new
puts person1.name
person1.greet_instance

# Example 3: Self in different classes - each class has its own self
class Manager
  def self.greet
    puts 'Hello, I am a Manager'
  end
end

class Developer
  def self.greet
    puts 'Hello, I am a Developer'
  end
end

class Designer
  def self.greet
    puts 'Hello, I am a Designer'
  end
end

Manager.greet
Developer.greet
Designer.greet

# Example 4: Self in instance method - refers to instance
class Calculator
  def initialize(value)
    @value = value
  end

  def add(number)
    self.value += number  # self refers to the instance
  end

  def value
    @value
  end

  def value=(new_value)
    @value = new_value
  end
end

calc = Calculator.new(10)
calc.add(5)
puts "Result: #{calc.value}"

# Example 5: Self as explicit receiver
class Counter
  def initialize
    @count = 0
  end

  def increment
    self.count += 1  # Explicit self
    # count += 1 would also work, but self is clearer
  end

  def count
    @count
  end

  def count=(value)
    @count = value
  end
end

counter = Counter.new
counter.increment
puts "Count: #{counter.count}"

# Example 6: Self in class method definition
class MathUtils
  def self.square(n)
    n * n
  end

  # Alternative syntax
  class << self
    def cube(n)
      n * n * n
    end
  end
end

puts MathUtils.square(5)
puts MathUtils.cube(3)

# Example 7: Self in module
module Helper
  def self.help
    puts "Helper method"
  end

  def self.format(text)
    text.upcase
  end
end

Helper.help
puts Helper.format("hello")

# Example 8: Self in instance method accessing instance variables
class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    self.balance += amount  # Using self to call setter
  end

  def balance
    @balance
  end

  def balance=(value)
    @balance = value
  end
end

account = BankAccount.new(1000)
account.deposit(500)
puts "Balance: #{account.balance}"

# Example 9: Self vs implicit self
class Example
  def initialize(name)
    @name = name
  end

  def display_implicit
    puts @name  # Implicit - no self needed
  end

  def display_explicit
    puts self.name  # Explicit self
  end

  def name
    @name
  end
end

example = Example.new("Ruby")
example.display_implicit
example.display_explicit

# Example 10: Self in singleton method
class Widget
  def initialize(name)
    @name = name
  end
end

widget = Widget.new("Special")

def widget.display
  self.name  # self refers to the widget instance
end

def widget.name
  @name
end

puts widget.display

# Example 11: Self in block context
class Processor
  def initialize(items)
    @items = items
  end

  def process
    @items.each do |item|
      puts "Processing #{item} in context of #{self.class}"
    end
  end
end

processor = Processor.new([1, 2, 3])
processor.process

# Example 12: Self in class << self block
class Configuration
  class << self
    def load
      puts "Loading configuration"
    end

    def save
      puts "Saving configuration"
    end
  end
end

Configuration.load
Configuration.save

# Example 13: Self in method chaining
class Builder
  def initialize
    @parts = []
  end

  def add_part(part)
    @parts << part
    self  # Return self for chaining
  end

  def build
    @parts.join('-')
  end
end

builder = Builder.new
result = builder.add_part("part1").add_part("part2").build
puts result

# Example 14: Self in comparison methods
class Person
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  def >(other)
    self.age > other.age
  end

  def <(other)
    self.age < other.age
  end
end

person1 = Person.new(30)
person2 = Person.new(25)
puts "Person1 older: #{person1 > person2}"

# Example 15: Self in private method call
class Example
  def public_method
    private_method  # Can call without self
    self.private_method  # Also works with self
  end

  private

  def private_method
    puts "Private method called"
  end
end

example = Example.new
example.public_method

# Example 16: Self in protected method call
class Example
  def public_method
    protected_method  # Can call without self
    self.protected_method  # Also works with self
  end

  protected

  def protected_method
    puts "Protected method called"
  end
end

example = Example.new
example.public_method

# Example 17: Self in class method calling instance method
class Example
  def self.create_instance
    new  # Creates new instance
  end

  def initialize
    @value = 42
  end

  def display
    puts "Value: #{@value}"
  end
end

instance = Example.create_instance
instance.display

# Example 18: Self in module instance method
module Greeter
  def greet
    "Hello from #{self.class}"
  end
end

class Person
  include Greeter
end

person = Person.new
puts person.greet

# Example 19: Self in class method vs instance method
class Calculator
  def self.class_add(a, b)  # Class method
    a + b
  end

  def instance_add(a, b)  # Instance method
    self.class_add(a, b)  # Can call class method from instance
  end
end

puts Calculator.class_add(5, 3)
calc = Calculator.new
puts calc.instance_add(5, 3)

# Example 20: Self in inheritance
class Parent
  def self.parent_class_method
    "Parent class method"
  end

  def parent_instance_method
    "Parent instance method from #{self.class}"
  end
end

class Child < Parent
  def self.child_class_method
    "Child class method"
  end
end

puts Child.parent_class_method
child = Child.new
puts child.parent_instance_method

# Example 21: Self in method_missing
class Dynamic
  def method_missing(method_name, *args)
    puts "Called #{method_name} on #{self.class}"
    super
  end
end

dynamic = Dynamic.new
begin
  dynamic.unknown_method
rescue NoMethodError
  puts "Method missing handled"
end

# Example 22: Self in define_method
class DynamicMethods
  [:method1, :method2, :method3].each do |method_name|
    define_method(method_name) do
      "Called #{method_name} on #{self.class}"
    end
  end
end

dynamic = DynamicMethods.new
puts dynamic.method1
puts dynamic.method2

# Example 23: Self in alias_method
class Example
  def original_method
    puts "Original"
  end

  alias_method :aliased_method, :original_method

  def call_both
    self.original_method
    self.aliased_method
  end
end

example = Example.new
example.call_both

# Example 24: Self in super call
class Parent
  def greet
    "Hello from Parent"
  end
end

class Child < Parent
  def greet
    "#{super} and #{self.class}"
  end
end

child = Child.new
puts child.greet

# Example 25: Self in class variable access
class Counter
  @@count = 0

  def self.increment
    @@count += 1
  end

  def self.count
    @@count
  end

  def instance_count
    self.class.count  # Access class method from instance
  end
end

Counter.increment
Counter.increment
puts "Class count: #{Counter.count}"

counter = Counter.new
puts "Instance accessing class count: #{counter.instance_count}"

# Example 26: Self in constant access
class ConstantsExample
  CONSTANT_VALUE = 42

  def self.get_constant
    CONSTANT_VALUE
  end

  def get_constant_from_instance
    self.class::CONSTANT_VALUE  # Access class constant
  end
end

puts ConstantsExample.get_constant
example = ConstantsExample.new
puts example.get_constant_from_instance

# Example 27: Self in singleton class
class Example
  def initialize(name)
    @name = name
  end
end

example = Example.new("Test")

class << example
  def display
    "Displaying #{@name} from singleton class"
  end
end

puts example.display

# Example 28: Self in block vs method context
class ContextExample
  def initialize
    @value = "instance value"
  end

  def demonstrate
    puts "In method: #{self.class}"
    [1, 2, 3].each do |item|
      puts "In block: #{self.class}, item: #{item}"
    end
  end
end

example = ContextExample.new
example.demonstrate

# Example 29: Self in class method with instance creation
class Factory
  def self.create(type)
    case type
    when :type1
      Type1.new
    when :type2
      Type2.new
    else
      raise "Unknown type"
    end
  end
end

class Type1
  def initialize
    @type = "Type1"
  end
end

class Type2
  def initialize
    @type = "Type2"
  end
end

instance1 = Factory.create(:type1)
instance2 = Factory.create(:type2)

# Example 30: Self in method returning self
class Chainable
  def initialize
    @chain = []
  end

  def step1
    @chain << "step1"
    self  # Return self for chaining
  end

  def step2
    @chain << "step2"
    self
  end

  def result
    @chain.join(" -> ")
  end
end

chain = Chainable.new
result = chain.step1.step2.result
puts result

# Example 31: Self in class method vs instance method visibility
class VisibilityExample
  def self.public_class_method
    "Public class method"
  end

  private_class_method def self.private_class_method
    "Private class method"
  end

  def public_instance_method
    self.class.private_class_method  # Can call from instance
  end
end

puts VisibilityExample.public_class_method
example = VisibilityExample.new
puts example.public_instance_method

# Example 32: Self in module method
module Utility
  def self.helper
    "Helper utility"
  end

  module_function

  def utility_method
    "Utility method from #{self.class}"
  end
end

puts Utility.helper
puts Utility.utility_method

# Example 33: Self in nested classes
class Outer
  class Inner
    def self.inner_class_method
      "Inner class method"
    end

    def inner_instance_method
      "Inner instance method, outer is #{Outer}"
    end
  end

  def self.outer_class_method
    "Outer class method"
  end
end

puts Outer::Inner.inner_class_method
inner = Outer::Inner.new
puts inner.inner_instance_method

# Example 34: Self in method with conditional
class ConditionalExample
  def initialize(value)
    @value = value
  end

  def process
    if @value > 10
      self.multiply
    else
      self.add
    end
  end

  def multiply
    @value *= 2
  end

  def add
    @value += 5
  end

  def value
    @value
  end
end

example1 = ConditionalExample.new(15)
example1.process
puts "Result: #{example1.value}"

example2 = ConditionalExample.new(5)
example2.process
puts "Result: #{example2.value}"

# Example 35: Self in method delegation
class Delegator
  def initialize(target)
    @target = target
  end

  def method_missing(method_name, *args)
    if @target.respond_to?(method_name)
      @target.send(method_name, *args)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @target.respond_to?(method_name, include_private) || super
  end
end

class Target
  def greet(name)
    "Hello, #{name}!"
  end
end

target = Target.new
delegator = Delegator.new(target)
puts delegator.greet("Ruby")

# Example 36: Self in class method with block
class Processor
  def self.process_items(items, &block)
    items.each do |item|
      block.call(item, self)  # Pass self (the class) to block
    end
  end
end

Processor.process_items([1, 2, 3]) do |item, processor_class|
  puts "Processing #{item} with #{processor_class}"
end

# Example 37: Self in instance method with block
class ItemProcessor
  def initialize(name)
    @name = name
  end

  def process_items(items, &block)
    items.each do |item|
      block.call(item, self)  # Pass self (the instance) to block
    end
  end
end

processor = ItemProcessor.new("MyProcessor")
processor.process_items([1, 2, 3]) do |item, processor_instance|
  puts "Processing #{item} with #{processor_instance.class}"
end

# Example 38: Self in method returning class
class Factory
  def self.create
    new
  end

  def self
    self.class  # Return the class
  end
end

factory = Factory.create
puts "Factory class: #{factory.self}"

# Example 39: Self in method with instance_eval
class Container
  def initialize(value)
    @value = value
  end
end

container = Container.new(42)
container.instance_eval do
  def get_value
    @value  # self is the container instance here
  end
end

puts container.get_value

# Example 40: Self summary
# self refers to the current object:
# - In class methods: self is the class
# - In instance methods: self is the instance
# - In blocks: self is the object where the block is defined
# - In singleton methods: self is the specific instance
#
# Use self when:
# - Calling setter methods (self.value = x)
# - Method chaining (return self)
# - Disambiguating method calls
# - Accessing class methods from instance (self.class.method)
# - Making code more explicit and readable
