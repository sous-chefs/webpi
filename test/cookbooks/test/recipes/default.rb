# include_recipe 'webpi::default'

webpi_install 'msi'

webpi_product 'PHP54' do
  accept_eula true
  action :install
end

webpi_application 'WebMatrix' do
  accept_eula true
  action :install
end

webpi_application 'MicrosoftAzure-ServiceFabric-CoreSDK' do
  accept_eula true
  action :install
end

webpi_application 'AcquiaDrupal' do
  accept_eula    true
  mysql_password 'password' # To be set from encrypted databag
  action         :install
end
