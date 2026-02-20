# frozen_string_literal: true

# `even?` is an Integer predicate: returns true if the number is divisible by 2.
# Related: `odd?`

# Example 1: Basic usage in a loop
5.times { |i| puts "i = #{i}, even? #{i.even?}" }

# Example 2: even? / odd? on positive and negative integers
[-3, -2, -1, 0, 1, 2, 3].each do |n|
  puts "n=#{n}, even? #{n.even?}, odd? #{n.odd?}"
end

# Example 3: Filtering only even numbers
numbers = (1..20).to_a
evens = numbers.select(&:even?)
odds = numbers.select(&:odd?)
puts "evens: #{evens.inspect}"
puts "odds:  #{odds.inspect}"

# Example 4: Index parity (common with each_with_index)
words = %w[zero one two three four]
words.each_with_index do |word, index|
  label = index.even? ? "EVEN index" : "ODD index"
  puts "[#{label}] index=#{index} word=#{word}"
end

# Example 5: Alternating behavior by parity
10.times do |i|
  if i.even?
    puts "#{i}: do A"
  else
    puts "#{i}: do B"
  end
end

# Example 6: Parity with modulo (same idea as even?/odd?)
value = 42
puts "value % 2 == 0 ? #{value % 2 == 0}"
puts "value.even?     #{value.even?}"

# Example 7: Parity with bitwise AND (fast parity check)
value = 41
puts "bitwise parity: (#{value} & 1) == 0 ? #{(value & 1) == 0} (even?)"

# Example 8: Guard clause pattern
def require_even!(n)
  return "OK: #{n} is even" if n.even?
  "ERROR: #{n} must be even"
end

puts require_even!(10)
puts require_even!(11)

# Example 9: Common pitfall: Float does not have even?/odd?
floating = 2.0
puts "Float example: #{floating} (Float responds to even?: #{floating.respond_to?(:even?)})"
puts "If you need parity from numeric input, convert to Integer carefully:"
puts "2.0.to_i.even? => #{floating.to_i.even?}"
