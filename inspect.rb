# frozen_string_literal: true

# `inspect` is mainly for developers/debugging: it returns a string representation
# that is usually unambiguous and often shows quotes/structure.
#
# Related methods:
# - `to_s`: user-friendly string (often less detailed)
# - `inspect`: debug-friendly string
# - `p(obj)`: prints `obj.inspect`
# - `puts obj`: prints `obj.to_s`

# Example 1: Array output — puts vs inspect
array = ['aa', 'bb', [1, 2, 3], 4]
puts "puts array:"
puts array
puts "puts array.inspect:"
puts array.inspect
puts "p array (uses inspect):"
p array

# Example 2: Hash output and values.inspect
ages = { 'Luke' => 32 }
ages.store('Mike', [25, 17, 67])
puts "puts ages:"
puts ages
puts "ages.inspect:"
puts ages.inspect
puts "ages.values.inspect:"
puts ages.values.inspect

# Example 3: Strings — inspect shows quotes and escapes
text = "Hello\nWorld"
puts "to_s:\n#{text}"
puts "inspect: #{text.inspect}"

# Example 4: Symbols vs Strings
symbol = :status
string = "status"
puts "Symbol inspect: #{symbol.inspect}"
puts "String inspect: #{string.inspect}"

# Example 5: Numbers/booleans/nil
puts 123.inspect
puts true.inspect
puts nil.inspect

# Example 6: inspect is great for nested data
payload = {
  user: { id: 1, name: "Alice" },
  roles: %w[admin editor],
  flags: { active: true, verified: false }
}
puts "payload.inspect:"
puts payload.inspect

# Example 7: Pretty printing (standard library) with `pp`
require 'pp'
puts "pp payload:"
pp payload

# Example 8: Using inspect for debugging in a helper
def debug_log(label, value)
  puts "[DEBUG] #{label}=#{value.inspect}"
end

debug_log("array", array)
debug_log("payload", payload)

# Example 9: Building a cart without user input
items = [
  { product_id: "A1", amount: 2 },
  { product_id: "B7", amount: 1 },
  { product_id: "A1", amount: 3 }
]

cart = Hash.new(0)
items.each do |item|
  cart[item[:product_id]] += item[:amount]
end

puts "cart.inspect:"
puts cart.inspect
total_items = cart.values.sum
puts "total items in cart: #{total_items}"

# Example 10: Custom inspect on your own class
class User
  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def to_s
    @name
  end

  def inspect
    "#<User id=#{@id} name=#{@name.inspect}>"
  end
end

user = User.new(id: 42, name: "Bob")
puts "puts user (to_s): #{user}"
puts "user.inspect: #{user.inspect}"
p user

# Example 11: Object identity in inspect output
same = []
container = [same, same]
puts "container.inspect (same object twice): #{container.inspect}"

# Summary:
# - Prefer `inspect` (or `p`) when you want structure/quotes/escapes for debugging.
# - Prefer `to_s` (or `puts`) for user-facing output.
# frozen_string_literal: true

# arr = ['aa', 'bb', [1,2,3], 4]
# puts arr
# puts arr.inspect

# hh = {'Luke' => 32}
# hh.store('Mike', [25, 17, 67])
# puts hh
# puts hh.values.inspect

# def mm hh
#   puts hh.inspect
# end
# send :mm, :aa => '111', :b => '222'

# hh = {}
# loop do
# puts 'enter product id: '
# id = gets.chomp
# puts 'enter amount: '
# n = gets.chomp.to_i
# x = hh[id].to_i
# x = x+n
# hh[id] = x
# puts hh.inspect
# total = 0
# hh.each do |k, v|
# total = total + hh[k]
# end
# puts "total items in cart: #{total}"
# end
