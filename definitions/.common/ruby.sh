#!/bin/bash -eux

cd /tmp

wget -O- http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz | tar oxz
cd yaml-0.1.4
./configure --prefix=/opt/ruby
make && make install
cd ..
rm -rf yaml-0.1.4

wget -O- http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz | tar oxz
cd ruby-1.9.3-p392
./configure --prefix=/opt/ruby --with-opt-dir=/opt/ruby
make && make install
cd ..
rm -rf ruby-1.9.3-p392

echo 'PATH=$PATH:/opt/ruby/bin' > /etc/profile.d/opt-ruby.sh
