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

default['vagrant']['url'] = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb'
default['vagrant']['checksum'] = 'dbd06de0f3560e2d046448d627bca0cbb0ee34b036ef605aa87ed20e6ad2684b'

default['kitchen']['gem_version'] = '1.2.1'
