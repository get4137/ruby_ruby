# frozen_string_literal: true
#
# Topic: Hash parameters
# Purpose: Access and pass options in a clean, readable way.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Reading hash values
# output: Example 1: size=12, family=Arial
options = { font_size: 12, font_family: "Arial" }
puts "Example 1: size=#{options[:font_size]}, family=#{options[:font_family]}"

# Example 2: Defaults with `fetch`
# output: Example 2: size=12, family=Helvetica
options = { font_size: 12 }
size = options.fetch(:font_size, 10)
family = options.fetch(:font_family, "Helvetica")
puts "Example 2: size=#{size}, family=#{family}"

# Example 3: Keyword arguments
# output: Example 3: Hello (14, Arial)

def render_text(text, font_size: 12, font_family: "Arial")
  "#{text} (#{font_size}, #{font_family})"
end

puts "Example 3: #{render_text("Hello", font_size: 14)}"

# Example 4: Splat options into a method
# output: Example 4: Hi (16, Times)
opts = { font_size: 16, font_family: "Times" }
puts "Example 4: #{render_text("Hi", **opts)}"

# Example 5: Guarding unknown keys
# output: Example 5: unknown=[:color]
ALLOWED = %i[font_size font_family].freeze
user_options = { font_size: 10, color: "red" }
unknown = user_options.keys - ALLOWED
puts "Example 5: unknown=#{unknown.inspect}"
