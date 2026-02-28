# frozen_string_literal: true
#
# Topic: `send` and `public_send`
# Purpose: Call methods dynamically.
# Environment: Ruby core (works in plain Ruby).
#
# Example 1: Basic send
# output: Example 1: left
class Robot
  def left
    "left"
  end
end

robot = Robot.new
puts "Example 1: #{robot.send(:left)}"

# Example 2: Send with arguments
# output: Example 2: 5
class Calculator
  def add(a, b)
    a + b
  end
end

calc = Calculator.new
puts "Example 2: #{calc.send(:add, 2, 3)}"

# Example 3: `public_send` prevents calling private methods
# output: Example 3: send=secret
# output: Example 3: public_send error=NoMethodError
class Vault
  private

  def secret
    "secret"
  end
end

vault = Vault.new
puts "Example 3: send=#{vault.send(:secret)}"

begin
  vault.public_send(:secret)
rescue => e
  puts "Example 3: public_send error=#{e.class}"
end

# Example 4: Dynamic method name
# output: Example 4: RUBY
method = :upcase
text = "RuBy"
puts "Example 4: #{text.send(method)}"
