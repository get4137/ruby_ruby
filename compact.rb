# frozen_string_literal: true
#
# Topic: `compact` and `compact!`
# Purpose: Remove nil values from arrays (and hashes via `compact` in newer Ruby).
#
# Example 1: Basic `compact`
values = [1, nil, 2, nil, 3]
puts "Example 1: #{values.compact.inspect}"

# Example 2: `compact` does not mutate
values = [1, nil, 2]
values.compact
puts "Example 2: #{values.inspect}"

# Example 3: `compact!` mutates (returns nil if no changes)
values = [1, nil, 2]
result = values.compact!
puts "Example 3: values=#{values.inspect}, result=#{result.inspect}"

# Example 4: `compact!` returns nil when nothing changes
values = [1, 2, 3]
result = values.compact!
puts "Example 4: values=#{values.inspect}, result=#{result.inspect}"

# Example 5: Compact on hash (Ruby 2.4+)
settings = { a: 1, b: nil, c: 2 }
puts "Example 5: #{settings.compact.inspect}"

# Example 6: Compact with enumeration
items = ["a", nil, "b", nil, "c"]
cleaned = items.each_with_object([]) { |item, acc| acc << item unless item.nil? }
puts "Example 6: #{cleaned.inspect}"

# Example 7: Compact after mapping
names = ["Alice", nil, "Bob"]
upcased = names.map { |name| name&.upcase }
puts "Example 7: #{upcased.compact.inspect}"

# Example 8: Compact in a pipeline
values = [1, nil, 2, nil, 3, 4]
result = values.compact.select(&:even?)
puts "Example 8: #{result.inspect}"
