include WebPi::Cookbook::Helpers

property :install_method,
        String,
        equal_to: %w(msi zip),
        description: 'Method of installing WebPi',
        name_property: true

property :checksum,
        String,
        default: lazy { new_resource.install_method == 'msi' ? default_msi_checksum : '7bef8162b983fc83584016dbe0d3b0070a54eca44155f532b65a3ded7a59dccd' }

property :source,
        String,
        default: lazy { new_resource.install_method == 'msi' ? default_msi_download_url : 'http://download.microsoft.com/download/6/8/D/68DAB32D-10B6-461D-8FF5-43CE9BDA6CE5/WebPICMD.zip' }

property :package_name,
          String,
          default: 'Microsoft Web Platform Installer 5.0'

property :install_directory,
        String,
        default: "#{ENV['SYSTEMDRIVE']}\\webpi"

unified_mode true

action :install do
  if new_resource.install_method == 'msi'
    windows_package new_resource.package_name do
      source new_resource.source
      checksum new_resource.checksum
      action :install
    end
  else

    remote_file "#{Chef::Config[:file_cache_path]}/#{file_name(new_resource.source)}" do
      source new_resource.source
      checksum new_resource.checksum
      notifies :delete, "directory[#{new_resource.install_directory}]", :immediately
    end

    directory new_resource.install_directory do
      action :nothing
      recursive true
      notifies :unzip, 'archive[webpicmdline]', :immediately
    end

    archive 'webpicmdline' do
      path new_resource.install_directory
      source "#{Chef::Config[:file_cache_path]}/#{file_name(new_resource.source)}"
      not_if { ::File.exist?(webpi_bin) }
    end
  end
end

action :remove do
  if new_resource.install_method == 'msi'
    windows_package new_resource.package_name do
      action :remove
    end
  else
    directory new_resource.install_directory do
      action :remove
      recursive true
    end
  end
end

action_class do
  def file_name(source)
    ::File.basename(source)
  end
end
