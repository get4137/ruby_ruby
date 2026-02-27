# frozen_string_literal: true
#
# Topic: `times`
# Purpose: Repeat a block a fixed number of times.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic times
3.times { |i| puts "Example 1: i=#{i}" }

# Example 2: Build an array with `times`
items = []
5.times { |i| items << i * 10 }
puts "Example 2: #{items.inspect}"

# Example 3: `times` returns the receiver
result = 2.times { |_i| "ignored" }
puts "Example 3: #{result}"

# Example 4: `times` without a block returns an enumerator
enum = 3.times
puts "Example 4: #{enum.class}"

# Example 5: Using the enumerator
values = enum.map { |i| i + 1 }
puts "Example 5: #{values.inspect}"
