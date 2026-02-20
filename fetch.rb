# frozen_string_literal: true
#
# Topic: `fetch`
# Purpose: Read hash/array values with defaults or strict errors.
#
# Example 1: Hash fetch with a key
hash = { a: 1 }
puts "Example 1: #{hash.fetch(:a)}"

# Example 2: Hash fetch with default value
puts "Example 2: #{hash.fetch(:b, 0)}"

# Example 3: Hash fetch with a block
value = hash.fetch(:c) { |key| "missing #{key}" }
puts "Example 3: #{value}"

# Example 4: Array fetch with index
array = ["x", "y"]
puts "Example 4: #{array.fetch(1)}"

# Example 5: Array fetch with default
puts "Example 5: #{array.fetch(5, "z")}"

# Example 6: Fetch raises KeyError when missing and no default
begin
  hash.fetch(:missing)
rescue => e
  puts "Example 6: error=#{e.class}"
end
