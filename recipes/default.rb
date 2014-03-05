#
# Cookbook Name:: test-kitchen
# Recipe:: default
#
# Copyright 2013, Joshua Timberman
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

include_recipe "virtualbox"
include_recipe "vagrant"

include_recipe "jenkins::java"
include_recipe "jenkins::master"


jenkins_data = node['jenkins']['master']
jenkins_vagrant = ::File.join(jenkins_data[:home], ".vagrant.d")


include_recipe "ruby_build"
ruby_build_ruby "2.1.0"

# This works on Debian 7 and Ubuntu 12.04
[ "build-essential",
  "libxml2-dev",
  "libxslt-dev",
  "git-core" ].each do |pkg|
  package pkg
end

gem_package "test-kitchen" do
  version node['kitchen']['gem_version']
end

%w{
  foodcritic
  kitchen-vagrant
  bundler
  rake
  chefspec
}.each do |gem|

  gem_package gem

end
