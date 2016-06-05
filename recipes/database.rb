
include_recipe 'mariadb::server'
include_recipe 'mariadb::client'
include_recipe 'postgresql::server'
include_recipe 'postgresql::client'

if platform?('debian')
  node['php_chef']['database']['packages'].each do |pkg|
    package 'Debian MariaDB Client Files' do
      action :install
      package_name pkg
    end
  end
end

# Include after installing client libraries
include_recipe 'mysql2_chef_gem::mariadb'

mysql_database node['php_chef']['database']['dbname'] do
  connection(
    host: node['php_chef']['database']['host'],
    username: node['php_chef']['database']['username'],
    password: node['php_chef']['database']['password']
  )
end

mysql_database_user node['php_chef']['database']['app']['username'] do
  connection(
    host: node['php_chef']['database']['host'],
    username: node['php_chef']['database']['username'],
    password: node['php_chef']['database']['password']
  )
  password node['php_chef']['database']['app']['password']
  database_name node['php_chef']['database']['dbname']
  host node['php_chef']['database']['host']
  action [:create, :grant]
end
