maintainer       "James Walker"
maintainer_email "walkah@walkah.net"
license          "Apache 2.0"
description      "Installs/Configures OpenPhoto"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe           "openphoto", "Installs OpenPhoto"

%w{ php apache2 mysql openssl git }.each do |cb|
  depends cb
end

%w{ debian ubuntu }.each do |os|
  supports os
end

