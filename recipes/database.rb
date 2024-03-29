#
# Cookbook Name:: myface
# Recipe:: database
#
# Copyright (C) 2013 Bradford White
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
# Include the mysql Ruby library for Chef
include_recipe "mysql::ruby"

# Create mysql connection binding
mysql_connection_info = { :host => node['myface']['database']['host'],
                          :username => node['myface']['database']['username'],
                          :password => node['myface']['database']['password']}

# Metadata dependency on the database cookbook provides
# access to the mysql_database providers.
mysql_database 'myface' do
  connection mysql_connection_info
  action :create
end

# Write schema seed file to filesystem
cookbook_file node['myface']['database']['seed_file'] do
  source  "myface-init.sql"
  owner   "root"
  group   "root"
  mode    "0644"
end

execute "initialize myface database" do
  command "mysql -h localhost -u root -p#{node['myface']['database']['password']} -D myface < /tmp/myface-init.sql"
  not_if "mysql -h localhost -u root -p#{node['myface']['database']['password']} -D myface -e 'describe users;'"
end
