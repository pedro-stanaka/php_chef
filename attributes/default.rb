
default['php_chef']['user'] = 'deploy'
default['php_chef']['group'] = 'deploy'

default['php_chef']['appname'] = 'myapp'
default['php_chef']['servername'] = 'myapp.local'
default['php_chef']['document_root'] = "/var/www/#{node['php_chef']['appname']}"

# Database
default['mariadb']['install']['version'] = '5.5'
default['mariadb']['install']['prefer_os_package'] = false
default['mariadb']['apt_repository']['base_url'] = \
  'mirrors.digitalocean.com/mariadb/repo/'
