#
# Author:: Guilhem Lettron (<guilhem.lettron@youscribe.com>)
# Cookbook:: webpi
# Recipe:: install-msi
#
# Copyright:: 2011-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
webpi_install 'msi' do
  package_name node['webpi']['msi_package_name']
  source node['webpi']['msi']
  checksum node['webpi']['msi_checksum']
end
