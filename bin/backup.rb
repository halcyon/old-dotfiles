#!/usr/bin/env ruby
require "yaml"
require "open-uri"

time = Time.new
backupDirectory = "/home/smcleod/githubbackup/#{time.year}.#{time.month}.#{time.day}"
username = "halcyon"

YAML.load(open("http://github.com/api/v2/yaml/repos/show/#{username}"))['repositories'].map{|repository|

    puts "found repository: #{repository[:name]} ... downloading ..."
    #exec
    system "git clone --recurse-submodules git@github.com:#{username}/#{repository[:name]}.git #{backupDirectory}/#{repository[:name]}"
}
