#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2017, Chef Software, Inc.

include_recipe 'webpi::default'

webpi_product 'PHP54' do
  accept_eula true
  action :install
end

webpi_application 'WebMatrix' do
  accept_eula true
  action :install
end
