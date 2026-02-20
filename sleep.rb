# frozen_string_literal: true
#
# Topic: `sleep`
# Purpose: Pause execution for a duration in seconds.
#
# Example 1: Sleep for a fraction of a second
start = Time.now
sleep 0.05
puts "Example 1: slept for ~#{(Time.now - start).round(3)}s"

# Example 2: Sleep in a loop (small delays)
3.times do |i|
  sleep 0.02
  puts "Example 2: tick #{i + 1}"
end

# Example 3: Using `sleep` with a small fixed delay
start = Time.now
sleep 0.01
puts "Example 3: delay ~#{(Time.now - start).round(3)}s"
