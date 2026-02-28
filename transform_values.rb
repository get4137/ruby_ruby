# frozen_string_literal: true
#
# Topic: `transform_values`
# Purpose: Map hash values while keeping keys.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Double values
# output: Example 1: {:a=>2, :b=>4}
hash = { a: 1, b: 2 }
puts "Example 1: #{hash.transform_values { |v| v * 2 }.inspect}"

# Example 2: Convert values to strings
# output: Example 2: {:a=>"1", :b=>"2"}
hash = { a: 1, b: 2 }
puts "Example 2: #{hash.transform_values(&:to_s).inspect}"

# Example 3: Normalize values
# output: Example 3: {:alice=>0.9, :bob=>0.75}
scores = { alice: 90, bob: 75 }
normalized = scores.transform_values { |v| v / 100.0 }
puts "Example 3: #{normalized.inspect}"

# Example 4: `transform_values!` mutates
# output: Example 4: {:a=>2, :b=>3}
hash = { a: 1, b: 2 }
hash.transform_values! { |v| v + 1 }
puts "Example 4: #{hash.inspect}"

# Example 5: Values can depend on keys too
# output: Example 5: {:width=>6, :height=>8}
hash = { width: 3, height: 4 }
areas = hash.transform_values { |v| v * 2 }
puts "Example 5: #{areas.inspect}"
