require 'spec_helper'

describe 'MSI webpi_install' do
  step_into :webpi_install
  platform :windows

  context 'install webpi' do
    recipe do
      webpi_install 'msi'
    end

    it 'Installs the MSI package' do
      is_expected.to install_windows_package('Microsoft Web Platform Installer 5.0')
    end
  end
end

# describe 'Zip WebPi install' do
#   step_into :webpi_install
#   platform :windows

#   context 'install webpi' do
#     recipe do
#       webpi_install 'zip'
#     end

#     it 'Creates the application directory' do
#       is_expected.to extract_archive('webpicmdline')
#     end
#   end
# end
