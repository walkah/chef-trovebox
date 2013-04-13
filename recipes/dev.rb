include_recipe "openphoto"

# install the YAML pear from the symfony project
sc = php_pear_channel "pear.symfony.com" do
  action :discover
end
php_pear "Yaml" do
  channel sc.channel_name
  action :install
end

# Install PHPUnit
puc = php_pear_channel "pear.phpunit.de" do
  action :discover
end
php_pear "PHPUnit" do
  channel puc.channel_name
  action :install
end

# Install vfsStream
vc = php_pear_channel "pear.bovigo.org" do 
  action :discover
end
php_pear "vfsStream" do
  preferred_state "beta"
  channel vc.channel_name
  action :install
end
