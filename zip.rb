# frozen_string_literal: true
#
# Topic: `zip`
# Purpose: Combine arrays element-by-element.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic zip
# output: Example 1: [["Alice", 30], ["Bob", 25]]
names = %w[Alice Bob]
ages = [30, 25]
puts "Example 1: #{names.zip(ages).inspect}"

# Example 2: Zip with uneven arrays
# output: Example 2: [["Alice", 30], ["Bob", 25], ["Carol", nil]]
names = %w[Alice Bob Carol]
ages = [30, 25]
puts "Example 2: #{names.zip(ages).inspect}"

# Example 3: Zip and map into a hash
# output: Example 3: {:id=>1, :name=>"Alice"}
keys = %i[id name]
values = [1, "Alice"]
puts "Example 3: #{keys.zip(values).to_h.inspect}"

# Example 4: Zip with a block
# output: Example 4: [11, 22, 33]
sum = [1, 2, 3].zip([10, 20, 30]).map { |a, b| a + b }
puts "Example 4: #{sum.inspect}"

# Example 5: Zip with nil padding
# output: Example 5: [[1, "a"], [2, nil]]
left = [1, 2]
right = ["a"]
puts "Example 5: #{left.zip(right).inspect}"
