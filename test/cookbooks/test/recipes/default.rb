#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2017-2019, Chef Software, Inc.

# Microsoft retired the public product feeds. Verify the offline ZIP installation.
node.default['webpi']['install_method'] = 'zip'

include_recipe 'webpi::default'
