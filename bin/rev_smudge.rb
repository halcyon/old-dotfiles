#!/usr/bin/env ruby
data = STDIN.read
head = `git rev-parse HEAD`.chomp
puts data.gsub('$Rev$', '$Rev: ' + head.to_s + '$')
