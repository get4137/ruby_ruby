# frozen_string_literal: true

# =========================
# BASIC USAGE
# =========================

# Example 1: Index array of hashes by key
users = [
  { id: 1, name: "John" },
  { id: 2, name: "Jane" },
  { id: 3, name: "Bob" }
]

indexed = users.index_by { |u| u[:id] }
puts "Indexed by id: #{indexed.inspect}"
# => {1=>{...}, 2=>{...}, 3=>{...}}

# Example 2: Index by name
indexed = users.index_by { |u| u[:name] }
puts "Indexed by name: #{indexed.inspect}"

# Example 3: Index simple array
numbers = [10, 20, 30]
indexed = numbers.index_by { |n| n / 10 }
puts "Indexed numbers: #{indexed.inspect}"
# => {1=>10, 2=>20, 3=>30}

# Example 4: Duplicate keys (last wins)
data = ["apple", "banana", "apricot"]
indexed = data.index_by { |word| word[0] }
puts "Duplicate key result: #{indexed.inspect}"
# ключ "a" буде містити "apricot"


# =========================
# WITH OBJECTS
# =========================

class User
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end
end

# Example 5: Index objects by attribute
users = [
  User.new(1, "a@mail.com"),
  User.new(2, "b@mail.com")
]

indexed = users.index_by(&:id)
puts "Indexed objects: #{indexed.inspect}"

# Example 6: Accessing indexed value
user = indexed[1]
puts "User with id 1: #{user.email}"


# =========================
# CHAINING
# =========================

# Example 7: select + index_by
users = [
  { id: 1, active: true },
  { id: 2, active: false },
  { id: 3, active: true }
]

active_indexed = users
                   .select { |u| u[:active] }
                   .index_by { |u| u[:id] }

puts "Active indexed: #{active_indexed.inspect}"

# Example 8: sort + index_by
words = %w[zebra apple banana]
sorted_indexed = words.sort.index_by { |w| w.length }
puts "Sorted indexed: #{sorted_indexed.inspect}"


# =========================
# PURE RUBY ALTERNATIVE
# =========================

# Example 9: Using each_with_object
users = [
  { id: 1, name: "John" },
  { id: 2, name: "Jane" }
]

indexed = users.each_with_object({}) do |user, hash|
  hash[user[:id]] = user
end

puts "each_with_object alternative: #{indexed.inspect}"

# Example 10: Using to_h
indexed = users.map { |u| [u[:id], u] }.to_h
puts "to_h alternative: #{indexed.inspect}"

# Example 11: Behavior with empty collection
empty = []
puts "Empty index_by: #{empty.index_by { |x| x }.inspect}"

# Example 12: index_by with computed key
files = ["report.pdf", "image.png", "notes.txt"]
indexed = files.index_by { |f| File.extname(f) }
puts "Indexed by extension: #{indexed.inspect}"
