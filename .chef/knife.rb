log_level                :info
log_location             STDOUT
node_name                'smcleod'
client_key               '/home/smcleod/.chef/smcleod.pem'
validation_client_name   'chef-validator'
validation_key           '/home/smcleod/.chef/validation.pem'
chef_server_url          'http://irulan.homeunix.net:4000'
cache_type               'BasicFile'
cache_options( :path => '/home/smcleod/.chef/checksums' )
cookbook_path            [ "~/chef-repo/cookbooks", "~/chef-repo/site-cookbooks" ]
