webpi Cookbook CHANGELOG
=======================
This file is used to list changes made in each version of the webpi cookbook.


v2.0.0 (2015-10-21)
-------------------
- Removed the ability to install WebPI using the Microsoft distributed ZIP file.  Microsoft no longer distributes a .zip file.  If you have the install method set to zip, this cookbook will now fail.
- Updated the requirements section of the readme to make the minimum supported Chef release 11
- Removed Windows XP and Windows 2003 as supported platforms as these are now end of life
- Added Windows 8.1 and 2012 R2 as supported platformsS
- Removed Chef 10 compatibility
- Added gitignore file
- Added chefignore file
- Added Chef standard rubocop config
- Added Travis CI testing
- Added Berksfile
- Added Gemfile with testing deps
- Updated testing and contributing docs
- Added maintainers.md and maintainers.toml files
- Added travis and cookbook version badges to the readme
- Added a Rakefile for simplified testing
- Added source_url and issues_url to the metadata
- Added basic convergence Chefspec
- Resolved Rubocop warnings

v1.2.8 (2014-02-14)
-------------------
### Bug
- **[COOK-3832](https://tickets.chef.io/browse/COOK-3832)** - install-msi recipe should leverage chef cache

v1.2.6
------
- [COOK-3372] - unzip webpi if webpi executable doesn't exist

v1.2.4
------
### Improvement
- **[COOK-3474](https://tickets.chef.io/browse/COOK-3474)** - Upgrade WebPI (4.5 no longer exists)

v1.2.2
------
### Improvement
- [COOK-2719]: update webpi documentation to show that Windows 2012
  and Windows 8 are supported

v1.2.0
------
* [COOK-2298] - webpi will not install anything due to logic bug
* [COOK-1270] - webpi creates logs with timestamps in the name
  cluttering c:\
* [COOK-2438] - WebPI should use an attribute for MSI package name
* [COOK-2452] - WebPI should check comma separated string of
  components to determine which to install if any

v1.1.0
------
* [COOK-1251] - Fix LWRP "NotImplementedError"
* [COOK-1726, COOK-1760] - Upgrade to webpi version 4

v1.0.4
------
* Created the ability to use the XML parameter for custom xml files.

v1.0.2
------
* Ruby 1.9 compat fixes
* don't unzip if files already exist

v1.0.0
------
* initial release
