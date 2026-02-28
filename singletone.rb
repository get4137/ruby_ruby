# frozen_string_literal: true
#
# Topic: Singleton methods
# Purpose: Add behavior to a single object instance.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Define a singleton method
# output: Example 1: Meow
animal = Object.new

def animal.sound
  "Meow"
end

puts "Example 1: #{animal.sound}"

# Example 2: Another instance does not have that method
# output: Example 2: false
other = Object.new
puts "Example 2: #{other.respond_to?(:sound)}"

# Example 3: Singleton method on a string
# output: Example 3: RUBY!
name = String.new("Ruby")

def name.shout
  upcase + "!"
end

puts "Example 3: #{name.shout}"

# Example 4: Singleton class (eigenclass)
# output: Example 4: user=user, admin=admin
class User
  def role
    "user"
  end
end

admin = User.new
class << admin
  def role
    "admin"
  end
end

puts "Example 4: user=#{User.new.role}, admin=#{admin.role}"
