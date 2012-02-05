#
# Cookbook Name:: openphoto
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"
include_recipe "git"
include_recipe %w{apache2 apache2::mod_php5 apache2::mod_rewrite apache2::mod_deflate apache2::mod_expires apache2::mod_headers}
include_recipe %w{php php::module_mysql php::module_gd php::module_curl php::module_apc}
include_recipe "mysql::server"

%w{php5-mcrypt php5-imagick exiftran libpcre3-dev}.each do |pkg|
  package pkg
end

php_pear "oauth" do
  action :install
end

if node.has_key?("ec2")
  server_fqdn = node['ec2']['public_hostname']
else
  server_fqdn = node['fqdn']
end

git "#{node[:openphoto][:dir]}" do
  repository "https://github.com/openphoto/frontend.git"
  reference "master"
  action :sync
end

directory "#{node[:openphoto][:dir]}/src/userdata" do
  mode "0755"
  action :create
  recursive true
end

web_app "openphoto" do
  template "openphoto.conf.erb"
  docroot "#{node[:openphoto][:dir]}/src/html"
  server_name server_fqdn
  server_aliases node['openphoto']['server_aliases']
end
