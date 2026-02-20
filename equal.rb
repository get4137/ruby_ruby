# frozen_string_literal: true

# Example 1: Basic value comparison with ==
a = 10
b = 10
puts "10 == 10: #{a == b}" # true

# Example 2: Different values with ==
a = 10
b = 20
puts "10 == 20: #{a == b}" # false

# Example 3: String value comparison with ==
str1 = "hello"
str2 = "hello"
puts "String == comparison: #{str1 == str2}" # true

# Example 4: String object identity with equal?
str1 = "hello"
str2 = "hello"
puts "String equal? comparison: #{str1.equal?(str2)}" # false (different objects)

# Example 5: Same object reference with equal?
str1 = "hello"
str2 = str1
puts "Same object equal?: #{str1.equal?(str2)}" # true

# Example 6: eql? with integers
a = 5
b = 5
puts "5.eql?(5): #{a.eql?(b)}" # true

# Example 7: eql? with integer and float
a = 5
b = 5.0
puts "5 == 5.0: #{a == b}"       # true
puts "5.eql?(5.0): #{a.eql?(b)}" # false (type-sensitive)

# Example 8: equal? with integers
a = 100
b = 100
puts "100.equal?(100): #{a.equal?(b)}" # implementation-dependent (often true for small integers)

# Example 9: Array value comparison with ==
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
puts "Array == comparison: #{arr1 == arr2}" # true

# Example 10: Array identity comparison with equal?
puts "Array equal?: #{arr1.equal?(arr2)}" # false

# Example 11: Hash comparison with ==
hash1 = { name: "John", age: 30 }
hash2 = { name: "John", age: 30 }
puts "Hash == comparison: #{hash1 == hash2}" # true

# Example 12: Hash eql?
puts "Hash eql?: #{hash1.eql?(hash2)}" # true

# Example 13: nil comparison
a = nil
b = nil
puts "nil == nil: #{a == b}"       # true
puts "nil.eql?(nil): #{a.eql?(b)}" # true
puts "nil.equal?(nil): #{a.equal?(b)}" # true (nil is singleton)

# Example 14: Symbol comparison
sym1 = :ruby
sym2 = :ruby
puts "Symbol == comparison: #{sym1 == sym2}"       # true
puts "Symbol equal?: #{sym1.equal?(sym2)}"         # true (symbols are interned)

# Example 15: Object comparison (default behavior)
class User
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

u1 = User.new("John")
u2 = User.new("John")

puts "User == comparison: #{u1 == u2}"       # false (different objects)
puts "User equal?: #{u1.equal?(u2)}"         # false

# Example 16: Overriding == in custom class
class Product
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def ==(other)
    other.is_a?(Product) && id == other.id
  end
end

p1 = Product.new(1)
p2 = Product.new(1)

puts "Custom == comparison: #{p1 == p2}"     # true
puts "Custom equal?: #{p1.equal?(p2)}"       # false

# Example 17: Using == in conditional
role = "admin"
if role == "admin"
  puts "Access granted"
end

# Example 18: Comparing ranges
r1 = (1..5)
r2 = (1..5)
puts "Range == comparison: #{r1 == r2}" # true

# Example 19: Comparing Time objects
t1 = Time.now
t2 = t1
puts "Time == comparison: #{t1 == t2}"     # true
puts "Time equal?: #{t1.equal?(t2)}"       # true

# Example 20: Float comparison
a = 0.1 + 0.2
b = 0.3
puts "Float == comparison: #{a == b}" # may be false due to floating point precision

# Example 21: Case equality (===) in case statement
value = 5
case value
when Integer
  puts "It's an Integer"
end

# Example 22: === with range
range = (1..10)
puts "Range === 5: #{range === 5}" # true

# Example 23: === with regex
regex = /ruby/
puts "Regex === 'ruby on rails': #{regex === 'ruby on rails'}" # true

# Example 24: Comparing different types
puts "'5' == 5: #{'5' == 5}" # false

# Example 25: Object identity check in loop
items = ["a", "b", "c"]
items.each do |item|
  puts "Found b by == " if item == "b"
end
