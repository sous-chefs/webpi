# webpi Cookbook

[![Build status](https://ci.appveyor.com/api/projects/status/reuore13vgktbk6o/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks/webpi/branch/master) [![Cookbook Version](https://img.shields.io/cookbook/v/webpi.svg)](https://supermarket.chef.io/cookbooks/webpi)

Microsoft Web Platform Installer (WebPI) automates the installation of Microsoft's entire Web Platform. This cookbook makes it easy to get WebpiCmdLine.exe the lightweight CLI version of WebPI onto a Windows node. It also exposes a resource for installing WebPI products idempotently.

## Requirements

### Platforms

- Windows 7
- Windows Server 2008 R2
- Windows 8, 8.1
- Windows Server 2012 (R1, R2)

### Chef

- Chef 12.6+

### Cookbooks

- windows 2.0+

## Attributes

- `node['webpi']['home']` - location to install WebPI files to. Default is `%SYSTEMDRIVE%\webpi`
- `node['webpi']['url']` - Path to download webpi zip.
- `node['webpi']['xmlpath']` - Optional path to custom xml file.
- `node['webpi']['install_method']` - Method of installing webpi via msi or zip. Default is msi.
- `node['webpi']['msi']` - Location of msi file to use.
- `node['webpi']['msi_package_name']` - Windows package name, found in registry, for msi. Defaults to "Microsoft Web Platform Installer 4.5"

## Resources

### webpi_product

#### Actions

- :install: install a product using WebpiCmdLine

#### Properties

- product_id: name property. Specifies the ID of a product to install.
- accept_eula: specifies that WebpiCmdline should auto-accept EULAs. Default is false.
- returns: specifies the return value(s) expected for a successful installation. Can be a single integer or array of integers. Default is [0, 42]

#### Examples

Install IIS 7 Recommended Configuration (will install IIS 8 on Windows 2012 despite the name)

```ruby
webpi_product 'IIS7' do
  accept_eula true
  action :install
end
```

Install Windows PowerShell 2.0

```ruby
webpi_product 'PowerShell2' do
  accept_eula true
  action :install
end
```

Install Windows Azure Powershell 1.0 (will return a 3010 exit code to signify a successful installation that requires a reboot)

```ruby
webpi_product 'WindowsAzurePowerShellGet' do
  accept_eula true
  action :install
  returns 3010
end
```


### webpi_application

#### Actions

- :install: install an application using WebpiCmdLine

#### Properties

- app_id: name property. Specifies the ID of an application to install.
- accept_eula: specifies that WebpiCmdline should auto-accept EULAs. Default is false.
- suppress_reboot: specifies if we need to stop or suppress the reboot. Default is True.
- iis_express: used only with applications that intergrate with IIS. Default value is False.
- mysql_password: Used to give a mysql password for application which requires it.
- sql_password: Used to give a sql password for application which requires it.
- other_options: Any other options related to applications needed to be appended. Default value is empty string.
- returns: specifies the return value(s) expected for a successful installation. Can be a single integer or array of integers. Default is [0, 42]

#### Examples
Installing WebMatrix while Accepting the EULA and also install app to IISExpress
Ex: >WebPICMD.exe /Install /Products:WebMatrix /AcceptEula /IISExpress

```ruby
webpi_application 'WebMatrix' do
  accept_eula true
  iis_express true
  action  :install
end
```

Installing an application to MicrosoftAzure ServiceFabric CoreSDK
Ex: >WebPICMD.exe /Install /Applications:MicrosoftAzure-ServiceFabric-CoreSDK /AcceptEula 

```ruby
webpi_application 'MicrosoftAzure-ServiceFabric-CoreSDK' do
  accept_eula true
  action :install
end
```


```ruby
password = data_bag_item('secrets','mysqlpassword')['password'] # Should be a encrypted data bag
webpi_application 'AcquiaDrupal' do
  accept_eula    true
  mysql_password password # To be set from encrypted databag
  action         :install
end
```

## Usage

### default

Downloads and unzips `WebpiCmdLine.exe` to the location specified by `node['webpi']['home']`. `WebpiCmdLine.exe` is used required by the `webpi_product` LWRP for taking all actions.

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2011-2019, Chef Software, Inc.

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
