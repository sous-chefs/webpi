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
