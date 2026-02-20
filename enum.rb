# frozen_string_literal: true
#
# Topic: Enumerable basics
# Purpose: Show common Enumerable methods and custom enumerables.
#
# Example 1: `each`
numbers = [1, 2, 3]
numbers.each { |n| puts "Example 1: #{n}" }

# Example 2: `map`
squared = numbers.map { |n| n * n }
puts "Example 2: #{squared.inspect}"

# Example 3: `select` and `reject`
puts "Example 3: select=#{numbers.select(&:even?).inspect}, reject=#{numbers.reject(&:even?).inspect}"

# Example 4: `reduce`
sum = numbers.reduce(0) { |acc, n| acc + n }
puts "Example 4: #{sum}"

# Example 5: `find`
found = numbers.find { |n| n > 1 }
puts "Example 5: #{found}"

# Example 6: `any?` / `all?` / `none?`
puts "Example 6: any_even=#{numbers.any?(&:even?)}, all_positive=#{numbers.all? { |n| n > 0 }}, none_negative=#{numbers.none? { |n| n < 0 }}"

# Example 7: Custom class including Enumerable
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
puts "Example 7: #{box.map { |x| x / 10 }.inspect}"

# Example 8: Enumerator object
enum = numbers.to_enum
puts "Example 8: #{enum.next}, #{enum.next}"

# Example 9: Lazy enumerator
lazy_result = (1..Float::INFINITY).lazy.select(&:even?).map { |x| x * 2 }.first(5)
puts "Example 9: #{lazy_result.inspect}"

# Example 10: Hash iteration
person = { name: "John", age: 30 }
entries = []
person.each { |key, value| entries << "#{key}=#{value}" }
puts "Example 10: #{entries.join(", ")}" 

# Example 11: `transform_values`
doubled = { a: 1, b: 2 }.transform_values { |v| v * 2 }
puts "Example 11: #{doubled.inspect}"

# Example 12: `group_by`
grouped = [1, 2, 3, 4, 5].group_by(&:even?)
puts "Example 12: #{grouped.inspect}"

# Example 13: `chunk`
chunks = [1, 1, 2, 2, 3, 3].chunk(&:itself).to_a
puts "Example 13: #{chunks.inspect}"

# Example 14: `take` and `drop`
arr = [1, 2, 3, 4, 5]
puts "Example 14: take=#{arr.take(2).inspect}, drop=#{arr.drop(2).inspect}"
