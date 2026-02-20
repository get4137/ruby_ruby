# frozen_string_literal: true
#
# Topic: Attribute helpers
# Purpose: Show how `attr_reader`, `attr_writer`, and `attr_accessor` define getters/setters.
#
# Example 1: `attr_reader` creates read-only attributes
class Airplane
  attr_reader :model, :speed

  def initialize(model)
    @model = model
    @speed = 0
  end

  def fly!
    @speed = 780
  end
end

plane = Airplane.new("Boeing-777")
plane.fly!
puts "Example 1: model=#{plane.model}, speed=#{plane.speed}"

# Example 2: `attr_writer` creates write-only attributes
class ApiToken
  attr_writer :token

  def masked
    return "(not set)" if @token.nil? || @token.empty?
    "#{@token[0, 3]}***"
  end
end

token = ApiToken.new
token.token = "secret-token-123"
puts "Example 2: masked=#{token.masked}"

# Example 3: `attr_accessor` creates read/write attributes
class UserProfile
  attr_accessor :name, :age

  def initialize(name:, age:)
    @name = name
    @age = age
  end
end

profile = UserProfile.new(name: "Alice", age: 30)
profile.age += 1
puts "Example 3: name=#{profile.name}, age=#{profile.age}"

# Example 4: Custom setter with validation
class Temperature
  attr_reader :celsius

  def celsius=(value)
    raise ArgumentError, "Temperature must be numeric" unless value.is_a?(Numeric)
    @celsius = value
  end
end

temp = Temperature.new
temp.celsius = 21.5
puts "Example 4: celsius=#{temp.celsius}"

# Example 5: Why `self.` matters for setters
class Counter
  attr_accessor :count

  def initialize
    @count = 0
  end

  def increment
    self.count = count + 1
  end
end

counter = Counter.new
3.times { counter.increment }
puts "Example 5: count=#{counter.count}"

# Example 6: Exposing a collection safely (reader + controlled mutation)
class Airport
  attr_reader :name, :planes

  def initialize(name)
    @name = name
    @planes = []
  end

  def add_plane(model)
    @planes << model
  end
end

airport = Airport.new("Boryspil")
%w[B777 A320 B737].each { |m| airport.add_plane(m) }
puts "Example 6: #{airport.name} has #{airport.planes.size} planes"

# Example 7: Initialize from a hash using writers
class Point
  attr_accessor :x, :y

  def initialize(attrs = {})
    attrs.each do |key, value|
      public_send("#{key}=", value) if respond_to?("#{key}=")
    end
  end
end

point = Point.new(x: 1, y: 2)
puts "Example 7: point=(#{point.x}, #{point.y})"

# Example 8: Override generated methods
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

product = Product.new(price_cents: 1999)
puts "Example 8: price_cents=#{product.price_cents}"
