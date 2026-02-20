# frozen_string_literal: true

# Example 1: Adding instance method dynamically
class User
end

User.class_eval do
  def greet
    "Hello from dynamic method"
  end
end

u = User.new
puts "Dynamic method: #{u.greet}"

# Example 2: Adding method with string (evaluated as Ruby code)
class Product
end

Product.class_eval <<~RUBY
  def price_with_tax
    @price * 1.2
  end

  def price=(value)
    @price = value
  end
RUBY

p = Product.new
p.price = 100
puts "Price with tax: #{p.price_with_tax}"

# Example 3: Adding class method via class_eval
class Order
end

Order.class_eval do
  def self.description
    "Order class"
  end
end

puts "Class method: #{Order.description}"

# Example 4: Accessing private methods inside class_eval
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

a = Account.new(1000)
puts "Reveal secret: #{a.reveal_secret}"

# Example 5: Using class_eval with define_method
class Article
end

[:title, :author].each do |attr|
  Article.class_eval do
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end

    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end
  end
end

article = Article.new
article.title = "Ruby Metaprogramming"
article.author = "John"
puts "Article: #{article.title} by #{article.author}"

# Example 6: Reopening existing class
String.class_eval do
  def shout
    upcase + "!"
  end
end

puts "hello".shout

# Example 7: Conditional method definition
class Feature
end

enable_feature = true

Feature.class_eval do
  if enable_feature
    def enabled?
      true
    end
  end
end

f = Feature.new
puts "Feature enabled?: #{f.enabled?}"

# Example 8: Using class_eval with constants
class Config
end

Config.class_eval do
  DEFAULT_TIMEOUT = 30
end

puts "Default timeout: #{Config::DEFAULT_TIMEOUT}"

# Example 9: Overriding existing method
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

person = Person.new
puts "Overridden name: #{person.name}"

# Example 10: Adding validations dynamically (Rails-like pattern)
class Model
end

fields = [:email, :password]

fields.each do |field|
  Model.class_eval do
    define_method("validate_#{field}") do
      value = instance_variable_get("@#{field}")
      raise "#{field} cannot be nil" if value.nil?
    end
  end
end

m = Model.new
m.instance_variable_set("@email", "test@example.com")
m.instance_variable_set("@password", "secret")
m.validate_email
m.validate_password
puts "Validations passed"
