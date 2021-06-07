#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: webpi
# Attributes:: default
#
# Copyright:: 2011-2016, Chef Software, Inc.
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
  default['webpi']['msi_checksum'] = '13F4CBB9FA554F77F2AB407BAA40501FC6C131F3077D48AAB839CE63ED8A90E2'
  default['webpi']['msi'] = 'https://download.microsoft.com/download/8/4/9/849DBCF2-DFD9-49F5-9A19-9AEE5B29341A/WebPlatformInstaller_x64_en-US.msi'
when /i[3-6]86/
  default['webpi']['msi_checksum'] = '62E871352B413BC976D8E9402697C684B26807EB863B14D2F54677BDB969DD14'
  default['webpi']['msi'] = 'https://download.microsoft.com/download/8/4/9/849DBCF2-DFD9-49F5-9A19-9AEE5B29341A/WebPlatformInstaller_x86_en-US.msi'
end

default['webpi']['msi_package_name'] = 'Microsoft Web Platform Installer 5.0'

default['webpi']['url']       = 'http://download.microsoft.com/download/6/8/D/68DAB32D-10B6-461D-8FF5-43CE9BDA6CE5/WebPICMD.zip'
default['webpi']['checksum']  = '7bef8162b983fc83584016dbe0d3b0070a54eca44155f532b65a3ded7a59dccd'
default['webpi']['log'] = "#{Chef::Config[:file_cache_path]}/WebPI.log"

default['webpi']['home'] = "#{ENV['SYSTEMDRIVE']}\\webpi"
