# frozen_string_literal: true
#
# Topic: `match`
# Purpose: Work with regex matches and capture groups.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic match
# output: Example 1: 123
text = "hello123"
match = text.match(/\d+/)
puts "Example 1: #{match[0]}"

# Example 2: Capture groups
# output: Example 2: Alice
text = "name: Alice"
match = text.match(/name: (\w+)/)
puts "Example 2: #{match[1]}"

# Example 3: Named captures
# output: Example 3: 2024
text = "2024-05-01"
match = text.match(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/)
puts "Example 3: #{match[:year]}"

# Example 4: `match?` for boolean
# output: Example 4: true
puts "Example 4: #{"abc".match?(/b/)}"

# Example 5: No match returns nil
# output: Example 5: nil
text = "hello"
match = text.match(/\d+/)
puts "Example 5: #{match.inspect}"
