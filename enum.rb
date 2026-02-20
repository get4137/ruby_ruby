# frozen_string_literal: true

# =========================
# ENUMERABLE BASICS
# =========================

# Example 1: each
numbers = [1, 2, 3]
numbers.each do |n|
  puts "Each: #{n}"
end

# Example 2: map
squared = numbers.map { |n| n * n }
puts "Map (squared): #{squared.inspect}"

# Example 3: select
evens = numbers.select(&:even?)
puts "Select (even): #{evens.inspect}"

# Example 4: reject
odds = numbers.reject(&:even?)
puts "Reject (odd): #{odds.inspect}"

# Example 5: reduce
sum = numbers.reduce(0) { |acc, n| acc + n }
puts "Reduce (sum): #{sum}"

# Example 6: find
found = numbers.find { |n| n > 1 }
puts "Find > 1: #{found}"

# Example 7: any?
puts "Any even?: #{numbers.any?(&:even?)}"

# Example 8: all?
puts "All positive?: #{numbers.all? { |n| n > 0 }}"

# Example 9: none?
puts "None negative?: #{numbers.none? { |n| n < 0 }}"

# Example 10: count
puts "Count even: #{numbers.count(&:even?)}"


# =========================
# CREATING CUSTOM ENUMERABLE
# =========================

# Example 11: Custom class including Enumerable
class Box
  include Enumerable

  def initialize(items)
    @items = items
  end

  def each(&block)
    @items.each(&block)
  end
end

box = Box.new([10, 20, 30])
puts "Custom Enumerable map: #{box.map { |x| x / 10 }.inspect}"


# =========================
# ENUMERATOR OBJECT
# =========================

# Example 12: to_enum / enum_for
arr = [1, 2, 3]
enum = arr.to_enum
puts "Enumerator next: #{enum.next}"
puts "Enumerator next: #{enum.next}"

# Example 13: Lazy enumerator
lazy_result = (1..Float::INFINITY).lazy
                                  .select(&:even?)
                                  .map { |x| x * 2 }
                                  .first(5)
puts "Lazy result: #{lazy_result.inspect}"


# =========================
# RAILS-LIKE ENUM SIMULATION
# =========================

# Example 14: Simple enum pattern (without Rails)
class Order
  STATUSES = {
    pending: 0,
    paid: 1,
    shipped: 2
  }.freeze

  attr_reader :status

  def initialize(status)
    @status = status
  end

  def paid?
    status == STATUSES[:paid]
  end
end

order = Order.new(1)
puts "Order paid?: #{order.paid?}"


# =========================
# ENUM WITH HASH ITERATION
# =========================

# Example 15: each on hash
person = { name: "John", age: 30 }
person.each do |key, value|
  puts "Key: #{key}, Value: #{value}"
end

# Example 16: transform_values
doubled = { a: 1, b: 2 }.transform_values { |v| v * 2 }
puts "Transform values: #{doubled.inspect}"

# Example 17: group_by
grouped = [1, 2, 3, 4, 5].group_by(&:even?)
puts "Group by even: #{grouped.inspect}"

# Example 18: chunk
chunks = [1, 1, 2, 2, 3, 3].chunk { |x| x }.to_a
puts "Chunk: #{chunks.inspect}"

# Example 19: cycle
cycled = []
[1, 2].cycle(2) { |x| cycled << x }
puts "Cycle: #{cycled.inspect}"

# Example 20: take and drop
arr = [1, 2, 3, 4, 5]
puts "Take 2: #{arr.take(2).inspect}"
puts "Drop 2: #{arr.drop(2).inspect}"
