# webpi Cookbook CHANGELOG

This file is used to list changes made in each version of the webpi cookbook.

## Unreleased

## 5.0.4 - *2025-09-04*

## 5.0.3 - *2024-05-03*

## 5.0.2 - *2024-05-03*

## 5.0.1 - *2024-05-01*

## 5.0.0 - *2023-10-03*

- Use archive_file rather than windows_zipfile ofr extracting the webpi zip file
- Turn on unified mode

## 4.3.0 - *2023-10-03*

- Standardise files with files in sous-chefs/repo-management

## 4.2.3 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 4.2.2 - *2021-06-01*

- resolved cookstyle error: recipes/install-msi.rb:29:21 warning: `Lint/SendWithMixinArgument`

## 4.2.1 (2017-05-30)

- Use action_class instead of action_class.class_eval

## 4.2.0 (2017-04-05)

- Convert the install LWRP to a custom resource
- Added testing of the resource in appveyer

## 4.1.1 (2017-03-29)

- Resolve incompatibility with windows 3.0 cookbook

## 4.1.0 (2017-03-20)

- Test with Local Delivery instead of Rake
- Require windows 2.0 or later

## 4.0.0 (2017-02-18)

- Use package vs. windows_package resource which increases the requirement to Chef 12.6+

## 3.1.0 (2016-12-27)

- add returns argument to webpi_product resource
- Update the minimum chef requirement to 12.1 from 12.0

## 3.0.0 (2016-09-06)

- Remove support for Chef 11

## 2.1.0 (2016-09-01)

- Resolve rubocop warnings
- Add use_inline_resources to the provider
- Add chef_version metadata
- Testing updates

## v2.0.0 (2016-01-04)

- Install WebPI 5.0 by default
- Fix runs on Chef 11 systems

## v1.2.9 (2015-12-30)

### Improvement

- Modernization of cookbook supporting travis ci, kitchen convergence testing, style checking and foodcritic rule compliance
- Removed unnecessary includes of the default recipe in the windows cookbook to eliminate warnings

## v1.2.8 (2014-02-14)

### Bug

- install-msi recipe should leverage chef cache

## v1.2.6

- [COOK-3372] - unzip webpi if webpi executable doesn't exist

## v1.2.4

### Improvement

- Upgrade WebPI (4.5 no longer exists)

## v1.2.2

### Improvement

- [COOK-2719]: update webpi documentation to show that Windows 2012
- and Windows 8 are supported

## v1.2.0

- [COOK-2298] - webpi will not install anything due to logic bug
- [COOK-1270] - webpi creates logs with timestamps in the name
- cluttering c:\
- [COOK-2438] - WebPI should use an attribute for MSI package name
- [COOK-2452] - WebPI should check comma separated string of
- components to determine which to install if any

## v1.1.0

- [COOK-1251] - Fix LWRP "NotImplementedError"
- [COOK-1726, COOK-1760] - Upgrade to webpi version 4

## v1.0.4

- Created the ability to use the XML parameter for custom xml files.

## v1.0.2

- Ruby 1.9 compat fixes
- don't unzip if files already exist

## v1.0.0

- initial release
