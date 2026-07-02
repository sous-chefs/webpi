require 'spec_helper'

describe 'default recipe on Windows 2012 R2' do
  platform 'windows', '2012R2'

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on Windows 2016' do
  platform 'windows', '2016'

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'webpi::install-zip' do
  platform 'windows', '2016' do |node|
    node.override['webpi']['install_method'] = 'zip'
  end

  let(:zip_path) { "#{Chef::Config[:file_cache_path]}/WebPICMD.zip" }

  it 'extracts the downloaded WebPI command line archive' do
    expect(chef_run.remote_file(zip_path)).to notify("archive_file[#{zip_path}]").to(:extract).immediately
  end
end
