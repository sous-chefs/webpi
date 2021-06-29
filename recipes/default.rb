
if node['webpi']['install_method'] == 'msi'
  webpi_install 'msi' do
    package_name node['webpi']['msi_package_name']
    source node['webpi']['msi']
    checksum node['webpi']['msi_checksum']
  end
else
  webpi_install 'zip' do
    source node['webpi']['url']
    checksum node['webpi']['checksum']
    install_directory node['webpi']['home']
  end
end
