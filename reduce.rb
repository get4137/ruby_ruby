# frozen_string_literal: true

# =========================
# BASIC SUM
# =========================

# Example 1: Sum without initial value
numbers = [1, 2, 3, 4]
sum = numbers.reduce { |acc, n| acc + n }
puts "Sum: #{sum}" # 10

# Example 2: Sum with initial value
sum = numbers.reduce(0) { |acc, n| acc + n }
puts "Sum with initial 0: #{sum}" # 10

# Example 3: Sum with symbol shortcut
sum = numbers.reduce(0, :+)
puts "Sum with symbol: #{sum}" # 10


# =========================
# PRODUCT
# =========================

# Example 4: Product
product = numbers.reduce(1) { |acc, n| acc * n }
puts "Product: #{product}" # 24

# Example 5: Product with symbol
product = numbers.reduce(1, :*)
puts "Product with symbol: #{product}" # 24


# =========================
# STRING CONCAT
# =========================

# Example 6: Concatenating strings
words = %w[Ruby on Rails]
sentence = words.reduce("") { |acc, word| acc + word + " " }.strip
puts "Sentence: #{sentence}" # "Ruby on Rails"

# Example 7: Using <<
sentence = words.reduce("") { |acc, word| acc << word << " " }.strip
puts "Sentence with <<: #{sentence}"


# =========================
# BUILDING HASH
# =========================

# Example 8: Index array into hash
users = [
  { id: 1, name: "John" },
  { id: 2, name: "Jane" }
]

indexed = users.reduce({}) do |acc, user|
  acc[user[:id]] = user
  acc
end

puts "Indexed: #{indexed.inspect}"


# =========================
# FIND MAX
# =========================

# Example 9: Maximum manually
max = numbers.reduce do |acc, n|
  acc > n ? acc : n
end

puts "Max: #{max}" # 4


# =========================
# FLATTEN ARRAY
# =========================

# Example 10: Flatten one level
nested = [[1, 2], [3, 4]]
flat = nested.reduce([]) do |acc, arr|
  acc + arr
end

puts "Flattened: #{flat.inspect}" # [1, 2, 3, 4]


# =========================
# COUNT OCCURRENCES
# =========================

# Example 11: Frequency hash
items = %w[apple banana apple cherry apple]

counts = items.reduce(Hash.new(0)) do |acc, item|
  acc[item] += 1
  acc
end

puts "Counts: #{counts.inspect}"


# =========================
# REDUCE VS INJECT
# =========================

# Example 12: inject alias
sum = numbers.inject(0, :+)
puts "Inject sum: #{sum}"


# =========================
# WITHOUT INITIAL VALUE EDGE CASE
# =========================

# Example 13: Empty array without initial value
empty = []

begin
  result = empty.reduce { |acc, n| acc + n }
  puts result.inspect
rescue => e
  puts "Error: #{e.class}"
end

# Example 14: Empty array with initial value
result = empty.reduce(0) { |acc, n| acc + n }
puts "Empty with initial: #{result}" # 0


# =========================
# PRACTICAL EXAMPLE
# =========================

# Example 15: Total price calculation
cart = [
  { price: 100, qty: 2 },
  { price: 50,  qty: 1 }
]

total = cart.reduce(0) do |acc, item|
  acc + item[:price] * item[:qty]
end

puts "Cart total: #{total}" # 250


# =========================
# CHAINING
# =========================

# Example 16: select + reduce
result = numbers
           .select(&:even?)
           .reduce(0, :+)

puts "Sum of even numbers: #{result}" # 6
