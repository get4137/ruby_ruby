# frozen_string_literal: true

# Example 1: Hash parameters - accessing hash values
options = { font_size: 10, font_family: 'Arial' }
font_size = options[:font_size]
font_family = options[:font_family]
puts "Selected font size (#{font_family}) is #{font_size}"

# Example 2: Hash parameters with conditional return
def get_random_command
  random_value = rand(1..4)
  case random_value
  when 1
    :left
  when 2
    :right
  when 3
    :back
  else
    :forward
  end
end

command = get_random_command
puts "Received command: #{command}"

# Example 3: Simple method returning symbol
def get_command
  :left
end

command = get_command
puts "Received command: #{command}"
if command == :left
  puts 'Robot goes left'
end

# Example 4: Hash parameters with optional keys
def print_details(details)
  print details[:name] if details[:name]
  print ', '
  print details[:age] if details[:age]
  print ', '
  puts details[:address] if details[:address]
end

person1 = { name: 'Mike', age: 65, address: '123 street' }
person2 = { name: 'JS', age: 31 }
print_details(person1)
print_details(person2)

# Example 5: Hash parameters with instance variable
class PersonRegistry
  def initialize
    @registry = {}
  end

  def add_person(options)
    if @registry[options[:name]]
      puts 'Already exists!'
      return
    end
    @registry[options[:name]] = options[:age]
  end

  def show_all
    @registry.each do |name, age|
      puts "name: #{name}, age: #{age}"
    end
  end
end

registry = PersonRegistry.new
registry.add_person(name: 'Alice', age: 30)
registry.add_person(name: 'Bob', age: 25)
registry.add_person(name: 'Alice', age: 30)  # Already exists
registry.show_all

# Example 6: Keyword arguments (Ruby 2.0+)
def greet(name:, age:)
  puts "Hello, #{name}, age #{age}"
end

greet(name: "Alice", age: 30)
greet(age: 25, name: "Bob")  # Order doesn't matter

# Example 7: Keyword arguments with default values
def create_user(name:, email:, role: 'user', active: true)
  {
    name: name,
    email: email,
    role: role,
    active: active
  }
end

user1 = create_user(name: "Alice", email: "alice@example.com")
user2 = create_user(name: "Bob", email: "bob@example.com", role: "admin")
puts user1.inspect
puts user2.inspect

# Example 8: Positional and keyword arguments
def calculate_total(price, tax:, discount: 0)
  price + tax - discount
end

total = calculate_total(100, tax: 10, discount: 5)
puts "Total: #{total}"

# Example 9: Required vs optional keyword arguments
def process_data(name:, age: nil, city: nil)
  result = "Name: #{name}"
  result += ", Age: #{age}" if age
  result += ", City: #{city}" if city
  result
end

puts process_data(name: "Alice")
puts process_data(name: "Bob", age: 30)
puts process_data(name: "Charlie", age: 25, city: "NYC")

# Example 10: Splat operator with positional arguments
def sum(*numbers)
  numbers.sum
end

puts sum(1, 2, 3)
puts sum(1, 2, 3, 4, 5)

# Example 11: Double splat for keyword arguments
def process_options(**options)
  options.each do |key, value|
    puts "#{key}: #{value}"
  end
end

process_options(name: "Alice", age: 30, city: "NYC")

# Example 12: Mixed parameter types
def complex_method(required, *args, keyword:, **kwargs)
  puts "Required: #{required}"
  puts "Args: #{args.inspect}"
  puts "Keyword: #{keyword}"
  puts "Kwargs: #{kwargs.inspect}"
end

complex_method(1, 2, 3, keyword: "value", extra: "data", more: "info")

# Example 13: Default parameter values
def greet(name = "Guest")
  puts "Hello, #{name}!"
end

greet
greet("Alice")

# Example 14: Multiple default parameters
def create_profile(name, age = 0, city = "Unknown")
  { name: name, age: age, city: city }
end

profile1 = create_profile("Alice")
profile2 = create_profile("Bob", 30)
profile3 = create_profile("Charlie", 25, "NYC")
puts profile1.inspect
puts profile2.inspect
puts profile3.inspect

# Example 15: Hash as last parameter (old style)
def print_info(options)
  puts "Name: #{options[:name]}" if options[:name]
  puts "Age: #{options[:age]}" if options[:age]
end

print_info(name: "Alice", age: 30)

# Example 16: Block parameters
def process_items(items)
  items.each do |item|
    yield item
  end
end

process_items([1, 2, 3]) { |item| puts "Processing: #{item}" }

# Example 17: Block with multiple parameters
def process_pairs(pairs)
  pairs.each do |key, value|
    yield key, value
  end
end

process_pairs({a: 1, b: 2, c: 3}) { |k, v| puts "#{k}: #{v}" }

# Example 18: Optional block parameter
def execute_with_optional_block(value)
  if block_given?
    yield value
  else
    puts "No block provided: #{value}"
  end
end

execute_with_optional_block(42)
execute_with_optional_block(42) { |v| puts "Block executed: #{v}" }

# Example 19: Class with hash parameters in initialize
class Book
  attr_reader :last_person

  def initialize
    @registry = {}
    @last_person = ''
  end

  def add_person(options)
    @registry[options[:name]] = options[:age]
    @last_person = options[:name]
  end

  def show_all
    @registry.each do |name, age|
      puts "name: #{name}, age: #{age}"
    end
  end
end

book = Book.new
book.add_person(name: 'Alice', age: 27)
book.add_person(name: 'Bob', age: 28)
book.add_person(name: 'Charlie', age: 13)
book.show_all
puts "Last person: #{book.last_person}"

# Example 20: Class with hash parameters and method returning hash
class PersonBook
  def initialize
    @registry = {}
  end

  def add_person(options)
    @registry[options[:name]] = options[:age]
  end

  def show_all
    @registry.each do |name, age|
      puts "name: #{name}, age: #{age}"
    end
  end

  def get_registry
    @registry
  end

  def last_person
    @registry.keys.reverse_each do |name|
      puts name
      return
    end
  end
end

person_book = PersonBook.new
person_book.add_person(name: 'Alice', age: 27)
person_book.add_person(name: 'Bob', age: 28)
person_book.add_person(name: 'Charlie', age: 13)
person_book.show_all
puts person_book.get_registry.inspect
person_book.last_person

# Example 21: Class with positional parameters
class Airplane
  attr_reader :model, :altitude, :speed

  def initialize(model)
    @model = model
    @speed = 0
    @altitude = 0
  end

  def fly
    @speed = rand(750..800)
    @altitude = rand(9000..11000)
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
planes = []
10.times do
  model = models[rand(0..2)]
  plane = Airplane.new(model)
  planes << plane
  plane.fly if rand(0..1) == 1
end

planes.each do |plane|
  puts "model: #{plane.model}, speed: #{plane.speed}, altitude: #{plane.altitude}"
  puts "is moving?: #{plane.moving?}"
end

# Example 22: Multiple classes with parameters
class Album
  attr_reader :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end
end

class Song
  attr_reader :name, :duration

  def initialize(name, duration)
    @name = name
    @duration = duration
  end
end

class Artist
  attr_reader :name, :albums

  def initialize(name)
    @name = name
    @albums = []
  end

  def add_album(album)
    @albums << album
  end
end

song1 = Song.new('Raise', 6)
song2 = Song.new('Natural', 5)
album = Album.new('2018_songs')
album.add_song(song1)
album.add_song(song2)
artist = Artist.new('ImagineDragons')
artist.add_album(album)
puts artist.name
puts artist.albums[0].name
puts album.songs[0].name

# Example 23: Class with multiple positional parameters
class Song
  attr_reader :number, :name, :duration

  def initialize(number, name, duration)
    @number = number
    @name = name
    @duration = duration
  end
end

song1 = Song.new(2, 'The show must go on', 6)
puts song1.number
puts song1.name
puts song1.duration

# Example 24: Class with method_missing and hash parameters
class ActionHandler
  def initialize(actions)
    @actions = actions
  end

  def method_missing(name)
    value = @actions[name]
    puts "If you want to #{name}, you must call #{value}"
  end
end

handler = ActionHandler.new(
  cook: 'Walt',
  take_a_ride: 'Jessie',
  die: 'Gus'
)
handler.cook
handler.take_a_ride
handler.die

# Example 25: Class with dynamic attribute assignment from hash
class Configurable
  attr_accessor :x, :y

  def initialize(options)
    options.each do |key, value|
      send "#{key}=", value
    end
  end
end

config = Configurable.new(x: 1, y: 2)
puts config.x
puts config.y

# Example 26: Method with send and parameters
def display_value(value)
  puts value
end

send(:display_value, 555)

# Example 27: Array as parameter
def process_array(items)
  items.each { |item| puts item }
end

process_array([1, 2, 3, 4, 5])

# Example 28: Hash with string keys
def process_string_keys(options)
  puts "Name: #{options['name']}"
  puts "Age: #{options['age']}"
end

process_string_keys('name' => 'Alice', 'age' => 30)

# Example 29: Mixed hash keys (symbols and strings)
def process_mixed_keys(options)
  puts "Symbol key: #{options[:name]}" if options[:name]
  puts "String key: #{options['age']}" if options['age']
end

process_mixed_keys(name: 'Alice', 'age' => 30)

# Example 30: Parameter validation
def validate_user(name:, age:, email:)
  return "Name is required" if name.nil? || name.empty?
  return "Age must be positive" if age.nil? || age <= 0
  return "Email is required" if email.nil? || email.empty?
  "User is valid"
end

puts validate_user(name: "Alice", age: 30, email: "alice@example.com")
puts validate_user(name: "", age: 30, email: "alice@example.com")

# Example 31: Nested hash parameters
def process_nested_data(data)
  puts "Name: #{data[:person][:name]}"
  puts "City: #{data[:person][:address][:city]}"
end

data = {
  person: {
    name: "Alice",
    address: {
      city: "NYC",
      street: "123 Main St"
    }
  }
}
process_nested_data(data)

# Example 32: Hash with default values using fetch
def process_with_defaults(options)
  name = options.fetch(:name, "Guest")
  age = options.fetch(:age, 0)
  city = options.fetch(:city, "Unknown")
  "#{name}, #{age}, #{city}"
end

puts process_with_defaults(name: "Alice")
puts process_with_defaults(name: "Bob", age: 30)

# Example 33: Destructuring hash parameters
def process_destructured(name:, age:, **rest)
  puts "Name: #{name}, Age: #{age}"
  puts "Other options: #{rest.inspect}" unless rest.empty?
end

process_destructured(name: "Alice", age: 30, city: "NYC", role: "admin")

# Example 34: Array destructuring
def process_coordinates(x, y, z)
  puts "X: #{x}, Y: #{y}, Z: #{z}"
end

coordinates = [10, 20, 30]
process_coordinates(*coordinates)

# Example 35: Hash destructuring
def process_person(name:, age:)
  puts "Name: #{name}, Age: #{age}"
end

person_data = { name: "Alice", age: 30 }
process_person(**person_data)

# Example 36: Optional parameters with ||
def greet(name = nil)
  name ||= "Guest"
  puts "Hello, #{name}!"
end

greet
greet("Alice")

# Example 37: Parameters with type checking (runtime)
def add_numbers(a, b)
  raise TypeError, "Both arguments must be numbers" unless a.is_a?(Numeric) && b.is_a?(Numeric)
  a + b
end

puts add_numbers(5, 3)
begin
  add_numbers("5", 3)
rescue TypeError => e
  puts "Error: #{e.message}"
end

# Example 38: Method with variable number of keyword arguments
def create_profile(**attributes)
  {
    name: attributes[:name] || "Unknown",
    age: attributes[:age] || 0,
    email: attributes[:email] || "noemail@example.com"
  }
end

profile = create_profile(name: "Alice", age: 30)
puts profile.inspect

# Example 39: Parameters with block and yield
def process_with_block(items, &block)
  items.each do |item|
    result = block.call(item)
    puts "Processed: #{result}"
  end
end

process_with_block([1, 2, 3]) { |x| x * 2 }

# Example 40: Method with proc parameter
def execute_proc(proc_obj, *args)
  proc_obj.call(*args)
end

my_proc = proc { |x, y| x + y }
result = execute_proc(my_proc, 5, 3)
puts "Result: #{result}"

# Example 41: Parameters with lambda
def execute_lambda(lambda_obj, *args)
  lambda_obj.call(*args)
end

my_lambda = lambda { |x| x * 2 }
result = execute_lambda(my_lambda, 5)
puts "Result: #{result}"

# Example 42: Method chaining with parameters
class Calculator
  def initialize(value = 0)
    @value = value
  end

  def add(amount)
    @value += amount
    self
  end

  def multiply(amount)
    @value *= amount
    self
  end

  def result
    @value
  end
end

calc = Calculator.new(10)
result = calc.add(5).multiply(2).result
puts "Result: #{result}"

# Example 43: Parameters with method_missing
class DynamicMethod
  def method_missing(method_name, *args, **kwargs)
    puts "Called: #{method_name}"
    puts "Args: #{args.inspect}"
    puts "Kwargs: #{kwargs.inspect}"
  end
end

dynamic = DynamicMethod.new
dynamic.some_method(1, 2, 3, key: "value")

# Example 44: Parameters summary
# Ruby supports multiple parameter types:
# 1. Positional: def method(arg1, arg2)
# 2. Default values: def method(arg = default)
# 3. Keyword arguments: def method(keyword: value)
# 4. Splat (*args): def method(*args)
# 5. Double splat (**kwargs): def method(**kwargs)
# 6. Hash parameters: def method(options)
# 7. Block parameters: def method(&block)
# 8. Mixed: def method(req, *args, keyword:, **kwargs, &block)
