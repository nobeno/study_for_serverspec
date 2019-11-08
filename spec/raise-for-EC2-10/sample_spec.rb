require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'amazon' do
  it "nginxインストールされていること" do
    expect be_installed
  end
  it "nginxが起動していること" do
    expect be_running
  end
end

describe package('unicorn'), :if => os[:family] == 'amazon' do
  it "Unicornインストールされていること" do
    expect be_installed
  end
  it "Unicornが起動していること" do
    expect be_running
  end
end

describe package('git'), :if => os[:family] == 'amazon' do
  it "Gitインストールされていること" do
    expect be_installed
  end 
end

describe service('mysql'), :if => os[:family] == 'amazon' do
  it "MySQLインストールされていること" do
    expect be_installed
  end
  it "MySQLが起動していること" do
    expect be_running
  end
end

describe group('nobebe') do
  it "ユーザー：nobebeが存在すること" do
    expect exist
  end
end

describe file('/etc/nginx') do
  it "nobebeがnginxディレクトリに権限を持っていること" do
    expect be_owned_by 'nobebe'
  end
end

describe file('/var/www/rails') do
  it "railsディレクトリが存在すること" do
    expect exist
  end
end

describe file('Gemfile') do
  it "Gemfileにcarrierwaveが書かれていること" do
    expect contain('carrierwave') 
  end
end

describe port(22) do
  it "リスニングされてること" do
     expect be_listening
  end
end
