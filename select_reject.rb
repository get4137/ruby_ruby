# frozen_string_literal: true

# =========================
# ARRAY: BASIC FILTERING
# =========================

# Example 1: select even numbers
numbers = [1, 2, 3, 4, 5, 6]
evens = numbers.select(&:even?)
puts "Select evens: #{evens.inspect}" # [2, 4, 6]

# Example 2: reject even numbers
odds = numbers.reject(&:even?)
puts "Reject evens: #{odds.inspect}" # [1, 3, 5]

# Example 3: select with block
greater_than_three = numbers.select { |n| n > 3 }
puts "Select > 3: #{greater_than_three.inspect}"

# Example 4: reject with block
less_or_equal_three = numbers.reject { |n| n > 3 }
puts "Reject > 3: #{less_or_equal_three.inspect}"

# Example 5: original array unchanged
numbers.select(&:even?)
puts "Original array: #{numbers.inspect}"


# =========================
# ARRAY: MUTATING VERSIONS
# =========================

# Example 6: select! modifies array
arr = [1, 2, 3, 4]
arr.select!(&:odd?)
puts "After select!: #{arr.inspect}" # [1, 3]

# Example 7: reject! modifies array
arr = [1, 2, 3, 4]
arr.reject!(&:odd?)
puts "After reject!: #{arr.inspect}" # [2, 4]


# =========================
# HASH FILTERING
# =========================

# Example 8: select on hash
person = { name: "John", age: 30, role: "admin" }
selected = person.select { |k, _| k != :role }
puts "Hash select: #{selected.inspect}"

# Example 9: reject on hash
rejected = person.reject { |_, v| v.is_a?(String) }
puts "Hash reject strings: #{rejected.inspect}"

# Example 10: select by value
expensive = { apple: 2, banana: 1, cherry: 5 }
filtered = expensive.select { |_, price| price > 2 }
puts "Expensive items: #{filtered.inspect}"


# =========================
# CHAINING
# =========================

# Example 11: select + map
result = numbers
           .select(&:even?)
           .map { |n| n * 10 }

puts "Select + map: #{result.inspect}"

# Example 12: reject + reduce
sum = numbers
        .reject(&:odd?)
        .reduce(0, :+)

puts "Sum of evens: #{sum}"


# =========================
# WITH OBJECTS
# =========================

class User
  attr_reader :name, :active

  def initialize(name, active)
    @name = name
    @active = active
  end
end

users = [
  User.new("John", true),
  User.new("Jane", false),
  User.new("Bob", true)
]

# Example 13: select active users
active_users = users.select(&:active)
puts "Active users: #{active_users.map(&:name).inspect}"

# Example 14: reject inactive users
inactive_removed = users.reject { |u| !u.active }
puts "Inactive removed: #{inactive_removed.map(&:name).inspect}"


# =========================
# EDGE CASES
# =========================

# Example 15: Empty array
empty = []
puts "Empty select: #{empty.select(&:even?).inspect}" # []

# Example 16: select returns Enumerator without block
enum = numbers.select
puts "Select without block: #{enum.class}" # Enumerator

# Example 17: reject returns Enumerator without block
enum = numbers.reject
puts "Reject without block: #{enum.class}" # Enumerator


# =========================
# PRACTICAL EXAMPLE
# =========================

# Example 18: Filtering params-like hash
params = { email: "a@mail.com", password: "123", admin: true }
safe = params.reject { |k, _| k == :password }
puts "Safe params: #{safe.inspect}"

# Example 19: Filtering strings by length
words = %w[apple fig banana pear]
long_words = words.select { |w| w.length > 4 }
puts "Long words: #{long_words.inspect}"

# Example 20: Inverse logic comparison
puts "Select odd: #{numbers.select(&:odd?).inspect}"
puts "Reject even: #{numbers.reject(&:even?).inspect}"
