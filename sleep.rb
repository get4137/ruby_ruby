# frozen_string_literal: true
#
# Topic: `sleep`
# Purpose: Pause execution for a duration in seconds.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Sleep for a fraction of a second
# output: Example 1: slept for 0.05s
sleep 0.05
puts "Example 1: slept for 0.05s"

# Example 2: Sleep in a loop (small delays)
# output: Example 2: tick 1
# output: Example 2: tick 2
# output: Example 2: tick 3
3.times do |i|
  sleep 0.02
  puts "Example 2: tick #{i + 1}"
end

# Example 3: Using `sleep` with a small fixed delay
# output: Example 3: slept for 0.01s
sleep 0.01
puts "Example 3: slept for 0.01s"
