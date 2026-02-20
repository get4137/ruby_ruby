# frozen_string_literal: true

# Example 1: Basic sleep with fractional seconds - animation effect
100.times do
  print 'hello '
  sleep 0.03
end
puts

# Example 2: Sleep with integer seconds
puts "Starting..."
sleep 2
puts "2 seconds passed"

# Example 3: Sleep with fractional seconds
puts "Waiting 0.5 seconds..."
sleep 0.5
puts "Done!"

# Example 4: Sleep with multiple delays
puts "Step 1"
sleep 1
puts "Step 2"
sleep 1.5
puts "Step 3"
sleep 0.5
puts "All steps completed"

# Example 5: Sleep in a loop with counter
5.times do |i|
  puts "Iteration #{i + 1}"
  sleep 1
end

# Example 6: Sleep with progress indicator
puts "Processing..."
5.times do |i|
  print "."
  sleep 0.2
end
puts " Complete!"

# Example 7: Sleep without arguments - waits for Enter key
puts "Press Enter to continue..."
sleep
puts "Continued!"

# Example 8: Sleep with countdown
5.downto(1) do |count|
  puts "Countdown: #{count}"
  sleep 1
end
puts "Blast off!"

# Example 9: Sleep with timing measurement
start_time = Time.now
sleep 2
end_time = Time.now
elapsed = end_time - start_time
puts "Slept for approximately #{elapsed.round(2)} seconds"

# Example 10: Sleep in a method
def delayed_greeting(name)
  puts "Preparing greeting..."
  sleep 1
  puts "Hello, #{name}!"
end

delayed_greeting("Ruby")

# Example 11: Sleep with conditional delay
def process_with_delay(items, delay)
  items.each do |item|
    puts "Processing: #{item}"
    sleep delay
  end
end

process_with_delay(["item1", "item2", "item3"], 0.5)

# Example 12: Sleep with error handling
begin
  puts "Starting operation..."
  sleep 2
  puts "Operation completed"
rescue => e
  puts "Error: #{e.message}"
end

# Example 13: Sleep with timeout simulation
def simulate_timeout(seconds)
  puts "Operation started..."
  sleep seconds
  puts "Operation timed out after #{seconds} seconds"
end

simulate_timeout(1)

# Example 14: Sleep with rate limiting
def rate_limited_requests(requests, delay)
  requests.each do |request|
    puts "Making request: #{request}"
    sleep delay
  end
end

rate_limited_requests(["req1", "req2", "req3"], 0.3)

# Example 15: Sleep with animation frames
frames = ["|", "/", "-", "\\"]
10.times do
  frames.each do |frame|
    print "\rLoading #{frame}"
    sleep 0.1
  end
end
puts "\rLoading complete!"

# Example 16: Sleep with exponential backoff
def retry_with_backoff(max_attempts)
  max_attempts.times do |attempt|
    puts "Attempt #{attempt + 1}"
    sleep(2 ** attempt)  # Exponential: 1s, 2s, 4s, 8s...
  end
end

retry_with_backoff(4)

# Example 17: Sleep with random delay
5.times do |i|
  delay = rand(0.1..0.5)
  puts "Iteration #{i + 1}, sleeping for #{delay.round(2)}s"
  sleep delay
end

# Example 18: Sleep with user feedback
def long_operation
  puts "Starting long operation..."
  sleep 0.5
  puts "25% complete..."
  sleep 0.5
  puts "50% complete..."
  sleep 0.5
  puts "75% complete..."
  sleep 0.5
  puts "100% complete!"
end

long_operation

# Example 19: Sleep with precise timing
def precise_timing(iterations, delay)
  start = Time.now
  iterations.times do |i|
    sleep delay
    elapsed = Time.now - start
    puts "Iteration #{i + 1}, elapsed: #{elapsed.round(3)}s"
  end
end

precise_timing(3, 0.1)

# Example 20: Sleep with early exit
def sleep_with_break(max_time)
  start = Time.now
  while Time.now - start < max_time
    puts "Running..."
    sleep 0.5
    break if rand < 0.3  # 30% chance to break early
  end
  puts "Finished"
end

sleep_with_break(5)

# Example 21: Sleep with nested delays
puts "Outer loop starting"
3.times do |outer|
  puts "  Outer iteration #{outer + 1}"
  2.times do |inner|
    puts "    Inner iteration #{inner + 1}"
    sleep 0.2
  end
  sleep 0.5
end

# Example 22: Sleep with variable delay based on condition
def adaptive_delay(items)
  items.each do |item|
    delay = item.length > 5 ? 0.5 : 0.2
    puts "Processing '#{item}' (delay: #{delay}s)"
    sleep delay
  end
end

adaptive_delay(["short", "very long item", "medium"])

# Example 23: Sleep with millisecond precision
puts "High precision timing"
sleep 0.001  # 1 millisecond
puts "1ms passed"
sleep 0.01   # 10 milliseconds
puts "10ms passed"
sleep 0.1    # 100 milliseconds
puts "100ms passed"

# Example 24: Sleep with yield in custom method
def delayed_execution(delay)
  puts "Before delay"
  sleep delay
  yield if block_given?
  puts "After delay"
end

delayed_execution(0.5) do
  puts "Block executed after delay"
end

# Example 25: Sleep with accumulator pattern
def process_with_pause(items, pause_time)
  results = []
  items.each do |item|
    result = item.upcase
    results << result
    puts "Processed: #{result}"
    sleep pause_time
  end
  results
end

results = process_with_pause(["a", "b", "c"], 0.3)
puts "All results: #{results.inspect}"

# Example 26: Sleep with thread simulation (single-threaded)
def simulate_concurrent_tasks
  tasks = ["Task A", "Task B", "Task C"]
  tasks.each do |task|
    puts "#{task} started"
    sleep 0.3
    puts "#{task} completed"
  end
end

simulate_concurrent_tasks

# Example 27: Sleep with status updates
def operation_with_status
  statuses = ["Initializing", "Processing", "Finalizing"]
  statuses.each_with_index do |status, i|
    puts "[#{i + 1}/#{statuses.length}] #{status}..."
    sleep 0.5
  end
  puts "Operation complete!"
end

operation_with_status

# Example 28: Sleep with conditional execution
def conditional_delay(condition, delay)
  if condition
    puts "Condition met, waiting #{delay}s..."
    sleep delay
    puts "Waited and continuing"
  else
    puts "Condition not met, skipping delay"
  end
end

conditional_delay(true, 0.5)
conditional_delay(false, 0.5)

# Example 29: Sleep with retry pattern
def retry_operation(max_attempts, delay)
  max_attempts.times do |attempt|
    puts "Attempt #{attempt + 1}"
    sleep delay
    # Simulate success on third attempt
    if attempt == 2
      puts "Success!"
      return true
    end
  end
  false
end

retry_operation(5, 0.3)

# Example 30: Sleep with cumulative timing
def cumulative_timing(operations)
  total_time = 0
  operations.each do |op|
    start = Time.now
    sleep 0.2  # Simulate operation
    elapsed = Time.now - start
    total_time += elapsed
    puts "#{op}: #{elapsed.round(3)}s (total: #{total_time.round(3)}s)"
  end
end

cumulative_timing(["Op1", "Op2", "Op3"])

# Example 31: Sleep with formatted output
def formatted_delay(message, seconds)
  print "#{message} "
  seconds.times do
    print "."
    sleep 1
  end
  puts " Done!"
end

formatted_delay("Loading", 3)

# Example 32: Sleep with array processing
def process_array_with_delay(array, delay)
  array.each_with_index do |item, index|
    puts "[#{index + 1}/#{array.length}] Processing: #{item}"
    sleep delay
  end
end

process_array_with_delay(["apple", "banana", "cherry"], 0.4)

# Example 33: Sleep with hash iteration
def process_hash_with_delay(hash, delay)
  hash.each do |key, value|
    puts "Key: #{key}, Value: #{value}"
    sleep delay
  end
end

process_hash_with_delay({a: 1, b: 2, c: 3}, 0.3)

# Example 34: Sleep with string building
def build_string_with_delay(chars, delay)
  result = ""
  chars.each do |char|
    result += char
    print result
    sleep delay
    print "\r" + " " * result.length + "\r"  # Clear line
  end
  puts result
end

build_string_with_delay(["H", "e", "l", "l", "o"], 0.2)

# Example 35: Sleep with zero delay (no-op)
puts "Before zero sleep"
sleep 0
puts "After zero sleep (instant)"

# Example 36: Sleep with very small delay
puts "Testing microsecond delays"
sleep 0.0001  # 100 microseconds
puts "100 microseconds passed"

# Example 37: Sleep with maximum delay demonstration
puts "Testing longer delay (3 seconds)..."
sleep 3
puts "3 seconds passed"

# Example 38: Sleep with pattern repetition
def repeat_pattern(pattern, times, delay)
  times.times do
    pattern.each do |item|
      print item
      sleep delay
    end
    puts
  end
end

repeat_pattern(["*", "-", "*"], 3, 0.1)

# Example 39: Sleep with state machine simulation
def state_machine_with_delay
  states = [:idle, :processing, :completed]
  states.each do |state|
    puts "State: #{state}"
    sleep 0.5
  end
end

state_machine_with_delay

# Example 40: Sleep with cleanup after delay
def operation_with_cleanup
  puts "Starting operation..."
  sleep 1
  puts "Operation running..."
  sleep 1
  puts "Cleaning up..."
  sleep 0.5
  puts "Cleanup complete"
end

operation_with_cleanup
