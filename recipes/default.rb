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

include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

node['jenkins']['plugins']['install'].each do |plugin|
  jenkins_plugin plugin
end

node['jenkins']['plugins']['disable'].each do |plugin|
  jenkins_plugin plugin do
    action :disable
  end
end

# This works on Ubuntu 12.04
%w(
  build-essential
  libxml2-dev
  libxslt-dev
  git-core
).each do |pkg|
  package pkg
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['kitchen']['chef_dk']['pkg']}" do
  source "#{node['kitchen']['chef_dk']['url']}/#{node['kitchen']['chef_dk']['pkg']}"
  mode 0644
end

dpkg_package 'chefdk' do
  source "#{Chef::Config[:file_cache_path]}/#{node['kitchen']['chef_dk']['pkg']}"
  action :install
end
