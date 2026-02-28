# frozen_string_literal: true
#
# Topic: `fetch`
# Purpose: Read hash/array values with defaults or strict errors.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Hash fetch with a key
# output: Example 1: 1
hash = { a: 1 }
puts "Example 1: #{hash.fetch(:a)}"

# Example 2: Hash fetch with default value
# output: Example 2: 0
puts "Example 2: #{hash.fetch(:b, 0)}"

# Example 3: Hash fetch with a block
# output: Example 3: missing c
value = hash.fetch(:c) { |key| "missing #{key}" }
puts "Example 3: #{value}"

# Example 4: Array fetch with index
# output: Example 4: y
array = ["x", "y"]
puts "Example 4: #{array.fetch(1)}"

# Example 5: Array fetch with default
# output: Example 5: z
puts "Example 5: #{array.fetch(5, "z")}"

# Example 6: Fetch raises KeyError when missing and no default
# output: Example 6: error=KeyError
begin
  hash.fetch(:missing)
rescue => e
  puts "Example 6: error=#{e.class}"
end
