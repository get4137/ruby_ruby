# frozen_string_literal: true
#
# Topic: `chomp` vs `strip`
# Purpose: Compare newline removal vs trimming surrounding whitespace.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `chomp` removes a trailing newline
text = "hello\n"
puts "Example 1: #{text.chomp.inspect}"

# Example 2: `chomp` does nothing if no trailing separator
text = "hello"
puts "Example 2: #{text.chomp.inspect}"

# Example 3: `chomp` keeps trailing spaces
text = "hello \n"
puts "Example 3: #{text.chomp.inspect}"

# Example 4: `strip` removes leading and trailing whitespace
text = "  hello  "
puts "Example 4: #{text.strip.inspect}"

# Example 5: `strip` removes tabs and newlines
text = "\t  hello \n"
puts "Example 5: #{text.strip.inspect}"

# Example 6: `lstrip` / `rstrip` remove one side only
text = "  hello  "
puts "Example 6: lstrip=#{text.lstrip.inspect}, rstrip=#{text.rstrip.inspect}"

# Example 7: `chomp` with a custom separator
text = "hello.END"
puts "Example 7: #{text.chomp(".END").inspect}"

# Example 8: `chomp!` and `strip!` mutate the string
text = " hi\n"
text.chomp!
puts "Example 8: after chomp! #{text.inspect}"
text.strip!
puts "Example 8: after strip! #{text.inspect}"

# Example 9: Processing lines from a simulated input
lines = ["first line\n", "second line\n", "third line\n"]
cleaned = lines.map { |line| line.chomp }
puts "Example 9: #{cleaned.inspect}"

# Example 10: Visual comparison
text = "  data\n"
puts "Example 10: chomp=#{text.chomp.inspect}, strip=#{text.strip.inspect}"
