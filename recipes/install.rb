# Encoding: utf-8
#
# Cookbook Name:: roundcube
# Recipe:: install
#
# Copyright 2014, Chris Fordham
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

node['roundcube']['php_packages'].each { |pkg| package pkg }

ark 'roundcube' do
  url node['roundcube']['download_url']
  path node['roundcube']['install_dir']
  checksum node['roundcube']['download_checksum']
  version node['roundcube']['version']
  owner node['nginx']['user']
  group node['nginx']['group']
  action :put
end
