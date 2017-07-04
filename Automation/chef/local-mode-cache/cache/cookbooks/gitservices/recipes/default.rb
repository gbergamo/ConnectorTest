#
# Cookbook Name:: gitservices
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git::default'

git 'c:/ConnectorTest' do
  repository 'git://github.com/gbergamo/ConnectorTest.git'
  revision 'master'
  action :sync
end

powershell_script 'installing .net framework 4.5' do
  code "C:/ConnectorTest/framework_install.ps1"
end

powershell_script 'run remote script' do
  code "C:/ConnectorTest/build.ps1"
end


