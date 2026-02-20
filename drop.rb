# frozen_string_literal: true

# =========================
# ARRAY#drop examples
# =========================

# Example 1: Basic drop
arr = [1, 2, 3, 4, 5]
result = arr.drop(2)
puts "Drop first 2: #{result.inspect}" # [3, 4, 5]

# Example 2: drop does not modify original array
arr = [1, 2, 3]
arr.drop(1)
puts "Original unchanged: #{arr.inspect}" # [1, 2, 3]

# Example 3: drop 0 elements
arr = [1, 2, 3]
puts "Drop 0: #{arr.drop(0).inspect}" # [1, 2, 3]

# Example 4: drop more than array size
arr = [1, 2, 3]
puts "Drop 10: #{arr.drop(10).inspect}" # []

# Example 5: drop with empty array
arr = []
puts "Drop from empty: #{arr.drop(2).inspect}" # []

# Example 6: drop with negative argument (raises error)
begin
  [1, 2, 3].drop(-1)
rescue => e
  puts "Negative drop error: #{e.class}" # ArgumentError
end


# =========================
# Enumerable#drop examples
# =========================

# Example 7: drop on range
range = (1..10)
puts "Range drop 5: #{range.drop(5).inspect}" # [6, 7, 8, 9, 10]

# Example 8: drop on string characters
chars = "hello".each_char.to_a
puts "Drop 2 chars: #{chars.drop(2).inspect}" # ["l", "l", "o"]

# Example 9: drop with each_line
text = "line1\nline2\nline3\n"
lines = text.each_line.to_a
puts "Drop first line: #{lines.drop(1).inspect}"


# =========================
# drop vs shift comparison
# =========================

# Example 10: shift modifies array
arr = [1, 2, 3]
arr.shift
puts "After shift: #{arr.inspect}" # [2, 3]

# Example 11: drop does not modify
arr = [1, 2, 3]
arr.drop(1)
puts "After drop: #{arr.inspect}" # [1, 2, 3]


# =========================
# drop with chaining
# =========================

# Example 12: drop + map
arr = [1, 2, 3, 4, 5]
result = arr.drop(2).map { |x| x * 2 }
puts "Drop and map: #{result.inspect}" # [6, 8, 10]

# Example 13: drop + select
arr = [1, 2, 3, 4, 5, 6]
result = arr.drop(2).select { |x| x.even? }
puts "Drop and select even: #{result.inspect}" # [4, 6]

# Example 14: drop with method chaining on range
result = (1..20).drop(10).take(3)
puts "Range drop 10 take 3: #{result.inspect}" # [11, 12, 13]


# =========================
# drop_while comparison
# =========================

# Example 15: drop_while with condition
arr = [1, 2, 3, 4, 1, 2]
result = arr.drop_while { |x| x < 3 }
puts "Drop while < 3: #{result.inspect}" # [3, 4, 1, 2]

# Example 16: drop vs drop_while difference
arr = [1, 2, 3, 4]
puts "Drop 2: #{arr.drop(2).inspect}" # [3, 4]
puts "Drop while < 3: #{arr.drop_while { |x| x < 3 }.inspect}" # [3, 4]


# =========================
# Edge cases
# =========================

# Example 17: drop on single-element array
arr = [42]
puts "Drop 1: #{arr.drop(1).inspect}" # []

# Example 18: drop on nil-safe navigation (if array may be nil)
arr = nil
result = arr&.drop(1)
puts "Nil safe drop: #{result.inspect}" # nil

# Example 19: drop on large array
large = (1..1000).to_a
puts "Drop 995 size: #{large.drop(995).size}" # 5

# Example 20: Using drop in pagination-like logic
items = (1..10).to_a
page = 2
per_page = 3
paginated = items.drop((page - 1) * per_page).take(per_page)
puts "Paginated page 2: #{paginated.inspect}" # [4, 5, 6]
