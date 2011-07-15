log_level                :info
node_name                "#{ENV['USER']}"
log_location             STDOUT
client_key               "#{ENV['HOME']}/.chef/client.pem"
validation_client_name   'chef-validator'
validation_key           "#{ENV['HOME']}/.chef/validation.pem"
chef_server_url          'http://localhost:4000'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            [ "#{ENV['HOME']}/chef-repo/cookbooks", "#{ENV['HOME']}/chef-repo/site-cookbooks" ]
