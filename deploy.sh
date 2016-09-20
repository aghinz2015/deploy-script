#!/bin/bash

mkdir tmp-deploy
cd tmp-deploy

# /tmp-deploy
git clone https://github.com/aghinz2015/foram-api.git
cd foram-api

# /foram-api
git checkout master
git pull
bundle install
bundle exec cap production deploy
cd ..

# /tmp-deploy
git clone https://github.com/aghinz2015/foram.git
cd foram

# /foram
git checkout master
git pull
npm install grunt
gem install compass
npm install bower
npm install
node_modules/bower/bin/bower install
npm install grunt-cli
npm install --save-dev grunt-google-cdn
node_modules/grunt-cli/bin/grunt deploy_production
cd ..

# /tmp-deploy
sudo service apache2 stop
sudo service nginx restart

cd ..

# /
rm -rf tmp-deploy/
