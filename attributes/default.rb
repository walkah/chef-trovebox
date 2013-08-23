#
# Author:: James Walker (<walkah@walkah.net>)
# Cookbook Name:: openphoto
# Attributes:: openphoto
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

# General settings
default['openphoto']['dir'] = "/var/www/openphoto"
default['openphoto']['repository'] = "https://github.com/photo/frontend.git"
default['openphoto']['branch'] = "master"
default['openphoto']['user'] = "openphoto"
default['openphoto']['group'] = "openphoto"
default['openphoto']['server_aliases'] = [node['fqdn']]
