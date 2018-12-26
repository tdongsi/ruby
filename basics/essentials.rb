#!/usr/bin/env ruby

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
puts %q{Her pet's name is "Kenzy"}

