#!/usr/bin/env ruby

##########################################################
# String
##########################################################
puts "Hello World"
print "Hello World\n"

myName = "Tui"
# Double quotes allow string interpolation
puts "My name is #{myName}"
# Single quotes mean standard string
puts 'My name is #{myName}'

# C-style string format
printf "My name is %s\n", myName
# %d for integer, %f for floating point
printf "The PI constant is %0.2f\n", 3.14159

# Use double-quoted string to escape single quote character
print "Her pet's name is Kenzy\n"
# Use %q for mixture of single and double quotes
puts %q{Her pet's name is "Kenzy" }

# Use heredoc for multi-line string
message = <<EOS
  There's no place I can be
  since I found serenity
EOS
puts message

# <<- ignore spaces before ending EOS
message = <<-EOS
  There's no place I can be
  since I found serenity
  EOS
# puts message

##########################################################
# Regex
##########################################################

message = "Today is 10/06"

regex = Regexp.new('\d+')
puts message =~ regex

regex = /\w+: \d+/
regex = %r{\d+/\d+}

puts message =~ regex
a =  "Nothing" =~ regex
puts a.nil?

puts message !~ regex

m = /(\d+):(\d+)/.match("Time is 12:13 am")
puts "#{m.pre_match}, #{m.post_match}"
puts "#{m[0]}, #{m[1]}, #{m[2]}"
# Global variable version
puts "#{$`}, #{$'}"
puts "#{$&}, #{$1}, #{$2}"  # NOTE: what is "$0"?


##########################################################
# Arrays
##########################################################

names = ['joe', 'andy', 'betty']

# Demo of loops
if false
  # For loops
  for name in names
    puts name
  end

  names.each do |u|
    puts u
  end

# Conventionally for one-liner
  names.each { |u| puts u }

# while loops
  i = 0
  while i < names.length
    puts names[i]
    i = i + 1
  end

  for i in (1..5)  # range(1,5)
    puts i
  end
end


my_arr = Array.new(3, "abc")
p my_arr
my_arr.first.upcase!
p my_arr

my_arr = Array.new(3) {"abc"}
p my_arr
my_arr.first.upcase!
p my_arr

# Create LoL
mlol = Array.new(3) { Array.new(3, 0) }
p mlol
mlol[1][1] = 3
p mlol

# words from string
# Use backlash to add space
words = %w(array\ of #{2+2} words)
p words
# %W for double quote string behaviors
words = %W(array\ of #{2+2} words)
p words

# symbols from string
syms = %i(up down left right)
p syms
puts syms * ","

##########################################################
# Hash
##########################################################

user = {
  "name" => "joe",
  "age" => 31,
  "job" => "SWE"
}
puts user["name"]

# Symbol is preferred over string in hashes
# Better performance and resource usage. 
user = {
  :name => "jane",
  :age => 23
}
puts user[:name]

# Iterate through keys
for k in user.keys
  puts k
end

# Iterate through items
for item in user
  puts "key: #{item[0]}, value: #{item[1]}"
end
