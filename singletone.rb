# frozen_string_literal: true

# Example 1: Basic singleton method - adding method to specific instance
class Animal
  def make_sound
    puts 'Generic animal sound'
  end

  def move
    puts 'Animal moves'
  end
end

dog = Animal.new
cat = Animal.new

# Adding singleton method to dog instance
def dog.bark
  puts 'Woof!'
end

# Adding singleton method to cat instance
def cat.meow
  puts 'Meow!'
end

dog.make_sound
dog.move
dog.bark

cat.make_sound
cat.move
cat.meow

# Example 2: Singleton method with parameters
class Person
  def introduce
    puts 'Hello, I am a person'
  end
end

person1 = Person.new
person2 = Person.new

def person1.greet(name)
  puts "Hello, #{name}! Nice to meet you."
end

person1.introduce
person1.greet("Alice")

# person2.greet("Bob")  # Error: undefined method

# Example 3: Singleton method accessing instance variables
class Vehicle
  attr_accessor :brand

  def initialize(brand)
    @brand = brand
  end

  def start
    puts "#{@brand} vehicle started"
  end
end

car = Vehicle.new("Toyota")
truck = Vehicle.new("Ford")

def car.honk
  puts "#{@brand} car honks: Beep Beep!"
end

car.start
car.honk

# Example 4: Multiple singleton methods on same instance
class Product
  def initialize(name)
    @name = name
  end
end

product = Product.new("Widget")

def product.display_info
  puts "Product: #{@name}"
end

def product.calculate_price(quantity)
  quantity * 10
end

def product.apply_discount(percentage)
  puts "Applying #{percentage}% discount"
end

product.display_info
puts "Price for 5 items: #{product.calculate_price(5)}"
product.apply_discount(15)

# Example 5: Singleton method overriding instance method
class Calculator
  def add(a, b)
    a + b
  end
end

calc1 = Calculator.new
calc2 = Calculator.new

# Override add method for calc1 only
def calc1.add(a, b)
  puts "Custom addition for calc1"
  a + b + 1  # Add 1 extra
end

puts calc1.add(2, 3)  # Custom behavior
puts calc2.add(2, 3)  # Original behavior

# Example 6: Singleton method with class method
class Book
  def initialize(title)
    @title = title
  end

  def read
    puts "Reading #{@title}"
  end
end

book = Book.new("Ruby Guide")

def book.bookmark(page)
  puts "Bookmarked page #{page} in #{@title}"
end

book.read
book.bookmark(42)

# Example 7: Checking if method is singleton method
class Item
  def common_method
    puts "Common method"
  end
end

item = Item.new

def item.special_method
  puts "Special singleton method"
end

puts "Has common_method? #{item.respond_to?(:common_method)}"
puts "Has special_method? #{item.respond_to?(:special_method)}"
puts "Singleton methods: #{item.singleton_methods.inspect}"

# Example 8: Singleton method with blocks
class Task
  def initialize(name)
    @name = name
  end
end

task = Task.new("Important Task")

def task.execute(&block)
  puts "Executing #{@name}"
  block.call if block_given?
end

task.execute { puts "Task completed!" }

# Example 9: Singleton method returning values
class Counter
  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end
end

counter = Counter.new

def counter.reset
  @count = 0
  puts "Counter reset"
end

def counter.get_count
  @count
end

counter.increment
counter.increment
puts "Count: #{counter.get_count}"
counter.reset
puts "Count after reset: #{counter.get_count}"

# Example 10: Singleton method with class variables
class Logger
  @@log_count = 0

  def log(message)
    @@log_count += 1
    puts "[#{@@log_count}] #{message}"
  end
end

logger = Logger.new

def logger.log_error(error_message)
  puts "ERROR: #{error_message}"
  @@log_count += 1
end

logger.log("Normal message")
logger.log_error("Something went wrong")

# Example 11: Singleton method accessing other methods
class Account
  def initialize(balance)
    @balance = balance
  end

  def show_balance
    puts "Balance: $#{@balance}"
  end
end

account = Account.new(1000)

def account.withdraw(amount)
  @balance -= amount
  show_balance  # Calling instance method
end

account.show_balance
account.withdraw(200)

# Example 12: Singleton method with conditional logic
class User
  attr_accessor :role

  def initialize(role)
    @role = role
  end
end

admin = User.new("admin")
regular = User.new("user")

def admin.delete_user(user_id)
  puts "Admin deleting user #{user_id}"
end

def admin.view_all_users
  puts "Admin viewing all users"
end

admin.delete_user(123)
admin.view_all_users

# regular.delete_user(123)  # Error: undefined method

# Example 13: Singleton method with module inclusion
module Helper
  def help
    puts "Helper method"
  end
end

class Service
  include Helper
end

service1 = Service.new
service2 = Service.new

def service1.custom_help
  help  # Can call included method
  puts "Custom help for service1"
end

service1.help
service1.custom_help
service2.help
# service2.custom_help  # Error: undefined method

# Example 14: Singleton method with alias
class Processor
  def process
    puts "Processing..."
  end
end

processor = Processor.new

def processor.advanced_process
  process  # Call original method
  puts "Advanced processing complete"
end

processor.process
processor.advanced_process

# Example 15: Singleton method with method_missing
class Container
  def initialize(items)
    @items = items
  end

  def method_missing(method_name, *args)
    if @items.respond_to?(method_name)
      @items.send(method_name, *args)
    else
      super
    end
  end
end

container = Container.new([1, 2, 3])

def container.custom_size
  @items.size * 2
end

puts container.size  # Delegated to @items
puts container.custom_size  # Singleton method

# Example 16: Singleton method with private methods
class BankAccount
  def initialize(balance)
    @balance = balance
  end

  private

  def validate_amount(amount)
    amount > 0
  end
end

account = BankAccount.new(500)

def account.deposit(amount)
  if validate_amount(amount)  # Can access private methods
    @balance += amount
    puts "Deposited $#{amount}"
  else
    puts "Invalid amount"
  end
end

account.deposit(100)

# Example 17: Singleton method with protected methods
class Animal
  def initialize(name)
    @name = name
  end

  protected

  def make_sound
    puts "#{@name} makes a sound"
  end
end

dog = Animal.new("Dog")

def dog.bark_loudly
  make_sound  # Can access protected method
  puts "Woof! Woof!"
end

dog.bark_loudly

# Example 18: Singleton method with class inheritance
class Parent
  def inherited_method
    puts "From parent class"
  end
end

class Child < Parent
end

child = Child.new

def child.custom_method
  inherited_method  # Can call inherited method
  puts "Custom singleton method"
end

child.inherited_method
child.custom_method

# Example 19: Singleton method with instance_eval
class Widget
  def initialize(name)
    @name = name
  end
end

widget = Widget.new("Special Widget")

# Using instance_eval to define singleton method
widget.instance_eval do
  def display
    puts "Displaying #{@name}"
  end
end

widget.display

# Example 20: Singleton method checking with respond_to?
class Tool
  def use
    puts "Using tool"
  end
end

tool = Tool.new

def tool.repair(item)
  puts "Repairing #{item}"
end

puts "Responds to use? #{tool.respond_to?(:use)}"
puts "Responds to repair? #{tool.respond_to?(:repair)}"

# Example 21: Singleton method with method chaining
class Builder
  def initialize
    @parts = []
  end

  def add_part(part)
    @parts << part
    self
  end
end

builder = Builder.new

def builder.finalize
  puts "Finalizing with parts: #{@parts.join(', ')}"
end

builder.add_part("part1").add_part("part2").finalize

# Example 22: Singleton method with singleton_class
class Example
  def initialize(value)
    @value = value
  end
end

example = Example.new(42)

# Accessing singleton class
example.singleton_class.class_eval do
  def get_value
    @value
  end
end

puts example.get_value

# Example 23: Singleton method with define_method
class Processor
  def initialize(data)
    @data = data
  end
end

processor = Processor.new([1, 2, 3])

processor.singleton_class.define_method(:process_data) do
  @data.map { |x| x * 2 }
end

puts processor.process_data.inspect

# Example 24: Singleton method with method visibility
class Example
  def public_method
    puts "Public"
  end

  private

  def private_method
    puts "Private"
  end
end

instance = Example.new

def instance.singleton_public
  public_method
  private_method  # Can access private methods
end

instance.singleton_public

# Example 25: Singleton method with super
class Base
  def greet
    puts "Hello from base"
  end
end

class Derived < Base
end

derived = Derived.new

def derived.greet
  super  # Calls parent class method
  puts "Hello from singleton"
end

derived.greet
