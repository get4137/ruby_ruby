# frozen_string_literal: true

#
# This file focuses on Ruby attribute helpers:
# - `attr_reader`   -> creates a getter (read-only)
# - `attr_writer`   -> creates a setter (write-only)
# - `attr_accessor` -> creates both getter + setter (read/write)
#
# Under the hood they define methods for instance variables like `@name`.

# Example 1: attr_reader (read-only attribute)
class Airplane
  attr_reader :model, :altitude, :speed

  def initialize(model)
    @model = model
    @speed = 0
    @altitude = 0
  end

  def fly
    @speed = rand(750..800)
    @altitude = rand(9_000..11_000)
  end

  def land
    @speed = 0
    @altitude = 0
  end

  def moving?
    @speed > 0
  end
end

models = ['Boeing-777', 'Airbus-320', 'Boeing-737']
fleet = 5.times.map { Airplane.new(models.sample) }
fleet.each { |plane| plane.fly if rand(0..1) == 1 }
fleet.each do |plane|
  puts "model=#{plane.model}, speed=#{plane.speed}, altitude=#{plane.altitude}, moving?=#{plane.moving?}"
end

# Example 2: attr_writer (write-only attribute)
class ApiToken
  attr_writer :token

  def masked_token
    return "(not set)" if @token.nil? || @token.empty?
    "#{@token[0, 3]}***"
  end
end

api = ApiToken.new
api.token = "secret-token-123" # allowed (writer)
puts "masked_token=#{api.masked_token}"
# puts api.token # would raise NoMethodError: reader is not defined

# Example 3: attr_accessor (read + write)
class UserProfile
  attr_accessor :name, :age

  def initialize(name:, age:)
    @name = name
    @age = age
  end
end

profile = UserProfile.new(name: "Alice", age: 30)
puts "name=#{profile.name}, age=#{profile.age}"
profile.age = 31
puts "updated age=#{profile.age}"

# Example 4: Custom setter with validation (still works with attr_reader)
class Temperature
  attr_reader :celsius

  def celsius=(value)
    raise ArgumentError, "Temperature must be numeric" unless value.is_a?(Numeric)
    @celsius = value
  end
end

temp = Temperature.new
temp.celsius = 20
puts "temp.celsius=#{temp.celsius}"

# Example 5: Why `self.` matters for setters
class Counter
  attr_accessor :count

  def initialize
    @count = 0
  end

  def increment
    self.count = count + 1  # calls the setter
  end
end

counter = Counter.new
3.times { counter.increment }
puts "counter.count=#{counter.count}"

# Example 6: Exposing a collection safely (reader + controlled mutation)
class Airport
  attr_reader :name, :planes

  def initialize(name)
    @name = name
    @planes = []
  end

  def add_plane(plane)
    @planes << plane
  end
end

class Plane
  attr_reader :model

  def initialize(model)
    @model = model
  end
end

airport = Airport.new('Boryspil')
%w[B777 A320 B737].each { |m| airport.add_plane(Plane.new(m)) }
puts "Airport: #{airport.name}"
airport.planes.each { |p| puts "  Plane: #{p.model}" }

# Example 7: Initialize from a hash using writers (common Ruby pattern)
class Point
  attr_accessor :x, :y

  def initialize(attrs = {})
    attrs.each do |key, value|
      public_send("#{key}=", value) if respond_to?("#{key}=")
    end
  end
end

point = Point.new(x: 1, y: 2)
puts "point=(#{point.x}, #{point.y})"

# Example 8: Reader only, but computed method uses instance variables
class Person
  attr_reader :first_name, :last_name

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

person = Person.new(first_name: "Taras", last_name: "Kulyk")
puts "full_name=#{person.full_name}"

# Example 9: attr_reader with “last added” tracking (cleaned up)
class AddressBook
  attr_reader :last_added_name

  def initialize
    @people = {}
    @last_added_name = nil
  end

  def add_person(name:, age:)
    @people[name] = age
    @last_added_name = name
  end

  def show_all
    @people.each { |name, age| puts "name=#{name}, age=#{age}" }
  end
end

book = AddressBook.new
book.add_person(name: 'Alice', age: 27)
book.add_person(name: 'Bob', age: 28)
book.add_person(name: 'Charlie', age: 13)
book.show_all
puts "last_added_name=#{book.last_added_name}"

# Example 10: You can override the generated getter/setter
class Product
  attr_reader :price_cents

  def price_cents=(value)
    raise ArgumentError, "price_cents must be integer" unless value.is_a?(Integer)
    raise ArgumentError, "price_cents must be >= 0" if value.negative?
    @price_cents = value
  end

  def initialize(price_cents:)
    self.price_cents = price_cents
  end
end

product = Product.new(price_cents: 1_999)
puts "product.price_cents=#{product.price_cents}"

# Summary:
# - `attr_reader :a`   defines `def a; @a; end`
# - `attr_writer :a`   defines `def a=(v); @a = v; end`
# - `attr_accessor :a` defines both
# - Use custom setters/getters when you need validation, transformation, or side effects.
