#
# Author:: Guilhem Lettron (<guilhem.lettron@youscribe.com>)
# Cookbook Name:: webpi
# Recipe:: default
#
# Copyright 2011-2015, Chef Software, Inc.
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

if node['webpi']['install_method'] == 'zip'
  message = 'Microsoft no longer packages WebPI in zip format. You must now install WebPI using the MSIs'
  Chef::Log.error message
  fail message
else
  include_recipe "webpi::install-msi"
end
