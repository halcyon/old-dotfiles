#!/usr/bin/env ruby
data = STDIN.read
rev = `git rev-parse master | cut -b1-6`.chomp
puts data.gsub('$Rev$', '$Rev: ' + rev.to_s + ' $')
