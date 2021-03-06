#!/bin/bash

set -euo pipefail

cd /tmp
curl https://dl.sandstorm.io/sandstorm-$SANDSTORM_VERSION.tar.xz | tar -xJf -
sudo mkdir -p /home/vagrant
sudo chown -R travis /home/vagrant
sudo mkdir -p /opt
sudo chown -R travis /opt
cd /opt
curl curl https://dl.sandstorm.io/meteor-spk-0.1.8.tar.xz | tar -xJf -
ln -s meteor-spk-0.1.8 meteor-spk
cp -a /bin/bash /opt/meteor-spk/meteor-spk.deps/bin/
cp -a /lib/x86_64-linux-gnu/libncurses.so.* /opt/meteor-spk/meteor-spk.deps/lib/x86_64-linux-gnu/
cp -a /lib/x86_64-linux-gnu/libtinfo.so.* /opt/meteor-spk/meteor-spk.deps/lib/x86_64-linux-gnu/
cd $TRAVIS_BUILD_DIR
cp -r . /opt/app
