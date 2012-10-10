#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: iis
# Attribute:: webpi
#
# Copyright:: Copyright (c) 2011 Opscode, Inc.
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

default['webpi']['install_method'] = "msi" # msi or zip

case  node['kernel']['machine']
when "x86_64"
  default['webpi']['msi'] = "http://download.microsoft.com/download/7/0/4/704CEB4C-9F42-4962-A2B0-5C84B0682C7A/WebPlatformInstaller_amd64_en-US.msi"
when /i[0-9][0-9][0-9]/
  default['webpi']['msi'] = "http://download.microsoft.com/download/7/0/4/704CEB4C-9F42-4962-A2B0-5C84B0682C7A/WebPlatformInstaller_x86_en-US.msi"
end

default['webpi']['url']       = 'http://www.iis.net/community/files/webpi/webpicmd_x86.zip'
default['webpi']['checksum']  = '8d0f901fa699b7deef138f3f8876d40ac8ee112c3aa2d39812a27953f3f3f528'

default['webpi']['home'] = "#{ENV['SYSTEMDRIVE']}\\webpi"
