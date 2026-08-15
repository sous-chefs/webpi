#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2017-2019, Chef Software, Inc.

node.default['webpi']['install_method'] = 'zip'

include_recipe 'webpi::default'

# The public WebPI product/application feeds now return HTML that WebpiCmd cannot parse
# reliably in CI. Keep this fixture focused on installing the command-line tool.
