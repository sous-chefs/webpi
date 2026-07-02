#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: webpi
# Recipe:: install-zip
#
# Copyright:: 2011-2019, Chef Software, Inc.
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

file_name = ::File.basename(node['webpi']['url'])
installdir = node['webpi']['home']
zip_path = "#{Chef::Config[:file_cache_path]}/#{file_name}"

remote_file zip_path do
  source node['webpi']['url']
  checksum node['webpi']['checksum']
  notifies :delete, "directory[#{installdir}]", :immediately
  notifies :extract, "archive_file[#{zip_path}]", :immediately
end

directory installdir do
  action :nothing
  recursive true
end

archive_file zip_path do
  destination installdir
  action :extract
end

node.default['webpi']['bin'] = "#{node['webpi']['home']}\\WebpiCmd.exe"
