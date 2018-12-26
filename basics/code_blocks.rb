#!/usr/bin/env ruby

# Basic function
def printMsg(msg)
    puts msg
end

printMsg("Good morning")

# Code block
def appTemplate
    # Enter
    puts "Welcome to my app"
    # Some generic code
    yield "input"
    # Exit
    puts "Thank you for using my app"
end

appTemplate do |s|
    puts "Running with #{s}...."
end

# Short form, conventionally for one-liner
appTemplate { puts "Started..."}