module WebPi
  module Cookbook
    module Helpers
      def default_msi_checksum
        case node['kernel']['machine']
        when 'x86_64'
          'fd3aa11da27a4698d9fd1fb61dcb5cae6d95ecf70554f0d655b0caf44b0d0ac6'
        when /i[3-6]86/
          '4277d5f72f60dfda6d5c8f750f99fe963e0ed44add73e7440fda1bc05b510d25'
        end
      end

      def default_msi_download_url
        case node['kernel']['machine']
        when 'x86_64'
          'http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi'
        when /i[3-6]86/
          'http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_x86_en-US.msi'
        end
      end

      # MSI manage PATH
      def webpi_bin
        # ::Chef::DSL::Recipe.include Chef::Mixin::PowershellOut
        if powershell_out('Get-Command WebpiCmd.exe').exitstatus == 0
          'WebpiCmd.exe'
        elsif ::File.exist? "#{ENV['ProgramW6432']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
          "#{ENV['ProgramW6432']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
        elsif ::File.exist? "#{ENV['ProgramFiles']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
          "#{ENV['ProgramFiles']}/Microsoft/Web Platform Installer/WebpiCmd.exe"
        else
          Chef::Log.error 'Unable to find Webpi executable'
          raise "WebpiCmd.exe can't be found"
        end
      end
    end
  end
end
