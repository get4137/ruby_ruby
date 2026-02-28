# frozen_string_literal: true
#
# Topic: `chomp` vs `strip`
# Purpose: Compare newline removal vs trimming surrounding whitespace.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: `chomp` removes a trailing newline
# output: Example 1: "hello"
text = "hello\n"
puts "Example 1: #{text.chomp.inspect}"

# Example 2: `chomp` does nothing if no trailing separator
# output: Example 2: "hello"
text = "hello"
puts "Example 2: #{text.chomp.inspect}"

# Example 3: `chomp` keeps trailing spaces
# output: Example 3: "hello "
text = "hello \n"
puts "Example 3: #{text.chomp.inspect}"

# Example 4: `strip` removes leading and trailing whitespace
# output: Example 4: "hello"
text = "  hello  "
puts "Example 4: #{text.strip.inspect}"

# Example 5: `strip` removes tabs and newlines
# output: Example 5: "hello"
text = "\t  hello \n"
puts "Example 5: #{text.strip.inspect}"

# Example 6: `lstrip` / `rstrip` remove one side only
# output: Example 6: lstrip="hello  ", rstrip="  hello"
text = "  hello  "
puts "Example 6: lstrip=#{text.lstrip.inspect}, rstrip=#{text.rstrip.inspect}"

# Example 7: `chomp` with a custom separator
# output: Example 7: "hello"
text = "hello.END"
puts "Example 7: #{text.chomp(".END").inspect}"

# Example 8: `chomp!` and `strip!` mutate the string
# output: Example 8: after chomp! " hi"
# output: Example 8: after strip! "hi"
text = String.new(" hi\n")
text.chomp!
puts "Example 8: after chomp! #{text.inspect}"
text.strip!
puts "Example 8: after strip! #{text.inspect}"

# Example 9: Processing lines from a simulated input
# output: Example 9: ["first line", "second line", "third line"]
lines = ["first line\n", "second line\n", "third line\n"]
cleaned = lines.map { |line| line.chomp }
puts "Example 9: #{cleaned.inspect}"

# Example 10: Visual comparison
# output: Example 10: chomp="  data", strip="data"
text = "  data\n"
puts "Example 10: chomp=#{text.chomp.inspect}, strip=#{text.strip.inspect}"
