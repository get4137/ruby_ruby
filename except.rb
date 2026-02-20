# frozen_string_literal: true

# =========================
# Hash#except (ActiveSupport)
# =========================
# Працює в Rails або якщо підключено:
# require 'active_support/core_ext/hash/except'

# Example 1: Basic except
hash = { name: "John", age: 30, role: "admin" }
result = hash.except(:role)
puts "Except role: #{result.inspect}"
# => {:name=>"John", :age=>30}

# Example 2: except multiple keys
result = hash.except(:age, :role)
puts "Except age and role: #{result.inspect}"
# => {:name=>"John"}

# Example 3: Original hash unchanged
puts "Original hash: #{hash.inspect}"
# => {:name=>"John", :age=>30, :role=>"admin"}

# Example 4: except with string keys
hash = { "a" => 1, "b" => 2, "c" => 3 }
result = hash.except("b")
puts "Except string key: #{result.inspect}"
# => {"a"=>1, "c"=>3}

# Example 5: except with non-existing key
result = hash.except("z")
puts "Except non-existing: #{result.inspect}"
# => {"a"=>1, "b"=>2, "c"=>3}

# Example 6: except in chaining
params = { email: "test@mail.com", password: "secret", token: "abc" }
safe_params = params.except(:token)
puts "Safe params: #{safe_params.inspect}"

# Example 7: except in method
def sanitize(params)
  params.except(:password)
end

puts "Sanitized: #{sanitize({ email: "a@b.com", password: "123" }).inspect}"

# Example 8: except with nested hash (shallow only)
data = { user: { name: "John", password: "123" }, token: "abc" }
result = data.except(:token)
puts "Shallow except: #{result.inspect}"
# Вкладені ключі не змінюються


# =========================
# Pure Ruby alternative (without Rails)
# =========================

# Example 9: Using reject
hash = { a: 1, b: 2, c: 3 }
result = hash.reject { |k, _| k == :b }
puts "Reject alternative: #{result.inspect}"

# Example 10: Removing multiple keys with reject
keys_to_remove = [:a, :c]
result = hash.reject { |k, _| keys_to_remove.include?(k) }
puts "Reject multiple: #{result.inspect}"

# Example 11: Using dup + delete (mutating copy)
hash = { a: 1, b: 2, c: 3 }
copy = hash.dup
copy.delete(:b)
puts "Dup + delete: #{copy.inspect}"
puts "Original still intact: #{hash.inspect}"

# Example 12: delete modifies original
hash = { a: 1, b: 2, c: 3 }
hash.delete(:b)
puts "After delete: #{hash.inspect}"

# Example 13: except vs delete difference
hash = { a: 1, b: 2 }
new_hash = hash.except(:b)
puts "Except result: #{new_hash.inspect}"
puts "Original after except: #{hash.inspect}"

# Example 14: except with symbol vs string mismatch
hash = { "a" => 1, b: 2 }
puts "Except symbol :a: #{hash.except(:a).inspect}"
puts "Except string 'a': #{hash.except("a").inspect}"

# Example 15: except for strong params style filtering
params = { name: "John", admin: true, role: "user" }
filtered = params.except(:admin)
puts "Filtered params: #{filtered.inspect}"
