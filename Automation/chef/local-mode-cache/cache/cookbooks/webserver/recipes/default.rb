#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'iis::default'

powershell_script 'Install IIS' do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Web-Server
  EOH
  guard_interpreter :powershell_script
  not_if "Import-Module ServerManager; (Get-WindowsFeature -Name Web-Server).Installed"
end

powershell_script 'Install IIS Features' do
  code <<-EOH
  Add-WindowsFeature Web-App-Dev
  Add-WindowsFeature Web-ISAPI-Ext
  Add-WindowsFeature Web-ISAPI-Filter
  Add-WindowsFeature Web-Net-Ext45
  Add-WindowsFeature Web-Asp-Net45  
  EOH
end

powershell_script 'Install .net framework' do
    code <<-EOH
    Install-WindowsFeature -name NET-Framework-Core
    EOH
end

service 'w3svc' do
     action [ :enable, :start ]
end

iis_site 'Default Web Site' do
  action [:stop, :delete]
end

iis_pool 'DefaultAppPool' do
  action :delete
end

iis_pool 'ConnectorTestPool' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'ConnectorTest Site' do
  protocol :http
  port 80
  path "#{node['iis']['docroot']}"
  application_pool 'ConnectorTestPool'
  action [:add,:start]
end
