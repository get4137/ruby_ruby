# frozen_string_literal: true

# Example 1: Basic send - calling method dynamically
class Robot
  def left
    puts 'Robot goes left'
  end

  def right
    puts 'Robot goes right'
  end
end

robot = Robot.new
direction = 'left'
robot.send(direction)  # Dynamically call method based on string

# Example 2: Send with symbol
class Demo
  def display_message
    puts 'Message displayed'
  end
end

demo = Demo.new
demo.display_message
demo.send(:display_message)  # Using symbol
demo.send('display_message')  # Using string

# Example 3: Send with define_method
send :define_method, 'greet' do
  puts 'Hello, I am a new method'
end

greet

# Example 4: Send with parameters
def process_data(data)
  puts data.inspect
end

send(:process_data, { name: 'John', age: 30 })

# Example 5: Send with attr_accessor setter
class Person
  attr_accessor :name

  def initialize
    send('name=', 'Alice')  # Equivalent to @name = 'Alice'
  end
end

person = Person.new
puts person.name

# Example 6: Send with multiple parameters
def calculate_sum(a, b, c)
  a + b + c
end

result = send(:calculate_sum, 10, 20, 30)
puts "Sum: #{result}"

# Example 7: Send calling private method
class Calculator
  def public_add(a, b)
    private_multiply(a, b)
  end

  private

  def private_multiply(a, b)
    a * b
  end
end

calc = Calculator.new
# calc.private_multiply(2, 3)  # Error: private method
result = calc.send(:private_multiply, 2, 3)  # Works with send
puts "Result: #{result}"

# Example 8: Send calling protected method
class BankAccount
  def public_balance
    protected_balance
  end

  protected

  def protected_balance
    1000
  end
end

account = BankAccount.new
# account.protected_balance  # Error: protected method
balance = account.send(:protected_balance)  # Works with send
puts "Balance: #{balance}"

# Example 9: Send with block
def process_with_block(items)
  items.each { |item| yield item }
end

send(:process_with_block, [1, 2, 3]) { |x| puts x * 2 }

# Example 10: Send with method_missing
class DynamicCaller
  def method_missing(method_name, *args)
    puts "Called method: #{method_name} with args: #{args.inspect}"
  end
end

caller = DynamicCaller.new
caller.send(:unknown_method, 'arg1', 'arg2')

# Example 11: Send vs direct call
class Example
  def greet(name)
    puts "Hello, #{name}!"
  end
end

example = Example.new
example.greet("Ruby")  # Direct call
example.send(:greet, "Ruby")  # Using send

# Example 12: Send with variable method name
class Printer
  def print_info
    puts "Printing info"
  end

  def print_error
    puts "Printing error"
  end
end

printer = Printer.new
method_name = :print_info
printer.send(method_name)

# Example 13: Send with conditional method call
class Processor
  def process_fast
    puts "Fast processing"
  end

  def process_slow
    puts "Slow processing"
  end
end

processor = Processor.new
mode = :fast
processor.send("process_#{mode}")

# Example 14: Send with array of method calls
class Operations
  def operation1
    puts "Operation 1"
  end

  def operation2
    puts "Operation 2"
  end

  def operation3
    puts "Operation 3"
  end
end

ops = Operations.new
[:operation1, :operation2, :operation3].each do |method|
  ops.send(method)
end

# Example 15: Send with hash of methods and arguments
class Calculator
  def add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

calc = Calculator.new
operations = {
  add: [5, 3],
  multiply: [4, 2]
}

operations.each do |method, args|
  result = calc.send(method, *args)
  puts "#{method}: #{result}"
end

# Example 16: Send with respond_to? check
class Handler
  def handle_request(type)
    if respond_to?("handle_#{type}", true)
      send("handle_#{type}")
    else
      puts "Unknown request type: #{type}"
    end
  end

  private

  def handle_user
    puts "Handling user request"
  end

  def handle_admin
    puts "Handling admin request"
  end
end

handler = Handler.new
handler.handle_request(:user)
handler.handle_request(:admin)
handler.handle_request(:unknown)

# Example 17: Send with method chaining simulation
class Builder
  def initialize
    @parts = []
  end

  def add_part(part)
    @parts << part
    self
  end

  def build
    @parts.join('-')
  end
end

builder = Builder.new
[:add_part, :add_part, :add_part].each do |method|
  builder = builder.send(method, "part")
end
puts builder.build

# Example 18: Send with class methods
class MathUtils
  def self.square(n)
    n * n
  end

  def self.cube(n)
    n * n * n
  end
end

MathUtils.send(:square, 5)
MathUtils.send(:cube, 3)

# Example 19: Send with module methods
module Helper
  def self.help
    puts "Helper method"
  end
end

Helper.send(:help)

# Example 20: Send with instance_eval
class Container
  def initialize(value)
    @value = value
  end
end

container = Container.new(42)
container.instance_eval do
  def get_value
    @value
  end
end

value = container.send(:get_value)
puts "Value: #{value}"

# Example 21: Send with super
class Parent
  def greet
    puts "Hello from parent"
  end
end

class Child < Parent
  def greet
    super
    puts "Hello from child"
  end
end

child = Child.new
child.send(:greet)

# Example 22: Send with alias
class Example
  def original_method
    puts "Original"
  end

  alias_method :aliased_method, :original_method
end

example = Example.new
example.send(:aliased_method)

# Example 23: Send with define_singleton_method
class Widget
  def initialize(name)
    @name = name
  end
end

widget = Widget.new("Special")
widget.define_singleton_method(:display) do
  puts "Displaying #{@name}"
end

widget.send(:display)

# Example 24: Send with method visibility check
class VisibilityExample
  def public_method
    puts "Public"
  end

  private

  def private_method
    puts "Private"
  end

  protected

  def protected_method
    puts "Protected"
  end
end

obj = VisibilityExample.new
obj.send(:public_method)
obj.send(:private_method)  # send can call private
obj.send(:protected_method)  # send can call protected

# Example 25: Send vs public_send - calling public methods
class PublicPrivateExample
  def public_method
    puts "Public method"
  end

  private

  def private_method
    puts "Private method"
  end
end

obj = PublicPrivateExample.new

# Both work for public methods
obj.send(:public_method)
obj.public_send(:public_method)

# send can call private methods
obj.send(:private_method)

# public_send cannot call private methods
begin
  obj.public_send(:private_method)
rescue NoMethodError => e
  puts "public_send cannot call private method: #{e.message}"
end

# Example 26: public_send - safe dynamic method calls
class SafeCaller
  def public_info
    "Public information"
  end

  private

  def private_info
    "Private information"
  end
end

safe = SafeCaller.new

# public_send only calls public methods
puts safe.public_send(:public_info)

# public_send respects method visibility
begin
  safe.public_send(:private_info)
rescue NoMethodError
  puts "public_send respects privacy - cannot call private_info"
end

# Example 27: public_send with parameters
class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  private

  def secret_calculation(x)
    x * 1000
  end
end

calc = Calculator.new

# public_send works with public methods
result1 = calc.public_send(:add, 10, 5)
puts "Add result: #{result1}"

result2 = calc.public_send(:subtract, 10, 5)
puts "Subtract result: #{result2}"

# public_send cannot call private methods
begin
  calc.public_send(:secret_calculation, 5)
rescue NoMethodError
  puts "Cannot call private method with public_send"
end

# Example 28: public_send vs send - security consideration
class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def public_profile
    "Name: #{@name}"
  end

  private

  def admin_access
    "Full access granted"
  end
end

user = User.new("Alice", "alice@example.com")

# Safe: public_send only allows public methods
user.public_send(:public_profile)

# Unsafe: send can bypass privacy
user.send(:admin_access)

# Example 29: public_send with respond_to?
class Handler
  def handle_public(type)
    if respond_to?("handle_#{type}", false)  # false = only public methods
      public_send("handle_#{type}")
    else
      puts "No public handler for #{type}"
    end
  end

  def handle_user
    puts "Handling user"
  end

  private

  def handle_admin
    puts "Handling admin"
  end
end

handler = Handler.new
handler.handle_public(:user)
handler.handle_public(:admin)  # Won't find private method

# Example 30: public_send with method_missing
class DynamicPublicCaller
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?('public_')
      puts "Called public method: #{method_name} with #{args.inspect}"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('public_') || super
  end
end

caller = DynamicPublicCaller.new
caller.public_send(:public_action, 'arg1', 'arg2')

# Example 31: send vs public_send - when to use which
class API
  def public_endpoint
    "Public data"
  end

  def internal_endpoint
    "Internal data"
  end

  private

  def secret_endpoint
    "Secret data"
  end
end

api = API.new

# Use public_send when you want to ensure only public methods are called
# This is safer when dealing with user input or untrusted data
method_name = :public_endpoint
puts api.public_send(method_name)

# Use send when you need to call private/protected methods
# This is useful for internal implementation details
puts api.send(:secret_endpoint)

# Example 32: public_send with blocks
def process_items(items, &block)
  items.each { |item| block.call(item) }
end

public_send(:process_items, [1, 2, 3]) { |x| puts x * 2 }

# Example 33: send and public_send with class methods
class Utility
  def self.public_utility
    "Public utility"
  end

  private_class_method def self.private_utility
    "Private utility"
  end
end

# public_send works with public class methods
puts Utility.public_send(:public_utility)

# send can call private class methods
puts Utility.send(:private_utility)

# public_send cannot call private class methods
begin
  Utility.public_send(:private_utility)
rescue NoMethodError
  puts "public_send cannot call private class method"
end

# Example 34: send vs public_send performance
class BenchmarkExample
  def public_method
    "result"
  end
end

obj = BenchmarkExample.new

# Both have similar performance for public methods
obj.send(:public_method)
obj.public_send(:public_method)

# Example 35: send and public_send with method chaining
class Chainable
  def initialize
    @chain = []
  end

  def step1
    @chain << "step1"
    self
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
chain.public_send(:step1).public_send(:step2)
puts chain.result

# Example 36: send with method aliasing
class AliasExample
  def original
    "original"
  end

  alias_method :aliased, :original
end

example = AliasExample.new
puts example.send(:aliased)
puts example.public_send(:aliased)

# Example 37: send and public_send with inheritance
class Base
  def public_base
    "Base public"
  end

  private

  def private_base
    "Base private"
  end
end

class Derived < Base
  def public_derived
    "Derived public"
  end

  private

  def private_derived
    "Derived private"
  end
end

derived = Derived.new

# Both can call inherited public methods
puts derived.send(:public_base)
puts derived.public_send(:public_base)

# send can call inherited private methods
puts derived.send(:private_base)

# public_send cannot call inherited private methods
begin
  derived.public_send(:private_base)
rescue NoMethodError
  puts "public_send respects inheritance privacy"
end

# Example 38: send and public_send with modules
module Helper
  def public_helper
    "Public helper"
  end

  private

  def private_helper
    "Private helper"
  end
end

class UsingHelper
  include Helper
end

obj = UsingHelper.new

# Both work for public module methods
puts obj.send(:public_helper)
puts obj.public_send(:public_helper)

# send can call private module methods
puts obj.send(:private_helper)

# public_send cannot call private module methods
begin
  obj.public_send(:private_helper)
rescue NoMethodError
  puts "public_send respects module privacy"
end

# Example 39: Best practices - use public_send for user input
class CommandProcessor
  def execute(command)
    if respond_to?(command, false)  # Check only public methods
      public_send(command)  # Safe: only public methods
    else
      puts "Unknown command: #{command}"
    end
  end

  def save
    puts "Saving..."
  end

  def load
    puts "Loading..."
  end

  private

  def delete_all
    puts "Deleting all (dangerous!)"
  end
end

processor = CommandProcessor.new

# Safe: public_send prevents calling dangerous private methods
processor.execute(:save)
processor.execute(:load)
processor.execute(:delete_all)  # Won't execute private method

# Example 40: send and public_send summary
# send: Can call any method (public, protected, private)
# public_send: Can only call public methods (safer for dynamic calls)
#
# Use send when:
# - You need to call private/protected methods
# - You're in control of the method names
# - Internal implementation details
#
# Use public_send when:
# - Dealing with user input or untrusted data
# - You want to ensure method visibility is respected
# - Public API methods
# - Security is a concern
