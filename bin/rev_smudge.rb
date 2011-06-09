#!/usr/bin/env ruby
data = STDIN.read
rev = `git rev-parse master | cut -b1-7`.chomp
puts data.gsub('$Rev$', '$Rev: ' + rev.to_s + ' $')
