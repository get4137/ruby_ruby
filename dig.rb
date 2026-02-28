# frozen_string_literal: true
#
# Topic: `dig`
# Purpose: Safely access nested data without raising errors.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Hash dig
# output: Example 1: "Alice"
user = { profile: { name: "Alice" } }
puts "Example 1: #{user.dig(:profile, :name).inspect}"

# Example 2: Missing key returns nil
# output: Example 2: nil
puts "Example 2: #{user.dig(:profile, :age).inspect}"

# Example 3: Array dig
# output: Example 3: 3
matrix = [[1, 2], [3, 4]]
puts "Example 3: #{matrix.dig(1, 0).inspect}"

# Example 4: Mixed hash and array
# output: Example 4: "Jane"
payload = { users: [{ name: "Bob" }, { name: "Jane" }] }
puts "Example 4: #{payload.dig(:users, 1, :name).inspect}"

# Example 5: Compare with [] (raises if intermediate is nil)
# output: Example 5: nil
missing = { data: nil }
puts "Example 5: #{missing.dig(:data, :value).inspect}"
