Description
===========
Installs OpenPhoto according to the instructions at http://theopenphotoproject.org/documentation/guide/InstallationUbuntuApache

Requirements
============

Platform
--------

* Debian, Ubuntu

Tested on:

* Ubuntu 10.04

Cookbooks
---------

* mysql
* php
* apache2
* opensssl (uses library to generate secure passwords)

Attributes
==========

* `node['openphoto']['dir']` - Set the location to place openphoto files. Default is /var/www.
* `node['openphoto']['server_aliases']` - Array of ServerAliases used in apache vhost. Default is `node['fqdn']`.

License and Author
==================

Author:: James Walker (walkah@walkah.net)

Copyright:: 2010-2011, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
