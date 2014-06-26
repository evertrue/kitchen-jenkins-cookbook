#
# Cookbook Name:: test-kitchen
# Attributes:: default
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

default['kitchen']['gem_version'] = '1.2.1'
default['kitchen']['chef_dk']['url'] = 'https://opscode-omnibus-packages.s3.amazonaws.com' \
                                       '/ubuntu/12.04/x86_64'
default['kitchen']['chef_dk']['pkg'] = 'chefdk_0.1.0-1_amd64.deb'
set['jenkins']['plugins']['install'] = %w(
  credentials
  downstream-buildview
  downstream-ext
  ghprb
  git
  git-client
  git-parameter
  github
  github-api
  gradle
  greenballs
  jquery
  jquery-ui
  multiple-scms
  notification
  parameterized-trigger
  promoted-builds
  publish-over-ssh
  rake
  rbenv
  rebuild
  ruby
  ruby-runtime
  rubyMetrics
  scm-api
  ssh-credentials
  terminal
  token-macro
)
set['jenkins']['plugins']['disable'] = %w(
  cvs
  subversion
)
