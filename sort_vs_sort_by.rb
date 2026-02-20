# frozen_string_literal: true

# =========================
# BASIC SORT
# =========================

# Example 1: Simple numeric sort
numbers = [5, 2, 8, 1, 3]
sorted = numbers.sort
puts "Sort numbers: #{sorted.inspect}" # [1, 2, 3, 5, 8]

# Example 2: Descending sort
sorted_desc = numbers.sort { |a, b| b <=> a }
puts "Sort descending: #{sorted_desc.inspect}"

# Example 3: String sort (lexicographical)
words = %w[banana apple cherry]
puts "Sort words: #{words.sort.inspect}"


# =========================
# SORT WITH BLOCK
# =========================

# Example 4: Sort objects by attribute (using sort)
User = Struct.new(:name, :age)

users = [
  User.new("John", 30),
  User.new("Jane", 25),
  User.new("Bob", 35)
]

sorted_by_age = users.sort { |a, b| a.age <=> b.age }
puts "Sort by age (sort): #{sorted_by_age.map(&:name).inspect}"


# =========================
# SORT_BY (OPTIMIZED)
# =========================

# Example 5: Sort by attribute (using sort_by)
sorted_by_age = users.sort_by(&:age)
puts "Sort by age (sort_by): #{sorted_by_age.map(&:name).inspect}"

# Example 6: Sort by computed value
words = %w[zebra apple banana fig]
sorted_by_length = words.sort_by(&:length)
puts "Sort by length: #{sorted_by_length.inspect}"

# Example 7: Multiple criteria
sorted_multi = users.sort_by { |u| [u.age, u.name] }
puts "Sort by age then name: #{sorted_multi.map(&:name).inspect}"


# =========================
# PERFORMANCE DIFFERENCE
# =========================

# Example 8: Expensive computation difference

data = %w[alpha beta gamma delta]

def expensive_score(word)
  sleep(0.01) # імітація дорогого обчислення
  word.length
end

# sort — expensive_score викликається багато разів
# sort_by — expensive_score викликається 1 раз на елемент

sorted_sort = data.sort { |a, b| expensive_score(a) <=> expensive_score(b) }
puts "Sorted with sort"

sorted_sort_by = data.sort_by { |word| expensive_score(word) }
puts "Sorted with sort_by"


# =========================
# EDGE CASES
# =========================

# Example 9: sort without block requires <=>
begin
  objects = [Object.new, Object.new]
  objects.sort
rescue => e
  puts "Sort error: #{e.class}" # ArgumentError
end

# Example 10: sort_by on empty array
empty = []
puts "Empty sort_by: #{empty.sort_by { |x| x }.inspect}" # []

# Example 11: sort does not modify original
arr = [3, 1, 2]
arr.sort
puts "Original array unchanged: #{arr.inspect}"

# Example 12: sort! modifies original
arr.sort!
puts "After sort!: #{arr.inspect}"
