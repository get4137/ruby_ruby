# frozen_string_literal: true
#
# Topic: `class_eval`
# Purpose: Add or override methods/constants dynamically inside a class.
#
# Example 1: Add an instance method with a block
class User
end

User.class_eval do
  def greet
    "Hello from dynamic method"
  end
end

puts "Example 1: #{User.new.greet}"

# Example 2: Add methods using a string
class Product
end

Product.class_eval <<~RUBY
  def price=(value)
    @price = value
  end

  def price_with_tax
    (@price || 0) * 1.2
  end
RUBY

product = Product.new
product.price = 100
puts "Example 2: #{product.price_with_tax}"

# Example 3: Add a class method
class Order
end

Order.class_eval do
  def self.description
    "Order class"
  end
end

puts "Example 3: #{Order.description}"

# Example 4: Access private methods inside class_eval
class Account
  def initialize(balance)
    @balance = balance
  end

  private

  def secret_code
    "XYZ123"
  end
end

Account.class_eval do
  def reveal_secret
    secret_code
  end
end

puts "Example 4: #{Account.new(1000).reveal_secret}"

# Example 5: Define multiple methods with `define_method`
class Article
end

%i[title author].each do |attr|
  Article.class_eval do
    define_method(attr) { instance_variable_get("@#{attr}") }
    define_method("#{attr}=") { |value| instance_variable_set("@#{attr}", value) }
  end
end

article = Article.new
article.title = "Ruby Metaprogramming"
article.author = "John"
puts "Example 5: #{article.title} by #{article.author}"

# Example 6: Reopen and extend core class
String.class_eval do
  def shout
    upcase + "!"
  end
end

puts "Example 6: #{"hello".shout}"

# Example 7: Conditional definition
class Feature
end

enable_feature = true
Feature.class_eval do
  def enabled?
    enable_feature
  end
end

puts "Example 7: #{Feature.new.enabled?}"

# Example 8: Add a constant
class Config
end

Config.class_eval do
  DEFAULT_TIMEOUT = 30
end

puts "Example 8: #{Config::DEFAULT_TIMEOUT}"

# Example 9: Override an existing method
class Person
  def name
    "Unknown"
  end
end

Person.class_eval do
  def name
    "Overridden Name"
  end
end

puts "Example 9: #{Person.new.name}"

# Example 10: Generate validations dynamically
class Model
end

fields = %i[email password]

fields.each do |field|
  Model.class_eval do
    define_method("validate_#{field}") do
      value = instance_variable_get("@#{field}")
      raise "#{field} cannot be nil" if value.nil?
    end
  end
end

model = Model.new
model.instance_variable_set("@email", "test@example.com")
model.instance_variable_set("@password", "secret")
model.validate_email
model.validate_password
puts "Example 10: validations passed"
