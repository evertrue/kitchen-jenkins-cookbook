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

%w{
  parameterized-trigger
  git-client
  token-macro
  credentials
  multiple-scms
  scm-api
  ssh-credentials
  promoted-builds
  git
}.each do |plugin|
  jenkins_plugin plugin
end

%w{
  github
  github-api
  ghprb
}.each do |plugin|
  jenkins_plugin plugin
end

include_recipe "rbenv::system_install"
include_recipe "ruby_build"
rbenv_ruby "2.1.0"
rbenv_global "2.1.0"

# This works on Debian 7 and Ubuntu 12.04
[ "build-essential",
  "libxml2-dev",
  "libxslt-dev",
  "git-core" ].each do |pkg|
  package pkg
end

rbenv_gem "test-kitchen" do
  version node['kitchen']['gem_version']
end

%w{
  foodcritic
  kitchen-vagrant
  bundler
  chefspec
  knife-spork
}.each do |gem|
  rbenv_gem gem
end

rbenv_gem "berkshelf" do
  version "3.0.0.beta7"
  options "--pre"
end
