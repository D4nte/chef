#!/bin/sh

# run curl 'https://raw.githubusercontent.com/D4nte/chef/master/install.sh' > install.sh && chmod +x install.sh && sudo ./install.sh

# better ruby install https://www.rosehosting.com/blog/how-to-install-ruby-2-0-and-rubygems-2-1-11-on-ubuntu-13-10-from-source/

apt-add-repository ppa:brightbox/ruby-ng-experimental && \
aptitude update && \
aptitude safe-upgrade -y && \
aptitude install -y ruby2.0 ruby2.0-dev build-essential wget libruby2.0 screen git && \
gem update --no-rdoc --no-ri && \
gem install ohai chef --no-rdoc --no-ri && \
mkdir src && cd src && \
git clone https://github.com/d4nte/chef.git chef && \
echo 'now run:
chef-solo -c ~/src/chef/solo-aws.rb'
