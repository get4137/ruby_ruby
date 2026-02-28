# frozen_string_literal: true
#
# Topic: `merge` and `merge!`
# Purpose: Combine hashes and handle key conflicts.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic merge
# output: Example 1: {:a=>1, :b=>3, :c=>4}
left = { a: 1, b: 2 }
right = { b: 3, c: 4 }
puts "Example 1: #{left.merge(right).inspect}"

# Example 2: `merge` does not mutate
# output: Example 2: {:a=>1, :b=>2}
puts "Example 2: #{left.inspect}"

# Example 3: `merge!` mutates
# output: Example 3: {:a=>1, :b=>3, :c=>4}
mutated = left.dup
mutated.merge!(right)
puts "Example 3: #{mutated.inspect}"

# Example 4: Merge with a block to resolve conflicts
# output: Example 4: {:a=>1, :b=>5, :c=>4}
combined = left.merge(right) { |_key, old, new| old + new }
puts "Example 4: #{combined.inspect}"

# Example 5: Merge nested hashes manually
# output: Example 5: {:ui=>{:theme=>"dark"}, :retries=>2}
settings = { ui: { theme: "light" }, retries: 2 }
override = { ui: { theme: "dark" } }
merged = settings.merge(override)
puts "Example 5: #{merged.inspect}"

# Example 6: Deep merge (simple custom version)
# output: Example 6: {:ui=>{:theme=>"dark"}, :retries=>2}
class Hash
  def deep_merge(other)
    merge(other) do |_key, old, new|
      old.is_a?(Hash) && new.is_a?(Hash) ? old.deep_merge(new) : new
    end
  end
end

puts "Example 6: #{settings.deep_merge(override).inspect}"
