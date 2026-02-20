# frozen_string_literal: true

# Example 1: Basic split with comma delimiter - processing CSV data
csv_data = "item1,100\nitem2,200\nitem3,150"
total_sum = 0
csv_data.split("\n").each do |line|
  values_array = line.split ','
  value = values_array[1].to_i
  total_sum += value
end
puts "Total: #{total_sum}"

# Example 2: Basic split with space delimiter
text = "Hello World Ruby"
words = text.split
puts "Words: #{words.inspect}"

# Example 3: Split with explicit space delimiter
text = "apple banana cherry"
fruits = text.split(' ')
puts "Fruits: #{fruits.inspect}"

# Example 4: Split with comma delimiter
csv_line = "John,Doe,30,Engineer"
fields = csv_line.split(',')
puts "CSV fields: #{fields.inspect}"

# Example 5: Split with empty string - character by character
text = "Hello"
chars = text.split('')
puts "Characters: #{chars.inspect}"

# Example 6: Split with limit parameter - limiting number of splits
text = "one:two:three:four"
parts = text.split(':', 2)
puts "Limited split: #{parts.inspect}"

# Example 7: Split with limit parameter - more examples
text = "a,b,c,d,e"
parts = text.split(',', 3)
puts "Split with limit 3: #{parts.inspect}"

# Example 8: Split with multiple character delimiter
text = "one::two::three"
parts = text.split('::')
puts "Double colon split: #{parts.inspect}"

# Example 9: Split with regex pattern
text = "one1two2three3four"
parts = text.split(/\d+/)
puts "Regex split: #{parts.inspect}"

# Example 10: Split with regex for multiple delimiters
text = "one,two;three:four"
parts = text.split(/[,;:]/)
puts "Multiple delimiters: #{parts.inspect}"

# Example 11: Split with whitespace regex
text = "one   two    three"
parts = text.split(/\s+/)
puts "Whitespace regex: #{parts.inspect}"

# Example 12: Split removing empty strings
text = "one,,two,,three"
parts = text.split(',')
puts "With empty strings: #{parts.inspect}"

parts_no_empty = text.split(',').reject(&:empty?)
puts "Without empty strings: #{parts_no_empty.inspect}"

# Example 13: Split with newline delimiter
multiline_text = "line1\nline2\nline3"
lines = multiline_text.split("\n")
puts "Lines: #{lines.inspect}"

# Example 14: Split with tab delimiter
tab_separated = "col1\tcol2\tcol3"
columns = tab_separated.split("\t")
puts "Tab-separated: #{columns.inspect}"

# Example 15: Split with period delimiter
ip_address = "192.168.1.1"
octets = ip_address.split('.')
puts "IP octets: #{octets.inspect}"

# Example 16: Split with pipe delimiter
pipe_data = "name|age|city"
fields = pipe_data.split('|')
puts "Pipe-delimited: #{fields.inspect}"

# Example 17: Split with semicolon delimiter
semicolon_data = "first;second;third"
parts = semicolon_data.split(';')
puts "Semicolon-delimited: #{parts.inspect}"

# Example 18: Split with hyphen delimiter
date_string = "2024-01-15"
date_parts = date_string.split('-')
puts "Date parts: #{date_parts.inspect}"

# Example 19: Split with forward slash delimiter
path = "home/user/documents/file.txt"
path_parts = path.split('/')
puts "Path parts: #{path_parts.inspect}"

# Example 20: Split with backslash delimiter (Windows path)
windows_path = "C:\\Users\\Documents\\file.txt"
path_parts = windows_path.split('\\')
puts "Windows path parts: #{path_parts.inspect}"

# Example 21: Split with no delimiter - splits on whitespace
text = "  hello   world  ruby  "
parts = text.split
puts "Whitespace split: #{parts.inspect}"

# Example 22: Split with limit 0 - no limit
text = "a,b,c,d"
parts = text.split(',', 0)
puts "Limit 0 (no limit): #{parts.inspect}"

# Example 23: Split with negative limit - no limit
text = "a,b,c,d"
parts = text.split(',', -1)
puts "Negative limit (no limit): #{parts.inspect}"

# Example 24: Split with limit 1 - returns original string
text = "a,b,c,d"
parts = text.split(',', 1)
puts "Limit 1: #{parts.inspect}"

# Example 25: Split processing each part
csv_data = "name,age,city"
csv_data.split(',').each_with_index do |field, index|
  puts "Field #{index}: #{field}"
end

# Example 26: Split and map transformation
numbers_string = "1,2,3,4,5"
numbers = numbers_string.split(',').map(&:to_i)
puts "Numbers: #{numbers.inspect}"

# Example 27: Split and select filtering
words_string = "apple,banana,cherry,date"
long_words = words_string.split(',').select { |word| word.length > 5 }
puts "Long words: #{long_words.inspect}"

# Example 28: Split and reject filtering
data_string = "one,two,,three,"
clean_parts = data_string.split(',').reject(&:empty?)
puts "Clean parts: #{clean_parts.inspect}"

# Example 29: Split with chained methods
text = "  HELLO  WORLD  "
words = text.split.map(&:downcase)
puts "Processed words: #{words.inspect}"

# Example 30: Split counting occurrences
text = "apple,banana,apple,cherry,apple"
fruits = text.split(',')
apple_count = fruits.count('apple')
puts "Apple count: #{apple_count}"

# Example 31: Split with strip to remove whitespace
csv_line = " name , age , city "
fields = csv_line.split(',').map(&:strip)
puts "Stripped fields: #{fields.inspect}"

# Example 32: Split with custom processing
data = "John:25:Engineer"
name, age, profession = data.split(':')
puts "Name: #{name}, Age: #{age}, Profession: #{profession}"

# Example 33: Split with multiple assignment
coordinates = "10,20,30"
x, y, z = coordinates.split(',').map(&:to_i)
puts "Coordinates: x=#{x}, y=#{y}, z=#{z}"

# Example 34: Split reading from string lines
multiline = "first line\nsecond line\nthird line"
lines = multiline.split("\n")
lines.each_with_index do |line, i|
  puts "Line #{i + 1}: #{line}"
end

# Example 35: Split with regex capturing groups
text = "one123two456three"
parts = text.split(/(\d+)/)
puts "Split with capturing groups: #{parts.inspect}"

# Example 36: Split with word boundary regex
text = "hello world ruby"
words = text.split(/\b/)
puts "Word boundary split: #{words.inspect}"

# Example 37: Split with non-word character regex
text = "hello,world;ruby:programming"
words = text.split(/\W+/)
puts "Non-word split: #{words.inspect}"

# Example 38: Split with digit regex
text = "one1two2three3"
parts = text.split(/\d/)
puts "Digit split: #{parts.inspect}"

# Example 39: Split with non-digit regex
text = "123abc456def789"
parts = text.split(/\D+/)
puts "Non-digit split: #{parts.inspect}"

# Example 40: Split with empty delimiter - each character
text = "Ruby"
chars = text.split('')
puts "Each character: #{chars.inspect}"

# Example 41: Split with nil delimiter - splits on whitespace
text = "hello   world"
parts = text.split(nil)
puts "Nil delimiter: #{parts.inspect}"

# Example 42: Split handling edge cases - empty string
empty_string = ""
parts = empty_string.split(',')
puts "Empty string split: #{parts.inspect}"

# Example 43: Split handling edge cases - no delimiter found
text = "hello world"
parts = text.split(',')
puts "No delimiter found: #{parts.inspect}"

# Example 44: Split with trailing delimiter
text = "one,two,three,"
parts = text.split(',')
puts "Trailing delimiter: #{parts.inspect}"

# Example 45: Split with leading delimiter
text = ",one,two,three"
parts = text.split(',')
puts "Leading delimiter: #{parts.inspect}"

# Example 46: Split with consecutive delimiters
text = "one,,two,,,three"
parts = text.split(',')
puts "Consecutive delimiters: #{parts.inspect}"

# Example 47: Split and join back
text = "hello world ruby"
words = text.split
rejoined = words.join(' ')
puts "Original: #{text}"
puts "Rejoined: #{rejoined}"

# Example 48: Split processing multiline CSV content
csv_content = "line1,value1\nline2,value2\nline3,value3"
csv_content.split("\n").each do |line|
  fields = line.split(',')
  puts "Line: #{fields[0]}, Value: #{fields[1]}"
end

# Example 49: Split with case-insensitive delimiter
text = "HelloWORLDRuby"
parts = text.split(/[A-Z]/)
puts "Case-insensitive split: #{parts.inspect}"

# Example 50: Split extracting specific fields
csv_line = "John,Doe,30,Engineer,New York"
first_name, last_name, age = csv_line.split(',')[0..2]
puts "First: #{first_name}, Last: #{last_name}, Age: #{age}"

# Example 51: Split with block processing
text = "one,two,three"
result = text.split(',').map do |item|
  item.upcase
end
puts "Uppercased: #{result.inspect}"

# Example 52: Split with compact to remove nils
text = "one,,two,three"
parts = text.split(',').compact
puts "Compact split: #{parts.inspect}"

# Example 53: Split with uniq to remove duplicates
text = "apple,banana,apple,cherry,banana"
unique_fruits = text.split(',').uniq
puts "Unique fruits: #{unique_fruits.inspect}"

# Example 54: Split with sort
text = "zebra,apple,banana,cherry"
sorted = text.split(',').sort
puts "Sorted: #{sorted.inspect}"

# Example 55: Split with reverse
text = "one,two,three"
reversed = text.split(',').reverse
puts "Reversed: #{reversed.inspect}"
