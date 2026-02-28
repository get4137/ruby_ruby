# frozen_string_literal: true
#
# Topic: `is_a?`, `kind_of?`, and `instance_of?`
# Purpose: Type checks and class hierarchy checks.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `is_a?` and `kind_of?` are the same
# output: Example 1: true / true
value = "ruby"
puts "Example 1: #{value.is_a?(String)} / #{value.kind_of?(String)}"

# Example 2: `is_a?` works with inheritance
# output: Example 2: is_a?=true, instance_of?=false
class Animal; end
class Dog < Animal; end

dog = Dog.new
puts "Example 2: is_a?=#{dog.is_a?(Animal)}, instance_of?=#{dog.instance_of?(Animal)}"

# Example 3: `instance_of?` is strict
# output: Example 3: true
puts "Example 3: #{dog.instance_of?(Dog)}"

# Example 4: Module checks
# output: Example 4: true
module Walkable; end
class Person
  include Walkable
end

person = Person.new
puts "Example 4: #{person.is_a?(Walkable)}"

# Example 5: `===` used by `case`
# output: Example 5: integer
value = 10
result = case value
         when Integer then "integer"
         when String then "string"
         else "other"
         end
puts "Example 5: #{result}"
