# frozen_string_literal: true

# =========================
# BASIC MERGE
# =========================

# Example 1: Simple merge
hash1 = { a: 1, b: 2 }
hash2 = { b: 3, c: 4 }

result = hash1.merge(hash2)
puts "Merged hash: #{result.inspect}"
# => {:a=>1, :b=>3, :c=>4}

# Example 2: Original hashes unchanged
puts "hash1: #{hash1.inspect}"
puts "hash2: #{hash2.inspect}"

# =========================
# merge! (destructive)
# =========================

# Example 3: merge! modifies original
hash1 = { a: 1, b: 2 }
hash2 = { b: 3 }

hash1.merge!(hash2)
puts "After merge!: #{hash1.inspect}"
# => {:a=>1, :b=>3}

# =========================
# MERGE WITH BLOCK
# =========================

# Example 4: Resolve conflicts with block
hash1 = { a: 1, b: 2 }
hash2 = { b: 3, c: 4 }

result = hash1.merge(hash2) do |key, old_val, new_val|
  old_val + new_val
end

puts "Merged with block: #{result.inspect}"
# => {:a=>1, :b=>5, :c=>4}

# Example 5: Prefer old value
result = hash1.merge(hash2) { |_k, old_val, _new_val| old_val }
puts "Keep old values: #{result.inspect}"

# Example 6: Prefer new value explicitly
result = hash1.merge(hash2) { |_k, _old_val, new_val| new_val }
puts "Keep new values: #{result.inspect}"

# =========================
# NESTED HASH (SHALLOW MERGE)
# =========================

# Example 7: Shallow merge only
hash1 = { user: { name: "John", age: 30 } }
hash2 = { user: { age: 31 } }

result = hash1.merge(hash2)
puts "Shallow merge: #{result.inspect}"
# => {:user=>{:age=>31}}
# Вкладений hash повністю перезаписаний

# =========================
# DEEP MERGE (manual)
# =========================

# Example 8: Manual deep merge
def deep_merge(h1, h2)
  h1.merge(h2) do |_key, old_val, new_val|
    if old_val.is_a?(Hash) && new_val.is_a?(Hash)
      deep_merge(old_val, new_val)
    else
      new_val
    end
  end
end

hash1 = { user: { name: "John", age: 30 } }
hash2 = { user: { age: 31 } }

result = deep_merge(hash1, hash2)
puts "Deep merge: #{result.inspect}"
# => {:user=>{:name=>"John", :age=>31}}

# =========================
# STRING KEYS
# =========================

# Example 9: Merge string keys
h1 = { "a" => 1 }
h2 = { "a" => 2 }

puts "String key merge: #{h1.merge(h2).inspect}"

# =========================
# WITH DEFAULT VALUES
# =========================

# Example 10: Hash with default
h1 = Hash.new(0)
h1[:a] = 1

h2 = { b: 2 }

merged = h1.merge(h2)
puts "Default preserved? #{merged.default}" # nil (default не копіюється)

# =========================
# MERGE IN PRACTICE
# =========================

# Example 11: Merging params-like hashes
defaults = { page: 1, per_page: 20 }
params   = { per_page: 50 }

options = defaults.merge(params)
puts "Options: #{options.inspect}"

# Example 12: Conditional merge
base = { a: 1 }
extra = { b: 2 }

result = base.merge(extra) if extra
puts "Conditional merge: #{result.inspect}"

# =========================
# EDGE CASES
# =========================

# Example 13: Merge empty hash
h1 = { a: 1 }
puts "Merge empty: #{h1.merge({}).inspect}"

# Example 14: Merge into empty
puts "Empty merge: #{{}.merge(h1).inspect}"

# Example 15: Multiple merge chaining
result = { a: 1 }.merge({ b: 2 }).merge({ c: 3 })
puts "Chained merge: #{result.inspect}"
