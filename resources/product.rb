#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: webpi
# Resource:: product
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

property :product_id, String, name_property: true
property :accept_eula, [true, false], default: false
property :returns, [Integer, Array], default: [0, 42]

include Windows::Helper

action :install do
  install_list = prods_to_be_installed

  if install_list.empty?
    Chef::Log.debug("#{new_resource.product_id} product already exists - nothing to do")
  else
    converge_by("#{new_resource} added new product '#{install_list}'") do
      cmd = "\"#{webpicmd}\" /Install"
      cmd << " /products:#{install_list} /suppressreboot"
      cmd << ' /accepteula' if new_resource.accept_eula
      cmd << " /XML:#{node['webpi']['xmlpath']}" if node['webpi']['xmlpath']
      cmd << " /Log:#{node['webpi']['log']}"
      shell_out!(cmd, returns: new_resource.returns)
    end
  end
end

action_class do
  # Method checks webpi to see what's installed.
  # Then loops through each product, and if it's missing, adds it to a list to be installed
  def prods_to_be_installed
    install_array = []
    cmd = "\"#{webpicmd}\" /List /ListOption:Installed"
    cmd << " /XML:#{node['webpi']['xmlpath']}" if node['webpi']['xmlpath']
    cmd_out = shell_out(cmd, returns: [0, 42])
    if cmd_out.stderr.empty?
      new_resource.product_id.split(',').each do |p|
        # Example output
        # HTTPErrors           IIS: HTTP Errors
        # Example output returned via grep
        # \r    \rHTTPErrors           IIS: HTTP Errors\r\ns
        if cmd_out.stdout.lines.grep(/^\s{6}#{p}\s.*$/i).empty?
          install_array << p
        end
      end
    else
      Chef::Log.info(cmd_out.stderr)
      install_array = new_resource.product_id
    end
    install_array.join(',')
  end

  def webpicmd
    @webpicmd ||= begin
      node['webpi']['bin']
    end
  end
end
