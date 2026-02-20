# frozen_string_literal: true

# =========================
# BASIC USAGE
# =========================

# Example 1: Check existing method
text = "hello"
puts "Responds to upcase: #{text.respond_to?(:upcase)}" # true

# Example 2: Check non-existing method
puts "Responds to unknown: #{text.respond_to?(:unknown_method)}" # false

# Example 3: Symbol vs string
puts "Symbol argument: #{text.respond_to?('upcase')}" # true


# =========================
# PRIVATE METHODS
# =========================

class Example
  def public_method; end

  private

  def private_method; end
end

obj = Example.new

# Example 4: Public method
puts "Public method: #{obj.respond_to?(:public_method)}" # true

# Example 5: Private method (default false)
puts "Private method default: #{obj.respond_to?(:private_method)}" # false

# Example 6: Include private methods
puts "Private method with include_private: #{obj.respond_to?(:private_method, true)}" # true


# =========================
# INHERITANCE
# =========================

class Parent
  def parent_method; end
end

class Child < Parent; end

child = Child.new

# Example 7: Inherited method
puts "Inherited method: #{child.respond_to?(:parent_method)}" # true


# =========================
# MODULE INCLUSION
# =========================

module Greeter
  def greet; end
end

class Person
  include Greeter
end

person = Person.new

# Example 8: Module method
puts "Module method: #{person.respond_to?(:greet)}" # true


# =========================
# method_missing + respond_to_missing?
# =========================

class Dynamic
  def method_missing(name, *args)
    if name.to_s.start_with?("say_")
      "You said #{name.to_s.sub('say_', '')}"
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("say_") || super
  end
end

dynamic = Dynamic.new

# Example 9: Dynamic method check
puts "Responds to say_hello: #{dynamic.respond_to?(:say_hello)}" # true
puts dynamic.say_hello

# Example 10: Unknown dynamic method
puts "Responds to random: #{dynamic.respond_to?(:random)}" # false


# =========================
# PRACTICAL USAGE
# =========================

# Example 11: Safe method call
def safe_call(obj, method_name)
  if obj.respond_to?(method_name)
    obj.public_send(method_name)
  else
    "Method not supported"
  end
end

puts safe_call("ruby", :upcase)
puts safe_call("ruby", :nonexistent)


# =========================
# EDGE CASES
# =========================

# Example 12: NilClass
value = nil
puts "nil responds to nil?: #{value.respond_to?(:nil?)}" # true

# Example 13: BasicObject limitation
class Minimal < BasicObject; end
minimal = Minimal.new

begin
  minimal.respond_to?(:to_s)
rescue => e
  puts "BasicObject error: #{e.class}" # NoMethodError
end


# =========================
# respond_to? vs method_defined?
# =========================

# Example 14: Class-level check
class Sample
  def instance_method; end
end

puts "Instance method defined?: #{Sample.method_defined?(:instance_method)}" # true
puts "Object responds?: #{Sample.new.respond_to?(:instance_method)}" # true
