# frozen_string_literal: true
#
# Topic: `transform_keys`
# Purpose: Map hash keys to new values.
#
# Example 1: Symbolize keys
hash = { "a" => 1, "b" => 2 }
symbolized = hash.transform_keys(&:to_sym)
puts "Example 1: #{symbolized.inspect}"

# Example 2: Upcase keys
hash = { a: 1, b: 2 }
upcased = hash.transform_keys { |k| k.to_s.upcase }
puts "Example 2: #{upcased.inspect}"

# Example 3: Prefix keys
hash = { id: 1, name: "Alice" }
prefixed = hash.transform_keys { |k| "user_#{k}" }
puts "Example 3: #{prefixed.inspect}"

# Example 4: `transform_keys!` mutates
hash = { a: 1, b: 2 }
hash.transform_keys!(&:to_s)
puts "Example 4: #{hash.inspect}"

# Example 5: Handle duplicate keys after transform
hash = { a: 1, "a" => 2 }
puts "Example 5: #{hash.transform_keys(&:to_s).inspect}"
