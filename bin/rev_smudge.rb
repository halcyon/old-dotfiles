#!/usr/bin/env ruby
data = STDIN.read
rev = `git rev-parse master`.chomp
puts data.gsub('$Rev$', '$Rev: ' + rev.to_s + ' $')
