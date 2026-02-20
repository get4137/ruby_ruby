# frozen_string_literal: true

# =========================
# BASIC TYPE CHECKING
# =========================

# Example 1: Integer check
value = 10
puts "10 is Integer: #{value.is_a?(Integer)}" # true

# Example 2: String check
text = "hello"
puts "'hello' is String: #{text.is_a?(String)}" # true

# Example 3: Wrong type
puts "'hello' is Array: #{text.is_a?(Array)}" # false


# =========================
# INHERITANCE
# =========================

# Example 4: Class inheritance
class Animal; end
class Dog < Animal; end

dog = Dog.new

puts "Dog is Dog: #{dog.is_a?(Dog)}"         # true
puts "Dog is Animal: #{dog.is_a?(Animal)}"   # true
puts "Dog is Object: #{dog.is_a?(Object)}"   # true

# Example 5: Parent not child
animal = Animal.new
puts "Animal is Dog: #{animal.is_a?(Dog)}"   # false


# =========================
# MODULE CHECK
# =========================

# Example 6: Module inclusion
module Flyable; end

class Bird
  include Flyable
end

bird = Bird.new
puts "Bird is Flyable: #{bird.is_a?(Flyable)}" # true


# =========================
# MULTIPLE TYPE CHECK
# =========================

# Example 7: Checking against multiple classes
value = 3.14
if value.is_a?(Numeric)
  puts "Value is Numeric"
end


# =========================
# is_a? vs instance_of?
# =========================

# Example 8: Difference with inheritance
puts "Dog instance_of? Animal: #{dog.instance_of?(Animal)}" # false
puts "Dog is_a? Animal: #{dog.is_a?(Animal)}"               # true


# =========================
# WITH STANDARD TYPES
# =========================

# Example 9: Array
arr = [1, 2, 3]
puts "Array is Enumerable: #{arr.is_a?(Enumerable)}" # true

# Example 10: Hash
hash = { a: 1 }
puts "Hash is Hash: #{hash.is_a?(Hash)}" # true

# Example 11: Symbol
sym = :ruby
puts "Symbol is Symbol: #{sym.is_a?(Symbol)}" # true


# =========================
# NIL AND BOOLEAN
# =========================

# Example 12: nil
value = nil
puts "nil is NilClass: #{value.is_a?(NilClass)}" # true

# Example 13: true/false
puts "true is TrueClass: #{true.is_a?(TrueClass)}"   # true
puts "false is FalseClass: #{false.is_a?(FalseClass)}" # true


# =========================
# EDGE CASES
# =========================

# Example 14: BasicObject limitation
# BasicObject не має is_a? напряму

class Minimal < BasicObject; end
obj = Minimal.new

begin
  obj.is_a?(Object)
rescue => e
  puts "BasicObject error: #{e.class}" # NoMethodError
end


# =========================
# PRACTICAL USAGE
# =========================

# Example 15: Safe type handling
def process(value)
  if value.is_a?(String)
    value.upcase
  elsif value.is_a?(Integer)
    value * 2
  else
    "Unsupported type"
  end
end

puts process("ruby")   # "RUBY"
puts process(10)       # 20
puts process(:symbol)  # "Unsupported type"
