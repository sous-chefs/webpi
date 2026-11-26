# frozen_string_literal: true

control 'webpi-zip' do
  title 'Install WebPI and its platform installer library from the ZIP'

  install_dir = "#{os_env('SYSTEMDRIVE').content}\\webpi"

  %w(WebpiCmd.exe Microsoft.Web.PlatformInstaller.dll).each do |filename|
    describe file("#{install_dir}\\#{filename}") do
      it { should be_file }
      its('size') { should be > 0 }
    end
  end
end
