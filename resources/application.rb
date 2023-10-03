unified_mode true

property :app_id, String, name_property: true
property :accept_eula, [true, false], default: false
property :suppress_reboot, [true, false], default: true
property :iis_express, [true, false], default: false
property :other_options, String # Can be used for Language or other options depending on application
property :returns, [Integer, Array], default: [0, 42]
property :sql_password, String, sensitive: true # To be used only if required
property :mysql_password, String, sensitive: true # To be used only if required
property :webpi_cmd_path, String, default: "#{ENV['SYSTEMDRIVE']}\\webpi\\WebpiCmd.exe"
property :webpi_log_path, String, default: lazy { "#{Chef::Config[:file_cache_path]}/WebPI.log" }
property :xml_path, String

include Windows::Helper

action :install do
  install_list = apps_to_be_installed

  if install_list.empty?
    Chef::Log.debug("#{new_resource.app_id} application already exists - nothing to do")
  else
    converge_by("#{new_resource} added new application '#{install_list}'") do
      cmd = "\"#{new_resource.webpi_cmd_path}\" /Install"
      cmd << " /application:#{install_list}"
      cmd << ' /suppressreboot' if new_resource.suppress_reboot
      cmd << ' /IISExpress' if new_resource.iis_express
      cmd << ' /accepteula' if new_resource.accept_eula
      cmd << " /XML:#{new_resource.xml_path}" if new_resource.xml_path
      cmd << " /Log:#{new_resource.webpi_log_path}"
      cmd << " /SQLPassword:#{new_resource.sql_password}" if new_resource.sql_password
      cmd << " /MySQLPassword:#{new_resource.mysql_password}" if new_resource.mysql_password
      cmd << " #{new_resource.other_options}"
      shell_out!(cmd, returns: new_resource.returns)
    end
  end
end

action_class do
  # Method checks webpi to see what's installed.
  # Then loops through each product, and if it's missing, adds it to a list to be installed
  def apps_to_be_installed
    install_array = []
    cmd = "\"#{new_resource.webpi_cmd_path}\" /List /ListOption:Installed"
    cmd << " /XML:#{new_resource.xml_path}" if new_resource.xml_path
    cmd_out = shell_out(cmd, returns: [0, 42])
    if cmd_out.stderr.empty?
      new_resource.app_id.split(',').each do |p|
        # Example output
        # HTTPErrors           IIS: HTTP Errors
        # Example output returned via grep
        # \r    \rHTTPErrors           IIS: HTTP Errors\r\ns
        if cmd_out.stdout.lines.grep(/^\s{6}#{p}\s.*$/i).empty?
          install_array << p
        end
      end
    else
      Chef::Log.info(cmd_out.stderr)
      install_array = new_resource.app_id
    end
    install_array.join(',')
  end
end
