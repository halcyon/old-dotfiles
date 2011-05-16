log_level                :info
log_location             STDOUT
client_key               '~/.chef/client.pem'
validation_client_name   'chef-validator'
validation_key           '~/.chef/validation.pem'
chef_server_url          'http://irulan.homeunix.net:4000'
cache_type               'BasicFile'
cache_options( :path => '~/.chef/checksums' )
cookbook_path            [ "~/chef-repo/cookbooks", "~/chef-repo/site-cookbooks" ]
