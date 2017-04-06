#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: webpi
# Attributes:: default
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

default['webpi']['install_method'] = 'msi' # msi or zip

case node['kernel']['machine']
when 'x86_64'
  default['webpi']['msi_checksum'] = 'fd3aa11da27a4698d9fd1fb61dcb5cae6d95ecf70554f0d655b0caf44b0d0ac6'
  default['webpi']['msi'] = 'http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi'
when /i[3-6]86/
  default['webpi']['msi_checksum'] = '4277d5f72f60dfda6d5c8f750f99fe963e0ed44add73e7440fda1bc05b510d25'
  default['webpi']['msi'] = 'http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_x86_en-US.msi'
end

default['webpi']['msi_package_name'] = 'Microsoft Web Platform Installer 5.0'

default['webpi']['url']       = 'http://download.microsoft.com/download/6/8/D/68DAB32D-10B6-461D-8FF5-43CE9BDA6CE5/WebPICMD.zip'
default['webpi']['checksum']  = '7bef8162b983fc83584016dbe0d3b0070a54eca44155f532b65a3ded7a59dccd'
default['webpi']['log'] = "#{Chef::Config[:file_cache_path]}/WebPI.log"

default['webpi']['home'] = "#{ENV['SYSTEMDRIVE']}\\webpi"
