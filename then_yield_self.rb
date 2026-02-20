# frozen_string_literal: true
#
# Topic: `then` / `yield_self`
# Purpose: Build readable pipelines.
#
# Example 1: Simple pipeline with `then`
result = "  Ruby "
  .then(&:strip)
  .then(&:upcase)
puts "Example 1: #{result}"

# Example 2: `yield_self` works the same
result = "  Ruby "
  .yield_self(&:strip)
  .yield_self(&:upcase)
puts "Example 2: #{result}"

# Example 3: Use the value in a custom block
value = 5
result = value.then { |v| v * 2 }
puts "Example 3: #{result}"

# Example 4: Conditional step in a pipeline
value = "ruby"
result = value.then { |v| v.start_with?("r") ? v.upcase : v }
puts "Example 4: #{result}"

# Example 5: `then` with objects
user = { name: "Alice" }
result = user.then { |u| u[:name] }.then { |n| "Hello, #{n}" }
puts "Example 5: #{result}"
