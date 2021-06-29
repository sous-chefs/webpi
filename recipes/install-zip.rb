webpi_install 'zip' do
  source node['webpi']['url']
  checksum node['webpi']['checksum']
  install_directory node['webpi']['home']
end
