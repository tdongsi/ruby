result = nil

puts nil.class

# Conventionally, method with '?' suffix for checking object's properties
puts result.nil?

# Conventionally, method with '!' suffix for warning, such as in-place modification
my_string = "  abc  "
puts my_string.strip
puts my_string
puts my_string.strip!
puts my_string

# Scripting
puts "Using backticks"
res = `date`
puts res

puts "Equivalent to backticks"
res = %x(date)
puts res

# Backticks will give the command output
# `system` will return true/false (if status 0 or not), nil if it fails.
puts "Using system"
res = system "date"
puts "[#{res}]"
