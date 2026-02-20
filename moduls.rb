# frozen_string_literal: true

# Example 1: Module as namespace - organizing classes
module Humans
  class Manager
    def greet
      puts 'Hello, I am a Manager'
    end
  end

  class Developer
    def greet
      puts 'Hello, I am a Developer'
    end
  end

  class Designer
    def greet
      puts 'Hello, I am a Designer'
    end
  end
end

module Animals
  class Dog
    def greet
      puts 'Woof!'
    end
  end

  class Cat
    def greet
      puts 'Meow!'
    end
  end
end

developer = Humans::Developer.new
developer.greet
cat = Animals::Cat.new
cat.greet

# Example 2: include - adds module methods as instance methods
module Greetable
  def greet
    puts "Hello from #{self.class}"
  end
end

class Person
  include Greetable
end

person = Person.new
person.greet

# Example 3: include with multiple methods
module Helper
  def help
    puts "Helping..."
  end

  def assist
    puts "Assisting..."
  end
end

class Assistant
  include Helper
end

assistant = Assistant.new
assistant.help
assistant.assist

# Example 4: include with instance variables
module Configurable
  def configure(options)
    @config = options
  end

  def get_config(key)
    @config[key]
  end
end

class Service
  include Configurable
end

service = Service.new
service.configure(name: "MyService", port: 3000)
puts service.get_config(:name)

# Example 5: include with module constants
module Constants
  MAX_SIZE = 100
  MIN_SIZE = 1
end

class Processor
  include Constants

  def check_size(size)
    size <= MAX_SIZE && size >= MIN_SIZE
  end
end

processor = Processor.new
puts processor.check_size(50)

# Example 6: include - method lookup order
module ModuleA
  def method_name
    puts "From ModuleA"
  end
end

module ModuleB
  def method_name
    puts "From ModuleB"
  end
end

class Example
  include ModuleA
  include ModuleB  # ModuleB methods take precedence
end

example = Example.new
example.method_name  # Outputs "From ModuleB"

# Example 7: extend - adds module methods as class methods
module ClassMethods
  def class_greet
    puts "Greeting from class method"
  end
end

class Example
  extend ClassMethods
end

Example.class_greet

# Example 8: extend with instance methods
module InstanceAndClass
  def instance_method
    puts "Instance method"
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method
      puts "Class method"
    end
  end
end

class Example
  include InstanceAndClass
end

Example.class_method
Example.new.instance_method

# Example 9: extend on instance (singleton)
module Greetable
  def greet
    puts "Hello!"
  end
end

person = Object.new
person.extend(Greetable)
person.greet

# Example 10: prepend - adds module before class in method lookup
module Logging
  def process
    puts "Logging before processing"
    super  # Calls the class method
    puts "Logging after processing"
  end
end

class Processor
  prepend Logging

  def process
    puts "Processing..."
  end
end

processor = Processor.new
processor.process
# Output:
# Logging before processing
# Processing...
# Logging after processing

# Example 11: prepend vs include - method lookup order
module ModuleA
  def method_name
    puts "From ModuleA"
    super if defined?(super)
  end
end

class Example
  prepend ModuleA

  def method_name
    puts "From Example class"
  end
end

example = Example.new
example.method_name
# Output:
# From ModuleA
# From Example class

# Example 12: prepend with multiple modules
module ModuleA
  def method_name
    puts "From ModuleA"
    super
  end
end

module ModuleB
  def method_name
    puts "From ModuleB"
    super
  end
end

class Example
  prepend ModuleA
  prepend ModuleB  # ModuleB is checked first

  def method_name
    puts "From Example class"
  end
end

example = Example.new
example.method_name
# Output:
# From ModuleB
# From ModuleA
# From Example class

# Example 13: include vs extend vs prepend comparison
module Helper
  def help
    puts "Helping..."
  end
end

class WithInclude
  include Helper
end

class WithExtend
  extend Helper
end

class WithPrepend
  prepend Helper

  def help
    puts "Class help method"
    super
  end
end

WithInclude.new.help  # Instance method
WithExtend.help  # Class method
WithPrepend.new.help  # Instance method, but Helper is checked first

# Example 14: module_function - makes methods available as both class and instance methods
module Utility
  def helper_method
    puts "Helper method"
  end

  module_function :helper_method
end

class Example
  include Utility
end

# Available as class method
Utility.helper_method

# Available as instance method
Example.new.helper_method

# Example 15: module_function without arguments - makes all methods module functions
module MathUtils
  module_function

  def add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

puts MathUtils.add(5, 3)
puts MathUtils.multiply(4, 2)

calculator = Object.new
calculator.extend(MathUtils)
puts calculator.add(2, 3)

# Example 16: require - loads a file (for modules in separate files)
# require 'my_module'  # Loads my_module.rb from load path
# Note: In this example, we'll simulate it

module MyModule
  def my_method
    puts "From MyModule"
  end
end

# require 'my_module' would load the file containing MyModule

# Example 17: require_relative - loads file relative to current file
# require_relative 'my_module'  # Loads from same directory
# Note: In this example, we'll simulate it

module LocalModule
  def local_method
    puts "From LocalModule"
  end
end

# require_relative 'local_module' would load the file

# Example 18: load - loads file every time (reloads)
# load 'my_module.rb'  # Loads and executes file
# Note: In this example, we'll simulate it

module ReloadableModule
  def reloadable_method
    puts "From ReloadableModule"
  end
end

# load 'reloadable_module.rb' would reload the file each time

# Example 19: autoload - lazy loading of modules
# autoload :MyModule, 'my_module'  # Loads when first accessed
# Note: In this example, we'll simulate it

module LazyModule
  def lazy_method
    puts "Lazy loaded"
  end
end

# autoload :LazyModule, 'lazy_module' would load it on first access

# Example 20: include with included hook
module Hookable
  def self.included(base)
    puts "Module included in #{base}"
    base.extend(ClassMethods)
  end

  def instance_method
    puts "Instance method"
  end

  module ClassMethods
    def class_method
      puts "Class method"
    end
  end
end

class Example
  include Hookable
end

Example.class_method
Example.new.instance_method

# Example 21: extend with extended hook
module Extendable
  def self.extended(base)
    puts "Module extended in #{base}"
  end

  def module_method
    puts "Module method"
  end
end

class Example
  extend Extendable
end

Example.module_method

# Example 22: prepend with prepended hook
module Prependable
  def self.prepended(base)
    puts "Module prepended to #{base}"
  end

  def method_name
    puts "From module"
    super if defined?(super)
  end
end

class Example
  prepend Prependable

  def method_name
    puts "From class"
  end
end

Example.new.method_name

# Example 23: Multiple includes
module ModuleA
  def method_a
    puts "Method A"
  end
end

module ModuleB
  def method_b
    puts "Method B"
  end
end

class Example
  include ModuleA
  include ModuleB
end

example = Example.new
example.method_a
example.method_b

# Example 24: Nested modules
module Outer
  module Inner
    def inner_method
      puts "From Inner module"
    end
  end
end

class Example
  include Outer::Inner
end

Example.new.inner_method

# Example 25: Module with class methods and instance methods
module DualPurpose
  def instance_method
    puts "Instance method"
  end

  def self.class_method
    puts "Class method"
  end
end

class Example
  include DualPurpose
end

Example.new.instance_method
DualPurpose.class_method

# Example 26: Module extending itself
module SelfExtending
  def self.included(base)
    base.extend(ClassMethods)
  end

  def instance_method
    puts "Instance method"
  end

  module ClassMethods
    def class_method
      puts "Class method"
    end
  end
end

class Example
  include SelfExtending
end

Example.class_method
Example.new.instance_method

# Example 27: Module with constants
module Constants
  PI = 3.14159
  E = 2.71828
end

class Calculator
  include Constants

  def area_of_circle(radius)
    PI * radius * radius
  end
end

calc = Calculator.new
puts calc.area_of_circle(5)

# Example 28: Accessing module constants
module MathConstants
  PI = 3.14159
end

puts MathConstants::PI

class Example
  include MathConstants
  puts PI  # Can access without module name
end

# Example 29: Module with private methods
module PrivateMethods
  def public_method
    private_method
  end

  private

  def private_method
    puts "Private method"
  end
end

class Example
  include PrivateMethods
end

example = Example.new
example.public_method
# example.private_method  # Error: private method

# Example 30: Module with protected methods
module ProtectedMethods
  def public_method
    protected_method
  end

  protected

  def protected_method
    puts "Protected method"
  end
end

class Example
  include ProtectedMethods
end

example = Example.new
example.public_method

# Example 31: Module aliasing methods
module Aliasing
  def original_method
    puts "Original"
  end

  alias_method :aliased_method, :original_method
end

class Example
  include Aliasing
end

example = Example.new
example.original_method
example.aliased_method

# Example 32: Module with method_missing
module DynamicMethods
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?('handle_')
      puts "Handling #{method_name}"
    else
      super
    end
  end
end

class Example
  include DynamicMethods
end

example = Example.new
example.handle_something

# Example 33: Module with respond_to_missing?
module SmartDynamic
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?('smart_')
      puts "Smart handling: #{method_name}"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('smart_') || super
  end
end

class Example
  include SmartDynamic
end

example = Example.new
puts example.respond_to?(:smart_action)
example.smart_action

# Example 34: Module composition - including multiple modules
module A
  def method_a
    puts "A"
  end
end

module B
  def method_b
    puts "B"
  end
end

module C
  include A
  include B

  def method_c
    method_a
    method_b
    puts "C"
  end
end

class Example
  include C
end

example = Example.new
example.method_c

# Example 35: Module with yield
module BlockProcessor
  def process_items(items)
    items.each do |item|
      yield item
    end
  end
end

class Example
  include BlockProcessor
end

example = Example.new
example.process_items([1, 2, 3]) { |x| puts x * 2 }

# Example 36: Module with class variables
module SharedState
  @@count = 0

  def increment_count
    @@count += 1
  end

  def get_count
    @@count
  end
end

class Counter1
  include SharedState
end

class Counter2
  include SharedState
end

counter1 = Counter1.new
counter2 = Counter2.new

counter1.increment_count
counter2.increment_count
puts counter1.get_count  # Shared across all classes

# Example 37: Module with module-level methods
module Utility
  def self.helper
    puts "Module-level helper"
  end

  def instance_helper
    puts "Instance helper"
  end
end

Utility.helper
Object.new.extend(Utility).instance_helper

# Example 38: Checking if module is included
module Checkable
  def checkable_method
    puts "Checkable"
  end
end

class Example
  include Checkable
end

puts Example.included_modules.include?(Checkable)
puts Example.new.is_a?(Checkable)

# Example 39: Module ancestors chain
module A
end

module B
  include A
end

class Example
  include B
end

puts Example.ancestors.inspect
# Shows: [Example, B, A, Object, Kernel, BasicObject]

# Example 40: Module with prepend - ancestors order
module A
end

module B
end

class Example
  prepend A
  include B
end

puts Example.ancestors.inspect
# Shows: [A, Example, B, Object, Kernel, BasicObject]
# A comes before Example because of prepend

# Example 41: Summary of module inclusion methods
# 1. include - adds methods as instance methods
#    - Methods become available on instances
#    - Module is added after class in ancestors chain
#
# 2. extend - adds methods as class methods
#    - Methods become available on the class itself
#    - Can also extend instances (singleton)
#
# 3. prepend - adds methods before class in ancestors chain
#    - Methods are checked before class methods
#    - Useful for method wrapping/decorators
#
# 4. require - loads a file once
#    - require 'module_name'
#    - Searches in $LOAD_PATH
#
# 5. require_relative - loads file relative to current
#    - require_relative 'module_name'
#    - Relative to current file location
#
# 6. load - loads file every time
#    - load 'module.rb'
#    - Executes file each time
#
# 7. autoload - lazy loading
#    - autoload :ModuleName, 'module'
#    - Loads when first accessed
#
# 8. module_function - makes methods available as both
#    - Class methods and instance methods
#    - module_function :method_name or module_function
