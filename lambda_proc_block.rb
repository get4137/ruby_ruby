# frozen_string_literal: true

# Ruby has 3 closely related concepts:
# - block: implicit chunk of code passed to a method
# - proc: an object wrapping a block (more permissive arity, special return behavior)
# - lambda: a stricter proc (strict arity, return behaves like a method)

# Example 1: Block basics (implicit parameter)
3.times { |i| puts "Block iteration i=#{i}" }

# Example 2: Yielding to a block (block is NOT an object)
def with_logging
  puts "Before yield"
  result = yield("payload") if block_given?
  puts "After yield, block returned: #{result.inspect}"
end

with_logging { |value| value.upcase }

# Example 3: Converting a block to a Proc (&block)
def run_block_twice(&block)
  puts "block.class = #{block.class}" # Proc
  block.call(1)
  block.call(2)
end

run_block_twice { |n| puts "Got #{n}" }

# Example 4: Creating and calling a Proc
double_proc = proc { |x| x * 2 }
puts "proc call: #{double_proc.call(10)}"

# Example 5: Creating and calling a lambda
double_lambda = ->(x) { x * 2 } # same as lambda { |x| x * 2 }
puts "lambda call: #{double_lambda.call(10)}"

# Example 6: Arity difference (lambda is strict, proc is permissive)
strict = ->(a, b) { [a, b] }
loose = proc { |a, b| [a, b] }

puts "lambda arity: #{strict.arity}, proc arity: #{loose.arity}"
begin
  strict.call(1) # ArgumentError
rescue ArgumentError => e
  puts "lambda strict arity error: #{e.message}"
end
puts "proc permissive arity: #{loose.call(1).inspect}" # b becomes nil

# Example 7: return behavior difference (most important!)
#
# - return inside a lambda returns FROM THE LAMBDA (like a normal method)
# - return inside a proc tries to return FROM THE ENCLOSING METHOD
def return_from_lambda
  fn = -> { return "returned from lambda" }
  value = fn.call
  "method continues, got: #{value}"
end

puts return_from_lambda

def return_from_proc
  fn = proc { return "returned from proc (exits method!)" }
  fn.call
  "unreachable"
end

puts return_from_proc

# Example 8: Using callables (block/proc/lambda) as arguments
def apply_to(values, callable)
  values.map { |v| callable.call(v) }
end

increment = ->(x) { x + 1 }
square = proc { |x| x * x }

puts "apply increment: #{apply_to([1, 2, 3], increment).inspect}"
puts "apply square: #{apply_to([1, 2, 3], square).inspect}"

# Example 9: Passing a Proc as a block using & (and back)
printer = proc { |x| puts "Value=#{x}" }
[10, 20, 30].each(&printer)

# Example 10: Block vs proc/lambda for composition
add_10 = ->(x) { x + 10 }
add_20 = ->(x) { x + 20 }
sub_5  = ->(x) { x - 5 }

start_value = 100
a = add_10.call(start_value)
b = add_20.call(a)
c = sub_5.call(b)
puts "Pipeline: start=#{start_value}, a=#{a}, b=#{b}, c=#{c}"

# Example 11: block_given? and default behavior
def maybe_transform(value)
  return value unless block_given?
  yield(value)
end

puts maybe_transform("ruby")
puts maybe_transform("ruby") { |v| v.upcase }

# Example 12: Method objects are also callables
def shout(text)
  text.upcase
end

method_obj = method(:shout)
puts "method object call: #{method_obj.call('hello')}"

# Summary:
# - **block**: passed implicitly; use `yield` / `block_given?`
# - **proc**: object wrapper for blocks; flexible arity; `return` exits enclosing method
# - **lambda**: proc with strict arity; `return` exits only the lambda (method continues)

# say_hi1 = lambda {puts 'Hi 1'}
# say_hi1.call
# def say_hi2
#   puts 'Hi 2'
# end
# say_hi2

# say_hi = lambda {puts 'Hi'}
# say_bye = lambda {puts 'Bye'}

# week = [say_hi, say_hi, say_hi, say_hi, say_hi, say_bye, say_bye]
# week.each do |f|
#   f.call
# end

# sub_10 = lambda {|x| x -10}
# a = sub_10.call 1000
# puts a

# sub_10 = lambda do |x|
#   x - 10
# end
# a = sub_10.call 1000
# puts a

# add_10 = lambda {|x| x + 10}
# add_20 = lambda {|x| x + 20}
# sub_5 = lambda {|x| x - 5}
# a = add_10.call 100
# b = add_20.call a
# c = sub_5.call b
# puts a, b, c
