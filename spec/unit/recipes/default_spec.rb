require 'spec_helper'

describe 'default recipe on Windows 2008 R2' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2008R2').converge('webpi::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on Windows 2012' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012').converge('webpi::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on Windows 2012 R2' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2').converge('webpi::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
