# frozen_string_literal: true

# Example 1: Basic chomp removing newline
text = "hello\n"
result = text.chomp
puts "Chomp newline: #{result.inspect}" # "hello"

# Example 2: chomp when no newline present
text = "hello"
result = text.chomp
puts "Chomp without newline: #{result.inspect}" # "hello"

# Example 3: chomp removes only trailing newline, not spaces
text = "hello \n"
result = text.chomp
puts "Chomp keeps spaces: #{result.inspect}" # "hello "

# Example 4: strip removes leading and trailing whitespace
text = "  hello  "
result = text.strip
puts "Strip whitespace: #{result.inspect}" # "hello"

# Example 5: strip removes spaces and newline
text = "  hello \n"
result = text.strip
puts "Strip spaces and newline: #{result.inspect}" # "hello"

# Example 6: lstrip removes leading whitespace only
text = "  hello  "
result = text.lstrip
puts "Lstrip: #{result.inspect}" # "hello  "

# Example 7: rstrip removes trailing whitespace only
text = "  hello  "
result = text.rstrip
puts "Rstrip: #{result.inspect}" # "  hello"

# Example 8: chomp with custom separator
text = "hello.END"
result = text.chomp(".END")
puts "Chomp custom separator: #{result.inspect}" # "hello"

# Example 9: chomp does not remove internal newline
text = "hello\nworld\n"
result = text.chomp
puts "Chomp only last newline: #{result.inspect}" # "hello\nworld"

# Example 10: strip does not remove internal whitespace
text = "  hello   world  "
result = text.strip
puts "Strip keeps internal spaces: #{result.inspect}" # "hello   world"

# Example 11: Processing lines from simulated file input
lines = ["first line\n", "second line\n", "third line\n"]
lines.each do |line|
  puts "Processed line: #{line.chomp}"
end

# Example 12: Comparing chomp vs strip behavior
text = "  data\n"
puts "Original: #{text.inspect}"
puts "Chomp:    #{text.chomp.inspect}"
puts "Strip:    #{text.strip.inspect}"

# Example 13: Empty string behavior
text = ""
puts "Empty chomp: #{text.chomp.inspect}" # ""
puts "Empty strip: #{text.strip.inspect}" # ""

# Example 14: String with only whitespace
text = "   \n"
puts "Chomp whitespace-only: #{text.chomp.inspect}" # "   "
puts "Strip whitespace-only: #{text.strip.inspect}" # ""

# Example 15: chomp! modifies original string
text = "hello\n"
text.chomp!
puts "After chomp!: #{text.inspect}" # "hello"

# Example 16: strip! modifies original string
text = "  hello  "
text.strip!
puts "After strip!: #{text.inspect}" # "hello"

# Example 17: chomp with multiple newline characters
text = "hello\n\n"
result = text.chomp
puts "Chomp multiple newlines: #{result.inspect}" # removes only one

# Example 18: strip removes tabs and spaces
text = "\t  hello \t"
result = text.strip
puts "Strip tabs and spaces: #{result.inspect}" # "hello"

# Example 19: rstrip vs chomp difference
text = "hello \n"
puts "Chomp result:  #{text.chomp.inspect}"   # "hello "
puts "Rstrip result: #{text.rstrip.inspect}"  # "hello"

# Example 20: Using chomp in gets simulation
input = "user input\n"
clean_input = input.chomp
puts "Clean input: #{clean_input.inspect}"
