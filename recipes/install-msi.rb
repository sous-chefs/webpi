#
# Author:: Guilhem Lettron (<guilhem.lettron@youscribe.com>)
# Cookbook:: webpi
# Recipe:: install-msi
#
# Copyright:: 2011-2017, Chef Software, Inc.
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

# Do this stuff at compile time so we can build the path and use the exe on this run for the LWRP
windows_package node['webpi']['msi_package_name'] do
  source node['webpi']['msi']
  checksum node['webpi']['msi_checksum']
  action :nothing
end.run_action(:install)

# MSI manage PATH
::Chef::Recipe.send(:include, Chef::Mixin::PowershellOut)
if powershell_out('Get-Command WebpiCmd.exe').exitstatus == 0
  node.default['webpi']['bin'] = 'WebpiCmd.exe'
elsif ::File.exist? "#{ENV['ProgramW6432']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
  node.default['webpi']['bin'] = "#{ENV['ProgramW6432']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
elsif ::File.exist? "#{ENV['ProgramFiles']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
  node.default['webpi']['bin'] = "#{ENV['ProgramFiles']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
else
  Chef::Log.error 'Unable to find Webpi executable'
  raise "WebpiCmd.exe can't be found"
end
