#!/usr/bin/env bash

# Run Once Setup

curl -sSL https://rvm.io/mpapis.asc | gpg --import

curl -sSL https://get.rvm.io | bash -s -- --version 1.29.3

source ~/.rvm/scripts/rvm

rvm install 2.4.2

rvm use 2.4.2

gem install bundler

bundle install

bundle exec rake

